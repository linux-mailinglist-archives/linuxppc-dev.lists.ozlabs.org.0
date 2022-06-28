Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCAF55F1BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 01:03:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXgBK3Lmmz3dvy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 09:03:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HuJUh1Jf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HuJUh1Jf;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXg9f6GyCz3blZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 09:03:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6AEA6B820D6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 23:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30112C341C8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 23:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656457379;
	bh=/XTtGTSqQEtOCRTMWGeBSUYiPJTTZudZtQk2ro6KFeY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HuJUh1JfZY53aTRQZWdK9XiWrO2DqKdCFCIn13p8NJs+ww7rZL0vnPOqhM7zfaycQ
	 4FHlYAzYZrL9EbFUgS2CagRggZErdyTA1qLSzuc9NiB/XfI084WNI7bWerM6PHcbQt
	 HdeWBI/LIBO24MVhMFamW7vBgqv2G/m24NpL+WDqtJn5XEbqVx5lpq01ZsI2/sC3cX
	 dYzcQy3EzpCQo7t0ri02ujMNibOoXKUhriyYE/NqMUSzMI3dyjRkW9p3OpFMm3yeYw
	 eo6TLNmol8oBoayFXgk4WKNFKwQWBs+QS8wVuY4pWI7Ja7uctLYgQwvopuq0Yl6nNe
	 mOgBW8BPlsVfw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1D989C05FD5; Tue, 28 Jun 2022 23:02:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Tue, 28 Jun 2022 23:02:58 +0000
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
Message-ID: <bug-215389-206035-3utmOt906c@https.bugzilla.kernel.org/>
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
 Attachment #300115|0                           |1
        is obsolete|                            |
 Attachment #300930|0                           |1
        is obsolete|                            |

--- Comment #29 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301303
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301303&action=3Dedit
kernel .config (5.19-rc4, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
