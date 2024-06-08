Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AE4900FA8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2024 07:19:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=joiUlCzm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vx5wh3YDYz3cWG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2024 15:19:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=joiUlCzm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vx5vy5lZsz30Vx
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2024 15:19:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2CFD8CE1DB7
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2024 05:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D318C2BD11
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2024 05:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717823945;
	bh=jnrqFJOk9hJ5ngzRJL7v7scX5XDMnrol7rijxrNWBzQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=joiUlCzmxy++aeeeKxymKE6eutAsLAuAthclDD23mH9tzlLfuwK2Ols6u2XdD8/e0
	 Qzs7XvSNO0Mtc2JyrmNRXahsa95EW3NWsxu3vXWS7X+yy5s/gyYjirF11N9vt13GCq
	 nxwO5OnBuJ8j4MtNH9FH1DokhATV7Hz+i1m2Znm5QIslhlBcEyFUMT/wGnjXVfeQRc
	 7NOpCpfGs3hIzdikrt5ln1VOT0Ez2BlO/Y//JCu/SivCPylz03TiQIlPWw9j6N3ei4
	 J8QgLs8DRAX9PZxn1Bo+I9FVMCHNRyXLmZYdaIlQ3VC5wZVqRl8PIrPXr9nsP21VGD
	 Ps7R+qIJ6mlxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 52E52C53B73; Sat,  8 Jun 2024 05:19:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 218858] scsi_alloc_sdev: Allocation failure during SCSI
 scanning, some SCSI devices might not be configured
Date: Sat, 08 Jun 2024 05:19:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: doru.iorgulescu1@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218858-206035-KYPrOnBfTK@https.bugzilla.kernel.org/>
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

--- Comment #26 from doru iorgulescu (doru.iorgulescu1@gmail.com) ---
Today the patch was applied on https://github.com/torvalds/linux
Pull ata fix from Niklas Cassel:

 - Fix a regression for the PATA MacIO driver were it would fail to
   probe because of the recent changes of initializing the limits in
   SCSI core

* tag 'ata-6.10-rc3' of
git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux:
  ata: pata_macio: Fix max_segment_size with PAGE_SIZE =3D=3D 64K

Thank you to All
Regards

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
