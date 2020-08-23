Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9476924EF51
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Aug 2020 20:41:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZPGl3XdfzDqRj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 04:41:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=pr-tracker-bot@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=J16Vx4ir; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZPDb3519zDqNF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Aug 2020 04:39:26 +1000 (AEST)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.9-3 tag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598207964;
 bh=hIKoVmpC88VP1ZThEbWeQVRYJkQKluOV7vCcJ3XkcvI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=J16Vx4irGTsvEoj+6w5Krxn8bXfPOXR8rzPSggBAewZUx7aTVygXGxnaRSkMD9D+C
 Xl8zz3va8W1QUwsEzhNmfYvaKAPf9plTbairHqH0o2bLK9rnDkr68CGwWKZjiYqTe+
 RJlvh2YZ/fW46lOXC98MeUYDRM+SmT2EkQcYnfuQ=
From: pr-tracker-bot@kernel.org
In-Reply-To: <87v9h9h6gq.fsf@mpe.ellerman.id.au>
References: <87v9h9h6gq.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <87v9h9h6gq.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 tags/powerpc-5.9-3
X-PR-Tracked-Commit-Id: 64ef8f2c4791940d7f3945507b6a45c20d959260
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cb95712138ec5e480db5160b41172bbc6f6494cc
Message-Id: <159820796470.12134.6083209572149218193.pr-tracker-bot@kernel.org>
Date: Sun, 23 Aug 2020 18:39:24 +0000
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
Cc: mikey@neuling.org, atrajeev@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 mdroth@linux.vnet.ibm.com, hegdevasant@linux.vnet.ibm.com,
 anju@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
 fbarrat@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 23 Aug 2020 22:50:13 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.9-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cb95712138ec5e480db5160b41172bbc6f6494cc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
