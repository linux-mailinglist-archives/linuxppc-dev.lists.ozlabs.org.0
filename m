Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C93135F8224
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 03:49:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mkp5K55Syz3fZF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 12:49:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WvIpI0oG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=djwong@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WvIpI0oG;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mkh3B5lktz2yMk
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Oct 2022 08:17:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB3E461747;
	Fri,  7 Oct 2022 21:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08267C433C1;
	Fri,  7 Oct 2022 21:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665177443;
	bh=NdTN1rJRVjwWbCds+aKCtjsrPJHC36DwsRDyq/yjEcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WvIpI0oG/gjIti+rkj8Wf5M7C1JbY3GYncWq/hiYthoAT8Xj1wLp5LY+7+UsyXWv4
	 PJdEwS2IDEHoDsQsp/+vJ/smsSpoVaeZX746jDY4/61qKQkvLeWLSRCUIfoSX5JB6a
	 XpKsgI/he+cVWW55H+4e9My6pgLar2oIIk4LtxLpMqCwQAGYOyeCKsXtJtE0tRh/tZ
	 jBEidU7YriwTHyzpjy/WQEcDxpjFFdy3lUIkvWXPC858LYibnylNJcRC/9bIaOyieI
	 WAosrtInHBHCX0Q7mUSgAO5s3BOWODkWf0IGJ7mGUZ/cZn1WTs4qv5NLKizg/6a3kN
	 97ny6FY3znzZw==
Date: Fri, 7 Oct 2022 14:17:22 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v4 2/6] treewide: use prandom_u32_max() when possible
Message-ID: <Y0CXYjV8qMpJxxBa@magnolia>
References: <20221007180107.216067-1-Jason@zx2c4.com>
 <20221007180107.216067-3-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221007180107.216067-3-Jason@zx2c4.com>
X-Mailman-Approved-At: Sat, 08 Oct 2022 12:28:34 +1100
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
Cc: linux-wireless@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, x86@kernel.org, Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>, linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, kernel-janitors@vger.kernel.org, KP Singh <kpsingh@kernel.org>, dri-devel@lists.freedesktop.org, patches@lists.linux.dev, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com, "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org, Helge Deller 
 <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Airlie <airlied@redhat.com>, Paolo Abeni <pabeni@redhat.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Pablo Neira Ayuso <pablo@netfilter.org>, linux-media@vger.kernel.org, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>, linux-nvme@lists.infradead.org, loongarch@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johannes Berg <johannes@sipsolutions.net>, linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, linux-mmc@vger.kernel.org
 , Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org, Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Jan Kara <jack@suse.com>, Thomas Graf <tgraf@suug.ch>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 07, 2022 at 12:01:03PM -0600, Jason A. Donenfeld wrote:
> Rather than incurring a division or requesting too many random bytes for
> the given range, use the prandom_u32_max() function, which only takes
> the minimum required bytes from the RNG and avoids divisions.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: KP Singh <kpsingh@kernel.org>
> Reviewed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com> # for drbd
> Reviewed-by: Jan Kara <jack@suse.cz> # for ext2, ext4, and sbitmap
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---

<snip, skip to the xfs part>

> diff --git a/fs/xfs/libxfs/xfs_alloc.c b/fs/xfs/libxfs/xfs_alloc.c
> index e2bdf089c0a3..6261599bb389 100644
> --- a/fs/xfs/libxfs/xfs_alloc.c
> +++ b/fs/xfs/libxfs/xfs_alloc.c
> @@ -1520,7 +1520,7 @@ xfs_alloc_ag_vextent_lastblock(
>  
>  #ifdef DEBUG
>  	/* Randomly don't execute the first algorithm. */
> -	if (prandom_u32() & 1)
> +	if (prandom_u32_max(2))

I wonder if these usecases (picking 0 or 1 randomly) ought to have a
trivial wrapper to make it more obvious that we want boolean semantics:

static inline bool prandom_bool(void)
{
	return prandom_u32_max(2);
}

	if (prandom_bool())
		use_crazy_algorithm(...);

But this translation change looks correct to me, so for the XFS parts:
Acked-by: Darrick J. Wong <djwong@kernel.org>

--D


>  		return 0;
>  #endif
>  
> diff --git a/fs/xfs/libxfs/xfs_ialloc.c b/fs/xfs/libxfs/xfs_ialloc.c
> index 6cdfd64bc56b..7838b31126e2 100644
> --- a/fs/xfs/libxfs/xfs_ialloc.c
> +++ b/fs/xfs/libxfs/xfs_ialloc.c
> @@ -636,7 +636,7 @@ xfs_ialloc_ag_alloc(
>  	/* randomly do sparse inode allocations */
>  	if (xfs_has_sparseinodes(tp->t_mountp) &&
>  	    igeo->ialloc_min_blks < igeo->ialloc_blks)
> -		do_sparse = prandom_u32() & 1;
> +		do_sparse = prandom_u32_max(2);
>  #endif
>  
>  	/*
> diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
> index 4b71a96190a8..66ee9b4b7925 100644
> --- a/include/linux/nodemask.h
> +++ b/include/linux/nodemask.h
> @@ -509,7 +509,7 @@ static inline int node_random(const nodemask_t *maskp)
>  	w = nodes_weight(*maskp);
>  	if (w)
>  		bit = bitmap_ord_to_pos(maskp->bits,
> -			get_random_int() % w, MAX_NUMNODES);
> +			prandom_u32_max(w), MAX_NUMNODES);
>  	return bit;
>  #else
>  	return 0;
> diff --git a/lib/cmdline_kunit.c b/lib/cmdline_kunit.c
> index e6a31c927b06..a72a2c16066e 100644
> --- a/lib/cmdline_kunit.c
> +++ b/lib/cmdline_kunit.c
> @@ -76,7 +76,7 @@ static void cmdline_test_lead_int(struct kunit *test)
>  		int rc = cmdline_test_values[i];
>  		int offset;
>  
> -		sprintf(in, "%u%s", prandom_u32_max(256), str);
> +		sprintf(in, "%u%s", get_random_int() % 256, str);
>  		/* Only first '-' after the number will advance the pointer */
>  		offset = strlen(in) - strlen(str) + !!(rc == 2);
>  		cmdline_do_one_test(test, in, rc, offset);
> @@ -94,7 +94,7 @@ static void cmdline_test_tail_int(struct kunit *test)
>  		int rc = strcmp(str, "") ? (strcmp(str, "-") ? 0 : 1) : 1;
>  		int offset;
>  
> -		sprintf(in, "%s%u", str, prandom_u32_max(256));
> +		sprintf(in, "%s%u", str, get_random_int() % 256);
>  		/*
>  		 * Only first and leading '-' not followed by integer
>  		 * will advance the pointer.
> diff --git a/lib/kobject.c b/lib/kobject.c
> index 5f0e71ab292c..a0b2dbfcfa23 100644
> --- a/lib/kobject.c
> +++ b/lib/kobject.c
> @@ -694,7 +694,7 @@ static void kobject_release(struct kref *kref)
>  {
>  	struct kobject *kobj = container_of(kref, struct kobject, kref);
>  #ifdef CONFIG_DEBUG_KOBJECT_RELEASE
> -	unsigned long delay = HZ + HZ * (get_random_int() & 0x3);
> +	unsigned long delay = HZ + HZ * prandom_u32_max(4);
>  	pr_info("kobject: '%s' (%p): %s, parent %p (delayed %ld)\n",
>  		 kobject_name(kobj), kobj, __func__, kobj->parent, delay);
>  	INIT_DELAYED_WORK(&kobj->release, kobject_delayed_cleanup);
> diff --git a/lib/reed_solomon/test_rslib.c b/lib/reed_solomon/test_rslib.c
> index 6faf9c9a6215..4d241bdc88aa 100644
> --- a/lib/reed_solomon/test_rslib.c
> +++ b/lib/reed_solomon/test_rslib.c
> @@ -199,7 +199,7 @@ static int get_rcw_we(struct rs_control *rs, struct wspace *ws,
>  
>  		derrlocs[i] = errloc;
>  
> -		if (ewsc && (prandom_u32() & 1)) {
> +		if (ewsc && prandom_u32_max(2)) {
>  			/* Erasure with the symbol intact */
>  			errlocs[errloc] = 2;
>  		} else {
> diff --git a/lib/sbitmap.c b/lib/sbitmap.c
> index c4f04edf3ee9..ef0661504561 100644
> --- a/lib/sbitmap.c
> +++ b/lib/sbitmap.c
> @@ -21,7 +21,7 @@ static int init_alloc_hint(struct sbitmap *sb, gfp_t flags)
>  		int i;
>  
>  		for_each_possible_cpu(i)
> -			*per_cpu_ptr(sb->alloc_hint, i) = prandom_u32() % depth;
> +			*per_cpu_ptr(sb->alloc_hint, i) = prandom_u32_max(depth);
>  	}
>  	return 0;
>  }
> diff --git a/lib/test_hexdump.c b/lib/test_hexdump.c
> index 0927f44cd478..41a0321f641a 100644
> --- a/lib/test_hexdump.c
> +++ b/lib/test_hexdump.c
> @@ -208,7 +208,7 @@ static void __init test_hexdump_overflow(size_t buflen, size_t len,
>  static void __init test_hexdump_overflow_set(size_t buflen, bool ascii)
>  {
>  	unsigned int i = 0;
> -	int rs = (prandom_u32_max(2) + 1) * 16;
> +	int rs = prandom_u32_max(2) + 1 * 16;
>  
>  	do {
>  		int gs = 1 << i;
> diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
> index 4f2f2d1bac56..56ffaa8dd3f6 100644
> --- a/lib/test_vmalloc.c
> +++ b/lib/test_vmalloc.c
> @@ -151,9 +151,7 @@ static int random_size_alloc_test(void)
>  	int i;
>  
>  	for (i = 0; i < test_loop_count; i++) {
> -		n = prandom_u32();
> -		n = (n % 100) + 1;
> -
> +		n = prandom_u32_max(n % 100) + 1;
>  		p = vmalloc(n * PAGE_SIZE);
>  
>  		if (!p)
> @@ -293,16 +291,12 @@ pcpu_alloc_test(void)
>  		return -1;
>  
>  	for (i = 0; i < 35000; i++) {
> -		unsigned int r;
> -
> -		r = prandom_u32();
> -		size = (r % (PAGE_SIZE / 4)) + 1;
> +		size = prandom_u32_max(PAGE_SIZE / 4) + 1;
>  
>  		/*
>  		 * Maximum PAGE_SIZE
>  		 */
> -		r = prandom_u32();
> -		align = 1 << ((r % 11) + 1);
> +		align = 1 << (prandom_u32_max(11) + 1);
>  
>  		pcpu[i] = __alloc_percpu(size, align);
>  		if (!pcpu[i])
> @@ -393,14 +387,11 @@ static struct test_driver {
>  
>  static void shuffle_array(int *arr, int n)
>  {
> -	unsigned int rnd;
>  	int i, j;
>  
>  	for (i = n - 1; i > 0; i--)  {
> -		rnd = prandom_u32();
> -
>  		/* Cut the range. */
> -		j = rnd % i;
> +		j = prandom_u32_max(i);
>  
>  		/* Swap indexes. */
>  		swap(arr[i], arr[j]);
> diff --git a/net/core/pktgen.c b/net/core/pktgen.c
> index a13ee452429e..5ca4f953034c 100644
> --- a/net/core/pktgen.c
> +++ b/net/core/pktgen.c
> @@ -2469,11 +2469,11 @@ static void mod_cur_headers(struct pktgen_dev *pkt_dev)
>  	}
>  
>  	if ((pkt_dev->flags & F_VID_RND) && (pkt_dev->vlan_id != 0xffff)) {
> -		pkt_dev->vlan_id = prandom_u32() & (4096 - 1);
> +		pkt_dev->vlan_id = prandom_u32_max(4096);
>  	}
>  
>  	if ((pkt_dev->flags & F_SVID_RND) && (pkt_dev->svlan_id != 0xffff)) {
> -		pkt_dev->svlan_id = prandom_u32() & (4096 - 1);
> +		pkt_dev->svlan_id = prandom_u32_max(4096);
>  	}
>  
>  	if (pkt_dev->udp_src_min < pkt_dev->udp_src_max) {
> diff --git a/net/ipv4/inet_hashtables.c b/net/ipv4/inet_hashtables.c
> index b9d995b5ce24..9dc070f2018e 100644
> --- a/net/ipv4/inet_hashtables.c
> +++ b/net/ipv4/inet_hashtables.c
> @@ -794,7 +794,7 @@ int __inet_hash_connect(struct inet_timewait_death_row *death_row,
>  	 * on low contention the randomness is maximal and on high contention
>  	 * it may be inexistent.
>  	 */
> -	i = max_t(int, i, (prandom_u32() & 7) * 2);
> +	i = max_t(int, i, prandom_u32_max(8) * 2);
>  	WRITE_ONCE(table_perturb[index], READ_ONCE(table_perturb[index]) + i + 2);
>  
>  	/* Head lock still held and bh's disabled */
> diff --git a/net/sunrpc/cache.c b/net/sunrpc/cache.c
> index c3c693b51c94..f075a9fb5ccc 100644
> --- a/net/sunrpc/cache.c
> +++ b/net/sunrpc/cache.c
> @@ -677,7 +677,7 @@ static void cache_limit_defers(void)
>  
>  	/* Consider removing either the first or the last */
>  	if (cache_defer_cnt > DFR_MAX) {
> -		if (prandom_u32() & 1)
> +		if (prandom_u32_max(2))
>  			discard = list_entry(cache_defer_list.next,
>  					     struct cache_deferred_req, recent);
>  		else
> diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
> index e976007f4fd0..c2caee703d2c 100644
> --- a/net/sunrpc/xprtsock.c
> +++ b/net/sunrpc/xprtsock.c
> @@ -1619,7 +1619,7 @@ static int xs_get_random_port(void)
>  	if (max < min)
>  		return -EADDRINUSE;
>  	range = max - min + 1;
> -	rand = (unsigned short) prandom_u32() % range;
> +	rand = (unsigned short) prandom_u32_max(range);
>  	return rand + min;
>  }
>  
> -- 
> 2.37.3
> 
