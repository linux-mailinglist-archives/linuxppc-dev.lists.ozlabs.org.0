Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E762E9DD6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 20:04:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8lRP18PXzDqRx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 06:04:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fZN/i+Gh; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8lPc5RvfzDqPf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 06:02:44 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id E92492068D;
 Mon,  4 Jan 2021 19:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609786962;
 bh=7E2kWrtAeYtiIomRgyajziY7XpIVACd6SJ5yxDjYnpI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=fZN/i+GhLVr4Xzgs57i+U29NSzYAMFsTMamqcbPkdw36V2xoZHRleSCaIBdmbwu95
 hhU3+SKGi3icFMka8gySUQcu2wbpZVBGvwSyFz1OuhncrATmyifaoNFCoPDlJ+j24+
 VSqcTrTo37B8mlG8H83CYoENXNGwAOl25jkq2JLWtvg+um2FtIpdAsMdQiVpNsra+i
 AJqQIUoEUAEmvWyGicIxKyf2+W6k3kH/3iIKjM99XVSiYfwFkQIuMwoNdRQd8XrRK4
 lr8h/Oz2ESePNB8h+r12RhEcKonyu6tJulo4S4jy0XgCfET2VpYasebVbhj/0uRM7j
 +lUMjP/pMXqfA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id D43666011A;
 Mon,  4 Jan 2021 19:02:41 +0000 (UTC)
Subject: Re: [GIT PULL] Fix kprobes issue by moving RCU-tasks initialization
 earlier
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210104181934.GA16612@paulmck-ThinkPad-P72>
References: <20210104181934.GA16612@paulmck-ThinkPad-P72>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List
 <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <20210104181934.GA16612@paulmck-ThinkPad-P72>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
 rcu/urgent
X-PR-Tracked-Commit-Id: 1b04fa9900263b4e217ca2509fd778b32c2b4eb2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 36bbbd0e234d817938bdc52121a0f5473b3e58f5
Message-Id: <160978696179.11668.18092994360202511113.pr-tracker-bot@kernel.org>
Date: Mon, 04 Jan 2021 19:02:41 +0000
To: "Paul E. McKenney" <paulmck@kernel.org>
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
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, urezki@gmail.com, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Mon, 4 Jan 2021 10:19:34 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu/urgent

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/36bbbd0e234d817938bdc52121a0f5473b3e58f5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
