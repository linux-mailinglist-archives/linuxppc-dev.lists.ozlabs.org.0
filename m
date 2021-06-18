Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2213AC19D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 05:52:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5lNt2qJ9z3cXP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 13:52:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=JJCCkmIw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=JJCCkmIw; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5lML5hKzz3c1F
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 13:50:54 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G5lMK5S4yz9sf8; Fri, 18 Jun 2021 13:50:53 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G5lMK41gsz9sXG; Fri, 18 Jun 2021 13:50:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623988253; bh=NVVNIVc21t8Ax9gg8n8KDguZAVUhGCKn/FOAoL57vj0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=JJCCkmIweAPx/FShiHUTc5/Vu/tDpH5BGsEOHyF7F+GQD+cMNUxLK3sXcGRrwB+yg
 Z20U4xY750U2oocjPErTwj/vgH172oxK383DeXJfZwO7Lv2ec7F1vghwoX6u1hrXoL
 DlIYGaDWElGe4wc0nEUl7KMBcIenFFlNjemIlkHvtpeYgDdxKI+fvFod0Y8eUSRbLM
 RVX25yQmBVwgT/HEe94hOeVVuC+Ih68poBsR1IDtIlMuD0VOheCAEHOnztpTaubBt9
 qcDIjhbhQqUXMBpCh9C6Xc5tNQsHzYhHiZKx2cj+pWJ0W4OJ1vww1CpsxKsTEgFzXS
 pzCHEZWanYJgg==
Date: Fri, 18 Jun 2021 13:48:12 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 7/9] powerpc/microwatt: Add microwatt_defconfig
Message-ID: <YMwXfL8hOpReIiiP@thinks.paulus.ozlabs.org>
References: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
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

