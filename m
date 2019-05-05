Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7E313C73
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2019 02:56:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44xSB30CxDzDqMf
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2019 10:56:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bugzilla.kernel.org
 (client-ip=198.145.29.98; helo=mail.wl.linuxfoundation.org;
 envelope-from=bugzilla-daemon@bugzilla.kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44xR3F0s2TzDqLZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 May 2019 10:05:44 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 524EB287EA
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 May 2019 00:05:41 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 4657A2882A; Sun,  5 May 2019 00:05:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 203515] New: [crypto] alg: skcipher: p8_aes_ctr encryption test
 failed (wrong result) on test vector 3, cfg="uneven misaligned splits,
 may sleep"
Date: Sun, 05 May 2019 00:05:40 +0000
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
Message-ID: <bug-203515-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sun, 05 May 2019 10:55:26 +1000
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203515

            Bug ID: 203515
           Summary: [crypto] alg: skcipher: p8_aes_ctr encryption test
                    failed (wrong result) on test vector 3, cfg=3D"uneven
                    misaligned splits, may sleep"
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.1.0-rc7
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: Yes

Created attachment 282609
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D282609&action=3Dedit
dmesg (5.1.0-rc7, Talos II)

Seems like some POWER8/9 specific encrytion test fails in 5.1.0-rc7. This d=
id
not happen in 5.0.x and before.

[...]
[    5.246612] crypto_register_alg 'cbc(aes)' =3D 0
[    5.254268] alg: skcipher: p8_aes_ctr encryption test failed (wrong resu=
lt)
on test vector 3, cfg=3D"uneven misaligned splits, may sleep"
[    5.255266] xhci_hcd 0003:01:00.0: xHCI Host Controller
[    5.255346] xhci_hcd 0003:01:00.0: new USB bus registered, assigned bus
number 1
[    5.255522] xhci_hcd 0003:01:00.0: hcc params 0x0270f06d hci version 0x96
quirks 0x0000000004000000
[    5.256008] crypto_register_alg 'ctr(aes)' =3D 0
[...]

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
