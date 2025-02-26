Return-Path: <linuxppc-dev+bounces-6517-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ED8A46DD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 22:46:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z37MQ6Tgdz301N;
	Thu, 27 Feb 2025 08:46:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04::f03c:95ff:fe5e:7468"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740606370;
	cv=none; b=ATzScOEhXT8dq5CBMGvDJw39PIPBrKb71ZmY6ECVTxZhHtgqQJG+xtY/ROzN0fMCH/7FJX6t9HADVaMSqq5jXR+wkOwGKG5zFOQJK4RrKN8/R3jNhMYNWxLOV5LvvAzzhJ8L4RcNmEIQuqcuOXOPyMWyLxqJba04sKYlzznc6ykd4ixGTB3vnaRdxy0Ev7ux0wnpV+9UfQbieudPZxRn4IxG3luX2iPKCLs0botZJfYqDp1XUhYPNUG2dmaR5PTj7OpkAYB5QM0Nyveh4eQZJYx9xKIINJSu3k/dzRNVeURpNgJJsPU2bd32QnuKTZBTpZhnXD7qS7BOZORgq0T8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740606370; c=relaxed/relaxed;
	bh=/SR+mxPRpQk4l80ELYMmMSnDaUZ8hf1bdNpzWJhDT5Q=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HPXuZm/Fe0zQWAUNCC8NCsXyNnPE2Dom9yFMsOO5CprMt6y82nzPlm53DULf6Ce+BREb5T2gcsJ9viRDCkgqMrfzHW7g3UAfXdvHHRnM7aNHbXKV03u6k5ROr3+y3+3DBrgPtU6WlvKz/3kQd8em0x1Tx6mQJWm3gZ24T8uovZUJ5MFTtxfjlNS1YXaTW7ySpNshI9bxKFp0jE7w5TSIe5eL0kd7qYKDQIU5DKe7OJ7cNLw4Zwfc3C9DuiR1ewaSEuoW+OpKORgDLCPoytdfq21o4PUDMUNEvruUPPhcr17HS6+wBKpdhgkUyz7ceNRJQi6Ew2P1v96iMb/n1rmaVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o5LBJcCF; dkim-atps=neutral; spf=pass (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o5LBJcCF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04::f03c:95ff:fe5e:7468])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z37ML1b9Rz2yn9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 08:46:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF37561155;
	Wed, 26 Feb 2025 21:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DA2C4CED6;
	Wed, 26 Feb 2025 21:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740606363;
	bh=NvvKpkGJzKdBmVdSHKvQeCudG/o+fIuupyMwACZw6HI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=o5LBJcCFBqyCoA++2jNtm3R0cIbpiA4fvf6SgVlzLtdQ+asVhSB7LKMvYjT1x13hE
	 VLND1A5cbzE61RfdFL271EGHoPI5cHHimkTypQQRWvWKAHBuNU1IXtFfpVmxgXpZZs
	 PiOy97pkX8staCy2dVhKTH/D+OALpguRyVdkDOh5uQh8b6qpvpqa/QAQgJra8Vp+0E
	 xsIjPjAVdB9aYbCrXqseiIDQ0LWXtTeqUPKcAYyB9vK9VQBSLdYPTJzcPK8NBHv8c/
	 yURKRRh/KD9iasb7yv+y05D6zGQQaZsDEdGMUtrhQpE/e779gd2tp13OqBx1IMAWRh
	 QJPP5D02QL28Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71720380CFE5;
	Wed, 26 Feb 2025 21:46:36 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.14-4 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <8ce77d4d-cd19-472b-a526-0c80feb2b028@linux.ibm.com>
References: <8ce77d4d-cd19-472b-a526-0c80feb2b028@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <8ce77d4d-cd19-472b-a526-0c80feb2b028@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.14-4
X-PR-Tracked-Commit-Id: eff2eb592efd73f00590d578c3d6021f604df62c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5c76a2e4baae7a3f76ad2cdaef5c59871bcfb2b6
Message-Id: <174060639499.856033.7692007895567117596.pr-tracker-bot@kernel.org>
Date: Wed, 26 Feb 2025 21:46:34 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Donnellan <ajd@linux.ibm.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

The pull request you sent on Wed, 26 Feb 2025 09:28:52 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.14-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5c76a2e4baae7a3f76ad2cdaef5c59871bcfb2b6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

