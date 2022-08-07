Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A138858B8CC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Aug 2022 02:50:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M0gjt4NWnz3bms
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Aug 2022 10:50:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fnxAOE5d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fnxAOE5d;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M0gjC2Ddbz2xJD
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Aug 2022 10:50:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0A3BA60CA4;
	Sun,  7 Aug 2022 00:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D332C433D7;
	Sun,  7 Aug 2022 00:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659833403;
	bh=hVQ401EV5DbrpwNtv/SO3dfFf4K1qKd46UE2Ic9n8Z0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fnxAOE5dIsFgWMvMC8OkaPwoSZS3Z24N4U/vOdGxhczLzui2AOBL3AY+tki2ApaFe
	 DVIJWG6F/+LvrDge/3YD/iTafn/QfUlrMojCUM68VCEJdIebgoopnqblcivYSwyqBs
	 k/nj9u486RQjBrcqABaBSCLptoZpyREU4kqtv6h5CEPdIgXF4OeMus+lVRYVn4h/EX
	 +pgXqKKE9R1mgw1mMUhRpEVjiicv/hmRY+eoF01FSYbkV8iTuraE55Yd7watUs0y/w
	 pe09fsHtzFIwcs30mxATjynPwt+N9EON68QvYPx3ZSqpAjgZgf/sTaziXYN0VgQmFY
	 Clpvv8HY/f7ug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 43D39C43140;
	Sun,  7 Aug 2022 00:50:03 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.0-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <877d3lan4c.fsf@mpe.ellerman.id.au>
References: <877d3lan4c.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <877d3lan4c.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.0-1
X-PR-Tracked-Commit-Id: 4cfa6ff24a9744ba484521c38bea613134fbfcb3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cae4199f9319f42534ee2e2e4aadf183b9bb7f73
Message-Id: <165983340325.27609.11042525073896478174.pr-tracker-bot@kernel.org>
Date: Sun, 07 Aug 2022 00:50:03 +0000
To: mpe@ellerman.id.au
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
Cc: Jason@zx2c4.com, aik@ozlabs.ru, viresh.kumar@linaro.org, linmq006@gmail.com, wangborong@cdjrlc.com, rashmica@linux.ibm.com, bagasdotme@gmail.com, rashmica.g@gmail.com, damien.lemoal@opensource.wdc.com, andriy.shevchenko@linux.intel.com, baihaowen@meizu.com, arnd@arndb.de, deller@gmx.de, nayna@linux.ibm.com, rppt@linux.ibm.com, jiangjian@cdjrlc.com, joel@jms.id.au, muriloo@linux.ibm.com, linux@roeck-us.net, ajd@linux.ibm.com, xiujianfeng@huawei.com, kjain@linux.ibm.com, u.kleine-koenig@pengutronix.de, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, oss@buserror.net, chris.packham@alliedtelesis.co.nz, mkl@pengutronix.de, ldufour@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, zhouzhouyi@gmail.com, farosas@linux.ibm.com, pali@kernel.org, cheloha@linux.ibm.com, linux-kernel@vger.kernel.org, wsa@kernel.org, broonie@kernel.org, juerg.haefliger@canonical.com, maddy@linux.ibm.com, sohu0106@126.com, Linus Torvalds <torvalds@linux-foundation.org>, masahiroy@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 06 Aug 2022 16:42:59 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.0-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cae4199f9319f42534ee2e2e4aadf183b9bb7f73

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
