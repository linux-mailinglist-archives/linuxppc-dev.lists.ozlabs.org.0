Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4912C3D413A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 22:01:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWgDk23xVz30LP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jul 2021 06:01:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LVh8DTRu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LVh8DTRu; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWgDF3v5Fz2yR2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jul 2021 06:00:45 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5A72D60F4D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jul 2021 20:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627070442;
 bh=h9RA2tMNoVOp/4TDypgaNArRcSvKmJIu5f8+yA9cBkg=;
 h=From:To:Subject:Date:From;
 b=LVh8DTRugPA2IkOk0co9mbp1Zr3SW9DBL6hD7C66EFPMMWUuf7/rXEMMVG7fuIUHW
 mT5mR9/fvaZILzGnDgJ+bYTCA1uTzBlXwAaJExhTexJBvBRpdRkcbGzEoByzRqRRJe
 jtptkF7UTgr2CFMrB+xiw2aEcroSkG3h3BgxZqCGFlF2qYsCdIfptJH8JJO+JZMkv8
 NBcN5JgwLBVT+FBZKS1Okq/nav/korHadLm3qHJHaG/JMXjuUDT/w6KgSNUYSZz871
 Q/5YTg+8FfrzlnZGjpy8y6tl0Y8156diwmZID7ycU7NBrqGSLT8QGX81kmNUlAbYmM
 gGbDnEQBBnAfw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 525AD60351; Fri, 23 Jul 2021 20:00:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] New: "Kernel panic - not syncing: corrupted stack end
 detected inside scheduler" at building via distcc on a G5
Date: Fri, 23 Jul 2021 20:00:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Memory Management
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: akpm@linux-foundation.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-213837-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213837

            Bug ID: 213837
           Summary: "Kernel panic - not syncing: corrupted stack end
                    detected inside scheduler" at building via distcc on a
                    G5
           Product: Memory Management
           Version: 2.5
    Kernel Version: 5.13.4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Other
          Assignee: akpm@linux-foundation.org
          Reporter: erhard_f@mailbox.org
                CC: platform_ppc-64@kernel-bugs.osdl.org
        Regression: No

Created attachment 298017
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298017&action=3Dedit
dmesg (5.13.4, PowerMac G5 11,2)

Happens when building larger projects on my G5 via distcc. Time to failure =
is
about 3-10 minutes. Kernel 5.10.x does not show this problem. Probably
connected to bug #213079.

[..]
Call Trace:
Kernel panic - not syncing: corrupted stack end detected inside scheduler
CPU: 1 PID: 11467 Comm: powerpc64-unkno Tainted: G        W=20=20=20=20=20=
=20=20=20
5.13.4-PowerMacG5+ #2
[c00000003e79ea80] [c000000000541c90] .dump_stack+0xe0/0x13c (unreliable)
[c00000003e79eb20] [c00000000006813c] .panic+0x168/0x430
[c00000003e79ebd0] [c00000000080a4b0] .__schedule+0x80/0x840
[c00000003e79ecb0] [c00000000080adbc] .preempt_schedule_common+0x28/0x48
[c00000003e79ed30] [c00000000080ae0c] .__cond_resched+0x30/0x4c
[c00000003e79edb0] [c0000000001c6d80] .mempool_alloc+0x38/0x198
[c00000003e79ee90] [c00000000049a444] .bio_alloc_bioset+0x94/0x174
[c00000003e79ef40] [c00000000049a544] .bio_clone_fast+0x20/0x7c
[c00000003e79efd0] [c00000000049a60c] .bio_split+0x6c/0xc4
[c00000003e79f060] [c0000000004a7018] .__blk_queue_split+0x120/0x474
[c00000003e79f160] [c0000000004adc30] .blk_mq_submit_bio+0x88/0x524
[c00000003e79f250] [c0000000004a0e30] .submit_bio_noacct+0xc4/0x26c
[c00000003e79f340] [c000000000355bec] .ext4_io_submit+0x5c/0x70
[c00000003e79f3c0] [c000000000355f08] .ext4_bio_write_page+0x2f4/0x480
[c00000003e79f480] [c000000000334b84] .mpage_submit_page+0x70/0xa0
[c00000003e79f500] [c00000000033b09c] .ext4_writepages+0xcc4/0xe5c
[c00000003e79f7b0] [c0000000001cf214] .do_writepages+0x54/0xa0
[c00000003e79f830] [c0000000001c3ab8] .__filemap_fdatawrite_range+0xc0/0xfc
[c00000003e79f930] [c000000000337f34] .ext4_alloc_da_blocks+0xf4/0x100
[c00000003e79f9b0] [c000000000328594] .ext4_release_file+0x24/0xd8
[c00000003e79fa40] [c00000000026ea5c] .__fput+0x12c/0x270
[c00000003e79fae0] [c00000000008eb40] .task_work_run+0xa0/0xc0
[c00000003e79fb70] [c00000000006e284] .do_exit+0x55c/0xa6c
[c00000003e79fc60] [c00000000006e824] .do_group_exit+0x50/0xb0
[c00000003e79fcf0] [c00000000006e898] .__wake_up_parent+0x0/0x34
[c00000003e79fd60] [c000000000021540] .system_call_exception+0x1b4/0x1ec
[c00000003e79fe10] [c00000000000b9c4] system_call_common+0xe4/0x214
--- interrupt: c00 at 0x3fffadc46aa8
NIP:  00003fffadc46aa8 LR: 00003fffadba6d04 CTR: 0000000000000000
REGS: c00000003e79fe80 TRAP: 0c00   Tainted: G        W=20=20=20=20=20=20=
=20=20=20
(5.13.4-PowerMacG5+)
MSR:  900000000200f032 <SF,HV,VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22000482  XER:
00000000
IRQMASK: 0=20
GPR00: 00000000000000ea 00003ffff3f1ae50 00003fffadd65300 0000000000000000=
=20
GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 00003fffadeddc30 000000014af075a0 000000012379b0f0=
=20
GPR16: 000000012947ec38 00003fffd7d95cd8 000000012947eb28 000000000000002f=
=20
GPR20: 0000000000000000 00003fffadd5fff8 0000000000000001 00003fffadd5ea58=
=20
GPR24: 0000000000000000 0000000000000000 0000000000000003 0000000000000001=
=20
GPR28: 0000000000000000 00003fffaded6c50 fffffffffffff000 0000000000000000=
=20
NIP [00003fffadc46aa8] 0x3fffadc46aa8
LR [00003fffadba6d04] 0x3fffadba6d04
--- interrupt: c00
Rebooting in 40 seconds..

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
