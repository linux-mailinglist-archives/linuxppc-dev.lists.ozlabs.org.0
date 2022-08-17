Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C760596667
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 02:48:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6qBq6gXmz3bhQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 10:48:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KOBpsTMP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KOBpsTMP;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6qB33FkGz3bXy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 10:47:55 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7AFEFB81B8C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 00:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12A1AC433D7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 00:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660697269;
	bh=IK/KBF6HOnYoEaVRcqL/1QgBqxS/4Nfn4EspFLbWtfo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KOBpsTMPaCQucSuY1/rXgfOWUHJsoehz08M8va6XNpVwF/WVZDwBgq1RhUSXxvx33
	 GkbJ3mfOMKoeV7be1cEohlSo585/gje2LX0PdqNmJLm7W/Xt1tVb0WfvusXjWy09wh
	 gE6pFBNRxWakNr6UNXDaJ7vEjugxQV4y4Hx/xvawl6wkT6wEwCGRDomGpvwb+V47iO
	 nY/zjlRi6deCU39b7ajPFt+KcVpMZGkgsgah5JKm6GOIHjYIwcYoBaA4NsF5NO7jsQ
	 tFkwUSu2qEXh/LmkM8nXcY5ZtvYYtLnXmKlbBKBhrs4FuVitTlbUHNK3J2pHBAzhcq
	 DxBxF1fwZQQrQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E0728C433E6; Wed, 17 Aug 2022 00:47:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216367] Kernel 6.0-rc1 fails to build with
 GCC_PLUGIN_LATENT_ENTROPY=y (PowerMac G5 11,2)
Date: Wed, 17 Aug 2022 00:47:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ajd@linux.ibm.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216367-206035-Fv85ztENQG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216367-206035@https.bugzilla.kernel.org/>
References: <bug-216367-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216367

--- Comment #3 from Andrew Donnellan (ajd@linux.ibm.com) ---
Patch has been taken via Kees Cook's hardening tree:
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=3D=
for-next/hardening&id=3D012e8d2034f1bda8863435cd589636e618d6a659

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
