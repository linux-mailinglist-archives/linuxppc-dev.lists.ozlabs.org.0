Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A1045862D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Nov 2021 20:40:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hy12Q0PwWz305j
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 06:39:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BblavEip;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BblavEip; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hy11l1ZPvz2xh0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 06:39:23 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 58EB160C4A;
 Sun, 21 Nov 2021 19:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637523560;
 bh=oc+cr+aCb2ZYVdGYDIYeJMkXKZoH5MqM9N5prfUHn18=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=BblavEip/kThopXNVN7wjFBC1BfW+mUF36THHNanLKIDOO4tP9avfWWK1xZ768H6N
 hZ6Kta1wFMCGjEgf5cyOTf1zqePoTd7be5h6RbvVxRR5nt34LQvTgZxOsjmuJw6VaY
 CdAmudmlDcTTFo2529q9wSVW6IKzJ6EQ4zfAD1egUGNq6t1XuF3kuBOF5EQB3iYltI
 hQx3RsjJY4RFx5l40jJL6TczS0oFZFKqHzszWtKsrDO+uuTszyOD/kdM7KEBG1XkVg
 3CCnLeypR94SkGm9c+Z2FN2aaC0NCaaT/3ciFuQ3K7MZ8+uLltsD9zfEYn04mcmqx7
 OxKiJCvygV5eQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 46064609D9;
 Sun, 21 Nov 2021 19:39:20 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.16-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87lf1iqflp.fsf@mpe.ellerman.id.au>
References: <87lf1iqflp.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87lf1iqflp.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.16-2
X-PR-Tracked-Commit-Id: 8e80a73fa9a7747e3e8255cb149c543aabf65a24
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 75603b14ed142fa142976bd962c1b44b8e0d2714
Message-Id: <163752356022.15895.14088560581974981189.pr-tracker-bot@kernel.org>
Date: Sun, 21 Nov 2021 19:39:20 +0000
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
Cc: aik@ozlabs.ru, maz@kernel.org, masahiroy@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 clg@kaod.org, u.kleine-koenig@pengutronix.de,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 21 Nov 2021 15:48:02 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.16-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/75603b14ed142fa142976bd962c1b44b8e0d2714

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
