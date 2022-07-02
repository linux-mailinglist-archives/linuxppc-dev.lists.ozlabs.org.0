Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B105641E6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 19:39:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZzpT1pV7z3c2s
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jul 2022 03:39:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bSVrLBmQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bSVrLBmQ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZznr0qLfz3bkW
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Jul 2022 03:38:55 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B5B8BB80684;
	Sat,  2 Jul 2022 17:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A8CCC34114;
	Sat,  2 Jul 2022 17:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656783529;
	bh=iNbDC+O4df97kCA0R2yVWyePRF78hqPgYZFS+GXLCZE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bSVrLBmQLd/PiM75ZCKeAaP5AE4K5j7IFC5XeqC3SCI63FBO4ToE2e7LQmNPUoOc2
	 6w9QkgwlL7MbzZCepTQDLqKdl4poRocySXkBwzXujnx6pUn1jREDZe6sUdjXomNycf
	 9Qz9gXGkTGtvF1WiZ4r9gZ7r3Vlww9MtAZVOVcmfL92FeWsFDT3vvLOgcbfLLc0iiS
	 3XaBi4nUDmJx8hZrLZRDGRjyRx+V+osB1dscFgymeluaLWUj5LPP7g4V0OqjZ6EieB
	 ljVSiBJcW01XEf4DUiLhqj42k6fZAKwWq06Uo/wUup9bHA8+DoMTyxGoifJjqblgRM
	 DvfZLi134gmDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 68FBDE49BBC;
	Sat,  2 Jul 2022 17:38:49 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.19-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87edz3aj9f.fsf@mpe.ellerman.id.au>
References: <87edz3aj9f.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87edz3aj9f.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.19-4
X-PR-Tracked-Commit-Id: ac790d09885d36143076e7e02825c541e8eee899
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5411de073362300d99bb35d46d77d656760e4606
Message-Id: <165678352942.3400.15836912019951685406.pr-tracker-bot@kernel.org>
Date: Sat, 02 Jul 2022 17:38:49 +0000
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
Cc: nathanl@linux.ibm.com, aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, liam.howlett@oracle.com, rppt@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 02 Jul 2022 20:42:04 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.19-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5411de073362300d99bb35d46d77d656760e4606

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
