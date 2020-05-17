Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAEA1D65ED
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 May 2020 06:46:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49PqNx214PzDqcj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 May 2020 14:46:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=CTxRUZ/M; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49PqM64STszDqRh
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 May 2020 14:45:06 +1000 (AEST)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.7-4 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589690703;
 bh=QZPw0wcsdXmgGidodAVQ8evxzTshnVgcyCo8ZPopWlY=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=CTxRUZ/MmhECu1bid0tvCK/DPYt0Ig6QEQ1zVJGMZM046BSRTz0wngRRBMJ+bVfKA
 boL2OpPr8IYucvnCjOCyFKQQXxwFmz393+4uXwFo8rDFCuAvcoGE+4sx124Q/rhXEs
 ghXAsxa/mKA/iyVAF5riKUDHh3ycG5+cOqyk7/PA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87pnb49j0c.fsf@mpe.ellerman.id.au>
References: <87pnb49j0c.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87pnb49j0c.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.7-4
X-PR-Tracked-Commit-Id: 249c9b0cd193d983c3a0b00f3fd3b92333bfeebe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: befc42e5dd4977b63dd3b0c0db05e21d56f13c2e
Message-Id: <158969070340.26561.5881835255663450370.pr-tracker-bot@kernel.org>
Date: Sun, 17 May 2020 04:45:03 +0000
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
Cc: christophe.leroy@c-s.fr, Linus Torvalds <torvalds@linux-foundation.org>,
 nayna@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 16 May 2020 22:11:47 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.7-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/befc42e5dd4977b63dd3b0c0db05e21d56f13c2e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
