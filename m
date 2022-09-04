Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E69045AC5F2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Sep 2022 20:53:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLLQm6bqHz307C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 04:53:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ua7IDjsV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ua7IDjsV;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLLQ46spvz2xZ4
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 04:53:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8DA5A61007;
	Sun,  4 Sep 2022 18:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E08FCC433D7;
	Sun,  4 Sep 2022 18:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662317592;
	bh=XGVBCpcbQjTXsoctbuqnBV80HjB8HC6Kskm3XYk0lT0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ua7IDjsVfWbcR++r813DDaCyCUlnL7BSGr6Llx0ZRvNXvi2BlqrCfSWXjNPtLl1yo
	 dzshRWe2jCRoB676hO3zi3YXuA8ZQYxo9WXOCWn6so/+lyEt4KQWvBONimwrk7qcel
	 YPFEuxdbWRAD1Nw+znftkC9+fJnG7SkDPe89AYktmhC4u39zbReiYXxKkg/y4aRMB2
	 /1Q2Sdk9hK3FpgFaBPq5i/5BG+s5H/wrm2AESK4viBFOzebT/42Q3MGLcAijXfgXKp
	 N0gjrCsrm/J1DbiDhOO4q+Iu8HGktS+rA/merbN2Ced6sB7vu45HsDsvy5wadxWw7L
	 hXQif5qKtzW2Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C9D75C59A4C;
	Sun,  4 Sep 2022 18:53:11 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.0-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87fsh7tiy8.fsf@mpe.ellerman.id.au>
References: <87fsh7tiy8.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87fsh7tiy8.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.0-4
X-PR-Tracked-Commit-Id: 6cf07810e9ef8535d60160d13bf0fd05f2af38e7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5995497296ade7716c8e70899e02235f2b6d9f5d
Message-Id: <166231759182.23278.6365801431590762876.pr-tracker-bot@kernel.org>
Date: Sun, 04 Sep 2022 18:53:11 +0000
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
Cc: pali@kernel.org, kjain@linux.ibm.com, masahiroy@kernel.org, linux-kernel@vger.kernel.org, nathan@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 04 Sep 2022 22:36:31 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.0-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5995497296ade7716c8e70899e02235f2b6d9f5d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
