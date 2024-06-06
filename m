Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A678FDCB9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 04:28:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n08Ew4eP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvpCZ3sQcz3cXT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 12:28:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n08Ew4eP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvpBv0DHWz30Wd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 12:27:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 75D1ECE19F2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 02:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D522BC32786
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 02:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717640833;
	bh=XA8cdHAMK/D+55N1mqipiPugzBg0ISHuQpz+0xWFi/o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n08Ew4ePHV5FwebCkvywxEbeHdIFOQGrKpCfyKV/zko6OuX0BgwhEyA4lH0+GwjS6
	 Y1KWobnIbhkr1USQClPJsLibsB22A3jaNDm1ff8WQSdklOrGiWJYoQqq347gQGI9B3
	 bSxOHaM5KaYMgYDyG2GjBNtLG2Dxf91y09gV1cO4zxtikWCC0iULk2wyHDJwui6lk9
	 o4QXTRFlsD+/l5vhqLye4d1i8f0649SGzJSimGS6m5FGJcg+KBdeJg1rQlXGXHwuPs
	 JMFejzHYPJzwxU+U2Q70pfXTroCmZNsWdV37ZlA0kAcG0uvxkI7zvt9Nf9cu8eBxKn
	 M+veZ6Qx/melQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BE46BC433E5; Thu,  6 Jun 2024 02:27:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 218858] scsi_alloc_sdev: Allocation failure during SCSI
 scanning, some SCSI devices might not be configured
Date: Thu, 06 Jun 2024 02:27:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218858-206035-ZwqMe4fnjU@https.bugzilla.kernel.org/>
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

--- Comment #22 from Michael Ellerman (michael@ellerman.id.au) ---
Can you please confirm that the patch fixes the issue for you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
