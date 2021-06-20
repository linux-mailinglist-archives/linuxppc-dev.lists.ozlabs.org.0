Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0BB3ADF78
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 18:49:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7JYK2ZSCz303n
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 02:49:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p3gbv0AW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p3gbv0AW; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7JXs6gvTz2yWt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 02:49:33 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id E7CF161040;
 Sun, 20 Jun 2021 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624207768;
 bh=xMLqEyKZT96FMlXP9rr7/r5V2J8YwG8i/W9FbQW3BSQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=p3gbv0AWujvmypm/e3ns5rc5w1g685L437a1q5xPo7AK2XeQNhx+9QsdrF3GHCRGo
 0seWq0nSXvAgmva6zip82fjqKHsrjskQCYady3yA5+3t5oS23eU5b/LAeI3Zy6ndr1
 lL3K84JGBnwIbXfqzn6oc0FwiDJXCppIIFuKoi7Jajc4mrin8Av4w1Vu4QSgslQkUp
 NFRW/0Ol9um93A1bULMfK7tutsDo8dxb70/TLKN8HHCjGv7h1F60HaWTnoN3yJXY95
 32ydBkELwN5X9dBGLk7vb0ffX7vt9pDxCyL+OnhkplQquKx3AiXoYRZ1Y9tmPz+ASb
 tuXW1j2k6DJlA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D5BF6609F6;
 Sun, 20 Jun 2021 16:49:28 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.13-6 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87lf752zk9.fsf@mpe.ellerman.id.au>
References: <87lf752zk9.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87lf752zk9.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.13-6
X-PR-Tracked-Commit-Id: 60b7ed54a41b550d50caf7f2418db4a7e75b5bdc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b84a7c286cecf0604a5f8bd5dfcd5e1ca7233e15
Message-Id: <162420776881.12594.6457062686992793482.pr-tracker-bot@kernel.org>
Date: Sun, 20 Jun 2021 16:49:28 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, atrajeev@linux.vnet.ibm.com,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 20 Jun 2021 09:40:38 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.13-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b84a7c286cecf0604a5f8bd5dfcd5e1ca7233e15

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
