Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE595FA97C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 02:49:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mmcc51shLz3f9m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 11:49:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=PWVmhODf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=yjjh=2l=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=PWVmhODf;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmZNM5fX5z3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 10:08:51 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EFB8261062;
	Mon, 10 Oct 2022 23:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787B9C433D6;
	Mon, 10 Oct 2022 23:08:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="PWVmhODf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665443322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vIB8SkXJdq9zBFlYiq2VoiImKhyYI+n+MyCUYR8RA5M=;
	b=PWVmhODfxoLxmouLU9BSaRJUfU4D79e45lFdXqjJnTNnxqek6eXBe8jM+5cDLv2SWieydz
	eLZJ9/jyNqzGAPwZdOWv8VQPqwtzRTPS7Nn5+B7VgwranRRklK+6G2i0AgCO3+sEt9njmP
	YT5CZQFlI3Eo/Vff5VU/Sy3I4Wnve7U=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4caf0efb (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 10 Oct 2022 23:08:41 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v6 7/7] prandom: remove unused functions
Date: Mon, 10 Oct 2022 17:06:13 -0600
Message-Id: <20221010230613.1076905-8-Jason@zx2c4.com>
In-Reply-To: <20221010230613.1076905-1-Jason@zx2c4.com>
References: <20221010230613.1076905-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 Oct 2022 11:42:14 +1100
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
Cc: linux-wireless@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, kernel-janitors@vger.kernel.org, KP Singh <kpsingh@kernel.org>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com, "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.
 org>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Airlie <airlied@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>, Paolo Abeni <pabeni@redhat.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Pablo Neira Ayuso <pablo@netfilter.org>, linux-media@vger.kernel.org, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org, linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>, linux-nvme@lists.infradead.org, loongarch@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johannes Berg <johannes@sipsolutions.net>, linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, linux-mmc@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.
 franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Florian Westphal <fw@strlen.de>, linux-mips@vger.kernel.org, =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Jan Kara <jack@suse.com>, Thomas Graf <tgraf@suug.ch>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With no callers left of prandom_u32() and prandom_bytes(), as well as
get_random_int(), remove these deprecated wrappers, in favor of
get_random_u32() and get_random_bytes().

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/char/random.c   | 11 +++++------
 include/linux/prandom.h | 12 ------------
 include/linux/random.h  |  5 -----
 3 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 01acf235f263..2fe28eeb2f38 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -97,7 +97,7 @@ MODULE_PARM_DESC(ratelimit_disable, "Disable random ratelimit suppression");
  * Returns whether or not the input pool has been seeded and thus guaranteed
  * to supply cryptographically secure random numbers. This applies to: the
  * /dev/urandom device, the get_random_bytes function, and the get_random_{u8,
- * u16,u32,u64,int,long} family of functions.
+ * u16,u32,u64,long} family of functions.
  *
  * Returns: true if the input pool has been seeded.
  *          false if the input pool has not been seeded.
@@ -161,15 +161,14 @@ EXPORT_SYMBOL(wait_for_random_bytes);
  *	u16 get_random_u16()
  *	u32 get_random_u32()
  *	u64 get_random_u64()
- *	unsigned int get_random_int()
  *	unsigned long get_random_long()
  *
  * These interfaces will return the requested number of random bytes
  * into the given buffer or as a return value. This is equivalent to
- * a read from /dev/urandom. The u8, u16, u32, u64, int, and long
- * family of functions may be higher performance for one-off random
- * integers, because they do a bit of buffering and do not invoke
- * reseeding until the buffer is emptied.
+ * a read from /dev/urandom. The u8, u16, u32, u64, long family of
+ * functions may be higher performance for one-off random integers,
+ * because they do a bit of buffering and do not invoke reseeding
+ * until the buffer is emptied.
  *
  *********************************************************************/
 
diff --git a/include/linux/prandom.h b/include/linux/prandom.h
index 78db003bc290..e0a0759dd09c 100644
--- a/include/linux/prandom.h
+++ b/include/linux/prandom.h
@@ -12,18 +12,6 @@
 #include <linux/percpu.h>
 #include <linux/random.h>
 
-/* Deprecated: use get_random_u32 instead. */
-static inline u32 prandom_u32(void)
-{
-	return get_random_u32();
-}
-
-/* Deprecated: use get_random_bytes instead. */
-static inline void prandom_bytes(void *buf, size_t nbytes)
-{
-	return get_random_bytes(buf, nbytes);
-}
-
 struct rnd_state {
 	__u32 s1, s2, s3, s4;
 };
diff --git a/include/linux/random.h b/include/linux/random.h
index 08322f700cdc..147a5e0d0b8e 100644
--- a/include/linux/random.h
+++ b/include/linux/random.h
@@ -42,10 +42,6 @@ u8 get_random_u8(void);
 u16 get_random_u16(void);
 u32 get_random_u32(void);
 u64 get_random_u64(void);
-static inline unsigned int get_random_int(void)
-{
-	return get_random_u32();
-}
 static inline unsigned long get_random_long(void)
 {
 #if BITS_PER_LONG == 64
@@ -100,7 +96,6 @@ declare_get_random_var_wait(u8, u8)
 declare_get_random_var_wait(u16, u16)
 declare_get_random_var_wait(u32, u32)
 declare_get_random_var_wait(u64, u32)
-declare_get_random_var_wait(int, unsigned int)
 declare_get_random_var_wait(long, unsigned long)
 #undef declare_get_random_var
 
-- 
2.37.3

