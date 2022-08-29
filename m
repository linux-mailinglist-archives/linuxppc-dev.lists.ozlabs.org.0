Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1805F5A5700
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:20:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGlHT0Stlz3c4B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:20:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UWVvJkuB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UWVvJkuB;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGlGp74TFz30Qc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 08:19:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 58B5A611B5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 22:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAF0CC433D6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 22:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661811566;
	bh=3LkTvpLmKH1sqKx4wVa8jT3avlY3NcEdjNBwd24dWTY=;
	h=From:To:Subject:Date:From;
	b=UWVvJkuBoTspsuO4AR6kU437ViYY7OxKUYepbvj5+4cfSqX57UUYWwRrj0pE5qVdc
	 3yljRz82G7XvYtvEAkuk42V93x0Yn2RfoHSQXRZ0OAUvJMrXw1J72eL64byhF+eRAY
	 UmRxHF6iG7KJ5Xn5p8TMh6JHUoPPy1SQ6SOfN2X4rxF1l/HLjNQEZ2eeg8fcHjvujL
	 VnxNwMhdYpWoAgpwG5pE8JRdQR+3PmngoVXc1OW/Yq0TIjBojN8w5oVpBHpqUwkNXX
	 i5MjR56iowzUfjZsA2PRTjWGkl1LZQxaiCZXbVrUNv9WFfP5Io37aDCzO37BYB12IU
	 sEZ0GW8uwBicw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9B47BC433E4; Mon, 29 Aug 2022 22:19:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216427] New: OF fails to handle some PCI resources on a
 PowerMac G4 3,6 (e.g. OF: /pci@f2000000/mac-io@17/gpio@50/gpio5@6f: could not
 find phandle 1751474532)
Date: Mon, 29 Aug 2022 22:19:26 +0000
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
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-216427-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216427

            Bug ID: 216427
           Summary: OF fails to handle some PCI resources on a PowerMac G4
                    3,6 (e.g. OF:
                    /pci@f2000000/mac-io@17/gpio@50/gpio5@6f: could not
                    find phandle 1751474532)
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 6.0-rc3
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
                CC: bugzilla.kernel.org@frowand.com, wsa@kernel.org
        Regression: No

Created attachment 301698
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301698&action=3Dedit
dmesg (kernel 6.0-rc3, PowerMac G4 DP)

This pops up in dmesg on my G4 DP. Perhaps an OF or DT issue?

[...]
Duplicate name in PowerPC,G4@0, renamed to "l2-cache#1"
Duplicate name in l2-cache#1, renamed to "l2-cache#1"
Duplicate name in PowerPC,G4@1, renamed to "l2-cache#1"
Duplicate name in l2-cache#1, renamed to "l2-cache#1"
Duplicate name in gpio@50, renamed to "gpio5@6f#1"
Duplicate name in gpio@50, renamed to "gpio6@70#1"
Duplicate name in gpio@50, renamed to "gpio11@75#1"
Duplicate name in gpio@50, renamed to "extint-gpio15@67#1"
[...]
OF: /pci@f2000000/mac-io@17/gpio@50/gpio5@6f: could not find phandle 175147=
4532
OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio15@67: could not find phandle
1751474532
OF: /pci@f2000000/mac-io@17/gpio@50/gpio6@70: could not find phandle 163456=
2093
OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio16@68: could not find phandle
1936745825
OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio14@66: could not find phandle
1818848869
OF: /pci@f2000000/mac-io@17/gpio@50/gpio12@76: could not find phandle
1835103092
OF: /pci@f2000000/mac-io@17/gpio@50/gpio11@75: could not find phandle
1635083369
OF: /pci@f2000000/mac-io@17/gpio@50/gpio5@6f: could not find phandle 175147=
4532
OF: /pci@f2000000/mac-io@17/gpio@50/gpio6@70: could not find phandle 163456=
2093
OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio4@5c: could not find phandle
1818848869
OF: /pci@f2000000/mac-io@17/gpio@50/gpio11@75: could not find phandle
1635083369
OF: /pci@f2000000/mac-io@17/gpio@50/extint-gpio15@67: could not find phandle
1751474532
[...]

Apart from that the machine seems to run fine. More details in the attached
dmesg.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
