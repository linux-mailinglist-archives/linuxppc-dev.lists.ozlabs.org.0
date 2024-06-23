Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBC3913BFE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2024 17:14:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GxKXHz+2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6ZPK6Fwvz3cXH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 01:13:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GxKXHz+2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6ZNc04fmz30Vr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 01:13:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 99020620BE;
	Sun, 23 Jun 2024 15:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48940C4AF07;
	Sun, 23 Jun 2024 15:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719155593;
	bh=Ke4YKwdn6+bRr5Uztay6lsCSs0HoDUzhjUCLkp0Hsw8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GxKXHz+2TPyYGc5aK1IG1M0x6S1fZkTwDELur1ORYikmLbRPD4gqWqQ4I4nKVNKH8
	 7uW03/mfUitB2+SxROe7VgYb3U8q3CU2FzBja3pHTzIe44dYY446dL/CYDo7KWBYHG
	 AQ+XnADIqBskU3gQyb7UtyQHLovYk3+1mvNnCYI4pfMTMQbQqQ1+5YMvg0bpqMz4Q4
	 ymxyE3HC/kus/rZzbG768zBRDIbUozMWjStPa6k06HHwj8NZArEYBPPEOy9sNmp74r
	 lG6MxeUFbJMAuv6rI6CikEKGhGWyue2KvVhXTFhqWaHrx0v6Obf+cp5m8VCiIqQJMu
	 o0qXjheWtJnsQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3BE07E7C4CA;
	Sun, 23 Jun 2024 15:13:13 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.10-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87sex4csyn.fsf@mail.lhotse>
References: <87sex4csyn.fsf@mail.lhotse>
X-PR-Tracked-List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87sex4csyn.fsf@mail.lhotse>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.10-3
X-PR-Tracked-Commit-Id: a986fa57fd81a1430e00b3c6cf8a325d6f894a63
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d1505b5cd0426bbddbbc99f10e3ae0b52aaa1d1f
Message-Id: <171915559323.3671.17650010826239532705.pr-tracker-bot@kernel.org>
Date: Sun, 23 Jun 2024 15:13:13 +0000
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pull request you sent on Sun, 23 Jun 2024 12:07:28 +1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.10-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d1505b5cd0426bbddbbc99f10e3ae0b52aaa1d1f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
