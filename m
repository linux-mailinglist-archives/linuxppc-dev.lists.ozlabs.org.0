Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E3F3EE5FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 06:56:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gpdzh3VQGz3dDs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 14:56:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SEejPg9l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SEejPg9l; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gpdx11YNSz30CX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 14:54:29 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 w13-20020a17090aea0db029017897a5f7bcso4280125pjy.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 21:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EfTwsDw0TP1BgGTgO/Vd2rGR2OGwbOo+ksDnjxyq8jo=;
 b=SEejPg9lB1ye3H/Kk3u4hx0Frf1K/aNllWeG4JkB6okmQVN9dInNGFGvipD6AoBSGr
 E/ivzSokbSzAL+Zl+Uyl7lY7IEEZenUZ/1bOqHxY30Y9QJ/l7c+1lVDAOu2OcaRmbmwz
 03/EEGr5UjfXqAj3Ylng7kfAT59MolUQZFQeDhMbnwOwTaP2sf6lcAMr0Nn8ySgPXDMz
 C7NdNZ8e+wU2YVYYIMxiMYQzDs/TEn69PdaUOXK49fvdDEKydPTlc4rFpnlavawO485l
 9Jxk3hrc1x4+gSoIy5psnNfys77K9geeAycAju7YSn8n7wpE1qWQUHVrvxAmqIDWr7df
 /djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EfTwsDw0TP1BgGTgO/Vd2rGR2OGwbOo+ksDnjxyq8jo=;
 b=teVltG6wXkhoidkczUilvHPJscTx/UWozy8ZQ6Orn1YqycOfWnx24lN4cjLZIaRzxc
 SLPnD0vLE9Yy9gE6Blkp+SwicS7NfqRfiK1rpWicMFlCNJoCIyyT2BIzXGp7ZbU39pdR
 UFtnG7GENahf1adZSUMEUYhESLhh65cp9+AE7C7j59UJyvqmWTA8g/FXsPLyFTyFelSu
 MK+NrQM9xZfvmoZ6/GAFJz4eYPBYaT5dfDheiiBMYfldSWybSCCYsI+6O2dwxLnh/iIi
 dJ0qaDJE6DPzQHZ6Ugl0kgyZBXCLF4J2ilv85nKsHqw/ON+/Qc1c880xZvsOzTD84bfk
 54HA==
X-Gm-Message-State: AOAM533ZIrz5Fw7Vno8vXdyGTLbgcr25Y0EfqdZID17uc74HBBtrYxTZ
 IXM3kdOQUgnNRFYR4lX0UPz+qXUqydA=
X-Google-Smtp-Source: ABdhPJzhOin7DV0kkuTzmLFr0xXWL/HuPHpbYk1HCo8FdOu7/z+QOVObTilig1cQI5hxHGwoEmAXLg==
X-Received: by 2002:a63:f754:: with SMTP id f20mr1693249pgk.385.1629176066349; 
 Mon, 16 Aug 2021 21:54:26 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id k6sm1029073pgk.1.2021.08.16.21.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 21:54:25 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/3] powerpc/configs: Regenerate mpc885_ads_defconfig
Date: Tue, 17 Aug 2021 14:24:07 +0930
Message-Id: <20210817045407.2445664-4-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817045407.2445664-1-joel@jms.id.au>
References: <20210817045407.2445664-1-joel@jms.id.au>
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

Regenerate atop v5.14-rc6 by doing a make savedefconfig.

The changes a re-ordering except for the following (which are still set
indirectly):

 - CONFIG_DEBUG_KERNEL=y selected by EXPERT

 - CONFIG_PPC_EARLY_DEBUG_CPM_ADDR=0xff002008 which is the default
   setting

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/configs/mpc885_ads_defconfig | 46 +++++++++++------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
index cd08f9ed2c8d..c74dc76b1d0d 100644
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
@@ -46,38 +57,25 @@ CONFIG_DAVICOM_PHY=y
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

