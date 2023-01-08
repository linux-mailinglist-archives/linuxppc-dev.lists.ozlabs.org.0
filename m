Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D79661600
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 15:59:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqgGC5x04z3cCW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 01:59:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ne0M9Wfr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ne0M9Wfr;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NqgFG62bqz3c6C
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 01:58:42 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6C1E9B808D2
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 14:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28C9CC433EF
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 14:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673189918;
	bh=hBJRinD0O4KSLwROmflENuHKPU2F0YomjvGrizAkbs8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ne0M9WfrEWxgKrX2/HIrVCrML0+YyOlQ9xKK8TTSg/ANibZC/o38EHfKpcV5PPmkQ
	 gbKgmyts69IBmkCbweRYqC6FsEDndrlSazKccLQNJykPxRwD5GomXCkqiwUC0q8UAi
	 vhChiC2ggnVmp9aOJCG2qtMMiGT81/KhizK1bUEooJKKUZ77obSMADlPmGwzUARe3A
	 UwWuU1NkuIBo/aM0iop0XmnP7Ve+cxeNfwLm6R43MJ3RkEHrv8IFxscGxaDLJYBcKg
	 XDCI8U1jSn4MKRJEerdZ577z+iKremJkg+/bEvKtxy0NnA8jrQzLb3M1IZNnAGZQkw
	 uKIcAy1m4b4Ug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0E074C43142; Sun,  8 Jan 2023 14:58:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216095] sysfs: cannot create duplicate filename
 '/devices/platform/of-display'
Date: Sun, 08 Jan 2023 14:58:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216095-206035-ZMWlzciw4a@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216095-206035@https.bugzilla.kernel.org/>
References: <bug-216095-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216095

--- Comment #10 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303553
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303553&action=3Dedit
device tree -  PowerMac G4 3,6 DP

(In reply to Michal Such=C3=A1nek from comment #9)
> Could you also attach the devicetree?
>=20
> dtc -I fs -O dts /proc/device-tree > device-tree.dts
Sorry for the delay, I overlooked your post!

I needed to force the output but otherwise it seemed to work fine:
# dtc -f -I fs -O dts /proc/device-tree > PowerMac-G4_3,6_device-tree.dts
<stdout>: ERROR (property_name_chars): /options:prev-lang:kbd: Bad character
':' in property=20
Warning: Input tree has errors, output forced

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
