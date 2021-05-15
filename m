Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC3F381BC2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 01:50:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FjMbD4h73z2yyv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 09:50:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mfE7h2fy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mfE7h2fy; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FjMZh4FL5z2xvR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 09:50:04 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 257D76113E;
 Sat, 15 May 2021 23:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621122601;
 bh=4Jzaoiv/lK4bxd1aXbkugLZkcv3eCvI1H+Hf+520C68=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=mfE7h2fyVlBcigPJsyxuOMZMKVF19iZgekU/M/HBzeUmBNnbGVdUCIxHPPyVVZnu8
 cWqp7Dh92s78zk9MRrnH+18nc4V9pwM/L4JCoBk6PLG8C8pdpnklvE+/Z4w6C21cod
 2JswqRLIK+Km+ZQstN7h6WrjL7JWEkxOTmwutUS0+YnXUKUvGlqRPnzcxEpNKczEwA
 YqDkMJRd+hDhL6wPgdHlLpaFJyfXlpg0rPAaO/VdHngnMppA9ipW9PjPPfTnc4A/cJ
 UAFulxZpf82Zqa+dMXUwK7MAfpReKhqzs6M3uumjVG/05AMxg3stMf9BNcj6+hsA26
 HD8ZYKFZJl1WA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 102296095D;
 Sat, 15 May 2021 23:50:01 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.13-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <871ra7lge5.fsf@mpe.ellerman.id.au>
References: <871ra7lge5.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <871ra7lge5.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.13-3
X-PR-Tracked-Commit-Id: c6ac667b07996929835b512de0e9a988977e6abc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 63d1cb53e26a9a4168b84a8981b225c0a9cfa235
Message-Id: <162112260100.14324.6897731706758836782.pr-tracker-bot@kernel.org>
Date: Sat, 15 May 2021 23:50:01 +0000
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

The pull request you sent on Sun, 16 May 2021 09:35:30 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.13-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/63d1cb53e26a9a4168b84a8981b225c0a9cfa235

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
