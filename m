Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF414D47F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 14:20:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDqRy1FwNz3bTF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 00:20:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NAgVHPuf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NAgVHPuf; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDqRC2qtZz2yyf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 00:19:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83B17B82619
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 13:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3684EC340F3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 13:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646918370;
 bh=N+1jtDFZ6B5cSSBHhtLHyxj3cFO+u0Z+k9z2affX8XU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NAgVHPuf/5El1/NmKqL/+mtTTEf0sQxPTsneMy24/00Tn1g+4t5N8EeQBSthjeeQL
 hQIN6meWB3xcY746lt6M2Qvh1qGzZlFNPtdDm6Cv83Ub6H9UWzcUoEjUY2Ehb5a6lE
 uv1eczPQ0BHp37CipKhO0PnI5uLP41GVbYLPDwyR5vmpwoeom4E4LRMyW1+lctEAyD
 jD+ag43f5bGs75D/wTU0vPbK/XCjXJG8FOLZ8ok2NTSbZfX6IT70/apBuuU6UxFCjk
 vK/G8iONdAuzrFbRv58GCY8p4cghkKwRwFeffm2qIzehVGJe5BlC1pSOYdepdqE2B8
 OEqXVcKKKClVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 11890C05FD5; Thu, 10 Mar 2022 13:19:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215652] kernel 5.17-rc fail to load radeon DRM "modprobe:
 ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
 parameter (see dmesg)"
Date: Thu, 10 Mar 2022 13:19:29 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215652-206035-U1ru1mmnWK@https.bugzilla.kernel.org/>
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

--- Comment #8 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300550
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300550&action=3Dedit
kernel dmesg (kernel 5.17-rc7, CONFIG_DRM_RADEON=3Dm, Talos II)

Seems this is issue already fixed in -rc7.

v5.17-rc7 boots on the Talos II again with radeon drm loaded from disk with=
out
an initrd or firmware being built in.

Out of curiosity I'll do a bisect next week anyhow to check out which commit
fixed the issue.

But feel free to close here if it is not appropriate to hold this bug open =
any
longer.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
