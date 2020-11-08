Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D22D72AACD1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Nov 2020 19:31:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CTjPv4pcfzDqX3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 05:31:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=LjFYfZu0; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CTjMj5mznzDqSt
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Nov 2020 05:29:37 +1100 (AEDT)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.10-3 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604860174;
 bh=q042H9vYLIGiOFHGYdTtbN+D6qVoNyzg2oZF/S8p5vk=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=LjFYfZu0iKgxbgbNGJpLbnBEPFDq0H9Lp64br4TN3qhwoWjUQqh8upj1+4iJ2vyES
 gBdWXUtcmozkbkm37JPeLBIipUKC3jvU8j5WH9iCG3m9vSn2X14GG1Jy/aKkRYPPLh
 K7oINNJrQhE/z/7ahisTWS9cUJs/9bOz1OWhlnBI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87361kta6k.fsf@mpe.ellerman.id.au>
References: <87361kta6k.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87361kta6k.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.10-3
X-PR-Tracked-Commit-Id: 3fb4a8fa28b740709bdd3229b80279957f4d37ed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e942d75281398a8aef4f751753eff26a2a53f081
Message-Id: <160486017413.13369.14318977500004170529.pr-tracker-bot@kernel.org>
Date: Sun, 08 Nov 2020 18:29:34 +0000
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
Cc: paulmck@kernel.org, cai@redhat.com,
 Linus Torvalds <torvalds@linux-foundation.org>, cheloha@linux.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 08 Nov 2020 21:28:03 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.10-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e942d75281398a8aef4f751753eff26a2a53f081

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
