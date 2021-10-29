Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ACE43FDB5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 15:59:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgkZS2Hrsz3c77
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 00:59:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lgHH6Q0Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lgHH6Q0Z; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgkYk5DKVz2xCL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 00:59:06 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0081061167
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 13:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635515943;
 bh=8XaWwcc/v/BfkuzQGEsckiQajwLY2ML75f1Gd3VAflk=;
 h=From:To:Subject:Date:From;
 b=lgHH6Q0ZWSVYL01g+mAvP0UT9lhz8V/gM+WxK0ugMNd5eR1yNv9SFI2rGH529iPbw
 5H/Fvp+S7NehLEbLCBD5ze/NWHE0UnKJf2qHdSpjVIi84yoPF6qs6DvtqmCmZOLNkL
 Unjsxvs5TWYJnbcrD/VpvEi0Bm7CPp5wlZ6+3xYYXJU+hNPCn3sucI+dsu819qzFxj
 yzt0pQ9teB/lPCJIoZB1kZ0qnwUxrd7U99Ys7cGHSqXHqVywF4ZGUs7rMA95FR/1C8
 +ZTrvJRKOBrlE4kJq+KScYavBXYdzhT+ybqoTT6sAm3xJxLpPl/KrvDi6Ucs9YTiZo
 xAG+GZ3Czqk3g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DFF2A60EBB; Fri, 29 Oct 2021 13:59:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 214867] New: UBSAN: shift-out-of-bounds in
 drivers/of/unittest.c:1933:36
Date: Fri, 29 Oct 2021 13:59:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-214867-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214867

            Bug ID: 214867
           Summary: UBSAN: shift-out-of-bounds in
                    drivers/of/unittest.c:1933:36
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.15-rc7
          Hardware: PPC-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
                CC: bugzilla.kernel.org@frowand.com
        Regression: No

Created attachment 299361
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299361&action=3Dedit
kernel dmesg (kernel 5.15-rc7, Talos II)

UBSAN catches this at boot on my Talos II.

[...]
### dt-test ### EXPECT / : GPIO line <<int>> (line-C-input) hogged as input
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
UBSAN: shift-out-of-bounds in drivers/of/unittest.c:1933:36
shift exponent -1 is negative
CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.15.0-rc7-TalosII #1
Call Trace:
[c000000004163700] [c0000000008ffaa8] .dump_stack_lvl+0xa4/0x100 (unreliabl=
e)
[c000000004163790] [c0000000008fb46c] .ubsan_epilogue+0x10/0x70
[c000000004163800] [c0000000008fb270]
.__ubsan_handle_shift_out_of_bounds+0x1f0/0x34c
[c000000004163910] [c000000000ad94a0] .of_unittest_untrack_overlay+0x6c/0xe0
[c0000000041639a0] [c000000002098ff8] .of_unittest+0x4c50/0x59f8
[c000000004163b60] [c000000000011b5c] .do_one_initcall+0x7c/0x4f0
[c000000004163c50] [c00000000200300c] .kernel_init_freeable+0x704/0x858
[c000000004163d90] [c000000000012730] .kernel_init+0x20/0x190
[c000000004163e10] [c00000000000ce78] .ret_from_kernel_thread+0x58/0x60
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
### dt-test ### EXPECT \ : OF: overlay: WARNING: memory leak will occur if
overlay removed, property: /testcase-data-2/substation@100/status
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
