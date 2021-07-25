Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCF63D4F4D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jul 2021 19:50:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GXrDl1Ct7z30LR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 03:50:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MdLtw1sv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MdLtw1sv; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GXrDC2h7Yz2yNC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 03:49:47 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8ACAD604DC;
 Sun, 25 Jul 2021 17:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627235383;
 bh=2B4UZXoj6w5El4M8eDloU7fn3Qn4gWVkterPsihMbOQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=MdLtw1svGN2wixIjPgE84fVs7FRfIGAN0mbRgiimw65rD+mrk99wXz15z/9DJnwh7
 wn99Kl3l/D0dVTyWWeRl3QsA/bxfAENG4IaAtwYsPSc3YBayUt7iKRSIOIFo6VdcaE
 VsaiQ6JJU8PSTs0LCSetazVtpb6bn5tL0y0kUjY5pUh9Io18lVSRYh7f6I1mUnIKk/
 Ah1vPChJ/t3odQzfrdwCY3x9CpCqQSfRg8/ddAP1tnJSpkB3bPjAGdxwk5LMP6Gt20
 a67L7soCejjBDFJNId8hrc3/oHWS5VxhczyT3iXX4SzEcjyViiYEIYBcuq7WtNAtvh
 Rm7aexDPvz0NA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 77D9D60972;
 Sun, 25 Jul 2021 17:49:43 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.14-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87lf5u1nls.fsf@mpe.ellerman.id.au>
References: <87lf5u1nls.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87lf5u1nls.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.14-3
X-PR-Tracked-Commit-Id: d9c57d3ed52a92536f5fa59dc5ccdd58b4875076
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3c0ce1497a449b0d150b455628947152c5f6216a
Message-Id: <162723538343.30584.4768137691227508273.pr-tracker-bot@kernel.org>
Date: Sun, 25 Jul 2021 17:49:43 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, mikey@neuling.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Mon, 26 Jul 2021 00:20:47 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.14-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3c0ce1497a449b0d150b455628947152c5f6216a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
