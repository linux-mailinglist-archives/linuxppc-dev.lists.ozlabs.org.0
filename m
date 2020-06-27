Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBA120C2EB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 18:02:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vJRk1WTNzDr9T
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 02:02:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=TJ2oXys3; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vJPD4xySzDr9K
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 02:00:16 +1000 (AEST)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.8-4 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593273613;
 bh=MbNap/6N+0BX1tTgTQ3TIOSj00gjCxz9iGVf1N8Dx5o=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=TJ2oXys3tu6oGwsVg+vdudawKeTeVdBi9a4B9a3tnlbVEJbZrRkzACBYQsv5bfGNa
 KPdeyrIJtzCQ1WcWY995cpnRyZUqIE5cOnmVHz5QyiOxqj8mqztO1xe4C+D6hn47gg
 RNes1MLXkA4aAolqM3/jq07bS6vxoLDe9SqPrgCA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87h7uwbtn3.fsf@mpe.ellerman.id.au>
References: <87h7uwbtn3.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87h7uwbtn3.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.8-4
X-PR-Tracked-Commit-Id: 896066aa0685af3434637998b76218c2045142a8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 21d2f6850c09fdec730c11d35406da1dc541432d
Message-Id: <159327361359.7015.1358851817196158940.pr-tracker-bot@kernel.org>
Date: Sat, 27 Jun 2020 16:00:13 +0000
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
Cc: aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org, oss@buserror.net,
 Linus Torvalds <torvalds@linux-foundation.org>, asolokha@kb.kras.ru,
 harish@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 27 Jun 2020 22:06:08 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.8-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/21d2f6850c09fdec730c11d35406da1dc541432d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
