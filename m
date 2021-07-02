Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC2E3BA497
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 22:14:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGmWR04wFz3bVr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 06:14:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cqe08NyT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Cqe08NyT; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGmVw1xs6z302W
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Jul 2021 06:13:43 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9450161420;
 Fri,  2 Jul 2021 20:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625256820;
 bh=eVKK5wUCmh1On5h88XwikbSrepvV6lRMYe1Dy1rne+Y=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Cqe08NyTgRIIPRcBZfZjDN1QgpvyM7B+FotD5+1qenC3kJh+/Wui68PXYaHcBDAVI
 qOF7hi+Vrcs3KbJdz69RXQvmyz9VwG1GkobbBdBUEhydDDuxQzFP+4zBzOXEGQ4Je3
 R0LFUxmELEGAYZBPFCVXUhNaxQSQ/F6OoJXY2I4clUKM2W3i35IuQMf+WOR0sINA9Z
 PoNFaOkQ8qPZNXTnco+oLlHF6aSQZ7oozfQL8ZJTgyaATpOHUAF7sFZzVebRy1rVsp
 6PUAOZjllNQtAQK4rp+vGeXIKecAw72rFcE206iZdkxrZRbKtFDqsIfo/COjG3rwGe
 E2e7jtm1ttIAg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 88D2C60283;
 Fri,  2 Jul 2021 20:13:40 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.14-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87o8bk7qk1.fsf@mpe.ellerman.id.au>
References: <87o8bk7qk1.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87o8bk7qk1.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.14-1
X-PR-Tracked-Commit-Id: 4ebbbaa4ce8524b853dd6febf0176a6efa3482d7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 019b3fd94ba73d3ac615f0537440b81f129821f6
Message-Id: <162525682055.6172.2897089487227077976.pr-tracker-bot@kernel.org>
Date: Fri, 02 Jul 2021 20:13:40 +0000
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
Cc: jniethe5@gmail.com, wangborong@cdjrlc.com, jiapeng.chong@linux.alibaba.com,
 herbert@gondor.apana.org.au, sathvika@linux.vnet.ibm.com,
 aneesh.kumar@linux.ibm.com, danielhb413@gmail.com, haren@linux.ibm.com,
 joel@jms.id.au, naveen.n.rao@linux.vnet.ibm.com, chris.zjh@huawei.com,
 nathanl@linux.ibm.com, yuehaibing@huawei.com, arnd@arndb.de,
 kjain@linux.ibm.com, trix@redhat.com, npiggin@gmail.com, nathan@kernel.org,
 thunder.leizhen@huawei.com, andriy.shevchenko@linux.intel.com, dja@axtens.net,
 zhangshaokun@hisilicon.com, atrajeev@linux.vnet.ibm.com, fthain@linux-m68k.org,
 geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org, libaokun1@huawei.com,
 mhiramat@kernel.org, sudeep.holla@arm.com, vaibhav@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 03 Jul 2021 00:12:30 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.14-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/019b3fd94ba73d3ac615f0537440b81f129821f6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
