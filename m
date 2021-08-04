Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E811A3E090D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 21:55:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg2Xt5bqDz3cX6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 05:55:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j6baVOWj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j6baVOWj; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg2XR3Zccz2xfy
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 05:55:19 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0B8D560EE7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 19:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628106917;
 bh=/4Qbzf1nkUEwLLXEyLe/WgnHfg7ek3WCUAEfa+5joMg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=j6baVOWjbNWMmO0KpphQ+tpLCvyFAoLeD5eOP+F6lU1kVfYDToW0kj/k/jUNi3i9K
 3+WeATdxVsI3VBMEPgU4niBAAGF5gAe5G8JEVHdVyzEQdZiOfSGkC6j0xH1PuvfP+Z
 uJl7r1cuN8UsQFz9yS1qsmbGcBkLKtOlqa9LOvKMmbwo589i7V+A36P58/7suPWTn5
 4NfwjN7aUHilfC7446OELjH2gaId4z5oKnroEpk0Ms+yuDy919Gzd3WzZyak8WfM7E
 1pD/RHCo26J6mVclSRGUXAcBqOMaQMzewtgaGRmH6ABXfdFlSUujYNlOOA3fX3npOe
 8R9zEjB2u3viQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0344E603BE; Wed,  4 Aug 2021 19:55:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213961] Oops while loading radeon driver
Date: Wed, 04 Aug 2021 19:55:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: riesebie@lxtec.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213961-206035-ldI0WueUMX@https.bugzilla.kernel.org/>
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

--- Comment #7 from Elimar Riesebieter (riesebie@lxtec.de) ---
Created attachment 298205
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298205&action=3Dedit
dmesg dump with KALLSYMS enabled

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
