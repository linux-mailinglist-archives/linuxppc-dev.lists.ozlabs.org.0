Return-Path: <linuxppc-dev+bounces-10592-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA47B1A4D1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 16:25:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwf3M3wtLz3bpP;
	Tue,  5 Aug 2025 00:25:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754317519;
	cv=none; b=IXqE2RS3IgIyVfuHEONg9b9aycQx5hsrdvKm1EXd9QoKpidRt0L+kCiJFTdx/gY0S0ROkj7ZfW73zuKy6KJAb99hRItUF5eeuFtSrxasKHa2KqhbxisCXu11B4STOP96qAQ+5DMhGq1MxH3JiDEzD64LeQah0rvp37IxeyPjsNJwbCgug7gfbqNYrjMB5n3Ew4NA785MHJbpFNNPHXwznXB4J1vG58vHKB1JvVyQoQ2z6lUiPrppguU0n0myaZzEMPHwAGoQ1pM+w1wlTmQiNODeqliht5Ot/aOcKXCZYVSv/Q0k3n1o6NXMEIKaDirO6bJaoOocC9alKia3Bpgc5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754317519; c=relaxed/relaxed;
	bh=JnE/XQebxhZoJ4GRVlUCrOpacOVFTDN+5mw2JDUfuYM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mAf0+rrGb8DfGVuFZE35VAh3b7comqh8qAEGNjaQdPLlfQc86ho2MoeYGYpvSGg25+wj4hvJZKQGmdhTUSaQEfMqAjatsHpojgOEdq6hBjag0uG1ECogoeFn/lyZ3GxCcT6hew9LWMOakgjVk6Nc5Gogv+YKTeRVQNmcoZ+QtwjzzP6RLwV0pDbmJ9y0WWX4U4QgKVFL14gNG5h9CwPPFg525pXpSVD+72KCK8WfZwsKXbgthmwJI9xuK49qC+G94dSEFEkxxkwXVbfmsmukaVbAkZ0a+tIdZhHLTSN/MA3u4vmiiy8Vg18FG+MqXiA17DE2VhsmHZNeARgttaAVNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Age+vrxr; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Age+vrxr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwf3L39f2z3bpG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 00:25:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 716D25C54BE
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 14:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A5D7C4CEE7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754317516;
	bh=cphDNL22VYTOCLcH8OPM5SL76V4lXPM4lLaUzVaJFZo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Age+vrxreE37/9oheQxkdrwJ5rpPdBj0zism/mmwKcMAKwXPS45xqr7RvDo0UNTJn
	 myCxdhQUlYv7S6VwE1aE2a4nNNKI2SlhM3bVZVO3m759pB704PSbhsUEMJcmzi0Ogq
	 nTzm6piE69D3oe/VAnZ6zwgmWNGuQgJp+t16CltGqLTh6JydAh33RJ/b5Wbowi5/W0
	 Ow73wlM0bwx8HbZ+MB4i1sfmbMYgTodr374nkauHR6la6zrUIbT1SVGM+8Zc9NdFrz
	 1UG1gov6awTpIOIXQ7g6lEwZFFkFcUDMM+IxHXIftj7dphTwBZep/PhaWKIyTs1yl9
	 lP6WP/djhNzig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 113A2C41613; Mon,  4 Aug 2025 14:25:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 220407] arch/powerpc/boot/types.h:43:13: error: 'bool' cannot
 be defined via 'typedef' when building with GCC 15
Date: Mon, 04 Aug 2025 14:25:15 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220407-206035-pL2Cw9FtiA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220407-206035@https.bugzilla.kernel.org/>
References: <bug-220407-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D220407

Christophe Leroy (christophe.leroy@csgroup.eu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |christophe.leroy@csgroup.eu

--- Comment #1 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
This is fixed with commit
https://github.com/torvalds/linux/commit/5a821e2d69e26b51b7f3740b6b0c3462b8=
cacaff

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

