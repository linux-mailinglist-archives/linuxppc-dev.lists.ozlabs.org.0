Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2305709B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 20:09:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhX2f6kjPz3cg1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 04:09:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E/f1QB+6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E/f1QB+6;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhX1b6vJ8z3c6t
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 04:08:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DB0F761496
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 18:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A127C34115
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 18:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657562897;
	bh=yRVAvAMqx7WcMNZLNJqq1ur/nJXQAlLYX1UPYge7BkY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=E/f1QB+6er9jYFJhkY0KgpIfGi46NvukterDDRwDgINwvrUJXrgZswrMJx6tGzZQh
	 AWD/uz5VuLvPeC258vEiesYTiNEhkzpg5scqnzRSldmpcv3n5dh0ShkqFO7APCpcqz
	 KesdrwoWSl7bZ9LOqEJ5fgVnAJs4rssHle4ogEn5Jb1H0JnNmed3iAUDfvlHsFnSHP
	 OG0ULY9E4gHrBdizK0hbPcXhvklSgxUetKTujsVCEZ7SDloq0m7S6EjPbwsJ3U1B7m
	 XpoFftbXkp28m6sG4/n48l9VUKm91HZ8PmhPYsF/8/buF1/04EAkriJRvuV4ZMZa0z
	 FXLTKGjSdxFLA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 36185CC13B0; Mon, 11 Jul 2022 18:08:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216183] Kernel 5.19-rc4 boots ok with CONFIG_PPC_RADIX_MMU=y
 but fails to boot with CONFIG_PPC_HASH_MMU_NATIVE=y
Date: Mon, 11 Jul 2022 18:08:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216183-206035-jFlEe4JfTT@https.bugzilla.kernel.org/>
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

--- Comment #7 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301396
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301396&action=3Dedit
kernel dmesg (kernel 5.10.129, Talos II)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
