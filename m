Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EAC8D5EAB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 11:42:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zxj39EVS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrJ7z2P66z3cXc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 19:42:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zxj39EVS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrJ7D3JtNz3cXS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 19:42:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2CE60CE1BD6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 09:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3184CC116B1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 09:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717148532;
	bh=Js/Da9MefCxVX12ck4JhhZvET43/L8pqVbTM+oPdlzI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Zxj39EVShwoISfF2VXa1iBNmu4iH8/BAfte3HyV/c0+P/lSpPNGglPNOgODHA4i2v
	 xEovT9tlINYmNPHNwJQ87UtnGIar1rPisn/ea213XPBkDcJqc0Z5Nl6ks4oJRpUgkS
	 ZKKRl5lL9VsgQQQM5mxu10di4P4l+8/g/mkodr3WRZsP/xqpwCBUi8ZvESWXmNr0k7
	 pKKkBaah4S+3CQ62BJ43OoNLtPRAklEd75QPPxmHkvTDUngcYh4+3JOb/Rltlg1zLE
	 mApmlcUYDNgoc5c5qoh7ROPgU6c72rWdsHpb8A5t62keszdsFqp2HucxWA8GqIj4DN
	 6PUrvIumNGvMg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1EF94C53B73; Fri, 31 May 2024 09:42:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 218858] scsi_alloc_sdev: Allocation failure during SCSI
 scanning, some SCSI devices might not be configured
Date: Fri, 31 May 2024 09:42:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: doru.iorgulescu1@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218858-206035-QuNjSWb8gG@https.bugzilla.kernel.org/>
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

--- Comment #9 from doru iorgulescu (doru.iorgulescu1@gmail.com) ---
Created attachment 306385
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306385&action=3Dedit
dmesg-next.txt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
