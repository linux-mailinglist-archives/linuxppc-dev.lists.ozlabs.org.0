Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE052F6063
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 12:40:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGj756D89zDrYf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 22:40:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DW82SJds; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGj1x17x6zDrdV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 22:36:16 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id x12so2756599plr.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 03:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5hXkp3gg4YGPt+TOgCHux/nhvRnHEfJIXXAJayhktZY=;
 b=DW82SJds3N9KAdK1ScEVl6U0a25BF08f9YxnCaHTOX+Nwu5XPabB95rw7OJfQu30iK
 MBukVwhgImVfttUJJsZ4kord3QL3pPURiFsbUeeyk+dZL1rpyB8IxIg028kA0ptkq6oL
 +ul5dEr2s6l2cZQETylRTcIyA2gcuShDo9IfzY0ZjIvJtxkrjXY+3slyCdLD09h7OKw6
 vy/1G7dVOB0jPVKXH959n6/pEeoUukJqWnZzfT9YzFtYpgaPiPL8+TCxH1WiIoXdMER3
 eG7VSU+FWHI3T8Sr7VXA5nCL+Plbh2brKKhul5gfc1LYT4K151XJ1hvr4oZp7fAAG8rJ
 8J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5hXkp3gg4YGPt+TOgCHux/nhvRnHEfJIXXAJayhktZY=;
 b=BaaFETUS5B8HqJ9aZXjdoFxA4IAYTnaOiEY5/qnHmeLIgJf0n+WPK2MOVB/KXixXot
 WzsAAKXaF37RjDYfTS/r4OlVfks00wa6ee85PkcHZz3uTYNZx7ywGmpivhymw28GGDym
 Qot4vqRXxS9+lWS8zlWRLK5RoR97L9Hs9nEs6zdpUgGau13RQaI+GFDj2qgwOQAaQYLV
 5lV/L+g9XTUivuXeWgooEFlVBj6K0UtZq5Tswv2vjC8QKBsDgAi/qvCJJtt8LyyiYQ6s
 MDgUK7tWoNnzaUEVIWSABWl+5FCJ/VJa9eX20PaA+sASTCE34BkiUbD/YWmEYJTZfCe6
 1VRA==
X-Gm-Message-State: AOAM532jeQ59GrUO4LajbXHxDelUTZkzoDGuWQC7bSTABptkdXcIQX4m
 N2UDXi1AqgQDQ4xskSwUj3NF3Q==
X-Google-Smtp-Source: ABdhPJxZ7RZ1nbV3MVlfwFb21ITzaTUXMFj6g3fYQiOznVszLZllMLMWxZYnEyxSGaMe1g2bLpchNw==
X-Received: by 2002:a17:902:b203:b029:dc:973:3ad0 with SMTP id
 t3-20020a170902b203b02900dc09733ad0mr7168019plr.44.1610624173104; 
 Thu, 14 Jan 2021 03:36:13 -0800 (PST)
Received: from localhost ([122.172.85.111])
 by smtp.gmail.com with ESMTPSA id c10sm5227584pfj.54.2021.01.14.03.36.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Jan 2021 03:36:12 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Robert Richter <rric@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Arnd Bergmann <arnd@arndb.de>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH 10/18] arch: powerpc: Stop building and using oprofile
Date: Thu, 14 Jan 2021 17:05:23 +0530
Message-Id: <fd155a0a1e52650ddc9ec57a1d211fdc777beddb.1610622251.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1610622251.git.viresh.kumar@linaro.org>
References: <cover.1610622251.git.viresh.kumar@linaro.org>
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Christoph Hellwig <hch@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-kernel@vger.kernel.org, anmar.oueja@linaro.org,
 oprofile-list@lists.sf.net, Alexander Viro <viro@zeniv.linux.org.uk>,
 William Cohen <wcohen@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The "oprofile" user-space tools don't use the kernel OPROFILE support
any more, and haven't in a long time. User-space has been converted to
the perf interfaces.

This commits stops building oprofile for powerpc and removes any
reference to it from directories in arch/powerpc/ apart from
arch/powerpc/oprofile, which will be removed in the next commit (this is
broken into two commits as the size of the commit became very big, ~5k
lines).

Note that the member "oprofile_cpu_type" in "struct cpu_spec" isn't
removed as it was also used by other parts of the code.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/powerpc/Kconfig                          |   1 -
 arch/powerpc/Makefile                         |   2 -
 arch/powerpc/configs/44x/akebono_defconfig    |   1 -
 arch/powerpc/configs/44x/currituck_defconfig  |   1 -
 arch/powerpc/configs/44x/fsp2_defconfig       |   1 -
 arch/powerpc/configs/44x/iss476-smp_defconfig |   1 -
 arch/powerpc/configs/cell_defconfig           |   1 -
 arch/powerpc/configs/g5_defconfig             |   1 -
 arch/powerpc/configs/maple_defconfig          |   1 -
 arch/powerpc/configs/pasemi_defconfig         |   1 -
 arch/powerpc/configs/pmac32_defconfig         |   1 -
 arch/powerpc/configs/powernv_defconfig        |   1 -
 arch/powerpc/configs/ppc64_defconfig          |   1 -
 arch/powerpc/configs/ppc64e_defconfig         |   1 -
 arch/powerpc/configs/ppc6xx_defconfig         |   1 -
 arch/powerpc/configs/ps3_defconfig            |   1 -
 arch/powerpc/configs/pseries_defconfig        |   1 -
 arch/powerpc/include/asm/cputable.h           |  20 ---
 arch/powerpc/include/asm/oprofile_impl.h      | 135 ------------------
 arch/powerpc/include/asm/spu.h                |  33 -----
 arch/powerpc/kernel/cputable.c                |  67 ---------
 arch/powerpc/kernel/dt_cpu_ftrs.c             |   2 -
 arch/powerpc/platforms/cell/Kconfig           |   5 -
 arch/powerpc/platforms/cell/spu_notify.c      |  55 -------
 arch/powerpc/platforms/cell/spufs/run.c       |   4 +-
 arch/powerpc/platforms/cell/spufs/sched.c     |   5 -
 arch/powerpc/platforms/cell/spufs/spufs.h     |   1 -
 27 files changed, 1 insertion(+), 344 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/oprofile_impl.h
 delete mode 100644 arch/powerpc/platforms/cell/spu_notify.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 107bb4319e0e..1897c0ff2f2b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -226,7 +226,6 @@ config PPC
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
 	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if (PPC64 && PPC_BOOK3S)
-	select HAVE_OPROFILE
 	select HAVE_OPTPROBES			if PPC64
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_EVENTS_NMI		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 08cf0eade56a..b959fdaec713 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -276,8 +276,6 @@ head-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE)  += arch/powerpc/kernel/prom_init.o
 # See arch/powerpc/Kbuild for content of core part of the kernel
 core-y += arch/powerpc/
 
-drivers-$(CONFIG_OPROFILE)	+= arch/powerpc/oprofile/
-
 # Default to zImage, override when needed
 all: zImage
 
diff --git a/arch/powerpc/configs/44x/akebono_defconfig b/arch/powerpc/configs/44x/akebono_defconfig
index 3894ba8f8ffc..72b8f93a9bdd 100644
--- a/arch/powerpc/configs/44x/akebono_defconfig
+++ b/arch/powerpc/configs/44x/akebono_defconfig
@@ -8,7 +8,6 @@ CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_SLUB_CPU_PARTIAL is not set
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/powerpc/configs/44x/currituck_defconfig b/arch/powerpc/configs/44x/currituck_defconfig
index 34c86b3abecb..717827219921 100644
--- a/arch/powerpc/configs/44x/currituck_defconfig
+++ b/arch/powerpc/configs/44x/currituck_defconfig
@@ -6,7 +6,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/powerpc/configs/44x/fsp2_defconfig b/arch/powerpc/configs/44x/fsp2_defconfig
index 30845ce0885a..8da316e61a08 100644
--- a/arch/powerpc/configs/44x/fsp2_defconfig
+++ b/arch/powerpc/configs/44x/fsp2_defconfig
@@ -17,7 +17,6 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_BPF_SYSCALL=y
 CONFIG_EMBEDDED=y
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/powerpc/configs/44x/iss476-smp_defconfig b/arch/powerpc/configs/44x/iss476-smp_defconfig
index 2c3834eebca3..c11e777b2f3d 100644
--- a/arch/powerpc/configs/44x/iss476-smp_defconfig
+++ b/arch/powerpc/configs/44x/iss476-smp_defconfig
@@ -7,7 +7,6 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/powerpc/configs/cell_defconfig b/arch/powerpc/configs/cell_defconfig
index 42fbc70cec33..cc2c0d51f493 100644
--- a/arch/powerpc/configs/cell_defconfig
+++ b/arch/powerpc/configs/cell_defconfig
@@ -14,7 +14,6 @@ CONFIG_CPUSETS=y
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=m
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
index 1de0dbf6cbba..63d611cc160f 100644
--- a/arch/powerpc/configs/g5_defconfig
+++ b/arch/powerpc/configs/g5_defconfig
@@ -12,7 +12,6 @@ CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
diff --git a/arch/powerpc/configs/maple_defconfig b/arch/powerpc/configs/maple_defconfig
index 161351a18517..9424c1e67e1c 100644
--- a/arch/powerpc/configs/maple_defconfig
+++ b/arch/powerpc/configs/maple_defconfig
@@ -9,7 +9,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=m
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/powerpc/configs/pasemi_defconfig b/arch/powerpc/configs/pasemi_defconfig
index 15ed8d0aa014..78606b7e42df 100644
--- a/arch/powerpc/configs/pasemi_defconfig
+++ b/arch/powerpc/configs/pasemi_defconfig
@@ -7,7 +7,6 @@ CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 665a8d7cded0..7aefac5afab0 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -10,7 +10,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index 60a30fffeda0..2c87e856d839 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -30,7 +30,6 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_BPF_SYSCALL=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=m
 CONFIG_KPROBES=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 48759656a067..4f05a6652478 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -62,7 +62,6 @@ CONFIG_VIRTUALIZATION=y
 CONFIG_KVM_BOOK3S_64=m
 CONFIG_KVM_BOOK3S_64_HV=m
 CONFIG_VHOST_NET=m
-CONFIG_OPROFILE=m
 CONFIG_KPROBES=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
diff --git a/arch/powerpc/configs/ppc64e_defconfig b/arch/powerpc/configs/ppc64e_defconfig
index 33a01a9e86be..5cf49a515f8e 100644
--- a/arch/powerpc/configs/ppc64e_defconfig
+++ b/arch/powerpc/configs/ppc64e_defconfig
@@ -14,7 +14,6 @@ CONFIG_CPUSETS=y
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index ef09f3cce1fa..10c055eaebf0 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -19,7 +19,6 @@ CONFIG_USER_NS=y
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=m
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/powerpc/configs/ps3_defconfig b/arch/powerpc/configs/ps3_defconfig
index 142f1321fa58..f300dcb937cc 100644
--- a/arch/powerpc/configs/ps3_defconfig
+++ b/arch/powerpc/configs/ps3_defconfig
@@ -13,7 +13,6 @@ CONFIG_EMBEDDED=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=m
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_PPC_POWERNV is not set
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index d5dece981c02..777221775c83 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -29,7 +29,6 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_BPF_SYSCALL=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
-CONFIG_OPROFILE=m
 CONFIG_KPROBES=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 5f21a5bab467..e85c849214a2 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -17,16 +17,6 @@ struct cpu_spec;
 typedef	void (*cpu_setup_t)(unsigned long offset, struct cpu_spec* spec);
 typedef	void (*cpu_restore_t)(void);
 
-enum powerpc_oprofile_type {
-	PPC_OPROFILE_INVALID = 0,
-	PPC_OPROFILE_RS64 = 1,
-	PPC_OPROFILE_POWER4 = 2,
-	PPC_OPROFILE_G4 = 3,
-	PPC_OPROFILE_FSL_EMB = 4,
-	PPC_OPROFILE_CELL = 5,
-	PPC_OPROFILE_PA6T = 6,
-};
-
 enum powerpc_pmc_type {
 	PPC_PMC_DEFAULT = 0,
 	PPC_PMC_IBM = 1,
@@ -83,16 +73,6 @@ struct cpu_spec {
 	/* Used by oprofile userspace to select the right counters */
 	char		*oprofile_cpu_type;
 
-	/* Processor specific oprofile operations */
-	enum powerpc_oprofile_type oprofile_type;
-
-	/* Bit locations inside the mmcra change */
-	unsigned long	oprofile_mmcra_sihv;
-	unsigned long	oprofile_mmcra_sipr;
-
-	/* Bits to clear during an oprofile exception */
-	unsigned long	oprofile_mmcra_clear;
-
 	/* Name of processor class, for the ELF AT_PLATFORM entry */
 	char		*platform;
 
diff --git a/arch/powerpc/include/asm/oprofile_impl.h b/arch/powerpc/include/asm/oprofile_impl.h
deleted file mode 100644
index 2a166c297f97..000000000000
--- a/arch/powerpc/include/asm/oprofile_impl.h
+++ /dev/null
@@ -1,135 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2004 Anton Blanchard <anton@au.ibm.com>, IBM
- *
- * Based on alpha version.
- */
-
-#ifndef _ASM_POWERPC_OPROFILE_IMPL_H
-#define _ASM_POWERPC_OPROFILE_IMPL_H
-#ifdef __KERNEL__
-
-#define OP_MAX_COUNTER 8
-
-/* Per-counter configuration as set via oprofilefs.  */
-struct op_counter_config {
-	unsigned long enabled;
-	unsigned long event;
-	unsigned long count;
-	/* Classic doesn't support per-counter user/kernel selection */
-	unsigned long kernel;
-	unsigned long user;
-	unsigned long unit_mask;
-};
-
-/* System-wide configuration as set via oprofilefs.  */
-struct op_system_config {
-#ifdef CONFIG_PPC64
-	unsigned long mmcr0;
-	unsigned long mmcr1;
-	unsigned long mmcra;
-#ifdef CONFIG_OPROFILE_CELL
-	/* Register for oprofile user tool to check cell kernel profiling
-	 * support.
-	 */
-	unsigned long cell_support;
-#endif
-#endif
-	unsigned long enable_kernel;
-	unsigned long enable_user;
-};
-
-/* Per-arch configuration */
-struct op_powerpc_model {
-	int (*reg_setup) (struct op_counter_config *,
-			   struct op_system_config *,
-			   int num_counters);
-	int  (*cpu_setup) (struct op_counter_config *);
-	int  (*start) (struct op_counter_config *);
-	int  (*global_start) (struct op_counter_config *);
-	void (*stop) (void);
-	void (*global_stop) (void);
-	int (*sync_start)(void);
-	int (*sync_stop)(void);
-	void (*handle_interrupt) (struct pt_regs *,
-				  struct op_counter_config *);
-	int num_counters;
-};
-
-extern struct op_powerpc_model op_model_fsl_emb;
-extern struct op_powerpc_model op_model_power4;
-extern struct op_powerpc_model op_model_7450;
-extern struct op_powerpc_model op_model_cell;
-extern struct op_powerpc_model op_model_pa6t;
-
-
-/* All the classic PPC parts use these */
-static inline unsigned int classic_ctr_read(unsigned int i)
-{
-	switch(i) {
-	case 0:
-		return mfspr(SPRN_PMC1);
-	case 1:
-		return mfspr(SPRN_PMC2);
-	case 2:
-		return mfspr(SPRN_PMC3);
-	case 3:
-		return mfspr(SPRN_PMC4);
-	case 4:
-		return mfspr(SPRN_PMC5);
-	case 5:
-		return mfspr(SPRN_PMC6);
-
-/* No PPC32 chip has more than 6 so far */
-#ifdef CONFIG_PPC64
-	case 6:
-		return mfspr(SPRN_PMC7);
-	case 7:
-		return mfspr(SPRN_PMC8);
-#endif
-	default:
-		return 0;
-	}
-}
-
-static inline void classic_ctr_write(unsigned int i, unsigned int val)
-{
-	switch(i) {
-	case 0:
-		mtspr(SPRN_PMC1, val);
-		break;
-	case 1:
-		mtspr(SPRN_PMC2, val);
-		break;
-	case 2:
-		mtspr(SPRN_PMC3, val);
-		break;
-	case 3:
-		mtspr(SPRN_PMC4, val);
-		break;
-	case 4:
-		mtspr(SPRN_PMC5, val);
-		break;
-	case 5:
-		mtspr(SPRN_PMC6, val);
-		break;
-
-/* No PPC32 chip has more than 6, yet */
-#ifdef CONFIG_PPC64
-	case 6:
-		mtspr(SPRN_PMC7, val);
-		break;
-	case 7:
-		mtspr(SPRN_PMC8, val);
-		break;
-#endif
-	default:
-		break;
-	}
-}
-
-
-extern void op_powerpc_backtrace(struct pt_regs * const regs, unsigned int depth);
-
-#endif /* __KERNEL__ */
-#endif /* _ASM_POWERPC_OPROFILE_IMPL_H */
diff --git a/arch/powerpc/include/asm/spu.h b/arch/powerpc/include/asm/spu.h
index 9666491bcb8a..8a2d11ba0dae 100644
--- a/arch/powerpc/include/asm/spu.h
+++ b/arch/powerpc/include/asm/spu.h
@@ -201,20 +201,6 @@ int spu_64k_pages_available(void);
 struct mm_struct;
 extern void spu_flush_all_slbs(struct mm_struct *mm);
 
-/* This interface allows a profiler (e.g., OProfile) to store a ref
- * to spu context information that it creates.	This caching technique
- * avoids the need to recreate this information after a save/restore operation.
- *
- * Assumes the caller has already incremented the ref count to
- * profile_info; then spu_context_destroy must call kref_put
- * on prof_info_kref.
- */
-void spu_set_profile_private_kref(struct spu_context *ctx,
-				  struct kref *prof_info_kref,
-				  void ( * prof_info_release) (struct kref *kref));
-
-void *spu_get_profile_private_kref(struct spu_context *ctx);
-
 /* system callbacks from the SPU */
 struct spu_syscall_block {
 	u64 nr_ret;
@@ -266,25 +252,6 @@ void spu_remove_dev_attr(struct device_attribute *attr);
 int spu_add_dev_attr_group(struct attribute_group *attrs);
 void spu_remove_dev_attr_group(struct attribute_group *attrs);
 
-/*
- * Notifier blocks:
- *
- * oprofile can get notified when a context switch is performed
- * on an spe. The notifer function that gets called is passed
- * a pointer to the SPU structure as well as the object-id that
- * identifies the binary running on that SPU now.
- *
- * For a context save, the object-id that is passed is zero,
- * identifying that the kernel will run from that moment on.
- *
- * For a context restore, the object-id is the value written
- * to object-id spufs file from user space and the notifer
- * function can assume that spu->ctx is valid.
- */
-struct notifier_block;
-int spu_switch_event_register(struct notifier_block * n);
-int spu_switch_event_unregister(struct notifier_block * n);
-
 extern void notify_spus_active(void);
 extern void do_notify_spus_active(void);
 
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 65f35ec052d4..ae0fdef0ac11 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -13,7 +13,6 @@
 #include <linux/export.h>
 #include <linux/jump_label.h>
 
-#include <asm/oprofile_impl.h>
 #include <asm/cputable.h>
 #include <asm/prom.h>		/* for PTRRELOC on ARCH=ppc */
 #include <asm/mce.h>
@@ -151,7 +150,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_ppc970,
 		.cpu_restore		= __restore_cpu_ppc970,
 		.oprofile_cpu_type	= "ppc64/970",
-		.oprofile_type		= PPC_OPROFILE_POWER4,
 		.platform		= "ppc970",
 	},
 	{	/* PPC970FX */
@@ -169,7 +167,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_ppc970,
 		.cpu_restore		= __restore_cpu_ppc970,
 		.oprofile_cpu_type	= "ppc64/970",
-		.oprofile_type		= PPC_OPROFILE_POWER4,
 		.platform		= "ppc970",
 	},
 	{	/* PPC970MP DD1.0 - no DEEPNAP, use regular 970 init */
@@ -187,7 +184,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_ppc970,
 		.cpu_restore		= __restore_cpu_ppc970,
 		.oprofile_cpu_type	= "ppc64/970MP",
-		.oprofile_type		= PPC_OPROFILE_POWER4,
 		.platform		= "ppc970",
 	},
 	{	/* PPC970MP */
@@ -205,7 +201,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_ppc970MP,
 		.cpu_restore		= __restore_cpu_ppc970,
 		.oprofile_cpu_type	= "ppc64/970MP",
-		.oprofile_type		= PPC_OPROFILE_POWER4,
 		.platform		= "ppc970",
 	},
 	{	/* PPC970GX */
@@ -222,7 +217,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_IBM,
 		.cpu_setup		= __setup_cpu_ppc970,
 		.oprofile_cpu_type	= "ppc64/970",
-		.oprofile_type		= PPC_OPROFILE_POWER4,
 		.platform		= "ppc970",
 	},
 	{	/* Power5 GR */
@@ -237,12 +231,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
 		.oprofile_cpu_type	= "ppc64/power5",
-		.oprofile_type		= PPC_OPROFILE_POWER4,
-		/* SIHV / SIPR bits are implemented on POWER4+ (GQ)
-		 * and above but only works on POWER5 and above
-		 */
-		.oprofile_mmcra_sihv	= MMCRA_SIHV,
-		.oprofile_mmcra_sipr	= MMCRA_SIPR,
 		.platform		= "power5",
 	},
 	{	/* Power5++ */
@@ -256,9 +244,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 128,
 		.num_pmcs		= 6,
 		.oprofile_cpu_type	= "ppc64/power5++",
-		.oprofile_type		= PPC_OPROFILE_POWER4,
-		.oprofile_mmcra_sihv	= MMCRA_SIHV,
-		.oprofile_mmcra_sipr	= MMCRA_SIPR,
 		.platform		= "power5+",
 	},
 	{	/* Power5 GS */
@@ -273,9 +258,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
 		.oprofile_cpu_type	= "ppc64/power5+",
-		.oprofile_type		= PPC_OPROFILE_POWER4,
-		.oprofile_mmcra_sihv	= MMCRA_SIHV,
-		.oprofile_mmcra_sipr	= MMCRA_SIPR,
 		.platform		= "power5+",
 	},
 	{	/* POWER6 in P5+ mode; 2.04-compliant processor */
@@ -288,7 +270,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 128,
 		.dcache_bsize		= 128,
 		.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
-		.oprofile_type		= PPC_OPROFILE_POWER4,
 		.platform		= "power5+",
 	},
 	{	/* Power6 */
@@ -304,11 +285,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
 		.oprofile_cpu_type	= "ppc64/power6",
-		.oprofile_type		= PPC_OPROFILE_POWER4,
-		.oprofile_mmcra_sihv	= POWER6_MMCRA_SIHV,
-		.oprofile_mmcra_sipr	= POWER6_MMCRA_SIPR,
-		.oprofile_mmcra_clear	= POWER6_MMCRA_THRM |
-			POWER6_MMCRA_OTHER,
 		.platform		= "power6x",
 	},
 	{	/* 2.05-compliant processor, i.e. Power6 "architected" mode */
@@ -321,7 +297,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.icache_bsize		= 128,
 		.dcache_bsize		= 128,
 		.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
-		.oprofile_type		= PPC_OPROFILE_POWER4,
 		.platform		= "power6",
 	},
 	{	/* 2.06-compliant processor, i.e. Power7 "architected" mode */
@@ -334,7 +309,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.mmu_features		= MMU_FTRS_POWER7,
 		.icache_bsize		= 128,
 		.dcache_bsize		= 128,
-		.oprofile_type		= PPC_OPROFILE_POWER4,
 		.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
 		.cpu_setup		= __setup_cpu_power7,
 		.cpu_restore		= __restore_cpu_power7,
@@ -351,7 +325,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.mmu_features		= MMU_FTRS_POWER8,
 		.icache_bsize		= 128,
 		.dcache_bsize		= 128,
-		.oprofile_type		= PPC_OPROFILE_INVALID,
 		.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
 		.cpu_setup		= __setup_cpu_power8,
 		.cpu_restore		= __restore_cpu_power8,
@@ -368,7 +341,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.mmu_features		= MMU_FTRS_POWER9,
 		.icache_bsize		= 128,
 		.dcache_bsize		= 128,
-		.oprofile_type		= PPC_OPROFILE_INVALID,
 		.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
 		.cpu_setup		= __setup_cpu_power9,
 		.cpu_restore		= __restore_cpu_power9,
@@ -384,7 +356,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.mmu_features		= MMU_FTRS_POWER10,
 		.icache_bsize		= 128,
 		.dcache_bsize		= 128,
-		.oprofile_type		= PPC_OPROFILE_INVALID,
 		.oprofile_cpu_type	= "ppc64/ibm-compat-v1",
 		.cpu_setup		= __setup_cpu_power10,
 		.cpu_restore		= __restore_cpu_power10,
@@ -403,7 +374,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
 		.oprofile_cpu_type	= "ppc64/power7",
-		.oprofile_type		= PPC_OPROFILE_POWER4,
 		.cpu_setup		= __setup_cpu_power7,
 		.cpu_restore		= __restore_cpu_power7,
 		.machine_check_early	= __machine_check_early_realmode_p7,
@@ -422,7 +392,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
 		.oprofile_cpu_type	= "ppc64/power7",
-		.oprofile_type		= PPC_OPROFILE_POWER4,
 		.cpu_setup		= __setup_cpu_power7,
 		.cpu_restore		= __restore_cpu_power7,
 		.machine_check_early	= __machine_check_early_realmode_p7,
@@ -441,7 +410,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
 		.oprofile_cpu_type	= "ppc64/power8",
-		.oprofile_type		= PPC_OPROFILE_INVALID,
 		.cpu_setup		= __setup_cpu_power8,
 		.cpu_restore		= __restore_cpu_power8,
 		.machine_check_early	= __machine_check_early_realmode_p8,
@@ -460,7 +428,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
 		.oprofile_cpu_type	= "ppc64/power8",
-		.oprofile_type		= PPC_OPROFILE_INVALID,
 		.cpu_setup		= __setup_cpu_power8,
 		.cpu_restore		= __restore_cpu_power8,
 		.machine_check_early	= __machine_check_early_realmode_p8,
@@ -479,7 +446,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
 		.oprofile_cpu_type	= "ppc64/power8",
-		.oprofile_type		= PPC_OPROFILE_INVALID,
 		.cpu_setup		= __setup_cpu_power8,
 		.cpu_restore		= __restore_cpu_power8,
 		.machine_check_early	= __machine_check_early_realmode_p8,
@@ -498,7 +464,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
 		.oprofile_cpu_type	= "ppc64/power9",
-		.oprofile_type		= PPC_OPROFILE_INVALID,
 		.cpu_setup		= __setup_cpu_power9,
 		.cpu_restore		= __restore_cpu_power9,
 		.machine_check_early	= __machine_check_early_realmode_p9,
@@ -517,7 +482,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
 		.oprofile_cpu_type	= "ppc64/power9",
-		.oprofile_type		= PPC_OPROFILE_INVALID,
 		.cpu_setup		= __setup_cpu_power9,
 		.cpu_restore		= __restore_cpu_power9,
 		.machine_check_early	= __machine_check_early_realmode_p9,
@@ -536,7 +500,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
 		.oprofile_cpu_type	= "ppc64/power9",
-		.oprofile_type		= PPC_OPROFILE_INVALID,
 		.cpu_setup		= __setup_cpu_power9,
 		.cpu_restore		= __restore_cpu_power9,
 		.machine_check_early	= __machine_check_early_realmode_p9,
@@ -555,7 +518,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_IBM,
 		.oprofile_cpu_type	= "ppc64/power10",
-		.oprofile_type		= PPC_OPROFILE_INVALID,
 		.cpu_setup		= __setup_cpu_power10,
 		.cpu_restore		= __restore_cpu_power10,
 		.machine_check_early	= __machine_check_early_realmode_p10,
@@ -575,7 +537,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.num_pmcs		= 4,
 		.pmc_type		= PPC_PMC_IBM,
 		.oprofile_cpu_type	= "ppc64/cell-be",
-		.oprofile_type		= PPC_OPROFILE_CELL,
 		.platform		= "ppc-cell-be",
 	},
 	{	/* PA Semi PA6T */
@@ -592,7 +553,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.cpu_setup		= __setup_cpu_pa6t,
 		.cpu_restore		= __restore_cpu_pa6t,
 		.oprofile_cpu_type	= "ppc64/pa6t",
-		.oprofile_type		= PPC_OPROFILE_PA6T,
 		.platform		= "pa6t",
 	},
 	{	/* default match */
@@ -757,7 +717,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc750",
 		.oprofile_cpu_type      = "ppc/750",
-		.oprofile_type		= PPC_OPROFILE_G4,
 	},
 	{	/* 745/755 */
 		.pvr_mask		= 0xfffff000,
@@ -789,7 +748,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc750",
 		.oprofile_cpu_type      = "ppc/750",
-		.oprofile_type		= PPC_OPROFILE_G4,
 	},
 	{	/* 750FX rev 2.0 must disable HID0[DPM] */
 		.pvr_mask		= 0xffffffff,
@@ -806,7 +764,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc750",
 		.oprofile_cpu_type      = "ppc/750",
-		.oprofile_type		= PPC_OPROFILE_G4,
 	},
 	{	/* 750FX (All revs except 2.0) */
 		.pvr_mask		= 0xffff0000,
@@ -823,7 +780,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc750",
 		.oprofile_cpu_type      = "ppc/750",
-		.oprofile_type		= PPC_OPROFILE_G4,
 	},
 	{	/* 750GX */
 		.pvr_mask		= 0xffff0000,
@@ -840,7 +796,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc750",
 		.oprofile_cpu_type      = "ppc/750",
-		.oprofile_type		= PPC_OPROFILE_G4,
 	},
 	{	/* 740/750 (L2CR bit need fixup for 740) */
 		.pvr_mask		= 0xffff0000,
@@ -919,7 +874,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
 		.oprofile_cpu_type      = "ppc/7450",
-		.oprofile_type		= PPC_OPROFILE_G4,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -937,7 +891,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
 		.oprofile_cpu_type      = "ppc/7450",
-		.oprofile_type		= PPC_OPROFILE_G4,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -955,7 +908,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
 		.oprofile_cpu_type      = "ppc/7450",
-		.oprofile_type		= PPC_OPROFILE_G4,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -973,7 +925,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
 		.oprofile_cpu_type      = "ppc/7450",
-		.oprofile_type		= PPC_OPROFILE_G4,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -991,7 +942,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
 		.oprofile_cpu_type      = "ppc/7450",
-		.oprofile_type		= PPC_OPROFILE_G4,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -1009,7 +959,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
 		.oprofile_cpu_type      = "ppc/7450",
-		.oprofile_type		= PPC_OPROFILE_G4,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -1027,7 +976,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
 		.oprofile_cpu_type      = "ppc/7450",
-		.oprofile_type		= PPC_OPROFILE_G4,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -1045,7 +993,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
 		.oprofile_cpu_type      = "ppc/7450",
-		.oprofile_type		= PPC_OPROFILE_G4,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -1062,7 +1009,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
 		.oprofile_cpu_type      = "ppc/7450",
-		.oprofile_type		= PPC_OPROFILE_G4,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -1080,7 +1026,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
 		.oprofile_cpu_type      = "ppc/7450",
-		.oprofile_type		= PPC_OPROFILE_G4,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -1098,7 +1043,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
 		.oprofile_cpu_type      = "ppc/7450",
-		.oprofile_type		= PPC_OPROFILE_G4,
 		.machine_check		= machine_check_generic,
 		.platform		= "ppc7450",
 	},
@@ -1211,7 +1155,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_83xx,
 		.num_pmcs		= 4,
 		.oprofile_cpu_type	= "ppc/e300",
-		.oprofile_type		= PPC_OPROFILE_FSL_EMB,
 		.platform		= "ppc603",
 	},
 	{	/* e300c4 (e300c1, plus one IU) */
@@ -1228,7 +1171,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.machine_check		= machine_check_83xx,
 		.num_pmcs		= 4,
 		.oprofile_cpu_type	= "ppc/e300",
-		.oprofile_type		= PPC_OPROFILE_FSL_EMB,
 		.platform		= "ppc603",
 	},
 #endif
@@ -1925,7 +1867,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 32,
 		.num_pmcs		= 4,
 		.oprofile_cpu_type	= "ppc/e500",
-		.oprofile_type		= PPC_OPROFILE_FSL_EMB,
 		.cpu_setup		= __setup_cpu_e500v1,
 		.machine_check		= machine_check_e500,
 		.platform		= "ppc8540",
@@ -1945,7 +1886,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 32,
 		.num_pmcs		= 4,
 		.oprofile_cpu_type	= "ppc/e500",
-		.oprofile_type		= PPC_OPROFILE_FSL_EMB,
 		.cpu_setup		= __setup_cpu_e500v2,
 		.machine_check		= machine_check_e500,
 		.platform		= "ppc8548",
@@ -1965,7 +1905,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 64,
 		.num_pmcs		= 4,
 		.oprofile_cpu_type	= "ppc/e500mc",
-		.oprofile_type		= PPC_OPROFILE_FSL_EMB,
 		.cpu_setup		= __setup_cpu_e500mc,
 		.machine_check		= machine_check_e500mc,
 		.platform		= "ppce500mc",
@@ -1987,7 +1926,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 64,
 		.num_pmcs		= 4,
 		.oprofile_cpu_type	= "ppc/e500mc",
-		.oprofile_type		= PPC_OPROFILE_FSL_EMB,
 		.cpu_setup		= __setup_cpu_e5500,
 #ifndef CONFIG_PPC32
 		.cpu_restore		= __restore_cpu_e5500,
@@ -2010,7 +1948,6 @@ static struct cpu_spec __initdata cpu_specs[] = {
 		.dcache_bsize		= 64,
 		.num_pmcs		= 6,
 		.oprofile_cpu_type	= "ppc/e6500",
-		.oprofile_type		= PPC_OPROFILE_FSL_EMB,
 		.cpu_setup		= __setup_cpu_e6500,
 #ifndef CONFIG_PPC32
 		.cpu_restore		= __restore_cpu_e6500,
@@ -2076,10 +2013,6 @@ static struct cpu_spec * __init setup_cpu_spec(unsigned long offset,
 	if (old.num_pmcs && !s->num_pmcs) {
 		t->num_pmcs = old.num_pmcs;
 		t->pmc_type = old.pmc_type;
-		t->oprofile_type = old.oprofile_type;
-		t->oprofile_mmcra_sihv = old.oprofile_mmcra_sihv;
-		t->oprofile_mmcra_sipr = old.oprofile_mmcra_sipr;
-		t->oprofile_mmcra_clear = old.oprofile_mmcra_clear;
 
 		/*
 		 * If we have passed through this logic once before and
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index b5478b72c08c..358aee7c2d79 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -19,7 +19,6 @@
 #include <asm/dt_cpu_ftrs.h>
 #include <asm/mce.h>
 #include <asm/mmu.h>
-#include <asm/oprofile_impl.h>
 #include <asm/prom.h>
 #include <asm/setup.h>
 
@@ -103,7 +102,6 @@ static struct cpu_spec __initdata base_cpu_spec = {
 	.num_pmcs		= 0,
 	.pmc_type		= PPC_PMC_DEFAULT,
 	.oprofile_cpu_type	= NULL,
-	.oprofile_type		= PPC_OPROFILE_INVALID,
 	.cpu_setup		= NULL,
 	.cpu_restore		= __restore_cpu_cpufeatures,
 	.machine_check_early	= NULL,
diff --git a/arch/powerpc/platforms/cell/Kconfig b/arch/powerpc/platforms/cell/Kconfig
index f2ff359041ee..e7c976bcadff 100644
--- a/arch/powerpc/platforms/cell/Kconfig
+++ b/arch/powerpc/platforms/cell/Kconfig
@@ -100,8 +100,3 @@ config CBE_CPUFREQ_SPU_GOVERNOR
 	  the minimal possible frequency.
 
 endmenu
-
-config OPROFILE_CELL
-	def_bool y
-	depends on PPC_CELL_NATIVE && (OPROFILE = m || OPROFILE = y) && SPU_BASE
-
diff --git a/arch/powerpc/platforms/cell/spu_notify.c b/arch/powerpc/platforms/cell/spu_notify.c
deleted file mode 100644
index 67870abf3715..000000000000
--- a/arch/powerpc/platforms/cell/spu_notify.c
+++ /dev/null
@@ -1,55 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Move OProfile dependencies from spufs module to the kernel so it
- * can run on non-cell PPC.
- *
- * Copyright (C) IBM 2005
- */
-
-#undef DEBUG
-
-#include <linux/export.h>
-#include <linux/notifier.h>
-#include <asm/spu.h>
-#include "spufs/spufs.h"
-
-static BLOCKING_NOTIFIER_HEAD(spu_switch_notifier);
-
-void spu_switch_notify(struct spu *spu, struct spu_context *ctx)
-{
-	blocking_notifier_call_chain(&spu_switch_notifier,
-				     ctx ? ctx->object_id : 0, spu);
-}
-EXPORT_SYMBOL_GPL(spu_switch_notify);
-
-int spu_switch_event_register(struct notifier_block *n)
-{
-	int ret;
-	ret = blocking_notifier_chain_register(&spu_switch_notifier, n);
-	if (!ret)
-		notify_spus_active();
-	return ret;
-}
-EXPORT_SYMBOL_GPL(spu_switch_event_register);
-
-int spu_switch_event_unregister(struct notifier_block *n)
-{
-	return blocking_notifier_chain_unregister(&spu_switch_notifier, n);
-}
-EXPORT_SYMBOL_GPL(spu_switch_event_unregister);
-
-void spu_set_profile_private_kref(struct spu_context *ctx,
-				  struct kref *prof_info_kref,
-				  void (* prof_info_release) (struct kref *kref))
-{
-	ctx->prof_priv_kref = prof_info_kref;
-	ctx->prof_priv_release = prof_info_release;
-}
-EXPORT_SYMBOL_GPL(spu_set_profile_private_kref);
-
-void *spu_get_profile_private_kref(struct spu_context *ctx)
-{
-	return ctx->prof_priv_kref;
-}
-EXPORT_SYMBOL_GPL(spu_get_profile_private_kref);
-
diff --git a/arch/powerpc/platforms/cell/spufs/run.c b/arch/powerpc/platforms/cell/spufs/run.c
index 3f2380f40f99..466006918003 100644
--- a/arch/powerpc/platforms/cell/spufs/run.c
+++ b/arch/powerpc/platforms/cell/spufs/run.c
@@ -389,10 +389,8 @@ long spufs_run_spu(struct spu_context *ctx, u32 *npc, u32 *event)
 		spu = ctx->spu;
 		if (unlikely(test_and_clear_bit(SPU_SCHED_NOTIFY_ACTIVE,
 						&ctx->sched_flags))) {
-			if (!(status & SPU_STATUS_STOPPED_BY_STOP)) {
-				spu_switch_notify(spu, ctx);
+			if (!(status & SPU_STATUS_STOPPED_BY_STOP))
 				continue;
-			}
 		}
 
 		spuctx_switch_state(ctx, SPU_UTIL_SYSTEM);
diff --git a/arch/powerpc/platforms/cell/spufs/sched.c b/arch/powerpc/platforms/cell/spufs/sched.c
index f18d5067cd0f..9d06fffb1526 100644
--- a/arch/powerpc/platforms/cell/spufs/sched.c
+++ b/arch/powerpc/platforms/cell/spufs/sched.c
@@ -181,9 +181,6 @@ void do_notify_spus_active(void)
 
 	/*
 	 * Wake up the active spu_contexts.
-	 *
-	 * When the awakened processes see their "notify_active" flag is set,
-	 * they will call spu_switch_notify().
 	 */
 	for_each_online_node(node) {
 		struct spu *spu;
@@ -239,7 +236,6 @@ static void spu_bind_context(struct spu *spu, struct spu_context *ctx)
 	spu_switch_log_notify(spu, ctx, SWITCH_LOG_START, 0);
 	spu_restore(&ctx->csa, spu);
 	spu->timestamp = jiffies;
-	spu_switch_notify(spu, ctx);
 	ctx->state = SPU_STATE_RUNNABLE;
 
 	spuctx_switch_state(ctx, SPU_UTIL_USER);
@@ -440,7 +436,6 @@ static void spu_unbind_context(struct spu *spu, struct spu_context *ctx)
 		 */
 		atomic_dec_if_positive(&ctx->gang->aff_sched_count);
 
-	spu_switch_notify(spu, NULL);
 	spu_unmap_mappings(ctx);
 	spu_save(&ctx->csa, spu);
 	spu_switch_log_notify(spu, ctx, SWITCH_LOG_STOP, 0);
diff --git a/arch/powerpc/platforms/cell/spufs/spufs.h b/arch/powerpc/platforms/cell/spufs/spufs.h
index 1ba4d884febf..afc1d6604d12 100644
--- a/arch/powerpc/platforms/cell/spufs/spufs.h
+++ b/arch/powerpc/platforms/cell/spufs/spufs.h
@@ -281,7 +281,6 @@ void spu_del_from_rq(struct spu_context *ctx);
 int spu_activate(struct spu_context *ctx, unsigned long flags);
 void spu_deactivate(struct spu_context *ctx);
 void spu_yield(struct spu_context *ctx);
-void spu_switch_notify(struct spu *spu, struct spu_context *ctx);
 void spu_switch_log_notify(struct spu *spu, struct spu_context *ctx,
 		u32 type, u32 val);
 void spu_set_timeslice(struct spu_context *ctx);
-- 
2.25.0.rc1.19.g042ed3e048af

