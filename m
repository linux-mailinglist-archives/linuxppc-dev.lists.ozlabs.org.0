Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC36D477FEF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:13:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFRGW4T75z3dhy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:13:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fZtKjGWO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fZtKjGWO; dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzn68JGz3cPp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:01:09 +1100 (AEDT)
Received: by mail-qk1-x731.google.com with SMTP id a11so303969qkh.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7utPYFn+4RTnrLSE3/+z0iX0/ZGiHkT6VUemuPydhJ4=;
 b=fZtKjGWOqnUkpM1CDpYfAMPrOcay13UgjC0dK5kNBfpc2KC3+oBGGRx53687aEdOAY
 tsMQE3TvgS+bX+eaTbp8JfZZCsXzuMBzcTMgN8Qi+XAPVozfIAON0zxfYVPdPv76hBYo
 2Znqt2JKQ7827MCpX9azkUeVH0XvBQUb8cuKpwuvOdZBdnh4t2Obt0B744famFNtQ3t6
 URdwE2+IYVVDhgRPoeQMyLuhv/XGgW7jASwFpYeEL9uR+8dSk2TLf8O4uf1O105NgR+Z
 zWSas21KZ0cZotN6q8xXB0ee5N0LkJ4d0U18JuRTHYZtfXHSSQSc/blhfC2o/kEaZQne
 QLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7utPYFn+4RTnrLSE3/+z0iX0/ZGiHkT6VUemuPydhJ4=;
 b=XxN3QCaTfPAL+y9vmZbJQGRa8EWfx/b5bZqk4C62osBoV1i3QLNse71d46NedkSrqr
 P6fZKOqe3Kuj/QMYzSuOppAjaWJF1NPD6EzcNuRjlShWF0NGo9CK6e/FoXVkmPOpVqBU
 E6cN8PO8kOri5PckGLZdgq4jqgELKjRd2wi6XBqx3H2Cv0bn3ntVizA0rQ2INykM9E2S
 AlOjFvXoQEgsY6MnQMJng/JhbCJKvb708sXzwN3BK8hBdk7/QLd53SnaDEVnVEiZ/xZJ
 DAjk0jXxvXrZGqpiMJdjsNcpOeAKoLrAXNn/6Fd3Or5nWrHITGK9sMt7BGz0RYs7oUKo
 SaSQ==
X-Gm-Message-State: AOAM533E4Q4MbWDA7+Xj6PFGucZV2e8iymwJZeziSUVxLrDkgH6ypgEt
 WV9IkVBSugtBV8QVBFlf5xEFBQGczSQ=
X-Google-Smtp-Source: ABdhPJwup3rNorSwSt1xZeLrD+KsjMUYahDZlrTxsA/73EY/9PKj/Z5cJTufUV8gNS5Uy+42vuvU+A==
X-Received: by 2002:a05:620a:2912:: with SMTP id
 m18mr57812qkp.692.1639692066864; 
 Thu, 16 Dec 2021 14:01:06 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:01:06 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 19/20] powerpc/512x: Add __init attribute to eligible
 functions
Date: Thu, 16 Dec 2021 17:00:34 -0500
Message-Id: <20211216220035.605465-20-nick.child@ibm.com>
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

Some functions defined in 'arch/powerpc/platforms/512x' are deserving of an
`__init` macro attribute. These functions are only called by other
initialization functions and therefore should inherit the attribute.
Also, change function declarations in header files to include `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/platforms/512x/clock-commonclk.c | 52 +++++++++----------
 arch/powerpc/platforms/512x/mpc512x.h         |  4 +-
 arch/powerpc/platforms/512x/mpc512x_shared.c  |  4 +-
 3 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/platforms/512x/clock-commonclk.c b/arch/powerpc/platforms/512x/clock-commonclk.c
index 30342b60aa63..0b03d812baae 100644
--- a/arch/powerpc/platforms/512x/clock-commonclk.c
+++ b/arch/powerpc/platforms/512x/clock-commonclk.c
@@ -97,7 +97,7 @@ static enum soc_type {
 	MPC512x_SOC_MPC5125,
 } soc;
 
-static void mpc512x_clk_determine_soc(void)
+static void __init mpc512x_clk_determine_soc(void)
 {
 	if (of_machine_is_compatible("fsl,mpc5121")) {
 		soc = MPC512x_SOC_MPC5121;
@@ -113,98 +113,98 @@ static void mpc512x_clk_determine_soc(void)
 	}
 }
 
-static bool soc_has_mbx(void)
+static bool __init soc_has_mbx(void)
 {
 	if (soc == MPC512x_SOC_MPC5121)
 		return true;
 	return false;
 }
 
-static bool soc_has_axe(void)
+static bool __init soc_has_axe(void)
 {
 	if (soc == MPC512x_SOC_MPC5125)
 		return false;
 	return true;
 }
 
-static bool soc_has_viu(void)
+static bool __init soc_has_viu(void)
 {
 	if (soc == MPC512x_SOC_MPC5125)
 		return false;
 	return true;
 }
 
-static bool soc_has_spdif(void)
+static bool __init soc_has_spdif(void)
 {
 	if (soc == MPC512x_SOC_MPC5125)
 		return false;
 	return true;
 }
 
-static bool soc_has_pata(void)
+static bool __init soc_has_pata(void)
 {
 	if (soc == MPC512x_SOC_MPC5125)
 		return false;
 	return true;
 }
 
-static bool soc_has_sata(void)
+static bool __init soc_has_sata(void)
 {
 	if (soc == MPC512x_SOC_MPC5125)
 		return false;
 	return true;
 }
 
-static bool soc_has_pci(void)
+static bool __init soc_has_pci(void)
 {
 	if (soc == MPC512x_SOC_MPC5125)
 		return false;
 	return true;
 }
 
-static bool soc_has_fec2(void)
+static bool __init soc_has_fec2(void)
 {
 	if (soc == MPC512x_SOC_MPC5125)
 		return true;
 	return false;
 }
 
-static int soc_max_pscnum(void)
+static int __init soc_max_pscnum(void)
 {
 	if (soc == MPC512x_SOC_MPC5125)
 		return 10;
 	return 12;
 }
 
-static bool soc_has_sdhc2(void)
+static bool __init soc_has_sdhc2(void)
 {
 	if (soc == MPC512x_SOC_MPC5125)
 		return true;
 	return false;
 }
 
-static bool soc_has_nfc_5125(void)
+static bool __init soc_has_nfc_5125(void)
 {
 	if (soc == MPC512x_SOC_MPC5125)
 		return true;
 	return false;
 }
 
-static bool soc_has_outclk(void)
+static bool __init soc_has_outclk(void)
 {
 	if (soc == MPC512x_SOC_MPC5125)
 		return true;
 	return false;
 }
 
-static bool soc_has_cpmf_0_bypass(void)
+static bool __init soc_has_cpmf_0_bypass(void)
 {
 	if (soc == MPC512x_SOC_MPC5125)
 		return true;
 	return false;
 }
 
-static bool soc_has_mclk_mux0_canin(void)
+static bool __init soc_has_mclk_mux0_canin(void)
 {
 	if (soc == MPC512x_SOC_MPC5125)
 		return true;
@@ -294,7 +294,7 @@ static inline int get_bit_field(uint32_t __iomem *reg, uint8_t pos, uint8_t len)
 }
 
 /* get the SPMF and translate it into the "sys pll" multiplier */
-static int get_spmf_mult(void)
+static int __init get_spmf_mult(void)
 {
 	static int spmf_to_mult[] = {
 		68, 1, 12, 16, 20, 24, 28, 32,
@@ -312,7 +312,7 @@ static int get_spmf_mult(void)
  * values returned from here are a multiple of the real factor since the
  * divide ratio is fractional
  */
-static int get_sys_div_x2(void)
+static int __init get_sys_div_x2(void)
 {
 	static int sysdiv_code_to_x2[] = {
 		4, 5, 6, 7, 8, 9, 10, 14,
@@ -333,7 +333,7 @@ static int get_sys_div_x2(void)
  * values returned from here are a multiple of the real factor since the
  * multiplier ratio is fractional
  */
-static int get_cpmf_mult_x2(void)
+static int __init get_cpmf_mult_x2(void)
 {
 	static int cpmf_to_mult_x36[] = {
 		/* 0b000 is "times 36" */
@@ -379,7 +379,7 @@ static const struct clk_div_table divtab_1234[] = {
 	{ .div = 0, },
 };
 
-static int get_freq_from_dt(char *propname)
+static int __init get_freq_from_dt(char *propname)
 {
 	struct device_node *np;
 	const unsigned int *prop;
@@ -396,7 +396,7 @@ static int get_freq_from_dt(char *propname)
 	return val;
 }
 
-static void mpc512x_clk_preset_data(void)
+static void __init mpc512x_clk_preset_data(void)
 {
 	size_t i;
 
@@ -418,7 +418,7 @@ static void mpc512x_clk_preset_data(void)
  *   SYS -> CSB -> IPS) from the REF clock rate and the returned mul/div
  *   values
  */
-static void mpc512x_clk_setup_ref_clock(struct device_node *np, int bus_freq,
+static void __init mpc512x_clk_setup_ref_clock(struct device_node *np, int bus_freq,
 					int *sys_mul, int *sys_div,
 					int *ips_div)
 {
@@ -592,7 +592,7 @@ static struct mclk_setup_data mclk_outclk_data[] = {
 };
 
 /* setup the MCLK clock subtree of an individual PSC/MSCAN/SPDIF */
-static void mpc512x_clk_setup_mclk(struct mclk_setup_data *entry, size_t idx)
+static void __init mpc512x_clk_setup_mclk(struct mclk_setup_data *entry, size_t idx)
 {
 	size_t clks_idx_pub, clks_idx_int;
 	u32 __iomem *mccr_reg;	/* MCLK control register (mux, en, div) */
@@ -701,7 +701,7 @@ static void mpc512x_clk_setup_mclk(struct mclk_setup_data *entry, size_t idx)
 
 /* }}} MCLK helpers */
 
-static void mpc512x_clk_setup_clock_tree(struct device_node *np, int busfreq)
+static void __init mpc512x_clk_setup_clock_tree(struct device_node *np, int busfreq)
 {
 	int sys_mul, sys_div, ips_div;
 	int mul, div;
@@ -937,7 +937,7 @@ static void mpc512x_clk_setup_clock_tree(struct device_node *np, int busfreq)
  * registers the set of public clocks (those listed in the dt-bindings/
  * header file) for OF lookups, keeps the intermediates private to us
  */
-static void mpc5121_clk_register_of_provider(struct device_node *np)
+static void __init mpc5121_clk_register_of_provider(struct device_node *np)
 {
 	clk_data.clks = clks;
 	clk_data.clk_num = MPC512x_CLK_LAST_PUBLIC + 1;	/* _not_ ARRAY_SIZE() */
@@ -948,7 +948,7 @@ static void mpc5121_clk_register_of_provider(struct device_node *np)
  * temporary support for the period of time between introduction of CCF
  * support and the adjustment of peripheral drivers to OF based lookups
  */
-static void mpc5121_clk_provide_migration_support(void)
+static void __init mpc5121_clk_provide_migration_support(void)
 {
 
 	/*
@@ -1009,7 +1009,7 @@ static void mpc5121_clk_provide_migration_support(void)
  * case of not yet adjusted device tree data, where clock related specs
  * are missing)
  */
-static void mpc5121_clk_provide_backwards_compat(void)
+static void __init mpc5121_clk_provide_backwards_compat(void)
 {
 	enum did_reg_flags {
 		DID_REG_PSC	= BIT(0),
diff --git a/arch/powerpc/platforms/512x/mpc512x.h b/arch/powerpc/platforms/512x/mpc512x.h
index fff225901e2f..2f3c60e373e1 100644
--- a/arch/powerpc/platforms/512x/mpc512x.h
+++ b/arch/powerpc/platforms/512x/mpc512x.h
@@ -12,8 +12,8 @@ extern void __init mpc512x_init_early(void);
 extern void __init mpc512x_init(void);
 extern void __init mpc512x_setup_arch(void);
 extern int __init mpc5121_clk_init(void);
-extern const char *mpc512x_select_psc_compat(void);
-extern const char *mpc512x_select_reset_compat(void);
+const char *__init mpc512x_select_psc_compat(void);
+const char *__init mpc512x_select_reset_compat(void);
 extern void __noreturn mpc512x_restart(char *cmd);
 
 #endif				/* __MPC512X_H__ */
diff --git a/arch/powerpc/platforms/512x/mpc512x_shared.c b/arch/powerpc/platforms/512x/mpc512x_shared.c
index 7a9ae9591d60..e3411663edad 100644
--- a/arch/powerpc/platforms/512x/mpc512x_shared.c
+++ b/arch/powerpc/platforms/512x/mpc512x_shared.c
@@ -352,7 +352,7 @@ static void __init mpc512x_declare_of_platform_devices(void)
 
 #define DEFAULT_FIFO_SIZE 16
 
-const char *mpc512x_select_psc_compat(void)
+const char *__init mpc512x_select_psc_compat(void)
 {
 	if (of_machine_is_compatible("fsl,mpc5121"))
 		return "fsl,mpc5121-psc";
@@ -363,7 +363,7 @@ const char *mpc512x_select_psc_compat(void)
 	return NULL;
 }
 
-const char *mpc512x_select_reset_compat(void)
+const char *__init mpc512x_select_reset_compat(void)
 {
 	if (of_machine_is_compatible("fsl,mpc5121"))
 		return "fsl,mpc5121-reset";
-- 
2.25.1

