Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 269314BC473
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 02:13:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0rCZ3TXlz3cbg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 12:12:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qm4/3QAV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Qm4/3QAV; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0rBb5FCCz3cZR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 12:12:07 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 795A96134A
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 01:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBD30C340E9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 01:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645233124;
 bh=OCHcjjW6qA7w4OJyz9wME3tPK5UmhOPrMNjW6Ml8Oio=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Qm4/3QAVHdYqvQChO98CEoFkC0+Ewn/oQwR6ECL6Qk8aYM0QN+G8HR+HEpzmD+glf
 wFFxxotM3EukM++Nx1JL4CtxgGJp8VtjGprpIuJecLSekC8mrZOofr37G/Fi1Wy1T/
 tbuhLy15xuMZzLaKIcTMy+HP3m/68gESf9oWgGR/3Im+f/N+PjfeUMILtKTttgActV
 IUrL5JH2d/FnNONIAdq25BE6Ui2FCGpMlaQGymi16/B+GbLAbVAEl/i7vfcE+8PpyG
 wGJEwZo7dOYdJgdlFA/XmfJIrAXuGoDSu40JtXF6wFT59bUb5aoZ8unbwefzAMa4bb
 OZKILAxt3ylhA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C9392C05FCE; Sat, 19 Feb 2022 01:12:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215622] WARNING: possible irq lock inversion dependency detected
Date: Sat, 19 Feb 2022 01:12:04 +0000
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
Message-ID: <bug-215622-206035-vJp8C6IfWT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215622-206035@https.bugzilla.kernel.org/>
References: <bug-215622-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215622

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300485
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300485&action=3Dedit
kernel .config (5.17-rc4, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
