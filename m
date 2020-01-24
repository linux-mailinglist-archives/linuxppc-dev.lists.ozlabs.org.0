Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F263148D5F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 19:02:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4846S906j8zDqf1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2020 05:02:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=DMS+QMLS; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4846P26kJ1zDqdp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2020 05:00:06 +1100 (AEDT)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.5-6 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579888804;
 bh=pTt5/4nJC64IRziuSrsQeLEAm3Ls4N5MKo4AbO+HsEs=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=DMS+QMLSmyZw3ozsXl0FgwSkgp/moUiKpsIj4zrbthu2g86uST5vsfLTjsDdlCFIN
 T1QvIyAebferbrguPeApi0n9W3S2/4ARu/PSRDgISkSkz8wXXkq4cxvtckfSzBK5qZ
 Dv4cJ6onH+x1omRxJ4mxf97r4UdsJUSp9y9eF4dM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87zhedgihh.fsf@mpe.ellerman.id.au>
References: <87zhedgihh.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87zhedgihh.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.5-6
X-PR-Tracked-Commit-Id: 5d2e5dd5849b4ef5e8ec35e812cdb732c13cd27e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3c45d7510cf563be2ebc04f6864b70bc69f68cb9
Message-Id: <157988880438.9531.13004040647699970908.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2020 18:00:04 +0000
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
Cc: aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org,
 bharata@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>,
 fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 24 Jan 2020 23:13:30 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.5-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3c45d7510cf563be2ebc04f6864b70bc69f68cb9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
