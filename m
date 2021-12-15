Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD50476BCB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:22:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4pd759Dz3fRL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:22:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TEfn9/Yi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TEfn9/Yi; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDgKJ5JNxz2yJV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 03:13:40 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id g28so20476049qkk.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 08:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QG+CwIEwqb383GOHr+6PHBSfc5gSLbspx0Elb1Emhdk=;
 b=TEfn9/YidbHQsZ2/YV6nKwRZ7kktr5+QOI2Py4Pa7Szw+1LzgiiZKb6EU4XBesSYim
 A5C7s75v8ZLch5n8gFXjh0hPK+j6PisR5/S3IZdzrFDdHzpUH7LaaVEp4yagHXKVTJf2
 9PiY/0n/7rqNQZT0tY3LtKGPmrnIp6ezgQXehkCUFRb+bRl3jWdQukfP45PsSO1EwsSy
 YFEPtVIKNHXJCy6k/nzhv7bFi2z5XF9aVc5O1Jv6UcqqXHWjWnUekSVDzCoyEFDCCiIU
 UCJsWYQjUk/f1ggfqLBVpnjtnTn+u9bDh97RjorBvtDXHgbp5/ZUxSbYn3zd+ojXsmeR
 UdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QG+CwIEwqb383GOHr+6PHBSfc5gSLbspx0Elb1Emhdk=;
 b=G73fa3Wk+0RKx5cc+5sV32J8OzsVDX/jpx9QvIbUo/L+7dy73MYl6tJA+qkIAHNFZv
 /df+NJXUiRBjYHC3X1eSYLT95AFZR4A+R9HWZ2W0dfs0tubPquggD6qLPBMgr40sl9gA
 TtqkZc29u/6sV252v37yaK0c3aCYLbGOmkwQ4O7mrt9A3/+kIT4Zwe44yskKGTiVuIDy
 hA8infgeAHknXHuV+AvpeUD6N0do5INuKI8oCbbcoLRZ9gnL13Nqbw5Dl4XknRit9EzY
 Ci8k8qehgJ4AGm/eOYqYlg0nRzhlBuUUxQJWPo8Xq0ZfiVuS6b+TZDvfWSNkZhN/QbTT
 yJkQ==
X-Gm-Message-State: AOAM531F9fMNRFvFJDkOwk0sOHtGKCAnb19bKsr0fa0imXawafdrJvGh
 ybezyzufeTRFgbN4uwGpGd4YW96dGtA=
X-Google-Smtp-Source: ABdhPJwdTScw976o2+VfNhz1xjnYQQuDTLtM4UVkm86MplCaBkiqG32Gpv1d3E3O1o/2fT4KKzf8jg==
X-Received: by 2002:a05:620a:2894:: with SMTP id
 j20mr9271243qkp.307.1639584818156; 
 Wed, 15 Dec 2021 08:13:38 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:73:d0b0:acf1:e2d0])
 by smtp.gmail.com with ESMTPSA id t11sm1276436qkp.56.2021.12.15.08.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:13:37 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 18/20] powerpc/85xx: Add __init attribute to eligible functions
Date: Wed, 15 Dec 2021 11:12:41 -0500
Message-Id: <20211215161243.16396-19-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215161243.16396-1-nick.child@ibm.com>
References: <20211215161243.16396-1-nick.child@ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Dec 2021 19:09:28 +1100
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some functions defined in 'arch/powerpc/platforms/85xx' are deserving of an
`__init` macro attribute. These functions are only called by other
initialization functions and therefore should inherit the attribute.
Also, change function declarations in header files to include `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/platforms/85xx/ge_imp3a.c          | 2 +-
 arch/powerpc/platforms/85xx/mpc85xx_cds.c       | 2 +-
 arch/powerpc/platforms/85xx/socrates_fpga_pic.c | 2 +-
 arch/powerpc/platforms/85xx/socrates_fpga_pic.h | 2 +-
 arch/powerpc/platforms/85xx/xes_mpc85xx.c       | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/ge_imp3a.c b/arch/powerpc/platforms/85xx/ge_imp3a.c
index 83a0f7a1f0de..743c65e4d8e4 100644
--- a/arch/powerpc/platforms/85xx/ge_imp3a.c
+++ b/arch/powerpc/platforms/85xx/ge_imp3a.c
@@ -78,7 +78,7 @@ void __init ge_imp3a_pic_init(void)
 	of_node_put(cascade_node);
 }
 
-static void ge_imp3a_pci_assign_primary(void)
+static void __init ge_imp3a_pci_assign_primary(void)
 {
 #ifdef CONFIG_PCI
 	struct device_node *np;
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_cds.c b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
index 172d2b7cfeb7..5bd487030256 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_cds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
@@ -282,7 +282,7 @@ machine_device_initcall(mpc85xx_cds, mpc85xx_cds_8259_attach);
 
 #endif /* CONFIG_PPC_I8259 */
 
-static void mpc85xx_cds_pci_assign_primary(void)
+static void __init mpc85xx_cds_pci_assign_primary(void)
 {
 #ifdef CONFIG_PCI
 	struct device_node *np;
diff --git a/arch/powerpc/platforms/85xx/socrates_fpga_pic.c b/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
index 199a137c0ddb..3768c86b9629 100644
--- a/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
+++ b/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
@@ -271,7 +271,7 @@ static const struct irq_domain_ops socrates_fpga_pic_host_ops = {
 	.xlate  = socrates_fpga_pic_host_xlate,
 };
 
-void socrates_fpga_pic_init(struct device_node *pic)
+void __init socrates_fpga_pic_init(struct device_node *pic)
 {
 	unsigned long flags;
 	int i;
diff --git a/arch/powerpc/platforms/85xx/socrates_fpga_pic.h b/arch/powerpc/platforms/85xx/socrates_fpga_pic.h
index c592b8bc94dd..1d27169309c4 100644
--- a/arch/powerpc/platforms/85xx/socrates_fpga_pic.h
+++ b/arch/powerpc/platforms/85xx/socrates_fpga_pic.h
@@ -6,6 +6,6 @@
 #ifndef SOCRATES_FPGA_PIC_H
 #define SOCRATES_FPGA_PIC_H
 
-void socrates_fpga_pic_init(struct device_node *pic);
+void socrates_fpga_pic_init(struct device_node *pic) __init;
 
 #endif
diff --git a/arch/powerpc/platforms/85xx/xes_mpc85xx.c b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
index d54e1ae56997..397e158c1edb 100644
--- a/arch/powerpc/platforms/85xx/xes_mpc85xx.c
+++ b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
@@ -45,7 +45,7 @@ void __init xes_mpc85xx_pic_init(void)
 	mpic_init(mpic);
 }
 
-static void xes_mpc85xx_configure_l2(void __iomem *l2_base)
+static void __init xes_mpc85xx_configure_l2(void __iomem *l2_base)
 {
 	volatile uint32_t ctl, tmp;
 
@@ -72,7 +72,7 @@ static void xes_mpc85xx_configure_l2(void __iomem *l2_base)
 	asm volatile("msync; isync");
 }
 
-static void xes_mpc85xx_fixups(void)
+static void __init xes_mpc85xx_fixups(void)
 {
 	struct device_node *np;
 	int err;
-- 
2.25.1

