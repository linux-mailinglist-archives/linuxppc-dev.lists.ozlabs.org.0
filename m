Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C333C8D4B90
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 14:26:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bk07Y8Fs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vqlpc0S0nz3cV1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 22:26:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bk07Y8Fs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vqlnv1nyXz3cSX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 22:25:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE47C6271F
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 12:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F29BC32786
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 12:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717071919;
	bh=b1TrAR2tlzrubt9mxc68WNTvuuUQOtATuasZSxg0q5w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Bk07Y8Fsh8BpQXxJZVvGhTfu68TvKlTZG/IqdIdKNyxuRcPj3fnveLEUKEsUy6hGE
	 BNjY4dCHx8Ug5+x+OH/0D58xOldNyS7ctR3izO3kg9EZhGSELB+kWwgIuK1UWdQCRY
	 C0CcSpzdDP06YFLD8QUxS+skKA6VPOm2UoMbNowqkm0/acaT5hmBVC8iL5ae0WEAr8
	 HadQOTUdr8shdvEubKNmuFWgppylKJSPRIS41iEesRSyv30qLDvlzah07YUjgimfUL
	 WhFOS//2tt1B3RjP0LogC/Rao4lkXAliK9BWuluBtTGkx/ZVroDv4ixWDDeFv4v6jn
	 uk0K3CGoog1ig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 54B7BC53B50; Thu, 30 May 2024 12:25:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 218905] scsi_alloc_sdev: Allocation failure during SCSI
 scanning, some SCSI devices might not be configured
Date: Thu, 30 May 2024 12:25:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component version assigned_to product
Message-ID: <bug-218905-206035-yUmRbXQuwQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218905-206035@https.bugzilla.kernel.org/>
References: <bug-218905-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218905

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michael@ellerman.id.au
          Component|Kernel                      |PPC-64
            Version|unspecified                 |2.5
           Assignee|linux-kernel@kernel-bugs.ke |platform_ppc-64@kernel-bugs
                   |rnel.org                    |.osdl.org
            Product|Linux                       |Platform Specific/Hardware

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
