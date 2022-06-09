Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3125454DD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 21:23:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJvBw0D9fz3brx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 05:23:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iAnSLwNx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iAnSLwNx;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJvBF2kFtz3bnW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 05:22:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AE115B83044;
	Thu,  9 Jun 2022 19:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55A28C3411B;
	Thu,  9 Jun 2022 19:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654802561;
	bh=Jbbvb8OWsUcza1qgucy+DX4D2nGpl40v+UfV1Tc7nJo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iAnSLwNxA0lOJ0Zoqr8OElJZ1k0wrNsUE7cvQTRro8HD9GbZ+l/XtbDSLNkpoZ8Wt
	 vKGOgI9BBvovZL2akW9rNEiLKjohdAJHYTcYLcO/KaB61Bc/S7OhSYgumDRUwSs/X8
	 kBuoogIR0UNyLRLEZ+yapDz0/YYD8SFPMa/evyypBOZKxsFVyo5x7qRoidB8hp9tub
	 b5QuHCHnbOouf3KCMLt1HrDY5SrX0hKDI/+4SlIaw70bF6q69MHaOeeDdRCgvcwPTI
	 JvXu9KxPyORQd64d9sDxP0S8e4rx4npx3YKtr5ESJGrsSxy05BJEt5NGCmxeiOho54
	 EeyFCFxXLtlpg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 408D9E737E8;
	Thu,  9 Jun 2022 19:22:41 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.19-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87k09pdgri.fsf@mpe.ellerman.id.au>
References: <87k09pdgri.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87k09pdgri.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.19-2
X-PR-Tracked-Commit-Id: 8e1278444446fc97778a5e5c99bca1ce0bbc5ec9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 95fc76c81b9270a9ab38f4947fe5cb786c8c79cc
Message-Id: <165480256126.32717.14540296133538426706.pr-tracker-bot@kernel.org>
Date: Thu, 09 Jun 2022 19:22:41 +0000
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
Cc: ariel.miculas@belden.com, Linus Torvalds <torvalds@linux-foundation.org>, masahiroy@kernel.org, linux-kernel@vger.kernel.org, oss@buserror.net, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, heying24@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 10 Jun 2022 00:59:45 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.19-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/95fc76c81b9270a9ab38f4947fe5cb786c8c79cc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
