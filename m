Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC80455F1BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 01:02:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXg996C0tz3dq5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 09:02:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r3m5g+d8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r3m5g+d8;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXg8S2cpmz3c7K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 09:02:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B7323B820D6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 23:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70889C341C8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 23:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656457315;
	bh=kLU37OT4g9b/jl4IDgKeeLtns3qG1H7TZ9gKhYyvcD0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=r3m5g+d8NyHgsmS5+r7tF/Liwfuiwbx0FbDQg1BaEzg9XUu4K67O73NDKx/pZbUzh
	 wweegvwiCRdfGHRf21ZQWCYq+OrJs8V7UMlI/70y1lQYGgVPcxnkrFssExsumvMeqL
	 EG3ygMRma85fUjZQVPiBLS0HRZnlvR3oT+r3SkbgM0Y7IXH896W38yZRdhdqNHf/xj
	 E2MLU11/oGcrSwMjjXTrv2yVYi2VYwRsET5yoiYCUpNnmmpoLKZ5Ci8uwmFUwGf1qI
	 ZKl+R9lLo8FCqJ6+pIVaTz1RGqAdM595Y+UcY77i1j7rcft4q5fN1+4tNLjd7Glr4z
	 CXwhsH3Q692hw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 50064C05FD6; Tue, 28 Jun 2022 23:01:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Tue, 28 Jun 2022 23:01:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-215389-206035-csAmtW9A3k@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #300113|0                           |1
        is obsolete|                            |
 Attachment #300929|0                           |1
        is obsolete|                            |

--- Comment #28 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301302
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301302&action=3Dedit
dmesg (5.19-rc4, PowerMac G4 DP)

Re-tried on v5.19-rc4 (without fadditional patches) + KFENCE.

My findings so far:
1. Memory corruption still persists.
2. Even without KASAN I need THREAD_SHIFT=3D14 or else I get the stack over=
flow
from bug #216041.
3. Memory corruption also happens with CONFIG_LOWMEM_SIZE=3D0x28000000.
4. But the "neverending build" commit mentioned in comment #9 is gone (be it
with default .config or CONFIG_LOWMEM_SIZE=3D0x28000000).

[...]
pagealloc: memory corruption
fffdfff0: 00 00 00 00                                      ....
CPU: 0 PID: 29136 Comm: localedef Not tainted 5.19.0-rc4-PMacG4 #3
Call Trace:
[f39b3c20] [c05eb9c0] dump_stack_lvl+0x60/0x90 (unreliable)
[f39b3c40] [c0232fb0] __kernel_unpoison_pages+0x1a8/0x1ec
[f39b3c90] [c02170dc] get_page_from_freelist+0xc20/0xe70
[f39b3d50] [c0217bdc] __alloc_pages+0x18c/0xe80
[f39b3e10] [c01f46b4] wp_page_copy+0x214/0xa1c
[f39b3e80] [c01fa0b8] handle_mm_fault+0x720/0xd64
[f39b3f00] [c00215dc] do_page_fault+0x1d4/0x830
[f39b3f30] [c000433c] DataAccess_virt+0x124/0x17c
--- interrupt: 300 at 0x669410
NIP:  00669410 LR: 006693e4 CTR: 00000000
REGS: f39b3f40 TRAP: 0300   Not tainted  (5.19.0-rc4-PMacG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 84002462  XER: 20000000
DAR: a7a3cce8 DSISR: 0a000000=20
GPR00: 0066961c afd34060 a7bd3000 01a069bc 01b76d60 00000009 a4e0c05a 0005c=
cd8=20
GPR08: 01b76140 a7a3cce8 a7a43e44 400a713a 44002862 0068fe34 01b8d730 00000=
001=20
GPR16: 00000000 01a069bc 01a069f8 01a06990 01b8d170 01a06894 0000000f 00000=
009=20
GPR24: 01b76d60 a4e0c05a 0000018d a7ad9f00 a79e0010 000041cb 00697cdc 01a06=
9bc=20
NIP [00669410] 0x669410
LR [006693e4] 0x6693e4
--- interrupt: 300
page:ef4bd80c refcount:1 mapcount:0 mapping:00000000 index:0x1 pfn:0x310ab
flags: 0x80000000(zone=3D2)
raw: 80000000 00000100 00000122 00000000 00000001 00000000 ffffffff 00000001
raw: 00000000
page dumped because: pagealloc: corrupted page details

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
