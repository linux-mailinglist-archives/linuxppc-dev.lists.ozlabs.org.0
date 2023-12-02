Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD2F801FD1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Dec 2023 00:53:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lveCnwYc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SjRb44KJMz3d8K
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Dec 2023 10:53:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lveCnwYc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SjRZF5BQYz3cBQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Dec 2023 10:52:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0FE63CE0ADF;
	Sat,  2 Dec 2023 23:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 927A2C433C7;
	Sat,  2 Dec 2023 23:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701561164;
	bh=J1C8bWiwa1AsioJ91/bEJjDNytv+lkcsQxOrNx33I2o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lveCnwYcVvm4DDlmZ0oGDxPg7DE94WxLmUUQfEDDYdLToHLMZmsrrFbJDGTQuj9TF
	 vwIkjzTOtYsvsMj/ED/VaJr8WcSXIr4j2YqyA2hQNH0dNh8xWIfcTw2eTe5sO+FFwy
	 Zb8wvQcm3CuVLh3MS1xLto70bL6n2vGwjgHTcchJAS9vvlrPZp3H4EqXBekpiRpLkd
	 M05YcCm5GMaUMXUCwM3+2HAyC9zYwZaryyUPa+fFvd/c/AAzHh4xGJvOjlEq7QuZMD
	 As9XpTUTPm5TshsyaSG97Pr5gD+USTPgMeB79PEt6LND+5LwyJIG3KcG5KcWfIaVeT
	 bJKWgV5LVvBCA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 80895DFAA84;
	Sat,  2 Dec 2023 23:52:44 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.7-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87jzpw9p2g.fsf@mail.lhotse>
References: <87jzpw9p2g.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87jzpw9p2g.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.7-3
X-PR-Tracked-Commit-Id: dc158d23b33df9033bcc8e7117e8591dd2f9d125
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1b8af6552cb7c9bf1194e871f8d733a19b113230
Message-Id: <170156116452.30388.428583211197102420.pr-tracker-bot@kernel.org>
Date: Sat, 02 Dec 2023 23:52:44 +0000
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
Cc: axboe@kernel.dk, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, tpearson@raptorengineering.com, daniel@mariadb.org, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 03 Dec 2023 10:12:23 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.7-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1b8af6552cb7c9bf1194e871f8d733a19b113230

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
