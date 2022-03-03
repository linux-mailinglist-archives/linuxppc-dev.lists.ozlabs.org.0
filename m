Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E5C4CC45F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 18:49:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8dmG5pKrz3cTV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 04:49:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MbWYIbsB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MbWYIbsB; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8dlW2hy4z3byT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Mar 2022 04:49:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BDB1261919
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 17:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AFF6C340EF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 17:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646329749;
 bh=8iGZLFSlUei59uw5L9lHGqICvkHLryj4K1OQ9F2lCrY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MbWYIbsBENC12Ssm9ImKnbdsSvNKLPuJW+7qQp0G8qUAPddvAdyxrNNa+BsVPYtSz
 7s+d2G5c4y2PjmPRMEObWnnwqkwi0EfSZHqrvAZaQTu1+2PCadh6FreX/lh/0eketh
 KkHM75b3ozOzAUryb2Bh1jcG7MVgV92DgBuiy0cgWXQuKzpWQkoFjTd63j+HAbCycF
 WceQNM5CNnpseisRZWyUIwoipZHKO8LsVrJqoCT5WgLuUPLhOKZzaUUhNfzOO58Dt9
 8s7gi5DgqUGGiuBOH3km0bA4uFIJsvTmXmldPDTN9U352PGqOjE+u3ANwj4Ta/bcwL
 JX14ZvvwJBeQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 17623C05FD5; Thu,  3 Mar 2022 17:49:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215652] kernel 5.17-rc fail to load radeon DRM "modprobe:
 ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
 parameter (see dmesg)"
Date: Thu, 03 Mar 2022 17:49:08 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215652-206035-cd18BsvQjv@https.bugzilla.kernel.org/>
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

--- Comment #6 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Erhard F. from comment #5)
>=20
> With CONFIG_DRM_RADEON=3Dm radeon does not load and I still get "modprobe:
> ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
> parameter (see dmesg)" trying to load it manually via modprobe -v radeon.

You need to make sure the firmware is in your initrd.  When the kernel load=
s,
it loads from the initrd.  There is no filesystem mounted yet when the rade=
on
driver is loaded so the firmwares need to be in the initrd.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
