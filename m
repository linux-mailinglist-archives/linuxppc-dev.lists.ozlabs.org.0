Return-Path: <linuxppc-dev+bounces-13298-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF21BC0858F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Oct 2025 01:49:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctfkS3bS5z306d;
	Sat, 25 Oct 2025 10:49:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761349744;
	cv=none; b=jjgrpCePRUk+dOU+u0hKP/cJIA4yXKAQQWyaQr0eqWP4+wwwk21MV7nlOGsuiMKshgEc3QO2aOIQ5evHmtg1UNOZ5JtI9gaj7tcZ18rutPPxQFPXFT3Ir54tIUVsIKwEWOKZl6/h5k9w+lakIBWEX/THYUj5LYs5Vqef3Z3DMUn2fRGNU5FjcR4Pfa/jl/6srif10tQxHpCcRj1SD6UeFQJBfL9ErZBZ4do5zqdLJgn0AGFtVZ7Z6fiBEO9ca2i1S8YHXyjxB3TyKI2wYP/Nr2R54rXes/y7OibMP04QMcn5cdpI0EtUDBDv+lBTV2qH7ruopsSsLFaPK6sAo5ayBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761349744; c=relaxed/relaxed;
	bh=WPOjnS4YErtJIyH9gdP3trP5u9d3y0tfh72FJN4bKpg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=hZsLB7+Mbo6eJHVPwBhgwxBTbf8ozwQq3/DX15QWbuz9jjaQXsOvyyDr+Dti0SYENqbPlYUKEPfVkXfMqDP4cHQttzqL1Zb6XE0cC8z5gn5TwfwVe6mcq2HOO8k1npNCeTB2myYgObkyaPBYRrwGLjLO2gHuoIC8x7KDupLgFzLB88xDk2mCssCe9fgekkzq9w5QDxkSnxi0kMLCgUyOOeq27QOkTaLMBH8T0QGzzkDER78lOD2yNuVgKd8IeV/ZG4Lt9mjWQfHTAQlVniu6wYSXpLRA03+wqhRGTkZoJwWbBviG1aY2aVubNQF5FqvZikNeeE8CC3RCgtlfTElkPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XlqnJiIY; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XlqnJiIY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctfkR49cgz2yl2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 10:49:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B1260602B6;
	Fri, 24 Oct 2025 23:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53466C4CEF1;
	Fri, 24 Oct 2025 23:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761349740;
	bh=ZyFTDKIxNzvgRWtwrO/yjPr6c+qow1NEKp1HamVZbPI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XlqnJiIYRxG7jDUGlrgYqJuNEyP3QmS68eJ7m8d2MnKUZmQmUwBXHTaojivtAIF7K
	 da6IGCn8dcXFNtL+ve5Q7ealoLlvAWuzzQcg/QW7GYLli7O9Pm7p28kqKMxiscHP97
	 h+JT2tDXQa/UYdhuUY28UgLvVrlcM+aOIS8CotyFn1f/4hdEqnXZ/ht8n6py9E9E5A
	 ZiGh8BrtAYD6BAffx2l+kEHQksGaGKzKbzZon4BTa53+tpL6GsdSJUriDJq85J6Fgg
	 DbgUIxsl9eEj6NfJ1Zmq1OKhqcb207aMPbZBTG252rxtRC6D0bFwK92Pf535lNeTbK
	 FE9dbDbBFcwWA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34216380AA54;
	Fri, 24 Oct 2025 23:48:41 +0000 (UTC)
Subject: Re: [GIT PULL] PCI fixes for v6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251024192903.GA1360890@bhelgaas>
References: <20251024192903.GA1360890@bhelgaas>
X-PR-Tracked-List-Id: <linux-pci.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251024192903.GA1360890@bhelgaas>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git tags/pci-v6.18-fixes-3
X-PR-Tracked-Commit-Id: df5192d9bb0e38bf831fb93e8026e346aa017ca8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 31009296f8ff7f4cc8feec9bc02b87573b2aceeb
Message-Id: <176134971993.4096869.5906045247298146805.pr-tracker-bot@kernel.org>
Date: Fri, 24 Oct 2025 23:48:39 +0000
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Ron Economos <re@w6rz.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Christian Zigotzky <chzigotzky@xenosoft.de>, FUKAUMI Naoki <naoki@radxa.com>, Herve Codina <herve.codina@bootlin.com>, Diederik de Haas <diederik@cknow-tech.com>, Dragan Simic <dsimic@manjaro.org>, Johan Hovold <johan@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-rockchip@lists.infradead.org, linux-mips@vger.kernel.org
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

The pull request you sent on Fri, 24 Oct 2025 14:29:03 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git tags/pci-v6.18-fixes-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/31009296f8ff7f4cc8feec9bc02b87573b2aceeb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

