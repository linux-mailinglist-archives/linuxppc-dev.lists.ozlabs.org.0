Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAE95951E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 07:19:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6KFj156Kz3cfD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 15:19:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ERJCtWHo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ERJCtWHo;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6KDy277Kz3bmG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 15:18:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DFFAAB815FB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 05:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B517C433D6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 05:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660627116;
	bh=/q8tORbeDA4i2lJw4NB9p96IjHeSD5uG+ucfdmFCpOc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ERJCtWHoRqa4DBXQt9z6urH69aG8CV1XTHk5rVBwCi6l2b8GrFiJUbWd+SZTJqSOf
	 oLvWwXN9aM9ar3kpiu2lBMJ2ecs6DaW7mh1CqiqTOZTvtZlpov4V+WFV2wxAujrhzP
	 D+h+6KC/SkrQEZFa8AT05yZgQY9+gXpdHH5bjAlNrdo437O0x1iERSwrZXC+Gp0JDX
	 S47dwMKHbZQBB1KSputeSXdqQ+0ZiJzMSzTENUTqLq6XhkHn2EMQqpMwdLgJkdZz33
	 +WtuNmqcGSsLoQnt3vVCoRy4xEMHhJpESuhpeu21e19tIQzj6hrTJoYvn6Lw0MiM9C
	 wypqBsveTSacQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 69D44C433E7; Tue, 16 Aug 2022 05:18:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216367] Kernel 6.0-rc1 fails to build with
 GCC_PLUGIN_LATENT_ENTROPY=y (PowerMac G5 11,2)
Date: Tue, 16 Aug 2022 05:18:36 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216367-206035-M3i3YxmQPk@https.bugzilla.kernel.org/>
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

Andrew Donnellan (ajd@linux.ibm.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ajd@linux.ibm.com

--- Comment #1 from Andrew Donnellan (ajd@linux.ibm.com) ---
I've sent a patch:
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220816051720.4410=
8-1-ajd@linux.ibm.com/

Please let me know if it works for you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
