Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2C5430E8A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 06:09:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXk041pTJz3c81
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 15:09:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cI7idon2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cI7idon2; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXjzM2Bgpz2yHN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 15:08:31 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7925861054;
 Mon, 18 Oct 2021 04:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634530107;
 bh=3bSPGPcKzcEhWt529A5k5kbzfG89oZ+osFs5F5FzCm4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=cI7idon2XWodWMRUesYcSQh4D/0WsSPTtTUYHwW3SGlkitA8g/hu8obV0fq2GzLtE
 x0nxE9imaJ6F6nRMNjCdQr9/JKPTvhguY6kK14pqUD00ckGLdber8mCRXQBICVQwGE
 Bt0AJsx9MTtP11ULYYbhDOGG9wwu8XaRciZZ7f4CeWtRMkDlLH6ADcrNu8RcxpiLfV
 jFfHIXR6ZX98jiWUbqr/p9Dai617NDG8FIHcmawZjxbFCSq6Tu2sK+p52hkPaHAPQs
 BHWIxcY53BpSmTHfOfnb466iJ01JbkmlX1iSfOpLQr7ckEYAJmnQWo/Z1J16fbhKPs
 QanG5k+x6wGpA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 63AA36095B;
 Mon, 18 Oct 2021 04:08:27 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.15-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87sfwzde0r.fsf@mpe.ellerman.id.au>
References: <87sfwzde0r.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87sfwzde0r.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.15-4
X-PR-Tracked-Commit-Id: cdeb5d7d890e14f3b70e8087e745c4a6a7d9f337
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: be9eb2f00fa7245116d49f76614054cce8e07af8
Message-Id: <163453010734.24310.13422809439190787074.pr-tracker-bot@kernel.org>
Date: Mon, 18 Oct 2021 04:08:27 +0000
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
 Linus Torvalds <torvalds@linux-foundation.org>, clg@kaod.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 17 Oct 2021 23:36:20 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.15-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/be9eb2f00fa7245116d49f76614054cce8e07af8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
