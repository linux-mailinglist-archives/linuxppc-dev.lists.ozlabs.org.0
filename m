Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ACB460BAD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 01:32:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2RCD6n9Jz3bYW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 11:32:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pIi2m4UO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pIi2m4UO; 
 dkim-atps=neutral
X-Greylist: delayed 36707 seconds by postgrey-1.36 at boromir;
 Mon, 29 Nov 2021 11:32:17 AEDT
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2RBT2z3cz2yYS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 11:32:17 +1100 (AEDT)
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 848ED61027
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 00:32:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DEFD86069B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 00:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638145930;
 bh=VGeJPlnlNXAtOgSdl4fbdcY79RB/AHmFdkNOH8RIHxw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pIi2m4UOxZq7aRqDQLy0btBtH1pAqv/7PqbihRAYTBfqRnNvoI4OuwgpFs9ZDV7IN
 h3hXFNENKut2vVWpjgoVohSa8yLr5uYNG8W6M3+E/U6Kf3fPcRAnmz5Qq5JQwqF2VS
 pWlRbSdMR0O9FGfVhx6R+EuehKLuQHBbE0JexPyuJeBMH219mGoAoG3iKc3DTpIw6d
 Su/N+kMyatrW07EhYGp8uKkh10zgAFr3GqHOkdn9+potVQohxwM5nz8Wqd5Nvai6cD
 bbB3BAoUjwSJGC2EaS2Mw55Gjqm50PGAQ/NiQB7Vyv45eW0t9aj3yuQOxZ9ZHXQZFY
 c1DwUO/hykccA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BF84D60F46; Mon, 29 Nov 2021 00:32:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205099] KASAN hit at raid6_pq: BUG: Unable to handle kernel
 data access at 0x00f0fd0d
Date: Mon, 29 Nov 2021 00:32:10 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-205099-206035-NF40tAaYCz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205099-206035@https.bugzilla.kernel.org/>
References: <bug-205099-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205099

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #299711|0                           |1
        is obsolete|                            |

--- Comment #41 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 299759
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299759&action=3Dedit
dmesg (5.15.5, OUTLINE KASAN, LOWMEM_SIZE=3D0x28000000, PowerMac G4 DP)

Ok, finally getting somewhere.. With CONFIG_LOWMEM_SIZE=3D0x28000000 I don'=
t get
this "vmap allocation for size 33562624 failed" error and also OUTLINE KASAN
does not show the originally reported "BUG: Unable to handle kernel data ac=
cess
at 0x00f0fd0d" for raid6_pq!

For INLINE KASAN I still get "vmap allocation for size 33562624 failed", ev=
en
with CONFIG_LOWMEM_SIZE=3D0x28000000 or CONFIG_LOWMEM_SIZE=3D0x20000000.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
