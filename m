Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C967D8C4D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 01:46:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XYHNTehg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGjBR4LMWz3c8W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 10:46:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XYHNTehg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGj9d1DwMz301f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 10:46:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 659F5CE4363
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 23:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE7E0C433C7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 23:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698363967;
	bh=HOvoWKWmY8oybnzfR+sKQrpy5Nnl+AFNp6161mDMjgA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XYHNTehgNtt3gGnRevw6hV/Io0jvxoj/5z7r3r8PFLVovwfzzTl4BNO2vlVqqaJPB
	 os3vO8UzIpBeD57sAKmcSP1/LX4E7QF++jZ+AU46Sy1AxMl9lRuxrRF+iDHZKcf5c3
	 KW7Vpr7U2n8lCbm4aPAjfwL7ZoA8LESnaBaLJkrv5QeXo0s8bQxJn2IZsRbg9AEvt8
	 SptG3jctS51+UrFSk15P8zC737UYiPdsvsCMU6QtWGy15aaGGvQLvRyf4Q4xZBlorp
	 eiDrl8su5VXvG89gXdLdSBfXwMxe5UAKpSHIxGF3ckXF8D1IUMP+J4EuAY2gcyLBE4
	 Np92f+cyXbJnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9949BC4332E; Thu, 26 Oct 2023 23:46:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption with VMAP_STACK=y set and
 burdening the memory subsystem via "stress -c 2 --vm 2 --vm-bytes 896M"
Date: Thu, 26 Oct 2023 23:46:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-215389-206035-obEU8KF2gP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #300978|0                           |1
        is obsolete|                            |
 Attachment #301303|0                           |1
        is obsolete|                            |
 Attachment #301640|0                           |1
        is obsolete|                            |

--- Comment #42 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 305299
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305299&action=3Dedit
kernel .config (5.5-rc5, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
