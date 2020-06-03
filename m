Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4658D1ED06A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 15:01:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cTYk3JskzDqVx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 23:01:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cTVG2qRYzDqVx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 22:58:09 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49cTV25g1vz9txwW;
 Wed,  3 Jun 2020 14:58:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id JrcTwhjvuJ-u; Wed,  3 Jun 2020 14:58:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49cTV24vdXz9txwV;
 Wed,  3 Jun 2020 14:58:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 88D038B892;
 Wed,  3 Jun 2020 14:58:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GEEi8SjB_XrK; Wed,  3 Jun 2020 14:58:04 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2CD868B888;
 Wed,  3 Jun 2020 14:58:04 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BB78867455; Wed,  3 Jun 2020 12:58:03 +0000 (UTC)
Message-Id: <a74fce4dfc9fa32da6ce3470bbedcecf795de1ec.1591189069.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/boot: Add LZMA and LZO __decompress in cuboot to
 avoid build failure
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  3 Jun 2020 12:58:03 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commits identified below added LZMA and LZO compression
for the uImage. However it seems that some targets select both
uImage and other image type like cuImage. In that case, the
selected compression type applies to both uImage and cuImage,
and leads to build failure due to missing __decompress() function.

wrapper.a which is merged in cuImage must include the relevant
decompressor.

For targets using cuboot, add lzma decompressor for CONFIG_KERNEL_LZMA
For targets using cuboot, add lzo decompressor for CONFIG_KERNEL_LZO
That being done, allow all compression types regarless of whether
default uImage is selected or not.

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 1cc9a21b0bb3 ("powerpc/boot: Add lzma support for uImage")
Fixes: 264bffad4d08 ("powerpc/boot: Add lzo support for uImage")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig           |  4 +--
 arch/powerpc/boot/decompress.c | 11 +++++++
 arch/powerpc/boot/lzo_config.h | 57 ++++++++++++++++++++++++++++++++++
 arch/powerpc/boot/wrapper      | 19 ++++++++++--
 lib/decompress_unlzma.c        |  4 +++
 lib/decompress_unlzo.c         |  4 ++-
 6 files changed, 93 insertions(+), 6 deletions(-)
 create mode 100644 arch/powerpc/boot/lzo_config.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1dfa59126fcf..9a7e9d80b908 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -202,8 +202,8 @@ config PPC
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK
 	select HAVE_KERNEL_GZIP
-	select HAVE_KERNEL_LZMA			if DEFAULT_UIMAGE
-	select HAVE_KERNEL_LZO			if DEFAULT_UIMAGE
+	select HAVE_KERNEL_LZMA
+	select HAVE_KERNEL_LZO
 	select HAVE_KERNEL_XZ			if PPC_BOOK3S || 44x
 	select HAVE_KPROBES
 	select HAVE_KPROBES_ON_FTRACE
diff --git a/arch/powerpc/boot/decompress.c b/arch/powerpc/boot/decompress.c
index 8bf39ef7d2df..ad82a6fd04f6 100644
--- a/arch/powerpc/boot/decompress.c
+++ b/arch/powerpc/boot/decompress.c
@@ -33,6 +33,17 @@
 #	include "decompress_inflate.c"
 #endif
 
+#ifdef CONFIG_KERNEL_LZMA
+#define large_malloc malloc
+#define large_free free
+#	include "../../../lib/decompress_unlzma.c"
+#endif
+
+#ifdef CONFIG_KERNEL_LZO
+#	include "lzo_config.h"
+#	include "../../../lib/decompress_unlzo.c"
+#endif
+
 #ifdef CONFIG_KERNEL_XZ
 #	include "xz_config.h"
 #	include "../../../lib/decompress_unxz.c"
diff --git a/arch/powerpc/boot/lzo_config.h b/arch/powerpc/boot/lzo_config.h
new file mode 100644
index 000000000000..fd985e887c80
--- /dev/null
+++ b/arch/powerpc/boot/lzo_config.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LZO_CONFIG_H__
+#define __LZO_CONFIG_H__
+
+#include "types.h"
+#include "swab.h"
+
+#ifdef __LITTLE_ENDIAN__
+static inline u32 be32_to_cpup(const u32 *p)
+{
+	return swab32(*(u32 *)p);
+}
+static inline u16 be16_to_cpup(const u16 *p)
+{
+	return swab16(*(u16 *)p);
+}
+static inline u16 le16_to_cpup(const u16 *p)
+{
+	return *p;
+}
+#else
+static inline u32 be32_to_cpup(const u32 *p)
+{
+	return *p;
+}
+static inline u16 be16_to_cpup(const u16 *p)
+{
+	return *p;
+}
+static inline u16 le16_to_cpup(const u16 *p)
+{
+	return swab16(*(u16 *)p);
+}
+#endif
+
+static inline uint32_t get_unaligned_be32(const void *p)
+{
+	return be32_to_cpup(p);
+}
+
+static inline uint32_t get_unaligned_be16(const void *p)
+{
+	return be16_to_cpup(p);
+}
+
+static inline uint32_t get_unaligned_le16(const void *p)
+{
+	return le16_to_cpup(p);
+}
+
+#define get_unaligned(ptr) (*(ptr))
+#define put_unaligned(val, ptr) do { *(ptr) = val; } while (0)
+
+#define likely(x)	__builtin_expect(!!(x), 1)
+#define unlikely(x)	__builtin_expect(!!(x), 0)
+
+#endif
diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 35ace40d9fc2..3a20d7c6127d 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -525,9 +525,22 @@ coff)
     $objbin/hack-coff "$ofile"
     ;;
 cuboot*)
-    gzip -n -f -9 "$ofile"
-    ${MKIMAGE} -A ppc -O linux -T kernel -C gzip -a "$base" -e "$entry" \
-            $uboot_version -d "$ofile".gz "$ofile"
+    case $compression in
+    .xz)
+        xz --check=crc32 -f -6 "$ofile"
+        ;;
+    .gz)
+        gzip -n -f -9 "$ofile"
+        ;;
+    .lzma)
+        xz --format=lzma -f -6 "$ofile"
+	;;
+    .lzo)
+        lzop -f -9 "$ofile"
+	;;
+    esac
+    ${MKIMAGE} -A ppc -O linux -T kernel -C $uboot_comp -a "$base" -e "$entry" \
+            $uboot_version -d "$ofile$compression" "$ofile"
     ;;
 treeboot*)
     mv "$ofile" "$ofile.elf"
diff --git a/lib/decompress_unlzma.c b/lib/decompress_unlzma.c
index ed7a1fd819f2..225a42b8e1d7 100644
--- a/lib/decompress_unlzma.c
+++ b/lib/decompress_unlzma.c
@@ -35,7 +35,9 @@
 #include <linux/decompress/unlzma.h>
 #endif /* STATIC */
 
+#ifdef __KERNEL__
 #include <linux/decompress/mm.h>
+#endif
 
 #define	MIN(a, b) (((a) < (b)) ? (a) : (b))
 
@@ -60,7 +62,9 @@ static long long INIT read_int(unsigned char *ptr, int size)
  *Copyright (c) 1999-2005  Igor Pavlov
  */
 
+#ifdef __KERNEL__
 #include <linux/compiler.h>
+#endif
 
 #define LZMA_IOBUF_SIZE	0x10000
 
diff --git a/lib/decompress_unlzo.c b/lib/decompress_unlzo.c
index 1f439a622076..a8dbde4b32d4 100644
--- a/lib/decompress_unlzo.c
+++ b/lib/decompress_unlzo.c
@@ -23,9 +23,11 @@
 #include <linux/decompress/unlzo.h>
 #endif
 
-#include <linux/types.h>
 #include <linux/lzo.h>
+#ifdef __KERNEL__
+#include <linux/types.h>
 #include <linux/decompress/mm.h>
+#endif
 
 #include <linux/compiler.h>
 #include <asm/unaligned.h>
-- 
2.25.0

