Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1B63C896C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 19:11:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQ3vR72hlz304h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 03:11:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uCyftwkQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uCyftwkQ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQ3v03Mdlz2yxF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 03:11:24 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id F2204613B9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 17:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626282682;
 bh=BzV1mSoUwyoL8WF6STTroyU6knovIAjPUyVkWHUHmfw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uCyftwkQ3WHjxCNZuqj9tWGxxrToNMHjteT3r7l3capCQPtobY+qOgn0EJKVrGvb2
 Uu2gI05L/1pGGClUuqVdq53MKnYm1cLMY1+9lyRVJFhqxMlRQZycsWYi49bCwnGAB6
 XoLjD6nRDAM4hiLBQybIQoDx3Hvr+19Ane5V7TQco7OgA88GljvvQeU1v56J22a5xd
 gvY4TDdJ49egTLioTVkitlRYghnH0T6O7v7XrBfcwCfKnzdUQ5twMsg4Ri8OzVg4Yl
 UmqnbNNUPFAxFEKni6KlXBng1zfFMR0lg2WBwDSa3hD2dWkfCi7WnaVJ27q4Q6Ni2R
 1v28kLyIeDlCA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DBE8C61287; Wed, 14 Jul 2021 17:11:21 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213733] Kernel NULL pointer dereference on read (Oops: Kernel
 access of bad area, sig: 7 [#1]) at systemctl poweroff
Date: Wed, 14 Jul 2021 17:11:21 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213733-206035-kg68tbpYmX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213733-206035@https.bugzilla.kernel.org/>
References: <bug-213733-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213733

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 297859
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297859&action=3Dedit
kernel .config (kernel 5.14-rc1, Talos II)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
