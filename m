Return-Path: <linuxppc-dev+bounces-13042-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643CCBED53B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Oct 2025 19:27:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cppYL66ffz3ccN;
	Sun, 19 Oct 2025 04:27:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760808470;
	cv=none; b=QxsY1Fc7qW9L9dOhh6zw8WWC5bX/ECw/HAt9Rg5nl6XGb2Y6eteKGa4nVgre4F9AsfshIzvJ4atNtk2taIAk8JEGcghMtUAJCBRtkbX3rd0kuOPi6Ep/zdGdnoWCtnb5y6o51jP2ruhxfl8TrtNU90zg8eNoqHDlDBSuN3kDn4zG1vd6FiOnLq6fH492V4k/tKNNLocBHO3FvbWCGs2W5DJJp62n8EuDYPLI6l5a8diw1km+LjLb4eB8v7jwiewQ4xVnLbrIgoNYD293vos6xqgWeYvlZucFRwTiXjXY9BLZfry1Ndvyuz9yKVLvcodkslSBoGpvDsyK4kZX8amDug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760808470; c=relaxed/relaxed;
	bh=ejsAS7Sf2FlzRNMJNOa96cFGUf8phYH2gRVV8eogVPE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dNAZ4aOioAzsXSNdoPLGVy5G6yR46FEawDWa5xkGdDqXKWPeleLa3sXpFScV+C2e+cOXvEgZ1Fl94uAsAJTSqO8ppvsFzFBja372TFxOXeH1eMUds7Ed24//bfZbfy2AzhA9Eunr+hgZUfu5BUAwWxrwJ4TYVPepv5p9EnnP0efnUWZxhhJ5TP4lLauv4qjyIBUfK3Mjlm0UmuDS0HNyFXwMxukEjqLvzSa4jMRvinnPNGwe+ONGbSNpcTmLnsROpjrTPphDgjlNlhq52cQ6zsPLE8cBzM+ANfW/KpeXLaCX9WtrwvhNHnVuwWpfGYrLXs8KmG8xd10srWakqgXLYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HKp+CCP3; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HKp+CCP3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cppYL1MNfz2xcC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Oct 2025 04:27:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AFF3561179;
	Sat, 18 Oct 2025 17:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2C0C4CEF9;
	Sat, 18 Oct 2025 17:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760808466;
	bh=DyREwtsEfbX5QW2yfZUTh9ziDj9TmwjobncPYUNGy9o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HKp+CCP37g3AbhoawJ2U9xpXlcZDSDXJr6rTZY3DmIGnoDSUuYgtPb0dR2+v+mtvh
	 3ZUSJz2gUDL7jnQZLKapDq+nNY50La1ybGCgGFxxbpmKqlRnTzezWwPvGyeN7ZJVpW
	 BE+rBxtWqLnqidmDmkHna7DRR1Z+LkRPGyRWST00HechwfBJTeQcOEAcYbYEXfFcnb
	 dUarUZYzGtwZkzBYIL/zChf6wb0SpWk0IpL4LUrpDGq4v+hJJBjXRwa16O+FKrbUxO
	 yZnZUnTpset8JsDIvxL4gE8MJsnO2IUOIbPlnF3ky1P00G2MjWDOOKX5g6dpFe319Q
	 /MY7L5TascK+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFE739EFBB7;
	Sat, 18 Oct 2025 17:27:30 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.18-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <2de37987-076d-42c5-9597-0ef374f37e08@linux.ibm.com>
References: <2de37987-076d-42c5-9597-0ef374f37e08@linux.ibm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <2de37987-076d-42c5-9597-0ef374f37e08@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.18-2
X-PR-Tracked-Commit-Id: 0843ba458439f38efdc14aa359c14ad0127edb01
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0e622c4b0e02ca1946a9fadb63f00ef733e8ba28
Message-Id: <176080844931.3050468.146636162209660874.pr-tracker-bot@kernel.org>
Date: Sat, 18 Oct 2025 17:27:29 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, ajd@linux.ibm.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, namcao@linutronix.de, naveen@kernel.org, npiggin@gmail.com, sourabhjain@linux.ibm.com
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

The pull request you sent on Sat, 18 Oct 2025 16:21:56 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.18-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0e622c4b0e02ca1946a9fadb63f00ef733e8ba28

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

