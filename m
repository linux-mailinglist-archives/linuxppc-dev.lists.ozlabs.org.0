Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD6215EB4F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 18:20:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K0WJ2spLzDqFp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 04:20:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=r2jFasTf; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Jyq80mmvzDqYd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 03:03:47 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 19F8F24680;
 Fri, 14 Feb 2020 16:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696225;
 bh=a0X2ipw2Qqu/ELDpCnV/gIW9G1Svhjbq8TCP+jArWgI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r2jFasTf1e2yhO7O/P8sTi20E4RJv1/JcSxeDb5SH2Z+HeUdLVDibVxm3HdyJfHUT
 BjV4q7Qn81d+SaEZXjc2Q9WH1aAYqLS43ToekzFyoXquFDDoyWsmtrxPaETyuozFHH
 qHK7Akt9Yq8cjW8zjQvOAxXrXObuxPMZ8p6/tCag=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 088/459] powerpc/papr_scm: Fix leaking
 'bus_desc.provider_name' in some paths
Date: Fri, 14 Feb 2020 10:55:38 -0500
Message-Id: <20200214160149.11681-88-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
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
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Vaibhav Jain <vaibhav@linux.ibm.com>

[ Upstream commit 5649607a8d0b0e019a4db14aab3de1e16c3a2b4f ]

String 'bus_desc.provider_name' allocated inside
papr_scm_nvdimm_init() will leaks in case call to
nvdimm_bus_register() fails or when papr_scm_remove() is called.

This minor patch ensures that 'bus_desc.provider_name' is freed in
error path for nvdimm_bus_register() as well as in papr_scm_remove().

Fixes: b5beae5e224f ("powerpc/pseries: Add driver for PAPR SCM regions")
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20200122155140.120429-1-vaibhav@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index ee07d0718bf1a..66fd517c48164 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -342,6 +342,7 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	p->bus = nvdimm_bus_register(NULL, &p->bus_desc);
 	if (!p->bus) {
 		dev_err(dev, "Error creating nvdimm bus %pOF\n", p->dn);
+		kfree(p->bus_desc.provider_name);
 		return -ENXIO;
 	}
 
@@ -498,6 +499,7 @@ static int papr_scm_remove(struct platform_device *pdev)
 
 	nvdimm_bus_unregister(p->bus);
 	drc_pmem_unbind(p);
+	kfree(p->bus_desc.provider_name);
 	kfree(p);
 
 	return 0;
-- 
2.20.1

