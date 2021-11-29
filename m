Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3AA46219C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 21:07:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2xGT3mvPz3c5Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 07:07:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M91mEggH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M91mEggH; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2xFl05ZXz2yw1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 07:06:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3A079CE140C
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 20:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6E3BC53FAD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 20:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638216408;
 bh=QiyQ7u7RkhDklHL/yuOayV9gF4xp4Zx9aG4NdIg4EFQ=;
 h=From:To:Subject:Date:From;
 b=M91mEggHJ22Ih39hQqhgLoVqwA/SbGoKHRpVjKGZd8jZXFODTHFbsMgn4Z59VUHuT
 opR2GGYSF/epeovL0SkUZ5CVhlthxohZYJ087QZ3D5JIg7lVY0Cn/wXlNm0rAKCqZl
 0XJHgOkEyS/8fknPxbOqj6jnaO9gJMg2+yyTa/gBWd2M7ZJAaoYNX4Vv3cAHAC8CNC
 rEVLBj8wWrsh0zC6DuzheNuhcrgmJvPis1/6U0HYU3YR4U258e2LnHvj4zkUxiea+6
 mtCoAaz6u4oZfNWvFxDFdrECy9jGU6OKD6wwyMudxt1zWOsadFNRm25OZoWNcseyJ1
 JgO5oC3fL+XEg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A2A3D60E90; Mon, 29 Nov 2021 20:06:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215169] New: UBSAN: shift-out-of-bounds in
 arch/powerpc/mm/kasan/book3s_32.c:22:23
Date: Mon, 29 Nov 2021 20:06:48 +0000
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
Message-ID: <bug-215169-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215169

            Bug ID: 215169
           Summary: UBSAN: shift-out-of-bounds in
                    arch/powerpc/mm/kasan/book3s_32.c:22:23
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.15.5
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

Created attachment 299777
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299777&action=3Dedit
dmesg (5.15.5, INLINE KASAN, PowerMac G4 DP)

Noticed another small glitch during 5.15.x testing. Happens when inline KAS=
AN
is selected:

Total memory =3D 2048MB; using 4096kB for hash table
Activating Kernel Userspace Access Protection
Linux version 5.15.5-gentoo-PowerMacG4 (root@T1000) (gcc (Gentoo 11.2.0 p1)
11.2.0, GNU ld (Gentoo 2.37_p1 p0) 2.37) #9 SMP Mon Nov 29 20:46:44 CET 2021
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
UBSAN: shift-out-of-bounds in arch/powerpc/mm/kasan/book3s_32.c:22:23
shift exponent -1 is negative
CPU: 0 PID: 0 Comm: swapper Not tainted 5.15.5-gentoo-PowerMacG4 #9
Call Trace:
[c214be60] [c0ba0048] dump_stack_lvl+0x80/0xb0 (unreliable)
[c214be80] [c0b99288] ubsan_epilogue+0x10/0x5c
[c214be90] [c0b98fe0] __ubsan_handle_shift_out_of_bounds+0x94/0x138
[c214bf00] [c1c0f010] kasan_init_region+0xd8/0x26c
[c214bf30] [c1c0ed84] kasan_init+0xc0/0x198
[c214bf70] [c1c08024] setup_arch+0x18/0x54c
[c214bfc0] [c1c037f0] start_kernel+0x90/0x33c
[c214bff0] [00003610] 0x3610
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
setbat: no BAT available for mapping 0x1c000000
KASAN init done
[...]

The other UBSAN complaint in the netconsole.log is bug #214867.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
