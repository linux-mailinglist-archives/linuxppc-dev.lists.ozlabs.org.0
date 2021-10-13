Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0185B42CF30
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 01:32:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV82Y3FDKz30Hr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 10:32:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W1Cp+DLc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=W1Cp+DLc; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HV81t4mRWz2yQB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 10:31:44 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id w6so3826754pfd.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 16:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JQbZTp5kxSXA36aMiycQhvq9uv3YrXacT0tH2mb2dZ4=;
 b=W1Cp+DLc0n30/YOHPWTUgPSnUkkWqn4K4g5mZmytB3t5r0pa1G/Maui/bbFuwGbLSa
 4PF+df3TouIr9gApO5RHxd3VvHOs/LS5E03kdsAtUOE+1GTWgFWiwEO0z89dHXlVCFAZ
 zp9gchjHLbScHbeCts6coBSw7JuL6Ds+94YYXOfrKeQNZ464yEWF9LFqaf7p0wAPnkn2
 PVktKWsXabQtP4SqZ8D/36h37mA3NDicLW1qZcO23JucZT/NGOCZdtpeYnWNLxGxrTA8
 T2tY7uveHXMiMLTdaYf8Lqo7wUdYYeK1UwEict7Ndr9V69Zwv2cPsVPMWknS4lXo1su1
 qKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JQbZTp5kxSXA36aMiycQhvq9uv3YrXacT0tH2mb2dZ4=;
 b=El0NURc50I7/4uGAD4BrizRD+FQqaEm6Sku8+xG4UFamvEwp41S7OKbQIX2HoCIDUl
 y32P09/OGq6RfhzkebaOpEruYgN/gZxhBK4ermrfEdoUBgYAnbYVzx1jQrO0t1BYus/w
 n4srDT/VsDP4vvjx303OTpn0rGMELCzDEYTA1LP1Z0K1PZBnzLbdZ4H/95ptEGxOx/m2
 zEVH/yCSqYXn0Sn5xmZlX/ikvEhn3Dn12Wstw8pAAs45q22LkDK6tWYRS9hlMtN7ZvxY
 tHNvQFO452vtqJZsyyor6BZA7ho9OsC+yqLCy3Fc2S3pDIyV2pSrcIrjz97Jv/hsfl1m
 5TGg==
X-Gm-Message-State: AOAM531PgzFwkfYP/xY074rYZm4YzgRJajnGvK+lpgZukbWmI3JJHPp4
 fLvkTtiaR/VEaGvb/sMxlYnTWvEn7hc=
X-Google-Smtp-Source: ABdhPJy9Ytu1gTRC41o7Q9lz/9RptYgZcuVV8Dj00DhshTtDuFGcAi125nunGqxrv/oqBiuFaguCDw==
X-Received: by 2002:a62:5f03:0:b0:445:38d5:98bd with SMTP id
 t3-20020a625f03000000b0044538d598bdmr2228287pfb.81.1634167901516; 
 Wed, 13 Oct 2021 16:31:41 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id 192sm515091pfy.121.2021.10.13.16.31.38
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 16:31:40 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Default to 64K pages for 64 bit book3s
Date: Thu, 14 Oct 2021 10:01:33 +1030
Message-Id: <20211013233133.728484-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
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

For 64-bit book3s the default should be 64K as that's what modern CPUs
are designed for.

The following defconfigs already set CONFIG_PPC_64K_PAGES:

 cell_defconfig
 pasemi_defconfig
 powernv_defconfig
 ppc64_defconfig
 pseries_defconfig
 skiroot_defconfig

The have the option removed from the defconfig, as it is now the
default.

The defconfigs that now need to set CONFIG_PPC_4K_PAGES to maintain
their existing behaviour are:

 g5_defconfig
 maple_defconfig
 microwatt_defconfig
 ps3_defconfig

Link: https://github.com/linuxppc/issues/issues/109
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/Kconfig                     | 1 +
 arch/powerpc/configs/cell_defconfig      | 1 -
 arch/powerpc/configs/g5_defconfig        | 1 +
 arch/powerpc/configs/maple_defconfig     | 1 +
 arch/powerpc/configs/microwatt_defconfig | 2 +-
 arch/powerpc/configs/pasemi_defconfig    | 1 -
 arch/powerpc/configs/powernv_defconfig   | 1 -
 arch/powerpc/configs/ppc64_defconfig     | 1 -
 arch/powerpc/configs/ps3_defconfig       | 1 +
 arch/powerpc/configs/pseries_defconfig   | 1 -
 arch/powerpc/configs/skiroot_defconfig   | 1 -
 11 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8a584414ef67..e2c220fa91c0 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -708,6 +708,7 @@ config ARCH_MEMORY_PROBE
 
 choice
 	prompt "Page size"
+	default PPC_64K_PAGES if PPC_BOOK3S_64
 	default PPC_4K_PAGES
 	help
 	  Select the kernel logical page size. Increasing the page size
diff --git a/arch/powerpc/configs/cell_defconfig b/arch/powerpc/configs/cell_defconfig
index cc2c0d51f493..7fd9e596ea33 100644
--- a/arch/powerpc/configs/cell_defconfig
+++ b/arch/powerpc/configs/cell_defconfig
@@ -36,7 +36,6 @@ CONFIG_GEN_RTC=y
 CONFIG_BINFMT_MISC=m
 CONFIG_IRQ_ALL_CPUS=y
 CONFIG_NUMA=y
-CONFIG_PPC_64K_PAGES=y
 CONFIG_SCHED_SMT=y
 CONFIG_PCIEPORTBUS=y
 CONFIG_NET=y
diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
index 63d611cc160f..9d6212a8b195 100644
--- a/arch/powerpc/configs/g5_defconfig
+++ b/arch/powerpc/configs/g5_defconfig
@@ -26,6 +26,7 @@ CONFIG_CPU_FREQ_PMAC64=y
 CONFIG_GEN_RTC=y
 CONFIG_KEXEC=y
 CONFIG_IRQ_ALL_CPUS=y
+CONFIG_PPC_4K_PAGES=y
 CONFIG_PCI_MSI=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/powerpc/configs/maple_defconfig b/arch/powerpc/configs/maple_defconfig
index 9424c1e67e1c..c821a97f4a89 100644
--- a/arch/powerpc/configs/maple_defconfig
+++ b/arch/powerpc/configs/maple_defconfig
@@ -25,6 +25,7 @@ CONFIG_UDBG_RTAS_CONSOLE=y
 CONFIG_GEN_RTC=y
 CONFIG_KEXEC=y
 CONFIG_IRQ_ALL_CPUS=y
+CONFIG_PPC_4K_PAGES=y
 CONFIG_PCI_MSI=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
index 9465209b8c5b..556ec5eec684 100644
--- a/arch/powerpc/configs/microwatt_defconfig
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -1,7 +1,6 @@
 # CONFIG_SWAP is not set
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
-CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_TICK_CPU_ACCOUNTING=y
 CONFIG_LOG_BUF_SHIFT=16
 CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
@@ -26,6 +25,7 @@ CONFIG_PPC_MICROWATT=y
 # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
 CONFIG_CPU_FREQ=y
 CONFIG_HZ_100=y
+CONFIG_PPC_4K_PAGES=y
 # CONFIG_PPC_MEM_KEYS is not set
 # CONFIG_SECCOMP is not set
 # CONFIG_MQ_IOSCHED_KYBER is not set
diff --git a/arch/powerpc/configs/pasemi_defconfig b/arch/powerpc/configs/pasemi_defconfig
index 78606b7e42df..e00a703581c3 100644
--- a/arch/powerpc/configs/pasemi_defconfig
+++ b/arch/powerpc/configs/pasemi_defconfig
@@ -22,7 +22,6 @@ CONFIG_CPU_FREQ_GOV_POWERSAVE=y
 CONFIG_CPU_FREQ_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_ONDEMAND=y
 CONFIG_HZ_1000=y
-CONFIG_PPC_64K_PAGES=y
 # CONFIG_SECCOMP is not set
 CONFIG_PCI_MSI=y
 CONFIG_PCCARD=y
diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index 8bfeea6c7de7..49f49c263935 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -62,7 +62,6 @@ CONFIG_MEMORY_FAILURE=y
 CONFIG_HWPOISON_INJECT=m
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
-CONFIG_PPC_64K_PAGES=y
 CONFIG_SCHED_SMT=y
 CONFIG_PM=y
 CONFIG_HOTPLUG_PCI=y
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 0ad2291337a7..203d0b7f0bb8 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -52,7 +52,6 @@ CONFIG_KEXEC_FILE=y
 CONFIG_CRASH_DUMP=y
 CONFIG_FA_DUMP=y
 CONFIG_IRQ_ALL_CPUS=y
-CONFIG_PPC_64K_PAGES=y
 CONFIG_SCHED_SMT=y
 CONFIG_HOTPLUG_PCI=y
 CONFIG_HOTPLUG_PCI_RPA=m
diff --git a/arch/powerpc/configs/ps3_defconfig b/arch/powerpc/configs/ps3_defconfig
index f300dcb937cc..7c95fab4b920 100644
--- a/arch/powerpc/configs/ps3_defconfig
+++ b/arch/powerpc/configs/ps3_defconfig
@@ -30,6 +30,7 @@ CONFIG_PS3_LPM=m
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=y
 CONFIG_KEXEC=y
+CONFIG_PPC_4K_PAGES=y
 # CONFIG_SPARSEMEM_VMEMMAP is not set
 # CONFIG_COMPACTION is not set
 CONFIG_SCHED_SMT=y
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index b183629f1bcf..de7641adb899 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -56,7 +56,6 @@ CONFIG_MEMORY_HOTPLUG=y
 CONFIG_MEMORY_HOTREMOVE=y
 CONFIG_KSM=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
-CONFIG_PPC_64K_PAGES=y
 CONFIG_SCHED_SMT=y
 CONFIG_HOTPLUG_PCI=y
 CONFIG_HOTPLUG_PCI_RPA=m
diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index c3ba614c973d..f491875700e8 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -43,7 +43,6 @@ CONFIG_KEXEC_FILE=y
 CONFIG_PRESERVE_FA_DUMP=y
 CONFIG_IRQ_ALL_CPUS=y
 CONFIG_NUMA=y
-CONFIG_PPC_64K_PAGES=y
 CONFIG_SCHED_SMT=y
 CONFIG_CMDLINE="console=tty0 console=hvc0 ipr.fast_reboot=1 quiet"
 # CONFIG_SECCOMP is not set
-- 
2.33.0

