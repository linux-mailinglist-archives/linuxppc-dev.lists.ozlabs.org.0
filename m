Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E101447858A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 08:21:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFgQd69wXz3c5l
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 18:21:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NGo3nSRt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=145.40.73.55;
 helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NGo3nSRt; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFgPp6yR6z2yMx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 18:21:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A140CCE23E5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 07:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2189C36AE8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 07:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639725657;
 bh=Ij0jxUpxQffnHBwZQloyYY0ITMO9lRr4nuwrejpkdbg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NGo3nSRtawS8+ktZkLPdBRoNvvPd14ACNgc9u4NTMDjPpIQawWT364+dZVnqTNr1v
 uHZTCA/CJkA8o2oTc9zch7SskDPFH/Llj3fLo9dm2A9ynqcWzmVA5VZi7IIccmpOFv
 +Z0I/uW20HPPJRBBmPeQow2YfF0VXrSz9EJmwxh4w+NqDMLtir82VpjAnIZOAcXyt0
 uz07IqBlpiFRnOU1+aSBVu1TALdqOjXQuQ3Ws8OZx5ItxXec2frUKDwg+H7A2rH1KN
 5z3M8PtuuLtWtaEDP1f9YJFqkZTtJYI0JtnyJX3DGcsl9pLc2DXC/hlOh/O2dRnR+A
 RtCTsV651rtfw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B5E5A60F54; Fri, 17 Dec 2021 07:20:57 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215217] Kernel fails to boot at an early stage when built with
 GCC_PLUGIN_LATENT_ENTROPY=y (PowerMac G4 3,6)
Date: Fri, 17 Dec 2021 07:20:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215217-206035-6XStNurOM1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215217-206035@https.bugzilla.kernel.org/>
References: <bug-215217-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215217

--- Comment #13 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
arch/powerpc/lib/feature-fixups.o also need DISABLE_LATENT_ENTROPY_PLUGIN, =
see
extract from you vmlinux below


c0c0ad20 <apply_feature_fixups>:
c0c0ad20:       94 21 ff e0     stwu    r1,-32(r1)
c0c0ad24:       3c 60 c0 db     lis     r3,-16165
c0c0ad28:       7c 08 02 a6     mflr    r0
c0c0ad2c:       38 63 55 50     addi    r3,r3,21840
c0c0ad30:       bf 41 00 08     stmw    r26,8(r1)
c0c0ad34:       7c 3f 0b 78     mr      r31,r1
c0c0ad38:       3f 60 c0 da     lis     r27,-16166         <=3D=3D latent_e=
ntropy@h
c0c0ad3c:       90 01 00 24     stw     r0,36(r1)
c0c0ad40:       3f 80 c0 d4     lis     r28,-16172
c0c0ad44:       83 db 5b 50     lwz     r30,23376(r27)     <=3D=3D latent_e=
ntropy@l
c0c0ad48:       4b 40 60 35     bl      c0010d7c <add_reloc_offset>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
