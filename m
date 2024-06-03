Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3366B8FA569
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 00:14:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=jMkzvXns;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtSgP1fmJz3cyc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 08:14:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=jMkzvXns;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050:0:465::201; helo=mout-p-201.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-201.mailbox.org (unknown [IPv6:2001:67c:2050:0:465::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtSfY5Q3pz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 08:13:23 +1000 (AEST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4VtSfC58Zlz9sZG;
	Tue,  4 Jun 2024 00:13:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1717452787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A4mvgXvzsnDLCwao81wHmfd72l0a/3E0/ihIluzp53E=;
	b=jMkzvXnsDbJMZoaVvMV9HUytnV1y8iZ5KUo9y1GdlxePPX3XfQBk/s6pqxLBiUcOLlfkVk
	4ayMfjjbjpLwwPRDTtLkMZ5InIqxthuD8ZRRSJim7C9L/McHiAtiPQYFKFgLEHGnmKr0jg
	lC2U+4tuwDf2dvtnn9jtqQ3sO8A+XweQPmmOJmBAphNUhej6GQiaB4ZsNl7D/rvOH+Q4bS
	Tn5EGAmlejUafEI1k+QohoXu2A/Qsz5asXCr/dzhX1DHEkx6xcjLedRWCTcJ+xtZHcIDjX
	ndxSvjfgjMTvemQUY67wki8rSZf9iWh39Q0vuis64IX65xKphxiJwA3SQFM/1w==
Date: Tue, 4 Jun 2024 00:13:04 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Yu Zhao <yuzhao@google.com>
Subject: Re: kswapd0: page allocation failure: order:0,
 mode:0x820(GFP_ATOMIC), nodemask=(null),cpuset=/,mems_allowed=0 (Kernel
 v6.5.9, 32bit ppc)
Message-ID: <20240604001304.5420284f@yea>
In-Reply-To: <20240602200332.3e531ff1@yea>
References: <20240508202111.768b7a4d@yea>
	<20240515224524.1c8befbe@yea>
	<CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
	<CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
	<20240602200332.3e531ff1@yea>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/L6u2AePrH2ig2h2isRGtuja"
X-MBO-RS-ID: 1fbfa6395497c39efc6
X-MBO-RS-META: 46pgksj1cfgiiro3owzb3sxib5g9z6g6
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
Cc: Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--MP_/L6u2AePrH2ig2h2isRGtuja
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sun, 2 Jun 2024 20:03:32 +0200
Erhard Furtner <erhard_f@mailbox.org> wrote:

> On Sat, 1 Jun 2024 00:01:48 -0600
> Yu Zhao <yuzhao@google.com> wrote:
> 
> > The OOM kills on both kernel versions seem to be reasonable to me.
> > 
> > Your system has 2GB memory and it uses zswap with zsmalloc (which is
> > good since it can allocate from the highmem zone) and zstd/lzo (which
> > doesn't matter much). Somehow -- I couldn't figure out why -- it
> > splits the 2GB into a 0.25GB DMA zone and a 1.75GB highmem zone:
> > 
> > [    0.000000] Zone ranges:
> > [    0.000000]   DMA      [mem 0x0000000000000000-0x000000002fffffff]
> > [    0.000000]   Normal   empty
> > [    0.000000]   HighMem  [mem 0x0000000030000000-0x000000007fffffff]
> > 
> > The kernel can't allocate from the highmem zone -- only userspace and
> > zsmalloc can. OOM kills were due to the low memory conditions in the
> > DMA zone where the kernel itself failed to allocate from.
> > 
> > Do you know a kernel version that doesn't have OOM kills while running
> > the same workload? If so, could you send that .config to me? If not,
> > could you try disabling CONFIG_HIGHMEM? (It might not help but I'm out
> > of ideas at the moment.)

Ok, the bisect I did actually revealed something meaningful:

 # git bisect good
b8cf32dc6e8c75b712cbf638e0fd210101c22f17 is the first bad commit
commit b8cf32dc6e8c75b712cbf638e0fd210101c22f17
Author: Yosry Ahmed <yosryahmed@google.com>
Date:   Tue Jun 20 19:46:44 2023 +0000

    mm: zswap: multiple zpools support
    
    Support using multiple zpools of the same type in zswap, for concurrency
    purposes.  A fixed number of 32 zpools is suggested by this commit, which
    was determined empirically.  It can be later changed or made into a config
    option if needed.
    
    On a setup with zswap and zsmalloc, comparing a single zpool to 32 zpools
    shows improvements in the zsmalloc lock contention, especially on the swap
    out path.
    
    The following shows the perf analysis of the swapout path when 10
    workloads are simultaneously reclaiming and refaulting tmpfs pages.  There
    are some improvements on the swap in path as well, but less significant.
    
    1 zpool:
    
     |--28.99%--zswap_frontswap_store
           |
           <snip>
           |
           |--8.98%--zpool_map_handle
           |     |
           |      --8.98%--zs_zpool_map
           |           |
           |            --8.95%--zs_map_object
           |                 |
           |                  --8.38%--_raw_spin_lock
           |                       |
           |                        --7.39%--queued_spin_lock_slowpath
           |
           |--8.82%--zpool_malloc
           |     |
           |      --8.82%--zs_zpool_malloc
           |           |
           |            --8.80%--zs_malloc
           |                 |
           |                 |--7.21%--_raw_spin_lock
           |                 |     |
           |                 |      --6.81%--queued_spin_lock_slowpath
           <snip>
    
    32 zpools:
    
     |--16.73%--zswap_frontswap_store
           |
           <snip>
           |
           |--1.81%--zpool_malloc
           |     |
           |      --1.81%--zs_zpool_malloc
           |           |
           |            --1.79%--zs_malloc
           |                 |
           |                  --0.73%--obj_malloc
           |
           |--1.06%--zswap_update_total_size
           |
           |--0.59%--zpool_map_handle
           |     |
           |      --0.59%--zs_zpool_map
           |           |
           |            --0.57%--zs_map_object
           |                 |
           |                  --0.51%--_raw_spin_lock
           <snip>
    
    Link: https://lkml.kernel.org/r/20230620194644.3142384-1-yosryahmed@google.com
    Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
    Suggested-by: Yu Zhao <yuzhao@google.com>
    Acked-by: Chris Li (Google) <chrisl@kernel.org>
    Reviewed-by: Nhat Pham <nphamcs@gmail.com>
    Tested-by: Nhat Pham <nphamcs@gmail.com>
    Cc: Dan Streetman <ddstreet@ieee.org>
    Cc: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
    Cc: Johannes Weiner <hannes@cmpxchg.org>
    Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
    Cc: Seth Jennings <sjenning@redhat.com>
    Cc: Vitaly Wool <vitaly.wool@konsulko.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

 mm/zswap.c | 81 +++++++++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 54 insertions(+), 27 deletions(-)


'bad' bisects were where the "kswapd0: page allocation failure:" showed up when running the workload, 'good' bisects were the cases where I only got the kernels OOM reaper killing the workload. In the good cases the machine stayed usable via VNC, in the bad cases with the issue showing up the machine crashed and rebooted >80% of the time shortly after showing the issue in dmesg (via netconsole). I triple checked the good cases to be sure only the OOM reaper showed up and not the kswapd0: page allocation failure.

Bisect.log attached.

Regards,
Erhard

--MP_/L6u2AePrH2ig2h2isRGtuja
Content-Type: text/x-log
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=bisect.log

git bisect start
# Status: warte auf guten und schlechten Commit
# good: [88690811da69826fdb59d908a6e5e9d0c63b581a] Linux 6.1.92
git bisect good 88690811da69826fdb59d908a6e5e9d0c63b581a
# Status: warte auf schlechten Commit, 1 guter Commit bekannt
# bad: [a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6] Linux 6.9
git bisect bad a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
# good: [830b3c68c1fb1e9176028d02ef86f3cf76aa2476] Linux 6.1
git bisect good 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
# good: [1b580c9bb63414903cfb414571e92e4fd36d6969] Merge branch 'samples-bpf-remove-unmaintained-xdp-sample-utilities'
git bisect good 1b580c9bb63414903cfb414571e92e4fd36d6969
# bad: [5ab500d6f9f50d8246865a2ead85d0e88ea30004] Merge branch 'sfc-implement-ndo_hwtstamp_-get-set'
git bisect bad 5ab500d6f9f50d8246865a2ead85d0e88ea30004
# bad: [cc33a80b816406f900a53c7f98a50f6eacdd2e31] MAINTAINERS: Maintainer change for ptp_vmw driver
git bisect bad cc33a80b816406f900a53c7f98a50f6eacdd2e31
# bad: [4debf77169ee459c46ec70e13dc503bc25efd7d2] Merge tag 'for-linus-iommufd' of git://git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd
git bisect bad 4debf77169ee459c46ec70e13dc503bc25efd7d2
# bad: [1086eeac9c333b6db6c98594f02996c8261c60c5] Merge tag 'lsm-pr-20230829' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm
git bisect bad 1086eeac9c333b6db6c98594f02996c8261c60c5
# good: [0fc81f376468ce67d70ecd1016dfe901a51a39f5] Merge tag 'regmap-v6.6' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap
git bisect good 0fc81f376468ce67d70ecd1016dfe901a51a39f5
# good: [bd6c11bc43c496cddfc6cf603b5d45365606dbd5] Merge tag 'net-next-6.6' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
git bisect good bd6c11bc43c496cddfc6cf603b5d45365606dbd5
# bad: [5553b15a4bbba8039e1f31b63642048286f540dc] m68k: implement the new page table range API
git bisect bad 5553b15a4bbba8039e1f31b63642048286f540dc
# good: [0c2e394ab23017303f676e6206a54c54bb0e3681] mm: move FAULT_FLAG_VMA_LOCK check down in handle_pte_fault()
git bisect good 0c2e394ab23017303f676e6206a54c54bb0e3681
# bad: [3f32c49ed6f15c8412a8abc93a92c4b37e6c4592] mm: memtest: convert to memtest_report_meminfo()
git bisect bad 3f32c49ed6f15c8412a8abc93a92c4b37e6c4592
# bad: [6ad243b83b5094026fdb3171711ddb25246b3d8a] mm/damon/sysfs: implement a command for updating only schemes tried total bytes
git bisect bad 6ad243b83b5094026fdb3171711ddb25246b3d8a
# bad: [68af05143fd4b49d4b12eab8d63c91ffbc7c4e5e] kernel/iomem.c: remove __weak ioremap_cache helper
git bisect bad 68af05143fd4b49d4b12eab8d63c91ffbc7c4e5e
# good: [27af67f35631ac4b61b5e4455b44c9aee8d2cc4b] powerpc/book3s64/mm: enable transparent pud hugepage
git bisect good 27af67f35631ac4b61b5e4455b44c9aee8d2cc4b
# bad: [34f4c198bfbe86612c368eb122002787acecaa93] zswap: make zswap_store() take a folio
git bisect bad 34f4c198bfbe86612c368eb122002787acecaa93
# good: [601f006fddc66e369fdac7c572f981eafd159dac] powerpc/book3s64/radix: remove mmu_vmemmap_psize
git bisect good 601f006fddc66e369fdac7c572f981eafd159dac
# bad: [b8cf32dc6e8c75b712cbf638e0fd210101c22f17] mm: zswap: multiple zpools support
git bisect bad b8cf32dc6e8c75b712cbf638e0fd210101c22f17
# good: [6be3601517d90b728095d70c14f3a04b9adcb166] powerpc/book3s64/radix: add debug message to give more details of vmemmap allocation
git bisect good 6be3601517d90b728095d70c14f3a04b9adcb166
# first bad commit: [b8cf32dc6e8c75b712cbf638e0fd210101c22f17] mm: zswap: multiple zpools support

--MP_/L6u2AePrH2ig2h2isRGtuja--
