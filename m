Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 611361454D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 14:09:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482m2j603mzDqRq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 00:09:33 +1100 (AEDT)
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
 header.s=mail header.b=Id0p0/pu; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482lrX6GdRzDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 00:00:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 482lrM6r0Bz9v4T1;
 Wed, 22 Jan 2020 14:00:35 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Id0p0/pu; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ER69ev4z_Xec; Wed, 22 Jan 2020 14:00:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 482lrM51BQz9v4T0;
 Wed, 22 Jan 2020 14:00:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579698035; bh=IYuSNHph3xeKS9BqJ4P2sNK404BWtsrlVrUfzRg8JZc=;
 h=From:Subject:To:Cc:Date:From;
 b=Id0p0/punrqkIoihRIjlOTDIJUf8EAaYY/45qzeAcFcpIvcYgWSV7dABhL2qWd+Rd
 OrZCEwEeHWaDFQsMYorxbrJexxNque0AKSTnLknGxGBn0IXYhJ8P0sIFr5JDMOEa91
 sZ3Li+AyYuqq/Ks/DIu38NLCzSiqIwLU7TDPZFEo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CD87C8B803;
 Wed, 22 Jan 2020 14:00:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id shOjK1liW11x; Wed, 22 Jan 2020 14:00:36 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D917D8B7FA;
 Wed, 22 Jan 2020 14:00:35 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9179F651E0; Wed, 22 Jan 2020 13:00:35 +0000 (UTC)
Message-Id: <a02d3426f93f7eb04960a4d9140902d278cab0bb.1579697910.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 1/6] fs/readdir: Fix filldir() and filldir64() use of
 user_access_begin()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 22 Jan 2020 13:00:35 +0000 (UTC)
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
to get access to.

Fixes: 9f79b78ef744 ("Convert filldir[64]() from __put_user() to unsafe_put_user()")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 fs/readdir.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/fs/readdir.c b/fs/readdir.c
index d26d5ea4de7b..ef04e5e76c59 100644
--- a/fs/readdir.c
+++ b/fs/readdir.c
@@ -236,15 +236,11 @@ static int filldir(struct dir_context *ctx, const char *name, int namlen,
 	if (dirent && signal_pending(current))
 		return -EINTR;
 
-	/*
-	 * Note! This range-checks 'previous' (which may be NULL).
-	 * The real range was checked in getdents
-	 */
-	if (!user_access_begin(dirent, sizeof(*dirent)))
+	if (dirent && unlikely(put_user(offset, &dirent->d_off)))
 		goto efault;
-	if (dirent)
-		unsafe_put_user(offset, &dirent->d_off, efault_end);
 	dirent = buf->current_dir;
+	if (!user_access_begin(dirent, reclen))
+		goto efault;
 	unsafe_put_user(d_ino, &dirent->d_ino, efault_end);
 	unsafe_put_user(reclen, &dirent->d_reclen, efault_end);
 	unsafe_put_user(d_type, (char __user *) dirent + reclen - 1, efault_end);
@@ -323,15 +319,11 @@ static int filldir64(struct dir_context *ctx, const char *name, int namlen,
 	if (dirent && signal_pending(current))
 		return -EINTR;
 
-	/*
-	 * Note! This range-checks 'previous' (which may be NULL).
-	 * The real range was checked in getdents
-	 */
-	if (!user_access_begin(dirent, sizeof(*dirent)))
+	if (dirent && unlikely(put_user(offset, &dirent->d_off)))
 		goto efault;
-	if (dirent)
-		unsafe_put_user(offset, &dirent->d_off, efault_end);
 	dirent = buf->current_dir;
+	if (!user_access_begin(dirent, reclen))
+		goto efault;
 	unsafe_put_user(ino, &dirent->d_ino, efault_end);
 	unsafe_put_user(reclen, &dirent->d_reclen, efault_end);
 	unsafe_put_user(d_type, &dirent->d_type, efault_end);
-- 
2.25.0

