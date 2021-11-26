Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEA445E422
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 02:48:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0d1b5nBCz3c9T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 12:48:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YJPOPMIp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YJPOPMIp; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0d0m5pkkz2yNW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 12:47:36 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 79AC161028
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 01:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637891252;
 bh=bwZahqZ25a2ZbTT9WEX545uaVdWNf5ZN+8FIIanLuAo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YJPOPMIp2jJx2ojXrT7TU6LufcJCmUbeV7EqwHed2cUINP/EmaPFubzslYs7dPMTV
 2WHRPHQk4rIG5kGVNtN7Y4FxvYNb6tCJ+HM/RdKW7FrwYI+QwWwktkGb/IPrl42dYa
 OeDKMm4qKf6NsUdb2fOgw3Yurpd2VBSwUcSmgDN3m8HO6AZBCZ4Q0k+E66B5uldKZ/
 /aULCvPjOT0pwzUwSBoXi74tIXdCMa/8W3N4fPh8ZeFKa20vXxADORlYiHWzwWShIs
 csfTFbNJYyEUniIeeoCfkzvMt6Eh+P6rcuwK+eSYlvOAj2y6Y6TtQ/rxNa0z+T2ZzC
 bzx3bSevO0HcA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6287360F39; Fri, 26 Nov 2021 01:47:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205099] KASAN hit at raid6_pq: BUG: Unable to handle kernel
 data access at 0x00f0fd0d
Date: Fri, 26 Nov 2021 01:47:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-205099-206035-0dh1wolQbk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205099-206035@https.bugzilla.kernel.org/>
References: <bug-205099-206035@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D205099

--- Comment #34 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 299711
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299711&action=3Dedit
dmesg (5.15.5, OUTLINE KASAN, PowerMac G4 DP)

Finally my G4 DP got its' fixed & overhauled PSU so I am able to continue h=
ere.

Tested kernel 5.15.5 and the original KASAN hit at raid6_pq did not show up.
Instead I am getting this now:

[...]
Running code patching self-tests ...
vmap allocation for size 33562624 failed: use vmalloc=3D<size> to increase =
size
swapper/0: vmalloc error: size 33558528, vm_struct allocation failed,
mode:0xcc0(GFP_KERNEL), nodemask=3D(null)
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W=20=20=20=20=20=20=20=20
5.15.5-gentoo-PowerMacG4 #5
Call Trace:
[f1033bb0] [c0d933c0] dump_stack_lvl+0x80/0xb0 (unreliable)
[f1033bd0] [c0516128] warn_alloc+0x11c/0x2b4
[f1033cb0] [c0508c40] __vmalloc_node_range+0xd8/0x64c
[f1033d70] [c0508a58] __vmalloc_node+0xec/0xf4
[f1033db0] [c1c0ecb0] test_code_patching+0x72c/0xd50
[f1033df0] [c0008908] do_one_initcall+0x284/0x574
[f1033ec0] [c1c03f78] kernel_init_freeable+0x510/0x51c
[f1033f10] [c000934c] kernel_init+0x24/0x140
[f1033f30] [c0033148] ret_from_kernel_thread+0x14/0x1c
Mem-Info:
active_anon:0 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:0 isolated_file:0
 unevictable:0 dirty:0 writeback:0
 slab_reclaimable:1306 slab_unreclaimable:4214
 mapped:0 shmem:0 pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:474459 free_pcp:592 free_cma:0
Node 0 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB
unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:0kB
writeback:0kB shmem:0kB writeback_tmp:0kB kernel_stack:840kB pagetables:0kB
all_unreclaimable? no
DMA free:588612kB min:3144kB low:3928kB high:4712kB reserved_highatomic:0KB
active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB
unevictable:0kB writepending:0kB present:786432kB managed:618264kB mlocked:=
0kB
bounce:0kB free_pcp:1964kB local_pcp:1568kB free_cma:0kB
lowmem_reserve[]: 0 0 1280 1280
HighMem free:1309224kB min:512kB low:2176kB high:3840kB reserved_highatomic=
:0KB
active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB
unevictable:0kB writepending:0kB present:1310720kB managed:1310720kB
mlocked:0kB bounce:0kB free_pcp:404kB local_pcp:116kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0
DMA: 5*4kB (ME) 2*8kB (UM) 4*16kB (M) 5*32kB (ME) 1*64kB (M) 4*128kB (UME)
4*256kB (ME) 4*512kB (UM) 3*1024kB (M) 4*2048kB (ME) 140*4096kB (M) =3D 588=
612kB
HighMem: 0*4kB 1*8kB (U) 0*16kB 1*32kB (U) 0*64kB 2*128kB (U) 1*256kB (U)
0*512kB 0*1024kB 1*2048kB (U) 319*4096kB (M) =3D 1309224kB
0 total pagecache pages
0 pages in swap cache
Swap cache stats: add 0, delete 0, find 0/0
Free swap  =3D 0kB
Total swap =3D 0kB
524288 pages RAM
327680 pages HighMem/MovableOnly
42042 pages reserved
code-patching: test failed at line 598
[...]

This makes me wonder whether KASAN is working correctly when not enough vmap
size is available. I did set it to vmalloc=3D64M via Kernel command line bu=
t this
does not seem to be reckognized. Same situation with INLINE KASAN. In both
cases with VMAP_STACK and CONFIG_THREAD_SHIFT=3D14.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
