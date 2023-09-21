Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B0C7A95AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 18:12:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KbFe+/1+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs0lt3C7Pz3cMH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 02:12:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KbFe+/1+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs0ky1wxjz2yps
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 02:11:22 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A26960B4E;
	Thu, 21 Sep 2023 16:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC20DC61180;
	Thu, 21 Sep 2023 16:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695312678;
	bh=Eyeuwkdvq7wj2OJOY9cYSl5PSXvzc5QooICACs47Ay0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KbFe+/1+bnHzJb3unGZKZOcamjzg2sv7W+jeOYvXiAHQYh8XuZ+s2JIx0+JK9uAVy
	 Gf5jbHsfjiV5DAHW4EYfw2DIz3uESCdmM0X19+lRnBFFKiD5zsEHmFquHxS/HHHMme
	 uT0JdIWpiLiEEhs6rJ6G6UMGHVq2M5huHC9YpUJqHoHzOmuz2fI2p4VnKfNsgd2WHy
	 2SRkpjkmjYS3xsAKF/4r5niLd95jRcgBfbOw6uUPXJEQXtnQkxtAzL0Q9ksmD2ZOd5
	 Dkzkn/R8FYi/oSsOMvmIbod+3CpfoQbzzwDT02Anuwn1c7yWcGty0O7JFa0XJMDapP
	 34bDM+GJ3MI+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9A18AC41671;
	Thu, 21 Sep 2023 16:11:18 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.6-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <875y43oo5q.fsf@mail.lhotse>
References: <875y43oo5q.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <875y43oo5q.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-2
X-PR-Tracked-Commit-Id: c3f4309693758b13fbb34b3741c2e2801ad28769
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7bdfc1af0a5af34b3c9620a2023d2ea00fd77b57
Message-Id: <169531267862.30941.14483156173324200251.pr-tracker-bot@kernel.org>
Date: Thu, 21 Sep 2023 16:11:18 +0000
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
Cc: kjain@linux.ibm.com, naveen@kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, bgray@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Thu, 21 Sep 2023 19:45:21 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7bdfc1af0a5af34b3c9620a2023d2ea00fd77b57

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
