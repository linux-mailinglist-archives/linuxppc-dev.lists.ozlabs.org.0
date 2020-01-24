Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFD91484CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 12:59:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483yP43xJYzDqSH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 22:59:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=V//h0p7U; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483yHS1j2kzDqWW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 22:54:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 483yHL5Jhfz9tyMx;
 Fri, 24 Jan 2020 12:54:38 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=V//h0p7U; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hC0xabd_cC7B; Fri, 24 Jan 2020 12:54:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 483yHL49tRz9tyMv;
 Fri, 24 Jan 2020 12:54:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579866878; bh=fFxxBbDSiQ4kyaur0i36Y7pRI4nKyfmVPP5T0+RR+xU=;
 h=From:Subject:To:Cc:Date:From;
 b=V//h0p7UdpCJ5oKx89rwT4aC4Igd9sFhpaRglHuvYGEr3w5++06ZWAbgBlniipIzS
 SxFNVUCWKyhEYKG5ypDhfmUGGf+N6tb9ZAVqiSRp7QXLeTD8qT31Sr8L2zzfgsxDzU
 V8SjL9gy5fr4JSrLNGcwxixekydFV/fo09MNYqEk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CC3078B85D;
 Fri, 24 Jan 2020 12:54:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QZuQzUt0Vq3W; Fri, 24 Jan 2020 12:54:39 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.111])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9EE558B84A;
 Fri, 24 Jan 2020 12:54:39 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5C061651F0; Fri, 24 Jan 2020 11:54:39 +0000 (UTC)
Message-Id: <b6f97231868c43b90ae7abe7f68f84d176a8ebe1.1579866752.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 1/7] readdir: make user_access_begin() use the real access
 range
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 24 Jan 2020 11:54:39 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Linus Torvalds <torvalds@linux-foundation.org>

In commit 9f79b78ef744 ("Convert filldir[64]() from __put_user() to
unsafe_put_user()") I changed filldir to not do individual __put_user()
accesses, but instead use unsafe_put_user() surrounded by the proper
user_access_begin/end() pair.

That make them enormously faster on modern x86, where the STAC/CLAC
games make individual user accesses fairly heavy-weight.

However, the user_access_begin() range was not really the exact right
one, since filldir() has the unfortunate problem that it needs to not
only fill out the new directory entry, it also needs to fix up the
previous one to contain the proper file offset.

It's unfortunate, but the "d_off" field in "struct dirent" is _not_ the
file offset of the directory entry itself - it's the offset of the next
one.  So we end up backfilling the offset in the previous entry as we
walk along.

But since x86 didn't really care about the exact range, and used to be
the only architecture that did anything fancy in user_access_begin() to
begin with, the filldir[64]() changes did something lazy, and even
commented on it:

	/*
	 * Note! This range-checks 'previous' (which may be NULL).
	 * The real range was checked in getdents
	 */
	if (!user_access_begin(dirent, sizeof(*dirent)))
		goto efault;

and it all worked fine.

But now 32-bit ppc is starting to also implement user_access_begin(),
and the fact that we faked the range to only be the (possibly not even
valid) previous directory entry becomes a problem, because ppc32 will
actually be using the range that is passed in for more than just "check
that it's user space".

This is a complete rewrite of Christophe's original patch.

By saving off the record length of the previous entry instead of a
pointer to it in the filldir data structures, we can simplify the range
check and the writing of the previous entry d_off field.  No need for
any conditionals in the user accesses themselves, although we retain the
conditional EINTR checking for the "was this the first directory entry"
signal handling latency logic.

Fixes: 9f79b78ef744 ("Convert filldir[64]() from __put_user() to unsafe_put_user()")
Link: https://lore.kernel.org/lkml/a02d3426f93f7eb04960a4d9140902d278cab0bb.1579697910.git.christophe.leroy@c-s.fr/
Link: https://lore.kernel.org/lkml/408c90c4068b00ea8f1c41cca45b84ec23d4946b.1579783936.git.christophe.leroy@c-s.fr/
Reported-and-tested-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v4: taken from Linus' tree
---
 fs/readdir.c | 73 +++++++++++++++++++++++++---------------------------
 1 file changed, 35 insertions(+), 38 deletions(-)

diff --git a/fs/readdir.c b/fs/readdir.c
index d26d5ea4de7b..d5ee72280c82 100644
--- a/fs/readdir.c
+++ b/fs/readdir.c
@@ -206,7 +206,7 @@ struct linux_dirent {
 struct getdents_callback {
 	struct dir_context ctx;
 	struct linux_dirent __user * current_dir;
-	struct linux_dirent __user * previous;
+	int prev_reclen;
 	int count;
 	int error;
 };
@@ -214,12 +214,13 @@ struct getdents_callback {
 static int filldir(struct dir_context *ctx, const char *name, int namlen,
 		   loff_t offset, u64 ino, unsigned int d_type)
 {
-	struct linux_dirent __user * dirent;
+	struct linux_dirent __user *dirent, *prev;
 	struct getdents_callback *buf =
 		container_of(ctx, struct getdents_callback, ctx);
 	unsigned long d_ino;
 	int reclen = ALIGN(offsetof(struct linux_dirent, d_name) + namlen + 2,
 		sizeof(long));
+	int prev_reclen;
 
 	buf->error = verify_dirent_name(name, namlen);
 	if (unlikely(buf->error))
@@ -232,28 +233,24 @@ static int filldir(struct dir_context *ctx, const char *name, int namlen,
 		buf->error = -EOVERFLOW;
 		return -EOVERFLOW;
 	}
-	dirent = buf->previous;
-	if (dirent && signal_pending(current))
+	prev_reclen = buf->prev_reclen;
+	if (prev_reclen && signal_pending(current))
 		return -EINTR;
-
-	/*
-	 * Note! This range-checks 'previous' (which may be NULL).
-	 * The real range was checked in getdents
-	 */
-	if (!user_access_begin(dirent, sizeof(*dirent)))
-		goto efault;
-	if (dirent)
-		unsafe_put_user(offset, &dirent->d_off, efault_end);
 	dirent = buf->current_dir;
+	prev = (void __user *) dirent - prev_reclen;
+	if (!user_access_begin(prev, reclen + prev_reclen))
+		goto efault;
+
+	/* This might be 'dirent->d_off', but if so it will get overwritten */
+	unsafe_put_user(offset, &prev->d_off, efault_end);
 	unsafe_put_user(d_ino, &dirent->d_ino, efault_end);
 	unsafe_put_user(reclen, &dirent->d_reclen, efault_end);
 	unsafe_put_user(d_type, (char __user *) dirent + reclen - 1, efault_end);
 	unsafe_copy_dirent_name(dirent->d_name, name, namlen, efault_end);
 	user_access_end();
 
-	buf->previous = dirent;
-	dirent = (void __user *)dirent + reclen;
-	buf->current_dir = dirent;
+	buf->current_dir = (void __user *)dirent + reclen;
+	buf->prev_reclen = reclen;
 	buf->count -= reclen;
 	return 0;
 efault_end:
@@ -267,7 +264,6 @@ SYSCALL_DEFINE3(getdents, unsigned int, fd,
 		struct linux_dirent __user *, dirent, unsigned int, count)
 {
 	struct fd f;
-	struct linux_dirent __user * lastdirent;
 	struct getdents_callback buf = {
 		.ctx.actor = filldir,
 		.count = count,
@@ -285,8 +281,10 @@ SYSCALL_DEFINE3(getdents, unsigned int, fd,
 	error = iterate_dir(f.file, &buf.ctx);
 	if (error >= 0)
 		error = buf.error;
-	lastdirent = buf.previous;
-	if (lastdirent) {
+	if (buf.prev_reclen) {
+		struct linux_dirent __user * lastdirent;
+		lastdirent = (void __user *)buf.current_dir - buf.prev_reclen;
+
 		if (put_user(buf.ctx.pos, &lastdirent->d_off))
 			error = -EFAULT;
 		else
@@ -299,7 +297,7 @@ SYSCALL_DEFINE3(getdents, unsigned int, fd,
 struct getdents_callback64 {
 	struct dir_context ctx;
 	struct linux_dirent64 __user * current_dir;
-	struct linux_dirent64 __user * previous;
+	int prev_reclen;
 	int count;
 	int error;
 };
@@ -307,11 +305,12 @@ struct getdents_callback64 {
 static int filldir64(struct dir_context *ctx, const char *name, int namlen,
 		     loff_t offset, u64 ino, unsigned int d_type)
 {
-	struct linux_dirent64 __user *dirent;
+	struct linux_dirent64 __user *dirent, *prev;
 	struct getdents_callback64 *buf =
 		container_of(ctx, struct getdents_callback64, ctx);
 	int reclen = ALIGN(offsetof(struct linux_dirent64, d_name) + namlen + 1,
 		sizeof(u64));
+	int prev_reclen;
 
 	buf->error = verify_dirent_name(name, namlen);
 	if (unlikely(buf->error))
@@ -319,30 +318,27 @@ static int filldir64(struct dir_context *ctx, const char *name, int namlen,
 	buf->error = -EINVAL;	/* only used if we fail.. */
 	if (reclen > buf->count)
 		return -EINVAL;
-	dirent = buf->previous;
-	if (dirent && signal_pending(current))
+	prev_reclen = buf->prev_reclen;
+	if (prev_reclen && signal_pending(current))
 		return -EINTR;
-
-	/*
-	 * Note! This range-checks 'previous' (which may be NULL).
-	 * The real range was checked in getdents
-	 */
-	if (!user_access_begin(dirent, sizeof(*dirent)))
-		goto efault;
-	if (dirent)
-		unsafe_put_user(offset, &dirent->d_off, efault_end);
 	dirent = buf->current_dir;
+	prev = (void __user *)dirent - prev_reclen;
+	if (!user_access_begin(prev, reclen + prev_reclen))
+		goto efault;
+
+	/* This might be 'dirent->d_off', but if so it will get overwritten */
+	unsafe_put_user(offset, &prev->d_off, efault_end);
 	unsafe_put_user(ino, &dirent->d_ino, efault_end);
 	unsafe_put_user(reclen, &dirent->d_reclen, efault_end);
 	unsafe_put_user(d_type, &dirent->d_type, efault_end);
 	unsafe_copy_dirent_name(dirent->d_name, name, namlen, efault_end);
 	user_access_end();
 
-	buf->previous = dirent;
-	dirent = (void __user *)dirent + reclen;
-	buf->current_dir = dirent;
+	buf->prev_reclen = reclen;
+	buf->current_dir = (void __user *)dirent + reclen;
 	buf->count -= reclen;
 	return 0;
+
 efault_end:
 	user_access_end();
 efault:
@@ -354,7 +350,6 @@ int ksys_getdents64(unsigned int fd, struct linux_dirent64 __user *dirent,
 		    unsigned int count)
 {
 	struct fd f;
-	struct linux_dirent64 __user * lastdirent;
 	struct getdents_callback64 buf = {
 		.ctx.actor = filldir64,
 		.count = count,
@@ -372,9 +367,11 @@ int ksys_getdents64(unsigned int fd, struct linux_dirent64 __user *dirent,
 	error = iterate_dir(f.file, &buf.ctx);
 	if (error >= 0)
 		error = buf.error;
-	lastdirent = buf.previous;
-	if (lastdirent) {
+	if (buf.prev_reclen) {
+		struct linux_dirent64 __user * lastdirent;
 		typeof(lastdirent->d_off) d_off = buf.ctx.pos;
+
+		lastdirent = (void __user *) buf.current_dir - buf.prev_reclen;
 		if (__put_user(d_off, &lastdirent->d_off))
 			error = -EFAULT;
 		else
-- 
2.25.0

