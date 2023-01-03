Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3ED65C568
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 18:52:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmgLY64lKz3cDD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 04:52:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=f/kRG7AM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org; envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=f/kRG7AM;
	dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmgJZ5Dcfz3bfk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jan 2023 04:51:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
	In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3krDOxsAnX7iH4bhXJVjFJ2TndKn4Y0lXoHp4b0cW34=; b=f/kRG7AMqUJEiWGFEML8TXatjt
	W35n3PeB+IWa69hdVpfJo39vaF0xiBB+hCIuG01XBo8YdNwyv5iFA0rF7Pvv+n2Ku64cAx0gO4xP2
	4QpDWUJ9JG7jZvVWx83B/4NZj0QNAGkj6DwXVcK++jSWeKoHXfY8QtIKqXgM5Q+XQyDImmxUs6lpz
	DlNRWeP37Hez2Zg9GNTy3YOOtbx6rDEtTqfmpV8jaNq8kB5+oPsdymizeplfEYq9ZSBUO6GwXiAq4
	QeE/1E+OfB1jO0EBVideOzgxiCfY7NGUMEXlEwTqdXK9jYwSsInKyoZeBPO4OEsXcYsrsYgyJUZJb
	s2BwKZ8A==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pClRH-007YIu-Vl; Tue, 03 Jan 2023 17:51:04 +0000
Message-Id: <99e87549b17feca3494e9df6f4def04a9ec7c042.1672767868.git.geoff@infradead.org>
In-Reply-To: <cover.1672767868.git.geoff@infradead.org>
References: <cover.1672767868.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Tue, 3 Jan 2023 09:42:16 -0800
Subject: [PATCH v2 2/2] powerpc/ps3: Refresh ps3_defconfig
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 03 Jan 2023 17:51:03 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Refresh ps3_defconfig for v6.2.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/configs/ps3_defconfig | 39 +++++++++++++-----------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/configs/ps3_defconfig b/arch/powerpc/configs/ps3_defconfig
index 0a1b42c4f26a..52a8c5450ecb 100644
--- a/arch/powerpc/configs/ps3_defconfig
+++ b/arch/powerpc/configs/ps3_defconfig
@@ -1,8 +1,3 @@
-CONFIG_PPC64=y
-CONFIG_CELL_CPU=y
-CONFIG_ALTIVEC=y
-CONFIG_SMP=y
-CONFIG_NR_CPUS=2
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_HIGH_RES_TIMERS=y
@@ -10,11 +5,12 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
 # CONFIG_PERF_EVENTS is not set
-# CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
+CONFIG_PPC64=y
+CONFIG_CELL_CPU=y
+CONFIG_ALTIVEC=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
 # CONFIG_PPC_POWERNV is not set
 # CONFIG_PPC_PSERIES is not set
 # CONFIG_PPC_PMAC is not set
@@ -27,17 +23,20 @@ CONFIG_PS3_FLASH=y
 CONFIG_PS3_VRAM=m
 CONFIG_PS3_LPM=m
 # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
-# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-CONFIG_BINFMT_MISC=y
 CONFIG_KEXEC=y
 CONFIG_PPC_4K_PAGES=y
-# CONFIG_SPARSEMEM_VMEMMAP is not set
-# CONFIG_COMPACTION is not set
 CONFIG_SCHED_SMT=y
 CONFIG_PM=y
 CONFIG_PM_DEBUG=y
 # CONFIG_SECCOMP is not set
-# CONFIG_PCI is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_BINFMT_MISC=y
+CONFIG_SLAB=y
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_SPARSEMEM_VMEMMAP is not set
+# CONFIG_COMPACTION is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -87,7 +86,6 @@ CONFIG_USB_USBNET=m
 # CONFIG_USB_NET_NET1080 is not set
 # CONFIG_USB_NET_CDC_SUBSET is not set
 # CONFIG_USB_NET_ZAURUS is not set
-CONFIG_INPUT_FF_MEMLESS=m
 CONFIG_INPUT_JOYDEV=m
 CONFIG_INPUT_EVDEV=m
 # CONFIG_INPUT_KEYBOARD is not set
@@ -110,13 +108,10 @@ CONFIG_SND=m
 # CONFIG_SND_DRIVERS is not set
 CONFIG_SND_USB_AUDIO=m
 CONFIG_HIDRAW=y
-CONFIG_HID_APPLE=m
 CONFIG_HID_BELKIN=m
 CONFIG_HID_CHERRY=m
 CONFIG_HID_EZKEY=m
 CONFIG_HID_TWINHAN=m
-CONFIG_HID_LOGITECH=m
-CONFIG_HID_LOGITECH_DJ=m
 CONFIG_HID_MICROSOFT=m
 CONFIG_HID_SUNPLUS=m
 CONFIG_HID_SMARTJOYPLUS=m
@@ -151,8 +146,12 @@ CONFIG_CIFS=m
 CONFIG_NLS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
+CONFIG_CRYPTO_PCBC=m
+CONFIG_CRYPTO_MICHAEL_MIC=m
+CONFIG_CRYPTO_LZO=m
 CONFIG_CRC_CCITT=m
 CONFIG_CRC_T10DIF=y
+CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_MEMORY_INIT=y
@@ -163,7 +162,3 @@ CONFIG_DEBUG_LOCKDEP=y
 CONFIG_DEBUG_LIST=y
 CONFIG_RCU_CPU_STALL_TIMEOUT=60
 # CONFIG_FTRACE is not set
-CONFIG_CRYPTO_PCBC=m
-CONFIG_CRYPTO_MICHAEL_MIC=m
-CONFIG_CRYPTO_LZO=m
-CONFIG_PRINTK_TIME=y
-- 
2.34.1

