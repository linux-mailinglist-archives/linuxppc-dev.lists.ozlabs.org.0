Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A641BDAE5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 13:44:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BxVq72XJzDr4R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 21:44:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BxSv6jQtzDq77
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 21:42:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VN9jSEoO; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49BxSv63jsz9sRY; Wed, 29 Apr 2020 21:42:23 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49BxSt4pGzz9sPF;
 Wed, 29 Apr 2020 21:42:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588160543;
 bh=1tlusSBwGr5U0w6ErMbJb/gNa+IXcP1MkkFVn6Y7ZS4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VN9jSEoOBhTB0p7EzleihEGvDqn7BKfU3Cu5uchJytHan/oluvoCAsbvHah1ywvX6
 03PZ0H6jz1OeHzfonu9hVvZStkygHM4752zpFI5LAEZ+RNKl57gC0jM80kll0LzVY6
 ZnT4PiKsu2ii0Fd4sGYZxGSxVhCMcQMKjhIhqKgkIC/PKNDjzkiz+B7f3ypWbgum0x
 0gPTGfbVuuc6J11czz8r+wn2MJb9ZCCWdBmPwgR4NokJJ5rizd0HhGuvaxjpjhqnXb
 mT5GFrV9GWYM/Mbt8Ijx6t1L++y/J2NdDG/bfDS4iTbvAdJtBPSYIo7yp6FOBvki4G
 cUWQl8eQ7nvug==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] powerpc/spufs: Add rcu_read_lock() around fcheck()
In-Reply-To: <20200428135245.GA2827@lst.de>
References: <20200428114811.68436-1-mpe@ellerman.id.au>
 <20200428135245.GA2827@lst.de>
Date: Wed, 29 Apr 2020 21:42:39 +1000
Message-ID: <875zdifrgw.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, hch@lst.de,
 viro@zeniv.linux.org.uk, jk@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christoph Hellwig <hch@lst.de> writes:
> On Tue, Apr 28, 2020 at 09:48:11PM +1000, Michael Ellerman wrote:
>> 
>> This comes from fcheck_files() via fcheck().
>> 
>> It's pretty clearly documented that fcheck() must be wrapped with
>> rcu_read_lock(), so fix it.
>
> But for this to actually be useful you'd need the rcu read lock until
> your are done with the file (or got a reference).

Hmm OK. My reasoning was that we were done with the struct file, because
we return the ctx that's hanging off the inode.

+	ctx = SPUFS_I(file_inode(file))->i_ctx;

But I guess the lifetime of the ctx is not guaranteed if the file goes
away.

It looks like the only long lived reference on the ctx is the one
taken in spufs_new_file() and dropped in spufs_evict_inode().

So if we take a reference to the ctx with the RCU lock held we should be
safe, I think. But I've definitely exhausted my spufs/vfs knowledge at
this point.

Something like below.

cheers


diff --git a/arch/powerpc/platforms/cell/spufs/coredump.c b/arch/powerpc/platforms/cell/spufs/coredump.c
index 8b3296b62f65..37c155254cd5 100644
--- a/arch/powerpc/platforms/cell/spufs/coredump.c
+++ b/arch/powerpc/platforms/cell/spufs/coredump.c
@@ -82,13 +82,20 @@ static int match_context(const void *v, struct file *file, unsigned fd)
  */
 static struct spu_context *coredump_next_context(int *fd)
 {
+       struct spu_context *ctx;
        struct file *file;
        int n = iterate_fd(current->files, *fd, match_context, NULL);
        if (!n)
                return NULL;
        *fd = n - 1;
+
+       rcu_read_lock();
        file = fcheck(*fd);
-       return SPUFS_I(file_inode(file))->i_ctx;
+       ctx = SPUFS_I(file_inode(file))->i_ctx;
+       get_spu_context(ctx);
+       rcu_read_unlock();
+
+       return ctx;
 }

 int spufs_coredump_extra_notes_size(void)
@@ -99,17 +106,23 @@ int spufs_coredump_extra_notes_size(void)
        fd = 0;
        while ((ctx = coredump_next_context(&fd)) != NULL) {
                rc = spu_acquire_saved(ctx);
-               if (rc)
+               if (rc) {
+                       put_spu_context(ctx);
                        break;
+               }
+
                rc = spufs_ctx_note_size(ctx, fd);
                spu_release_saved(ctx);
-               if (rc < 0)
+               if (rc < 0) {
+                       put_spu_context(ctx);
                        break;
+               }

                size += rc;

                /* start searching the next fd next time */
                fd++;
+               put_spu_context(ctx);
        }

        return size;

