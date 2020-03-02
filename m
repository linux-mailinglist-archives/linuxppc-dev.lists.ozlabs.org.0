Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 203A9176067
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 17:52:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WR576xslzDqbB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 03:52:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=dop8=4t=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WR3L0KzkzDqBj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 03:50:37 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206733] New: i2c i2c-3: i2c-powermac: modalias failure on
 /uni-n@f8000000/i2c@f8001000/cereal@1c0
Date: Mon, 02 Mar 2020 16:50:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206733-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206733

            Bug ID: 206733
           Summary: i2c i2c-3: i2c-powermac: modalias failure on
                    /uni-n@f8000000/i2c@f8001000/cereal@1c0
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.6-rc4
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 287759
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D287759&action=3Dedit
dmesg (5.6-rc4, PowerMac G4 DP)

The G4 MDD/DP can't quite pick up this device, despite it shows up in the
bootlog earlier.

[...]
M=C3=A4r 02 17:23:45 T600 kernel: i2c-dev: adapter [uni-n 1] registered as =
minor 3
M=C3=A4r 02 17:23:45 T600 kernel: i2c i2c-3: adapter [uni-n 1] registered
M=C3=A4r 02 17:23:45 T600 kernel: PowerMac i2c bus uni-n 1 registered
M=C3=A4r 02 17:23:45 T600 kernel: i2c i2c-3: i2c-powermac: register
/uni-n@f8000000/i2c@f8001000/cereal@1c0
M=C3=A4r 02 17:23:45 T600 kernel: i2c i2c-3: i2c-powermac: modalias failure=
 on
/uni-n@f8000000/i2c@f8001000/cereal@1c0
M=C3=A4r 02 17:23:45 T600 kernel: i2c-dev: adapter [uni-n 0] registered as =
minor 4
[...]

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
