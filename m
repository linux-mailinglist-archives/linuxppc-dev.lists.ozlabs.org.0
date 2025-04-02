Return-Path: <linuxppc-dev+bounces-7428-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B02F9A79694
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Apr 2025 22:29:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZSc1417Lwz2yHj;
	Thu,  3 Apr 2025 07:29:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743625784;
	cv=none; b=JWyyDx+h+qNMdGBN23zk5UiSzkwpJZk6ZySGbmVDKruFOFe2ChFNs7RwsakmyPgEfKLmLrY70Y6JvI+Mz6FiRSIGDJmU1M4j8t2kho9Tq2TbXoo/T+XDf1FYbAwLFdzh4YfC+ZGQhtRjMBpjbP34KmQDYay0rGdqi9j41JVuGtFp9q/hvtRf5qAszxTxAj5YmepyvEsQubnqHxCExVL3WYA2x5R0TbTHljWg0anIwhXmAVZXQBirXZjXrWE0ITBtyYX8PJDx6GRoKabTQXcMcoYuDMH/zHemZv2eP6JIz/6INfVrHmTJwSvouP/FHPJnxHztk6Nhr/rv5my2ysUdsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743625784; c=relaxed/relaxed;
	bh=acIqgcFw8h9zBrnSJ+O1v2bJ1JMhcrAhj1g4nIzYYPw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=m80ZMhEs7mUyWfjBCH+xuMvuIXgf9FEoS1yQBU8Ut6X7NoXwxaTWbFO16bGlICYvx0tAH3IRx8+jFb8H/kXQIXWJlc4kxdgowqj0AqautQcFa5szTAffDwTmmLu+3pQdSES3sYOLq0vsjNSNKk5wQj+pPA1zJZaGt6K83MWyu1wLCWJLO+S/RKyLBAp1kJ9XreNxBqW9TF+gxNtqJyAYBGuPo+ULMhsXWd+yE6MduV/qF4OClwQb960pD3osk/GUHOLOVuDDmoqBICuOoanZGhrAXKq2pY8zA6z+x8c6/UVs1ogXYFJ9mXrffDb0/0z7WQNEu7ad07hoWe+5S8hFew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZnZkSB/7; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZnZkSB/7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZSc130YFRz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Apr 2025 07:29:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8A23439FB;
	Wed,  2 Apr 2025 20:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1851AC4CEDD;
	Wed,  2 Apr 2025 20:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743625779;
	bh=sGiYg3z/tFgNP8/WeX2yozEZiRzk47zD4QucahjSTzs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZnZkSB/74Ls5R4iJsmRMHuLbE92jjVw+CBPZqqRaNyHF1nCVgqv43Nf4/samwkh35
	 fJ5bxCzgK2LNh+mVebmnygkw4l3hYrXIQ5dER0EabI92wJLNORI9YMTHAo35sU/wZ2
	 gPISmu0Bzt2jpHp445UKvl+8N/QtOVyQeGpb2/Ars7TFpLq84EF27llsAp9AyTU9QX
	 9UE4jhNhy8hVP9CSnWF+ficX3SoLMRHhFMvUunLpnYs1FMk6Tku9E/n+hBGOrS3IPp
	 xjd6oo2E80WhnITklYXR55NxiF0ah/1Svts/ykQ2P2pK0M2cKnKovAwzXIO2CHYvSy
	 vmQPPqldS1YWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34412380665A;
	Wed,  2 Apr 2025 20:30:17 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.15-2 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <87zfgyivld.fsf@mpe.ellerman.id.au>
References: <87zfgyivld.fsf@mpe.ellerman.id.au>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <87zfgyivld.fsf@mpe.ellerman.id.au>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.15-2
X-PR-Tracked-Commit-Id: 892c4e465c360d07f529bc3668fde7cbd4ea6b32
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0a87d6bb6fd274cde3bf217a821153714374198f
Message-Id: <174362581579.1664588.10759501812226685205.pr-tracker-bot@kernel.org>
Date: Wed, 02 Apr 2025 20:30:15 +0000
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, naveen@kernel.org, npiggin@gmail.com, ajd@linux.ibm.com, christophe.leroy@csgroup.eu, fbarrat@linux.ibm.com, linux-kernel@vger.kernel.org, martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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

The pull request you sent on Wed, 02 Apr 2025 23:41:50 +1100:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0a87d6bb6fd274cde3bf217a821153714374198f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

