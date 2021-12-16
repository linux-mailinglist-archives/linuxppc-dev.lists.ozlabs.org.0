Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D8C477FED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:13:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFRFn03jyz3fYK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:13:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KH2k5tuV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KH2k5tuV; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzm0dr4z3cHN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:01:08 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id t83so334282qke.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D9wALLCloq0RHWiNf/fIpdc1BcAjdrqK8SS5XmawEN4=;
 b=KH2k5tuVXi2KGJ90VmOwVfs2mwpJJSpAGrNwO9nAVfjU/h3zx5grwPNg/L2fgEH632
 v6Dyed844g38qVO0S2CABVKS2V0LzcYwYiBCUwqpY9Y5SktFMpKiU9huMjUFx1Bj4MGy
 O++Yo+O5rH3ss3s0r7MufvHVif2Uz2bMHBF9QeaR9mK4McBsP445Kj9P6Qvh7naThf0e
 wasckowaRP7L9kpq5d1mrh8ZJUfqKKj42bIVwDiqEUtEvS3KPm1pgC6lHbACOnmNLOzF
 BrL0bBahxz+95WAFIhAoBx3NuXpF32YunStt3j5gzbr5AB+YQnYxA1u0a2AOqL2f0Ep4
 S9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D9wALLCloq0RHWiNf/fIpdc1BcAjdrqK8SS5XmawEN4=;
 b=h6uHy10NBlHAt76dClKAtux72QvNzfRcaTetA26+tFghPAZ2RxOFLfGpm1HTNpAcgs
 jGAxKUlS7Md1FQeXeWo4+XSuANPmXsiEDudFK+Mqkbv5shZ3aSfSjf5unfPoUv5CwL0K
 lZBXzIta4negX/NpXVm4OfSd+yP216zBWU6TjJjSCtjlMsFmLsgOOfMR47qol9TWNoc/
 rrNusxnK4TVeCwcTSHN8eswOajTUqO2zg3IuUsmHYpGaMCeIhKtcQurd74C5kl2KPk6h
 MiMgpLJOX1i2jv3WUCXn5VyLvXOX6LqWK5w3YZ0cZMlYNQnF+BuaUSG4sa3sTz9rgpPx
 F4Dw==
X-Gm-Message-State: AOAM532NHl+5YwzsWnlgmocFa6ERC8AI2U1+aEIlZZJ2e/b6gr9K39lo
 j+t/r5/ncM+lnXhBnLged7U6gAo+xP4=
X-Google-Smtp-Source: ABdhPJxA3skek6XcrKA/tVsEfZlvtRMJ5d58mZ73MEzSfLzGhepm8sm8nVtc4aFMn0ek9TkgtPxTjw==
X-Received: by 2002:a05:620a:424c:: with SMTP id
 w12mr39889qko.563.1639692065627; 
 Thu, 16 Dec 2021 14:01:05 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:01:05 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 18/20] powerpc/85xx: Add __init attribute to eligible
 functions
Date: Thu, 16 Dec 2021 17:00:33 -0500
Message-Id: <20211216220035.605465-19-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216220035.605465-1-nick.child@ibm.com>
References: <20211216220035.605465-1-nick.child@ibm.com>
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
index c592b8bc94dd..c50b23794a06 100644
--- a/arch/powerpc/platforms/85xx/socrates_fpga_pic.h
+++ b/arch/powerpc/platforms/85xx/socrates_fpga_pic.h
@@ -6,6 +6,6 @@
 #ifndef SOCRATES_FPGA_PIC_H
 #define SOCRATES_FPGA_PIC_H
 
-void socrates_fpga_pic_init(struct device_node *pic);
+void __init socrates_fpga_pic_init(struct device_node *pic);
 
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

