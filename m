Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA33D5527EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 01:15:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRlqb5fymz3chv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 09:15:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ERyz48ls;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ERyz48ls;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRlpw2bbcz2xbY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 09:14:48 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6306061540
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 23:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2F04C341C7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 23:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655766883;
	bh=cC2YdbOYUBItne3AigqRdVjI1a0CuBfLvmkigYlzjuQ=;
	h=From:To:Subject:Date:From;
	b=ERyz48lsJX60QLHTDkQY5tE3GQ4AOIQBz+NVuvD2e9Oga5xcQYu59O/lGm//El9el
	 vCyvaQ1cq6hA6ZlHkmpMgwA6k3jfK4GdYp6Pn0IIDF3RrzCmLX2e3Kp+7WPMC3WWjK
	 ldlB8EFnYHOJ1Dm1a44XW54XsQFvpaMxro59Dy4PJkNC++MV4DsaQJI84dwAueHG6Y
	 rO6bOa0CZ65ksOwYJm9uJLFlPxC7QJOs4aw1bAEe6k2QZ8YGPv4dv4a6JMzbDcaFXo
	 TNtvtfOnF7yilCzuVOgkmwMWSeh7Ymf9ZQ7A0HWXs3d+Lf+Iq0Yi2Umyl7uXTKxpbq
	 a2/SgbhKOH62g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B923DC05FD2; Mon, 20 Jun 2022 23:14:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216156] New: kmemleak: Not scanning unknown object at
 0xc00000007f000000
Date: Mon, 20 Jun 2022 23:14:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216156-206035@https.bugzilla.kernel.org/>
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

            Bug ID: 216156
           Summary: kmemleak: Not scanning unknown object at
                    0xc00000007f000000
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.19-rc3
          Hardware: PPC-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 301230
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301230&action=3Dedit
dmesg (5.19-rc3, PowerMac G5 11,2)

Happens every boot with kmemleak enabled:

[...]
PowerMac motherboard: PowerMac G5 Dual Core
ioremap() called early from .btext_map+0x64/0xc0. Use early_ioremap() inste=
ad
ioremap() called early from .iommu_init_early_dart+0x260/0x924. Use
early_ioremap() instead
kmemleak: Not scanning unknown object at 0xc00000007f000000
CPU: 0 PID: 0 Comm: swapper Not tainted 5.19.0-rc3-PMacG5+ #2
Call Trace:
[c00000000113faf0] [c0000000006c03d0] .dump_stack_lvl+0x7c/0xc4 (unreliable)
[c00000000113fb80] [c0000000002dff90] .kmemleak_no_scan+0xe0/0x100
[c00000000113fc00] [c000000000d487e8] .iommu_init_early_dart+0x2f0/0x924
[c00000000113fd40] [c000000000d49984] .pmac_probe+0x1b0/0x20c
[c00000000113fde0] [c000000000d36ee8] .setup_arch+0x1b8/0x674
[c00000000113feb0] [c000000000d316f4] .start_kernel+0xdc/0xb74
[c00000000113ff90] [c00000000000c5d8] start_here_common+0x1c/0x44
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
