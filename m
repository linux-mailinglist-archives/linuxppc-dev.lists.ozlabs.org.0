Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E81804CB4F9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 03:39:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8FYg6Phqz3c29
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 13:39:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gBUNGB9j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gBUNGB9j; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8FXz13rGz30hR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 13:38:43 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 184FE61693
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 02:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E7F3C340F1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 02:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646275121;
 bh=+ghRiFCM//p2BaVQukkM16NfURGG+YaK6AY1pjULZ+k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gBUNGB9jfooN3M2qT94WEd/L2ePBL8rve0A/RudZQo5XsN60kuJ8CtS7xZF0KPPS1
 g7mP1J3nNX0scwpinqf4MryXOltod2m39S+3ExU6Jm+pEaf6UHoNfdHFRNyj4PEJDd
 HF1B4x9Bn77IdMWG3//ZeOW6rXLV+BY9Jyz/xVo4wzCLIH0HJHy/hRBrx/hy3ks8ck
 veexX0b5gyDVqjcATzfE5slqYRoqxDqv3O3+BRADI238NShdCB7T1iAJ0/2zsFajfa
 RHKML1O6KjCpErmvvHIAl9N2jYPysxxxJsNMUcwGX1jq0ZcobqECZC7frwQ5c6tlm9
 deMHC8wAZYYPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 68F14C05FE2; Thu,  3 Mar 2022 02:38:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215652] kernel 5.17-rc fail to load radeon DRM "modprobe:
 ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
 parameter (see dmesg)"
Date: Thu, 03 Mar 2022 02:38:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215652-206035-lDYUXWmNVj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215652-206035@https.bugzilla.kernel.org/>
References: <bug-215652-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215652

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #3 from Alex Deucher (alexdeucher@gmail.com) ---
If you are using an initrd, the firmware must be present on the initrd for =
the
driver to find it when it loads.  Please make sure the firmware is availabl=
e in
your initrd.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
