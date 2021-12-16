Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2642A476903
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 05:12:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDzHF05FHz3cG5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 15:12:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q6wpoDeY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q6wpoDeY; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDzGR4mrCz2yph
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 15:12:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 051C7B82285
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 04:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCABEC36AE0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 04:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639627930;
 bh=r7GmTc28gSgrur8kdyHV+oM/P0YJDtIt35H++D++izE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=q6wpoDeY7KO/xbztev3wIgZ6/Uoyp/scR6MvryXxRNdKfHYlyy2ninvucZBssx8Dj
 RG7bZIIFQlLkaDMYTxz8hjMmiU4y+MTifcxqXCIOyKxYbpcqgf5V0zXpY1Sb0Kw78Z
 mG0acefgOS5t1b/Qth7j8Iewy/jH4TwxZCqKxGddr23kE7Hk10Co6YiU6k/dVm6Tzs
 FcdCIBxO9p54+m/XKi7aTrFAlZgzadplDKriMa/DMAMPMiwleD10LB2OLmmi8GZMOA
 mXnELOg6S/ztqiPSW3c4av6nNPByjZEpzny6oDBGZJYow2wlGTarwREpEPfe7rW+3l
 eKCfEaOrhg+RA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A3CFC60F14; Thu, 16 Dec 2021 04:12:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215285] power9 le: amdgpu: *ERROR* hw_init of IP block <psp>
 failed -22
Date: Thu, 16 Dec 2021 04:12:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sid@aeam.us
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215285-206035-B7kW4SseM2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215285-206035@https.bugzilla.kernel.org/>
References: <bug-215285-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215285

--- Comment #1 from R0b0t1 (sid@aeam.us) ---
Probable cause: missing dependencies (https://bugs.gentoo.org/736994).
For PPC64, unsure of fix, see https://bugs.gentoo.org/829209 -- is there re=
ally
a hard dependency on X86_64 and ACPI?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
