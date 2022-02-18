Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7AA4BBE8C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 18:40:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0f9Y2GWKz3cbg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 04:40:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N5Kpvf+Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=N5Kpvf+Z; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0f8w0KnJz3cQb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 04:39:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9067761FF1;
 Fri, 18 Feb 2022 17:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04539C340E9;
 Fri, 18 Feb 2022 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645205996;
 bh=dnl6SUWMIsoOW/hvEVw5N37t7VlaV0s+GKU9fqT3B/Y=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=N5Kpvf+ZQtDhgww6coAUuomb0pa0hwQ0zgJCR96TRK03MdgaiJlUhys6GMqLBZZtW
 gHxd4I3UQ8ymyoq/SXiOZ6KeyHDKbNkQM6oF7aVpMS2i+Ws0Un3picc0yAF0Z4KfM+
 6Uz5pMGXuTvIv9B9JHxlIL0ivTXHFPCg9p2SReIsSWQOZF1zm8Z+b8+axbdbjCH/7Z
 cVPFq10qnU72+3FLZzIuUjbzEATp7a2H2ql8BzsWETYWWs5zoqS7Bfq9PcU00H60pP
 pHPlEM7kGB+KxwSrrJDFaVjUD+nh+AG0P0YON9O29aNJf1GxGKzCo4f11rgVwXmzfl
 Qas4FXXF/z9ag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E7A14E5D07D; Fri, 18 Feb 2022 17:39:55 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.17-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87pmnknauq.fsf@mpe.ellerman.id.au>
References: <87pmnknauq.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87pmnknauq.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.17-4
X-PR-Tracked-Commit-Id: fe663df7825811358531dc2e8a52d9eaa5e3515e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ea4b3d299fe6b6c9afa4a91dc2cf5479d0089eeb
Message-Id: <164520599594.19024.14896573547051091073.pr-tracker-bot@kernel.org>
Date: Fri, 18 Feb 2022 17:39:55 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, anders.roxell@linaro.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 18 Feb 2022 13:54:05 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.17-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ea4b3d299fe6b6c9afa4a91dc2cf5479d0089eeb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
