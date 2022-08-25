Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF805A0539
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 02:40:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCkdX2pQsz3c2Q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 10:40:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nYCKK8d4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nYCKK8d4;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCkcp6vHvz2xGt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 10:39:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 636B76136D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 00:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C74F7C433C1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 00:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661387974;
	bh=JCbW4dDYSVv7WL7YORvWDDZI+MlBMTrs/8llv5vzrMU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nYCKK8d4ZExLbfMR/Ks+BsqcWY+GQvgAGrW1os0RZI+I+5Nmx43vcriHbhHMA2p77
	 uQyCMETcrWOlMRP4NQRoakjxJToHy5EKFXwMzsRgWlQlT0t0x2fGqhZkuuOBeTWa1L
	 yo0d5OJLIBfLRVLrpIPfJhogNkCYj4tpPkPqTgXHFLd6RnJYDLEdFeQ4E41Qss2TBx
	 w9+GLRAd96GSIGwbkCdBsRyeWF2uGBtce57PPJCEp+6rTqRLDpD3yG5ON0hYbGiOod
	 w+aKXCILtywYugjftMdaoo6/Ql3Jj+EPsOICH8pHJTDOKOjLIQFTmzu04C9UKNYeu9
	 wBHMqwe/Uo6Hg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A8170C433E4; Thu, 25 Aug 2022 00:39:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216156] kmemleak: Not scanning unknown object at
 0xc00000007f000000
Date: Thu, 25 Aug 2022 00:39:34 +0000
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
Message-ID: <bug-216156-206035-pMErDfIMWY@https.bugzilla.kernel.org/>
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

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301653
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301653&action=3Dedit
dmesg (6.0-rc2, PowerMac G5 11,2)

Reinvestigating on v6.0-rc2. kmemleak does no longer show any leaks but the
"Not scanning unknown object at 0xc00000007f000000" is still there:

[...]
PowerMac motherboard: PowerMac G5 Dual Core
ioremap() called early from .btext_map+0x64/0x100. Use early_ioremap() inst=
ead
ioremap() called early from .iommu_init_early_dart+0x274/0x968. Use
early_ioremap() instead
kmemleak: Not scanning unknown object at 0xc00000007f000000
CPU: 0 PID: 0 Comm: swapper Tainted: G                T  6.0.0-rc2-PMacG5+ =
#2
Call Trace:
[c00000000257bb00] [c0000000008f8eb4] .dump_stack_lvl+0xb0/0x124 (unreliabl=
e)
[c00000000257bb90] [c00000000041ef48] .kmemleak_no_scan+0x118/0x130
[c00000000257bc10] [c00000000201e6e4] .iommu_init_early_dart+0x304/0x968
[c00000000257bd40] [c00000000201f92c] .pmac_probe+0x1ac/0x218
[c00000000257bde0] [c00000000200b284] .setup_arch+0x1a4/0x70c
[c00000000257beb0] [c000000002004d34] .start_kernel+0x13c/0xd2c
[c00000000257bf90] [c00000000000c608] start_here_common+0x1c/0x94
DART table allocated at: (____ptrval____)
DART IOMMU initialized for U4 type chipset
Using PowerMac machine description
printk: bootconsole [udbg0] enabled
CPU maps initialized for 1 thread per core
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
