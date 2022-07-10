Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 875FA56CEA6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jul 2022 13:02:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lgkch3TFRz3bx3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jul 2022 21:02:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jtlI3097;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jtlI3097;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lgkby116xz30Bm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 21:01:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 69043B80A29
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 11:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28725C341CA
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 11:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657450906;
	bh=HOwStuJjp3MIFkbB8/ebZ6+iwaTHNEzHkxPJIoFB9D0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jtlI3097l/aGkKoSEbcHWCfnfys1sb8UaS/Hsq8HeznYBkaoGhYLwsZ6WSx1hV0t0
	 iQhakxtAUBH6/+9XBSOiyCBLvzN9gQy7QyPmF8GcpmFmyiREkZB0P+kMKbjQcqBE7v
	 UiuyTT/tQYlqqozMb10kvLY0279hJQf4jGcFx+Wnaauiy0ZK38DC8lqhBEA7hcOrhe
	 nggNFNu4zwOWm0yqmjG6cDdfRNIp3rWMW53Rg6wYaZ9C/ELnib57kemYR5VsLhDiA3
	 OBFdegwIHGUpqRUknTrPStcPrwZKv7RMdXjec9+rF4mIDirvtEoc9WJvUHmeZvMbaT
	 QFVj9wpMpQgcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 072AFC05FD2; Sun, 10 Jul 2022 11:01:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216183] Kernel 5.19-rc4 boots ok with CONFIG_PPC_RADIX_MMU=y
 but fails to boot with CONFIG_PPC_HASH_MMU_NATIVE=y
Date: Sun, 10 Jul 2022 11:01:45 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216183-206035-dahMG4hgmX@https.bugzilla.kernel.org/>
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

--- Comment #5 from Erhard F. (erhard_f@mailbox.org) ---
Danm, posted that to the wrong bug... Sorry! Please ignore comment #4.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
