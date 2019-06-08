Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4603A009
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 15:48:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45LgjK2925zDqmK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 23:48:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bugzilla.kernel.org
 (client-ip=198.145.29.98; helo=mail.wl.linuxfoundation.org;
 envelope-from=bugzilla-daemon@bugzilla.kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Lgds4WBSzDqWs
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2019 23:45:52 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id B79512849B
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2019 13:45:49 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id A7EFE28B9B; Sat,  8 Jun 2019 13:45:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 203839] Kernel 5.2-rc3 fails to boot on a PowerMac G4 3,6:
 systemd[1]: Failed to bump fs.file-max, ignoring: invalid argument
Date: Sat, 08 Jun 2019 13:45:48 +0000
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
Message-ID: <bug-203839-206035-3tu0cdAZKW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203839-206035@https.bugzilla.kernel.org/>
References: <bug-203839-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203839

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 283163
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D283163&action=3Dedit
failed boot, screenshot 5.2-rc3+

After reverting the 3 commits on top of v5.2-rc3 the kernel panics at an
earlier stage with:

Kernel panic - not syncing: Requested init /lib/systemd/systemd failed (err=
or
-8)


# LC_MESSAGES=3DC git status
HEAD detached at v5.2-rc3
You are currently reverting commit b86fb88855ea.
  (all conflicts fixed: run "git revert --continue")
  (use "git revert --abort" to cancel the revert operation)

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   arch/powerpc/kernel/entry_32.S
        modified:   arch/powerpc/kernel/head_32.S
        modified:   arch/powerpc/kernel/head_32.h
        modified:   arch/powerpc/kernel/head_40x.S
        modified:   arch/powerpc/kernel/head_44x.S
        modified:   arch/powerpc/kernel/head_8xx.S
        modified:   arch/powerpc/kernel/head_booke.h
        modified:   arch/powerpc/kernel/head_fsl_booke.S

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
