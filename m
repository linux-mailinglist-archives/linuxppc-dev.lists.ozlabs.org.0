Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D003588CF4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 21:32:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 465XLN4WP6zDr8v
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Aug 2019 05:32:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZEhBTphY"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 465XJ44PbkzDqm6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Aug 2019 05:30:11 +1000 (AEST)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.3-4 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565465409;
 bh=PWDohFDSasxyksialntFaoZcEWNbiK/iivGkfeWr1uw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=ZEhBTphYgbfQJIXsjm+jBFittizsX8pMRQoOOP2HyNsclJ8qoh3L7ypNpY+dYsi4f
 wrdCQtmpLmqENY+Dg3TM0lskv6gx8KfbgFy6LEgw173FcIHMixoOQd040gp4bmoNVI
 PZTyROBEazVP3N2APSwsOsFhFhpSB1WCBUjEv7PQ=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87imr5s522.fsf@concordia.ellerman.id.au>
References: <87imr5s522.fsf@concordia.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87imr5s522.fsf@concordia.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.3-4
X-PR-Tracked-Commit-Id: ed4289e8b48845888ee46377bd2b55884a55e60b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 23df57afe8eebff6ece05a815934f2f70a851e0a
Message-Id: <156546540923.17840.11502066907929648245.pr-tracker-bot@kernel.org>
Date: Sat, 10 Aug 2019 19:30:09 +0000
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
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sat, 10 Aug 2019 20:11:49 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.3-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/23df57afe8eebff6ece05a815934f2f70a851e0a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
