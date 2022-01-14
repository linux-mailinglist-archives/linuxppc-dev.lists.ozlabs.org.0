Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F3248EBD0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 15:40:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jb3qN2NHLz3bbk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 01:40:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BZsoyvl2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BZsoyvl2; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jb3ph6Brzz2yyK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jan 2022 01:39:24 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7939D61E47;
 Fri, 14 Jan 2022 14:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9864C36AEC;
 Fri, 14 Jan 2022 14:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642171159;
 bh=NJtVr6Ce3LUAkvC3PMu/SiZGGVBKhsePi2TzcCwdqZE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=BZsoyvl2JPcCsal7DVDGyMi8Xy9yfR1wLd8IC11nu+eKj3+KyhzyN7/H+yZIWZcQh
 2bmIK3cKBimqahEe29ozGdLm4eeAJOGC8R4uti0vD/g2bt6XYYjlC7KLD5bpmFeGsC
 d4qida+aDXWKx3ol01PdvW5FeDQtZC3n68UsmPfM+Wzcw8WWKbgSRcO4uc6at+Norr
 R139Kzcd5KhtXQfHHX8vfzhc4fuJpJbp0/4yL1zKeoMaRVTODR45BazUzxjWLmMgnZ
 IR3OG/0y46rXwKHS8olmralMDDr9/saB6GEX6zKf2zYBXHmqoNuqI9oywbQXBCKgh7
 NkEHvWwTKpiVQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C4C57F60794; Fri, 14 Jan 2022 14:39:19 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.17-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87v8ym1qce.fsf@mpe.ellerman.id.au>
References: <87v8ym1qce.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87v8ym1qce.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.17-1
X-PR-Tracked-Commit-Id: f1aa0e47c29268776205698f2453dc07fab49855
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 29ec39fcf11e4583eb8d5174f756ea109c77cc44
Message-Id: <164217115979.3976.13936421146650676596.pr-tracker-bot@kernel.org>
Date: Fri, 14 Jan 2022 14:39:19 +0000
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
Cc: sachinp@linux.vnet.ibm.com, cascardo@canonical.com,
 guoren@linux.alibaba.com, aik@ozlabs.ru, wangborong@cdjrlc.com,
 wangxiang@cdjrlc.com, amodra@au1.ibm.com, jlu.hpw@foxmail.com,
 keescook@chromium.org, robh@kernel.org, anders.roxell@linaro.org,
 chi.minghao@zte.com.cn, Linus Torvalds <torvalds@linux-foundation.org>,
 yang.guang5@zte.com.cn, nathanl@linux.ibm.com, ravi.bangoria@linux.ibm.com,
 ajd@linux.ibm.com, kjain@linux.ibm.com, npiggin@gmail.com,
 Julia.Lawall@lip6.fr, christophe.jaillet@wanadoo.fr, clg@kaod.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, hbathini@linux.ibm.com,
 dja@axtens.net, atrajeev@linux.vnet.ibm.com, nick.child@ibm.com,
 gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, ammarfaizi2@gmail.com, peterz@infradead.org,
 seanjc@google.com, oohall@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 14 Jan 2022 22:58:25 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.17-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/29ec39fcf11e4583eb8d5174f756ea109c77cc44

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
