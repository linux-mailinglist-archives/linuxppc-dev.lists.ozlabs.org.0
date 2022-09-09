Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A24865B3EB6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 20:17:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPPNH26DQz3c6J
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 04:17:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BtDOSin7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BtDOSin7;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPPMg2t49z3bSX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 04:16:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1DCC2B825D3;
	Fri,  9 Sep 2022 18:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBCE0C433C1;
	Fri,  9 Sep 2022 18:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662747402;
	bh=5vn2SZ6NmhST1Cdl+gEYfZObODfeu6TdrFg8LopNSxc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BtDOSin7qIBwbvoyw6P7it+h+jq60+f2AdxVT+QhOkOb+t+8Sfthv5y4YBHLwhOeQ
	 RYHpIrF+H1vmghX9LHueAyzvaiiEKoiIJXHnuWYJE01/2rtEJsxOw3Ujz2lYoAM3fQ
	 yd671APqQYvTrEvXBPmEaI5uvrrqYVzU3OphF7cBOAB/7PMXmT0a9U3lUAQ6bSPJAt
	 fcew0twx0bKWw/+CGXK0hx1vEKlb69QPnFI5PRvg8EHPiaTHjZRFJIWEZAdkvMGrcf
	 s/tbvVK/uKuBPhK8+yc8u4vJPDeX3XWk8ikcHvpQS08En/w7kBeb6vhCxfkrXHo3zl
	 y9JvlNntbyZQA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BBFABE1CABD;
	Fri,  9 Sep 2022 18:16:42 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.0-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87mtb8encn.fsf@mpe.ellerman.id.au>
References: <87mtb8encn.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87mtb8encn.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.0-5
X-PR-Tracked-Commit-Id: a66de5283e16602b74658289360505ceeb308c90
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2fc1171d34deff70bf3a8338adab8ce46138aae3
Message-Id: <166274740276.9705.16925014852610275397.pr-tracker-bot@kernel.org>
Date: Fri, 09 Sep 2022 18:16:42 +0000
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

The pull request you sent on Fri, 09 Sep 2022 22:36:24 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.0-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2fc1171d34deff70bf3a8338adab8ce46138aae3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
