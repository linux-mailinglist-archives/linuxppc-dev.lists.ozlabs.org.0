Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C704D7143
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 23:09:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KGH5D09nPz3bfm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Mar 2022 09:09:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qJHsU+1i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qJHsU+1i; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KGH4N4v5fz30HJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Mar 2022 09:08:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E05FFB80B27
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 22:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BBC7C340EB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 22:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647122896;
 bh=ATZy8l0unDVLq4igQpIxcia+DofBLZ+LXIruXHJrB34=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qJHsU+1iQ3/EwkCbzYrtQP4gPT1QDPz0gEIeJ9INAWNuAmkRXLHha+Jbsh2+/nYPl
 pUaM/xECmOUu4hQ5NE1B6J6ZKU8moUhaZKbr04UDHn7BNYNXugukz6VOP5T0tQ8d6F
 tMwtaBTnzRN4viRGk3g/726EpbzLcrtz+HOktwkyOl1zLwWbYXINvNgZ2UeZsxHZ7r
 e9H/YUL/2ea3S/oxi63nxQZLi5BKyBrF+I/hjSDK6m2SFNYJwQuJTexHZq/VvT5Zkz
 VhbraYMNyzAnwiCXH7zdCe+66Q96ATq2aj/96ks+AJQISKKLFvvJ6d4LPlc+pzHuT5
 TI/2rGhm246Ww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7AECBC05FD0; Sat, 12 Mar 2022 22:08:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 200055] [Bisected][Regression] WARNING: CPU: 0 PID: 1 at
 kernel/locking/lockdep.c:3214 .__lockdep_init_map+0x260/0x270
Date: Sat, 12 Mar 2022 22:08:16 +0000
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
Message-ID: <bug-200055-206035-0dBZysjAmk@https.bugzilla.kernel.org/>
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

--- Comment #25 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300559
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300559&action=3Dedit
dmesg (kernel 5.17-rc7, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
