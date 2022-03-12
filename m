Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D27AC4D7140
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 23:08:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KGH4J5Cqyz3bTk
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Mar 2022 09:08:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LELi9WVE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LELi9WVE; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KGH3X2tDlz2yyf
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Mar 2022 09:07:36 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EDF94B80B27
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 22:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EF03C340EB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 22:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647122850;
 bh=Aa9BCpKc4hNQQGfs0hgwDasRN99+hhjBTxuWsveILo8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LELi9WVEXZT6oGohU6N3wteG5w2a23gx3Gf9N+yyq/y7fY8sYoK96I1hpfA4hZaRa
 OdqJDpwTDgAqPmdPXAkih5trYBT7tqI4cNyr1zirXV8M68OnPnDJmDnSjHIdsz6zp3
 3NENjca/x3uJ7wZcth8pqkaHKjmWZFVkNASRDdx9AJA5zQbYaJY6JZtqLDcwWUUEQO
 0ucicGbsmkbhL/Mu0xMpsM3O1RpMuFRu/E5w4lEEZR/zD2j3c4a8lOLPR3DzPz6usy
 g9Npv8fCQPTwBllC/WM6v5gnbmoWxYnbz2h7l4flA9/tFgYJUVdqvxLL+AhRuhu8K2
 67MciIdTGNBiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 73866C05F98; Sat, 12 Mar 2022 22:07:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 200055] [Bisected][Regression] WARNING: CPU: 0 PID: 1 at
 kernel/locking/lockdep.c:3214 .__lockdep_init_map+0x260/0x270
Date: Sat, 12 Mar 2022 22:07:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-200055-206035-CbwSoJ4Tpy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-200055-206035@https.bugzilla.kernel.org/>
References: <bug-200055-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D200055

--- Comment #24 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300558
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300558&action=3Dedit
kernel .config (kernel 5.17-rc7, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
