Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B246E2439
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:26:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PycfV5VMXz3f8R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:26:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kJkljCa3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccj5ZCYz3cMT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:24:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kJkljCa3;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccj2c2mz4xDp;
	Fri, 14 Apr 2023 23:24:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478693;
	bh=QEKItj29GsdO9HhCQbEheqcEv98SxnvwIBfXzJdtj4Q=;
	h=From:To:Subject:Date:From;
	b=kJkljCa3ZO77JpkPp42+knzuFFEXKf27DiUtldu08m7KY98UubA/HJzJFATiwymzT
	 4Ox7WW5c6bRwPCTBpMalYmaGerNWWGTD74qcYPZgEq7sA2q8Hs1gnLWjS8CdILprwJ
	 dZs7bDiz9FowZ475QqhiBMpdREjEi2eoxS03u6RXEvZT+ykeb/HfE1UK9mxA6QwvEG
	 dgSkyk5L/ordAriaQGmWn2P/I5aKWvjxL2cMOMv1LOuHDTkoittWgJodS6yNjXVUQG
	 qCpnzsY2kDPkvz4YLB0e96U+gtaOCRXJlSMKFVm+DmIiquBJ1gbIYPFSSVsLXcE31C
	 3fyjtGEaobDjg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 01/32] powerpc/configs/64s: Update defconfig for symbol movement
Date: Fri, 14 Apr 2023 23:23:44 +1000
Message-Id: <20230414132415.821564-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update ppc64_defconfig to account for symbols moving around, no actual
changes.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 42 ++++++++++++++--------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index d6949a6c5b2b..1028b90ce121 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -3,6 +3,8 @@ CONFIG_POSIX_MQUEUE=y
 # CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_BPF_JIT=y
 CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
 CONFIG_TASKSTATS=y
 CONFIG_TASK_DELAY_ACCT=y
@@ -21,8 +23,6 @@ CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_PERF=y
 CONFIG_CGROUP_BPF=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_BPF_SYSCALL=y
-# CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
 CONFIG_PPC64=y
 CONFIG_NR_CPUS=2048
@@ -54,15 +54,9 @@ CONFIG_CRASH_DUMP=y
 CONFIG_FA_DUMP=y
 CONFIG_IRQ_ALL_CPUS=y
 CONFIG_SCHED_SMT=y
-CONFIG_HOTPLUG_PCI=y
-CONFIG_HOTPLUG_PCI_RPA=m
-CONFIG_HOTPLUG_PCI_RPA_DLPAR=m
-CONFIG_PCCARD=y
-CONFIG_ELECTRA_CF=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM_BOOK3S_64=m
 CONFIG_KVM_BOOK3S_64_HV=m
-CONFIG_VHOST_NET=m
 CONFIG_KPROBES=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
@@ -71,6 +65,7 @@ CONFIG_MODVERSIONS=y
 CONFIG_MODULE_SRCVERSION_ALL=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BINFMT_MISC=m
+# CONFIG_COMPAT_BRK is not set
 CONFIG_MEMORY_HOTPLUG=y
 CONFIG_MEMORY_HOTREMOVE=y
 CONFIG_KSM=y
@@ -98,7 +93,11 @@ CONFIG_NET_SCHED=y
 CONFIG_NET_CLS_BPF=m
 CONFIG_NET_CLS_ACT=y
 CONFIG_NET_ACT_BPF=m
-CONFIG_BPF_JIT=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_HOTPLUG_PCI_RPA=m
+CONFIG_HOTPLUG_PCI_RPA_DLPAR=m
+CONFIG_PCCARD=y
+CONFIG_ELECTRA_CF=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_FD=y
@@ -267,9 +266,9 @@ CONFIG_LEDS_POWERNV=m
 CONFIG_INFINIBAND=m
 CONFIG_INFINIBAND_USER_MAD=m
 CONFIG_INFINIBAND_USER_ACCESS=m
-CONFIG_INFINIBAND_MTHCA=m
 CONFIG_INFINIBAND_CXGB4=m
 CONFIG_MLX4_INFINIBAND=m
+CONFIG_INFINIBAND_MTHCA=m
 CONFIG_INFINIBAND_IPOIB=m
 CONFIG_INFINIBAND_IPOIB_CM=y
 CONFIG_INFINIBAND_SRP=m
@@ -280,8 +279,9 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_DS1307=y
 CONFIG_VIRTIO_PCI=m
 CONFIG_VIRTIO_BALLOON=m
-CONFIG_LIBNVDIMM=y
+CONFIG_VHOST_NET=m
 CONFIG_RAS=y
+CONFIG_LIBNVDIMM=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y
@@ -336,38 +336,38 @@ CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
 CONFIG_CRYPTO_TEST=m
+CONFIG_CRYPTO_BLOWFISH=m
+CONFIG_CRYPTO_CAST6=m
+CONFIG_CRYPTO_SERPENT=m
+CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_CRC32C_VPMSUM=m
-CONFIG_CRYPTO_MD5_PPC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
-CONFIG_CRYPTO_SHA1_PPC=m
 CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
-CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_KHAZAD=m
-CONFIG_CRYPTO_SERPENT=m
 CONFIG_CRYPTO_TEA=m
-CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_LZO=m
+CONFIG_CRYPTO_CRC32C_VPMSUM=m
+CONFIG_CRYPTO_MD5_PPC=m
+CONFIG_CRYPTO_SHA1_PPC=m
 CONFIG_CRYPTO_DEV_NX=y
 CONFIG_CRYPTO_DEV_NX_ENCRYPT=m
 CONFIG_CRYPTO_DEV_VMX=y
 CONFIG_PRINTK_TIME=y
 CONFIG_PRINTK_CALLER=y
-CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
+CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_STACK_USAGE=y
 CONFIG_DEBUG_STACKOVERFLOW=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_HARDLOCKUP_DETECTOR=y
 CONFIG_DEBUG_MUTEXES=y
 CONFIG_FUNCTION_TRACER=y
-CONFIG_FTRACE_SYSCALLS=y
-CONFIG_SCHED_TRACER=y
 CONFIG_STACK_TRACER=y
+CONFIG_SCHED_TRACER=y
+CONFIG_FTRACE_SYSCALLS=y
 CONFIG_BLK_DEV_IO_TRACE=y
 CONFIG_CODE_PATCHING_SELFTEST=y
 CONFIG_FTR_FIXUP_SELFTEST=y
-- 
2.39.2

