Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4273ABFC1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:49:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5f0X56kdz3c3f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 09:49:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pu0Uv3iQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pu0Uv3iQ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5f056L0Pz2ymZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 09:48:53 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id AAC6F6128B
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 23:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623973730;
 bh=FnjSK14Luik55SzMNqZ+mX0/IvxmfGS93ilKbS9cO50=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pu0Uv3iQISbaXZKFJm3GHSZ2Da17wfGjGum7ilTshgveZvGc/5aeSnRG/QBSIe8oP
 e0DgZ22dU7POSX/UJGmBuuhTd6en2Uj9auK3t4DVPZ8+C/Z34i+O0BqyVn14CYIVVD
 mHL46T0E0sZz1zWzZTXjbMSHtmkf/GBZ0fLI1hdl7EQ7Dtw4MXoisi2/sCLAxiL4UT
 gUiectQxV0VVHG9ZENh+eUO6HU3MRiDGWHo9XjxheVHe1L62wqsCt+MZgPenGwu8IU
 zFCt9y7NUPqCSPYH1MN3hKQR91mILddavnVwZeeb4IFUFqsvu+nE7RFKBkx1CVW63M
 7RArATpdznMag==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9BE1A61107; Thu, 17 Jun 2021 23:48:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213079] [bisected] IRQ problems and crashes on a PowerMac G5
 with 5.12.3
Date: Thu, 17 Jun 2021 23:48:50 +0000
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
Message-ID: <bug-213079-206035-gNsy0NvjR3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213079-206035@https.bugzilla.kernel.org/>
References: <bug-213079-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213079

--- Comment #7 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Oliver O'Halloran from comment #5)
> Could you add "debug" to the kernel command line and post the dmesg output
> for a boot with the patch applied and reverted?
Ok, on top of 5.13-rc6 I reverted fbbefb3, which went fine execpt the
"pci-ioda.c"-part where I needed to manually apple the old code.

Here's the vanilla debug dmesg and the debug dmesg with the patch reverted.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
