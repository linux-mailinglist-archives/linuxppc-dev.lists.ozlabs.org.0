Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 842A27BE560
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 17:50:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VQCKSbFR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S43R52gmdz3cBC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 02:50:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VQCKSbFR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S43QB4cflz3c2L
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 02:50:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3D56BB815A1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 15:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 978B1C433C7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 15:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696866606;
	bh=YUtCzdo9LURELgR1KhwCnp76RzatV7ypdfpGGj/cpC0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VQCKSbFRWvtBwZWnUyopZuJ109RQ5lJZqUdsY4oGr9ilvOlqSyvZK0rPKQ2YtTojF
	 uXr3s7YOaa4E7TnP23Oywb0vscGvtHpZMr/6dnplLxzeLZfY4paIfprCC7e3erAaJ+
	 JrG+WtP2fRdkZJEm07RfRmT9fFov/9tImedRngnAJQxvnGADE4DRMuPFTSqtG8Wt2n
	 t68QFv0KYbl90ff4xFiNUkMTPBDYNwuSuLoBUSbUvKmdbtBm0IRVWiNH+UEfACfZn2
	 qAEljscNUsisu6FMgHJHZtrp9zbg6T0Ss7IeBPllWvYRC1NHl5qpDw95LmIJ6drtaO
	 EChOA63t5T1Pw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 853C4C4332E; Mon,  9 Oct 2023 15:50:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216156] [bisected] kmemleak: Not scanning unknown object at
 0xc00000007f000000
Date: Mon, 09 Oct 2023 15:50:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216156-206035-vxaYTGKDIb@https.bugzilla.kernel.org/>
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

--- Comment #14 from Erhard F. (erhard_f@mailbox.org) ---
Thanks for having a look at the issue!

Applied your patch on top of v6.5.6 but it didn't work out. Now I get:

[...]
drmem: No dynamic reconfiguration memory found
ata5.00: ATAPI: HL-DT-STDVD-RAM GH22NP20, 2.00, max UDMA/66
kmemleak: Not scanning unknown object at 0xc00000007f000000
ata5.01: CFA: DeLOCK 54143 512MB, 100511E, max UDMA/66
CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.5.6-PMacG5-dirty #1
ata5.01: 1009008 sectors, multi 1: LBA=20
Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
Call Trace:
[c0000000030ebbd0] [c000000000c2adac] dump_stack_lvl+0x70/0xa0 (unreliable)
[c0000000030ebc00] [c0000000003125d0] kmemleak_no_scan+0xf0/0x110
[c0000000030ebc70] [c000000001011594] iommu_init_late_dart+0x28/0x5c
[c0000000030ebc90] [c00000000000d6f8] do_one_initcall+0x68/0x2f8
[c0000000030ebd60] [c000000001004534] kernel_init_freeable+0x2d8/0x358
[c0000000030ebdf0] [c00000000000dc18] kernel_init+0x28/0x180
[c0000000030ebe50] [c00000000000bf94] ret_from_kernel_user_thread+0x14/0x1c
--- interrupt: 0 at 0x0
NIP:  0000000000000000 LR: 0000000000000000 CTR: 0000000000000000
REGS: c0000000030ebe80 TRAP: 0000   Not tainted  (6.5.6-PMacG5-dirty)
MSR:  0000000000000000 <>  CR: 00000000  XER: 00000000
IRQMASK: 0=20
GPR00: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR28: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
ata1: SATA link down (SStatus 4 SControl 300)
NIP [0000000000000000] 0x0
LR [0000000000000000] 0x0
--- interrupt: 0
Loading compiled-in X.509 certificates
kmemleak: Kernel memory leak detector initialized (mem pool available: 1578=
8)
kmemleak: Automatic memory scanning thread started
debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page
table helpers
Btrfs loaded, zoned=3Dno, fsverity=3Dno
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
