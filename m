Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A29AE25E3E3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 00:52:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjtGP5vFtzDqlm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 08:51:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=jykm=cn=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjtDS0qLvzDqlY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Sep 2020 08:50:15 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205099] KASAN hit at raid6_pq: BUG: Unable to handle kernel
 data access at 0x00f0fd0d
Date: Fri, 04 Sep 2020 22:50:12 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-205099-206035-mDU4pUp7bJ@https.bugzilla.kernel.org/>
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

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #287625|0                           |1
        is obsolete|                            |
 Attachment #288411|0                           |1
        is obsolete|                            |

--- Comment #30 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 292345
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D292345&action=3Dedit
dmesg (5.9-rc3, OUTLINE KASAN, PowerMac G4 DP)

Re-tested with v5.9-rc3 out of curiosity. Not much change here, the bug sho=
ws
up with OUTLINE KASAN but not with INLINE KASAN, everything else being equa=
l:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: user-memory-access in raid6_altivec8_gen_syndrome_real+0x2b0/0x=
480
[raid6_pq]
Read of size 4 at addr 5764b118 by task modprobe/126

CPU: 1 PID: 126 Comm: modprobe Tainted: G        W         5.9.0-rc3-PowerM=
acG4
#2
Call Trace:
[e32cb7b8] [c0517aac] dump_stack+0xc4/0xf8 (unreliable)
[e32cb7e8] [c026e73c] kasan_report+0x16c/0x170
[e32cb828] [b02004e0] raid6_altivec8_gen_syndrome_real+0x2b0/0x480 [raid6_p=
q]
[e32cba18] [b02006fc] raid6_altivec8_gen_syndrome+0x4c/0x88 [raid6_pq]
[e32cba38] [b021a42c] init_module+0x42c/0x590 [raid6_pq]
[e32cbb08] [c00058a0] do_one_initcall+0xb8/0x3dc
[e32cbbd8] [c011c0fc] do_init_module+0xa8/0x2c4
[e32cbc08] [c011f02c] load_module+0x2b98/0x2d4c
[e32cbe18] [c011f448] sys_finit_module+0x100/0x138
[e32cbf38] [c001a1cc] ret_from_syscall+0x0/0x34
--- interrupt: c01 at 0x3d2068
    LR =3D 0x506104
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: Unable to handle kernel data access on read at 0x5764b118
Faulting instruction address: 0xb02004e0
Oops: Kernel access of bad area, sig: 11 [#1]

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
