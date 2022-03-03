Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B81324CC2E5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 17:34:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8c5C5ybVz3c62
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 03:34:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A9PnHEn1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=A9PnHEn1; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8c4Q5FhXz3btr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Mar 2022 03:33:42 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65F6861186
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 16:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAE4CC340E9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 16:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646325219;
 bh=941bDWFrojtishsixUtgHjCbiY0hOPgA73A3CGVMGFQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=A9PnHEn1GvnOruqiZ+DJ/W0yEEPRoIR6qnOEC/rQQXBG+jQEXCE0Sd3ZHUMnBg9Hs
 kB4kGzQkbIFke85+JmThnaehQvQxK2953nwdi083FR/AR5p+bQlttTDFB8yeELoN7e
 XvqZQmdJ9GxGDU6u6+BamjDO4gUTEVOZEaaX9k86kgvoRAqX7WRsGbENWZRlh2yWMl
 8UT2XsbWIQT0xQQZ6egBfJ4DeNdOUz6WPq7YueP/6kqbtyevJD2tU3risq6kIgIuxJ
 i4Yd2z6tCDMeP7e9aj5y1HPq+mYNNkbvEVHv/apeOEF58osxsHdBC2KRsJX8Z8FTVi
 UM8bRPBKeLEcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B385BC05FD5; Thu,  3 Mar 2022 16:33:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215652] kernel 5.17-rc fail to load radeon DRM "modprobe:
 ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
 parameter (see dmesg)"
Date: Thu, 03 Mar 2022 16:33:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215652-206035-BRDDR7Ms6a@https.bugzilla.kernel.org/>
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

--- Comment #5 from Erhard F. (erhard_f@mailbox.org) ---
Ok, changed my config to include the firmware via
CONFIG_EXTRA_FIRMWARE=3D"radeon/R520_cp.bin"
CONFIG_EXTRA_FIRMWARE_DIR=3D"/lib/firmware"

With CONFIG_DRM_RADEON=3Dy the machine boots now as expected with no radeon=
 error
messages.

With CONFIG_DRM_RADEON=3Dm radeon does not load and I still get "modprobe: =
ERROR:
could not insert 'radeon': Unknown symbol in module, or unknown parameter (=
see
dmesg)" trying to load it manually via modprobe -v radeon.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
