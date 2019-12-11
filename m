Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A77511AFB0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 16:15:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y0qR48QzzDqf2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 02:15:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="kK2N/LTx"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y0lR5trwzDqKv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 02:12:03 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E30CC2467F;
 Wed, 11 Dec 2019 15:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576077121;
 bh=rjnKi9c9bSp4W5HmEkgKIOW16NgRTdaQnTGDcA+RRW4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kK2N/LTxjaBNjmMbOrWFKp44u7rlRa1B7OHk3hbnKHhuCbOKO+h9IoqLAtNid1oNG
 j13bJ29wpAyEuxYW2eGjSZq91dnYnMzor2+zL8tDHi+WXj5pcuQ/5aDbJhgdc3MthO
 V51wEEuiWa/iif2n5hsSPAAVDTcUTObdHIwszfBE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 010/134] powerpc/papr_scm: Fix an off-by-one check
 in papr_scm_meta_{get, set}
Date: Wed, 11 Dec 2019 10:09:46 -0500
Message-Id: <20191211151150.19073-10-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211151150.19073-1-sashal@kernel.org>
References: <20191211151150.19073-1-sashal@kernel.org>
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
 linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Vaibhav Jain <vaibhav@linux.ibm.com>

[ Upstream commit 612ee81b9461475b5a5612c2e8d71559dd3c7920 ]

A validation check to prevent out of bounds read/write inside
functions papr_scm_meta_{get,set}() is off-by-one that prevent reads
and writes to the last byte of the label area.

This bug manifests as a failure to probe a dimm when libnvdimm is
unable to read the entire config-area as advertised by
ND_CMD_GET_CONFIG_SIZE. This usually happens when there are large
number of namespaces created in the region backed by the dimm and the
label-index spans max possible config-area. An error of the form below
usually reported in the kernel logs:

[  255.293912] nvdimm: probe of nmem0 failed with error -22

The patch fixes these validation checks there by letting libnvdimm
access the entire config-area.

Fixes: 53e80bd042773('powerpc/nvdimm: Add support for multibyte read/write for metadata')
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20190927062002.3169-1-vaibhav@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 61883291defc3..ee07d0718bf1a 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -152,7 +152,7 @@ static int papr_scm_meta_get(struct papr_scm_priv *p,
 	int len, read;
 	int64_t ret;
 
-	if ((hdr->in_offset + hdr->in_length) >= p->metadata_size)
+	if ((hdr->in_offset + hdr->in_length) > p->metadata_size)
 		return -EINVAL;
 
 	for (len = hdr->in_length; len; len -= read) {
@@ -206,7 +206,7 @@ static int papr_scm_meta_set(struct papr_scm_priv *p,
 	__be64 data_be;
 	int64_t ret;
 
-	if ((hdr->in_offset + hdr->in_length) >= p->metadata_size)
+	if ((hdr->in_offset + hdr->in_length) > p->metadata_size)
 		return -EINVAL;
 
 	for (len = hdr->in_length; len; len -= wrote) {
-- 
2.20.1

