Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE3276A0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 09:06:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxmLK1wbMzDqN5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 17:06:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qscSdzyR; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxlkg1HbYzDqZ9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 16:39:07 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id d13so1299152pgl.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 23:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WePGWSemMFXgajsFMe7cKUHtaA9xMjkK6ByOLy1nU4Q=;
 b=qscSdzyRGcajP6h156Sb/xn8QcBA8Y68v8YN5uv3pBVB0nhSvyKMto1hNwyBhR0rHb
 eQPfhAa55ja945Qvfs/msdfK+Li85IThlWjsrKHSQSi1hrI+6+ZY1sOv/oGMxtVv5BDk
 VGDWmnfGK76cYSILgGg7ty3R4YjU8pIMS4YKPhGKEfiF3cRDcSdFYOLgW7aVJTW4Wkgl
 0u9EvlXVD9fQWyOAABdcful0+RPtpHeVUjaLt2uSwfErx2ki+zMU8CrzaOvwuXWbPGZA
 g04BZS0uXEK6GeseIcMWoRECXqx07wDvXPDI1IAcjGWVwTU7VOmcGWRXSQiPmwkg952R
 KqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WePGWSemMFXgajsFMe7cKUHtaA9xMjkK6ByOLy1nU4Q=;
 b=kcHGuicv7hBjoxNlxqTaghPfFN8mMNCm2XmXyRYurNVNS2pyNePNuFGYE/o5QPi+75
 3JbbwTEd5OLo2eS8k5BJrcaq+OH8R/AfTpsCOyGWc9YcILPfcUf3mEjVkWUbH1Hw8x54
 PkHBk41zIkBIwqID/PBRwDZ2BW/HHS7cDY+9dmgRMoYnJ+8kRo8KILjvuy0HM5Z449iY
 cJX/yxmkLTvrHPCgiuiTTltu94tpLWZ4TLecfYy8zEdAYg2Pninu80HPvrj6PmVFFfrL
 5ogS+Ip8wpv6sEEOpb2OtH7RkNUzVICiA5KxE/ZjU37Bj+9QyVcbEcQ+M/EmZKv/91dg
 lN9Q==
X-Gm-Message-State: AOAM5328u3ORdOUfc8e8j4HLe3JmdYu2pEQOuG2rfu41zxCGmxby2Mm9
 vm5mn1VmZZWTv2otaXPkxqR8vt1RQ+TiaQ==
X-Google-Smtp-Source: ABdhPJwNmjQd9Ota9qu7tHoLec70rx3Ep5TCFZynpHfeuvCqHbt3sQHcd321Uob0nk0ltqvLlGR0Jw==
X-Received: by 2002:a63:5566:: with SMTP id f38mr2916449pgm.9.1600929541206;
 Wed, 23 Sep 2020 23:39:01 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id y1sm1662930pgr.3.2020.09.23.23.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 23:39:00 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 13/18] powerpc/embedded6xx/holly: Move PHB discovery
Date: Thu, 24 Sep 2020 16:38:14 +1000
Message-Id: <20200924063819.262830-13-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924063819.262830-1-oohall@gmail.com>
References: <20200924063819.262830-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
compile tested with holly_defconfig
---
 arch/powerpc/platforms/embedded6xx/holly.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/holly.c b/arch/powerpc/platforms/embedded6xx/holly.c
index d8f2e2c737bb..53065d564161 100644
--- a/arch/powerpc/platforms/embedded6xx/holly.c
+++ b/arch/powerpc/platforms/embedded6xx/holly.c
@@ -108,15 +108,13 @@ static void holly_remap_bridge(void)
 	tsi108_write_reg(TSI108_PCI_P2O_BAR2, 0x0);
 }
 
-static void __init holly_setup_arch(void)
+static void __init holly_init_pci(void)
 {
 	struct device_node *np;
 
 	if (ppc_md.progress)
 		ppc_md.progress("holly_setup_arch():set_bridge", 0);
 
-	tsi108_csr_vir_base = get_vir_csrbase();
-
 	/* setup PCI host bridge */
 	holly_remap_bridge();
 
@@ -127,6 +125,11 @@ static void __init holly_setup_arch(void)
 	ppc_md.pci_exclude_device = holly_exclude_device;
 	if (ppc_md.progress)
 		ppc_md.progress("tsi108: resources set", 0x100);
+}
+
+static void __init holly_setup_arch(void)
+{
+	tsi108_csr_vir_base = get_vir_csrbase();
 
 	printk(KERN_INFO "PPC750GX/CL Platform\n");
 }
@@ -259,6 +262,7 @@ define_machine(holly){
 	.name                   	= "PPC750 GX/CL TSI",
 	.probe                  	= holly_probe,
 	.setup_arch             	= holly_setup_arch,
+	.discover_phbs			= holly_init_pci,
 	.init_IRQ               	= holly_init_IRQ,
 	.show_cpuinfo           	= holly_show_cpuinfo,
 	.get_irq                	= mpic_get_irq,
-- 
2.26.2

