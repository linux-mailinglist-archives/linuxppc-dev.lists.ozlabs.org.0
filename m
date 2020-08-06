Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F4523E002
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 19:58:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMx7B6g7WzDqSl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 03:58:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=ac95=bq=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMx4q25JlzDqRJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 03:56:27 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 207359] MegaRAID SAS 9361 controller hang/reset
Date: Thu, 06 Aug 2020 17:56:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cam@neo-zeon.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207359-206035-ByFbM86V88@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207359-206035@https.bugzilla.kernel.org/>
References: <bug-207359-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D207359

--- Comment #4 from Cameron (cam@neo-zeon.de) ---
I converted the box's filesystems from BTRFS to XFS, and switched the page =
size
from 4k to 64k. The problem appears to be entirely gone now. I am able to
conclusively run 5.7.13 without issue, which I verified as having the
megaraid_sas controller hang problem while still running my previous BTRFS+=
4k
page configuration.

Unfortunately, it took a great deal of time to perform this conversion, and=
 I
wasn't able to keep the box down even longer to test if converting to XFS a=
nd
64k pages individually resolved the issue. All I can say for certain is that
either switching to XFS, to a 64k page size, or both has fixed the problem =
for
me.

The backup volume is a single SATA disk that is still using BTRFS (for
snapshotting), and is not giving me any trouble. But if this has any relati=
on
to https://bugzilla.kernel.org/show_bug.cgi?id=3D206123, then this may not =
be
conclusive due to being that SATA disks potentially may not trigger the iss=
ue.
The single disk also can't push as much IO as the RAID10 volume so that may=
 be
another reason.

My quasi educated non-kernel-dev guess is that this is probably a bug relat=
ing
to the 4k page size. Whether or not the regular behavior of BTRFS exacerbat=
es
this (making it easier to reproduce), is possible, but unknown.

Hopefully someone else encountering this issue will find this helpful.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
