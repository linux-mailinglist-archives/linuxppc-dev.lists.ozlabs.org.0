Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FE416FC3E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 11:30:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SBrl4dHBzDqX3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 21:30:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SBpk14k6zDqHL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 21:28:29 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206669] Little-endian kernel crashing on POWER8 on heavy
 big-endian PowerKVM load
Date: Wed, 26 Feb 2020 10:28:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: glaubitz@physik.fu-berlin.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206669-206035-ZVCbFl0u4b@https.bugzilla.kernel.org/>
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

--- Comment #4 from John Paul Adrian Glaubitz (glaubitz@physik.fu-berlin.de=
) ---
(In reply to npiggin from comment #3)
> Do you have tracing / ftrace enabled in the host kernel for any
> reason? Turning that off might let the oops message get printed.

Seems that this is the case in the Debian kernel, yes:

root@watson:~# grep -i ftrace /boot/config-5.4.0-0.bpo.3-powerpc64le=20
CONFIG_KPROBES_ON_FTRACE=3Dy
CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
CONFIG_FTRACE=3Dy
CONFIG_FTRACE_SYSCALLS=3Dy
CONFIG_DYNAMIC_FTRACE=3Dy
CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
CONFIG_FTRACE_MCOUNT_RECORD=3Dy
# CONFIG_FTRACE_STARTUP_TEST is not set
root@watson:~#

Do you have the kernel command option at hand which disables ftrace on the
command line? Is it just ftrace=3Doff?

> > FWIW, the kernel image comes from this Debian package:
> >=20
> >>
> >>
> >>
> http://snapshot.debian.org/archive/debian/20200211T210433Z/pool/main/l/li=
nux/linux-image-5.4.0-0.bpo.3-powerpc64le_5.4.13-1%7Ebpo10%2B1_ppc64el.deb
>=20
> Okay. Any chance you could test an upstream kernel?=20

Sure, absolutely. Any preference on the version number?

> Don't bother testing that after the above -- panic_on_oops happens
> after oops_begin(), so it won't help unfortunately.

Okay.

> Attmepting to get into xmon might though, if you boot with xmon=3Don.
> Try that if tracing wasn't enabled, or disabling it doesn't help.

Okay. I will try to disable ftrace first, then retrigger the crash.

> >=20
> > Anything to be considered for the kernel running inside the big-endian =
VM?
> >=20
>=20
> Not that I'm aware of really. Certainly it shouldn't be able to crash
> the host even if the guest was doing something stupid.

I agree.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
