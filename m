Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C02B74827C2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jan 2022 15:37:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JR4Ns0fhnz2ync
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jan 2022 01:37:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e7I9dFRF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=e7I9dFRF; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JR4N40h9lz2xXZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jan 2022 01:37:08 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D097760A26
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jan 2022 14:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42D76C36AE7
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jan 2022 14:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641047824;
 bh=12aWqvXm85ktQcuqs/b0y+bIDoghy44o3eqCYPHZogA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=e7I9dFRF4eBPo1l9Bigo5oHNtBeYCRjDbSeLNW+CMHKSlOWr1d7gNNEJastJkDiUX
 +czejGvIFHpbGZ5jigsYaN2O35mjS3WLCNg1Jpohu96v/qTD9JKsbXOPMWCVSRwEBF
 ezOVe9y/clnEHMK0CQZ5Blcp4J4KcG+oBur6KWjSjwqUB7UIJxGYPY+yd9fc3/LgJn
 obp8BjP66CwIliSfkYwt4BQpqq0SKQ4QKgJWtDtlo98lMjX8JPWyGKH59OP76EHczY
 3KtOxWJpPlN3gBlCJuEEJ2VXOJ7hD8zI3HKfCvs4CtKq8E2RfK8Xflhnp4OOava2W9
 4adbzvF9/Xfew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2CAF8C05FD1; Sat,  1 Jan 2022 14:37:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215443] [radeon] BUG: Unable to handle kernel data access on
 read at 0xc007ffffffff9130, Oops: Kernel access of bad area, sig: 11 [#1]
Date: Sat, 01 Jan 2022 14:37:04 +0000
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
Message-ID: <bug-215443-206035-ISPHOe5NQy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215443-206035@https.bugzilla.kernel.org/>
References: <bug-215443-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215443

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300197
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300197&action=3Dedit
kernel .config (kernel 5.16-rc7, Talos II)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
