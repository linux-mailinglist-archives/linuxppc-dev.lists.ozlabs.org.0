Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C043FA739
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 20:47:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GxlvH4zN2z3076
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Aug 2021 04:47:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FaoasyUn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FaoasyUn; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gxltc58Q7z2xtL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Aug 2021 04:47:04 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4675A60249;
 Sat, 28 Aug 2021 18:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630176420;
 bh=OtjItYmnBxx1xkCKhYDagDKNhPg9odP4cXbjizTzYo8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=FaoasyUnoJ1FICo9cNKxWWWKhaFqFF2T3OVSlOCmEB0PCWugTKQstoPop3R0X3HrY
 P30X7BAEkMAm7Cs9jg9+dnb4/6tjB64dZyJptKhNmP+INh1gWo30/759x96vVcikeG
 jedWjTEPUJqTIHW7xB+LUpy/JFZ4f9GUjhIgXnspPcchbtlcuYJQ0Ha68GF4rLtdGn
 ToXpkDfmzAB4DbBdwZX+QKueW0UZvR4KsPbW/tNTnWpSOu9rEKroB3GOMgEbSXzQII
 Um4Ec9/CJwNM+Y8TdTr5PF3TChSObzIv2y2CGRD4wMf3jeoykMgWBAXl1oCv7IlM0U
 1j3oqmW884ufA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3FDC660A27;
 Sat, 28 Aug 2021 18:47:00 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.14-7 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <874kb9g2k5.fsf@mpe.ellerman.id.au>
References: <874kb9g2k5.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <874kb9g2k5.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.14-7
X-PR-Tracked-Commit-Id: 787c70f2f9990b5a197320152d2fc32cd8a6ad1a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9f73eacde73b105d722968e79d0f84fd5034a6f4
Message-Id: <163017642025.5058.17675835652327158445.pr-tracker-bot@kernel.org>
Date: Sat, 28 Aug 2021 18:47:00 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, lukas.bulwahn@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 28 Aug 2021 22:46:02 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.14-7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9f73eacde73b105d722968e79d0f84fd5034a6f4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
