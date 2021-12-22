Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F347D620
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 18:53:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JK1CV56krz30MC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 04:53:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Eyo3Jco4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Eyo3Jco4; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JK1Bl4CCFz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 04:53:03 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8581261B33
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 17:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFD8FC36AE8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 17:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640195579;
 bh=3J3G0lGtnFwGbEL2v4VxOB0ePR/Pq6vnryVyyNNDxeg=;
 h=From:To:Subject:Date:From;
 b=Eyo3Jco4ulIcqFbAwGMjJlDghiYTY9szp9M7yr1cTBqqd/Fe+vOBXIuhBkv7NTUu3
 DG4T84+99WAtRx7O9kFZrqQuXshe77I3W3QVRi5xVoquSEe0+gh1wYkI2pThL9DfVD
 R6CUoAThm7rL5QsL5CCeIhnQJn3d9Uluq4f3R9bxjIvH1syc7FbOE10jAGw/h4ue/Z
 eAlLK6Ggd6C5DPNIM9oZPfze1hDGHRtRI+oVnvpid99Umfjqb5E2LSggt2MXxQrDN+
 EHGgWZ/elLjSfSD0I58AVhgHuR8rIfotdqVI2BcsZEvXbnCHc2+ILo95L+dqy9s11r
 szfV/bTLk+pFA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C425361177; Wed, 22 Dec 2021 17:52:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] New: pagealloc: memory corruption at building
 glibc-2.33 and running its' testsuite
Date: Wed, 22 Dec 2021 17:52:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215389-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

            Bug ID: 215389
           Summary: pagealloc: memory corruption at building glibc-2.33
                    and running its' testsuite
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.15.10
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 300113
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300113&action=3Dedit
dmesg (5.15.10, PowerMac G4 DP)

Happens at running the glibc-2.33 testsuite on my G4 DP.

[...]
[ 5503.973022] pagealloc: memory corruption
[ 5503.973226] fffdfff0: 00 00 00 00                                      .=
...
[ 5503.973469] CPU: 0 PID: 15826 Comm: ld.so.1 Tainted: G        W=20=20=20=
=20=20=20=20=20
5.15.10-gentoo-PowerMacG4 #3
[ 5503.973791] Call Trace:
[ 5503.973849] [f61edc20] [c03e8644] dump_stack_lvl+0x60/0x80 (unreliable)
[ 5503.974096] [f61edc40] [c016ece8] __kernel_unpoison_pages+0x13c/0x174
[ 5503.974320] [f61edc90] [c015aa64] post_alloc_hook+0x60/0xb4
[ 5503.974511] [f61edcb0] [c015aadc] prep_new_page+0x24/0x5c
[ 5503.974687] [f61edcd0] [c015be14] get_page_from_freelist+0x26c/0x548
[ 5503.974898] [f61edd50] [c015c5d8] __alloc_pages+0xc8/0x7a4
[ 5503.975080] [f61eddf0] [c0146470]
alloc_zeroed_user_highpage_movable.constprop.0+0x18/0x48
[ 5503.975358] [f61ede10] [c01467a8] wp_page_copy+0x58/0x4a4
[ 5503.975534] [f61ede80] [c0149df4] handle_mm_fault+0x72c/0x864
[ 5503.975725] [f61edf00] [c001a9dc] do_page_fault+0x578/0x6c8
[ 5503.975919] [f61edf30] [c000424c] DataAccess_virt+0xd4/0xe4
[ 5503.976102] --- interrupt: 300 at 0x6ffc5eb0
[ 5503.976228] NIP:  6ffc5eb0 LR: 6ffc5e84 CTR: c0335cb0
[ 5503.976383] REGS: f61edf40 TRAP: 0300   Tainted: G        W=20=20=20=20=
=20=20=20=20=20
(5.15.10-gentoo-PowerMacG4)
[ 5503.976684] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 840022c8  XER: 20000=
000
[ 5503.976929] DAR: a78032e4 DSISR: 0a000000=20
               GPR00: 6ffc60bc af9a9650 a7a15550 0064c9ac 00896b60 00000009
bcecbe5c 001282d4=20
               GPR08: 00899280 a78032e4 a7809068 f61edf30 240022c2 6ffece34
008a1a90 00000001=20
               GPR16: 00000000 0064c9ac 0064c9e8 0064c980 008a1830 0064b8f4
0000000f 00000009=20
               GPR24: 00896b60 bcecbe5c 000002c6 a7828774 a76db010 000083a7
6fff4cdc 0064c9ac=20
[ 5504.008476] NIP [6ffc5eb0] 0x6ffc5eb0
[ 5504.018630] LR [6ffc5e84] 0x6ffc5e84
[ 5504.028738] --- interrupt: 300
[ 5504.038956] page:ef4c8e34 refcount:1 mapcount:0 mapping:00000000 index:0=
x1
pfn:0x31065
[ 5504.049340] flags: 0x80000000(zone=3D2)
[ 5504.059763] raw: 80000000 00000100 00000122 00000000 00000001 00000000
ffffffff 00000001
[ 5504.070297] raw: 00000000
[ 5504.080511] page dumped because: pagealloc: corrupted page details

The machine stays usable afterwards. Happened also a 2nd time after a reboo=
t,
again at building glibc-2.33 and running  testsuite:

[...]
[ 2946.948834] pagealloc: memory corruption
[ 2946.949078] fffcfff0: 00 00 00 00                                      .=
...
[ 2946.949419] CPU: 1 PID: 31318 Comm: ld.so.1 Tainted: G        W=20=20=20=
=20=20=20=20=20
5.15.10-gentoo-PowerMacG4 #3
[ 2946.949753] Call Trace:
[ 2946.949814] [f5c21b00] [c03e8644] dump_stack_lvl+0x60/0x80 (unreliable)
[ 2946.950054] [f5c21b20] [c016ece8] __kernel_unpoison_pages+0x13c/0x174
[ 2946.950281] [f5c21b70] [c015aa64] post_alloc_hook+0x60/0xb4
[ 2946.950476] [f5c21b90] [c015aadc] prep_new_page+0x24/0x5c
[ 2946.950651] [f5c21bb0] [c015be14] get_page_from_freelist+0x26c/0x548
[ 2946.950865] [f5c21c30] [c015c5d8] __alloc_pages+0xc8/0x7a4
[ 2946.951053] [f5c21cd0] [c011f6d4] pagecache_get_page+0x184/0x1fc
[ 2946.951259] [f5c21d30] [c029fd34] prepare_pages+0x80/0x14c
[ 2946.951442] [f5c21d80] [c02a28dc] btrfs_buffered_write+0x2b8/0x54c
[ 2946.951653] [f5c21e20] [c02a4700] btrfs_file_write_iter+0x340/0x368
[ 2946.951876] [f5c21e70] [c01892fc] vfs_write+0x18c/0x1dc
[ 2946.952057] [f5c21ef0] [c0189484] ksys_write+0x74/0xb8
[ 2946.952231] [f5c21f30] [c0015098] ret_from_syscall+0x0/0x28
[ 2946.952420] --- interrupt: c00 at 0x6fecc128
[ 2946.952547] NIP:  6fecc128 LR: 6fecc100 CTR: 00000001
[ 2946.952704] REGS: f5c21f40 TRAP: 0c00   Tainted: G        W=20=20=20=20=
=20=20=20=20=20
(5.15.10-gentoo-PowerMacG4)
[ 2946.953008] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 24022448  XER: 00000=
000
[ 2946.953267]=20
               GPR00: 00000004 afad5d90 a7b83550 00000009 afad5e9c 00002000
00000000 6fecbfe8=20
               GPR08: 0000d032 402c551a 402c5409 f5c21f30 84022448 6ffeee28
007889b0 afad8070=20
               GPR16: afad7fa0 afad8008 00000000 00000000 00008000 00000008
00976000 001c5bcc=20
               GPR24: 00000000 afad5e9c 00002000 00000009 afad7e9c 00000000
6ffbaff4 afad5e9c=20
[ 2946.975430] NIP [6fecc128] 0x6fecc128
[ 2946.985730] LR [6fecc100] 0x6fecc100
[ 2946.995992] --- interrupt: c00
[ 2947.006198] page:ef4c8e34 refcount:1 mapcount:0 mapping:00000000 index:0=
x1
pfn:0x31065
[ 2947.016579] flags: 0x80000000(zone=3D2)
[ 2947.026946] raw: 80000000 00000100 00000122 00000000 00000001 00000000
ffffffff 00000001
[ 2947.037712] raw: 00000000
[ 2947.048178] page dumped because: pagealloc: corrupted page details

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
