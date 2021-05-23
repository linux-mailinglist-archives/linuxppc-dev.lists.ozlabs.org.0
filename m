Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E88138DBD6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 18:15:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fp56V0Kgnz30Gt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 02:15:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J659Svmm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J659Svmm; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fp55x1hSfz2yx2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 02:15:00 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id C61DD61166;
 Sun, 23 May 2021 16:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621786496;
 bh=Tr4CcQgjnIdsIXv2LMLCXOXbYnpnXMkfhBRnrigX1ag=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=J659SvmmYHqD2RHsUA58LdVADCicL1QnzafhPE+nbNmtQm3Tr4rkUiMXgSit7hS+r
 ENGziVxDy35ogsKPjPMcnehGWYduM2a2gMlop5bb4ZBMHJLMFD/cN3tuuPx5Kqm3XB
 DubLVMtui4AguOxC2NMbeU5bZEi+IqXxV4guesTxW2mMuxDzxGltjPnRrhUA1mjvR8
 hF5EjiB5EwBKxAm7KZdpzcmv4NP5wzx+A1YrUDqpRcXC3MSBJS/RGi+oyZuSzHOywQ
 E9sT/oqsjbOJwqJfMVtlE2Z81JBhKlywW73DbfTtKiaXkzLHOIWe2vfzYVNWwkJmZj
 11OF+91PUVVzA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B2A5160A0B;
 Sun, 23 May 2021 16:14:56 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.13-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87pmxhivw1.fsf@mpe.ellerman.id.au>
References: <87pmxhivw1.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87pmxhivw1.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.13-4
X-PR-Tracked-Commit-Id: d72500f992849d31ebae8f821a023660ddd0dcc2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 28ceac6959e1db015729c52ec74e0a4ff496c2b8
Message-Id: <162178649665.14510.12044359947385635542.pr-tracker-bot@kernel.org>
Date: Sun, 23 May 2021 16:14:56 +0000
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
Cc: Kees Cook <keescook@chromium.org>, aik@ozlabs.ru,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 "Dmitry V. Levin" <ldv@altlinux.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 23 May 2021 20:31:42 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.13-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/28ceac6959e1db015729c52ec74e0a4ff496c2b8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
