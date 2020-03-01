Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC70174F40
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 20:47:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Vv2H1mDkzDqvT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 06:47:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=vxuw=4s=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Vv0R3nc1zDqv1
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 06:46:14 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 199471] [Bisected][Regression] windfarm_pm* no longer gets
 automatically loaded when CONFIG_I2C_POWERMAC=y is set
Date: Sun, 01 Mar 2020 19:46:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199471-206035-zBUmo8uSE3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199471-206035@https.bugzilla.kernel.org/>
References: <bug-199471-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D199471

--- Comment #11 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Wolfram Sang from comment #8)
> "This has been quite nice since 4.?.x up to 4.16.x as you only need
> CONFIG_I2C_POWERMAC=3Dy which selects the proper windfarm_pmXX at boot ti=
me."
>=20
> I can't find that in the code. Are you sure i2c-powermac requested that
> module?
I guess so 'cause if I build i2c_powermac as a module and manually modprobe=
 it,
all the relevant windfarm modules get pulled in. But not before.

 # modprobe -v i2c_powermac
insmod
/lib/modules/4.16.18-PowerMacG5+/kernel/drivers/i2c/busses/i2c-powermac.ko=
=20
 # dmesg | tail
[  150.181478]  11
[  150.182851]  0
[  150.184220]  0

[  150.626685] windfarm: Backside control loop started.
[  150.690132] windfarm: Slots control loop started.
[  150.794843] i2c i2c-0: master_xfer[0] W, addr=3D0x50, len=3D1
[  150.796467] i2c i2c-0: master_xfer[1] R, addr=3D0x50, len=3D8
[  150.801851] i2c i2c-0: NAK from device addr 0x50 msg #0
[  150.807758] windfarm: Drive bay control loop started.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
