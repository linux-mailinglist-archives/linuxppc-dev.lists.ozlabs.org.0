Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 690D07C7886
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 23:20:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Gyy213ul;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S62cT1wR7z3vXL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 08:20:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Gyy213ul;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fromorbit.com (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=david@fromorbit.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S62bY1pZdz3bPM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 08:20:07 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6c4e7951dddso945430a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 14:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1697145602; x=1697750402; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bl4OG7Ba8Nmf+LBtCmGhwqmuIVyzOyHOVisYzCu2RLg=;
        b=Gyy213ulAKHIQb/iEuUJK2wsrdMtFx98p0oSQweHWsm/Ban04rvJwTN0NlT+aUbL4Y
         A9/2+l/woTs50df2CpciLRRFv3rW/eJmZpoqSrL3uEhOBOAJFFA5aGuZPbAwFUROex0q
         DbkGYte5o+VnwY18wIDYFSPhNHMkyRENyDqeyKnFqXw58s7faG7XcP4T5J04kbeggjUi
         4RCleRfDMXsCi5esU6NIZm5AS8+1nvLSDv/D7FRlMaz6MJ4XEepiAA1yFLR7KUBj98zf
         GmuhasIvRnIZpI02wWmbY44bDhf5N6ohnE1kjgSG6gXJT5EM9u+zrMVliTRqZIC15+d6
         VsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697145602; x=1697750402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bl4OG7Ba8Nmf+LBtCmGhwqmuIVyzOyHOVisYzCu2RLg=;
        b=ADHPmClRQ83xYeUdonwbm+CD8ilFeUC69YlsDxQrEVFFr2I7GqHxS+aS2vxTBn1HB8
         X0g7dgdntJ/k26Ob0tOzcoY5aq1onEH+OFCiuhpcVXGNVH9PR2l9HtnQaaCOLWzNAyVH
         SEuSutY3OScVhnu6B0YyOTlsag404phwVaUHj2C4bI6wpRL8tS6FBK4i5ybmMs0ZzupV
         uAl0lDpJW1OxePHcs6WCE2TnQKkE+hU3NvUSYieFWzRMjlvZgV2fAMFvOicL8VWxnelT
         F+X5L0tFNaqu+FWpYs3IS5Ub6lwVElihPf8x4HyOKdmLdsZcqrz3dxY5hvhy9zntBlut
         mjtQ==
X-Gm-Message-State: AOJu0YxIoy4HmD30Bk11DFrkXP/P9Fxr+DljObJwwuqnR6bBDQII3VZm
	Mzs+ATs5ojy9jeA3I8TDk2JSIw==
X-Google-Smtp-Source: AGHT+IHQf4pY2xT/vf5Kiq/6NhUEukc4mA8P/mvNjVXGprBafD0GuKPXY9/NuqQ3uCZkpTD+XLyJVw==
X-Received: by 2002:a9d:6e06:0:b0:6c0:9498:7a77 with SMTP id e6-20020a9d6e06000000b006c094987a77mr28449694otr.32.1697145602421;
        Thu, 12 Oct 2023 14:20:02 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-20-59.pa.nsw.optusnet.com.au. [49.180.20.59])
        by smtp.gmail.com with ESMTPSA id h17-20020aa786d1000000b006933ea28070sm12738246pfo.12.2023.10.12.14.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 14:20:02 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qr367-00D0JX-0j;
	Fri, 13 Oct 2023 08:19:59 +1100
Date: Fri, 13 Oct 2023 08:19:59 +1100
From: Dave Chinner <david@fromorbit.com>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [powerpc] kernel BUG fs/xfs/xfs_message.c:102! [4k block]
Message-ID: <ZShi/83PAGVxbUQK@dread.disaster.area>
References: <EF7138E1-92EF-4A27-A666-316AAD7EFA43@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EF7138E1-92EF-4A27-A666-316AAD7EFA43@linux.ibm.com>
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
Cc: linux-xfs@vger.kernel.org, riteshh@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 12, 2023 at 03:51:04PM +0530, Sachin Sant wrote:
> While running xfstests on a IBM Power10 server having xfs file system with
> 4k block size following crash was seen
> 
> [ 1609.771548] run fstests xfs/238 at 2023-10-11 17:00:40
> [ 1609.971214] XFS (sdb1): Mounting V5 Filesystem 1105d60c-9514-4e7a-af6a-632d99bf06ea
> [ 1609.980693] XFS (sdb1): Ending clean mount
> [ 1609.982166] xfs filesystem being mounted at /mnt/test supports timestamps until 2038-01-19 (0x7fffffff)
> [ 1610.024793] XFS (sdb2): Mounting V5 Filesystem 60de8f0c-c80e-4a2a-b60a-f41a9cc0feca
> [ 1610.030295] XFS (sdb2): Ending clean mount
> [ 1610.031342] xfs filesystem being mounted at /mnt/scratch supports timestamps until 2038-01-19 (0x7fffffff)
> [ 1610.087139] XFS: Assertion failed: bp->b_flags & XBF_DONE, file: fs/xfs/xfs_trans_buf.c, line: 241
> [ 1610.087162] ------------[ cut here ]------------
> [ 1610.087165] kernel BUG at fs/xfs/xfs_message.c:102!
> [ 1610.087168] Oops: Exception in kernel mode, sig: 5 [#1]
> [ 1610.087171] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=8192 NUMA pSeries
> [ 1610.087175] Modules linked in: overlay dm_zero dm_thin_pool dm_persistent_data dm_bio_prison dm_snapshot dm_bufio loop dm_flakey xfs dm_mod nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding rfkill ip_set tls nf_tables libcrc32c nfnetlink pseries_rng vmx_crypto ext4 mbcache jbd2 sd_mod t10_pi crc64_rocksoft crc64 sg ibmvscsi scsi_transport_srp ibmveth fuse [last unloaded: scsi_debug]
> [ 1610.087220] CPU: 11 PID: 225897 Comm: kworker/11:46 Not tainted 6.6.0-rc5-gb8b05bc6d83c #1
> [ 1610.087224] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
> [ 1610.087227] Workqueue: xfs-inodegc/sdb2 xfs_inodegc_worker [xfs]
> [ 1610.087303] NIP: c008000002857edc LR: c008000002857ec8 CTR: 000000007fffffff
> [ 1610.087306] REGS: c00000002441b810 TRAP: 0700 Not tainted (6.6.0-rc5-gb8b05bc6d83c)
> [ 1610.087309] MSR: 800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> CR: 28000424 XER: 00000007
> [ 1610.087318] CFAR: c008000002857d1c IRQMASK: 0 
> [ 1610.087318] GPR00: c008000002857ec8 c00000002441bab0 c008000002a68300 ffffffffffffffea 
> [ 1610.087318] GPR04: 000000000000000a c00000002441b9b0 0000000000000000 c0080000016c6c40 
> [ 1610.087318] GPR08: ffffffffffffffc0 0000000000000001 0000000000000000 c00800000285a3a8 
> [ 1610.087318] GPR12: c0000000008311d0 c00000117fff1b00 c000000000197de8 c00000000936bf40 
> [ 1610.087318] GPR16: 0000000000000000 0000000000000000 0000000000000000 c0000009d16d48b0 
> [ 1610.087318] GPR20: c000000079e80205 c00000001cb52f80 c00000001cb52fc0 0000000080000000 
> [ 1610.087318] GPR24: 0000000000000001 c00000002441bbc8 c0000000e77a7000 c0000000209b7e00 
> [ 1610.087318] GPR28: c00800000279ae48 c0080000016b25f0 c00000002441bc10 c00000002dabaee8 
> [ 1610.087354] NIP [c008000002857edc] assfail+0x54/0x74 [xfs]
> [ 1610.087420] LR [c008000002857ec8] assfail+0x40/0x74 [xfs]
> [ 1610.087485] Call Trace:
> [ 1610.087486] [c00000002441bab0] [c008000002857ec8] assfail+0x40/0x74 [xfs] (unreliable)
> [ 1610.087551] [c00000002441bb10] [c00800000281cebc] xfs_trans_read_buf_map+0x384/0x590 [xfs]
> [ 1610.087622] [c00000002441bba0] [c00800000279ae48] xfs_imap_to_bp+0x70/0xa8 [xfs]
> [ 1610.087691] [c00000002441bbf0] [c00800000280c3ec] xfs_inode_item_precommit+0x244/0x320 [xfs]
> [ 1610.087760] [c00000002441bc60] [c0080000027f3034] xfs_trans_run_precommits+0xac/0x160 [xfs]
> [ 1610.087830] [c00000002441bcb0] [c0080000027f45b0] __xfs_trans_commit+0x68/0x430 [xfs]
> [ 1610.087900] [c00000002441bd20] [c0080000027dfc30] xfs_inactive_ifree+0x158/0x2a0 [xfs]
> [ 1610.087969] [c00000002441bdb0] [c0080000027dff84] xfs_inactive+0x20c/0x420 [xfs]
> [ 1610.088037] [c00000002441bdf0] [c0080000027ceb90] xfs_inodegc_worker+0x148/0x250 [xfs]
> [ 1610.088106] [c00000002441be40] [c000000000188130] process_scheduled_works+0x230/0x4f0
> [ 1610.088113] [c00000002441bf10] [c00000000018b164] worker_thread+0x1e4/0x500
> [ 1610.088118] [c00000002441bf90] [c000000000197f18] kthread+0x138/0x140
> [ 1610.088122] [c00000002441bfe0] [c00000000000df98] start_kernel_thread+0x14/0x18
> [ 1610.088127] Code: e8a5ca38 7c641b78 3c620000 e863ca48 f8010010 f821ffa1 4bfffd91 3d220000 e929ca50 89290010 2f890000 419e0008 <0fe00000> 0fe00000 38210060 e8010010 
> [ 1610.088140] ---[ end trace 0000000000000000 ]---
> [ 1610.093928] sh (1070303): drop_caches: 3
> [ 1610.095600] pstore: backend (nvram) writing error (-1)
> [ 1610.095605]
> 
> xfs/238 test was executed when the crash was encountered.
> Devices were formatted with 4k block size.

Yeah, I've seen this once before, I think I know what the problem is
from analysis of that failure, but I've been unable to reproduce it
again so I've not been able to confirm the diagnosis nor test a fix.

tl;dr: we just unlinked an inode whose cluster buffer has been
invalidated by xfs_icluster_free(). We go to log the inode, but this
is the first time we've logged the inode since it was last cleaned,
so it goes to read the cluster buffer to attach it. It finds the
cluster buffer already marked stale in the transaction, so the DONE
flag is not set and the ASSERT fires.

i.e. it appears to me that this requires inode cluster buffer
writeback between the unlink() operation and the inodegc
inactivation process to set the initial conditions for the problem
to trigger, and then have just a single inode in the inobt chunk
that triggers freeing of the chunk whilst the inode itself is clean. 

I need to confirm that this is the case before trying to fix it,
because this inode log item vs stale inode cluster buffer path is
tricky and nasty and there might be something else going on.
However, I haven't been able to reproduce this to be able to confirm
this hypothesis yet.

I suspect the fix may well be to use xfs_trans_buf_get() in the
xfs_inode_item_precommit() path if XFS_ISTALE is already set on the
inode we are trying to log. We don't need a populated cluster buffer
to read data out of or write data into in this path - all we need to
do is attach the inode to the buffer so that when the buffer
invalidation is committed to the journal it will also correctly
finish the stale inode log item.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
