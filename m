Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC65C3AD827
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 08:37:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6R0v34QGz3c59
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 16:37:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B3pj2pTV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B3pj2pTV; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6R0R3Z5rz2yxY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 16:36:55 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2CFBC61001
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 06:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624084612;
 bh=f+i61o8hbpmCjOtxXAe5lqHlQdl/n5BKr2d1uMPoVDk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=B3pj2pTVBXuaCRt+OpF7mlDInnYHKjSA2lb1yA4XJvfVupytescIwiWuiuFBh/5Rk
 UJdEhYmQstGSoWrUuVI2ArufPubfL1EmKyBAtXfgNDjzJjEq/jwLUFWKtoajHIw5HV
 ugt2ptvHLr2RSrjStHJTkiltrPgVcwsu8dfX0Jf4ymQoCVxMS/fhAWXePylnA1flhX
 Yalx8x15aBAYf3AIEPz4lV7LYDku/6u88FwHsC725WlhUSV4QELYcU575HYumFmEUu
 d1Tzo9WouRrdpga5wIsWJXnsY8+ColyaftCkkPgVkxHqwnqPevMjITjmptkmfWlb3D
 Wu9nqXvZY/ipg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1910A611AB; Sat, 19 Jun 2021 06:36:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 209277] powerpc: obsolete driver: Marvell MV64X60 MPSC
Date: Sat, 19 Jun 2021 06:36:51 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209277-206035-9j6nUJlPqy@https.bugzilla.kernel.org/>
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

Christophe Leroy (christophe.leroy@csgroup.eu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |christophe.leroy@csgroup.eu

--- Comment #3 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
https://github.com/linuxppc/linux/commit/a329ddd472fa2af0c19a73b8658898ae7f=
d658ad
https://github.com/linuxppc/linux/commit/600cc3c9c62defd920da07bc585eb73924=
7bb732

https://patchwork.kernel.org/project/linux-watchdog/patch/9c2952bcfaec3b178=
9909eaa36bbce2afbfab7ab.1616085654.git.christophe.leroy@csgroup.eu/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
