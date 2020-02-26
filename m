Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD95316F657
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:10:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S2QV6GGkzDqML
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 15:10:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=+jiy=4o=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S2LS2TNJzDqHK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 15:06:55 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206669] Little-endian kernel crashing on POWER8 on heavy
 big-endian PowerKVM load
Date: Wed, 26 Feb 2020 04:06:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: npiggin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206669-206035-63oBamDCCK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206669-206035@https.bugzilla.kernel.org/>
References: <bug-206669-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206669

--- Comment #1 from npiggin@gmail.com ---
bugzilla-daemon@bugzilla.kernel.org's on February 26, 2020 1:26 am:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D206669
>=20
>             Bug ID: 206669
>            Summary: Little-endian kernel crashing on POWER8 on heavy
>                     big-endian PowerKVM load
>            Product: Platform Specific/Hardware
>            Version: 2.5
>     Kernel Version: 5.4.x
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: PPC-64
>           Assignee: platform_ppc-64@kernel-bugs.osdl.org
>           Reporter: glaubitz@physik.fu-berlin.de
>                 CC: matorola@gmail.com
>         Regression: No
>=20
> Created attachment 287605
>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D287605&action=3Dedit
> Backtrace of host system crashing with little-endian kernel
>=20
> We have an IBM POWER server (8247-42L) running Linux kernel 5.4.13 on Deb=
ian
> unstable hosting a big-endian ppc64 virtual machine running the same kern=
el
> in
> big-endian mode.
>=20
> When building OpenJDK-11 on the big-endian VM, the testsuite crashes the
> *host*
> system which is little-endian with the following kernel backtrace. The
> problem
> reproduces both with kernel 4.19.98 as well as 5.4.13, both guest and host
> running 5.4.x.
>=20
> Backtrace attached.

Thanks for the report, we need to get more data about the first BUG if=20
we can. What function in your vmlinux contains address=20
0xc00000000017a778? (use nm or objdump etc) Is that the first message you g=
et,
No warnings or anything else earlier in the dmesg?

Also 0xc0000000002659a0 would be interesting.

When reproducing, do you ever get a clean trace of the first bug? Could
you try setting /proc/sys/kernel/panic_on_oops and reproducing?

Thanks,
Nick

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
