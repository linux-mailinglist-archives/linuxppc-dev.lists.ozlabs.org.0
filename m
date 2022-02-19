Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 992564BC419
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 02:05:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0r3C6qgHz3cTQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 12:05:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U+ZftGBS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U+ZftGBS; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0r2G345qz3cYb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 12:04:54 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B81F4B8240F
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 01:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D5CCC340E9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 01:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645232689;
 bh=PW9/oP+6xj4eRMX+FRF1BV5wScpuXyVaYnmdo1UZ6hc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=U+ZftGBS2fLDEJdToQpBpUCgaYdhAsmwkFO5t6kddboq4udujK29GffkizVjJKdKw
 VZiAqJ2RzuL9G9FVpkEtt0iQNoITOBMhChRyiLPSPlGz7vyavxi+9PGI5x/RRfwQ9o
 Iz0YiX7knG0jvgF5hU4MD+EA7ktkq8FL4Z6UoYPNWQhb5gjVIKEm+ozkhquNfSZowa
 fMumZVI/esvj0BHoGhOvPQLHKcPrjTK21zImuxYNirZYO/9lc6qrhFR925byiuvDRW
 6VtHt1sWG+O6ji+H5+IclFdHqz4ynFxEGMw9BmGdfM9GPbmOcgacGRicqAQ2Rq8NiM
 iMjn+bm7iWNQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6DDA3C05FCE; Sat, 19 Feb 2022 01:04:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215621] Warning: Unable to mark rodata read only on this CPU.
 (PPC970MP)
Date: Sat, 19 Feb 2022 01:04:49 +0000
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
Message-ID: <bug-215621-206035-LH3k0YfgK9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215621-206035@https.bugzilla.kernel.org/>
References: <bug-215621-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215621

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300483
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300483&action=3Dedit
kernel .config (5.17-rc4, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
