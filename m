Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8120E12E01A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2020 19:34:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47p0FM3dJBzDqBZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2020 05:34:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=qmmd=2w=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47p0Bh4jFzzDq5n
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jan 2020 05:32:12 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206049] New: alg: skcipher: p8_aes_xts encryption unexpectedly
 succeeded on test vector "random: len=0 klen=64"; expected_error=-22,
 cfg="random: inplace may_sleep use_finup src_divs=[<flush>66.99%@+10,
 33.1%@alignmask+1155]
Date: Wed, 01 Jan 2020 18:32:09 +0000
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
Message-ID: <bug-206049-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206049

            Bug ID: 206049
           Summary: alg: skcipher: p8_aes_xts encryption unexpectedly
                    succeeded on test vector "random: len=3D0 klen=3D64";
                    expected_error=3D-22, cfg=3D"random: inplace may_sleep
                    use_finup src_divs=3D[<flush>66.99%@+10,
                    33.1%@alignmask+1155]
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.4.7
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

Created attachment 286557
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D286557&action=3Dedit
dmesg (5.4.7, Talos II)

# dmesg | grep -i aes
[    5.589319] alg: skcipher: p8_aes_xts encryption unexpectedly succeeded =
on
test vector "random: len=3D0 klen=3D64"; expected_error=3D-22, cfg=3D"rando=
m: inplace
may_sleep use_finup src_divs=3D[<flush>66.99%@+10, 33.1%@alignmask+1155]"

# inxi -b
System:    Kernel: 5.4.7-gentoo ppc64 bits: 64 Console: tty 1 Distro: Gentoo
Base System release 2.6=20
Machine:   Type: PowerPC Device System: T2P9D01 REV 1.01 details: PowerNV
T2P9D01 REV 1.01 rev: 2.2 (pvr 004e 1202)=20
CPU:       32-Core: POWER9 altivec supported type: MCP speed: 2785 MHz min/=
max:
2154/3800 MHz=20
Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] Caicos [Radeon HD
6450/7450/8450 / R5 230 OEM] driver: radeon v: kernel=20
           Device-2: ASPEED Graphics Family driver: N/A=20
           Device-3: NVIDIA GK208B [GeForce GT 710] driver: N/A=20
           Display: server: X.org 1.20.5 driver: radeon tty: 211x53=20
           Message: Advanced graphics data unavailable in console for root.=
=20
Network:   Device-1: Broadcom and subsidiaries NetXtreme BCM5719 Gigabit
Ethernet PCIe driver: tg3=20
           Device-2: Broadcom and subsidiaries NetXtreme BCM5719 Gigabit
Ethernet PCIe driver: tg3

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
