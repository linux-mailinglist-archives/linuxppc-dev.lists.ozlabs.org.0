Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D009E145B36
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 18:56:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482tQ36XM3zDqS7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 04:56:43 +1100 (AEDT)
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
 header.s=mail header.b=EgAXh2JV; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482tKg4QyWzDqS2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 04:52:53 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 482tKV6dfNz9vBdk;
 Wed, 22 Jan 2020 18:52:46 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=EgAXh2JV; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NrSstf2601YN; Wed, 22 Jan 2020 18:52:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 482tKV5Fq7z9vBf2;
 Wed, 22 Jan 2020 18:52:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579715566; bh=BFcMmG1gr6ZHjF96WJjeRbfRazxCfc8BsdIu1Gb0FaQ=;
 h=From:Subject:To:Cc:Date:From;
 b=EgAXh2JVdH1m4rMSYMLWOuTFsFapRVRquT4G0KSmacXFMtvAiZSQhAKhlLoOMGcKQ
 OeUjFyYJdl/Bgobmxh/54lBo9S1Tl0oWUzvVH06axb1PXj3fnyvujIFHX86AFEgaVX
 Qd+FLSTJKxRGI3RLTRHG+WlUUDXRQM6tzKBihnhE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A3478B811;
 Wed, 22 Jan 2020 18:52:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gSUFGUjIatac; Wed, 22 Jan 2020 18:52:48 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E8EE78B812;
 Wed, 22 Jan 2020 18:52:47 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id A4622651E0; Wed, 22 Jan 2020 17:52:47 +0000 (UTC)
Message-Id: <12a4be679e43de1eca6e5e2173163f27e2f25236.1579715466.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 1/6] fs/readdir: Fix filldir() and filldir64() use of
 user_access_begin()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 22 Jan 2020 17:52:47 +0000 (UTC)
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some architectures grand full access to userspace regardless of the
address/len passed to user_access_begin(), but other architectures
only grand access to the requested area.

For exemple, on 32 bits powerpc (book3s/32), access is granted by
segments of 256 Mbytes.

Modify filldir() and filldir64() to request the real area they need
to get access to, i.e. the area covering the parent dirent (if any)
and the contiguous current dirent.

Fixes: 9f79b78ef744 ("Convert filldir[64]() from __put_user() to unsafe_put_user()")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v2: have user_access_begin() cover both parent dirent (if any) and current dirent
---
 fs/readdir.c | 50 ++++++++++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/fs/readdir.c b/fs/readdir.c
index d26d5ea4de7b..3f9b4488d9b7 100644
--- a/fs/readdir.c
+++ b/fs/readdir.c
@@ -214,7 +214,7 @@ struct getdents_callback {
 static int filldir(struct dir_context *ctx, const char *name, int namlen,
 		   loff_t offset, u64 ino, unsigned int d_type)
 {
-	struct linux_dirent __user * dirent;
+	struct linux_dirent __user * dirent, *dirent0;
 	struct getdents_callback *buf =
 		container_of(ctx, struct getdents_callback, ctx);
 	unsigned long d_ino;
@@ -232,19 +232,22 @@ static int filldir(struct dir_context *ctx, const char *name, int namlen,
 		buf->error = -EOVERFLOW;
 		return -EOVERFLOW;
 	}
-	dirent = buf->previous;
-	if (dirent && signal_pending(current))
+	dirent0 = buf->previous;
+	if (dirent0 && signal_pending(current))
 		return -EINTR;
 
-	/*
-	 * Note! This range-checks 'previous' (which may be NULL).
-	 * The real range was checked in getdents
-	 */
-	if (!user_access_begin(dirent, sizeof(*dirent)))
-		goto efault;
-	if (dirent)
-		unsafe_put_user(offset, &dirent->d_off, efault_end);
 	dirent = buf->current_dir;
+	if (dirent0) {
+		int sz = (void __user *)dirent + reclen -
+			 (void __user *)dirent0;
+
+		if (!user_access_begin(dirent0, sz))
+			goto efault;
+		unsafe_put_user(offset, &dirent0->d_off, efault_end);
+	} else {
+		if (!user_access_begin(dirent, reclen))
+			goto efault;
+	}
 	unsafe_put_user(d_ino, &dirent->d_ino, efault_end);
 	unsafe_put_user(reclen, &dirent->d_reclen, efault_end);
 	unsafe_put_user(d_type, (char __user *) dirent + reclen - 1, efault_end);
@@ -307,7 +310,7 @@ struct getdents_callback64 {
 static int filldir64(struct dir_context *ctx, const char *name, int namlen,
 		     loff_t offset, u64 ino, unsigned int d_type)
 {
-	struct linux_dirent64 __user *dirent;
+	struct linux_dirent64 __user *dirent, *dirent0;
 	struct getdents_callback64 *buf =
 		container_of(ctx, struct getdents_callback64, ctx);
 	int reclen = ALIGN(offsetof(struct linux_dirent64, d_name) + namlen + 1,
@@ -319,19 +322,22 @@ static int filldir64(struct dir_context *ctx, const char *name, int namlen,
 	buf->error = -EINVAL;	/* only used if we fail.. */
 	if (reclen > buf->count)
 		return -EINVAL;
-	dirent = buf->previous;
-	if (dirent && signal_pending(current))
+	dirent0 = buf->previous;
+	if (dirent0 && signal_pending(current))
 		return -EINTR;
 
-	/*
-	 * Note! This range-checks 'previous' (which may be NULL).
-	 * The real range was checked in getdents
-	 */
-	if (!user_access_begin(dirent, sizeof(*dirent)))
-		goto efault;
-	if (dirent)
-		unsafe_put_user(offset, &dirent->d_off, efault_end);
 	dirent = buf->current_dir;
+	if (dirent0) {
+		int sz = (void __user *)dirent + reclen -
+			 (void __user *)dirent0;
+
+		if (!user_access_begin(dirent0, sz))
+			goto efault;
+		unsafe_put_user(offset, &dirent0->d_off, efault_end);
+	} else {
+		if (!user_access_begin(dirent, reclen))
+			goto efault;
+	}
 	unsafe_put_user(ino, &dirent->d_ino, efault_end);
 	unsafe_put_user(reclen, &dirent->d_reclen, efault_end);
 	unsafe_put_user(d_type, &dirent->d_type, efault_end);
-- 
2.25.0

