Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5750D3ECA65
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Aug 2021 19:01:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gnk8W3465z30FF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 03:01:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c6/WvWhx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c6/WvWhx; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gnk7n6QL4z3035
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 03:00:37 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 774D860C40;
 Sun, 15 Aug 2021 17:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629046833;
 bh=LWofAuKgdrrv7tvkrVcI9fizKdir0cMFEtvUqwVIIx4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=c6/WvWhxLqrOAUP3nqScBhI2mlDicd69OYWsQr+JujBzSM4bMDO8vIGypX0ByA310
 v3wbvRbHgMsBO3k4J5fQWe2GJNiMLL0OXEkjU0L+eLcK49edQ575no6VeiwHV30BOD
 g7Uedr4LoCNwNME4Xnbdse7iKj9Rvmnqjj9CgU5PaxC8VT5JLhIWjj0PaeFnVmAC8D
 We2CRietVwStAzvKNb6H1tpwLyW85PQw/a18a/a+bqBsukRzPRU9gylT5Vu2aO9UDe
 VeL3D/PiCQQ3cDOd6wo9VSQpkkebIcV12qOXH3xcUwazSIBO/UveasFsQ93gmDkXPc
 GEsoprt/a6Ngg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6CA1D60A69;
 Sun, 15 Aug 2021 17:00:33 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.14-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87tujqlvpo.fsf@mpe.ellerman.id.au>
References: <87tujqlvpo.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87tujqlvpo.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.14-5
X-PR-Tracked-Commit-Id: cbc06f051c524dcfe52ef0d1f30647828e226d30
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ecf93431963a95c0f475921101bedc0dd62ec96d
Message-Id: <162904683343.11260.6565674688445410753.pr-tracker-bot@kernel.org>
Date: Sun, 15 Aug 2021 17:00:33 +0000
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, clg@kaod.org, pulehui@huawei.com,
 ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 15 Aug 2021 22:48:51 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.14-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ecf93431963a95c0f475921101bedc0dd62ec96d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
