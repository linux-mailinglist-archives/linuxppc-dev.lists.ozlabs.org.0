Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E4C462113
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 20:52:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2wxR5DxZz3c85
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 06:52:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sBefbYpy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sBefbYpy; 
 dkim-atps=neutral
X-Greylist: delayed 342 seconds by postgrey-1.36 at boromir;
 Tue, 30 Nov 2021 06:52:06 AEDT
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2wwk51Lcz2ybD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 06:52:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2340ECE12FD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 19:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 542BFC53FCD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 19:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638215180;
 bh=sXU8rVEat2HfPhVar9iDJjqSB+NXtwo9srCpCexT94U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sBefbYpyJoi979+Zz1l0N6vZe1wjEzXL+jQ3ZAH37sJASKoz8YTP5Q8D+VaoT64bn
 ejWM1Jm7JxLAPxt4X+Z4BL92G5Hx1OJLVfhVpUldOvI8VkY82wZlBC0kf/jf0WQXpd
 SnzfBh4TmcM+9ygi4E404fPQVBqJLY0diXGNcMhoIkdFlCn64hECRV7xz+M/biClqJ
 TOjVsJkP2YJTQuQygzxDfmCXoCdbnskfNANVXDoKR0y5Z89tTcAOIkRaOekaO/AnTZ
 B+cxvJGgWxFT4nY5BlHcAvvTcEH1SPucxc6TnVCcXIa3TfmlM3gVUPHQECqgWWWjgz
 k+55MEhWyeAZA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2DDE560E90; Mon, 29 Nov 2021 19:46:20 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205099] KASAN hit at raid6_pq: BUG: Unable to handle kernel
 data access at 0x00f0fd0d
Date: Mon, 29 Nov 2021 19:46:19 +0000
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
Message-ID: <bug-205099-206035-AMS4xgli6C@https.bugzilla.kernel.org/>
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

--- Comment #45 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 299773
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299773&action=3Dedit
kernel_page_tables (5.15.5, OUTLINE KASAN, LOWMEM_SIZE=3D0x30000000, PowerM=
ac G4
DP)

Ah yes, I forgot about including the /sys/kernel/debug/kernel_page_tables..
Sorry! Here you are.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
