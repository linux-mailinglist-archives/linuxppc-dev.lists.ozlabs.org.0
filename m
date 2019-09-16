Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE38B3BB8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 15:46:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46X6vp3Yy3zF4qy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 23:45:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=vryo=xl=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46X6mt2xnrzF4Mr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 23:39:56 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204819] KASAN still got problems loading some modules at boot
Date: Mon, 16 Sep 2019 13:39:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-204819-206035-kZuZwRCjVq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204819-206035@https.bugzilla.kernel.org/>
References: <bug-204819-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204819

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #25 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Christophe Leroy from comment #24)
> Do you confirm that the two patches done in the scope of bug #204479 are
> included in your config, especially the first one:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/
> arch/powerpc/mm/kasan/kasan_init_32.
> c?id=3D663c0c9496a69f80011205ba3194049bcafd681d
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/
> arch/powerpc/mm/kasan/kasan_init_32.
> c?id=3D45ff3c55958542c3b76075d59741297b8cb31cbb
Ahh, now we are getting closer...

No, I did the testing with a vanilla 5.3-rc8 kernel assuming that

powerpc/kasan: Fix shadow area set up for modules
powerpc/kasan: Fix parallel loading of modules

were already in 5.3-rc8. Now I realize I was wrong.

In -rc8 the latest one (2019-07-31) is:

powerpc/kasan: fix early boot failure on PPC32

The other two patches are dated 2019-08-20 and not in 5.3-rc8 or the newly
released 5.3.

Sorry for the noise! I will close the bug for now and retest as soon as the=
 2
patches are in 5.4-rcx or 5.3.x. If it still seems valid that time I will
re-open.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
