Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D90D55673C4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 18:03:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LcnWz5t4sz3c57
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 02:03:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xzfdnfc1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xzfdnfc1;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LcnWC2Rgtz2yLX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 02:02:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A437EB817F9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 16:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AEBDC341C7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 16:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657036945;
	bh=OcqTDO0bNPuWOjmDTfQ8qQtu6PnplbSgi1TIu8VdyNk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Xzfdnfc1KT0ILZrMuvf6TDUCAPmYUeuJbRtxwbwE7gg6xdsUFsqO8Q0+mUstB+3DA
	 Q+f1pfFDTyjPUPIJ4akjh3oGIz7+6ePAuOQo4XSem3p7mBsFe9Anhg2T1Wx9AxjMqR
	 qtiXKBoT+3bzy17SCQDH6n6eDcLWkQ2covoJiIUxPhm/UflznnqtYRRdviZXprz/BP
	 uPGLFwJOjFHzrXE5cE8lZgNMI4m6OlPetGR+gWEpBvc1B2wcnhyg+Q3YPKjJNAaXYb
	 5xnXhn2GjYYa9Z95IU5ukKcfoVu1OGLt705xV6YpEcINQIvKgZDj1L991aBGwLjjHw
	 mASB1e64V2s5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4DAC5C05FD6; Tue,  5 Jul 2022 16:02:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Tue, 05 Jul 2022 16:02:25 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215389-206035-NURmfdrVxD@https.bugzilla.kernel.org/>
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

--- Comment #33 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301337
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301337&action=3Dedit
dmesg (5.19-rc5, outline KASAN, PowerMac G4 DP)

Re-tested on 5.19-rc5 +
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/2ee707512b8b212b079=
b877f4ceb525a1606a3fb.1656655567.git.christophe.leroy@csgroup.eu/

I can run the kernel with outline KASAN, default THREAD_SHIFT and without
advanced options necessary. Also I don't get the stack issue (bug #216041) =
any
longer.

However as long as CONFIG_SMP=3Dy (CONFIG_NR_CPUS=3D2) is set I still get t=
he
memory corruption:

[...]
pagealloc: memory corruption
f5fcfff0: 00 00 00 00                                      ....
CPU: 1 PID: 27635 Comm: estrip Not tainted 5.19.0-rc5-PMacG4+ #1
Call Trace:
[f380b9b0] [c0829ebc] dump_stack_lvl+0x60/0x90 (unreliable)
[f380b9d0] [c0307528] __kernel_unpoison_pages+0x1d8/0x220
[f380ba20] [c02dd3bc] post_alloc_hook+0x108/0x144
[f380ba50] [c02e0a70] get_page_from_freelist+0x9e0/0x1278
[f380bb90] [c02e1e04] __alloc_pages+0x250/0x1078
[f380bcf0] [c02af098] wp_page_copy+0x128/0xdb8
[f380bde0] [c02b6fdc] handle_mm_fault+0x954/0x1138
[f380bed0] [c0029938] ___do_page_fault+0x250/0x84c
[f380bf10] [c002a168] do_page_fault+0x28/0x5c
[f380bf30] [c000433c] DataAccess_virt+0x124/0x17c
--- interrupt: 300 at 0x65b734
NIP:  0065b734 LR: 0065b708 CTR: 00354600
REGS: f380bf40 TRAP: 0300   Not tainted  (5.19.0-rc5-PMacG4+)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 82222420  XER: 00000000
DAR: 026fcea0 DSISR: 0a000000=20
GPR00: 00000000 afbd5250 a7b0c560 026bb5f0 0269deac 026bb628 696e6f64 026fc=
ea0=20
GPR08: 00000000 00000000 00000000 00354600 42222420 0071fff4 026af620 00722=
43c=20
GPR16: 00723b50 007223a4 026b1770 026ec8a0 007222e4 0269de70 02700920 00000=
001=20
GPR24: 00721e9c 00721eb8 0072082c 00000000 afbd52ec 00000000 0072608c 00000=
000=20
NIP [0065b734] 0x65b734
LR [0065b708] 0x65b708
--- interrupt: 300
page:ef4bd6ec refcount:1 mapcount:0 mapping:00000000 index:0x1 pfn:0x310a3
flags: 0x80000000(zone=3D2)
raw: 80000000 00000100 00000122 00000000 00000001 00000000 ffffffff 00000001
raw: 00000000
page dumped because: pagealloc: corrupted page details

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
