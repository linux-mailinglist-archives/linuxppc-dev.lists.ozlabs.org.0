Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C8030F318
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 13:25:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWd6z2vJNzDwh6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 23:25:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DWcwV5P96zDwxP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 23:16:24 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 697DDAE8000E;
 Thu,  4 Feb 2021 07:16:15 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v3] powerpc/uaccess: Skip might_fault() when user
 access is enabled
Date: Thu,  4 Feb 2021 23:16:12 +1100
Message-Id: <20210204121612.32721-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Jordan Niethe <jniethe5@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The amount of code executed with enabled user space access (unlocked KUAP)
should be minimal. However with CONFIG_PROVE_LOCKING or
CONFIG_DEBUG_ATOMIC_SLEEP enabled, might_fault() may end up replaying
interrupts which in turn may access the user space and forget to restore
the KUAP state.

The problem places are:
1. strncpy_from_user (and similar) which unlock KUAP and call
unsafe_get_user -> __get_user_allowed -> __get_user_nocheck()
with do_allow=false to skip KUAP as the caller took care of it.
2. __put_user_nocheck_goto() which is called with unlocked KUAP.

This changes __get_user_nocheck() to look at @do_allow to decide whether
to skip might_fault(). Since strncpy_from_user/etc call might_fault()
anyway before unlocking KUAP, there should be no visible change.

This drops might_fault() in __put_user_nocheck_goto() as it is only
called from unsafe_xxx helpers which manage KUAP themselves.

Since keeping might_fault() is still desireable, this adds those
to user_access_begin/read/write which is the last point where
we can safely do so.

Fixes: 334710b1496a ("powerpc/uaccess: Implement unsafe_put_user() using 'asm goto'")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v3:
* removed might_fault() from __put_user_nocheck_goto
* added might_fault() to user(_|_read_|_write_)access_begin

v2:
* s/!do_allow/do_allow/

---

Here is more detail about the issue:
https://lore.kernel.org/linuxppc-dev/20210203084503.GX6564@kitsune.suse.cz/T/

Another example of the problem:

Kernel attempted to write user page (200002c3) - exploit attempt? (uid: 0)
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 1 PID: 16712 at /home/aik/p/kernel-syzkaller/arch/powerpc/mm/fault.c:229 __do_page_fault+0xca4/0xf10

NIP [c0000000006ff804] filldir64+0x484/0x820
LR [c0000000006ff7fc] filldir64+0x47c/0x820
--- interrupt: 300
[c0000000589f3b40] [c0000000008131b0] proc_fill_cache+0xf0/0x2b0
[c0000000589f3c60] [c000000000814658] proc_pident_readdir+0x1f8/0x390
[c0000000589f3cc0] [c0000000006fd8e8] iterate_dir+0x108/0x370
[c0000000589f3d20] [c0000000006fe3d8] sys_getdents64+0xa8/0x410
[c0000000589f3db0] [c00000000004b708] system_call_exception+0x178/0x2b0
[c0000000589f3e10] [c00000000000e060] system_call_common+0xf0/0x27c
---
 arch/powerpc/include/asm/uaccess.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 501c9a79038c..a789601998d3 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -216,8 +216,6 @@ do {								\
 #define __put_user_nocheck_goto(x, ptr, size, label)		\
 do {								\
 	__typeof__(*(ptr)) __user *__pu_addr = (ptr);		\
-	if (!is_kernel_addr((unsigned long)__pu_addr))		\
-		might_fault();					\
 	__chk_user_ptr(ptr);					\
 	__put_user_size_goto((x), __pu_addr, (size), label);	\
 } while (0)
@@ -313,7 +311,7 @@ do {								\
 	__typeof__(size) __gu_size = (size);			\
 								\
 	__chk_user_ptr(__gu_addr);				\
-	if (!is_kernel_addr((unsigned long)__gu_addr))		\
+	if (do_allow && !is_kernel_addr((unsigned long)__gu_addr)) \
 		might_fault();					\
 	barrier_nospec();					\
 	if (do_allow)								\
@@ -508,6 +506,8 @@ static __must_check inline bool user_access_begin(const void __user *ptr, size_t
 {
 	if (unlikely(!access_ok(ptr, len)))
 		return false;
+	if (!is_kernel_addr((unsigned long)ptr))
+		might_fault();
 	allow_read_write_user((void __user *)ptr, ptr, len);
 	return true;
 }
@@ -521,6 +521,8 @@ user_read_access_begin(const void __user *ptr, size_t len)
 {
 	if (unlikely(!access_ok(ptr, len)))
 		return false;
+	if (!is_kernel_addr((unsigned long)ptr))
+		might_fault();
 	allow_read_from_user(ptr, len);
 	return true;
 }
@@ -532,6 +534,8 @@ user_write_access_begin(const void __user *ptr, size_t len)
 {
 	if (unlikely(!access_ok(ptr, len)))
 		return false;
+	if (!is_kernel_addr((unsigned long)ptr))
+		might_fault();
 	allow_write_to_user((void __user *)ptr, len);
 	return true;
 }
-- 
2.17.1

