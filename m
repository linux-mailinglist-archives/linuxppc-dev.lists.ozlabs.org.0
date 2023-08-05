Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 889B7771212
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 22:19:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hY5pSzfo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RJDTT3NDqz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Aug 2023 06:19:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hY5pSzfo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RJDSX0xGYz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Aug 2023 06:19:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1BA160F01;
	Sat,  5 Aug 2023 20:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FDE2C433CA;
	Sat,  5 Aug 2023 20:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691266742;
	bh=gMa0iAKH5ufHWe0+cx5YT1H07eKFhauEC8MqAKT26Cc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hY5pSzfoWF0deZalX3J6Bbxs6eKOgbCiDFVsDJ07zBz6vjDU7g40AOemqORX8vfWx
	 CABhXGo/UtCFcqb1r0SXsd9E22JsWQTM1mkWZerB4HntTo3FF5vNVj9rZIIOjDeLek
	 St7vhSILTttOT5M6Jr99Dk9OklFNIAfXLiD6dvdXKdW1r+IV9ApQ1zaa/RelP8Euhd
	 CO9tAEv/tBdpyvPVHZ3yYicoeskPoH5gbIaTbDXTl3bnj78HcYLfVgHRwXNQNHLw2H
	 4VYDIW5bPUND4abo+TAMxhjzVPuNvJpYg1qP4B1Il9s4ErYYjY4fvgrCd30Ci87TuA
	 MYn7Ctly9HJXw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EF8E0C6445B;
	Sat,  5 Aug 2023 20:19:01 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.5-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87sf8x4pyx.fsf@mail.lhotse>
References: <87sf8x4pyx.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87sf8x4pyx.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.5-5
X-PR-Tracked-Commit-Id: 86582e6189dd8f9f52c25d46c70fe5d111da6345
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 251a94f1f66e909d75a774ac474a63bd9bc38382
Message-Id: <169126674197.17470.5676586902574906015.pr-tracker-bot@kernel.org>
Date: Sat, 05 Aug 2023 20:19:01 +0000
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
Cc: aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org, naveen@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, bgray@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 05 Aug 2023 22:45:58 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.5-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/251a94f1f66e909d75a774ac474a63bd9bc38382

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
