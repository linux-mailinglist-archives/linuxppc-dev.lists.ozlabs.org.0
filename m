Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5F262A190
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 19:50:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBZy72y3mz3cNG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 05:50:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ko2lkeAL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ko2lkeAL;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBZx8584Fz3bXR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 05:50:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 64614B81722
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 18:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15ACEC433D6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 18:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668538198;
	bh=VL55bA3AqALugN2AbHd/pw60QjhNGBnjs1BRfifszzk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ko2lkeALv/7nsmPtgtoslr6KoWMb58aFvtVIA5l4vyxgpgbd1qOt6OgUpef8OOx9/
	 ns+gW99Gtcc0nbaNm1kH9luqrZFg2egw2dihOqy+DqgfS/XewHjfT92m+AAOgPsBNE
	 Uok9QcDS6OD0p7ARxl02v/AUAwh42TAZvM/WUYlAgXCme48P+XZIDKG40QY5hz8p5m
	 uSrcc9sxifbuZ8dv7RgQX2Tzjq0yjaEyz4s1LQxLcaSniROKxu4p9SlGk8uYwyLNrd
	 gY4pFR2mTUS3SyULJ6zWjI8lB4YLsUAN4q8oamVF6NfE/OlcIYeULEuZk2OXAxW/tk
	 tPWplFSkXAaFg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 02310C433E6; Tue, 15 Nov 2022 18:49:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215862] clang-15 fails ppc64 BE kernel build - ld.lld: error:
 undefined symbol: .early_setup
Date: Tue, 15 Nov 2022 18:49:57 +0000
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
Message-ID: <bug-215862-206035-XUogHXc7ja@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215862-206035@https.bugzilla.kernel.org/>
References: <bug-215862-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215862

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303185
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303185&action=3Dedit
kernel .config (6.1-rc5, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
