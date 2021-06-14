Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643BF3A7251
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 01:06:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3nBW6tKsz303h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:06:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=ftlze4BO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=ftlze4BO; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3n9c3fNRz2ylk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 09:05:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G3n9Z22KXz9sWQ; Tue, 15 Jun 2021 09:05:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G3n9Z1MYRz9sWD; Tue, 15 Jun 2021 09:05:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623711938; bh=NVVNIVc21t8Ax9gg8n8KDguZAVUhGCKn/FOAoL57vj0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=ftlze4BO0KrP/mRSJOJQs/glirVjxerlHY6v1Sz4PCut4uIDAoYRWsjkLGwaii31n
 SyW53Ke+19RQ1hf4R4gXkxMQ+dGf/Ve6ypsvUnXToaXYU2/wgZSSE/d4b1/ybRH1rC
 rLalTTTrBt6n21hpm6V4ixn2zveQbgku+7lKIRq6+aHuem44ZzKKAzYr+zHGpR14xe
 3uGLSzvJi/rj3vTXdn0niJ5xpF6i1UOwmIL/xW/N+K1DR3esQj0HnD7pYHOB2lHo85
 uZAcvlRUuofgnYuvejEdfsYAkwzYXdfJj26kpugKl2DYExfHX+N50JQxCoOJQXrS4W
 fvj8XPgxhAW1w==
Date: Tue, 15 Jun 2021 09:02:40 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 08/11] powerpc/microwatt: Add microwatt_defconfig
Message-ID: <YMfgEPrZDqqxTHgT@thinks.paulus.ozlabs.org>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
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

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/configs/microwatt_defconfig | 98 ++++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 arch/powerpc/configs/microwatt_defconfig

diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
new file mode 100644
index 000000000000..a08b739123da
--- /dev/null
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -0,0 +1,98 @@
+# CONFIG_SWAP is not set
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT_VOLUNTARY=y
+CONFIG_TICK_CPU_ACCOUNTING=y
+CONFIG_LOG_BUF_SHIFT=16
+CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_SLUB_DEBUG is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_SLAB_MERGE_DEFAULT is not set
+CONFIG_PPC64=y
+# CONFIG_PPC_KUEP is not set
+# CONFIG_PPC_KUAP is not set
+CONFIG_CPU_LITTLE_ENDIAN=y
+CONFIG_NR_IRQS=64
+CONFIG_PANIC_TIMEOUT=10
+# CONFIG_PPC_POWERNV is not set
+# CONFIG_PPC_PSERIES is not set
+CONFIG_PPC_MICROWATT=y
+# CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
+CONFIG_CPU_FREQ=y
+CONFIG_HZ_100=y
+# CONFIG_PPC_MEM_KEYS is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set
+# CONFIG_COREDUMP is not set
+# CONFIG_COMPACTION is not set
+# CONFIG_MIGRATION is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_PACKET_DIAG=y
+CONFIG_UNIX=y
+CONFIG_UNIX_DIAG=y
+CONFIG_INET=y
+CONFIG_INET_UDP_DIAG=y
+CONFIG_INET_RAW_DIAG=y
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_FW_LOADER is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_PARTITIONED_MASTER=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_NETDEVICES=y
+# CONFIG_WLAN is not set
+# CONFIG_INPUT is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_NONSTANDARD=y
+# CONFIG_NVRAM is not set
+CONFIG_RANDOM_TRUST_CPU=y
+CONFIG_SPI=y
+CONFIG_SPI_DEBUG=y
+CONFIG_SPI_BITBANG=y
+CONFIG_SPI_SPIDEV=y
+# CONFIG_HWMON is not set
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_IOMMU_SUPPORT is not set
+# CONFIG_NVMEM is not set
+CONFIG_EXT4_FS=y
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+# CONFIG_MISC_FILESYSTEMS is not set
+# CONFIG_CRYPTO_HW is not set
+# CONFIG_XZ_DEC_X86 is not set
+# CONFIG_XZ_DEC_IA64 is not set
+# CONFIG_XZ_DEC_ARM is not set
+# CONFIG_XZ_DEC_ARMTHUMB is not set
+# CONFIG_XZ_DEC_SPARC is not set
+CONFIG_PRINTK_TIME=y
+# CONFIG_SYMBOLIC_ERRNAME is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_MISC is not set
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_FTRACE is not set
+# CONFIG_STRICT_DEVMEM is not set
+CONFIG_PPC_DISABLE_WERROR=y
+CONFIG_XMON=y
+CONFIG_XMON_DEFAULT=y
+# CONFIG_XMON_DEFAULT_RO_MODE is not set
+# CONFIG_RUNTIME_TESTING_MENU is not set
-- 
2.31.1

