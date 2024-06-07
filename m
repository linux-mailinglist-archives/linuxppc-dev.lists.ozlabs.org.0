Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3778B8FF960
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 02:56:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dIi1NNk2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwN742q9Nz3fsv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 10:56:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dIi1NNk2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwN6G5y3Jz3fld
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 10:55:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E746561E6F
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 00:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97934C2BD10
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 00:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717721726;
	bh=oGmexljNJB3Qav3z1X5vU/dzdMi3BBGWJNSDijRET0w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dIi1NNk2WdAERf7mtaGQrPZ0wM0CfFDHLqzSqkt/f2OvzoJ5WD73n9tMHpL38zYat
	 sBj8arfEW8hLrPnzid6mpSwwPG3Hrj8TOU/hG5yy0Qw3sfNAqWpVNMuvG5XisX/+sf
	 kqFdPkEZ37R0iA68/bXib9yx3pedQRpLLmWazetpYoxJvmXE+amNoyvRJMw0pZWjaQ
	 QVGoMdIB7yZo5XKdyYMf2WrhuvhpQLdsLmaSYOuPJFyvxsCjKN3GhYeIgQvrNi9R9+
	 I3zkk09Oo7QW6kqK/0skQx2WTGLuumeQpSF3xZxELdyjDL6pQ4MSuEE6OTtn8At/r7
	 3R1nYee2+n0/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 83137C53B50; Fri,  7 Jun 2024 00:55:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 218858] scsi_alloc_sdev: Allocation failure during SCSI
 scanning, some SCSI devices might not be configured
Date: Fri, 07 Jun 2024 00:55:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218858-206035-1okzNzZyTA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218858-206035@https.bugzilla.kernel.org/>
References: <bug-218858-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218858

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
