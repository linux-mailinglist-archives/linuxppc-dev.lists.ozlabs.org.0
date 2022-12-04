Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE63641FD9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Dec 2022 22:26:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQKVw4Mp7z3bgD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 08:26:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BvtcxhOO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BvtcxhOO;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQKTz061yz2xml
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 08:25:42 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 30D76B80CA5;
	Sun,  4 Dec 2022 21:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6CB0C433C1;
	Sun,  4 Dec 2022 21:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670189136;
	bh=ht9iWJeEyJTdrJieTaPOrLuJsJ4w2hAcMDkLDv2Xkvw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BvtcxhOO677O2LtGREBjbXRe6KtHuGgG0tNZIqR06l/ugdW4Ap7D6dNczTjGanbmG
	 HU6wDjVKwDiq0Vc97HkN67ghSPQ1oSJkDRNmOkFMvQPfl9VM0gLsVrT6CmC/1WO06s
	 Ki7RuIJmqfh+1bjzmCS6IsGi1/yvk693pGy6TXS9NOb5aOYt9kaFTMFji02I+p0/yS
	 QxOnCDSv+ZDxyntTHYST8enV093GlN26uB6HhxGphUSV4CVVgfi2EztObV/ZcPZV1t
	 Mehmx5SrtdKMOOtUoehq2GxwILQPbj10CKNdn7CosSuDOYRtP651CMbFru5OcbPG1N
	 2aSXKCM3jNtGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B01BFC41622;
	Sun,  4 Dec 2022 21:25:36 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-6 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87sfhvs3v2.fsf@mpe.ellerman.id.au>
References: <87sfhvs3v2.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87sfhvs3v2.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.1-6
X-PR-Tracked-Commit-Id: 2e7ec190a0e38aaa8a6d87fd5f804ec07947febc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ae6bb71711713e7b6b2d9ed2af7318dc8ae5cfb2
Message-Id: <167018913671.1549.6783660245670189886.pr-tracker-bot@kernel.org>
Date: Sun, 04 Dec 2022 21:25:36 +0000
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

The pull request you sent on Mon, 05 Dec 2022 00:19:45 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.1-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ae6bb71711713e7b6b2d9ed2af7318dc8ae5cfb2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
