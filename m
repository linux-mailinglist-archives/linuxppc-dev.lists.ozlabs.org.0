Return-Path: <linuxppc-dev+bounces-4139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E16EC9F2922
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 05:08:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBRHb14nFz2ymg;
	Mon, 16 Dec 2024 15:07:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734322075;
	cv=none; b=ieAi7zzApLWEXsYhic/yhHs/TcrcSk5aX+Ait5byj9+W/bsFJcnS775WU9OMHYwqVCL/wkqmYPdAn4pggIGE7DiA3y0jtO8Nnl1CZLMvj4tdTsjM+3sqyBMn7t8VUGCLAtpgc4UE20FlSG+2H5H+gv00bW++FPbD43mdgeTWdHu/Ig7d7hsmMlNZVJ3Ztc4mNEiJhBSHWo6oVw9UJPlQKmyZl+glnbv0QhkCQibNOylgL/FwDoCuEA4IuNCVVR0rPY8A/Ocozit694Skr6eiCINBuc24XmtBRtW9yt8SxVJ7ylPtqHsWopAQN+j3vRCfK+dFw1JNa7DkCgtqm1ZPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734322075; c=relaxed/relaxed;
	bh=X9eTN9Kw2zYhSgXRwchVdennrThCCIUpGiU9nCXBpmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MgrxmnnZWX19mSiXxbZ5oC4km+J9gsyE82S2x/dhKO4GDoeDkzShrn6JmuXf6eoLz6ZqnFRjpe0n4XdeYt2bQjFmgGaEBBYui/vokFnNP98mxpfuug+SQJFKwIlHdOTPqYsuVmuFF0BQ40GiLfGVPKoHhpowfG7qycnyxpz271s9ag8K4cCCkIaGYEotHeEWgmV6Qx+5f6x8o75mu2XenCNqFw8VF/yIRn+OsuJd8bCHmBkgxK6lyGsjGQqfTF9370VXBOS58xGU/01SO4/FOzlOUtWi6jKHyXJj8K7VsjFtO08eGKKFgh3YOD9OsFiTF+Ribe65EBniWPFKDbK9YA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=BadyMFb6; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=BadyMFb6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBRHZ3Lmlz2ykT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 15:07:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734322066;
	bh=kSKaIzakyLMOLTGavl1YigRi/jhUzDBr+KHmuegXLT0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BadyMFb61RzPUtsPOslUvj2r9ugXcqC+cwewH7uzQHDSTD4ypCnzfheaLXoLct+XU
	 3a37PgP5LYlGYqX1Mw+ZU52qb2ow3Z1aB47tmlmDcplSGHIhppUK6lM7W+HMdWKMuW
	 dDOYQrmdm5wKKVXVoAMjb6BSRgZNFMbPVAvKlgT4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Dec 2024 05:07:47 +0100
Subject: [PATCH 5/5] powerpc/perf/hv-24x7: Constify 'struct bin_attribute'
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-sysfs-const-bin_attr-powerpc-v1-5-bbed8906f476@weissschuh.net>
References: <20241216-sysfs-const-bin_attr-powerpc-v1-0-bbed8906f476@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-powerpc-v1-0-bbed8906f476@weissschuh.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734322065; l=1832;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=kSKaIzakyLMOLTGavl1YigRi/jhUzDBr+KHmuegXLT0=;
 b=nxzBc5603KmXdcAfj1ul0CWTZ3mnR0agqe30xCjxbiQhQeU50/tSIF00ai6WtgSME2KlEmf4V
 y4S8KHR5rTBDpW291Kll/z1PKPHWSHp+5aDhibQSkoSY20ZK4n2g9ox
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/powerpc/perf/hv-24x7.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index d400fa391c2765cf201ee4dc754007e655cc74ca..b0768f3d289300826dcd454a8e397a943572fd45 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -998,7 +998,7 @@ static int create_events_from_catalog(struct attribute ***events_,
 }
 
 static ssize_t catalog_read(struct file *filp, struct kobject *kobj,
-			    struct bin_attribute *bin_attr, char *buf,
+			    const struct bin_attribute *bin_attr, char *buf,
 			    loff_t offset, size_t count)
 {
 	long hret;
@@ -1108,14 +1108,14 @@ PAGE_0_ATTR(catalog_version, "%lld\n",
 		(unsigned long long)be64_to_cpu(page_0->version));
 PAGE_0_ATTR(catalog_len, "%lld\n",
 		(unsigned long long)be32_to_cpu(page_0->length) * 4096);
-static BIN_ATTR_RO(catalog, 0/* real length varies */);
+static const BIN_ATTR_RO(catalog, 0/* real length varies */);
 static DEVICE_ATTR_RO(domains);
 static DEVICE_ATTR_RO(sockets);
 static DEVICE_ATTR_RO(chipspersocket);
 static DEVICE_ATTR_RO(coresperchip);
 static DEVICE_ATTR_RO(cpumask);
 
-static struct bin_attribute *if_bin_attrs[] = {
+static const struct bin_attribute *const if_bin_attrs[] = {
 	&bin_attr_catalog,
 	NULL,
 };
@@ -1141,7 +1141,7 @@ static struct attribute *if_attrs[] = {
 
 static const struct attribute_group if_group = {
 	.name = "interface",
-	.bin_attrs = if_bin_attrs,
+	.bin_attrs_new = if_bin_attrs,
 	.attrs = if_attrs,
 };
 

-- 
2.47.1


