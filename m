Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5313970E73C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 23:18:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQnHS72sDz3f7f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 07:18:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cx4v8KmD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cx4v8KmD;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQnGb5D0xz2xvF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 07:17:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 264A862F1D
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 21:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AD5EC433D2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 21:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684876676;
	bh=9tLqLJtUvd8WQgjufgg1A9LohqPAaJqwA1V1xggHBTU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Cx4v8KmDqL14Sz8HUqMC4T/L/+KzUXFZfjNJduKkioyEfVSehjN+Lfh0pfkPJKGLQ
	 IxHtd2xFI0ibzNbopvH5Qo68sq/qaR1mtu2eu2X+yBtbnIdceNrMG+I6ucGgarKTez
	 3+vfFkgV47W2G5Vga8Yb4VWkQ1X6sNs/xa7354FPOq1D8kBzok3ZRUw7sB5elCb3V5
	 M++DwczFChgeJ/XPbbNUv0hDydoCoY0RKUFMQJesmp+gD5+Rb/C0azz3/8NdYbotxu
	 kl34Kr5cieJbFv+wS+SFhsaYTUNjl+Geze5XVaQI7GYlALx2eFmf6MGfsIC/rLnWsD
	 g+FRwrwBCiLjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 702A9C43142; Tue, 23 May 2023 21:17:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Tue, 23 May 2023 21:17:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215389-206035-6DCYhREAad@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

--- Comment #39 from Erhard F. (erhard_f@mailbox.org) ---
No change with 6.4-rc4, only additional data "page_type: 0xffffffff()" is
shown:

[...]
pagealloc: memory corruption
06fe3258: 00 00 00 00                                      ....
CPU: 1 PID: 397 Comm: stress Tainted: G        W       T=20
6.4.0-rc3-PMacG4-dirty #1
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
Call Trace:
[f2a35c70] [c0eea17c] dump_stack_lvl+0x60/0xa4 (unreliable)
[f2a35c90] [c0eea1d8] dump_stack+0x18/0x30
[f2a35ca0] [c0360f90] __kernel_unpoison_pages+0x234/0x288
[f2a35ce0] [c033fdf4] get_page_from_freelist+0xd90/0x10d8
[f2a35d90] [c0340978] __alloc_pages+0x138/0xdd8
[f2a35e40] [c0315b80] handle_mm_fault+0xab8/0x15e0
[f2a35ed0] [c003a3d4] ___do_page_fault+0x320/0x8c4
[f2a35f10] [c003abe0] do_page_fault+0x28/0x80
[f2a35f30] [c000433c] DataAccess_virt+0x124/0x17c
--- interrupt: 300 at 0xaf30d8
NIP:  00af30d8 LR: 00af30b4 CTR: 00000000
REGS: f2a35f40 TRAP: 0300   Tainted: G        W       T=20=20
(6.4.0-rc3-PMacG4-dirty)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 20882464  XER: 00000000
DAR: 8f7a3010 DSISR: 42000000=20
GPR00: 00af30b4 af9c9cb0 a7cd2740 6e97d010 39300000 20224462 00000000 00a10=
264=20
GPR08: 20e27000 20e26000 00000000 4062ceda 20882462 00b0fff4 00000000 00000=
000=20
GPR16: 00000000 00000002 00000000 0000005a 40802462 80002462 40002462 00b10=
0a4=20
GPR24: ffffffff ffffffff 39300000 00000000 00000000 6e97d010 00b17d64 00001=
000=20
NIP [00af30d8] 0xaf30d8
LR [00af30b4] 0xaf30b4
--- interrupt: 300
page:e314e657 refcount:1 mapcount:0 mapping:00000000 index:0x1 pfn:0x31065
flags: 0x80000000(zone=3D2)
page_type: 0xffffffff()
raw: 80000000 00000100 00000122 00000000 00000001 00000000 ffffffff 00000001
raw: 00000000
page dumped because: pagealloc: corrupted page details

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
