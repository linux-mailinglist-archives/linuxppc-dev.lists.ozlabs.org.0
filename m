Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 141443D413C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 22:01:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWgFH6kLfz3cnV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jul 2021 06:01:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZMr+NUTB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZMr+NUTB; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWgDs57D9z30FR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jul 2021 06:01:17 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8E38F60F25
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jul 2021 20:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627070475;
 bh=2qgOjnUGJULLCpcQGZvkrjHzmYTpnrQ/BQRkUCuYh5I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZMr+NUTBajDSEToW/g9kbAKe6S+WAUFwaFb1VNFCrTYz0TNqHHOkYiwyb8As/F3hJ
 vTnYV839CqiTL6p5PJ/os3YYb5qfFUYvMnn66ds/Xe5nu+51dXyU9bbDMVMCARVoDk
 gXwP1/lU1bDrukuR0DFqdeqhtZUoUSvEv8qi/UiNYTLbqM/KUg1USJaATPVFfkVo+b
 tElHtv7BUm1+1Fe7UmGHazctScpprUju2ztnHGOtcLpKgZOn9e9vwqe8HlbV4naZ7A
 nDXs+X+CKoZ4acyEBk+GJ0yDf0cOK/FcSnik4wUxdX3bbPMTgTpFcKYWhlhnuJAVGC
 i0A44I721D1uw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8B43660698; Fri, 23 Jul 2021 20:01:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] "Kernel panic - not syncing: corrupted stack end
 detected inside scheduler" at building via distcc on a G5
Date: Fri, 23 Jul 2021 20:01:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Memory Management
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: akpm@linux-foundation.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213837-206035-pQI29BYrfv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213837-206035@https.bugzilla.kernel.org/>
References: <bug-213837-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213837

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298019
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298019&action=3Dedit
kernel .config (5.13.4, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
