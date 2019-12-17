Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A791233FE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 18:56:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cm661RthzDqY5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 04:56:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=uhai=2h=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cm1n6ggZzDqVx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 04:52:29 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205885] [Bisected] BUG: KASAN: null-ptr-deref in
 strncpy+0x3c/0x60
Date: Tue, 17 Dec 2019 17:52:27 +0000
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
Message-ID: <bug-205885-206035-28LCs40cQY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205885-206035@https.bugzilla.kernel.org/>
References: <bug-205885-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205885

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #286345|0                           |1
        is obsolete|                            |

--- Comment #6 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 286347
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D286347&action=3Dedit
bisect.log

# git bisect bad | tee -a ~/bisect01.log=20
cccaa5e33525fc07f4a2ce0518e50b9ddf435e47 is the first bad commit
commit cccaa5e33525fc07f4a2ce0518e50b9ddf435e47
Author: Dominik Brodowski <linux@dominikbrodowski.net>
Date:   Tue Oct 23 22:41:09 2018 +0200

    init: use do_mount() instead of ksys_mount()

    In prepare_namespace(), do_mount() can be used instead of ksys_mount()
    as the first and third argument are const strings in the kernel, the
    second and fourth argument are passed through anyway, and the fifth
    argument is NULL.

    In do_mount_root(), ksys_mount() is called with the first and third
    argument being already kernelspace strings, which do not need to be
    copied over from userspace to kernelspace (again). The second and
    fourth arguments are passed through to do_mount() anyway. The fifth
    argument, while already residing in kernelspace, needs to be put into
    a page of its own. Then, do_mount() can be used instead of
    ksys_mount().

    Once this is done, there are no in-kernel users to ksys_mount() left,
    which can therefore be removed.

    Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

 fs/namespace.c           | 10 ++--------
 include/linux/syscalls.h |  2 --
 init/do_mounts.c         | 28 ++++++++++++++++++++++------
 3 files changed, 24 insertions(+), 16 deletions(-)

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
