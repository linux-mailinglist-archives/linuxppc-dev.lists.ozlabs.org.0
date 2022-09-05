Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0312F5AD847
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 19:17:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLwDl6Prrz3bln
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 03:17:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ai8qnGCA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ai8qnGCA;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLwD14QkTz2xjl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 03:16:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7785D61326
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 17:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8938C433D7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 17:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662398188;
	bh=yBuZbVPgsWUiihfMhlFXVKzkSBxmWFrKmJXQk75qYz8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ai8qnGCAL/4MzPfDONOYHUJr59MwWxmrqTNF8Gv8bkjTbEhEVgoYmPxW/W/ZPN1N0
	 R92fy7VVoTElfToiP2LZhATwJxXREYrLrwJRmMS6sSIWjvnJz1OIdW0tk/OUv1Vail
	 w1csHX4XkztpXpyeKsocDedv6dEma6/1IlcL2TdaQKsi85rCPyH6O/t2uTSbpzmaxu
	 LlyLA2CK8yuJEUWeULNm2NdihyRMbqBxfMscvnhj/FYNsjBTJkN1nNXbY/Hiv4I7cg
	 wClfYRNG87OGrTKThEQ8q2t8prZlXTxrCqy7RP8xnFt5OcXOAqe73VaAWq4u1DRWpT
	 R9TTwyjDqEhcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B18B9C433E7; Mon,  5 Sep 2022 17:16:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216368] do_IRQ: stack overflow at boot during btrfs handling on
 a PowerMac G5 11,2
Date: Mon, 05 Sep 2022 17:16:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dsterba@suse.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216368-206035-u4lOZvXSRl@https.bugzilla.kernel.org/>
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

--- Comment #6 from David Sterba (dsterba@suse.com) ---
(In reply to Christophe Leroy from comment #3)
> This happens when you get an IRQ while being deep into BTRFS handling it
> seems.
>=20
> It should be investigated with BTRFS team why the callstack is so deep.

There's nothing strange on the call stack, contains all functions that are
expected when handling a page fault, looking up internal structures and then
passing to block layer to get the bytes from the device.

Deep stack, measured by number of functions and also size is normal for
filesystrems and we try to keep the size sane, so far we haven't seen such
problems on x86_64, the overall stack size is 16K an on debug kernel there =
are
about 6K consumed at maximum (reported by CONFIG_DEBUG_STACK_USAGE=3Dy and
CONFIG_SCHED_STACK_END_CHECK=3Dy), the lowest value found I see in my logs =
is
10576.

That is on a simple IO stack, ie. what's below the filesystem, as you can s=
ee
the mblk-mq, NVMe and DMA also cut some stack space, but this also does not
seem suspicious. What could be significant is layering with MD, device mapp=
er,
NFS, networking.

The first number in the stack trace is the stack pointer, calculating what
btrfs itself takes:

[c000000019da5cf0] [c0000000004d66b4] .btrfs_submit_bio+0x274/0x5c0
[c000000019da5e00] [c000000000481f44] .btrfs_submit_metadata_bio+0x54/0x110
[c000000019da5e80] [c0000000004bd828] .submit_one_bio+0xb8/0x130
[c000000019da5f00] [c0000000004c84b0] .read_extent_buffer_pages+0x310/0x750
[c000000019da6020] [c000000000481b48] .btrfs_read_extent_buffer+0xd8/0x1b0
[c000000019da60f0] [c00000000048208c] .read_tree_block+0x5c/0x130
[c000000019da6190] [c0000000004609a8] .read_block_for_search+0x2c8/0x410
[c000000019da62b0] [c000000000466a30] .btrfs_search_slot+0x380/0xcf0
[c000000019da6400] [c00000000047adf4] .btrfs_lookup_csum+0x64/0x1d0
[c000000019da64d0] [c00000000047b754] .btrfs_lookup_bio_sums+0x274/0x6e0
[c000000019da6630] [c000000000505d18] .btrfs_submit_compressed_read+0x3b8/0=
x520
[c000000019da6720] [c0000000004954b4] .btrfs_submit_data_read_bio+0xc4/0xe0
[c000000019da67b0] [c0000000004bd7fc] .submit_one_bio+0x8c/0x130
[c000000019da6830] [c0000000004c4478] .submit_extent_page+0x548/0x590
[c000000019da6980] [c0000000004c4f80] .btrfs_do_readpage+0x330/0x970
[c000000019da6ad0] [c0000000004c67f4] .extent_readahead+0x2b4/0x430
[c000000019da6c70] [c000000000490440] .btrfs_readahead+0x10/0x30

0xc000000019da6c70 - 0xc000000019da5cf0 =3D 3968

That's on par with my expectation.

Total stack space is (from syscall to the irq handler):

0xc000000019da7e10 - 0xc000000019da4c00 =3D 12816

That's getting close to 16K but still a few kilobytes before overflow, the =
IRQ
has it's own stack (that needs to be set up from the kthread/process contex=
t).

As you mention KASAN, that can add some stack consumption due to padding and
alignment, but so far I don't know what exactly is the warning measuring.
Calculating back from do_IRQ by 3072 it's roughly 0xc000000019da5910, inside
blk_mq_flush_plug_list.

I remember some build reports from PPC that due to a different compiler used
the function inlining caused increased stack space consumption (eg. due to
aggressive optimizations that unrolled loops too much using several additio=
nal
temporary variables). So that should be investigated too before blaming btr=
fs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
