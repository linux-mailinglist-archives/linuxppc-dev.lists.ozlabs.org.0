Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE182C6BEE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 20:21:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjPcr3KVGzDsG8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 06:21:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=oFEL9yoH; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjPZy2J8MzDrqB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 06:19:54 +1100 (AEDT)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.10-4 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606504791;
 bh=h68Lr1H/1qqNs5nStKe8J/yiTz0SMFs27L3RiWvJkA0=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=oFEL9yoHkuXPmM6X06yYW5KXRwGyegZ3nAHP42XxUpKY83j/YXiuT9vUUEYQHxXrE
 hq67h6tpsDGp13t39UwD4uzdGtBsG4zZPz1YJTImnE2WffWfYorcLdo+uytXqSxf5b
 zuu7OuG66XT6rpOIsO9hL2Pzvg/YkwWDmba14RpM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <877dq7x91s.fsf@mpe.ellerman.id.au>
References: <877dq7x91s.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <877dq7x91s.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.10-4
X-PR-Tracked-Commit-Id: b6b79dd53082db11070b4368d85dd6699ff0b063
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 95e1c7b1dd4a91451040ff0f41c5b5173503a38e
Message-Id: <160650479188.7570.124440902242648321.pr-tracker-bot@kernel.org>
Date: Fri, 27 Nov 2020 19:19:51 +0000
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
Cc: sfr@canb.auug.org.au, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, oss@buserror.net,
 clg@kaod.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Fri, 27 Nov 2020 23:45:35 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.10-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/95e1c7b1dd4a91451040ff0f41c5b5173503a38e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
