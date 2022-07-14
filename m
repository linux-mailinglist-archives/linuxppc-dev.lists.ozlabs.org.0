Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F274F574E74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 14:58:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkF0C68jHz3cFr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 22:58:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=siPI/B1b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=siPI/B1b;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkDzW0883z3bsQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 22:57:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF13961F62
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 12:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BACEC34114
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 12:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657803442;
	bh=c/w3xjFhDhm4mjnCKkHwiM9nc8SOZS6mM0lnRoJhHvQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=siPI/B1bsUZs7VAdoHMqxNhKK53bPlyKqVirvhoXgkg6lpF5iMPrChhNyyr4eWE27
	 vDSiPKNpkD7GYd4f18sfgqBT/2dXT7Khq/HT21CZUpguX9BU8N82oNEnTvaOGNklJb
	 sg2aKQUk6HMnxYzaAtCsHcaJYvUdF4yp5YK6J7wApgYrArwNqgoLh9MDGA2QbXgs1M
	 TkcmSFOXgN4YZjht5K1hnoZsc/Rit/FBxON1+bngbK0kq6O2Ttj+eylNXn88ESzc5j
	 sWk5R1W6kIdnae8Xq9ljWhqID4mn2Ifd6mXRhsiZaPvNKgCvA27xFu5jDSpg6fWGey
	 D303ZF/kLQKEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1997BC05FD2; Thu, 14 Jul 2022 12:57:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216183] [bisected] Kernel 5.19-rc4 boots ok with
 CONFIG_PPC_RADIX_MMU=y but fails to boot with CONFIG_PPC_HASH_MMU_NATIVE=y
Date: Thu, 14 Jul 2022 12:57:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216183-206035-7VD7cQX48R@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216183-206035@https.bugzilla.kernel.org/>
References: <bug-216183-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216183

--- Comment #8 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301425
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301425&action=3Dedit
bisect.log

Successfully did a bisect which revealed this commit:

 # git bisect good
a008f8f9fd67ffb13d906ef4ea6235a3d62dfdb6 is the first bad commit
commit a008f8f9fd67ffb13d906ef4ea6235a3d62dfdb6
Author: Nicholas Piggin <npiggin@gmail.com>
Date:   Sat Jan 30 23:08:41 2021 +1000

    powerpc/64s/hash: improve context tracking of hash faults

    This moves the 64s/hash context tracking from hash_page_mm() to
    __do_hash_fault(), so it's no longer called by OCXL / SPU
    accelerators, which was certainly the wrong thing to be doing,
    because those callers are not low level interrupt handlers, so
    should have entered a kernel context tracking already.

    Then remain in kernel context for the duration of the fault,
    rather than enter/exit for the hash fault then enter/exit for
    the page fault, which is pointless.

    Even still, calling exception_enter/exit in __do_hash_fault seems
    questionable because that's touching per-cpu variables, tracing,
    etc., which might have been interrupted by this hash fault or
    themselves cause hash faults. But maybe I miss something because
    hash_page_mm very deliberately calls trace_hash_fault too, for
    example. So for now go with it, it's no worse than before, in this
    regard.

    Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
    Link: https://lore.kernel.org/r/20210130130852.2952424-32-npiggin@gmail=
.com

 arch/powerpc/include/asm/bug.h        |  1 +
 arch/powerpc/mm/book3s64/hash_utils.c |  7 ++++---
 arch/powerpc/mm/fault.c               | 39 +++++++++++++++++++++++++------=
----
 3 files changed, 33 insertions(+), 14 deletions(-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
