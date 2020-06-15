Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 818211FA328
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 00:04:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m5363ZCdzDqjd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 08:04:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=roh1=74=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m51G1N5ZzDqYn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 08:02:57 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 208197] New: OF: /pci@f2000000/mac-io@17/gpio@50/...: could not
 find phandle
Date: Mon, 15 Jun 2020 22:02:55 +0000
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
Message-ID: <bug-208197-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D208197

            Bug ID: 208197
           Summary: OF: /pci@f2000000/mac-io@17/gpio@50/...: could not
                    find phandle
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.8-rc1
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: Yes

Created attachment 289685
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D289685&action=3Dedit
dmesg (5.8-rc1, PowerMac G4 DP)

Since 5.8-rc1 I get these OF errors on my PowerMac G4 DP:

[...]
T600 kernel: OF: /pci@f2000000/mac-io@17/gpio@50/gpio5@6f: could not find
phandle
T600 kernel: OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio15@67: could not
find phandle
T600 kernel: OF: /pci@f2000000/mac-io@17/gpio@50/gpio6@70: could not find
phandle
T600 kernel: OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio16@68: could not
find phandle
T600 kernel: OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio14@66: could not
find phandle
T600 kernel: OF: /pci@f2000000/mac-io@17/gpio@50/gpio12@76: could not find
phandle
T600 kernel: OF: /pci@f2000000/mac-io@17/gpio@50/gpio11@75: could not find
phandle
T600 kernel: OF: /pci@f2000000/mac-io@17/gpio@50/gpio5@6f: could not find
phandle
T600 kernel: OF: /pci@f2000000/mac-io@17/gpio@50/gpio6@70: could not find
phandle
T600 kernel: OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio4@5c: could not
find phandle
T600 kernel: OF: /pci@f2000000/mac-io@17/gpio@50/gpio11@75: could not find
phandle
T600 kernel: OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio15@67: could not
find phandle[...]

This has not been the case in kernel 5.7 or earlier.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
