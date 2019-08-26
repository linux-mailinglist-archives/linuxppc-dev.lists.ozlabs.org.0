Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4B09D313
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 17:40:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HGR46fnxzDqjd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 01:40:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=dsterba@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HGNN5VJjzDqhC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 01:37:38 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6A496B0B6;
 Mon, 26 Aug 2019 15:37:34 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id B158EDA98E; Mon, 26 Aug 2019 17:37:57 +0200 (CEST)
Date: Mon, 26 Aug 2019 17:37:57 +0200
From: David Sterba <dsterba@suse.cz>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2] btrfs: fix allocation of bitmap pages.
Message-ID: <20190826153757.GW2752@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz,
 Christophe Leroy <christophe.leroy@c-s.fr>, erhard_f@mailbox.org,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org
References: <c3157c8e8e0e7588312b40c853f65c02fe6c957a.1566399731.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3157c8e8e0e7588312b40c853f65c02fe6c957a.1566399731.git.christophe.leroy@c-s.fr>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
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
Reply-To: dsterba@suse.cz
Cc: erhard_f@mailbox.org, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 David Sterba <dsterba@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 21, 2019 at 03:05:55PM +0000, Christophe Leroy wrote:
> Various notifications of type "BUG kmalloc-4096 () : Redzone
> overwritten" have been observed recently in various parts of
> the kernel. After some time, it has been made a relation with
> the use of BTRFS filesystem.
> 
> [   22.809700] BUG kmalloc-4096 (Tainted: G        W        ): Redzone overwritten
> [   22.809971] -----------------------------------------------------------------------------
> 
> [   22.810286] INFO: 0xbe1a5921-0xfbfc06cd. First byte 0x0 instead of 0xcc
> [   22.810866] INFO: Allocated in __load_free_space_cache+0x588/0x780 [btrfs] age=22 cpu=0 pid=224
> [   22.811193] 	__slab_alloc.constprop.26+0x44/0x70
> [   22.811345] 	kmem_cache_alloc_trace+0xf0/0x2ec
> [   22.811588] 	__load_free_space_cache+0x588/0x780 [btrfs]
> [   22.811848] 	load_free_space_cache+0xf4/0x1b0 [btrfs]
> [   22.812090] 	cache_block_group+0x1d0/0x3d0 [btrfs]
> [   22.812321] 	find_free_extent+0x680/0x12a4 [btrfs]
> [   22.812549] 	btrfs_reserve_extent+0xec/0x220 [btrfs]
> [   22.812785] 	btrfs_alloc_tree_block+0x178/0x5f4 [btrfs]
> [   22.813032] 	__btrfs_cow_block+0x150/0x5d4 [btrfs]
> [   22.813262] 	btrfs_cow_block+0x194/0x298 [btrfs]
> [   22.813484] 	commit_cowonly_roots+0x44/0x294 [btrfs]
> [   22.813718] 	btrfs_commit_transaction+0x63c/0xc0c [btrfs]
> [   22.813973] 	close_ctree+0xf8/0x2a4 [btrfs]
> [   22.814107] 	generic_shutdown_super+0x80/0x110
> [   22.814250] 	kill_anon_super+0x18/0x30
> [   22.814437] 	btrfs_kill_super+0x18/0x90 [btrfs]
> [   22.814590] INFO: Freed in proc_cgroup_show+0xc0/0x248 age=41 cpu=0 pid=83
> [   22.814841] 	proc_cgroup_show+0xc0/0x248
> [   22.814967] 	proc_single_show+0x54/0x98
> [   22.815086] 	seq_read+0x278/0x45c
> [   22.815190] 	__vfs_read+0x28/0x17c
> [   22.815289] 	vfs_read+0xa8/0x14c
> [   22.815381] 	ksys_read+0x50/0x94
> [   22.815475] 	ret_from_syscall+0x0/0x38
> 
> Commit 69d2480456d1 ("btrfs: use copy_page for copying pages instead
> of memcpy") changed the way bitmap blocks are copied. But allthough
> bitmaps have the size of a page, they were allocated with kzalloc().
> 
> Most of the time, kzalloc() allocates aligned blocks of memory, so
> copy_page() can be used. But when some debug options like SLAB_DEBUG
> are activated, kzalloc() may return unaligned pointer.
> 
> On powerpc, memcpy(), copy_page() and other copying functions use
> 'dcbz' instruction which provides an entire zeroed cacheline to avoid
> memory read when the intention is to overwrite a full line. Functions
> like memcpy() are writen to care about partial cachelines at the start
> and end of the destination, but copy_page() assumes it gets pages. As
> pages are naturally cache aligned, copy_page() doesn't care about
> partial lines. This means that when copy_page() is called with a
> misaligned pointer, a few leading bytes are zeroed.
> 
> To fix it, allocate bitmaps through kmem_cache instead of using kzalloc()
> The cache pool is created with PAGE_SIZE alignment constraint.
> 
> Reported-by: Erhard F. <erhard_f@mailbox.org>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=204371
> Fixes: 69d2480456d1 ("btrfs: use copy_page for copying pages instead of memcpy")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
> v2: Using kmem_cache instead of get_zeroed_page() in order to benefit from SLAB debugging features like redzone.

I'll take this version, thanks. Though I'm not happy about the allocator
behaviour. The kmem cache based fix can be backported independently to
4.19 regardless of the SL*B fixes.

> +extern struct kmem_cache *btrfs_bitmap_cachep;

I've renamed the cache to btrfs_free_space_bitmap_cachep

Reviewed-by: David Sterba <dsterba@suse.com>
