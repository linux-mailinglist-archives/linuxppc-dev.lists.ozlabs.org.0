Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 458133DCD42
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 21:29:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdB5W0KHwz3bgw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 05:29:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S/C7HcQG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S/C7HcQG; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdB5025F3z2yxW
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Aug 2021 05:28:36 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 27ED561059;
 Sun,  1 Aug 2021 19:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627846111;
 bh=2JJz0y+ATsHS6uVWislQr6P/pBs393cIDrmfSXK8vW4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=S/C7HcQGuFOJRCj4LOaiPIo2x5jSItqr04OO5Mw51A7D3XZQH18bZQokvoBVxVuV6
 zRUNhDfa+lGO2NLyD+2IMptfCTtyz2RwJ8B0BXWYgtF1KZLLuHT+y3br8RSv8B9LfZ
 +bflaUgnrXAtoCB7T7dAhfVuytkQqokrw6/I28Su6CIN78WGhe7nI7TIdOgBtRwUUy
 KkH1ti/Y+zrTlFpz7G6SIfFQ5Hh87lWRG8SDtq356zbcJmCN4bh7LwPUQTe1DMf5IW
 LSYAwJJlGScr7hTBaxL+Mz0aY2oQZFiMDAjrwu0ypoDnCCxoRfu25Oy2e3hAyYBnM0
 7l1/GlwxJeRFQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 21F9B60963;
 Sun,  1 Aug 2021 19:28:31 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.14-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87y29lz4nz.fsf@mpe.ellerman.id.au>
References: <87y29lz4nz.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87y29lz4nz.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.14-4
X-PR-Tracked-Commit-Id: a88603f4b92ecef9e2359e40bcb99ad399d85dd7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c82357a7b32c0690b8581f72f197b1ce6118543c
Message-Id: <162784611113.1186.13853752798498083379.pr-tracker-bot@kernel.org>
Date: Sun, 01 Aug 2021 19:28:31 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 01 Aug 2021 23:16:16 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.14-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c82357a7b32c0690b8581f72f197b1ce6118543c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
