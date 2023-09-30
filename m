Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE627B4275
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Sep 2023 19:03:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UDI/8Qli;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RyYSp1g08z3cbY
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Oct 2023 04:03:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UDI/8Qli;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RyYRZ5L4Rz3c48
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Oct 2023 04:02:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E85A5B80A73;
	Sat, 30 Sep 2023 17:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46E6BC433C8;
	Sat, 30 Sep 2023 17:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696093335;
	bh=l/tCLMVlH30Lm5boXOejSIT9/JnuhhtbswpZnPrRvjc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UDI/8Qli5NFcx8NqvuVVPWSLY+K1qQSD3gFJwybRdZbK5fcaH5jwpc5WPOCdvYuA/
	 t6mMqFdR4dVrQHHhp2OFLVGFUAUImt//sf9UWYQYTCr+w7zaGW5sWCOn1+QJ1bg/SA
	 NnRQEulZxAPz8n2HP8fqE8SI8GxhTYJHo2/NTjXzK5wAnRVqHoaYr2MHA4rcj/w7Wb
	 EuOMz0weMFNtmJviKJ/PCwSSSxHwJTQMhOCTKmsl5o0Oa0oSF7c/M9UH262yXiNR7B
	 JbQt33WwOo47kb38ojImW07LFy0S50B861SNbnH+F1InVauP76lt9hs05RroKcIjoS
	 sdHMlukfwVI+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 32604C395C5;
	Sat, 30 Sep 2023 17:02:15 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.6-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87bkdjolf1.fsf@mail.lhotse>
References: <87bkdjolf1.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87bkdjolf1.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-3
X-PR-Tracked-Commit-Id: 58b33e78a31782ffe25d404d5eba9a45fe636e27
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1c9d83122196ac649dee1da5f48f16462ba5385f
Message-Id: <169609333519.18163.2546822879786600818.pr-tracker-bot@kernel.org>
Date: Sat, 30 Sep 2023 17:02:15 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 30 Sep 2023 23:11:46 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1c9d83122196ac649dee1da5f48f16462ba5385f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
