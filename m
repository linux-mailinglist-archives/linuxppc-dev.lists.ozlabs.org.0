Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 138E02DD129
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 13:16:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxWDp5LFpzDqTy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 23:16:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxW9436yszDqTl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 23:12:56 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 210749] New: sysfs: cannot create duplicate filename
 '/bus/nvmem/devices/module-vpd'
Date: Thu, 17 Dec 2020 12:12:53 +0000
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
Message-ID: <bug-210749-206035@https.bugzilla.kernel.org/>
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

            Bug ID: 210749
           Summary: sysfs: cannot create duplicate filename
                    '/bus/nvmem/devices/module-vpd'
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.10.1
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

Created attachment 294193
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D294193&action=3Dedit
dmesg (kernel 5.10.1, Talos II)

[...]
sysfs: cannot create duplicate filename '/bus/nvmem/devices/module-vpd'
CPU: 4 PID: 349 Comm: systemd-udevd Not tainted 5.10.1-gentoo-TalosII #1
Call Trace:
[c00000001b93eb70] [c0000000007ea2c8] .dump_stack+0xe4/0x13c (unreliable)
[c00000001b93ec10] [c0000000004d63a8] .sysfs_warn_dup+0x78/0xb0
[c00000001b93eca0] [c0000000004d69ec]
.sysfs_do_create_link_sd.isra.0+0x13c/0x150
[c00000001b93ed40] [c0000000008be3a0] .bus_add_device+0x80/0x190
[c00000001b93edd0] [c0000000008b8f2c] .device_add+0x41c/0x990
[c00000001b93eea0] [c000000000952f28] .nvmem_register+0x1f8/0xae0
[c00000001b93ef90] [c00000000095385c] .devm_nvmem_register+0x4c/0xb0
[c00000001b93f020] [c008000006de8c7c] .at24_probe+0x67c/0x8a0 [at24]
[c00000001b93f2a0] [c00000000091cfa8] .i2c_device_probe+0x158/0x3c0
[c00000001b93f330] [c0000000008bfd04] .really_probe+0x134/0x500
[c00000001b93f3e0] [c0000000008c02f8] .driver_probe_device+0x78/0x110
[c00000001b93f460] [c0000000008c06bc] .device_driver_attach+0xbc/0xf0
[c00000001b93f4f0] [c0000000008c0768] .__driver_attach+0x78/0x140
[c00000001b93f580] [c0000000008bcbac] .bus_for_each_dev+0x9c/0x120
[c00000001b93f630] [c0000000008bf404] .driver_attach+0x24/0x40
[c00000001b93f6a0] [c0000000008be958] .bus_add_driver+0x1c8/0x2a0
[c00000001b93f740] [c0000000008c1158] .driver_register+0x88/0x190
[c00000001b93f7c0] [c00000000091e068] .i2c_register_driver+0x58/0xc0
[c00000001b93f840] [c008000006de8ff4] .at24_init+0x5c/0x70 [at24]
[c00000001b93f8b0] [c00000000001135c] .do_one_initcall+0x7c/0x490
[c00000001b93f9a0] [c0000000001d1fac] .do_init_module+0x6c/0x2e0
[c00000001b93fa30] [c0000000001d50e0] .load_module+0x2c80/0x3450
[c00000001b93fc40] [c0000000001d5b28] .__do_sys_finit_module+0xc8/0x120
[c00000001b93fd70] [c000000000037ab0] .system_call_exception+0x160/0x2b0
[c00000001b93fe20] [c00000000000cbe0] system_call_common+0xf0/0x27c
at24: probe of 1-0050 failed with error -17
at24 2-0050: probe
sysfs: cannot create duplicate filename '/bus/nvmem/devices/module-vpd'
CPU: 4 PID: 349 Comm: systemd-udevd Not tainted 5.10.1-gentoo-TalosII #1
Call Trace:
[c00000001b93eb70] [c0000000007ea2c8] .dump_stack+0xe4/0x13c (unreliable)
[c00000001b93ec10] [c0000000004d63a8] .sysfs_warn_dup+0x78/0xb0
[c00000001b93eca0] [c0000000004d69ec]
.sysfs_do_create_link_sd.isra.0+0x13c/0x150
[c00000001b93ed40] [c0000000008be3a0] .bus_add_device+0x80/0x190
[c00000001b93edd0] [c0000000008b8f2c] .device_add+0x41c/0x990
[c00000001b93eea0] [c000000000952f28] .nvmem_register+0x1f8/0xae0
[c00000001b93ef90] [c00000000095385c] .devm_nvmem_register+0x4c/0xb0
[c00000001b93f020] [c008000006de8c7c] .at24_probe+0x67c/0x8a0 [at24]
[c00000001b93f2a0] [c00000000091cfa8] .i2c_device_probe+0x158/0x3c0
[c00000001b93f330] [c0000000008bfd04] .really_probe+0x134/0x500
[c00000001b93f3e0] [c0000000008c02f8] .driver_probe_device+0x78/0x110
[c00000001b93f460] [c0000000008c06bc] .device_driver_attach+0xbc/0xf0
[c00000001b93f4f0] [c0000000008c0768] .__driver_attach+0x78/0x140
[c00000001b93f580] [c0000000008bcbac] .bus_for_each_dev+0x9c/0x120
[c00000001b93f630] [c0000000008bf404] .driver_attach+0x24/0x40
[c00000001b93f6a0] [c0000000008be958] .bus_add_driver+0x1c8/0x2a0
[c00000001b93f740] [c0000000008c1158] .driver_register+0x88/0x190
[c00000001b93f7c0] [c00000000091e068] .i2c_register_driver+0x58/0xc0
[c00000001b93f840] [c008000006de8ff4] .at24_init+0x5c/0x70 [at24]
[c00000001b93f8b0] [c00000000001135c] .do_one_initcall+0x7c/0x490
[c00000001b93f9a0] [c0000000001d1fac] .do_init_module+0x6c/0x2e0
[c00000001b93fa30] [c0000000001d50e0] .load_module+0x2c80/0x3450
[c00000001b93fc40] [c0000000001d5b28] .__do_sys_finit_module+0xc8/0x120
[c00000001b93fd70] [c000000000037ab0] .system_call_exception+0x160/0x2b0
[c00000001b93fe20] [c00000000000cbe0] system_call_common+0xf0/0x27c
at24: probe of 2-0050 failed with error -17
at24 3-0050: probe
[...]

 # inxi -b --no-host
System:    Kernel: 5.10.1-gentoo-TalosII ppc64 bits: 64 Console: tty 1=20
           Distro: Gentoo Base System release 2.7=20
Machine:   Type: PowerPC Device System: T2P9D01 REV 1.01 details: PowerNV
T2P9D01 REV 1.01=20
           rev: 2.2 (pvr 004e 1202)=20
CPU:       Info: 32-Core POWER9 altivec supported [MCP] speed: 2170 MHz
min/max: 2154/3800 MHz=20
Graphics:  Device-1: AMD Turks XT [Radeon HD 6670/7670] driver: radeon v:
kernel=20
           Device-2: ASPEED Graphics Family driver: N/A=20
           Display: server: X.org 1.20.10 driver: ati,radeon unloaded:
fbdev,modesetting tty: 104x53=20
           Message: Advanced graphics data unavailable in console for root.=
=20
Network:   Device-1: Broadcom and subsidiaries NetXtreme BCM5719 Gigabit
Ethernet PCIe driver: tg3=20
           Device-2: Broadcom and subsidiaries NetXtreme BCM5719 Gigabit
Ethernet PCIe driver: tg3=20
Drives:    Local Storage: total: 447.13 GiB used: 16.64 GiB (3.7%)=20
Info:      Processes: 445 Uptime: 11m Memory: 62.75 GiB used: 1.89 GiB (3.0=
%)
Init: systemd=20
           runlevel: 5 Shell: Bash inxi: 3.1.06

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
