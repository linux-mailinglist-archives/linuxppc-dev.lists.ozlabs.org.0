Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7156E39D13D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:14:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fynlv6Ydjz3bsg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 06:14:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c8Cc1tn3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c8Cc1tn3; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FynlQ0709z2ym4
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 06:14:09 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id EEC4E613EF;
 Sun,  6 Jun 2021 20:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623010446;
 bh=niXkl0Vdrsf5fr9Sxzd82elsqIqkXKTaUWMJDivQkSw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=c8Cc1tn325iPexajbUu0b0YdbKs9JjEadiR2dINh74QlkZDGzq99YKALY4u+eQitM
 vDIEFKt0wEuGY2j7D8tE/2qw/oO0bP+XGYJ21XdtqESTGkXHlsVrKPMlPoIXMbKaMV
 NJdlHXxgJwK3+wCpXPW8NToZWtLLGaH9Xjzau5MGYwl9MMloO/JtUd7EVh7CpWL6A2
 AV3vwPgL5l+lXvvYp2bXKLxVIaDBGPBzHCDLtrxQ9ZKbr2PWkYuXyDrk3x0caUlRfy
 RgkXOjspE8m/GoiWJ90+ixul7qCucwH0XbAtBCji7GPw+MHTkDnk3Tb5J00kR1bywD
 xtWayt7/wt6+g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E717F60074;
 Sun,  6 Jun 2021 20:14:05 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.13-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87fsxvf9hz.fsf@mpe.ellerman.id.au>
References: <87fsxvf9hz.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87fsxvf9hz.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.13-5
X-PR-Tracked-Commit-Id: 59cc84c802eb923805e7bba425976a3df5ce35d8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bd7b12aa6081c3755b693755d608f58e13798a60
Message-Id: <162301044594.15135.3567760184583315355.pr-tracker-bot@kernel.org>
Date: Sun, 06 Jun 2021 20:14:05 +0000
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, fbarrat@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 06 Jun 2021 22:44:24 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.13-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bd7b12aa6081c3755b693755d608f58e13798a60

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
