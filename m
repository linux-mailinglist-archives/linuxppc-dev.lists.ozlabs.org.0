Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 207115A03BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 00:07:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCgF76Hvkz3cd6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 08:07:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=foDDbWbP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=foDDbWbP;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCgDF4bq9z3c4h
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 08:06:37 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DBE6BB8262B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 22:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA045C433D6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 22:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661378790;
	bh=NpFO7XElbfZXWxXR5d9qzZ9rFaht3YTq5gOuW++lCiE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=foDDbWbPdam6GI5lgLt1KH/OAvyztvJ3WvNcyu617acyXTC5IKp9BGt4wl0UIydjM
	 U+u/Fexc7Ah0etqxUsbDv/BFXLlY+2lGaoH5dNugdb8t3KB8fffdGasvCd2UHe87yB
	 lCv/IChE/6dameqvMRI+aHLlsEZpcItsfmGk8lBXj6ngLtQIxH8lKrUig3pxdy5pyX
	 Or8i1VgQZEHHTd6X25jLNRgzrmdwYWakDbMucnhzUGDa0n3F+WNuGAhCLrG1R/kyV3
	 yK1Km9xuVYT6kT2DUBN2QoLjShKyle0yryNNth1yb+AGa3pagRci0GFB8d6U5IcGzZ
	 clEkAnulzOhfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 96C2FC433E4; Wed, 24 Aug 2022 22:06:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216410] WARNING: inconsistent lock state, "inconsistent
 {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage" at boot
Date: Wed, 24 Aug 2022 22:06:30 +0000
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
Message-ID: <bug-216410-206035-jRcsgXqjLY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216410-206035@https.bugzilla.kernel.org/>
References: <bug-216410-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216410

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301650
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301650&action=3Dedit
kernel .config (6.0-rc2, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
