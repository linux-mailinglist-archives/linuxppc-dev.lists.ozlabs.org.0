Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B7A4F738
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 18:57:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WMCz22BPzDqsH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 02:57:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="zATXfF2L"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WM9l59xczDqpC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 02:55:07 +1000 (AEST)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.2-5 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561222505;
 bh=ljItAA5QOBDvN0VKwcLZwvMB/p40VLJi6z/Xloi1vKQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=zATXfF2L6Hn+p4Cc0Dr4KlhWCqauwBPCIPYQ0hw+H7uY7KeGnWkv1bRKHsYZXOstd
 ThWKr6BPJYKnATKOFyQzGD/3IJBf3aU4tuEoxm4NmZp6VtCtiB6wzF0CN3oh/CRoSE
 T03aZPsclTXomfpXA5FvsB5YD1/oZS9tdUESrd0o=
From: pr-tracker-bot@kernel.org
In-Reply-To: <874l4halcp.fsf@concordia.ellerman.id.au>
References: <874l4halcp.fsf@concordia.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <874l4halcp.fsf@concordia.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.2-5
X-PR-Tracked-Commit-Id: 50087112592016a3fc10b394a55f1f1a1bde6908
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a8282bf087bcfb348ad97c8ed1f457bc11fd9709
Message-Id: <156122250504.32167.3748536201783755166.pr-tracker-bot@kernel.org>
Date: Sat, 22 Jun 2019 16:55:05 +0000
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
Cc: mikey@neuling.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, sjitindarsingh@gmail.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, Larry.Finger@lwfinger.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 22 Jun 2019 21:52:06 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.2-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a8282bf087bcfb348ad97c8ed1f457bc11fd9709

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
