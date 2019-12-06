Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD6411594A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 23:19:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47V6SV3zyDzDqgZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 09:19:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZhHLnMwv"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47V6NG5GkczDqgX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2019 09:15:26 +1100 (AEDT)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.5-2 tag
 (topic/kasan-bitops)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575670524;
 bh=AbRdZ7SBCyWyKc3F/kBL7hrnnldR4UdcqLH+ZOAZmnU=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=ZhHLnMwvCYtlfUxbeaLmjky6pwZxoR5Wm/luBmyN0RzfFfmi1w5tXO63KwHRSoqSZ
 iz+KjysxoPWXuW85jRzRkNI2/w1yHGaQ1arTWXTQO9cxZ+FtRwosOT1oUdf5Im7J/7
 OGhwmLLgv4Yf8vvGTTLTseOvd5zoxPUd5+hmdlAI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87blslei5o.fsf@mpe.ellerman.id.au>
References: <87blslei5o.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87blslei5o.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.5-2
X-PR-Tracked-Commit-Id: 4f4afc2c9599520300b3f2b3666d2034fca03df3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 43a2898631a8beee66c1d64c1e860f43d96b2e91
Message-Id: <157567052394.8833.9919496603126638238.pr-tracker-bot@kernel.org>
Date: Fri, 06 Dec 2019 22:15:23 +0000
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
Cc: linux-s390@vger.kernel.org, elver@google.com,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 06 Dec 2019 23:46:11 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.5-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/43a2898631a8beee66c1d64c1e860f43d96b2e91

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
