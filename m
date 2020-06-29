Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6A320CF44
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 16:52:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wVpF02pRzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 00:52:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=zg+q=ak=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wVZl19ZVzDqM1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 00:42:38 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 208181] BUG: KASAN: stack-out-of-bounds in strcmp+0x58/0xd8
Date: Mon, 29 Jun 2020 14:42:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208181-206035-VkyZrl3tSz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208181-206035@https.bugzilla.kernel.org/>
References: <bug-208181-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D208181

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Erm wait... there is some change.

In 5.8-rc1 stacktrace was:
BUG: KASAN: stack-out-of-bounds in strcmp+0x58/0xd8
Read of size 1 at addr c11c1a80 by task swapper/0

CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc1-PowerMacG4 #2
Call Trace:
[c1ae97d0] [c0a2069c] dump_stack+0xfc/0x158 (unreliable)
[c1ae9800] [c04ac5cc] print_address_description.isra.0+0x30/0x3fc
[c1ae9870] [c04acb28] kasan_report+0x110/0x170
[c1ae98b0] [c0a44c00] strcmp+0x58/0xd8
[c1ae98d0] [c0170790] register_lock_class+0xfa4/0x10a0
[c1ae9990] [c0170a34] __lock_acquire+0x1a8/0x382c
[c1ae9b40] [c016f398] lock_acquire+0x5e0/0x854
[c1ae9c00] [c1144014] _raw_spin_lock_irqsave+0x48/0x70
[c1ae9c20] [c0ccbe84] of_find_property+0x2c/0x5c
[c1ae9c50] [c0ccbec8] of_get_property+0x14/0x6c
[c1ae9c70] [c0cdbcd8] unflatten_dt_nodes+0xc4c/0xcdc
[c1ae9ec0] [c0cdbe90] __unflatten_device_tree+0x114/0x1e0
[c1ae9ef0] [c184a294] unflatten_device_tree+0x38/0x54
[c1ae9f10] [c1808600] setup_arch+0xc8/0x630
[c1ae9f50] [c1803268] start_kernel+0xcc/0x4cc
[c1ae9ff0] [000038a0] 0x38a0


In 5.8-rc3 stacktrace is:
BUG: KASAN: stack-out-of-bounds in vprintk_func+0x100/0x4b4
Read of size 4 at addr c1919e14 by task swapper/0

CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc3-PowerMacG4 #2
Call Trace:
[c1ae9c00] [c0a304dc] dump_stack+0xfc/0x158 (unreliable)
[c1ae9c30] [c04ac990] print_address_description.isra.0+0x30/0x3fc
[c1ae9ca0] [c04aceec] kasan_report+0x110/0x170
[c1ae9ce0] [c018c204] vprintk_func+0x100/0x4b4
[c1ae9d10] [c018afd4] printk+0xa8/0xd4
[c1ae9db0] [c003c8c4] __ioremap_caller+0x1c4/0x27c
[c1ae9df0] [c003c394] ioremap+0x20/0x30
[c1ae9e00] [c1813fe4] pmac_feature_init+0x288/0xd90
[c1ae9ed0] [c1812cb0] pmac_probe+0x13c/0x190
[c1ae9ef0] [c001d938] probe_machine+0xe8/0x13c
[c1ae9f10] [c1808614] setup_arch+0xdc/0x630
[c1ae9f50] [c1803268] start_kernel+0xcc/0x4cc
[c1ae9ff0] [000038a0] 0x38a0


What stays the same are the two "setbat: no BAT available" messages in both
cases.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
