Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F42A80BE5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Aug 2019 19:38:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 461p5M1r3FzDqWt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 03:37:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ls8rmKq4"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 461p292czgzDqc5
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2019 03:35:12 +1000 (AEST)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.3-3 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564940110;
 bh=p8sZ1n+hQaEsRgjUvi94bZ6afmnCTZBAhpFkK+/KLWI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Ls8rmKq4GAlyaFcbM76kf257P4gGl7E8tDyKRvSHTfrSmXuaxNO9QD0m1ANf7EJ8L
 ihJWzZAveb1XvHsr4NdrFH38AP7G/3A7e7Rh/hs5Qv8XLiYZUrIG5qSjVOXt+JSCBH
 FhXTDEawV2qpujVARutIXkOUMNsIiV57u/P6XNh0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87a7cpw3on.fsf@concordia.ellerman.id.au>
References: <87a7cpw3on.fsf@concordia.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87a7cpw3on.fsf@concordia.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.3-3
X-PR-Tracked-Commit-Id: d7e23b887f67178c4f840781be7a6aa6aeb52ab1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4b6f23161b4e888e72671e377c32eabe9a8e62fc
Message-Id: <156494011026.19393.8183498091592530335.pr-tracker-bot@kernel.org>
Date: Sun, 04 Aug 2019 17:35:10 +0000
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
Cc: sfr@canb.auug.org.au, santosh@fossix.org, aneesh.kumar@linux.ibm.com,
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, christian@brauner.io
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 04 Aug 2019 21:49:44 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.3-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4b6f23161b4e888e72671e377c32eabe9a8e62fc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
