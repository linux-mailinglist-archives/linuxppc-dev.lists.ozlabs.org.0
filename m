Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8077D8C48
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 01:41:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nR/uqBgB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGj4Z5wlnz3cQg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 10:41:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nR/uqBgB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGj3j3vqBz2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 10:41:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0F1A4B83925
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 23:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67D93C433C7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 23:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698363660;
	bh=03Fu2eSL0z29EYHCTCdlct/1qkrI8LKpknlTtRSJMQ0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nR/uqBgBf24w1PAOk9NtTrzPiYX+SfsEGTNhTQE2Jzdl2uF1e1NXrtLo1lbYEhQ0w
	 ftp/sOPQTCfm7B8WFThXsB3rojy3AF0y6OHS/NCZ1tENcdpoJNyK0GA0B2X9/cfEjf
	 T8YBzrPYg7XhAm1LkYw027mZUqZ2Rp/RilqzpGIcGPkp4BUc7lRA24jIgGJ12q6kP2
	 WxcKvuuJyRYnYqDjYtZV+lgd5fnsxkna/1TQ3C+ANsFhQzS5bl3iscae81dFa4zMYW
	 mNRqU37mkmHJ7//GENUdoNYLCM2AopLNIveoxymKjKUXFdBnjbTqflQPWonFaLn8Yr
	 zdmyE4El/faZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 47CE2C4332E; Thu, 26 Oct 2023 23:41:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Thu, 26 Oct 2023 23:40:59 +0000
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
Message-ID: <bug-215389-206035-fZuJVkwTi0@https.bugzilla.kernel.org/>
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
 Attachment #300354|0                           |1
        is obsolete|                            |
 Attachment #300977|0                           |1
        is obsolete|                            |
 Attachment #301337|0                           |1
        is obsolete|                            |
 Attachment #301639|0                           |1
        is obsolete|                            |

--- Comment #40 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 305297
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305297&action=3Dedit
dmesg (5.5-rc5, PowerMac G4 DP)

Re-visiting this bug as it's reproducible on v6.6-rc7.

This time I tried the other way round. CONFIG_VMAP_STACK was added for ppc =
with
commit cd08f109e26231b279bcc0388428afcac6408ec6 (at about kernel v5.5-rc5
time). So I did a git checkout cd08f109e26231b279bcc0388428afcac6408ec6 and
started from there with a further reduced kernel .config.

I added two additional patches to get the G4 to boot with VMAP_STACK enable=
d:
4119622 "powerpc/32s: Fix kasan_early_hash_table() for CONFIG_VMAP_STACK" a=
nd
232ca1e "powerpc/32s: Fix DSI and ISI exceptions for CONFIG_VMAP_STACK".

Then I burdened the memory subsystem with "stress -c 2 --vm 2 --vm-bytes 89=
6M"
as before and hit the issue in less than 20 sec. Not hitting the issue mean=
s my
G4 runs "stress -c 2 --vm 2 --vm-bytes 896M" for about half an hour without
side effects.

So it looks like the issue was here from the start when CONFIG_VMAP_STACK w=
as
added for ppc. (see dmesg)

I don't hit the issue when:
   1. nr_cpus=3D1 is set + VMAP_STACK enabled
   2. VMAP_STACK disabled

Setting LOWMEM_SIZE to 0x28000000 does not seem to have an effect on it.


This bug really plays hard to get... T'll do further KCSAN checks in recent
kernels and open separate issues if KCSAN digs up something useful.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
