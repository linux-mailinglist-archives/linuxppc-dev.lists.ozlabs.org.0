Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CA54CEDBB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Mar 2022 21:34:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBYH423nPz30Mg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 07:34:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rQ1FX1gb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rQ1FX1gb; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBYGR02hXz30Mg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Mar 2022 07:34:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5BAC960FB6;
 Sun,  6 Mar 2022 20:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C15DBC340EC;
 Sun,  6 Mar 2022 20:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646598843;
 bh=5TYPJG5BEum420Pvp4/P32yoIZjvFF47gqf1WdmIiTk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=rQ1FX1gbzA//7iI7b8wGJhXHBqHr3gpq3LLLuj1vOTOsNE30QiqGRPz3FkQxo73wb
 EVzYDaQr87b6Y/nNsHsWvQeUZisXECNuDEVjBOmnDoVj4D3x0+0XFRE3/b37PV60ra
 2Mf26pIugRzh/h+RLwC5dFsHtc/566dRvVRcyUQtnxDdBlwJ20we/5yJWoXwSMquU3
 PYz3OMiaWjDo+C+P9+OBQ/Y4BLmP8YU8z4eqvEWMDIWaNSg+0g8paZtymyKwFXplPO
 yFgHhUnGm5nX4g3hz2A73jaes07eIMbMdO5AUMEbFPs3sz34fu4LZqiGZclcDfcA43
 KdSdyEgmrQLiQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AEB60E8DD5B; Sun,  6 Mar 2022 20:34:03 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.17-5 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87bkyjo6wn.fsf@mpe.ellerman.id.au>
References: <87bkyjo6wn.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87bkyjo6wn.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.17-5
X-PR-Tracked-Commit-Id: 58dbe9b373df2828d873b1c0e5afc77485b2f376
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9bdeaca18bf61d55029277bb35f72c2002c88c4d
Message-Id: <164659884370.14106.12409054934091400945.pr-tracker-bot@kernel.org>
Date: Sun, 06 Mar 2022 20:34:03 +0000
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
 muriloo@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 06 Mar 2022 18:51:36 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.17-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9bdeaca18bf61d55029277bb35f72c2002c88c4d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
