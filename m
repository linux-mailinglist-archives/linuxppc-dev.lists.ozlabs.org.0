Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 810D349E812
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 17:52:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl6872f8jz3cR1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 03:52:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=F7yKqrGZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=2a01:4f8:151:8464::1:2;
 helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=F7yKqrGZ; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl62v14wyz3bV8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 03:47:51 +1100 (AEDT)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9276A223F6;
 Thu, 27 Jan 2022 17:41:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643301702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AHaJAinHemm5iRDWpfuIj9kw7+KTQm29ecIVsTXxKjs=;
 b=F7yKqrGZDCDek0hxXpXT3UcQKugR1pGyW00yqOitChlarkF3IgCXxFeQx2dQ/QLW6Aucae
 32PLsWjj7TaXC6KsqDkEaoZmjR9oEnOzYhv1d2Btlcja4halKLqu0x+CIsp7SZen2tz1TE
 i2NyIouSHPer/hRaIDFam021ONxDRqA=
From: Michael Walle <michael@walle.cc>
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/7] soc: fsl: guts: use of_root instead of own reference
Date: Thu, 27 Jan 2022 17:41:23 +0100
Message-Id: <20220127164125.3651285-6-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127164125.3651285-1-michael@walle.cc>
References: <20220127164125.3651285-1-michael@walle.cc>
MIME-Version: 1.0
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Sudeep Holla <Sudeep.Holla@arm.com>,
 Michael Walle <michael@walle.cc>, Arnd Bergmann <arnd@arndb.de>,
 Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is already a global of_root reference. Use that instead of getting
one on our own. We don't need to care about the reference count either
this way.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/soc/fsl/guts.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 383b35a4ed58..04c3eb6a6e17 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -112,7 +112,7 @@ static const struct fsl_soc_die_attr *fsl_soc_die_match(
 
 static int fsl_guts_probe(struct platform_device *pdev)
 {
-	struct device_node *root, *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.of_node;
 	struct soc_device_attribute *soc_dev_attr;
 	static struct soc_device *soc_dev;
 	struct device *dev = &pdev->dev;
@@ -139,17 +139,13 @@ static int fsl_guts_probe(struct platform_device *pdev)
 	iounmap(regs);
 
 	/* Register soc device */
-	root = of_find_node_by_path("/");
-	if (of_property_read_string(root, "model", &machine))
-		of_property_read_string_index(root, "compatible", 0, &machine);
+	if (of_property_read_string(of_root, "model", &machine))
+		of_property_read_string_index(of_root, "compatible", 0, &machine);
 	if (machine) {
 		soc_dev_attr->machine = devm_kstrdup(dev, machine, GFP_KERNEL);
-		if (!soc_dev_attr->machine) {
-			of_node_put(root);
+		if (!soc_dev_attr->machine)
 			return -ENOMEM;
-		}
 	}
-	of_node_put(root);
 
 	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
 	if (soc_die) {
-- 
2.30.2

