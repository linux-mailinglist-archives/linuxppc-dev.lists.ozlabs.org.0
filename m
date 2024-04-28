Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C29F8B4B6C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2024 12:57:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J/1U5Vml;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VS3Ls6kx8z3cVs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2024 20:57:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J/1U5Vml;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VS3L54Xn6z2yk7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2024 20:56:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3DD716040B
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2024 10:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 791C7C113CC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2024 10:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714301785;
	bh=vV5wzBnMYSyEsv0+L10oTGECUZ5ONJ6K3XOgm7E2EiY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=J/1U5VmlyUJudADGHFAVvTICIfmMYtkCCsiu6Th+LVZzcOx1sdfXbgtjz+H+mwvsT
	 CATk8zUnEvzEW7CERXsHZs+Hre+JVmZDEzvShhDPj6enJDO2jHKx5MB50LuEnwG/da
	 Gmqa6wdOORlXdery6/VKOb85REhMZ5OhnBYkMcEmd54Ss+avSzAgOSYsImRgzPRxQn
	 c3UGLvzUjUa50Ut4PFSyG+X2Vni+mdsVN0IpAqcEAZryTgcOC6PPw0DWPDVNWsRYlz
	 v+dGnjaS3YlvByeqiqigSEgu/jWbpUknrMXVsce3EGn79ELPXXWfZNqZwPJvtoAuaH
	 EdhbW27sZvMvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 64C5DC433E5; Sun, 28 Apr 2024 10:56:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216723] BUG: spinlock wrong CPU on CPU#0, swapper/0/1 with
 CONFIG_NETCONSOLE=y (on a PowerMac G4 DP)
Date: Sun, 28 Apr 2024 10:56:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216723-206035-tAIH2PQG5A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216723-206035@https.bugzilla.kernel.org/>
References: <bug-216723-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216723

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Closed in favor of
https://lore.kernel.org/netdev/20240428125306.2c3080ef@legion/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
