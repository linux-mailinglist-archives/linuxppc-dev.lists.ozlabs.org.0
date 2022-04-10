Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B52B4FB0B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 00:47:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kc6Z70xLcz3bcV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 08:47:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eTi6LjBl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eTi6LjBl; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kc6YS5Ztgz2xTs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 08:46:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA367B80ECA
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 22:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 952AEC385A1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 22:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649630808;
 bh=dycUTeEXuUUnvWjBWGAoCuwN6M+/0nb9IYPAz9KZo+I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eTi6LjBlrfgJxAYve2C96vIHMM0LlcaLm4fr0LU2Yjs/S+Ja03x/ykrL/XeUPiUuP
 aD6L4+E1ClM4wsmbz5g708nylyupK0PlFqjdMp8P5aLvcGXEMIbaRZpidqfuoT5ulR
 6leiHHtJ1+EsA8LgdVJHcQYyCuRaB963yLostBtKwZgua7DDYWsN5+H8JPFBP4hp00
 84Hw46bJXpecaoyAyB22SR43LA8xrFdIglwJKM5eKkjbpo0p8C/MJPH/shL0KXygTW
 NWopYgvYK8/VZ6UgXSprWd9BwKh8ZwSAtsITkfoaTMAFGlAFsdxtxFweNeBGaZ7Z8O
 g69ov3dNyShrw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8110AC05FD4; Sun, 10 Apr 2022 22:46:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215803] ppc64le(P9):  BUG: Kernel NULL pointer dereference on
 read at 0x00000060  NIP: do_remove_conflicting_framebuffers+0x184/0x1d0
Date: Sun, 10 Apr 2022 22:46:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux@octaforge.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215803-206035-I9QlBlG5c1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215803-206035@https.bugzilla.kernel.org/>
References: <bug-215803-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215803

--- Comment #3 from Daniel Kolesa (linux@octaforge.org) ---
It does not panic in my case though; I merely get stuck with the offb
framebuffer console instead of it switching modes to the right thing

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
