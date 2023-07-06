Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDB6749D30
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 15:18:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=t-8ch.de header.i=@t-8ch.de header.a=rsa-sha256 header.s=mail header.b=YPx73hGj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxcXn1bG2z3bvW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 23:18:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=t-8ch.de header.i=@t-8ch.de header.a=rsa-sha256 header.s=mail header.b=YPx73hGj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=t-8ch.de (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=thomas@t-8ch.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 432 seconds by postgrey-1.37 at boromir; Thu, 06 Jul 2023 16:41:37 AEST
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxRl55smbz308W
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 16:41:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1688625246; bh=wGh8sC6IYBYdKxlAz7SbNdKF40ye/5pg3jNi0szIZdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPx73hGjeInNwO8XW9YDw/0029Hl2CRVsf3+EbiYq9NJKba3B0wDjph7Wb4wbkhvx
	 HSd+Wbs2wcVsfrDiBrP4zGaNOJkMyDayMjNbnCLhuPBB4LH6gEB9CnO/W99Oq4gzmr
	 R/QxSRHb9Fy7oWFhaPvScKavywLnmvlrZ6TsMVW0=
Date: Thu, 6 Jul 2023 08:34:05 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [next-20230705] kernel BUG mm/memcontrol.c:3715! (ltp/madvise06)
Message-ID: <24c0f417-6577-48e6-8eb4-c37be11c5fbb@t-8ch.de>
References: <7DF50AC5-83AC-4EE1-9422-62D1EA378EE9@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7DF50AC5-83AC-4EE1-9422-62D1EA378EE9@linux.ibm.com>
X-Mailman-Approved-At: Thu, 06 Jul 2023 23:17:34 +1000
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
Cc: linux-next@vger.kernel.org, mhocko@suse.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-07-06 11:41:38+0530, Sachin Sant wrote:
> While running LTP tests (madvise06) on IBM Power9 LPAR booted with
> 6.4.0-next-20230705 following crash is seen
> 
> Injecting memory failure for pfn 0x3f79 at process virtual address 0x7fff9b740000
> Memory failure: 0x3f79: recovery action for clean LRU page: Recovered
> madvise06 (133636): drop_caches: 3
> ------------[ cut here ]------------
> kernel BUG at mm/memcontrol.c:3715!
> Oops: Exception in kernel mode, sig: 5 [#1]
> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=8192 NUMA pSeries
> Modules linked in: brd overlay exfat vfat fat xfs loop sctp ip6_udp_tunnel udp_tunnel dm_mod nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bonding ip_set tls rfkill nf_tables libcrc32c nfnetlink sunrpc pseries_rng vmx_crypto ext4 mbcache jbd2 sd_mod t10_pi crc64_rocksoft crc64 sg ibmvscsi scsi_transport_srp ibmveth fuse [last unloaded: init_module(O)]
> CPU: 10 PID: 133636 Comm: madvise06 Tainted: G O 6.4.0-next-20230705 #1
> Hardware name: IBM,8375-42A POWER9 (raw) 0x4e0202 0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
> NIP: c00000000054ea88 LR: c00000000028b2a8 CTR: c00000000054e8d0
> REGS: c00000029dd7b890 TRAP: 0700 Tainted: G O (6.4.0-next-20230705)
> MSR: 8000000000029033 <SF,EE,ME,IR,DR,RI,LE> CR: 28008288 XER: 00000000
> CFAR: c00000000054e904 IRQMASK: 0 
> GPR00: c00000000028b2a8 c00000029dd7bb30 c000000001431600 c0000002bc978000 
> GPR04: c000000002b3b288 0000000000010192 0000000000000000 0000000000000001 
> GPR08: c0000000f9abb180 0000000000020000 c0000002bc978580 0000000000000000 
> GPR12: c00000000054e8d0 c00000001ec53f00 0000000000000000 0000000000000000 
> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> GPR20: c00000001b2e6578 0000000000400cc0 000000007fff0000 fffffffffffff000 
> GPR24: c00000029dd7bd30 0000000000000000 c00000029dd7bd58 c00000001b2e6568 
> GPR28: c00000029dd7bde0 0000000000000001 0000000000000001 c00000001b2e6540 
> NIP [c00000000054ea88] mem_cgroup_read_u64+0x1b8/0x1d0
> LR [c00000000028b2a8] cgroup_seqfile_show+0xb8/0x160
> Call Trace:
> [c00000029dd7bb50] [c00000000028b2a8] cgroup_seqfile_show+0xb8/0x160
> [c00000029dd7bbc0] [c000000000673ba4] kernfs_seq_show+0x44/0x60
> [c00000029dd7bbe0] [c0000000005c4238] seq_read_iter+0x238/0x620
> [c00000029dd7bcb0] [c000000000675064] kernfs_fop_read_iter+0x1d4/0x2c0
> [c00000029dd7bd00] [c00000000057fbac] vfs_read+0x26c/0x350
> [c00000029dd7bdc0] [c00000000058077c] ksys_read+0x7c/0x140
> [c00000029dd7be10] [c000000000036900] system_call_exception+0x140/0x350
> [c00000029dd7be50] [c00000000000d6a0] system_call_common+0x160/0x2e4
> --- interrupt: c00 at 0x7fff9eb41484
> NIP: 00007fff9eb41484 LR: 0000000010008540 CTR: 0000000000000000
> REGS: c00000029dd7be80 TRAP: 0c00 Tainted: G O (6.4.0-next-20230705)
> MSR: 800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE> CR: 28002282 XER: 00000000
> IRQMASK: 0 
> GPR00: 0000000000000003 00007fffc33de7d0 00007fff9ec27300 0000000000000013 
> GPR04: 00007fffc33e0aa0 0000000000001fff 0000000000000000 0000000000000013 
> GPR08: 00007fffc33e0aa0 0000000000000000 0000000000000000 0000000000000000 
> GPR12: 0000000000000000 00007fff9ecca3a0 0000000000000000 0000000000000000 
> GPR16: ffffffffffffffff 0000000010035520 0000000010035b90 00000000100347a8 
> GPR20: 000000001002fb68 0000000010063900 0000000000002000 000000001002fb68 
> GPR24: 0000000000000000 000000000000004c 000000001002fa78 00007fffc33e0aa0 
> GPR28: 0000000000000013 0000000000000000 0000000000001fff 0000000000001fff 
> NIP [00007fff9eb41484] 0x7fff9eb41484
> LR [0000000010008540] 0x10008540
> --- interrupt: c00
> Code: 7fa34800 409effc4 7c0802a6 38600001 f8010030 4bfffdfd e8010030 786383e4 7c0803a6 4bffff6c 7c0802a6 f8010030 <0fe00000> 7c0802a6 f8010030 0fe00000 
> ---[ end trace 0000000000000000 ]---
> pstore: backend (nvram) writing error (-1)
> 
> Kernel panic - not syncing: Fatal exception
> Rebooting in 10 seconds..
> 
> Git bisect points to following patch:
> 
> commit 29bf1eb7d2abbdfc24c4ef7acf7a51b72dc43d2b
>     memcg: drop kmem.limit_in_bytes
> 
> Does the testcase madvise06 need an update?
> 
> 90         tst_res(TINFO, "\tCached: %ld Kb",
> 91                 SAFE_READ_MEMINFO("Cached:") - init_cached);
> 92       
> 93         print_cgmem("memory.current");
> 94         print_cgmem("memory.swap.current");
> 95         print_cgmem("memory.kmem.usage_in_bytes”);  <<== this line. 
> 96 }
> 
> If I comment line 95 from the testcase, it completes successfully.

The handling for _KMEM was removed from mem_cgroup_read_u64()
incorrectly.
It is used by the still existing kmem.*usage*_in_bytes in addition to
the now removed kmem.*limit*_in_bytes.
(And kmem.max_usage_in_bytes, kmem.failcnt)

The testcase seems to be fine, it actually did its job.
