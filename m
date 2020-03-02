Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF33175E59
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 16:41:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WPW552hCzDqbG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 02:41:05 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WPTB4X9tzDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 02:39:26 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 199471] [Bisected][Regression] windfarm_pm* no longer gets
 automatically loaded when CONFIG_I2C_POWERMAC=y is set
Date: Mon, 02 Mar 2020 15:39:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199471-206035-CCXJtm2rGj@https.bugzilla.kernel.org/>
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

--- Comment #17 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Wolfram Sang from comment #16)
> Created attachment 287755 [details]
> proof-of-concept patch for testing
>=20
> Here is the promised patch. I converted all I2C MODULE tables. pm72 didn't
> have one, so we will see what pulls it in.
>=20
> A test with a machine needing the lm75 driver would be great. Because some
> code change was needed there.
Excellent! Applied your patch on 5.6-rc4 and it just works fine on my G5 11=
,2!
I can leave CONFIG_WINDFARM=3Dm and the correct modules get pulled in just =
as it
was before kernel 4.17.

I can't test on the G5 7,3 from my original bug report 'cause I sold this o=
ne.
But from my understanding this "lm75" sensor is used in pretty any windfarm=
_pm*
module?
 # grep -i lm75 drivers/macintosh/windfarm_pm*.c
drivers/macintosh/windfarm_pm112.c:     request_module("windfarm_lm75_senso=
r");
drivers/macintosh/windfarm_pm121.c:=20=20=20=20=20=20=20=20=20=20=20=20
request_module("windfarm_lm75_sensor");
drivers/macintosh/windfarm_pm72.c:      request_module("windfarm_lm75_senso=
r");
drivers/macintosh/windfarm_pm81.c:=20=20=20=20=20=20=20=20=20=20=20=20=20
request_module("windfarm_lm75_sensor");
drivers/macintosh/windfarm_pm91.c:=20=20=20=20=20=20=20=20=20=20=20=20=20
request_module("windfarm_lm75_sensor");

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
