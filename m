Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F401755100
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jul 2023 21:31:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QLdnVptv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R3wLC25nJz3bt2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 05:30:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QLdnVptv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R3wKG0ngTz3039
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 05:30:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB41E60E74;
	Sun, 16 Jul 2023 19:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 506A0C433CB;
	Sun, 16 Jul 2023 19:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689535804;
	bh=HOmz9cn80Wyt/tC2Jy+EceltYti2DVn9qn5m4K0VDlo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QLdnVptvAu9B/KFVgApdLJyiKTcCB6xFAlx79lgRMikeq+QwNBDgDvymGr+c50873
	 n22iiSd1IuQDYspfaz/1SIv0isheruSVbLKpLLY25X8n9thZi/6A5//wjczioyE3DB
	 iTRhuJpaa7REheE3Pfukfa6rK26bZ7A39ElfNkMgsGt0rAgvh5/OVz7s6IOVyNJbyb
	 +i/UiMm0SZrhkVsxDKvG3RxekXswTxE2R1XaAW+FjhAIbYYwT6I1rVWidonu3fIJ8b
	 RyJjmkWH2F60mPhjodyWhuJJxtVczCXtCzC36e/CuuYI/PlHHb+SMfwh7d4ifQIa2K
	 HnmwkXKCpZVmg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 38DB0C561EE;
	Sun, 16 Jul 2023 19:30:04 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.5-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87cz0sjwai.fsf@mail.lhotse>
References: <87cz0sjwai.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87cz0sjwai.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.5-3
X-PR-Tracked-Commit-Id: cf53564b11cef5cdfafc548b172345c9aa753f89
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 20edcec23f92db47ca1ab33b4c6025bb8b3db7d7
Message-Id: <168953580422.22660.214369271793832266.pr-tracker-bot@kernel.org>
Date: Sun, 16 Jul 2023 19:30:04 +0000
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 16 Jul 2023 14:49:09 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.5-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/20edcec23f92db47ca1ab33b4c6025bb8b3db7d7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
