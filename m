Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B692946010F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 20:07:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1h1w4bbRz3cGl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 06:07:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=It1Yw2Vz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=It1Yw2Vz; 
 dkim-atps=neutral
X-Greylist: delayed 495 seconds by postgrey-1.36 at boromir;
 Sun, 28 Nov 2021 06:06:40 AEDT
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1h1D12r8z3bXv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 06:06:39 +1100 (AEDT)
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5CF5460F0C;
 Sat, 27 Nov 2021 18:58:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D33C860041;
 Sat, 27 Nov 2021 18:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638039496;
 bh=WaOZvzikzn9m13r9zt9z3Qk37cdJ1d567VhW7rWPN+4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=It1Yw2Vztd+LsTJVQDTxpe/jrDGVgNLmPFHck8T1mAHq6Ywgfqij8K7/RiPipqZH4
 YHSRml/43S8LNZPI76BBEid0tfTGnykGqs2Y85iNXOpvpgDVipnPS9o4DCsRQuGuS3
 WxVYfXUDhwbjt9auP2CAiaQoAqYp5hSPSvGVTYmo/Gi+25Pcsy9ImEWwO4JgTqTO7x
 yGKEp4/3+s3d1RGrvu6WrYpVzoG79txnsizBimIkA4FxQFzWdH4GE0xF/wLxGpuGPN
 HJySerStecsMTNG9CTwCslCU82YvZR+Y3qaHb5q6znu+bhmfIKXlfsn/HTMH7htakt
 pfdgQG7y2yJZA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C9505609E2;
 Sat, 27 Nov 2021 18:58:16 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.16-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ilweoriq.fsf@mpe.ellerman.id.au>
References: <87ilweoriq.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87ilweoriq.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.16-3
X-PR-Tracked-Commit-Id: 5bb60ea611db1e04814426ed4bd1c95d1487678e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b65b798a604aff77d5e744833b5d452d2081467
Message-Id: <163803949681.17852.15349568923627984224.pr-tracker-bot@kernel.org>
Date: Sat, 27 Nov 2021 18:58:16 +0000
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
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 27 Nov 2021 20:51:41 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.16-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b65b798a604aff77d5e744833b5d452d2081467

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
