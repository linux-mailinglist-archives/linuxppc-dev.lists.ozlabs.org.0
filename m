Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D93A440672
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 02:38:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hh0lD6LGsz3c8Z
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 11:38:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MS0bUS8F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MS0bUS8F; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hh0kc3dFWz2ynb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 11:37:44 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3B90360FDA;
 Sat, 30 Oct 2021 00:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635554262;
 bh=r3m2FVq7BhuGzRfAuuSmyY4HfzTqxyCYFTzcnnOSg5k=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=MS0bUS8F7YW6kEc+MtrI3ZHVQsvczwJfwI+49QkR+5EcMTFLWJdEfE2PizW20YpQn
 Kn8sEm8RnwQ+NtOxpOSqC1laVDHcTsX5Tuf7R8Hucjcle92jMfnnAyw7FkSk5K/dRo
 vP4qBo96Or+VLgqGlUmrBNrpjhRZwOXVhEDEyixLQ7G0FIrUJApxsQ+bRV80096+tX
 kiYs+gvVYKXTqKmBp0poEQRmf6bvJUSQFIqj82brH/yKOdTXFJKecSpzHenoActbkd
 GdAiSi5QL5SxvaUI10UJ6Apm9eNUvWMZ7x9WJhpDSyDS1Z8uAqdkWG/0ugn/1joAdu
 fPjVMy08XnDuQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3508160A1B;
 Sat, 30 Oct 2021 00:37:42 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.15-6 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87pmrn8m9h.fsf@mpe.ellerman.id.au>
References: <87pmrn8m9h.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87pmrn8m9h.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.15-6
X-PR-Tracked-Commit-Id: d853adc7adf601d7d6823afe3ed396065a3e08d1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 119c85055d867b9588263bca59794c872ef2a30e
Message-Id: <163555426221.1437.3431670468046588542.pr-tracker-bot@kernel.org>
Date: Sat, 30 Oct 2021 00:37:42 +0000
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 30 Oct 2021 10:05:46 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.15-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/119c85055d867b9588263bca59794c872ef2a30e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
