Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BE94ECBC6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 20:20:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTF9j2Sn3z3bj2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 05:20:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kRFL4adU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kRFL4adU; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTF905sklz2yXf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 05:20:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82B75B81D51;
 Wed, 30 Mar 2022 18:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B5ABC340F3;
 Wed, 30 Mar 2022 18:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648664413;
 bh=x0UHvUuC38g+S2tNI2ndVR4Ci9dODceoAMqXgTAxMik=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=kRFL4adU99autJJ9gjOQA7AUFVARfmCZwHyOnQtvy9nxr7+Ma29cRtDeYfsljLg1e
 /UxNtlQLGuhI9a0QVF6yhTJ7w0ex/D0oWztIsGfzdaWflcEJOpAFlE8g3UPXalXElr
 3HodPs4f+BgvdIRw8Oe77FyDIxCWPN+FLjYqkaGf3aHzw1hqoI9xhPk9ytsrrvBXT+
 65vVvqjv318b9X2KizxpaRkhHwAHmpOelyu5Y+xJYUdGOFNTrCTOGdY4OyqNEaX7K0
 g6IVfZTc16gRlZuNz31Kc7LRoqKs9/CNrX/QwOaeHUOw7ggPxagZnLnN9MuLxBNcNo
 LaF1qlyYPe+ZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 361BFE6BBCA; Wed, 30 Mar 2022 18:20:13 +0000 (UTC)
Subject: Re: [GIT PULL] LIBNVDIMM update for v5.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPcyv4hydiSDFXVVBtYyuUgutTca6eL67s7txkSgzGzW1VGT0A@mail.gmail.com>
References: <CAPcyv4hydiSDFXVVBtYyuUgutTca6eL67s7txkSgzGzW1VGT0A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPcyv4hydiSDFXVVBtYyuUgutTca6eL67s7txkSgzGzW1VGT0A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm
 tags/libnvdimm-for-5.18
X-PR-Tracked-Commit-Id: ada8d8d337ee970860c9844126e634df8076aa11
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ee96dd9614f1c139e719dd2f296acbed7f1ab4b8
Message-Id: <164866441321.5472.9111993236292688161.pr-tracker-bot@kernel.org>
Date: Wed, 30 Mar 2022 18:20:13 +0000
To: Dan Williams <dan.j.williams@intel.com>
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Tue, 29 Mar 2022 13:54:41 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm tags/libnvdimm-for-5.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ee96dd9614f1c139e719dd2f296acbed7f1ab4b8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
