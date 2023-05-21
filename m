Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 210BC70AFB0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 May 2023 20:59:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QPVHp5mmZz3c7s
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 04:59:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q4IKUq+L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q4IKUq+L;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QPVGv4yRwz3bkD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 May 2023 04:58:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4820660EA7;
	Sun, 21 May 2023 18:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2F85C433D2;
	Sun, 21 May 2023 18:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684695521;
	bh=/s+nj4hdgdCkFS6k/Y91Lo9lSdTRhEiF1cAVjbNKp98=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Q4IKUq+LjbsrBELU3zbg5iESlWI4RcGbbatLRSx8kMTDLWpu9e10OGGplWfpsSoVx
	 JTLkN7Ewwq1FrndFW94aGdM4V0MPkgaYa6PopwKqZKmE4gXaj8YjJcQ/le8QUDR50q
	 bs0M+jWkvaHknJZWl+6W8o5mspEx/KMXFTMUT288YMgpYdkd3RfpeW2aLhghgt2rel
	 SF8IhUCSEUogud77gytU5+TwQ4SpVJoEkhNo3RT5TdINnNblu2UQx/fy0lB9UyiqsQ
	 +jz3sQVDCiv3z54gcyvzE0y7BqpndWyrJBlDVDAQQd5fL8uAZw1ZpRFNFvECZ/FsF7
	 DMgUpGD3xHbJQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 90033C41672;
	Sun, 21 May 2023 18:58:41 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.4-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87lehizbq1.fsf@mail.lhotse>
References: <87lehizbq1.fsf@mail.lhotse>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87lehizbq1.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.4-2
X-PR-Tracked-Commit-Id: 1f7aacc5eb9ed2cc17be7a90da5cd559effb9d59
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4927cb98f0eeaa5dbeac882e8372f4b16dc62624
Message-Id: <168469552158.22409.5910069869296532022.pr-tracker-bot@kernel.org>
Date: Sun, 21 May 2023 18:58:41 +0000
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
Cc: robh@kernel.org, gbatra@linux.vnet.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>, rdunlap@infradead.org, linux-kernel@vger.kernel.org, nathan@kernel.org, jgg@nvidia.com, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 21 May 2023 11:59:02 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.4-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4927cb98f0eeaa5dbeac882e8372f4b16dc62624

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
