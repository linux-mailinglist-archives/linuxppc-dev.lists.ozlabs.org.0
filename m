Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E8A5957C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 12:15:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6RqP4d9bz3cB1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 20:15:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=isTfzcik;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=isTfzcik;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6Rpj3J1gz2xrD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 20:14:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D8919CE1717
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 10:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BF71C433C1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 10:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660644888;
	bh=5jOb+2G84+eXcDkbL6BUp41JxXcThL18ORLW9U6eFD8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=isTfzcikjUub+RMTvcsLnSaAAveRzjo0UJ26hbuUejgOWd+7DmX81BUWCeIZJnUWt
	 eg/T2sk4D43xIER4SS1VOudeVT2ldr9noz8c3I5iQE4pYBTVzBuyPrpRkwnO2zBEhN
	 FtUp7ZIDrq+R/ZJDt7vUEptlyqG5M+B4Jwpl94ss5BHP+Aggaz4J9q5r3aN71k+m5b
	 Fj2qLoEiiLuOL7g5rvgB8Txb1HuJ+C4flTk8JA121TZevifMgvqlNIp4nDBscfB1LA
	 WcVio7XYESLW+uv+AJs5ph0h+bsYLnL9+CCpyF7whhoiqOqqgP9t7LorUbDypli+As
	 nuDLPzr36okpA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0716FC433E6; Tue, 16 Aug 2022 10:14:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216367] Kernel 6.0-rc1 fails to build with
 GCC_PLUGIN_LATENT_ENTROPY=y (PowerMac G5 11,2)
Date: Tue, 16 Aug 2022 10:14:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216367-206035-7lYYWSuwwA@https.bugzilla.kernel.org/>
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

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Andrew Donnellan from comment #1)
> I've sent a patch:
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220816051720.44=
108-
> 1-ajd@linux.ibm.com/
>=20
> Please let me know if it works for you.
Applied it on top of v6.0-rc1 and it works fine. Many thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
