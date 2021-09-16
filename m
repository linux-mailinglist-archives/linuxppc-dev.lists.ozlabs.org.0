Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C12EE40EA29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 20:44:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9Qwl5BNZz2ynB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 04:44:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9QwH332jz2y8R
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 04:43:57 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H9QwB4WR5z9sV1;
 Thu, 16 Sep 2021 20:43:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7KfFyexZZXMX; Thu, 16 Sep 2021 20:43:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H9QwB3Bbhz9sTc;
 Thu, 16 Sep 2021 20:43:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4055C8B799;
 Thu, 16 Sep 2021 20:43:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OnhW1vc382Xz; Thu, 16 Sep 2021 20:43:54 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.29])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF6508B783;
 Thu, 16 Sep 2021 20:43:53 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 18GIhdOP444146
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 20:43:39 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 18GIhbil444145;
 Thu, 16 Sep 2021 20:43:37 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/lib/sstep: Don't use __{get/put}_user() on kernel
 addresses
Date: Thu, 16 Sep 2021 20:43:36 +0200
Message-Id: <22831c9d17f948680a12c5292e7627288b15f713.1631817805.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
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
Cc: Stan Johnson <userm57@yahoo.com>, Finn Thain <fthain@linux-m68k.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the old days, when we didn't have kernel userspace access
protection and had set_fs(), it was wise to use __get_user()
and friends to read kernel memory.

Nowadays, get_user() and put_user() are granting userspace access and
are exclusively for userspace access.

Convert single step emulation functions to user_access_begin() and
friends and use unsafe_get_user() and unsafe_put_user().

When addressing kernel addresses, there is no need to open userspace
access. And for book3s/32 it is particularly important to no try and
open userspace access on kernel address, because that would break the
content of kernel space segment registers. No guard has been put
against that risk in order to avoid degrading performance.

copy_from_kernel_nofault() and copy_to_kernel_nofault() should
be used but they are out-of-line functions which would degrade
performance. Those two functions are making use of
__get_kernel_nofault() and __put_kernel_nofault() macros.
Those two macros are just wrappers behind __get_user_size_goto() and
__put_user_size_goto().

unsafe_get_user() and unsafe_put_user() are also wrappers of
__get_user_size_goto() and __put_user_size_goto(). Use them to
access kernel space. That allows refactoring userspace and
kernelspace access.

Reported-by: Stan Johnson <userm57@yahoo.com>
Cc: Finn Thain <fthain@linux-m68k.org>
Depends-on: 4fe5cda9f89d ("powerpc/uaccess: Implement user_read_access_begin and user_write_access_begin")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/sstep.c | 197 ++++++++++++++++++++++++++++-----------
 1 file changed, 140 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index d8d5f901cee1..86f49e3e7cf5 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -302,33 +302,51 @@ static nokprobe_inline void do_byte_reverse(void *ptr, int nb)
 	}
 }
 
-static nokprobe_inline int read_mem_aligned(unsigned long *dest,
-					    unsigned long ea, int nb,
-					    struct pt_regs *regs)
+static __always_inline int
+__read_mem_aligned(unsigned long *dest, unsigned long ea, int nb, struct pt_regs *regs)
 {
-	int err = 0;
 	unsigned long x = 0;
 
 	switch (nb) {
 	case 1:
-		err = __get_user(x, (unsigned char __user *) ea);
+		unsafe_get_user(x, (unsigned char __user *)ea, Efault);
 		break;
 	case 2:
-		err = __get_user(x, (unsigned short __user *) ea);
+		unsafe_get_user(x, (unsigned short __user *)ea, Efault);
 		break;
 	case 4:
-		err = __get_user(x, (unsigned int __user *) ea);
+		unsafe_get_user(x, (unsigned int __user *)ea, Efault);
 		break;
 #ifdef __powerpc64__
 	case 8:
-		err = __get_user(x, (unsigned long __user *) ea);
+		unsafe_get_user(x, (unsigned long __user *)ea, Efault);
 		break;
 #endif
 	}
-	if (!err)
-		*dest = x;
-	else
+	*dest = x;
+	return 0;
+
+Efault:
+	regs->dar = ea;
+	return -EFAULT;
+}
+
+static nokprobe_inline int
+read_mem_aligned(unsigned long *dest, unsigned long ea, int nb, struct pt_regs *regs)
+{
+	int err;
+
+	if (is_kernel_addr(ea))
+		return __read_mem_aligned(dest, ea, nb, regs);
+
+	if (user_read_access_begin((void __user *)ea, nb)) {
+		err = __read_mem_aligned(dest, ea, nb, regs);
+		user_read_access_end();
+	} else {
+		err = -EFAULT;
 		regs->dar = ea;
+	}
+
 	return err;
 }
 
@@ -336,10 +354,8 @@ static nokprobe_inline int read_mem_aligned(unsigned long *dest,
  * Copy from userspace to a buffer, using the largest possible
  * aligned accesses, up to sizeof(long).
  */
-static nokprobe_inline int copy_mem_in(u8 *dest, unsigned long ea, int nb,
-				       struct pt_regs *regs)
+static __always_inline int __copy_mem_in(u8 *dest, unsigned long ea, int nb, struct pt_regs *regs)
 {
-	int err = 0;
 	int c;
 
 	for (; nb > 0; nb -= c) {
@@ -348,31 +364,46 @@ static nokprobe_inline int copy_mem_in(u8 *dest, unsigned long ea, int nb,
 			c = max_align(nb);
 		switch (c) {
 		case 1:
-			err = __get_user(*dest, (unsigned char __user *) ea);
+			unsafe_get_user(*dest, (u8 __user *)ea, Efault);
 			break;
 		case 2:
-			err = __get_user(*(u16 *)dest,
-					 (unsigned short __user *) ea);
+			unsafe_get_user(*(u16 *)dest, (u16 __user *)ea, Efault);
 			break;
 		case 4:
-			err = __get_user(*(u32 *)dest,
-					 (unsigned int __user *) ea);
+			unsafe_get_user(*(u32 *)dest, (u32 __user *)ea, Efault);
 			break;
 #ifdef __powerpc64__
 		case 8:
-			err = __get_user(*(unsigned long *)dest,
-					 (unsigned long __user *) ea);
+			unsafe_get_user(*(u64 *)dest, (u64 __user *)ea, Efault);
 			break;
 #endif
 		}
-		if (err) {
-			regs->dar = ea;
-			return err;
-		}
 		dest += c;
 		ea += c;
 	}
 	return 0;
+
+Efault:
+	regs->dar = ea;
+	return -EFAULT;
+}
+
+static nokprobe_inline int copy_mem_in(u8 *dest, unsigned long ea, int nb, struct pt_regs *regs)
+{
+	int err;
+
+	if (is_kernel_addr(ea))
+		return __copy_mem_in(dest, ea, nb, regs);
+
+	if (user_read_access_begin((void __user *)ea, nb)) {
+		err = __copy_mem_in(dest, ea, nb, regs);
+		user_read_access_end();
+	} else {
+		err = -EFAULT;
+		regs->dar = ea;
+	}
+
+	return err;
 }
 
 static nokprobe_inline int read_mem_unaligned(unsigned long *dest,
@@ -410,30 +441,48 @@ static int read_mem(unsigned long *dest, unsigned long ea, int nb,
 }
 NOKPROBE_SYMBOL(read_mem);
 
-static nokprobe_inline int write_mem_aligned(unsigned long val,
-					     unsigned long ea, int nb,
-					     struct pt_regs *regs)
+static __always_inline int
+__write_mem_aligned(unsigned long val, unsigned long ea, int nb, struct pt_regs *regs)
 {
-	int err = 0;
-
 	switch (nb) {
 	case 1:
-		err = __put_user(val, (unsigned char __user *) ea);
+		unsafe_put_user(val, (unsigned char __user *)ea, Efault);
 		break;
 	case 2:
-		err = __put_user(val, (unsigned short __user *) ea);
+		unsafe_put_user(val, (unsigned short __user *)ea, Efault);
 		break;
 	case 4:
-		err = __put_user(val, (unsigned int __user *) ea);
+		unsafe_put_user(val, (unsigned int __user *)ea, Efault);
 		break;
 #ifdef __powerpc64__
 	case 8:
-		err = __put_user(val, (unsigned long __user *) ea);
+		unsafe_put_user(val, (unsigned long __user *)ea, Efault);
 		break;
 #endif
 	}
-	if (err)
+	return 0;
+
+Efault:
+	regs->dar = ea;
+	return -EFAULT;
+}
+
+static nokprobe_inline int
+write_mem_aligned(unsigned long val, unsigned long ea, int nb, struct pt_regs *regs)
+{
+	int err;
+
+	if (is_kernel_addr(ea))
+		return __write_mem_aligned(val, ea, nb, regs);
+
+	if (user_write_access_begin((void __user *)ea, nb)) {
+		err = __write_mem_aligned(val, ea, nb, regs);
+		user_write_access_end();
+	} else {
+		err = -EFAULT;
 		regs->dar = ea;
+	}
+
 	return err;
 }
 
@@ -441,10 +490,8 @@ static nokprobe_inline int write_mem_aligned(unsigned long val,
  * Copy from a buffer to userspace, using the largest possible
  * aligned accesses, up to sizeof(long).
  */
-static nokprobe_inline int copy_mem_out(u8 *dest, unsigned long ea, int nb,
-					struct pt_regs *regs)
+static nokprobe_inline int __copy_mem_out(u8 *dest, unsigned long ea, int nb, struct pt_regs *regs)
 {
-	int err = 0;
 	int c;
 
 	for (; nb > 0; nb -= c) {
@@ -453,31 +500,46 @@ static nokprobe_inline int copy_mem_out(u8 *dest, unsigned long ea, int nb,
 			c = max_align(nb);
 		switch (c) {
 		case 1:
-			err = __put_user(*dest, (unsigned char __user *) ea);
+			unsafe_put_user(*dest, (u8 __user *)ea, Efault);
 			break;
 		case 2:
-			err = __put_user(*(u16 *)dest,
-					 (unsigned short __user *) ea);
+			unsafe_put_user(*(u16 *)dest, (u16 __user *)ea, Efault);
 			break;
 		case 4:
-			err = __put_user(*(u32 *)dest,
-					 (unsigned int __user *) ea);
+			unsafe_put_user(*(u32 *)dest, (u32 __user *)ea, Efault);
 			break;
 #ifdef __powerpc64__
 		case 8:
-			err = __put_user(*(unsigned long *)dest,
-					 (unsigned long __user *) ea);
+			unsafe_put_user(*(u64 *)dest, (u64 __user *)ea, Efault);
 			break;
 #endif
 		}
-		if (err) {
-			regs->dar = ea;
-			return err;
-		}
 		dest += c;
 		ea += c;
 	}
 	return 0;
+
+Efault:
+	regs->dar = ea;
+	return -EFAULT;
+}
+
+static nokprobe_inline int copy_mem_out(u8 *dest, unsigned long ea, int nb, struct pt_regs *regs)
+{
+	int err;
+
+	if (is_kernel_addr(ea))
+		return __copy_mem_out(dest, ea, nb, regs);
+
+	if (user_write_access_begin((void __user *)ea, nb)) {
+		err = __copy_mem_out(dest, ea, nb, regs);
+		user_write_access_end();
+	} else {
+		err = -EFAULT;
+		regs->dar = ea;
+	}
+
+	return err;
 }
 
 static nokprobe_inline int write_mem_unaligned(unsigned long val,
@@ -986,10 +1048,24 @@ static nokprobe_inline int do_vsx_store(struct instruction_op *op,
 }
 #endif /* CONFIG_VSX */
 
+static int __emulate_dcbz(unsigned long ea)
+{
+	unsigned long i;
+	unsigned long size = l1_dcache_bytes();
+
+	for (i = 0; i < size; i += sizeof(long))
+		unsafe_put_user(0, (unsigned long __user *)(ea + i), Efault);
+
+	return 0;
+
+Efault:
+	return -EFAULT;
+}
+
 int emulate_dcbz(unsigned long ea, struct pt_regs *regs)
 {
 	int err;
-	unsigned long i, size;
+	unsigned long size;
 
 #ifdef __powerpc64__
 	size = ppc64_caches.l1d.block_size;
@@ -1001,14 +1077,21 @@ int emulate_dcbz(unsigned long ea, struct pt_regs *regs)
 	ea &= ~(size - 1);
 	if (!address_ok(regs, ea, size))
 		return -EFAULT;
-	for (i = 0; i < size; i += sizeof(long)) {
-		err = __put_user(0, (unsigned long __user *) (ea + i));
-		if (err) {
-			regs->dar = ea;
-			return err;
-		}
+
+	if (is_kernel_addr(ea)) {
+		err = __emulate_dcbz(ea);
+	} else if (user_write_access_begin((void __user *)ea, size)) {
+		err = __emulate_dcbz(ea);
+		user_write_access_end();
+	} else {
+		err = -EFAULT;
 	}
-	return 0;
+
+	if (err)
+		regs->dar = ea;
+
+
+	return err;
 }
 NOKPROBE_SYMBOL(emulate_dcbz);
 
-- 
2.31.1

