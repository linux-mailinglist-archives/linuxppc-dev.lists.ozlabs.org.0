Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA143C8B61
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 21:03:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQ6NG27PBz3bjs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 05:03:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q09dgLOy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q09dgLOy; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQ6Mr2Nj0z2xv2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 05:03:04 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 726CA613AB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 19:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626289381;
 bh=AR7vSG1hQ4kiZ3ZbevlddCJdOdaqFKluht8tGDpLKps=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Q09dgLOyA4yzH+h5ZQdjT1VAlIUjqoen78yddpYVSlkpbUbjHzK1LdqqoWGJB0in9
 ILR5jfe8mrGTPkgq+FgG322YM5eN85WjBch2loben6AFYoF9CMQe3lX6hppXDHwzmh
 SoX7pD2HKSJcm7JR6VFTFEVTfBnktXiLQBySrBfEU9dFpOXRLAQ0t/u9Jl0/3P9U5g
 3dmN+DMjlx8DR8f6yyrS9ZCrOdVJQtF5lld3xEE3mtiz5VToloPTzJ4sLyrAm4Mora
 HNXc10gd/cMLk90QrlMuKIjVpc3bk+7MHt598pP4OUk25DrMig86cPk+roKTRjIxFG
 Bf0Rrv09qB/bA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5DB6461287; Wed, 14 Jul 2021 19:03:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 210749] sysfs: cannot create duplicate filename
 '/bus/nvmem/devices/module-vpd'
Date: Wed, 14 Jul 2021 19:03:01 +0000
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
Message-ID: <bug-210749-206035-ZRpxkiDQGe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210749-206035@https.bugzilla.kernel.org/>
References: <bug-210749-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210749

--- Comment #9 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 297867
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297867&action=3Dedit
dmesg (kernel 5.14-rc1 w. 61f764c307f6, 4e302c3b568e reverted, Talos II)

Yes, I can confirm reverting 61f764c307f6 and 4e302c3b568e works. Tested on
kernel 5.14-rc1.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
