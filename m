Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF343528D71
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 20:51:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L27dT5d8kz3c7q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 04:51:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NDxL0w7d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NDxL0w7d; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L27cq1rhwz3bxH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 04:51:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E592614A3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 May 2022 18:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF0DDC385AA
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 May 2022 18:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652727064;
 bh=cewU947dnZxAYYWZcVVzg9XB6k6IUkVI8BCb8BIJf/E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NDxL0w7dWy+e9JU1faVr1IiHB/UeOSU5wfOj9lNE7xyvHqz9LgK7VSYhdwI3lu1g2
 /GufD7KzCOc12w14y/iSkWPzWkqhlpJwLAJ/gX+5UplSAn8KMeUk7a808t5J0rapRQ
 Ezfub3QHPMSUCXe4i8ASr/jaeAR+h9yyu4aJf+RU+T8KpqBaM7ANmz+Zk0sIdsjfQk
 ahv6OZFt9fq2bVHEA1fJsnG92LmTXSo5iQ5ca0/gX8ZPz8eMg0VS7bhjIqqrcfrjeK
 4nuuBKbPLqQ1qX97jnxFWlom5BvbmaaU8qn/s4no74H2YaXiqeeJbzxPqJrZAsC2BT
 65QvwX1TLNIOQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B3DEAC05FD2; Mon, 16 May 2022 18:51:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Mon, 16 May 2022 18:51:04 +0000
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
Message-ID: <bug-215389-206035-mXo54QCqwv@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

--- Comment #22 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300977
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300977&action=3Dedit
dmesg (5.18-rc6, CONFIG_LOWMEM_SIZE=3D0x28000000, outline KASAN, PowerMac G=
4 DP)

I increased THREAD_SHIFT to 14 and used outline KASAN still with
CONFIG_LOWMEM_SIZE=3D0x28000000. The memory corruption output looks slightly
different (but not much):

[...]
pagealloc: memory corruption
f5fcfff0: 00 00 00 00                                      ....
CPU: 1 PID: 29742 Comm: ld.so.1 Not tainted 5.18.0-rc6-PMacG4 #7
Call Trace:
[eea3ba90] [c09890d4] dump_stack_lvl+0x80/0xc0 (unreliable)
[eea3bab0] [c03cce40] __kernel_unpoison_pages+0x208/0x250
[eea3bb00] [c03a2e48] post_alloc_hook+0x108/0x144
[eea3bb30] [c03a66e0] get_page_from_freelist+0x9d4/0x12dc
[eea3bc70] [c03a7ad0] __alloc_pages+0x23c/0x1570
[eea3bde0] [c0379c8c] handle_mm_fault+0x610/0x1240
[eea3bed0] [c002e2d4] ___do_page_fault+0x19c/0x850
[eea3bf10] [c002ebbc] do_page_fault+0x28/0x5c
[eea3bf30] [c000433c] DataAccess_virt+0x124/0x17c
--- interrupt: 300 at 0x6fe0338c
NIP:  6fe0338c LR: 6fe032c4 CTR: 6fe033e0
REGS: eea3bf40 TRAP: 0300   Not tainted  (5.18.0-rc6-PMacG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 48002262  XER: 20000000
DAR: 046a5000 DSISR: 42000000=20
GPR00: 6ffbcb94 afc45940 a7c95560 046a4fe4 8a000000 000127e0 03e59a8b 00000=
003=20
GPR08: 046a5004 046a5000 04621cfc 6fe03170 6fe032c4 6ffece34 00000000 6ffef=
34d=20
GPR16: 02dea020 04416750 00000003 01f8cbec 02de9fa0 01f8c660 00000000 00000=
000=20
GPR24: afc45aa0 6ffef37c afc45a18 04678c7c 0007630c 04678c7c 6ff76ff4 045f5=
990=20
NIP [6fe0338c] 0x6fe0338c
LR [6fe032c4] 0x6fe032c4
--- interrupt: 300
page:e739d6ec refcount:1 mapcount:0 mapping:00000000 index:0x1 pfn:0x290a3
flags: 0x80000000(zone=3D2)
raw: 80000000 00000100 00000122 00000000 00000001 00000000 ffffffff 00000001
raw: 00000000
page dumped because: pagealloc: corrupted page details
[...]

With THREAD_SHIFT=3D14 the stack issue does not show up.

A kernel with inline KASAN and same setup otherwise won't boot showing me t=
his
at the OpenFirmware prompt:

[...]
Finalizing device tree... using OF tree (promptr=3Dff847240)

Invalid memory access at %SRR0: 40000000 %SRR1: 00000000

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
