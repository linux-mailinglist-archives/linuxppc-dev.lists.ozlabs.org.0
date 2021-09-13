Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D962E408822
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 11:25:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7Lfn5pR6z2ykR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 19:25:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pWJtdro9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pWJtdro9; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7Lf42k5gz2xrp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 19:24:28 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 324F760FDA
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 09:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631525066;
 bh=fw/9dCOaUHRe8sMnhYcqfCO0S/pV8KWC4DmzZexuJ80=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pWJtdro9uM7F2SO9g1o7jiT1XJaHy0Z4xSTrkWVwCGijQJpopre6kA+exhxivpmGC
 Nrvr85gpf+ARZQDRPZ7Qov5C3swU9yKB5bZfALyrf8c2qwhBvyWAlpZfvpbMvK1gDG
 OwoKasSDoQLeWzE8gM+vvsxDUOkoSiGzEelyUJoXTXgFdkGZFGMOuQnjoMV4QurPO+
 hbLAqle/Ury0lb0hGHujYg9Y3kUuzJQ8REGRyjAhvNWw/ZtXKISIZy4QUGKCNe2Tqd
 /F70s8G3mETfLeJqX/ak1pxVBPzmxUTnhhcuk16JBOfrxD15QzDTI5Fp0bbCps5Rch
 avrnH2vLy7xzw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2837460F59; Mon, 13 Sep 2021 09:24:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206669] Little-endian kernel crashing on POWER8 on heavy
 big-endian PowerKVM load
Date: Mon, 13 Sep 2021 09:24:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: glaubitz@physik.fu-berlin.de
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206669-206035-BxC4KK75AL@https.bugzilla.kernel.org/>
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

--- Comment #16 from John Paul Adrian Glaubitz (glaubitz@physik.fu-berlin.d=
e) ---
Hi Michael!

Thanks a lot for looking into this!

If you have installed a Debian unstable big-endian system, the easiest way =
to
get such a setup by creating an sbuild chroot. You should set up an sbuild
chroot for both powerpc and ppc64:

$ sbuild-createchroot --arch=3Dpowerpc
$ sbuild-createchroot --arch=3Dppc64

and then build the glibc package using sbuild for both powerpc and ppc64 in
parallel which is what makes the VM and the host crash during the testsuite:

$ dget -u https://deb.debian.org/debian/pool/main/g/glibc/glibc_2.32-2.dsc

In one shell:

$ sbuild -d sid --arch=3Dppc64 --no-arch-all glibc_2.32-2.dsc

and in a second one:

$ sbuild -d sid --arch=3Dpowerpc --no-arch-all glibc_2.32-2.dsc

If glibc doesn't trigger the crash, try gcc-10 or llvm-toolchain-13:

$ dget -u
https://deb.debian.org/debian/pool/main/l/llvm-toolchain-13/llvm-toolchain-=
13_13.0.0~+rc2-3.dsc
$ dget -u https://deb.debian.org/debian/pool/main/g/gcc-11/gcc-11_11.2.0-5.=
dsc

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
