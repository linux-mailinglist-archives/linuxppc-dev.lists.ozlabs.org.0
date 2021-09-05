Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EECCE40101C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Sep 2021 16:16:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H2YVN5ybkz2yn3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 00:16:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MyJ4cp7B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MyJ4cp7B; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H2YTb3P7Dz2xfH
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Sep 2021 00:15:31 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 958EA60F22
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Sep 2021 14:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630851328;
 bh=ZpvuFLbYqBi07U2MaRyDOw2WcZ98eJfI1Z5v6+iBniQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MyJ4cp7BbiqH2EleA1P8HjvY0OnUzZR1xG38BLb0gczviRnsBDYk837YZguUD3Rzc
 Wv2N0IXqsW30F2qgPkDI9eyZNrH8ExSoZwh4moRqTI1u4whpinLTbtuH9UC+2Mifd5
 ZYLeQ5qC531d3IPiZ4KQc1s6zPKE/RlQJSgojZGeQ8eK+vQJQq+C9gWV2EMc/KlQeN
 zLp8LguyW2zfyjvWoJQlkRsmPU9FX/xxOy8ooYXGcfhX6YJGbI2LVtv4EG/GHS3tOF
 T2pW9NizFOxBRZPAP5VQRARHYOWRR6XELekcvkkDEqYGhUw/KyHvuBdU7yeVFol7X8
 3d+2N4Gox33sg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8BC1E60F6E; Sun,  5 Sep 2021 14:15:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] "Kernel panic - not syncing: corrupted stack end
 detected inside scheduler" at building via distcc on a G5
Date: Sun, 05 Sep 2021 14:15:28 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-213837-206035-GMMPBbfiGF@https.bugzilla.kernel.org/>
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

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #298395|0                           |1
        is obsolete|                            |

--- Comment #5 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298671
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298671&action=3Dedit
kernel .config (5.14.1, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
