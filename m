Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 049D262A288
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 21:09:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBcjD5scLz3cJv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 07:09:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IWKVYTPE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IWKVYTPE;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBchF40Tzz3bXR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 07:09:01 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D9F9361784
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 20:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B747C433D7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 20:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668542938;
	bh=ov7TNIlvtNEkUAd9tMBPxvfgtl81FvCb0E7x1Io7Mj8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IWKVYTPE0Lndkk06UW5AOKat8laCeugxSi506GVfwMS5XK9L7v/SYNYoCkvnhgWu3
	 T2ElkVGUuHOi5Te0PZoAVufr4QXFyeDPnv9wa1vPZvt02VKpwza31PNabO8oO3d5AU
	 I8hPfmauaNgsw+Pey2A1Jxf4RYNSGigk9lWnAYJBPUVkHUhiqWEwHOgNIIE2B/2qcY
	 wyjyKYDVdHJ0dHcdqBHpMCs8/YlcKJg/8+Lde6BmdalpmZUA0LKjU0axbLvR7q7W2v
	 9K4jVglN39JWUiy0NpLWbpWLLuAWC6R+WjXaQZ/Vu2epHbupToWoXeXijoQrx2RTCf
	 Hxp6gclyOv+UA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2DD0AC433E7; Tue, 15 Nov 2022 20:08:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215862] clang-15 fails ppc64 BE kernel build - ld.lld: error:
 undefined symbol: .early_setup
Date: Tue, 15 Nov 2022 20:08:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215862-206035-yKrGo2168x@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215862-206035@https.bugzilla.kernel.org/>
References: <bug-215862-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215862

Christophe Leroy (christophe.leroy@csgroup.eu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |christophe.leroy@csgroup.eu

--- Comment #3 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
If not already done, can you report the problem at
https://github.com/ClangBuiltLinux/linux/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
