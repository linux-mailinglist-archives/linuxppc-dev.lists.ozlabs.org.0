Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A5C50D4DB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 21:36:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kmdg73rdfz3bq8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 05:36:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bZAu3t8z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bZAu3t8z; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KmdfT27Vbz2xr9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Apr 2022 05:35:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CAACFB80EED;
 Sun, 24 Apr 2022 19:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 748FCC385A7;
 Sun, 24 Apr 2022 19:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650828939;
 bh=2Ll1tqmcYI4QkLXrtWM37r72tue3SU9WD1qqAFaFMJU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=bZAu3t8z3dMFijDs8dv2+0BTEJsrAL7JA1sxz9QRak6NCv/RLN5s9zWC+WNDrN8Zj
 9caMal40OtKzVXDMPN88O0UcZfa1lr1tjyNpLGtAOmtnaHj1sQWbV1Tg4hV7qwBNI8
 7z91Ih41CgF+mIQAfDg5txpCJaK6msRnd3WzZRVYaHQg87YKjdHNvAIeSc1zQIC1oO
 7Gg6IlK7G0j9k4hJIn6rt8t6uorIOr6iw/KA7qiv9mAlExlBgTl5dDVRZLlLdE21sN
 x5GBB43qLbOck6Q31pxNOeEY5R3qXAOYg4eUwRyxV6RIKkwNNLuKC+iJHmVsuVIM8J
 YnSHkNFf86hDQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 508A7E8DD85; Sun, 24 Apr 2022 19:35:39 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.18-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87ilqy8w7z.fsf@mpe.ellerman.id.au>
References: <87ilqy8w7z.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87ilqy8w7z.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.18-3
X-PR-Tracked-Commit-Id: bb82c574691daf8f7fa9a160264d15c5804cb769
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5206548f6e6741fccbce8d95cff8faeba0738c99
Message-Id: <165082893932.1098.12774524804963596528.pr-tracker-bot@kernel.org>
Date: Sun, 24 Apr 2022 19:35:39 +0000
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org, atrajeev@linux.vnet.ibm.com,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 24 Apr 2022 23:08:48 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.18-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5206548f6e6741fccbce8d95cff8faeba0738c99

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
