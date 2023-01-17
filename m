Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D7E66E473
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 18:08:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxFhg4TQMz3cK6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 04:08:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TE9R2Hc+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TE9R2Hc+;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxFgl4frjz3bh6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 04:07:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B44B61265
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 17:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01A74C433EF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 17:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673975248;
	bh=DFODLr/1STrAa70m2Q17rW4ggYSxkbPai/8k1sSJzB8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TE9R2Hc+hD+dxtRing6689+e5qA8tv7APgUHUrzNuA/wk9Dta1FKxlsAnb1mq2bPy
	 FCs7AGFz0oHHuVJtCRn0p55BU4NDf1TN9a9sxBc5TpBDj9nYQEkySt+bG2+MPSRiqM
	 CfOAvD9j+jBUlGSDxawkF1R/C178wnHqNB2jZUOw2b7UjUI8So9+iBQNtTIkyKnMbH
	 PDpi06L0w37zZB7BsnwGovrRyF6oVgGXtkidZq5vnyqUKS4qk8UiOMmv2h5Ad5j4gu
	 pCXbnjH+qRaU/z5s1WXD9c/A+za73H68LEHlmHUwdRrWlBotmkMFA3j03NpQYJvI2N
	 qQ3glcltwZJkA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DB07CC43143; Tue, 17 Jan 2023 17:07:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216095] sysfs: cannot create duplicate filename
 '/devices/platform/of-display'
Date: Tue, 17 Jan 2023 17:07:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: msuchanek@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216095-206035-oNd4Wlu8Oi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216095-206035@https.bugzilla.kernel.org/>
References: <bug-216095-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216095

--- Comment #15 from Michal Such=C3=A1nek (msuchanek@suse.de) ---
You do have two outputs defined in the device tree:

/pci@f0000000/ATY,AlteracParent@10/ATY,Alterac_A@0
/pci@f0000000/ATY,AlteracParent@10/ATY,Alterac_B@1

If they correspond to a physical outputs is another question. After all if =
one
of the outputs exists only on some card models it would never detect a
connected screen on the cards on which the output does not physically exist=
 and
everything will work just fine.

Here is a patch that aims to resolve the problem
https://lore.kernel.org/lkml/20230117165804.18036-1-msuchanek@suse.de/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
