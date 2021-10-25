Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7EB4391AD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 10:46:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hd7pG19lpz2ywV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 19:45:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mEMpep+z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mEMpep+z; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hd7nY4LPCz2xX4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 19:45:21 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id C12FC60555
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635151518;
 bh=rg5yl5aUXTHdUXlSSMPgS8Dg5nTLI4/zi5iflR4qhtQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mEMpep+zdh1ZzVQTzky2KId7O4BSDCttc/DPDskZOi18zpnVfA+TTKQ4wHcFcDNPf
 FS5JBMHiplA70qZixYabkt53AywSwqEz7/YaQuHT2hjPPvr1ttq5zXyOEAFQdzlGxv
 qR799SPDdWE/8HH8FY5puGFr/8Dbs/Vrc9pKNcBvZMpQ2zqAp2qX240YfayLNNmMLB
 ghD73HcUg/R1qNVPvOfeggkQVO8t5lm3DfhJkrQy7N3GC86g8QrjGsUKDfhQbLXMcs
 tIX7iNp4tpjj2vrgA0HWKjrTc8ymV1eW5ZXXuj3vgDrh1y7dGugPoHUW2WGakvbDah
 oQNpSXwK2PNRQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B41FC60F90; Mon, 25 Oct 2021 08:45:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206669] Little-endian kernel crashing on POWER8 on heavy
 big-endian PowerKVM load
Date: Mon, 25 Oct 2021 08:45:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: glaubitz@physik.fu-berlin.de
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206669-206035-2jxRfl5Fht@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206669-206035@https.bugzilla.kernel.org/>
References: <bug-206669-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206669

--- Comment #18 from John Paul Adrian Glaubitz (glaubitz@physik.fu-berlin.d=
e) ---
There seems to be a related discussion:

> https://yhbt.net/lore/all/20200831091523.GC29521@kitsune.suse.cz/T/

This suspects 10d91611f426d4bafd2a83d966c36da811b2f7ad to be the cause:

>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D10d91611f426d4bafd2a83d966c36da811b2f7ad

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
