Return-Path: <linuxppc-dev+bounces-12626-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2A6BAB1A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Sep 2025 04:54:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cbN2J56Mxz3cZL;
	Tue, 30 Sep 2025 12:54:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759200888;
	cv=none; b=LuTzPoW5Fz7k3963Ovbqw9gSqMcMB/0UleFLMYi8MtdxyjDOjFoX1l8DbkvEJIo/PvLHQ50pghQJ+GVqdUHH6gW0OukQIwaVoZpgQJnlTpsIrvYdBEUjx7ZYf6a9CRKjMXmlHZaNhDvuXH8KaQ4rMVhpDF6U4R8jVPPTV628bX6XAUonPN54/Kc/br8rFMY8uatGvxzNekC8EPIiIRZfetHTOqofkfgLQPj1zEMyFOcv/MObifufDV+g/P+ducYGpr3VqvCKVo6qD7d50rbhFk7AeZXVE75W+cI42Oc+DIfEFXte2SYQ0PtBD6Vi+i0vg0HSnwWiX0cK621R85z4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759200888; c=relaxed/relaxed;
	bh=mlQDovn1uMQI4XYTT1fjq8xm6GWxkWTZaYdGgZpB70A=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=EOp+p7CdHHetnh6lWD1/3jtmU8/jBhNRCsoM/xlMaccyXCZoqy48WHRYZcXsUijvJJy8NOsh2xMVXpBkAxU+Rc2fKn9Q4ksanxR1u3VICIasDbvPRQRAp3qRe1By95EH3LoE8CHOAWU9lythLGhIjVzuhNlXNqxWX4B6fjJjqrW+yJvdQYLAtQpCoBFuY/iqA3Tg2BA38QDfc/v+A49VqJ2FBKGA5mqyfOE2y+AxQNTtdaswotJpqAvXnaTU2usXtOvNJ6ULzA+1H5Rcfm7YFXzH7/1vz6Jh7AqxWlziNtCZsfrz2/HLWFmuGI8KZD53DXhMEXCiUUmznrclrC+piQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lVAPqqPw; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lVAPqqPw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cbN2H3tcWz2ywv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Sep 2025 12:54:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA6636033D;
	Tue, 30 Sep 2025 02:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508CAC4CEF4;
	Tue, 30 Sep 2025 02:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759200882;
	bh=dgkK4EJcZHiuCBGTJ9a5wfkKCFJjD76Sr6N8F/kXGV4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lVAPqqPw6QMXiZPs9mOtotS3f+LY3UsmXdQUXm8OqSmREDrXEFTFywSFKTqVxd32k
	 L2p/TWFob4uO7lqsJeftCAGZ8pWjZ0ytMunmyKZvKpJCHShOzWpL2ZoFTmlBiXPIgp
	 oCoABkK1TClx6ZlzWajU9fR+F32zE5Y7jHcAmRr/ky/bNObTxyLRrTtqvofAHaS7gi
	 29V2CfJBbhE+0iN7Mnv6MtNsC7eWZVB6sXiIuHbORhut4SbQ/ZOV4dkKoJ4H8Ke9QJ
	 dt5tMX2qj91TlHqPM4efegjZN6aiGjUIxNdLbEzToiB5NNuvRmq7w1OQrEBU1d7RrZ
	 yeq4wxXUpV6qw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE4D39D0C1A;
	Tue, 30 Sep 2025 02:54:36 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.18-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <ac4dc89b-6961-4900-a7e8-c522264076f0@linux.ibm.com>
References: <ac4dc89b-6961-4900-a7e8-c522264076f0@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <ac4dc89b-6961-4900-a7e8-c522264076f0@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.18-1
X-PR-Tracked-Commit-Id: ef104054a312608deab266f95945057fa73eeaad
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 417552999d0b6681ac30e117ae890828ca7e46b3
Message-Id: <175920087537.1805104.12802141093962924925.pr-tracker-bot@kernel.org>
Date: Tue, 30 Sep 2025 02:54:35 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, aboorvad@linux.ibm.com, adityab1@linux.ibm.com, atrajeev@linux.ibm.com, Christophe Leroy <christophe.leroy@csgroup.eu>, gautam@linux.ibm.com, haren@linux.ibm.com, hbathini@linux.ibm.com, joe.lawrence@redhat.com, kjain@linux.ibm.com, kstewart@efficios.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, mhiramat@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, namcao@linutronix.de, naveen@kernel.org, npiggin@gmail.com, nysal@linux.ibm.com, rubenru09@aol.com, segher@kernel.crashing.org, skb99@linux.ibm.com, thorsten.blum@linux.dev, thuth@redhat.com
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

The pull request you sent on Mon, 29 Sep 2025 22:23:42 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.18-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/417552999d0b6681ac30e117ae890828ca7e46b3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

