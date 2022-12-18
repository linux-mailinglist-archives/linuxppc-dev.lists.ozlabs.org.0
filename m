Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 892DE650580
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 00:20:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NZzNH5nDpz3bfj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 10:20:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=McOHP9p4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=McOHP9p4;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NZzMJ7322z2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Dec 2022 10:19:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E9FBF60DEC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Dec 2022 23:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 491D6C433F0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Dec 2022 23:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671405593;
	bh=kAFQ18AbHqunHffIYnyNCKcOKPt3odN8Xj+xLRuFQlE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=McOHP9p4wlt3rOTfl0+xqigb+akQ+NV0YFvweNRtZK8pjualzX1E20nl0IE3U+ACP
	 L0doaIZW4I2rO9/G/db+52NXxrtGqgtuDj5GW1KHvJU8ulvsE9uK+ybz9hOHWZeCzh
	 V40yEsqDPJkuZPyX1AARM5L6NJVfuhAngQZML+vCb9ZphGgtsnYOU+tH78JiOcbNK3
	 Sm9brF2cyR0tbFs316hd7gptHzQnpF176ynnzd+ljdQC6Amv7POQ4ku5yFO/g+JT4G
	 74cldkFySNVXRmbiH3XCNwJZasjICq8BV3TTckS3zk6Gmu9UzKmh2usRoHL1UYi3XL
	 frJzu1unk5wIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2F4B6C43143; Sun, 18 Dec 2022 23:19:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216368] do_IRQ: stack overflow at boot during btrfs handling on
 a PowerMac G5 11,2
Date: Sun, 18 Dec 2022 23:19:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216368-206035-KRdV1V5Fq1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216368-206035@https.bugzilla.kernel.org/>
References: <bug-216368-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D216368

--- Comment #7 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303424
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303424&action=3Dedit
dmesg (6.1.0, PowerMac G5 11,2)

Still in v6.1.0. Happens sometimes at boot on my G5:

[...]
Stack Depot allocating hash table of 1048576 entries with kvcalloc
nouveau 0000:0a:00.0: DRM: Setting dpms mode 3 on TV encoder (output 4)
do_IRQ: stack overflow: 3440
CPU: 0 PID: 264 Comm: NetworkManager Tainted: G                T=20
6.1.0-gentoo-PMacG5 #2
Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
Call Trace:
[c00000000fff7e80] [c000000000b24980] .dump_stack_lvl+0x7c/0xd8 (unreliable)
[c00000000fff7f10] [c000000000010db4] .__do_irq+0x124/0x130
[c00000000fff7f90] [c0000000000114f8] .__do_IRQ+0x78/0x130
[c000000015c5cd70] [0000000000000001] 0x1
[c000000015c5ce00] [c0000000000116b4] .do_IRQ+0x104/0x250
[c000000015c5ce80] [c000000000008034]
hardware_interrupt_common_virt+0x214/0x220
--- interrupt: 500 at .dart_cache_sync+0x0/0x100
NIP:  c000000000063860 LR: c000000000063ce4 CTR: 0000000000000000
REGS: c000000015c5cef0 TRAP: 0500   Tainted: G                T=20=20
(6.1.0-gentoo-PMacG5)
MSR:  900000000200b032 <SF,HV,VEC,EE,FP,ME,IR,DR,RI>  CR: 44224280  XER:
20000000
IRQMASK: 0=20
GPR00: c000000000036620 c000000015c5d190 c000000000d9d500 c00000007f00962c=
=20
GPR04: 0000000000000001 0000000000000001 c000000018e2e000 0000000000000002=
=20
GPR08: c00000007f00962c 0000000080018e2d c00000007f009630 000000000258b000=
=20
GPR12: 0000000000001000 c0000000014ba000 0000000000000001 0000000000000001=
=20
GPR16: 0000000000000001 c0000000177f4000 0000000000000001 ffffffffffffffff=
=20
GPR20: c0000000177f4080 0000000000000002 c0000000018cc0d0 000000000258b000=
=20
GPR24: 0000000000001000 c0000000177f4000 0000000000000008 0000000000000004=
=20
GPR28: 0000000000000001 0000000000000001 0000000000000001 000000000000258b=
=20
NIP [c000000000063860] .dart_cache_sync+0x0/0x100
LR [c000000000063ce4] .dart_build+0x74/0x2b0
--- interrupt: 500
[c000000015c5d190] [0000000000000001] 0x1 (unreliable)
[c000000015c5d230] [c000000000036620] .ppc_iommu_map_sg+0x1f0/0x540
[c000000015c5d350] [c0000000000352bc] .dma_iommu_map_sg+0x4c/0x90
[c000000015c5d3c0] [c000000000128098] .__dma_map_sg_attrs+0x168/0x1e0
[c000000015c5d450] [c000000000128188] .dma_map_sgtable+0x28/0x70
[c000000015c5d4d0] [c000000000869588] .nvme_prep_rq.part.0+0xd8/0xc00
[c000000015c5d5d0] [c00000000086a134] .nvme_queue_rq+0x84/0x2a0
[c000000015c5d670] [c00000000063d450] .blk_mq_dispatch_rq_list+0x260/0xb30
[c000000015c5d7b0] [c0000000006463a0] .blk_mq_do_dispatch_sched+0x3f0/0x4a0
[c000000015c5d8d0] [c000000000646860]
.__blk_mq_sched_dispatch_requests+0x170/0x210
[c000000015c5d970] [c0000000006469bc] .blk_mq_sched_dispatch_requests+0x5c/=
0xc0
[c000000015c5d9f0] [c000000000639f48] .__blk_mq_run_hw_queue+0xd8/0x130
[c000000015c5da70] [c000000000646ed8] .blk_mq_sched_insert_requests+0xb8/0x=
2b0
[c000000015c5db20] [c00000000063e294] .blk_mq_flush_plug_list+0x1e4/0x3a0
[c000000015c5dbf0] [c00000000063e580] .blk_add_rq_to_plug+0x130/0x140
[c000000015c5dc70] [c00000000063eb2c] .blk_mq_submit_bio+0x23c/0x680
[c000000015c5dd60] [c000000000628b44] .__submit_bio+0x1b4/0x330
[c000000015c5de00] [c000000000629490] .submit_bio_noacct_nocheck+0x300/0x390
[c000000015c5deb0] [c0000000005129c4] .btrfs_submit_dev_bio+0xa4/0x190
[c000000015c5df30] [c00000000051e034] .btrfs_submit_bio+0x444/0x4c0
[c000000015c5e000] [c0000000004c5840] .btrfs_submit_metadata_bio+0x60/0x200
[c000000015c5e090] [c0000000005068f8] .submit_one_bio+0xf8/0x1b0
[c000000015c5e110] [c00000000050e5c4] .read_extent_buffer_pages+0x434/0x860
[c000000015c5e220] [c0000000004c5418] .btrfs_read_extent_buffer+0xd8/0x1d0
[c000000015c5e2f0] [c0000000004c5a7c] .read_tree_block+0x5c/0x190
[c000000015c5e390] [c0000000004a1654] .read_block_for_search+0x324/0x460
[c000000015c5e4a0] [c0000000004a8758] .btrfs_search_slot+0x568/0xe30
[c000000015c5e5e0] [c0000000004be004] .btrfs_lookup_csum+0x74/0x250
[c000000015c5e6c0] [c0000000004bea7c] .btrfs_lookup_bio_sums+0x27c/0x700
[c000000015c5e820] [c000000000550708] .btrfs_submit_compressed_read+0x448/0=
x610
[c000000015c5e920] [c0000000004da884] .btrfs_submit_data_read_bio+0x114/0x1=
50
[c000000015c5e9b0] [c0000000005068a4] .submit_one_bio+0xa4/0x1b0
[c000000015c5ea30] [c000000000506eb8] .submit_extent_page+0x508/0x530
[c000000015c5eb80] [c00000000050a960] .btrfs_do_readpage+0x2d0/0x850
[c000000015c5ecb0] [c00000000050c2a4] .extent_readahead+0x2b4/0x450
[c000000015c5ee40] [c0000000004d4e90] .btrfs_readahead+0x10/0x30
[c000000015c5eeb0] [c00000000023eb44] .read_pages+0xa4/0x390
[c000000015c5ef80] [c00000000023efcc] .page_cache_ra_unbounded+0x19c/0x270
[c000000015c5f060] [c0000000002315b4] .filemap_fault+0x584/0xa10
[c000000015c5f180] [c00000000027f248] .__do_fault+0x58/0x120
[c000000015c5f200] [c000000000285e48] .__handle_mm_fault+0xbc8/0x10f0
[c000000015c5f350] [c000000000286490] .handle_mm_fault+0x120/0x3c0
[c000000015c5f400] [c000000000040af8] .___do_page_fault+0x218/0xa00
[c000000015c5f4b0] [c0000000000413f0] .hash__do_page_fault+0x20/0xf0
[c000000015c5f530] [c000000000048608] .do_hash_fault+0x2b8/0x3c0
[c000000015c5f5b0] [c0000000000078a8] data_access_common_virt+0x198/0x1f0
--- interrupt: 300 at .__arch_clear_user+0x5c/0x160
NIP:  c00000000005590c LR: c0000000003bbcac CTR: 000000000000000d
REGS: c000000015c5f620 TRAP: 0300   Tainted: G                T=20=20
(6.1.0-gentoo-PMacG5)
MSR:  900000000200b032 <SF,HV,VEC,EE,FP,ME,IR,DR,RI>  CR: 48428828  XER:
20000000
DAR: 000000013e036e48 DSISR: 42000000 IRQMASK: 0=20
GPR00: 0000000000000000 c000000015c5f8c0 c000000000d9d500 000000013e036e48=
=20
GPR04: 00000000000001b8 0000000000000000 000000000000000d 0000000000000000=
=20
GPR08: 000000013e036e48 0000000000000000 00003ffffffff000 0000000000000000=
=20
GPR12: 0000000000000000 c0000000014ba000 0000400000000000 c000000013f6f5f8=
=20
GPR16: 0000000000000009 0000000000000000 00000000004b0990 00000000004c4328=
=20
GPR20: 00000000004fa688 00000000004f6e48 c000000013f68800 c000000015c46c80=
=20
GPR24: 0000000000000000 000000013e036e48 000000013db40000 c000000017830340=
=20
GPR28: c000000013895680 0000000000000000 c000000013f6f400 c0000000013da970=
=20
NIP [c00000000005590c] .__arch_clear_user+0x5c/0x160
LR [c0000000003bbcac] .padzero+0x7c/0x170
--- interrupt: 300
[c000000015c5f8c0] [c0000000003baa84] .set_brk+0x74/0xb0 (unreliable)
[c000000015c5f940] [c0000000003bc7f4] .load_elf_binary+0x854/0x1c40
[c000000015c5faa0] [c00000000032fffc] .bprm_execve+0x29c/0x730
[c000000015c5fb80] [c000000000330670] .do_execveat_common.isra.0+0x1e0/0x330
[c000000015c5fc50] [c000000000331904] .__se_sys_execve+0x44/0x80
[c000000015c5fcd0] [c000000000023e28] .system_call_exception+0x128/0x250
[c000000015c5fe10] [c00000000000b4d4] system_call_common+0xf4/0x258
--- interrupt: c00 at 0x3fff890b8e8c
NIP:  00003fff890b8e8c LR: 00003fff89323150 CTR: 0000000000000000
REGS: c000000015c5fe80 TRAP: 0c00   Tainted: G                T=20=20
(6.1.0-gentoo-PMacG5)
MSR:  900000000200f032 <SF,HV,VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 2842448b  XER:
00000000
IRQMASK: 0=20
GPR00: 000000000000000b 00003fffdb20b2c0 00003fff891f7200 000000014a4bc6f0=
=20
GPR04: 000000014a4a1610 000000014a4535c0 000000014a4535c0 000000000000006e=
=20
GPR08: fffffffeb5c1bb40 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 00003fff898ad780 0000000000000000 0000000000000000=
=20
GPR16: 0000000000000000 0000000000000000 00003fffdb20b5c0 000000014a4a0af0=
=20
GPR20: 0000000000000000 0000000000000000 0000000000000001 0000000000000000=
=20
GPR24: 0000000000000000 0000000000000000 00003fffdb20b938 000000014a3e3a48=
=20
GPR28: 000000014a3e3500 000000014a4a1610 000000014a4a1610 0000000000000000=
=20
NIP [00003fff890b8e8c] 0x3fff890b8e8c
LR [00003fff89323150] 0x3fff89323150
--- interrupt: c00
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
