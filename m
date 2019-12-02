Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA1210E40C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 01:12:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47R5C94yhnzDqSt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 11:12:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="GucPhqCD"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47R59668l0zDqF6
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 11:10:18 +1100 (AEDT)
Subject: Re: [GIT PULL] y2038: syscall implementation cleanups
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575245415;
 bh=iqq6lXJBg3gll30hOu8A7AbbrXvqRaMX0FdwYnExI4E=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=GucPhqCDjnhKjZxtLEBJJpMAIv4XkqH/zUBiXM2apvnPV57uNwTqs11tTUQwkdD8/
 ndLB4RwV+UpKbRPqyulG6MA5xJiEXlm/jEjqGiGeWPiD+uhPbcfyefxFGuvkeFtqet
 1/ZnWnbMZCgTY2MnwLrWm4aTWxSKiDKuP9/sSqcQ=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a38Q_yhiyODpFd6ZqLv=QyKRmCm8FOMuSr4RPvGtWNPYw@mail.gmail.com>
References: <CAK8P3a38Q_yhiyODpFd6ZqLv=QyKRmCm8FOMuSr4RPvGtWNPYw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a38Q_yhiyODpFd6ZqLv=QyKRmCm8FOMuSr4RPvGtWNPYw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org:/pub/scm/linux/kernel/git/arnd/playground.git
 tags/y2038-cleanups-5.5
X-PR-Tracked-Commit-Id: b111df8447acdeb4b9220f99d5d4b28f83eb56ad
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ceb307474506f888e8f16dab183405ff01dffa08
Message-Id: <157524541577.21884.12235201329343796550.pr-tracker-bot@kernel.org>
Date: Mon, 02 Dec 2019 00:10:15 +0000
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: y2038 Mailman List <y2038@lists.linaro.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Wed, 27 Nov 2019 14:36:16 +0100:

> git://git.kernel.org:/pub/scm/linux/kernel/git/arnd/playground.git tags/y2038-cleanups-5.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ceb307474506f888e8f16dab183405ff01dffa08

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
