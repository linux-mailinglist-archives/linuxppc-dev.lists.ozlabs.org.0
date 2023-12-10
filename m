Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6274380B892
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Dec 2023 04:40:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W5M9+psl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SnrH96VsYz3cXd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Dec 2023 14:40:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W5M9+psl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SnrGK2bc5z3bx0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Dec 2023 14:39:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E366DB80818;
	Sun, 10 Dec 2023 03:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D852C433C8;
	Sun, 10 Dec 2023 03:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702179553;
	bh=wrRfiJWMsLbF8VsfJ8VHxgmbslN/LBSjb08315byVMw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=W5M9+pslJeDXje9aa0egifk+eSuIurft14HF2S4jJwGEcH552uajiQf4lXT5DbbfR
	 pUJD2oLEV2Fjpg2HEJUoiZ/JEpNzi1S1WEGsCVBFRXwWfEu+jc6nmJSANtr0ZyPQzA
	 Mw2R1Sy6IllQLgqDK7LktKv/K0uEbOg/dr5wTZ34dRYnTtqq6J2G/+FHEgedUnpdJC
	 5Gcwwx1fzFz/wmURGVefEP4sutTBd1OqinxOPMXN+hpX/GWLQa3wZy2Bo1FjM3cTEj
	 LIayXXCjb7brgyHK4DY4EeCXHa/Z+iR1jAvdbDpzLkwRjy6teeJj0U14iFA0/vmbDT
	 3hl3Dtial9Rng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 46604C04DD9;
	Sun, 10 Dec 2023 03:39:13 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.7-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87sf4aew7x.fsf@mail.lhotse>
References: <87sf4aew7x.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87sf4aew7x.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.7-4
X-PR-Tracked-Commit-Id: 4b3338aaa74d7d4ec5b6734dc298f0db94ec83d2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c527f5606aa545233a4d2c6d5c636ed82b8633ef
Message-Id: <170217955328.29712.5294828346710720884.pr-tracker-bot@kernel.org>
Date: Sun, 10 Dec 2023 03:39:13 +0000
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, naveen@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 10 Dec 2023 11:29:22 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.7-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c527f5606aa545233a4d2c6d5c636ed82b8633ef

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
