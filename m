Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E183817A3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 12:21:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fj1dH13Ryz3bTv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 20:21:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KlUSbh7X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KlUSbh7X; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fj1cn3r4kz2xyC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 20:20:41 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 84332613ED
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 10:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621074038;
 bh=Fd5xrJQ6VIPyVEKzRKvpXOg+Gjet7mwqDnrFMPRIFeQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KlUSbh7XAdjYUj1IuN4nfttkEpGhR/ubcMeXtL5P/iBz0jNbhx+JbimOl2FcjcmyV
 lj8J61oGegZ/X3OhC/cy46U/kT2b/KJsVJkgsIIkcv555OjzSdMv4wHiKIThTWbUDs
 +DKAi75fpG3M79+y4CdHhLr3V4zTjVRNIPNcxaSq2XNI+r/fmQCTkuTjMlh1PjhU5v
 SIqo2dTVX4KH4ZmBBKyl9x9Xd3q0n25697z0yovrdcIFDqm5bq8omB4hBfkhzrggGM
 NIreIHzzEbL+Ka29q9Tb+Z3qZL3xLEwi30215K37boKPTTaE5SIxcPHZgYInc8YAG9
 4Ptj9zi+z4V1A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 729DD61026; Sat, 15 May 2021 10:20:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213069] kernel BUG at
 arch/powerpc/include/asm/book3s/64/hash-4k.h:147! Oops: Exception in kernel
 mode, sig: 5 [#1]
Date: Sat, 15 May 2021 10:20:38 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213069-206035-ypXNsIZBVl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213069-206035@https.bugzilla.kernel.org/>
References: <bug-213069-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213069

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
The bug occurs with DEBUG_VM_PGTABLE=3Dy. When DEBUG_VM_PGTABLE is not set =
the
kernel boots fine.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
