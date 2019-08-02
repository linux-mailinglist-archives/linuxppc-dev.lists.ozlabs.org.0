Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1AF7FA68
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 15:33:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460Sm20vMQzDr2w
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 23:33:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="0kF+BRTJ"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460STn0wgCzDqD0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 23:20:59 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B56B021849;
 Fri,  2 Aug 2019 13:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564752057;
 bh=T2iFgkP0UDzAXbiI2k0wz3wf1VnOxEi+QvaaMJHeMfY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0kF+BRTJZKkb5JLOblpAsbxxZg0n8Zvuc4nU16qfG0+LLsDH7jrEuIz9etLt/N86b
 qRuWi0dmy095lQ8E112Dyg2G5ZHgaIs3tTy3KwUw5pHqoifdLGHsOFrKCMQgNUqM2Q
 pKsb99G+cMJdFfUksXwsi9CHQikSKMsfOdOymcvM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 37/76] powerpc/papr_scm: Force a scm-unbind if
 initial scm-bind fails
Date: Fri,  2 Aug 2019 09:19:11 -0400
Message-Id: <20190802131951.11600-37-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802131951.11600-1-sashal@kernel.org>
References: <20190802131951.11600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Vaibhav Jain <vaibhav@linux.ibm.com>

[ Upstream commit 3a855b7ac7d5021674aa3e1cc9d3bfd6b604e9c0 ]

In some cases initial bind of scm memory for an lpar can fail if
previously it wasn't released using a scm-unbind hcall. This situation
can arise due to panic of the previous kernel or forced lpar
fadump. In such cases the H_SCM_BIND_MEM return a H_OVERLAP error.

To mitigate such cases the patch updates papr_scm_probe() to force a
call to drc_pmem_unbind() in case the initial bind of scm memory fails
with EBUSY error. In case scm-bind operation again fails after the
forced scm-unbind then we follow the existing error path. We also
update drc_pmem_bind() to handle the H_OVERLAP error returned by phyp
and indicate it as a EBUSY error back to the caller.

Suggested-by: "Oliver O'Halloran" <oohall@gmail.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20190629160610.23402-4-vaibhav@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 96c53b23e58f9..dad9825e40874 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -42,8 +42,9 @@ struct papr_scm_priv {
 static int drc_pmem_bind(struct papr_scm_priv *p)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
-	uint64_t rc, token;
 	uint64_t saved = 0;
+	uint64_t token;
+	int64_t rc;
 
 	/*
 	 * When the hypervisor cannot map all the requested memory in a single
@@ -63,6 +64,10 @@ static int drc_pmem_bind(struct papr_scm_priv *p)
 	} while (rc == H_BUSY);
 
 	if (rc) {
+		/* H_OVERLAP needs a separate error path */
+		if (rc == H_OVERLAP)
+			return -EBUSY;
+
 		dev_err(&p->pdev->dev, "bind err: %lld\n", rc);
 		return -ENXIO;
 	}
@@ -316,6 +321,14 @@ static int papr_scm_probe(struct platform_device *pdev)
 
 	/* request the hypervisor to bind this region to somewhere in memory */
 	rc = drc_pmem_bind(p);
+
+	/* If phyp says drc memory still bound then force unbound and retry */
+	if (rc == -EBUSY) {
+		dev_warn(&pdev->dev, "Retrying bind after unbinding\n");
+		drc_pmem_unbind(p);
+		rc = drc_pmem_bind(p);
+	}
+
 	if (rc)
 		goto err;
 
-- 
2.20.1

