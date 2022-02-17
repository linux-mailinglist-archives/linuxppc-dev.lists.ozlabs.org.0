Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA4B4B9993
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 08:05:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jzm7061zRz3cM5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 18:05:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jBb9JgmY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jBb9JgmY; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jzm6N2qWQz30Ds
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 18:04:42 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id
 q11-20020a17090a304b00b001b94d25eaecso4559211pjl.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 23:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wHTGz3UI0s3/mIUVtvGK4XbGoiJiaa/KEciiA3YgVco=;
 b=jBb9JgmY83eUJiCnllTSZwSqTR9g3z64M6da5PlkMwZZj5/dXnUHfin6uFj/TxVtjK
 vNG+ZWjODx1F2t1a4XCMBXIFW5Nfgpwi9bIeNHFMIbSmI0FkMHm6EauSSKKycxB24Qs5
 1lansDJMEaiIvzVKEZilluqb14cziPjKc7X9+lYKxbukR5aRJIdSRpbj9Z39C2AWe3lI
 Sl79RGLCl+tm+tgNJNVRX8gDTiSxdJ3+ovFYSxsqxNt2+HcAMU4LM2Yb/LEy8JJ4J06f
 N2c+7u1q24RbgkxkmxWpbeDDc8dVV4XKtvrzPU9Gfr9pIBY0zJCd98sVm0OUxeLLWd2d
 iO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wHTGz3UI0s3/mIUVtvGK4XbGoiJiaa/KEciiA3YgVco=;
 b=4BuruzYZb/zvGii84Pa1sUilJQLqBMp6yFoUJlbtNjW0CSWFaUK0wNSsIOrZFDVM8z
 OOBSTIn1b5oSV/1kSPP7p+VHrA14A5dW7qhYrLANIAFx64F0SkCmvH54sZt4Ol2jc3Ax
 1YRqP0rGSS6MsUSnsIBOjDik8vV/uqsHP/BCgoZSxFGcZ4ZrrgrfXLaTo2xkzgxiR83x
 YGUqKA02ZszeBjPKhPljSwGlYX4OhRM2z9c768hOLsad8OzN/1qEHYISjRbtchjtnBql
 LShaTjVSLGs6VzqMoXnWp8PQllLGjUmPR6wndE/0K9KX8uTBA5o3HlP42Af8WtZFosJE
 pvAw==
X-Gm-Message-State: AOAM532NA1zejHy4Wh1SXmbIbMPTAfvwUbIqydVJimGaGU+/yUg+gX+i
 oqUX2xkOw94hVC/+vytwIMoXsY4VUbs=
X-Google-Smtp-Source: ABdhPJzfJIxxjJwYvZbVNmPbQUaCQTjHGfgxlPpBuLWWNqP0QfokGYJifeUqhkY3JbsThHHedyhbEg==
X-Received: by 2002:a17:902:ab1d:b0:14d:7f2d:a3ab with SMTP id
 ik29-20020a170902ab1d00b0014d7f2da3abmr1635131plb.169.1645081477862; 
 Wed, 16 Feb 2022 23:04:37 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id u8sm4449410pgf.83.2022.02.16.23.04.35
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 23:04:36 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] powerpc: Implement hotplug smt control
Date: Thu, 17 Feb 2022 17:34:19 +1030
Message-Id: <20220217070419.351683-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
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

x86 added a control for turning SMT on and off in commit 05736e4ac13c
("cpu/hotplug: Provide knobs to control SMT").

Implement this for powerpc as an alternative to the currently method of
iterating through /sys/devices/system/cpu/cpuN/online for every CPU.

  # ppc64_cpu --info
  Core   0:    0*    1*    2*    3*    4*    5*    6*    7*
  Core   1:    8*    9*   10*   11*   12*   13*   14*   15*
  # grep . /sys/devices/system/cpu/smt/*
  /sys/devices/system/cpu/smt/active:1
  /sys/devices/system/cpu/smt/control:on
  # echo off > /sys/devices/system/cpu/smt/control
  # ppc64_cpu --info
  Core   0:    0*    1     2     3     4     5     6     7
  Core   1:    8*    9    10    11    12    13    14    15
  # grep . /sys/devices/system/cpu/smt/*
  /sys/devices/system/cpu/smt/active:0
  /sys/devices/system/cpu/smt/control:off

Signed-off-by: Joel Stanley <joel@jms.id.au>
---

This is a RFC as there are bugs:

 - Booting with nosmt results in a WARN for every sibling thread

    smp: Bringing up secondary CPUs ...
    CPU UP failed (-125) CPU 1 state (null) (151)
    ------------[ cut here ]------------
    WARNING: CPU: 0 PID: 1 at kernel/cpu.c:711 _cpu_up+0x304/0x310
    Modules linked in:
    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.17.0-rc4-00055-g2db720040f59-dirty #8
    ...
    NIP [c000000000136ac4] _cpu_up+0x304/0x310
    LR [c000000000136ac4] _cpu_up+0x304/0x310
    Call Trace:
    [c000000008503ab0] [c000000000136ac4] _cpu_up+0x304/0x310 (unreliable)
    [c000000008503b60] [c000000000136be4] cpu_up+0x114/0x1b0
    [c000000008503c00] [c000000000137538] bringup_nonboot_cpus+0xb8/0x110
    [c000000008503c60] [c000000002031838] smp_init+0x48/0xd4
    [c000000008503cc0] [c0000000020048f4] kernel_init_freeable+0x20c/0x3dc
    [c000000008503da0] [c0000000000127a4] kernel_init+0x34/0x1a0
    [c000000008503e10] [c00000000000cd64] ret_from_kernel_thread+0x5c/0x64
    Instruction dump:
    1d270028 7cca482a 48089689 60000000 7ec4b378 7f03c378 4bffd45d 7ec6b378
    7f05c378 7f84e378 38600000 4bffe919 <0b030000> eac10060 4bfffe64 3c4c0271
    ---[ end trace 0000000000000000 ]---

    and then you can get a BUG at runtime if you fiddle with the online
    state:

    # ppc64_cpu --smt=on
    # ppc64_cpu --info
    Core   0:    0*    1*    2*    3*    4*    5*    6*    7*
    Core   1:    8*    9*   10*   11*   12*   13*   14*   15*
    # ppc64_cpu --smt=off
    [   95.643467][  T203] ------------[ cut here ]------------
    [   95.643556][  T203] kernel BUG at kernel/irq_work.c:235!
    [   95.643633][  T203] Oops: Exception in kernel mode, sig: 5 [#1]

 - Using the smt control to turn off SMT means you cannot online those
   CPUs with /sys/devices/system/cpu/cpuN/online (returns EPERM)

    # ppc64_cpu --info
    Core   0:    0*    1*    2*    3*    4*    5*    6*    7*
    Core   1:    8*    9*   10*   11*   12*   13*   14*   15*
    # echo off > /sys/devices/system/cpu/smt/control
    # ppc64_cpu --info
    Core   0:    0*    1     2     3     4     5     6     7
    Core   1:    8*    9    10    11    12    13    14    15
    # grep . /sys/devices/system/cpu/smt/*
    /sys/devices/system/cpu/smt/active:0
    /sys/devices/system/cpu/smt/control:off
    # ppc64_cpu --smt=on
    One or more cpus could not be on/offlined

    # strace ppc64_cpu --smt=on
    openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/online", O_RDONLY) = 3
    newfstatat(3, "", {st_mode=S_IFREG|0644, st_size=65536, ...}, AT_EMPTY_PATH) = 0
    read(3, "1\n", 8192)                    = 2
    close(3)                                = 0
    openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/online", O_WRONLY) = 3
    write(3, "1", 1)                        = 1
    close(3)                                = 0
    openat(AT_FDCWD, "/sys/devices/system/cpu/cpu1/online", O_WRONLY) = 3
    write(3, "1", 1)                        = -1 EPERM (Operation not permitted)
    close(3)                                = 0
    access("/sys/devices/system/cpu/cpu8/online", F_OK) = 0
    openat(AT_FDCWD, "/sys/devices/system/cpu/cpu8/online", O_RDONLY) = 3
    newfstatat(3, "", {st_mode=S_IFREG|0644, st_size=65536, ...}, AT_EMPTY_PATH) = 0
    read(3, "1\n", 8192)                    = 2
    close(3)                                = 0
    openat(AT_FDCWD, "/sys/devices/system/cpu/cpu8/online", O_WRONLY) = 3
    write(3, "1", 1)                        = 1
    close(3)                                = 0
    openat(AT_FDCWD, "/sys/devices/system/cpu/cpu9/online", O_WRONLY) = 3
    write(3, "1", 1)                        = -1 EPERM (Operation not permitted)
    close(3)                                = 0
    write(2, "One or more cpus could not be on"..., 42One or more cpus could not be on/offlined

 - Setting smt off with the online interface doesn't update the status
   of the smt control sysfs file (but does update the active file):

   # ppc64_cpu --smt=off
   # grep . /sys/devices/system/cpu/smt/*
   /sys/devices/system/cpu/smt/active:0
   /sys/devices/system/cpu/smt/control:on

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/include/asm/topology.h |  8 ++++++++
 arch/powerpc/kernel/smp.c           | 10 ++++++++++
 arch/powerpc/Kconfig                |  1 +
 3 files changed, 19 insertions(+)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 36fcafb1fd6d..58280ca4321c 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -147,5 +147,13 @@ static inline int cpu_to_coregroup_id(int cpu)
 #endif
 #endif
 
+#ifdef CONFIG_HOTPLUG_CPU
+bool topology_is_primary_thread(unsigned int cpu);
+bool topology_smt_supported(void);
+#else
+static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
+static inline bool topology_smt_supported(void) { return false; }
+#endif
+
 #endif /* __KERNEL__ */
 #endif	/* _ASM_POWERPC_TOPOLOGY_H */
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index b7fd6a72aa76..24bd98401c91 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1781,4 +1781,14 @@ void arch_cpu_idle_dead(void)
 	start_secondary_resume();
 }
 
+bool topology_smt_supported(void)
+{
+	return cpu_has_feature(CPU_FTR_SMT);
+}
+
+bool topology_is_primary_thread(unsigned int cpu)
+{
+	return cpu_thread_in_core(cpu) == 0;
+}
+
 #endif
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b779603978e1..a3e3d5de4d39 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -239,6 +239,7 @@ config PPC
 	select HAVE_STATIC_CALL			if PPC32
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING
+	select HOTPLUG_SMT			if SMP
 	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
 	select IOMMU_HELPER			if PPC64
 	select IRQ_DOMAIN
-- 
2.34.1

