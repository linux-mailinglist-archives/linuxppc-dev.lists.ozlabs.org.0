Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF8BC122C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 22:52:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ggpN2VmdzDqLd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Sep 2019 06:52:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="A3S/pQgh"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ggm13MpqzDqFD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Sep 2019 06:50:24 +1000 (AEST)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.4-2 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569703822;
 bh=ze6cliEOUiUVzoy8NNLZbFo8kjc3vLmjiDahTajozAw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=A3S/pQghcrexHgU29yVOXFVO0hsKThjFWMcKIy9HurII5ZZ7ZPfQXFIrmLCgpu9kG
 CB4U/8NJwHnXtewiZP7MBFKhfvL5hrUKrriZKaIitVNnvEixOuDN2/q3zysFpcTOc3
 HG90+6vPQOkPus8KPwTWMJue6pgK+3fLIridE+9I=
From: pr-tracker-bot@kernel.org
In-Reply-To: <877e5sr52g.fsf@mpe.ellerman.id.au>
References: <877e5sr52g.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <877e5sr52g.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.4-2
X-PR-Tracked-Commit-Id: 253c892193ab58da6b1d94371285971b22c63260
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a2953204b576ea3ba4afd07b917811d50fc49778
Message-Id: <156970382209.9125.2408026177073178873.pr-tracker-bot@kernel.org>
Date: Sat, 28 Sep 2019 20:50:22 +0000
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
Cc: gromero@linux.ibm.com, alistair@popple.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, mdroth@linux.vnet.ibm.com, oohall@gmail.com,
 aneesh.kumar@linux.ibm.com, jniethe5@gmail.com, ldufour@linux.ibm.com,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 28 Sep 2019 22:14:15 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.4-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a2953204b576ea3ba4afd07b917811d50fc49778

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
