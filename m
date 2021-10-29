Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 403F343FDBD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 16:01:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hgkbv0sVhz3cDB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 01:00:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NYUUmgZF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NYUUmgZF; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgkbC4GhRz2xCX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 01:00:23 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 25D2B6115C
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635516021;
 bh=mDWTm6R2ptQOi8pwHcfnfDN/vgwJxkQCV0jEEvpbg0Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NYUUmgZF6TXjq3GsH+nxxmefw+egTNrxzRJMj6L0rOju4hdPqyP79R1r2K1KipQSk
 APRIq6IKBwXFZxUl/1nKUQg6BLEG879HlIGtpalbTMaDsZBNCy3naggmEyg9PuN2fk
 G7mK5myqPT5UNzWfYRgJeeXxUEpqEfQC3yl7Ml9mVMv3qiPpswT+DPkHbaLXdWBGMO
 MgqXZ0rqH8Hm648WWZ8xFTxZqi4+KzW8RlyzMMhq8bAebr+1uPVI/WpevvG/OJ4XFk
 ib2WKoPrc/5F9CesApxFrpsMqFRGYlqNeHQxjZsAtR5Dg4Ge/zIjabdHqKEwzDdsRL
 VVylYVNRMIVgA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1BD6F60EBB; Fri, 29 Oct 2021 14:00:21 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 214867] UBSAN: shift-out-of-bounds in
 drivers/of/unittest.c:1933:36
Date: Fri, 29 Oct 2021 14:00:20 +0000
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
Message-ID: <bug-214867-206035-qiF9HazvLL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214867-206035@https.bugzilla.kernel.org/>
References: <bug-214867-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214867

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 299363
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299363&action=3Dedit
kernel .config (kernel 5.15-rc7, Talos II)

 # lspci=20
0000:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0000:01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/A=
TI]
Turks XT [Radeon HD 6670/7670]
0000:01:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Turks HDMI
Audio [Radeon HD 6500/6600 / 6700M Series]
0001:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0001:01:00.0 Non-Volatile memory controller: Phison Electronics Corporation
Device 5008 (rev 01)
0002:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0003:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0003:01:00.0 USB controller: Texas Instruments TUSB73x0 SuperSpeed USB 3.0 =
xHCI
Host Controller (rev 02)
0004:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0004:01:00.0 Ethernet controller: Broadcom Inc. and subsidiaries NetXtreme
BCM5719 Gigabit Ethernet PCIe (rev 01)
0004:01:00.1 Ethernet controller: Broadcom Inc. and subsidiaries NetXtreme
BCM5719 Gigabit Ethernet PCIe (rev 01)
0005:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0005:01:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge =
(rev
04)
0005:02:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED Grap=
hics
Family (rev 41)
0030:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0031:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0032:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)
0033:00:00.0 PCI bridge: IBM POWER9 Host Bridge (PHB4)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
