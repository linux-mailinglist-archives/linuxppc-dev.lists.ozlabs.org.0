Return-Path: <linuxppc-dev+bounces-1364-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3408F978C15
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 02:17:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X5BZk54V0z2yLP;
	Sat, 14 Sep 2024 10:17:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726273054;
	cv=none; b=U3KoBy2OXdKpzF78osHw7qkaHzB4sYy5rdj8Tigop+OFlUpprKzf8U6Z9fza8f5fxUoiXHv43lrJTsRl4lVoPnJznhcVfEK6Jxty9ng+B3AC14eVKl4LtMiZ+6kag2ZbaW1NE6c9flw8rPIHxXUwCdY+seTL5XrgEI0j+DS5s/iU4BxJzJ7y9BCOIoUww7juQ7FV3I+H28D9NGReQcO7ZKFNiy212N7WbtK/X+WVb88doyS1mB2+3VgcyfRKE2SLBERduGHYurmPKlhteho8YFoTOri7stUEXj2rwFIbMN3QEb3cq3+NLkW9QhSFatbQqOBR4FZi7m1bfWeCfJqMwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726273054; c=relaxed/relaxed;
	bh=ZHm1Lv5MbMyugHEz223tEbfFV1KRfoLFCN+vTWzHnmg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bnFDzCN1w45AYQw1NpH6b3VY9jGxIj4iaKpezeuuotPlMmYyjmCaxAvY0EBrc2SY0WmJkgUmjZlqVKBE49iGsLQaAL1iI9BFCBQCTUvidxcT88K8LbCFiHUe4gKDsYhr2DKexNAMx8DWaqo03gvCRBfV43NPC5vuRxghvw7KBocZ7QnQ7S6Mcw8DMzWC7kZuVzF2Q+wQs5k1KNb4c71C04ZSn35mOjObs/kMFGfq1khDbEaySx1KfOiY7EJuh01jh8MuyJIw0mdRAUxHjaWjZULFfRUgJVRT9P4YtPJkqYjyTOkwzJUlYwAdtP2411Fh0yE77jbLQ5lI04zVyOpS4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mqYlJ2c6; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mqYlJ2c6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X5BZk3J6Nz2xKg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 10:17:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44706A45B30;
	Sat, 14 Sep 2024 00:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19171C4CEC0;
	Sat, 14 Sep 2024 00:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726273050;
	bh=ZHm1Lv5MbMyugHEz223tEbfFV1KRfoLFCN+vTWzHnmg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mqYlJ2c60vfgMFnBKVwwF+uVAM7efmBHPfOcj9aG3XgSISiKTBvljCTmRcm7nlj3W
	 vUExlayESGfIbxMrro/lk+6Lt9Fb6p3OwF1Kh1Fm80llxotXee+aeL8vvLN5NFZNKD
	 SRvdG1FPXSlyK7VsZhwrMaA2PDTX0EhyaAvN7yZQCHCTPCf0O2A4ilDpAOSMMApXVE
	 t1oFwB4Cn8UiZFPyKIE5tMyUlOtlBCmkFwMJ2/k5tXKqZY+jV++8CMAPPXR5UlWa2b
	 5HnoQGs2YMdoA22oLv6JBjw8FVwC8dwxNEqLmVbpGczSKmmvviFLtts+A34Or37HCu
	 oKu4m5XboH8og==
Date: Fri, 13 Sep 2024 17:17:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: Matthew Wilcox <willy@infradead.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
Message-ID: <20240913171729.6bf3de40@kernel.org>
In-Reply-To: <CAHS8izMwQDQ9-JNBpvVeN+yFMzmG+UB-hJWVtz_-ty+NHUdyGA@mail.gmail.com>
References: <20240913213351.3537411-1-almasrymina@google.com>
	<ZuS0wKBUTSWvD_FZ@casper.infradead.org>
	<CAHS8izMwQDQ9-JNBpvVeN+yFMzmG+UB-hJWVtz_-ty+NHUdyGA@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Sep 2024 15:20:13 -0700 Mina Almasry wrote:
> I have not reported the issue to GCC yet. From the build break thread
> it seemed a fix was urgent, so I posted the fix and was planning to
> report the issue after. If not, no problem, I'll report the issue and
> repost the fix with a GCC bugzilla link, waiting 24hr before reposts
> this time.

I should have clarified, the "please post ASAP" applies
to all devmem build fixes, ignore the cool down period :)

> I just need to go through the steps in https://gcc.gnu.org/bugs/,
> shouldn't be an issue.

Just post the link here, I'll add it to the commit msg when applying.

