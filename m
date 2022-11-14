Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF61628BD7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 23:12:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NB3T44s5bz3cHm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 09:12:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X/BceVLY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X/BceVLY;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NB3S57130z3cFZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 09:11:33 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 543A8B81333
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 22:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FB69C433D7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 22:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668463888;
	bh=uwyVSpkrwXUl7jnHJ81AUw4TzNnX5k4ICx1w1Dl1uw4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X/BceVLYYtCEPAYHKk97YPFVrwMdIEyIw9+7VSSJpDLnJD3UWr/u6Rpr7lQjAsfDA
	 Fw++/7g923nzy7BztdaQhwl9CgViPrUwBOf+kLGaEVEtshwlznioXjzg7/mvUw/AHC
	 YgAtNO29BN0KcW+Rleb6Qdn2w3NhjBqhAuzAYnzI8OzrZwpP1hA21wcMAvEs5oKNHg
	 R1VKAn0G1Lg6jglDkfBtFWvprWU+Gq0rFjl8YxqpPhnTd+tP+YFxiu0oRxnCh2r80W
	 6Zs2uTeUTb7n5HmwEAqw3Dvl/+d5nGagcswqpdVgvrdWDE85vFbUo17Ein2ypSJy43
	 TuVMJSeY3VAmg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E96A2C433E4; Mon, 14 Nov 2022 22:11:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216156] kmemleak: Not scanning unknown object at
 0xc00000007f000000
Date: Mon, 14 Nov 2022 22:11:27 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-216156-206035-BuBXB4ixMj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216156-206035@https.bugzilla.kernel.org/>
References: <bug-216156-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216156

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #301653|0                           |1
        is obsolete|                            |

--- Comment #6 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303178
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303178&action=3Dedit
dmesg (6.1-rc5, PowerMac G5 11,2)

Still there in 6.1-rc5.

hash-mmu: Initializing hash mmu with SLB
Linux version 6.1.0-rc5-PMacG5 (root@T1000) (gcc (Gentoo 12.2.1_p20221008 p=
1)
12.2.1 20221008, GNU ld (Gentoo 2.39 p5) 2.39.0) #2 SMP Mon Nov 14 17:51:54=
 CET
2022
ioremap() called early from .pmac_feature_init+0x22c/0x107c. Use
early_ioremap() instead
ioremap() called early from .pmac_feature_init+0x2b0/0x107c. Use
early_ioremap() instead
Found U4 memory controller & host bridge @ 0xf8000000 revision: 0x42
Mapped at 0xc0003e0080000000
ioremap() called early from .probe_one_macio+0x3a8/0x60c. Use early_ioremap=
()
instead
Found a Shasta mac-io controller, rev: 0, mapped at 0x(____ptrval____)
PowerMac motherboard: PowerMac G5 Dual Core
ioremap() called early from .btext_map+0x64/0xf0. Use early_ioremap() inste=
ad
ioremap() called early from .iommu_init_early_dart+0x294/0x978. Use
early_ioremap() instead
kmemleak: Not scanning unknown object at 0xc00000007f000000
CPU: 0 PID: 0 Comm: swapper Tainted: G                T  6.1.0-rc5-PMacG5 #2
Call Trace:
[c0000000013e3b10] [c000000000b4e7c0] .dump_stack_lvl+0x7c/0xd8 (unreliable)
[c0000000013e3ba0] [c000000000321048] .kmemleak_no_scan+0x118/0x130
[c0000000013e3c20] [c00000000101bd2c] .iommu_init_early_dart+0x324/0x978
[c0000000013e3d50] [c00000000101d064] .pmac_probe+0x1b0/0x21c
[c0000000013e3df0] [c00000000100af7c] .setup_arch+0x198/0x6f0
[c0000000013e3eb0] [c000000001004cac] .start_kernel+0xdc/0xb68
[c0000000013e3f90] [c00000000000c7f8] start_here_common+0x1c/0x20
DART table allocated at: (____ptrval____)
DART IOMMU initialized for U4 type chipset
Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
printk: bootconsole [udbg0] enabled
CPU maps initialized for 1 thread per core
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
