Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 103EF1599BE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 20:27:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HCTr4XKwzDqM6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 06:27:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=ceys=37=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HCRC1qZ3zDqMh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 06:25:26 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206501] New: Kernel 5.6-rc1 fails to boot on a PowerMac G4 3,6
 with CONFIG_VMAP_STACK=y: Oops! Machine check, sig: 7  [#1]
Date: Tue, 11 Feb 2020 19:25:24 +0000
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
Message-ID: <bug-206501-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206501

            Bug ID: 206501
           Summary: Kernel 5.6-rc1 fails to boot on a PowerMac G4 3,6 with
                    CONFIG_VMAP_STACK=3Dy: Oops! Machine check, sig: 7  [#1]
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.6.0-rc1
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

Created attachment 287311
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D287311&action=3Dedit
screenshot

The G4 boots fine with CONFIG_VMAP_STACK=3Dn, but fails to boot with
CONFIG_VMAP_STACK=3Dy.

[...]
NIP [c001c194] create_hpte+0xa8/0x120
LR [c001c0c4] add_hash_page+0x88/0xb0
Call Trace:
[f101dde8] [cO181568] alloc_set_pte+0x184/0x214 (unreliable)
[f101de18] [cO14d168] filemap_map_pages+0x21c/0x250
[f101de68] [c0181cf4] handle_mm_fault+0x66c/0x90c
[f101dee8] [c0019aac] do_page_fault+0x690/0x804
[f101df38] [c0014450] handle_page_fault+0x10/0x3c
--- interrupt: 401 at Oxb77ffd10
    LR =3D 0x0
Instruction dump:
6c64003f 6884ffx0 3884fff8 7c0903a6 84x40008 7c062800 4002fff8 41a2008c
68a50040 7c0903a6 3883fff8 84c40008 <54c60001> 4002fff8 41a20070 3c80c08e
---[ end trace cd24dd23c7db9d53 ]---

Machine check in kernel mode.
Caused by (from SRR1=3D141020): Transfer error ack signal
Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x00000007

(OCRed screenshot + corrections by hand)

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
