Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04187468822
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 23:48:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J64cL6KFhz305L
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Dec 2021 09:48:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B9+Gc1yp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B9+Gc1yp; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J64bW5dHQz2xtW
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Dec 2021 09:48:07 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 19FBB60F43
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 22:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81AAEC341C2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 22:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638658083;
 bh=xHVLniYkiQC011+OBpG5B8C1BehuCfxpbZngUl6TPuU=;
 h=From:To:Subject:Date:From;
 b=B9+Gc1ypUvyZcYoZFChqV6aBNBc2jRRahqCOKtB6T2gxvUGCM1qg1jWuZ1WdF5s1V
 n8RRow0nOldnYUXZJfx8wpDzDjM3tO6AJFNINq63uR/wEAe1D5uh260WvZgSVxqYks
 deAC8xpxNHb+pUIQp1a7VtQsbHKsWdEdu0lhUxMBBK6Jc8QJ9ZVK/LJN1z6A18D0TM
 GOLMI66zkQGTx0sOTCeXJx5Ij5AJv+CC0xl4yTO6LwJykuzlhuMLFQbGgjEKiJVYfH
 Bz4LufgXbT2SYK/D1fwIvAJAx31Igi5eqGiFDxVyjlnsbAIbTcDBVSiBwuhXhQVCuF
 XWiyqUB3l7KFw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 57DB361005; Sat,  4 Dec 2021 22:48:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215217] New: Kernel fails to boot at an early stage when built
 with GCC_PLUGIN_LATENT_ENTROPY=y (PowerMac G4 3,6)
Date: Sat, 04 Dec 2021 22:48:03 +0000
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
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-215217-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215217

            Bug ID: 215217
           Summary: Kernel fails to boot at an early stage when built with
                    GCC_PLUGIN_LATENT_ENTROPY=3Dy (PowerMac G4 3,6)
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.16-rc3
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
                CC: christophe.leroy@csgroup.eu
        Regression: No

Created attachment 299871
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299871&action=3Dedit
kernel .config (5.16-rc3, PowerMac G4 DP)

Get this on my PowerMac G4 DP when I build a kernel with
GCC_PLUGIN_LATENT_ENTROPY=3Dy. The kernel gets decompressed but shortly
afterwards the machine freezes, displaying in black letters on an entirely
white screen:

done
found display   : /pci@f0000000/ATY,AlteracParent@10/ATY,Alterac_B@1,
opening...

Same kernel config built without GCC_PLUGIN_LATENT_ENTROPY just boots fine.
Happens on v5.15.5 and v5.16-rc3. I did not test other kernel versions yet.

My Talos II (Power9) on the other hand just works fine with a
GCC_PLUGIN_LATENT_ENTROPY=3Dy built kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
