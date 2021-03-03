Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D211132BB3C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 22:21:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrRkW62PZz3cbZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 08:21:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Up9kvSDE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Up9kvSDE; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrRk23DZ9z30My
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 08:20:42 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id B0848600EF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 21:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614806439;
 bh=HI8SDRDM0HagvGfY4qbtb+xBQNYruvH094mBjXaQjBM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Up9kvSDE/4vYOuQpimhk039SYbXxqsW5uuQjNMV7+0TXAb30P5CzKXm+KrLpp2FFv
 Ql0AE01Zs5yU2BTF8wdaAf8kZvYr0seMle7QTu/oNUHZkOCDOgDqBYj0gnb6O0kqVe
 Vk/ufgjOILsLybFBwXaGL5aevbvv5ZMxJ3E25KyXHx5s85856E/voczmLHHmx1DGr1
 Lk92acYR7MZKJrtQYDe+Y+4k89MYAyz+rzz2qwlrG1rQx86fFyQ1zmOgl0hb4N45lh
 wv99zgoN3U+aqQYp9aF3RDaBFk/79yy74slcO4xW24i6Fq0ISXAq/onFKl5oRqv5Bi
 loXldgoVIFc+g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id ABE1A6536C; Wed,  3 Mar 2021 21:20:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 210749] sysfs: cannot create duplicate filename
 '/bus/nvmem/devices/module-vpd'
Date: Wed, 03 Mar 2021 21:20:39 +0000
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
Message-ID: <bug-210749-206035-7TreWFBico@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210749-206035@https.bugzilla.kernel.org/>
References: <bug-210749-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210749

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #294193|0                           |1
        is obsolete|                            |
 Attachment #294449|0                           |1
        is obsolete|                            |

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 295619
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D295619&action=3Dedit
dmesg (kernel 5.12-rc1, Talos II)

Same for 5.12-rc1.

[...]
at24 0-0050: probe
at24 0-0050: 65536 byte 24c512 EEPROM, writable, 1 bytes/write
at24 1-0050: probe
sysfs: cannot create duplicate filename '/bus/nvmem/devices/module-vpd'
CPU: 23 PID: 378 Comm: systemd-udevd Not tainted 5.12.0-rc1-TalosII #2
Call Trace:
[c0000000283a6ae0] [c00000000083649c] .dump_stack+0xf8/0x16c (unreliable)
[c0000000283a6b80] [c00000000051e628] .sysfs_warn_dup+0x78/0xb0
[c0000000283a6c10] [c00000000051ec6c]
.sysfs_do_create_link_sd.isra.0+0x13c/0x150
[c0000000283a6cb0] [c000000000912b90] .bus_add_device+0x80/0x190
[c0000000283a6d40] [c00000000090ef18] .device_add+0x438/0xaa0
[c0000000283a6e60] [c0000000009dff90] .nvmem_register+0x2a0/0xc00
[c0000000283a6f50] [c0000000009e093c] .devm_nvmem_register+0x4c/0xb0
[c0000000283a6fe0] [c008000006a4427c] .at24_probe+0x67c/0x8a0 [at24]
[c0000000283a7270] [c0000000009a90f8] .i2c_device_probe+0x158/0x3c0
[c0000000283a7300] [c0000000009144f4] .really_probe+0x134/0x500
[c0000000283a73b0] [c000000000914938] .driver_probe_device+0x78/0x110
[c0000000283a7430] [c000000000914eac] .device_driver_attach+0xbc/0xf0
[c0000000283a74c0] [c000000000914f58] .__driver_attach+0x78/0x140
[c0000000283a7550] [c00000000091139c] .bus_for_each_dev+0x9c/0x120
[c0000000283a7600] [c000000000913bf4] .driver_attach+0x24/0x40
[c0000000283a7670] [c000000000913148] .bus_add_driver+0x1c8/0x2a0
[c0000000283a7710] [c000000000915948] .driver_register+0x88/0x190
[c0000000283a7790] [c0000000009aa2d8] .i2c_register_driver+0x58/0xc0
[c0000000283a7810] [c008000006a445f4] .at24_init+0x5c/0x70 [at24]
[c0000000283a7880] [c0000000000110ac] .do_one_initcall+0x7c/0x480
[c0000000283a7970] [c0000000001f4c3c] .do_init_module+0x6c/0x2f0
[c0000000283a7a00] [c0000000001f7dcc] .load_module+0x2ccc/0x34a0
[c0000000283a7c20] [c0000000001f8818] .__do_sys_finit_module+0xc8/0x120
[c0000000283a7d50] [c000000000037194] .system_call_exception+0x1b4/0x3b0
[c0000000283a7e10] [c00000000000c8dc] system_call_common+0xec/0x278
--- interrupt: c00 at 0x3fffa40f78b4
NIP:  00003fffa40f78b4 LR: 00003fffa42d8b04 CTR: 0000000000000000
REGS: c0000000283a7e80 TRAP: 0c00   Not tainted  (5.12.0-rc1-TalosII)
MSR:  900000000280f032 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI>  CR: 48222242  =
XER:
00000000
IRQMASK: 0=20
 GPR00: 0000000000000161 00003fffd30fb260 00003fffa41d1300 000000000000000f=
=20
 GPR04: 00003fffa42e4630 0000000000000000 000000000000000f 0000000000000000=
=20
 GPR08: 0000000000000002 0000000000000000 0000000000000000 0000000000000000=
=20
 GPR12: 0000000000000000 00003fffa46fc810 0000000000020000 00003fffd30fb738=
=20
 GPR16: 00000000000f4240 0000000000000000 0000000000000000 0000000000000000=
=20
 GPR20: 000000015f2623a0 0000000000000000 00003fffa45e01b8 00003fffa45e0178=
=20
 GPR24: 000000015f23d0e0 00003fffa45e0158 0000000000020000 000000015f1a4150=
=20
 GPR28: 00003fffa42e4630 0000000000020000 0000000000000000 000000015f2623a0=
=20
NIP [00003fffa40f78b4] 0x3fffa40f78b4
LR [00003fffa42d8b04] 0x3fffa42d8b04
--- interrupt: c00
at24: probe of 1-0050 failed with error -17
at24 2-0050: probe
sysfs: cannot create duplicate filename '/bus/nvmem/devices/module-vpd'
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
