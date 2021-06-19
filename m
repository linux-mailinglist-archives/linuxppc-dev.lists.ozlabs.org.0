Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A75A3AD828
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 08:38:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6R1m0Ctgz3c95
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 16:38:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qwVnDGY3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qwVnDGY3; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6R1J2mGWz306W
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 16:37:40 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4C41761001
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 06:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624084657;
 bh=NOzl06nwf7B24MhoK/F/O0eTk7tHkaVIRCIYkMFbcAU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qwVnDGY3YsRPZCpmotzujE7sjd9TnwapZIYNGYazQDnCaSq8Go4GX55croJb5rmQD
 LxjNwsnBM+b28YJWmUN8qnmkT5TfopfV450bjXnpL4HPd3E7R/pzprs7Gx1jGA/bu+
 t8tQiqgWqumJoPqYlf7rN+DqtRglMeWEtyRKmZgnJAxrXDF2roC5xp27Vp1yB0FX+4
 VcPudMqdbvPEuMdbXbHNU++ccFmZcLSYxaO1WPi/P49wyUfkOsx6JDkPxrVGr7/9VF
 3S3G1Kuh6fd4mm1XUvqI4AkNLB68ggiUx7eUUrEQITAgNK4qx8r+3umccCSje4JeRh
 gayEDFTJ5Wejg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 48CAB611AB; Sat, 19 Jun 2021 06:37:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 209277] powerpc: obsolete driver: Marvell MV64X60 MPSC
Date: Sat, 19 Jun 2021 06:37:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209277-206035-wBLfzRWwA5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209277-206035@https.bugzilla.kernel.org/>
References: <bug-209277-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209277

--- Comment #4 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
The watchdog patch is flagged 'accepted' in patchwork, should go into 5.14

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
