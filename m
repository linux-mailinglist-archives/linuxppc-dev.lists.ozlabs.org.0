Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C5C42E52A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 02:17:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVn0Q50tmz30MC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 11:17:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ALECgVPD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ALECgVPD; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVmzh2LCFz2yNf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 11:17:03 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so5984792pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 17:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vvzx5ebQ6LybsslVPYBrRPhcfdShWCS6o6iCqtpIzFc=;
 b=ALECgVPDqPT7euYeh7EYLwmDiP1Dnq2n6svDeoic4Rha+y1mC/OVhyPDHH5UCoYLVS
 riBN3Q50dryRQeO0JkZOL59oyayfMnKhqpLgKcaV0AenG1Oc7e3/v+ecCVT4dq/ty2D3
 DUagQzgvIr1/+ca5wtQwMmZYAcO7W9HeqGOm1jGRz12HHujgg2An1fy5QEjAA3YY0++g
 olnhZH7bg5FFnpO+ogmyAMRg19RJTuaZt7gdlFYZEix19IgNaHPXtWpv5I9gP8igZ4FB
 Nur2bWQQzuYEbZea41/ymhqqav4fg5DEol093QJ4bYPV1Shc6gXm2UpUU/QDUW9kDHSx
 X6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Vvzx5ebQ6LybsslVPYBrRPhcfdShWCS6o6iCqtpIzFc=;
 b=CNaLY6hdii3Isfmy3um5m1630mKVGM5a2/J5EfFbySVuGN2dPb/fSQ+vaoYBKIy1Kn
 218dZuOFd4QC8RgKTR4iClzH0mAR841gIxAzGRztn7TNq3ZOoPjygOHLukW+KunFluCk
 AxEMfWB18tle6JbzQ6rI9+Deo06szEUKB7dK4iOP/SakgLk/7XHMt5sT83VT70/ylmb8
 SjOPq532kl8JOX2dxkKbk5ih5x6W6u+4OrYBOhQzNHOR7EKVUHFofJ+iQ/ZtNmNxHLVo
 qqoEDMs5NHNAwGYxKVAxv5JHSmVC1ahj3wP6pEUntH0DBiFEn3YSlHyGuWctdWhgxhcZ
 4FMQ==
X-Gm-Message-State: AOAM533+CT1Tq2gmKe9QCsdxlKjN0sEi1rxPvuKVQKAcr3+qL/TfiBKN
 bU9U2wIE+vnkNMY0FSaTokdRbirmUbs=
X-Google-Smtp-Source: ABdhPJzcmIjK+KgELL4mK+pe5MltByrgju9Mv/SLlgQqPq9DXvqmP55EDSwXy5keCe/rXyOCd+Mobw==
X-Received: by 2002:a17:90a:9292:: with SMTP id
 n18mr23531559pjo.120.1634257018040; 
 Thu, 14 Oct 2021 17:16:58 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id a22sm3475509pfg.61.2021.10.14.17.16.55
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 17:16:56 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/64s: Default to 64K pages for 64 bit book3s
Date: Fri, 15 Oct 2021 10:46:49 +1030
Message-Id: <20211015001649.45591-1-joel@jms.id.au>
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
v2: remove unrelated change from microwatt_defconfig

 arch/powerpc/Kconfig                     | 1 +
 arch/powerpc/configs/cell_defconfig      | 1 -
 arch/powerpc/configs/g5_defconfig        | 1 +
 arch/powerpc/configs/maple_defconfig     | 1 +
 arch/powerpc/configs/microwatt_defconfig | 1 +
 arch/powerpc/configs/pasemi_defconfig    | 1 -
 arch/powerpc/configs/powernv_defconfig   | 1 -
 arch/powerpc/configs/ppc64_defconfig     | 1 -
 arch/powerpc/configs/ps3_defconfig       | 1 +
 arch/powerpc/configs/pseries_defconfig   | 1 -
 arch/powerpc/configs/skiroot_defconfig   | 1 -
 11 files changed, 5 insertions(+), 6 deletions(-)

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
index 9465209b8c5b..07d87a4044b2 100644
--- a/arch/powerpc/configs/microwatt_defconfig
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -26,6 +26,7 @@ CONFIG_PPC_MICROWATT=y
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

