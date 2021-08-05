Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 681C23E0FD6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 10:04:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgLjw1xwRz3d89
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 18:04:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E6nmmWhp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E6nmmWhp; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgLjS0v51z2xKM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 18:04:11 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id DB40A61040
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 08:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628150648;
 bh=XAUVV8mo4WeQs5eiz27eP9oJ+utUVxwI7TPzS6dv0sQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=E6nmmWhpXXuL4/076qXbxv5HWK7DkT1PaaSIhNeHjIDfvq/GwBM/vteCia5vfgaPZ
 o5D0BRPwwArDQPEurvCyPSTimGTtYobVn80vS+2JUKBkuKDEftdl+MsjU6muHKlipf
 FM1rJcNjjL3CDhqyy9rUmE+AqGupZT67r2XjM9JjRgLGul43PVCwC+60I1ZJwD+Xll
 CEf6+g2rT1ncfY5tLWf930LBQRqcWxydljrSt7LGYbh2OZZdor/RdMc2PpXUhIZeSW
 0h1uCWWpk6vF5pPa+DOGELLE2e5U3L3UQC/79mv5V2ndBcEfr8hp+kCKE7LCsOb9H1
 Io8O2MA0Gv5cA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C9C0960F36; Thu,  5 Aug 2021 08:04:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213961] Oops while loading radeon driver
Date: Thu, 05 Aug 2021 08:04:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213961-206035-BcDapI0Wat@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213961-206035@https.bugzilla.kernel.org/>
References: <bug-213961-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213961

--- Comment #8 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
Great:

[   15.246367] NIP [bea42a80] radeon_agp_head_init+0x1c/0xf8 [radeon]
[   15.246969] LR [bea39860] radeon_driver_load_kms+0x1bc/0x1f4 [radeon]
[   15.247160] Call Trace:
[   15.247168] [f2b75c30] [c0c1ec60] 0xc0c1ec60 (unreliable)
[   15.247180] [f2b75c50] [bea39860] radeon_driver_load_kms+0x1bc/0x1f4
[radeon]
[   15.247343] [f2b75c80] [be8cc74c] drm_dev_register+0x10c/0x268 [drm]
[   15.247718] [f2b75cb0] [bea36484] radeon_pci_probe+0x108/0x190 [radeon]
[   15.248001] [f2b75cd0] [c03832fc] pci_device_probe+0xf4/0x1a4

So we now know we have a NULL pointer dereference in radeon_agp_head_init().

Looks like all this code is quite recent, at least there are recent
modification, so I think you should address it with RADEON people, I'm not =
sure
the problem is a PPC32 subject.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
