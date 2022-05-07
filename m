Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F351E65C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 12:04:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwNMh2bjQz3cjP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 20:04:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=atEtC1TD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=atEtC1TD; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwNKg1z3Gz3bYM
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 20:03:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651917783; x=1683453783;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q/otdjcbA6WbbPS5f3qcEn378K8z0rLFkeMOCGtuneE=;
 b=atEtC1TDgkcSK2VQCNp2rhAI4XqvTNohgsSO9vgJ6PZNnTq0XGQiMisB
 ZfIi6r871UjiD9duzWTivTeUtUhHJCRZMdBwvmwjAzogB6H7ANgSpw3Q1
 pDYbXHJYIuygjNmB+qCFPz+w+kunaTXB0FWs/Ku0rQSu0fIvVhG/U8arJ
 j042Q6CSl00D/0m15w1nNwbSMHKQ9BsI2zr3zjcAeBHIdrQ8swnaspxUN
 J+cbkuz7eX1nEXMKVvMtvstw8KV8jWtRzG2+VgrcYMmB+FsHK9IGs7547
 qEF6uco4XH8M8cpcXhs4oJMquLeeHtrlBYxtE79Uzmt2yTcIIfq4z8IWD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="331685882"
X-IronPort-AV: E=Sophos;i="5.91,206,1647327600"; d="scan'208";a="331685882"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2022 03:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,206,1647327600"; d="scan'208";a="695555683"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga004.jf.intel.com with ESMTP; 07 May 2022 03:01:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 78FB3155; Sat,  7 May 2022 13:01:49 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Mark Brown <broonie@kernel.org>, chris.packham@alliedtelesis.co.nz,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
Subject: [PATCH v2 1/4] powerpc/52xx: Remove dead code,
 i.e. mpc52xx_get_xtal_freq()
Date: Sat,  7 May 2022 13:01:44 +0300
Message-Id: <20220507100147.5802-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, Anatolij Gustschin <agust@denx.de>,
 Wolfgang Grandegger <wg@grandegger.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It seems mpc52xx_get_xtal_freq() is not used anywhere. Remove dead code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Wolfram Sang <wsa@kernel.org>
---
v2: collected tags
 arch/powerpc/include/asm/mpc52xx.h           |  1 -
 arch/powerpc/platforms/52xx/mpc52xx_common.c | 37 --------------------
 2 files changed, 38 deletions(-)

diff --git a/arch/powerpc/include/asm/mpc52xx.h b/arch/powerpc/include/asm/mpc52xx.h
index ce1e0aabaa64..ddd80aae1e32 100644
--- a/arch/powerpc/include/asm/mpc52xx.h
+++ b/arch/powerpc/include/asm/mpc52xx.h
@@ -274,7 +274,6 @@ extern void mpc52xx_declare_of_platform_devices(void);
 extern int mpc5200_psc_ac97_gpio_reset(int psc_number);
 extern void mpc52xx_map_common_devices(void);
 extern int mpc52xx_set_psc_clkdiv(int psc_id, int clkdiv);
-extern unsigned int mpc52xx_get_xtal_freq(struct device_node *node);
 extern void __noreturn mpc52xx_restart(char *cmd);
 
 /* mpc52xx_gpt.c */
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_common.c b/arch/powerpc/platforms/52xx/mpc52xx_common.c
index 565e3a83dc9e..4a39e1cb2263 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_common.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_common.c
@@ -203,43 +203,6 @@ int mpc52xx_set_psc_clkdiv(int psc_id, int clkdiv)
 }
 EXPORT_SYMBOL(mpc52xx_set_psc_clkdiv);
 
-/**
- * mpc52xx_get_xtal_freq - Get SYS_XTAL_IN frequency for a device
- *
- * @node: device node
- *
- * Returns the frequency of the external oscillator clock connected
- * to the SYS_XTAL_IN pin, or 0 if it cannot be determined.
- */
-unsigned int mpc52xx_get_xtal_freq(struct device_node *node)
-{
-	u32 val;
-	unsigned int freq;
-
-	if (!mpc52xx_cdm)
-		return 0;
-
-	freq = mpc5xxx_get_bus_frequency(node);
-	if (!freq)
-		return 0;
-
-	if (in_8(&mpc52xx_cdm->ipb_clk_sel) & 0x1)
-		freq *= 2;
-
-	val  = in_be32(&mpc52xx_cdm->rstcfg);
-	if (val & (1 << 5))
-		freq *= 8;
-	else
-		freq *= 4;
-	if (val & (1 << 6))
-		freq /= 12;
-	else
-		freq /= 16;
-
-	return freq;
-}
-EXPORT_SYMBOL(mpc52xx_get_xtal_freq);
-
 /**
  * mpc52xx_restart: ppc_md->restart hook for mpc5200 using the watchdog timer
  */
-- 
2.35.1

