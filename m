Return-Path: <linuxppc-dev+bounces-14192-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6774AC5FA0E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Nov 2025 00:53:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7YrJ0nJbz2yvv;
	Sat, 15 Nov 2025 10:53:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763164431;
	cv=none; b=krEgMIa5VcmclktLRsLwcmahHppySrMSuugPmu8i//rr6q4fvhgG+zkyug2MtIHPzrqv6EfScvwZerhQdKqr75ij9AKaL7Jg7rfvwkGNArfPjMpjHv9QKBJKxj8HCjWG68MT9DdcChxsTcBOFynBq2KTLoJRWseYrug+n2MLwvKnTMc2onwaMbFCO+nWu+7XinB7LRhcE/KLn3cMZeigxT7AN9ED7+mnsdPpoloLYNacJEnOtCDgWYI5VrmX+/Z+SO23G9RnoKVlFHHem0ZlNtvlyxXmIPEMgmOzmnZPeWo5x+0wMzlG3Ml8q3rrW1W9X4KzQQ+Z4wEYBSayompEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763164431; c=relaxed/relaxed;
	bh=nLf7eP91tpZ6v8tsxAVMUZKijWPtUuKId8yUuRygsuo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VVExeX881C2tidOTDU0Fsoo0xM1JC+4UxNhuZhCkyNRWz0wekGHvLsy7UsOLAEXKLcd3+38TuR+rIJTow+bvpmbpLWyWCniDXbNOXOktV/oAsUPDKTblm9MhgOlytBl01EB94bafzfu3tZD8UxQu6Dgaotu2m0aGdrBbHCR2HBmamCKSj2NVa1zekiF9BMvrVSHWtBhh+Wyf5pz0uZeV3gGXEaxxnTfYqIh3vUntYhaaQuWmoS+oz6GiUsf95nPBkXi579mNYUuEJdBdwl4CPZlG55Tc3PJ3/JJRTDdk0Avl3IgwGgdSk2wpq9BU/XGs1eAH/UBE/ypqLbQwwEq1Vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iNjCkzRz; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iNjCkzRz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7YrH2kybz2xqk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Nov 2025 10:53:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D006441FF;
	Fri, 14 Nov 2025 23:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF7CC4CEF5;
	Fri, 14 Nov 2025 23:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763164429;
	bh=Y+T8c1YmINJrU4C2k/nYgcXHTy7HRhPlKpNn+mG9VoE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iNjCkzRz55SKhioD7KBxMWCD2efspYpbUC/oIKCjBdxFG7+H/HW8GCtUjPOynAFjr
	 7FfcbHfWe6RNZaLCMAXOlWpLmJi8U8/j70jIXvp7GuR1dRUK+Wr09ml95O1a1lSpzR
	 2fSUbI48Id+xcnNmniKPcqSdh7lUDA92ea9ctrZUimuH9goV+LVk+M5Mv+dkrhq5WR
	 YbXfQlI4fmHFF31aDjd+kZ/nE5He4sVRGBzKm7q4A5GrUIEzNrdSAcvrrCVmvvtByo
	 YlSWRi24CObaNHeotbSHNgrgvDPXRfjZbdZYKvPLN/WgPe1q5sbyErAPA+QM3txmIO
	 n+p4kG3phrBvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE123A78A61;
	Fri, 14 Nov 2025 23:53:18 +0000 (UTC)
Subject: Re: [GIT PULL] PCI fixes for v6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251114222420.GA2346148@bhelgaas>
References: <20251114222420.GA2346148@bhelgaas>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251114222420.GA2346148@bhelgaas>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git tags/pci-v6.18-fixes-5
X-PR-Tracked-Commit-Id: 921b3f59b7b00cd7067ab775b0e0ca4eca436c2f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7a0892d2836e12cc61b6823f888629a3eb64e268
Message-Id: <176316439762.1879382.4119193063808876633.pr-tracker-bot@kernel.org>
Date: Fri, 14 Nov 2025 23:53:17 +0000
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, Christian Zigotzky <chzigotzky@xenosoft.de>, Lukas Wunner <lukas@wunner.de>, hypexed@yahoo.com.au, linuxppc-dev@lists.ozlabs.org, debian-powerpc@lists.debian.org, mad skateman <madskateman@gmail.com>
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

The pull request you sent on Fri, 14 Nov 2025 16:24:20 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git tags/pci-v6.18-fixes-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7a0892d2836e12cc61b6823f888629a3eb64e268

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

