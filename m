Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A05212653
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 16:32:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yLCC18zwzDqT8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 00:32:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=erCtxijI; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yKkF080LzDqZL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 00:10:23 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id g13so21286127qtv.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=udayY5ABJDLOO0RvBXlK3pa4/Sym6FnknXTrvHcRBkc=;
 b=erCtxijIO8+63UgJpAZXzEgrcb2Xn2KMHK5IxHSpdhPhUSVkcXgzTP3pMUWFinsTTv
 iS56z/APXOChW7vFwwyHGs+SXNNto575Cjyat5MsE3KGJvCN5Cn696hFtqL8d+bdoCEP
 Z6PHmG/0MlAI3eWz/iyVU98zHL1wxvKjffit919phkZoBa5beuvNHpV5n9uz62ZT9z0Z
 nUWmDWim5fViFP6upMl1dAagQLrvjJQuGTpiK+ktufrL/M94KdqitLX+6mmWa6O6PxgV
 DF2wgWmzPiDL4LJkZ/EvBnVzn45qAWZKhBHVvShP0MIqsFtWKWlid8n8Kdq50+x1QLG5
 rTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=udayY5ABJDLOO0RvBXlK3pa4/Sym6FnknXTrvHcRBkc=;
 b=StXCYILEF7uJFJyq1lSKEwJAe6emO3M5lEjFzBoCiAHI23/t9vJ0v032vWAphjEgY+
 a+bdOQDRvsMY18JX/Z21daVYyYz5pslUS575Vtcay4xb5xJRiacZ43h5B9js6gqOn8FR
 7ZVlaZiW+hYoAdFZrGL1QyzfLUao6xNAzcBamWt34LqdJT9uc90/Dca4M0WwbPgES0bs
 p6YpQp5vBiDWpZBcs8WeVWT2I8ajtAc05AwkkzUgxJbJhp9DhtTq1EoYtwCN+qyQa+8k
 dFvJP+3q1/2CWQlFNKOSdWNAm2084R26pvHGAn8ba27k0fDI2Z1s30NpcjFb86QtuvZl
 TeNw==
X-Gm-Message-State: AOAM5334zyXzt1XOy5lcIB1GANJ+6DPqzfYsk9OiH2liWjZMNTRjQiTr
 Y6oCBAghdzx0ZP2BT0Dcne2iXA==
X-Google-Smtp-Source: ABdhPJyYCx8azMcUjuKq46aiD9c0/KurabVnlR+I6wfBrTFRxqOWJ6W4gtKFfBfKPUQVFD93F4GhoQ==
X-Received: by 2002:ac8:6d24:: with SMTP id r4mr6709054qtu.43.1593699017486;
 Thu, 02 Jul 2020 07:10:17 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id i28sm8412840qkh.1.2020.07.02.07.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 07:10:16 -0700 (PDT)
Date: Thu, 2 Jul 2020 10:10:10 -0400
From: Qian Cai <cai@lca.pw>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 18/20] block: refator submit_bio_noacct
Message-ID: <20200702141001.GA3834@lca.pw>
References: <20200629193947.2705954-1-hch@lst.de>
 <20200629193947.2705954-19-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629193947.2705954-19-hch@lst.de>
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-xtensa@linux-xtensa.org,
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, dm-devel@redhat.com,
 linux-bcache@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 29, 2020 at 09:39:45PM +0200, Christoph Hellwig wrote:
> Split out a __submit_bio_noacct helper for the actual de-recursion
> algorithm, and simplify the loop by using a continue when we can't
> enter the queue for a bio.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reverting this commit and its dependencies,

5a6c35f9af41 block: remove direct_make_request
ff93ea0ce763 block: shortcut __submit_bio_noacct for blk-mq drivers

fixed the stack-out-of-bounds during boot,

https://lore.kernel.org/linux-block/000000000000bcdeaa05a97280e4@google.com/

[   55.573431][ T1373] BUG: KASAN: stack-out-of-bounds in bio_alloc_bioset+0x493/0x4a0
bio_alloc_bioset+0x493/0x4a0:
bio_list_empty at include/linux/bio.h:561
(inlined by) bio_alloc_bioset at block/bio.c:482
[   55.581140][ T1373] Read of size 8 at addr ffffc9000a7df1e0 by task mount/1373
[   55.588409][ T1373]
[   55.590615][ T1373] CPU: 2 PID: 1373 Comm: mount Not tainted 5.8.0-rc3-next-20200702 #2
[   55.598672][ T1373] Hardware name: HPE ProLiant DL385 Gen10/ProLiant DL385 Gen10, BIOS A40 07/10/2019
[   55.607972][ T1373] Call Trace:
[   55.607980][ T1373]  dump_stack+0x9d/0xe0
[   55.607984][ T1373]  ? bio_alloc_bioset+0x493/0x4a0
[   55.607992][ T1373]  ? bio_alloc_bioset+0x493/0x4a0
[   55.625007][ T1373]  print_address_description.constprop.8.cold.10+0x56/0x44e
[   55.632191][ T1373]  ? bio_alloc_bioset+0x493/0x4a0
[   55.637100][ T1373]  ? bio_alloc_bioset+0x493/0x4a0
[   55.642011][ T1373]  kasan_report.cold.11+0x37/0x7c
[   55.646923][ T1373]  ? bio_alloc_bioset+0x493/0x4a0
[   55.651968][ T1373]  bio_alloc_bioset+0x493/0x4a0
[   55.651971][ T1373]  ? bvec_alloc+0x290/0x290
[   55.651975][ T1373]  ? mark_lock+0x147/0x1800
[   55.651978][ T1373]  ? mark_lock+0x147/0x1800
[   55.651981][ T1373]  bio_clone_fast+0xe/0x30
[   55.651983][ T1373]  bio_split+0x8a/0x4c0
[   55.651986][ T1373]  ? print_irqtrace_events+0x270/0x270
[   55.651990][ T1373]  __blk_queue_split+0xc42/0x13e0
[   55.651998][ T1373]  ? __lock_acquire+0xc57/0x4da0
         Startin[   55.693322][ T1373]  ? __blk_rq_map_sg+0x14c0/0x14c0
[   55.699711][ T1373]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[   55.705602][ T1373]  ? mark_held_locks+0xb0/0x110
[   55.705605][ T1373]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[   55.705608][ T1373]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[   55.705611][ T1373]  ? find_held_lock+0x33/0x1c0
[   55.705614][ T1373]  ? find_held_lock+0x33/0x1c0
[   55.705618][ T1373]  blk_mq_submit_bio+0x19e/0x1e20
[   55.705621][ T1373]  ? lock_downgrade+0x720/0x720
[   55.705624][ T1373]  ? blk_mq_try_issue_directly+0x140/0x140
[   55.705628][ T1373]  ? rcu_read_lock_sched_held+0xaa/0xd0
[   55.705631][ T1373]  ? rcu_read_lock_bh_held+0xc0/0xc0
[   55.705635][ T1373]  ? blk_queue_enter+0x83c/0x9a0
[   55.705647][ T1373]  ? submit_bio_checks+0x1cc0/0x1cc0
[   55.767384][ T1373]  submit_bio_noacct+0x9c0/0xeb0
[   55.772212][ T1373]  ? blk_queue_enter+0x9a0/0x9a0
[   55.777038][ T1373]  ? lockdep_hardirqs_on_prepare+0x550/0x550
[   55.782913][ T1373]  ? trace_hardirqs_on+0x20/0x1b5
[   55.787825][ T1373]  ? submit_bio+0xe7/0x480
[   55.792125][ T1373]  submit_bio+0xe7/0x480
[   55.796252][ T1373]  ? bio_associate_blkg_from_css+0x4a3/0xd30
[   55.802124][ T1373]  ? submit_bio_noacct+0xeb0/0xeb0
[   55.807124][ T1373]  ? lock_downgrade+0x720/0x720
[   55.811862][ T1373]  ? rcu_read_unlock+0x50/0x50
[   55.816512][ T1373]  ? lockdep_init_map_waits+0x267/0x7b0
[   55.821948][ T1373]  ? lockdep_init_map_waits+0x267/0x7b0
g LVM event acti[   55.827386][ T1373]  ? __raw_spin_lock_init+0x34/0x100
[   55.833957][ T1373]  submit_bio_wait+0xf9/0x200
vation on device[   55.838521][ T1373]  ? submit_bio_wait_endio+0x30/0x30
[   55.845091][ T1373]  xfs_rw_bdev+0x3ca/0x4d0
[   55.849396][ T1373]  xlog_do_io+0x149/0x320
[   55.853611][ T1373]  xlog_bread+0x1e/0xb0
[   55.857651][ T1373]  xlog_find_verify_log_record+0xba/0x4c0
[   55.863264][ T1373]  ? xlog_header_check_mount+0xb0/0xb0
[   55.868615][ T1373]  xlog_find_zeroed+0x2bc/0x4c0
 8:3...
[   55.873356][ T1373]  ? print_irqtrace_events+0x270/0x270
[   55.880093][ T1373]  ? xlog_find_verify_log_record+0x4c0/0x4c0
[   55.885966][ T1373]  ? __lock_acquire+0x1920/0x4da0
[   55.890881][ T1373]  xlog_find_head+0xd4/0x790
[   55.895355][ T1373]  ? xlog_find_zeroed+0x4c0/0x4c0
[   55.900269][ T1373]  ? rcu_read_lock_sched_held+0xaa/0xd0
[   55.905708][ T1373]  ? rcu_read_lock_bh_held+0xc0/0xc0
[   55.910885][ T1373]  ? sugov_update_single+0x18d/0x4f0
[   55.916058][ T1373]  xlog_find_tail+0xc2/0x810
[   55.920534][ T1373]  ? mark_lock+0x147/0x1800
[   55.924921][ T1373]  ? xlog_verify_head+0x4c0/0x4c0
[   55.929834][ T1373]  ? debug_show_held_locks+0x30/0x50
[   55.935007][ T1373]  ? print_irqtrace_events+0x270/0x270
[   55.940358][ T1373]  ? try_to_wake_up+0x6d1/0xf40
[   55.945094][ T1373]  ? mark_held_locks+0xb0/0x110
[   55.949835][ T1373]  ? lockdep_hardirqs_on_prepare+0x38c/0x550
[   55.955708][ T1373]  ? _raw_spin_unlock_irqrestore+0x39/0x40
[   55.961410][ T1373]  ? trace_hardirqs_on+0x20/0x1b5
[   55.966324][ T1373]  xlog_recover+0x7c/0x480
[   55.970627][ T1373]  ? xlog_buf_readahead+0x110/0x110
[   55.975715][ T1373]  ? migrate_swap_stop+0xbf0/0xbf0
[   55.980718][ T1373]  ? lockdep_init_map_waits+0x267/0x7b0
[   55.986156][ T1373]  ? __raw_spin_lock_init+0x34/0x100
[   55.991333][ T1373]  xfs_log_mount+0x541/0x660
[   55.995809][ T1373]  xfs_mountfs+0xccd/0x1a00
[   56.000202][ T1373]  ? queue_work_node+0x190/0x190
[   56.005028][ T1373]  ? rcu_read_lock_sched_held+0xaa/0xd0
[   56.010466][ T1373]  ? xfs_default_resblks+0x50/0x50
[   56.015464][ T1373]  ? xfs_filestream_get_parent+0xa0/0xa0
[   56.020989][ T1373]  ? init_timer_key+0x285/0x320
[   56.025727][ T1373]  ? lockdep_init_map_waits+0x267/0x7b0
[   56.031165][ T1373]  ? xfs_filestream_get_parent+0xa0/0xa0
[   56.036689][ T1373]  ? xfs_mru_cache_create+0x358/0x560
[   56.041951][ T1373]  xfs_fc_fill_super+0x6d3/0xd50
[   56.046777][ T1373]  get_tree_bdev+0x40a/0x690
[   56.051257][ T1373]  ? xfs_fs_inode_init_once+0xc0/0xc0
[   56.056523][ T1373]  vfs_get_tree+0x84/0x2c0
[   56.060827][ T1373]  do_mount+0xf93/0x1630
[   56.064953][ T1373]  ? rcu_read_lock_bh_held+0xc0/0xc0
[   56.070129][ T1373]  ? copy_mount_string+0x20/0x20
[   56.074956][ T1373]  ? _copy_from_user+0xbe/0x100
[   56.079696][ T1373]  ? memdup_user+0x4f/0x80
[   56.083999][ T1373]  __x64_sys_mount+0x15d/0x1b0
2m  OK  ] St[   56.088654][ T1373]  do_syscall_64+0x5f/0x310
[   56.094437][ T1373]  ? trace_hardirqs_off+0x12/0x1a0
[   56.099439][ T1373]  ? asm_exc_page_fault+0x8/0x30
[   56.104267][ T1373]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   56.110055][ T1373] RIP: 0033:0x7f3bc2c8a9ee
[   56.114357][ T1373] Code: Bad RIP value.
[   56.118309][ T1373] RSP: 002b:00007fffd4675718 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
arted File Syste[   56.126629][ T1373] RAX: ffffffffffffffda RBX: 000055a59d34c9c0 RCX: 00007f3bc2c8a9ee
[   56.135900][ T1373] RDX: 000055a59d34cba0 RSI: 000055a59d34cc00 RDI: 000055a59d34e900
[   56.143779][ T1373] RBP: 00007f3bc3a36184 R08: 0000000000000000 R09: 0000000000000003
[   56.151661][ T1373] R10: 00000000c0ed0000 R11: 0000000000000246 R12: 0000000000000000
[   56.159541][ T1373] R13: 00000000c0ed0000 R14: 000055a59d34e900 R15: 000055a59d34cba0
[   56.167422][ T1373]
[   56.169626][ T1373]
[   56.171831][ T1373] addr ffffc9000a7df1e0 is located in stack of task mount/1373 at offset 48 in frame:
[   56.181287][ T1373]  submit_bio_noacct+0x0/0xeb0
submit_bio_noacct at block/blk-core.c:1198
[   56.185939][ T1373]
[   56.188144][ T1373] this frame has 2 objects:
m Check on /dev/[   56.192532][ T1373]  [32, 48) 'bio_list'
[   56.192534][ T1373]  [96, 128) 'bio_list_on_stack'
[   56.197872][ T1373]
[   56.204894][ T1373] Memory state around the buggy address:
[   56.210420][ T1373]  ffffc9000a7df080: f2 f2 f2 f2 f2 00 f2 f2 f2 f2 f2 f2 f2 00 00 00
[   56.218389][ T1373]  ffffc9000a7df100: 00 00 f2 f2 f2 00 00 00 00 00 00 00 00 00 00 00
disk/by-uuid/D10[   56.226359][ T1373] >ffffc9000a7df180: 00 00 00 00 00 00 f1 f1 f1 f1 00 00 f2 f2 f2 f2
[   56.235718][ T1373]                                                        ^
[   56.242817][ T1373]  ffffc9000a7df200: f2 f2 00 00 00 00 f3 f3 f3 f3 00 00 00 00 00 00
[   56.250790][ T1373]  ffffc9000a7df280: 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1 00 f2
[   56.258757][ T1373] ==================================================================

> ---
>  block/blk-core.c | 131 +++++++++++++++++++++++++----------------------
>  1 file changed, 71 insertions(+), 60 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 1caeb01e127768..b82f48c86e6f7a 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -1085,6 +1085,74 @@ static blk_qc_t do_make_request(struct bio *bio)
>  	return ret;
>  }
>  
> +/*
> + * The loop in this function may be a bit non-obvious, and so deserves some
> + * explanation:
> + *
> + *  - Before entering the loop, bio->bi_next is NULL (as all callers ensure
> + *    that), so we have a list with a single bio.
> + *  - We pretend that we have just taken it off a longer list, so we assign
> + *    bio_list to a pointer to the bio_list_on_stack, thus initialising the
> + *    bio_list of new bios to be added.  ->submit_bio() may indeed add some more
> + *    bios through a recursive call to submit_bio_noacct.  If it did, we find a
> + *    non-NULL value in bio_list and re-enter the loop from the top.
> + *  - In this case we really did just take the bio of the top of the list (no
> + *    pretending) and so remove it from bio_list, and call into ->submit_bio()
> + *    again.
> + *
> + * bio_list_on_stack[0] contains bios submitted by the current ->submit_bio.
> + * bio_list_on_stack[1] contains bios that were submitted before the current
> + *	->submit_bio_bio, but that haven't been processed yet.
> + */
> +static blk_qc_t __submit_bio_noacct(struct bio *bio)
> +{
> +	struct bio_list bio_list_on_stack[2];
> +	blk_qc_t ret = BLK_QC_T_NONE;
> +
> +	BUG_ON(bio->bi_next);
> +
> +	bio_list_init(&bio_list_on_stack[0]);
> +	current->bio_list = bio_list_on_stack;
> +
> +	do {
> +		struct request_queue *q = bio->bi_disk->queue;
> +		struct bio_list lower, same;
> +
> +		if (unlikely(bio_queue_enter(bio) != 0))
> +			continue;
> +
> +		/*
> +		 * Create a fresh bio_list for all subordinate requests.
> +		 */
> +		bio_list_on_stack[1] = bio_list_on_stack[0];
> +		bio_list_init(&bio_list_on_stack[0]);
> +
> +		ret = do_make_request(bio);
> +
> +		/*
> +		 * Sort new bios into those for a lower level and those for the
> +		 * same level.
> +		 */
> +		bio_list_init(&lower);
> +		bio_list_init(&same);
> +		while ((bio = bio_list_pop(&bio_list_on_stack[0])) != NULL)
> +			if (q == bio->bi_disk->queue)
> +				bio_list_add(&same, bio);
> +			else
> +				bio_list_add(&lower, bio);
> +
> +		/*
> +		 * Now assemble so we handle the lowest level first.
> +		 */
> +		bio_list_merge(&bio_list_on_stack[0], &lower);
> +		bio_list_merge(&bio_list_on_stack[0], &same);
> +		bio_list_merge(&bio_list_on_stack[0], &bio_list_on_stack[1]);
> +	} while ((bio = bio_list_pop(&bio_list_on_stack[0])));
> +
> +	current->bio_list = NULL;
> +	return ret;
> +}
> +
>  /**
>   * submit_bio_noacct - re-submit a bio to the block device layer for I/O
>   * @bio:  The bio describing the location in memory and on the device.
> @@ -1096,17 +1164,8 @@ static blk_qc_t do_make_request(struct bio *bio)
>   */
>  blk_qc_t submit_bio_noacct(struct bio *bio)
>  {
> -	/*
> -	 * bio_list_on_stack[0] contains bios submitted by the current
> -	 * ->submit_bio.
> -	 * bio_list_on_stack[1] contains bios that were submitted before the
> -	 * current ->submit_bio_bio, but that haven't been processed yet.
> -	 */
> -	struct bio_list bio_list_on_stack[2];
> -	blk_qc_t ret = BLK_QC_T_NONE;
> -
>  	if (!submit_bio_checks(bio))
> -		goto out;
> +		return BLK_QC_T_NONE;
>  
>  	/*
>  	 * We only want one ->submit_bio to be active at a time, else
> @@ -1120,58 +1179,10 @@ blk_qc_t submit_bio_noacct(struct bio *bio)
>  	 */
>  	if (current->bio_list) {
>  		bio_list_add(&current->bio_list[0], bio);
> -		goto out;
> +		return BLK_QC_T_NONE;
>  	}
>  
> -	/* following loop may be a bit non-obvious, and so deserves some
> -	 * explanation.
> -	 * Before entering the loop, bio->bi_next is NULL (as all callers
> -	 * ensure that) so we have a list with a single bio.
> -	 * We pretend that we have just taken it off a longer list, so
> -	 * we assign bio_list to a pointer to the bio_list_on_stack,
> -	 * thus initialising the bio_list of new bios to be
> -	 * added.  ->submit_bio() may indeed add some more bios
> -	 * through a recursive call to submit_bio_noacct.  If it
> -	 * did, we find a non-NULL value in bio_list and re-enter the loop
> -	 * from the top.  In this case we really did just take the bio
> -	 * of the top of the list (no pretending) and so remove it from
> -	 * bio_list, and call into ->submit_bio() again.
> -	 */
> -	BUG_ON(bio->bi_next);
> -	bio_list_init(&bio_list_on_stack[0]);
> -	current->bio_list = bio_list_on_stack;
> -	do {
> -		struct request_queue *q = bio->bi_disk->queue;
> -
> -		if (likely(bio_queue_enter(bio) == 0)) {
> -			struct bio_list lower, same;
> -
> -			/* Create a fresh bio_list for all subordinate requests */
> -			bio_list_on_stack[1] = bio_list_on_stack[0];
> -			bio_list_init(&bio_list_on_stack[0]);
> -			ret = do_make_request(bio);
> -
> -			/* sort new bios into those for a lower level
> -			 * and those for the same level
> -			 */
> -			bio_list_init(&lower);
> -			bio_list_init(&same);
> -			while ((bio = bio_list_pop(&bio_list_on_stack[0])) != NULL)
> -				if (q == bio->bi_disk->queue)
> -					bio_list_add(&same, bio);
> -				else
> -					bio_list_add(&lower, bio);
> -			/* now assemble so we handle the lowest level first */
> -			bio_list_merge(&bio_list_on_stack[0], &lower);
> -			bio_list_merge(&bio_list_on_stack[0], &same);
> -			bio_list_merge(&bio_list_on_stack[0], &bio_list_on_stack[1]);
> -		}
> -		bio = bio_list_pop(&bio_list_on_stack[0]);
> -	} while (bio);
> -	current->bio_list = NULL; /* deactivate */
> -
> -out:
> -	return ret;
> +	return __submit_bio_noacct(bio);
>  }
>  EXPORT_SYMBOL(submit_bio_noacct);
>  
> -- 
> 2.26.2
> 
