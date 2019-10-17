Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67545DB9E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 00:51:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vPXV6ybMzDqPC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2019 09:51:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=z8ee=yk=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vPV72WdyzDqgL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2019 09:49:03 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 201723] THERM_WINDTUNNEL not working any longer in kernel
 4.19.x (PowerMac G4 MDD)
Date: Thu, 17 Oct 2019 22:49:00 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-201723-206035-Uz3QyqaxJB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201723-206035@https.bugzilla.kernel.org/>
References: <bug-201723-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201723

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 285535
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D285535&action=3Dedit
bisect.log

Final bisect commit.

It's not a bug, it's a feature. :(

# git bisect bad | tee -a ~/bisect.log
3e7bed52719de4b5b5fb900869e293eae0bc3f3e is the first bad commit
commit 3e7bed52719de4b5b5fb900869e293eae0bc3f3e
Author: Wolfram Sang <wsa@the-dreams.de>
Date:   Tue Aug 21 17:02:39 2018 +0200

    macintosh: therm_windtunnel: drop using attach_adapter

    As we now have deferred probing, we can use a custom mechanism and
    finally get rid of the legacy interface from the i2c core.

    Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
    Acked-by: Michael Ellerman <mpe@ellerman.id.au>

:040000 040000 04029fe24bce33dd0b815fa961cfa847a2abce77
2dc14e16e628b7e2fa4b65bfd6544c9c5e165a9a M      drivers

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
