Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2952732223C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 23:39:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dkxv46t3vz3cRj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 09:39:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lRSqlP3j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lRSqlP3j; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dkxtf1pJnz30KL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 09:39:05 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 34D8564E27;
 Mon, 22 Feb 2021 22:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614033543;
 bh=UbYbIp4FKJqKLIr6OvJG5dzkozXdK3yFqwH/pvSXG8w=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=lRSqlP3jLJQRPkoJdU8FQrYeMty+Qkl5j/wh8FjxcFAvXPT382Bah3CtCr6Tk3u6E
 7fv/pte/vMV5SPJ+PGz2aMRcvDnTKX9+Tf8P2L7JS5+sp67FGMr59WUlqQRmX7cJ7E
 nsntGcdP3ZIHxsJCVipRpX99N5PYhqkEs3HZ1M6JcnvMuNcwrffEne4Dck/GrzFLDb
 Go8h2krayqQsshtkK9r2lTKIj21ZFWUhzgVE6cZgTGZWH4g3Rk2kkBvIb82IoDe+MN
 QJaDoVHXP4gAc7tJAlQpustN6UQ1KgkGtqA6zKAvITquK9rzrGedIXucNLTg/jWBIW
 UpdaZLADp9BaA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 173B660963;
 Mon, 22 Feb 2021 22:39:03 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.12-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87o8gctii6.fsf@mpe.ellerman.id.au>
References: <87o8gctii6.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87o8gctii6.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.12-1
X-PR-Tracked-Commit-Id: 82d2c16b350f72aa21ac2a6860c542aa4b43a51e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b12b47249688915e987a9a2a393b522f86f6b7ab
Message-Id: <161403354303.914.13622504126022266023.pr-tracker-bot@kernel.org>
Date: Mon, 22 Feb 2021 22:39:03 +0000
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
Cc: ananth@linux.ibm.com, aik@ozlabs.ru, skirmisher@protonmail.com,
 cmr@codefail.de, zhengyongjun3@huawei.com, oohall@gmail.com,
 sandipan@linux.ibm.com, cy.fan@huawei.com, elfring@users.sourceforge.net,
 jiapeng.chong@linux.alibaba.com, f.fainelli@gmail.com, unixbhaskar@gmail.com,
 eerykitty@gmail.com, aneesh.kumar@linux.ibm.com, haren@linux.ibm.com,
 ganeshgr@linux.ibm.com, msuchanek@suse.de, nathanl@linux.ibm.com,
 robh@kernel.org, kjain@linux.ibm.com, npiggin@gmail.com, broonie@kernel.org,
 cai@lca.pw, kernelfans@gmail.com, hbathini@linux.ibm.com,
 atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com,
 po-hsu.lin@canonical.com, Linus Torvalds <torvalds@linux-foundation.org>,
 clg@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Mon, 22 Feb 2021 23:05:37 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.12-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b12b47249688915e987a9a2a393b522f86f6b7ab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
