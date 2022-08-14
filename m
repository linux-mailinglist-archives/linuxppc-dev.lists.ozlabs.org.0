Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4BB592598
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 18:51:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5Njf2jhbz3cfd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 02:51:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RXpvlT8R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RXpvlT8R;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5Nj02NC1z30Mr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 02:51:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 67339B80AEE;
	Sun, 14 Aug 2022 16:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11A83C433D7;
	Sun, 14 Aug 2022 16:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660495871;
	bh=vzVnaFp0971LgW+nI119bBxbVBISBojFw517CMH9Pdk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=RXpvlT8RrQKWejPhsqg/5NOroFl+dtCF6JU5IU2nPLS3SdmBRKtTfn2HGnR+E90DD
	 KC7z1DG/Hv6+dYAvKRU6E5YJRRkkPkbklcQaN9YxVgAqHul9/CdjHkWtC/tZrSmWzE
	 +IBzSCHiX3IYmvOb/eGXXtmuZcpcDQ9YcHGrNAXOqq104pnq1qbBULWfsLwBVvjjlF
	 RZZnvXyCXkTSHvM2duRUaSifRxj7ebkmb7YQ3oWF7XBB9MKxwcmCJ5A9MBQIZIrN6V
	 2jMEzmkKpX00zJjVg2PvnYsQj2s3Xl0waPbyX80bblTNzMRd+bJfaUo52UeDwDK6ia
	 xze+F7+tmkztQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 00F62C43142;
	Sun, 14 Aug 2022 16:51:11 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.0-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87czd3d8ra.fsf@mpe.ellerman.id.au>
References: <87czd3d8ra.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87czd3d8ra.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.0-2
X-PR-Tracked-Commit-Id: 83ee9f23763a432a4077bf20624ee35de87bce99
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d785610f052d7456497cdec2a2406f6d4b16569f
Message-Id: <166049587100.14047.9978212155674014743.pr-tracker-bot@kernel.org>
Date: Sun, 14 Aug 2022 16:51:11 +0000
To: mpe@ellerman.id.au
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, ndesaulniers@google.com, linux-kernel@vger.kernel.org, naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 14 Aug 2022 09:27:37 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.0-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d785610f052d7456497cdec2a2406f6d4b16569f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
