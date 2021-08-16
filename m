Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 212AE3ED05A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 10:33:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp6rX0P0Fz3dHd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 18:33:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=N3+xD1Wk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N3+xD1Wk; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp6p82lRYz3bbF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 18:31:44 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id w6so12934724plg.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 01:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vthf14O7ZKwl6JYvtgmLVfLrWI2wjXRA6XLeBLGRdjs=;
 b=N3+xD1WkfH6ali3f48Oi/T+tpfP/Qz0ay4Wk0t6UcqJsjPQ/QtV9tIng3QtXtfNu72
 1VTw5siAtgoCL5o4rSMGv22BmcuzNL2fAit/+oRPnkl6Yg+5SwB+9kPYaBmgw44pDjVS
 9WnxjZX1DIf6GaO5o+ch6ShKqmAZFdJwhAEYs43l5D+vJhpB/E2w6E4tdc6s2FmWV6nd
 17OIWUXl3Wak/KyE2A0gkXnqZ2NVMx91gQlYht8BaNdkepe3oRPCO81zILjq1WcpTcI6
 kD164Dzt7LlS/j2ZKURUQLTqHHCYvNe3w3qM+NUk0ioCjoVez8AlvtJBxZ7Xk+KEB4VM
 M6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vthf14O7ZKwl6JYvtgmLVfLrWI2wjXRA6XLeBLGRdjs=;
 b=Gr3ifBvMqXs3LAs3AKr2vKuMjgojNnbtXOxE8r7aJAFeZZO7BzLr+fXRot4SUTcuSt
 CV2Ll46Oit/OaVN8HDdzCdmiLm933t1DxtjdKxx9apSsUZt3qcvBb92xy2jUoVAovi+Z
 0TF6E9BAwL7mMnxCUKTaYRAzRIHskHfBmE2CEIIsxiW9GNOL/mFp3I1Yv7L/pz0uH07Q
 7sWdQ3ROsG4UMU6qxPUiFPRxx33QEDIzV/V3oLlyWOmgfMh8n6uMiQvZ0/Lm7WX9jBcS
 5lQMPnSPGm1jDaCw7zUbmOjyrKei2EtWwaciEtBl26w2myF3KwDs+4iKDNDzI9EklnB8
 lAIg==
X-Gm-Message-State: AOAM531WCMf0hNB+siZNL7ezugUZnCg4g0pfQ5BmGo+wNqN7f746hjhY
 3547Otbz12axVyqdY/wNTdA=
X-Google-Smtp-Source: ABdhPJycLdORQeFdFFi/JGKBgr75XN3GkP8R4RwsuFufc021lq3i8NlpFo3dSWNzRfU3CYfY3lkxvA==
X-Received: by 2002:a63:b11:: with SMTP id 17mr15043910pgl.153.1629102701746; 
 Mon, 16 Aug 2021 01:31:41 -0700 (PDT)
Received: from voyager.lan ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id mr18sm8715684pjb.39.2021.08.16.01.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 01:31:40 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/configs: Regenerate mpc885_ads_defconfig
Date: Mon, 16 Aug 2021 18:01:26 +0930
Message-Id: <20210816083126.2294522-3-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816083126.2294522-1-joel@jms.id.au>
References: <20210816083126.2294522-1-joel@jms.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Regenrate atop v5.14-rc6.

The chagnes are mostly re-ordering, except for the following which fall
out due to dependenacies:

 - CONFIG_DEBUG_KERNEL=y selected by EXPERT

 - CONFIG_PPC_EARLY_DEBUG_CPM_ADDR=0xff002008 which is the default
   setting

CONFIG_MTD_PHYSMAP_OF is not longer enabled, as it depends on
MTD_PHYSMAP which is not enabled. This is a regression from commit
642b1e8dbed7 ("mtd: maps: Merge physmap_of.c into physmap-core.c"),
which added the extra dependency. Add CONFIG_MTD_PHYSMAP=y so this stays
in the config.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/configs/mpc885_ads_defconfig | 47 +++++++++++------------
 1 file changed, 23 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
index 5cd17adf903f..c74dc76b1d0d 100644
--- a/arch/powerpc/configs/mpc885_ads_defconfig
+++ b/arch/powerpc/configs/mpc885_ads_defconfig
@@ -1,19 +1,30 @@
-CONFIG_PPC_8xx=y
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_JIT=y
+CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 # CONFIG_ELF_CORE is not set
 # CONFIG_BASE_FULL is not set
 # CONFIG_FUTEX is not set
+CONFIG_PERF_EVENTS=y
 # CONFIG_VM_EVENT_COUNTERS is not set
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PARTITION_ADVANCED=y
+CONFIG_PPC_8xx=y
+CONFIG_8xx_GPIO=y
+CONFIG_SMC_UCODE_PATCH=y
+CONFIG_PIN_TLB=y
 CONFIG_GEN_RTC=y
 CONFIG_HZ_100=y
+CONFIG_MATH_EMULATION=y
+CONFIG_PPC_16K_PAGES=y
+CONFIG_ADVANCED_OPTIONS=y
 # CONFIG_SECCOMP is not set
+CONFIG_STRICT_KERNEL_RWX=y
+CONFIG_MODULES=y
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_PARTITION_ADVANCED=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -33,6 +44,7 @@ CONFIG_MTD_CFI_GEOMETRY=y
 # CONFIG_MTD_CFI_I2 is not set
 CONFIG_MTD_CFI_I4=y
 CONFIG_MTD_CFI_AMDSTD=y
+CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_PHYSMAP_OF=y
 # CONFIG_BLK_DEV is not set
 CONFIG_NETDEVICES=y
@@ -45,38 +57,25 @@ CONFIG_DAVICOM_PHY=y
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_CPM=y
 CONFIG_SERIAL_CPM_CONSOLE=y
+CONFIG_SPI=y
+CONFIG_SPI_FSL_SPI=y
 # CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_8xxx_WDT=y
 # CONFIG_USB_SUPPORT is not set
 # CONFIG_DNOTIFY is not set
 CONFIG_TMPFS=y
 CONFIG_CRAMFS=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
+CONFIG_CRYPTO=y
+CONFIG_CRYPTO_DEV_TALITOS=y
 CONFIG_CRC32_SLICEBY4=y
 CONFIG_DEBUG_INFO=y
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_PPC_16K_PAGES=y
-CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_FS=y
-CONFIG_PPC_PTDUMP=y
-CONFIG_MODULES=y
-CONFIG_SPI=y
-CONFIG_SPI_FSL_SPI=y
-CONFIG_CRYPTO=y
-CONFIG_CRYPTO_DEV_TALITOS=y
-CONFIG_8xx_GPIO=y
-CONFIG_WATCHDOG=y
-CONFIG_8xxx_WDT=y
-CONFIG_SMC_UCODE_PATCH=y
-CONFIG_ADVANCED_OPTIONS=y
-CONFIG_PIN_TLB=y
-CONFIG_PERF_EVENTS=y
-CONFIG_MATH_EMULATION=y
-CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y
-CONFIG_STRICT_KERNEL_RWX=y
-CONFIG_BPF_JIT=y
 CONFIG_DEBUG_VM_PGTABLE=y
+CONFIG_DETECT_HUNG_TASK=y
 CONFIG_BDI_SWITCH=y
 CONFIG_PPC_EARLY_DEBUG=y
-CONFIG_PPC_EARLY_DEBUG_CPM_ADDR=0xff002008
+CONFIG_PPC_PTDUMP=y
-- 
2.32.0

