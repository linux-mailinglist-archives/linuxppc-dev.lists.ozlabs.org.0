Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4F1781B50
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Aug 2023 01:01:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QEQa61/o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RSvP06CHRz3c3b
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Aug 2023 09:01:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QEQa61/o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RSvN5149Yz2ypy
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Aug 2023 09:00:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D2670606A0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 23:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CCB5C433C7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 23:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692486016;
	bh=WFQKxUOyZbN0zv50ERc+p+o2Ptxd6AHFrBurkcCMAdA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QEQa61/o3n3sJb5fEN+Z/Xf1c6gAHAMKyM1RMHXmphshnXBm1RCN12eGFkbb9ATYe
	 WKDforsPx40suNPTlOYo+eeJN77ln0ToHYM9s2eXxtwZgnQ8u/s6s7MPnEgxDoe2VA
	 IncM6SRl8EyVC5u6BKuMNlfsw6EhEOOXsgPLUngLWf6Eomm4wDMB/KZfik//0YM3Xr
	 6NijRSF+YPPTtb4KyIBdut/UZU3kr0sWZwSh7voIIo9pdYxQphL7GoV2F3Ma05wVNv
	 v8TsOb2SbIdyEet2QerMfzU72GvqsE3gTCs63N2cknjhc559xZdLqKiFJZ6cEBtq8g
	 CJkrG0QihkLuQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0A380C4332E; Sat, 19 Aug 2023 23:00:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216156] kmemleak: Not scanning unknown object at
 0xc00000007f000000
Date: Sat, 19 Aug 2023 23:00:15 +0000
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
Message-ID: <bug-216156-206035-z4jwZ3FhUz@https.bugzilla.kernel.org/>
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
 Attachment #301230|0                           |1
        is obsolete|                            |
 Attachment #301232|0                           |1
        is obsolete|                            |
 Attachment #303178|0                           |1
        is obsolete|                            |

--- Comment #8 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 304914
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304914&action=3Dedit
dmesg (6.5-rc6, PowerMac G5 11,2)

Kernel 6.5-rc6 still affected.

[...]
PowerMac motherboard: PowerMac G5 Dual Core
ioremap() called early from btext_map+0x6c/0xf0. Use early_ioremap() instead
ioremap() called early from iommu_init_early_dart+0x270/0x948. Use
early_ioremap() instead
kmemleak: Not scanning unknown object at 0xc00000007f000000
CPU: 0 PID: 0 Comm: swapper Tainted: G                T  6.5.0-rc6-PMacG5-d=
irty
#1
Call Trace:
[c00000000241fc70] [c000000000ff726c] dump_stack_lvl+0xb0/0x11c (unreliable)
[c00000000241fcb0] [c00000000048fdc8] kmemleak_no_scan+0x118/0x130
[c00000000241fd20] [c000000002021ad0] iommu_init_early_dart+0x300/0x948
[c00000000241fe30] [c000000002022bf8] pmac_probe+0x1b8/0x228
[c00000000241fe80] [c00000000200ec24] setup_arch+0x270/0x7d4
[c00000000241ff30] [c000000002004f14] start_kernel+0xc0/0x850
[c00000000241ffe0] [c00000000000cb48] start_here_common+0x1c/0x20
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
