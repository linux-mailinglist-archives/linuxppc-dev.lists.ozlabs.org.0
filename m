Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C2739D063
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 20:15:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyl643Q15z308P
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 04:15:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FT/UMXAY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FT/UMXAY; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyl5R2VZJz2yjY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 04:14:35 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id B36FC61377
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 18:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623003270;
 bh=7n6i/MS8YtlcBKBj8PpzX6Ruc/Boa2XI4zfSVXb/RI8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FT/UMXAYreqeFPUalBKQ2z+WZYgM2MWxi2f8nj2T1giwGfo4yZS5sd9fqOleEeavk
 Ot8HdmCifrMaRxy6QDbHQT9NGzZ2aVZ4zyXkYg2dzru1rduDnfMAl4QHuir4YuoDHe
 GocQ7EMJ4CndsZAITGXCycwXdgYC7oWM907Q/3WWmafSLSdckzN/y49ILe+piGBuBC
 8mzTTc+F5+JXugBdMkW6srT8w9O3fn3M6QaSbHa9IXzi1GhxNlZIF8SbjiZpbCM8t5
 aBWAGxfyYPFPVDGfryTAau3N6bAB5visLqTcsrd0zNm0NvOfvsEM17AkjrZyfmlvsw
 FAU6Wm+IBqRXw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B165F61179; Sun,  6 Jun 2021 18:14:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213079] [bisected] IRQ problems and crashes on a PowerMac G5
 with 5.12.3
Date: Sun, 06 Jun 2021 18:14:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213079-206035-wv45TwRpQe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213079-206035@https.bugzilla.kernel.org/>
References: <bug-213079-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213079

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 297191
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297191&action=3Dedit
bisect.log

Turns out the problem was introduced between v5.11 and v5.12 by following
commit:

 # git bisect good
fbbefb320214db14c3e740fce98e2c95c9d0669b is the first bad commit
commit fbbefb320214db14c3e740fce98e2c95c9d0669b
Author: Oliver O'Halloran <oohall@gmail.com>
Date:   Tue Nov 3 15:35:07 2020 +1100

    powerpc/pci: Move PHB discovery for PCI_DN using platforms

    Make powernv, pseries, powermac and maple use ppc_mc.discover_phbs.
    These platforms need to be done together because they all depend on
    pci_dn's being created from the DT. The pci_dn contains a pointer to
    the relevant pci_controller so they need to be created after the
    pci_controller structures are available, but before PCI devices are
    scanned. Currently this ordering is provided by initcalls and the
    sequence is:

      1. PHBs are discovered (setup_arch) (early boot, pre-initcalls)
      2. pci_dn are created from the unflattended DT (core initcall)
      3. PHBs are scanned pcibios_init() (subsys initcall)

    The new ppc_md.discover_phbs() function is also a core_initcall so we
    can't guarantee ordering between the creation of pci_controllers and
    the creation of pci_dn's which require a pci_controller. We could use
    the postcore, or core_sync initcall levels, but it's cleaner to just
    move the pci_dn setup into the per-PHB inits which occur inside of
    .discover_phb() for these platforms. This brings the boot-time path in
    line with the PHB hotplug path that is used for pseries DLPAR
    operations too.

    Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
    [mpe: Squash powermac & maple in to avoid breakage those platforms,
          convert memblock allocs to use kmalloc to avoid warnings]
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
    Link: https://lore.kernel.org/r/20201103043523.916109-2-oohall@gmail.com

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
