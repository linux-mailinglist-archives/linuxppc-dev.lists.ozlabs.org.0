Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4A45709A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 20:01:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhWsJ4VXrz3c8C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 04:01:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hmi+YMhn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hmi+YMhn;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhWrW3kHzz2x9d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 04:00:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D6303B80E4A
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 18:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9899CC34115
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657562422;
	bh=UOEUJ9JRe9IYZLTGLLG8fYIrdLhbNCCoNj4CgUlmbjU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hmi+YMhnCV4iV1lg+u/S6I64YvLFP7vbM++eG1R55j3SpfUi12W/YHDRS9lbCbeIX
	 kiGa/e8PIvK60Bm32yNRxyQKD6D7aT2GStYR+rVRb59KXWzvwaUckq3dlhN2zhm7Ww
	 msf0GozWa1z/4qiscz+Hyk3J+Ah9OwuA8nKkEJBILO7R6lP/CDS3uQnRdBvaP75+FP
	 bPwr0JoeFCY94pQ23UyCt+U03yNDy3jZNvY9sgBhiEKq6m5oGaLmCE29FmjxJYltZs
	 8WaT2BtDI0Qez7hBscM5W/ukkRhQWbrI+pa5Tpjugvuwa4poax+8dVenFOnTcdpr15
	 yJg5tfs3rl2Lw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 878BCCC13B0; Mon, 11 Jul 2022 18:00:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216238] Kernel 5.10.129 fails to boot on a Talos 2 with HASH
 MMU (PPC_RADIX_MMU not set) with CONFIG_PAGE_POISONING=y
Date: Mon, 11 Jul 2022 18:00:22 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216238-206035-IIZXwQoaEI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216238-206035@https.bugzilla.kernel.org/>
References: <bug-216238-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216238

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Some data about the machine:

 # inxi -bZ
System:
  Host: T1000 Kernel: 5.10.129-gentoo-P9 ppc64 bits: 64 Console: pty pts/0
    Distro: Gentoo Base System release 2.8
Machine:
  Type: PPC System: T2P9D01 REV 1.01 details: N/A
CPU:
  Info: 2x 4-core POWER9 altivec supported [MT MCP SMP] speed (MHz):
    avg: 2561 min/max: 2154/3800
Graphics:
  Device-1: AMD Turks XT [Radeon HD 6670/7670] driver: radeon v: kernel
  Device-2: ASPEED Graphics Family driver: N/A
  Display: x11 server: X.Org 21.1.1 driver: loaded: radeon
    resolution: 1440x900~60Hz
  OpenGL: renderer: llvmpipe (LLVM 14.0.4 128 bits) v: 4.5 Mesa 22.0.5
Network:
  Device-1: Broadcom NetXtreme BCM5719 Gigabit Ethernet PCIe driver: tg3
  Device-2: Broadcom NetXtreme BCM5719 Gigabit Ethernet PCIe driver: tg3
Drives:
  Local Storage: total: 447.13 GiB used: 10.69 GiB (2.4%)
Info:
  Processes: 345 Uptime: 2h 18m Memory: 61.78 GiB used: 1.06 GiB (1.7%)
  Shell: Bash inxi: 3.3.12

 # /home/ef # lspci=20
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
