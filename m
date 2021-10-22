Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE5743711D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 07:10:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbC9N2D2wz3cQM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 16:10:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u0yjHbzb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=u0yjHbzb; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbC8n2gsYz2yPk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 16:10:17 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0F66D6120D;
 Fri, 22 Oct 2021 05:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634879414;
 bh=hNifIBg3mJxZlnzZOMiSbpAsZvTMI1cPUVywc0Sa52g=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=u0yjHbzblLGBL5jcIauXI1TYGhHODNSW1qYBYa0R457EM50CS+d0ruLnPIAOTgy1f
 xWLUTUlIzctlRNUhIUqJ+N4ETSiUVbx63eH6FHg8Nsk9NgfqjcIP0howlXeyQBV/p6
 QXE7Kz9DP9H9Tyf8GXwuc3E4O4c/yQhcLIEZ9Na1kXUkBzzNC4H98jzsdWuQSRve/l
 J0hL+3EX5sJ2MzoKH/l6hKSSWONGEhjnEhgp+b0DBYWe9rVAoO6WNXYk+3BzEZJhFX
 nkj0Ubr3/qTeqoDm2IZrBthp6RS1/IyiRzEnapt+VZmHwmlkdTO7brVqzCGFii8B6U
 rKuv0xlufpOdw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 08AF760A22;
 Fri, 22 Oct 2021 05:10:14 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.15-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <877de6d34y.fsf@mpe.ellerman.id.au>
References: <877de6d34y.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <877de6d34y.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.15-5
X-PR-Tracked-Commit-Id: 787252a10d9422f3058df9a4821f389e5326c440
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0a3221b65874b5089f1742de59ef89f032b9f2ea
Message-Id: <163487941402.3037.7528293224433278950.pr-tracker-bot@kernel.org>
Date: Fri, 22 Oct 2021 05:10:14 +0000
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Thu, 21 Oct 2021 22:32:45 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.15-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0a3221b65874b5089f1742de59ef89f032b9f2ea

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
