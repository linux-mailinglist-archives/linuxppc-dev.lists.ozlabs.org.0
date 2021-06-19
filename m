Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 892363AD847
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 08:49:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6RHR1P71z3c1S
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 16:49:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ovUj66TU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ovUj66TU; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6RGw6nl6z2yX9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 16:49:28 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id E7387606A5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624085365;
 bh=vWZGvewEaA6F5/0bPHT1v9kJ+3TVA4GDlMaBk6euAX8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ovUj66TUbPe/d98U0FjQShQiWoGP9+yGo4yoPhC/KkwKzoIotOep14FVkl0zxOzbO
 7eOk+XLon5UMkY/7a2lWAwY0eKbJHtr7wV1xD0CcqJ779qS9UQI8xrOpEzy7XUbCdt
 COFP4yq0Blgdp20S5ZMGFIgNYUYBj6u2Z7s4vT3H+JMQdJmMUu1maeva11FcmmN2kZ
 Zf2lXBaW3seYfM9NdcEoaZmH+CUXJKLK3ZDF7iCgsPiNX0P2F5PqA3b/ppjKb1viiQ
 Hga5j1+RIHKeoj0lLnm4VG5Iw5j2SpmxgZRyrAM5LdxucLVnFFseFzPsmBbJWgLomS
 tCeKcSp5BwPUw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CEA83611AB; Sat, 19 Jun 2021 06:49:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 11143] [PATCH]unconditional linker option
 arch/powerpc/lib/crtsavres.o causes external module buildfailure
Date: Sat, 19 Jun 2021 06:49:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-11143-206035-lG1zt3GgZN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-11143-206035@https.bugzilla.kernel.org/>
References: <bug-11143-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D11143

Christophe Leroy (christophe.leroy@csgroup.eu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |christophe.leroy@csgroup.eu

--- Comment #19 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
Seems like commit efe0160cfd40a99c052a00e174787c1f4158a9cd removes it for
binutils >=3D 2.25

Can you check it works for you now ?

I so, maybe the simplest solution is to wait until binutils minimum version=
 is
at least 2.25. For the time being the minimum is 2.23

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
