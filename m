Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBB67D9D4F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 17:47:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q0n6Ix2n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SH6Vr1ZNfz3cSY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Oct 2023 02:47:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q0n6Ix2n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SH6Tw3RRJz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Oct 2023 02:46:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 98744CE3D98;
	Fri, 27 Oct 2023 15:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD1B2C433C7;
	Fri, 27 Oct 2023 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698421600;
	bh=sptzVSKg3wUo76WXYKJGyC42u7/vX0Q6wTLQMJz6OBs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=q0n6Ix2nAWZfSUflzZFO5LxkR05F95nL/uHYcHEqDLu2R/X3OweGMXLFehCh2UD0X
	 NUpC/36CkwjGBrb+8XBdLVQ29I9tmUanc8OlMKFac7DTJ8RuhDVf2a//N2ZkO/nCW6
	 PZ/44cO/68d8UyBNAqOW0YHnvTJEq/QNRCFVdk07txtXmYH82+q4HiRjznAdMWQH4e
	 6I0ZY0pOmL2Wmjk3k/bJ1dGPQWpQ+TMcwJuwCAY+Ni6aUVSzMzn1Qa28e9UdgcTfAD
	 ngGIkG2hO3qY2NCzPlyFqHQUsxXjfdfpfZjFZRZfC6o0sa5zjTcRozqju315qd9T97
	 b6X6qC2Q2FZnw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B6757C4316B;
	Fri, 27 Oct 2023 15:46:40 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.6-6 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87edhgv5gw.fsf@mail.lhotse>
References: <87edhgv5gw.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87edhgv5gw.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-6
X-PR-Tracked-Commit-Id: 47b8def9358c5eb888e78b24b7e5b7f2e2e97b8e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 09a4a03c073bab5b375b71769f708d6932b370f7
Message-Id: <169842160074.21759.14383943322328308583.pr-tracker-bot@kernel.org>
Date: Fri, 27 Oct 2023 15:46:40 +0000
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

The pull request you sent on Fri, 27 Oct 2023 19:23:43 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/09a4a03c073bab5b375b71769f708d6932b370f7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
