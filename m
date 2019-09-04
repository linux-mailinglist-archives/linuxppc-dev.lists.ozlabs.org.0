Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0699CA93BD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 22:31:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NwSd2M9CzDq9L
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 06:30:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cyphar.com
 (client-ip=2001:67c:2050:104:0:2:25:2; helo=mx2.mailbox.org;
 envelope-from=cyphar@cyphar.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mx2.mailbox.org (mx2a.mailbox.org
 [IPv6:2001:67c:2050:104:0:2:25:2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NwDt2JcPzDqtW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 06:20:46 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 50DC1A1169;
 Wed,  4 Sep 2019 22:20:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id NLDvBaFlidIu; Wed,  4 Sep 2019 22:20:38 +0200 (CEST)
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>,
 David Howells <dhowells@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Christian Brauner <christian@brauner.io>
Subject: [PATCH v12 02/12] clone3: switch to copy_struct_from_user()
Date: Thu,  5 Sep 2019 06:19:23 +1000
Message-Id: <20190904201933.10736-3-cyphar@cyphar.com>
In-Reply-To: <20190904201933.10736-1-cyphar@cyphar.com>
References: <20190904201933.10736-1-cyphar@cyphar.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org,
 Aleksa Sarai <cyphar@cyphar.com>, Andy Lutomirski <luto@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, David Drysdale <drysdale@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-api@vger.kernel.org,
 Chanho Min <chanho.min@lge.com>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The change is very straightforward, and takes advantage of the (very
minor) efficiency improvements in copy_struct_from_user() -- that the
memchr_inv() check is done on a buffer instead of one-at-at-time with
get_user().

Additionally, explicitly define CLONE_ARGS_SIZE_VER0 to match the other
users of the struct-extension pattern.

Cc: Christian Brauner <christian@brauner.io>
Signed-off-by: Aleksa Sarai <cyphar@cyphar.com>
---
 include/uapi/linux/sched.h |  2 ++
 kernel/fork.c              | 34 ++++++----------------------------
 2 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/include/uapi/linux/sched.h b/include/uapi/linux/sched.h
index b3105ac1381a..0945805982b4 100644
--- a/include/uapi/linux/sched.h
+++ b/include/uapi/linux/sched.h
@@ -47,6 +47,8 @@ struct clone_args {
 	__aligned_u64 tls;
 };
 
+#define CLONE_ARGS_SIZE_VER0 64 /* sizeof first published struct */
+
 /*
  * Scheduling policies
  */
diff --git a/kernel/fork.c b/kernel/fork.c
index 2852d0e76ea3..70c10d9b429a 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2528,39 +2528,17 @@ SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
 #ifdef __ARCH_WANT_SYS_CLONE3
 noinline static int copy_clone_args_from_user(struct kernel_clone_args *kargs,
 					      struct clone_args __user *uargs,
-					      size_t size)
+					      size_t usize)
 {
+	int err;
 	struct clone_args args;
 
-	if (unlikely(size > PAGE_SIZE))
-		return -E2BIG;
-
-	if (unlikely(size < sizeof(struct clone_args)))
+	if (unlikely(usize < CLONE_ARGS_SIZE_VER0))
 		return -EINVAL;
 
-	if (unlikely(!access_ok(uargs, size)))
-		return -EFAULT;
-
-	if (size > sizeof(struct clone_args)) {
-		unsigned char __user *addr;
-		unsigned char __user *end;
-		unsigned char val;
-
-		addr = (void __user *)uargs + sizeof(struct clone_args);
-		end = (void __user *)uargs + size;
-
-		for (; addr < end; addr++) {
-			if (get_user(val, addr))
-				return -EFAULT;
-			if (val)
-				return -E2BIG;
-		}
-
-		size = sizeof(struct clone_args);
-	}
-
-	if (copy_from_user(&args, uargs, size))
-		return -EFAULT;
+	err = copy_struct_from_user(&args, sizeof(args), uargs, usize);
+	if (err)
+		return err;
 
 	*kargs = (struct kernel_clone_args){
 		.flags		= args.flags,
-- 
2.23.0

