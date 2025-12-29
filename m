Return-Path: <linuxppc-dev+bounces-15075-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A57CE5BFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Dec 2025 03:37:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfgNx2KLgz2xdV;
	Mon, 29 Dec 2025 13:37:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766975857;
	cv=none; b=IF0IzpSG7XJKBTT9fuJTIwTpefJaUkkGSm38EB63tpPXn42RO26LTu717jFbptBmsu1iJqzBO04Nqt2zUOXsJ9354i3DNMfJ7o+DYOWJeyAg27la3yRVuXZ5c261yYzZU9zN2eBzWy2uWDV1IyUwmtuFLWDdI/oLudM+m/dKlgbn3XzFTYeZFSjoEuFiNXZstTvygogw20afUhNrInWJpvTImpknd/MAHr/53GDORjWu1E8CFAr8ZZzbqQ9RzuQeYsGDNi0+Q8dWmVi54sQB1xg1ub/FYOzjE+PaNHAQtp1901JNhjwiDJQWDbRpgN/c6feD7JDdE7w5o/k9KOyyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766975857; c=relaxed/relaxed;
	bh=S9VeHYBGYzufIHoXZ7+7nIZsMlyuF+mkkCcKXFJHU5U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FGWO0n77Bd7gV4g/1tR0BEzuNn7bkPC0JWA1UyNpY/HzbWl/V0KOXGx7MPO5HaTmzE16yltfi+OYPzZxpMk7HczTpLu7w6/P8u/jVDirYEGN1PgKPtm5ke0lSzv8Q5+2CaCn6Bn4VX0Lp55e6gkhF0qhfF4MVrdQwSkb6BZ05JJ73g4RVwxTrcB6yQmUJQAECVihLz6L/RQtQRfiNOoZvpZOaEzmz5lbUnazX/kBJqYdMfnsG6iuVGQrmH8OKD7Q/G+l4u/CDGwdM8YNp/VbwWZpQ9Uhq/OUS0KsNF0o7oKgSXQvlbOEnxX7dRTwkIiCcDr974y88o0hLaXY8hfuAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dFh51HiR; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dFh51HiR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfgNv19qKz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Dec 2025 13:37:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4608C442E4;
	Mon, 29 Dec 2025 02:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A23C16AAE;
	Mon, 29 Dec 2025 02:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766975852;
	bh=GIe4Q8y/M7axfDUNf9aO2BTdQHohC6OE0LriE8DTDQ0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dFh51HiREYSr5kgvUqPOK175OPI7v5jUezbK4DskRsVCova1fHyRU1IMcgkOj3A5j
	 E7jjjD8CbhUZbCseIfOlPlflVQS6vzaX5NsswKoULDYx/WObqXqMShJDK825xezeRU
	 IIcjs+C8u/rpqnxYRkWKMuAlRK1VtB5B4qRdUSHq8w7JVjY7ReUAo4Bg9oIX8oC8Oe
	 idIg/+0vGhDYr9xpJwowmWztAKR9tuHjlBt6yTXP3sT8eFO46GPt8KbsO1HqdqcMaN
	 3NvgDOGQE9zybbyiYbn4si5B0ipMvIO7vQlW5kQEbjS4ey6qObaubrKETbjwYShPcX
	 rRRhdgCHBYpwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B9083808200;
	Mon, 29 Dec 2025 02:34:16 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.19-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <4c4d93f6-efcf-4195-8f6a-1954b227d81d@linux.ibm.com>
References: <4c4d93f6-efcf-4195-8f6a-1954b227d81d@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <4c4d93f6-efcf-4195-8f6a-1954b227d81d@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.19-2
X-PR-Tracked-Commit-Id: 608328ba5b0619cbc28b409296b5e3840bcb97b6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cd80afff4877e1151ce53d48b65eba9de80ac1d2
Message-Id: <176697565489.2397610.620093321296958893.pr-tracker-bot@kernel.org>
Date: Mon, 29 Dec 2025 02:34:14 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, aboorvad@linux.ibm.com, chleroy@kernel.org, christophe.leroy@csgroup.eu, fthain@linux-m68k.org, joe.lawrence@redhat.com, jstancek@redhat.com, krishnagopi487@gmail.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, naveen@kernel.org, npiggin@gmail.com, nysal@linux.ibm.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list

The pull request you sent on Sun, 28 Dec 2025 08:43:06 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.19-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cd80afff4877e1151ce53d48b65eba9de80ac1d2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

