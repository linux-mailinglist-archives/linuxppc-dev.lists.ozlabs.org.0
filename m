Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A57881A39A5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 20:12:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yq491BpnzDrLK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 04:12:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=KgEPBLB4; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yq1z3JWMzDrGx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 04:10:30 +1000 (AEST)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.7-2 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586455828;
 bh=BR5zpLn3iIqFuK0MM+6K+hdgjXFllmqjXxS9v8rM6mQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=KgEPBLB4ndUQFXmXEYai5+hxuskI2doF8U8Xs4KDVN3rcrNhGGZJdWfcRW7+1pIRS
 DHm9Kf+y0x2mJr0AApceQiaEyNAhn7gDtZbt1wQHrBq3crwJLvBUrNUY+sw2nNC1Eu
 cVyyJinI8H2THmmWMcHDAoelPbEgmKvgbqJZRSOo=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87pncgkjdf.fsf@mpe.ellerman.id.au>
References: <87pncgkjdf.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87pncgkjdf.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.7-2
X-PR-Tracked-Commit-Id: 6ba4a2d3591039aea1cb45c7c42262d26351a2fa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e4da01d8333e500e15a674d75885a9dfcfd31e77
Message-Id: <158645582834.26793.6840925047262398976.pr-tracker-bot@kernel.org>
Date: Thu, 09 Apr 2020 18:10:28 +0000
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
Cc: geert+renesas@glider.be, aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, geoff@infradead.org,
 anju@linux.vnet.ibm.com, ganeshgr@linux.ibm.com, msuchanek@suse.de,
 Linus Torvalds <torvalds@linux-foundation.org>, elfring@users.sourceforge.net,
 dan.carpenter@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Thu, 09 Apr 2020 21:07:24 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.7-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e4da01d8333e500e15a674d75885a9dfcfd31e77

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
