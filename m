Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 157D8584C6E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 09:14:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvJfF6HTzz2ypV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 17:13:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fSsXujeC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fSsXujeC;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvJdZ16PTz2xGM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 17:13:22 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 90853B826E4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 07:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56E90C433D6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 07:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659078798;
	bh=3cCpi4yXYUmzamCBLUoUXGk7M2fGjJgsPpfE4R+t6cg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fSsXujeCX2MSvMbnE7ojuFbxUIiAoXL3jMAXU56uaB7LHFd1Ime4iF4cRAQNWG289
	 4TxdH2BLa+sRDF6/xOgIVVsKO7kzWAXBz1WSNy1RRutTbvTHIrG9iIJy6sUBnLHXR8
	 gCLWRpbDbLmKGeAcBSAwDbqBQ8jBczfP+BRc6lazoT52D0wmuBQb3Blsz1Ms5+qrSe
	 SBCyO8C28nSxkdT/OUxaKK4Fx7lMmkSEhCnhUqL9tliFrOKMx+/7vhnyXCL2dwxXmQ
	 +Qr28EDUJwFgrKfBubVL3Azs7V0b9bPS/Su9T579HqlLnNidirx3HBHcF3vF4K3T9Q
	 8PRaZ/BGNcQew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 40EF1C433E7; Fri, 29 Jul 2022 07:13:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216183] [bisected] Kernel 5.19-rc4 boots ok with
 CONFIG_PPC_RADIX_MMU=y but fails to boot with CONFIG_PPC_HASH_MMU_NATIVE=y
Date: Fri, 29 Jul 2022 07:13:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216183-206035-gA0uuGBr0E@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216183-206035@https.bugzilla.kernel.org/>
References: <bug-216183-206035@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D216183

--- Comment #9 from Michael Ellerman (michael@ellerman.id.au) ---
I can't make sense of that bisection result. I'm not saying it's wrong, but=
 I
can't see how that commit can cause this bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
