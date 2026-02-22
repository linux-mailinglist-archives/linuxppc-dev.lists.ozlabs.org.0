Return-Path: <linuxppc-dev+bounces-17014-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FakBPNym2kizwMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17014-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 22:19:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D76DE170663
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 22:19:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fJxhG0PZnz2xNC;
	Mon, 23 Feb 2026 08:19:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771795181;
	cv=none; b=I0dUm3FppnJT+7t2t9mqAPNgl0BGXwohHgu3tFEII/DwQQTBXI91Br4NpyGde0ffQ3X1QEGmRIW+pSh5zzf0Pelpt4gl7w3wzq79qDYCuGJ7U+dM9XLVyEEFonVWqMAFhv0FtPXcOssXfmteJ2fWAfoI9lc0PAP4yJeGgX3wEdTHZJ39vH3HpgM/r/yu3qnKPa7mNAdWziXpAS+o1H/wpvBhI5AUFAc5vDnrq7tBte8mHUc/was8HWAiS87s6K9yfkf1yRgAOJ8sWHf7XUH/aEZC463i1oAINrjwcKVzprnOQPGNUZdrSy6XA8nbFSe7oz62XLiSFsccpII8Inxm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771795181; c=relaxed/relaxed;
	bh=p8Pz+ben0SoHkEv41BEMFA0ox/PNpF6UqKBGyHv4vAI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PUZRL1/89KpmU0ohHKaaycCJZvxtJbKW2G/bhs5Cuislnaah7qD7kQDXOR3O3InkA5AdtowXN1LIEpx/LMuJM0fKb9d646cstKts+lT1/sDbS3MllyfLvGzCKuvt3HT/j/sLrUMsry9dVTModykbvLa6VAbYu0/UynBVwN3LW7v8TkCChGzM/mutBf6I5Ozuc98ZZX6MPBcLmjkwdm9ClcgMsKUfN9Mx587Wuw15NniuhwGDYNq8VjjVaH/tjYmzLRcinv7Nt5CyCif502hC8HMCR/7pJSUdO83qXs5m0X4U/eEKxiOoogaUq6865KlVSL+V7CUSLc9vCbOeH5q+JQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SgGA8UVa; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SgGA8UVa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fJxhF0Y7Nz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 08:19:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26B156001D;
	Sun, 22 Feb 2026 21:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DA4C116D0;
	Sun, 22 Feb 2026 21:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771795177;
	bh=YQ8MiMbU2gaw1BUCBjolouOvZgqpI0bY7QYQ2Uv7Ulg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SgGA8UVa+DLbtw0uMMvdZM0mvbx/1tm3J7uJ5vhW8vKezdHW4feJ8Uc7oz00Rw7Wp
	 uDc/8Llr7uR7QMSYf5wMXi03wxPNIA2ry9TD5na5325D8Cb+Fbg4ktpUjUGsnOQlel
	 w8JemU5TxB389F1qpNtoU0uONDOyQ/o2wQ3izl62aGyDnYjDsvEBnRaruAynXIRdmt
	 cwKBFnRdyD6e3xmj5Z0/4FJVZYoaJ8YnZ4iWsUH/rQVtMfHa5AoJ430Y8MTFlX9OL8
	 pqU+HschbZuRn8QLEuYXrWLKC6XLOWkUriJop6Ef3vB5JdoFJe8yQ/eEKz+HW/dpF4
	 I224K1FdFjpfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA09A3808200;
	Sun, 22 Feb 2026 21:19:45 +0000 (UTC)
Subject: Re: [GIT PULL] Crypto library fix for v7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260222203543.GC37806@quark>
References: <20260222203543.GC37806@quark>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260222203543.GC37806@quark>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/libcrypto-for-linus
X-PR-Tracked-Commit-Id: beeebffc807531f69445356180238500f56951cc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 75e1f66a9ed09f29c6883ea379c174e8cf31f7cc
Message-Id: <177179518422.1502390.6995161937246919166.pr-tracker-bot@kernel.org>
Date: Sun, 22 Feb 2026 21:19:44 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17014-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:torvalds@linux-foundation.org,m:linux-crypto@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:ardb@kernel.org,m:Jason@zx2c4.com,m:herbert@gondor.apana.org.au,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linuxppc-dev@lists.ozlabs.org]
X-Rspamd-Queue-Id: D76DE170663
X-Rspamd-Action: no action

The pull request you sent on Sun, 22 Feb 2026 12:35:43 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/libcrypto-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/75e1f66a9ed09f29c6883ea379c174e8cf31f7cc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

