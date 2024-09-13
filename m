Return-Path: <linuxppc-dev+bounces-1344-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 850069787FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 20:36:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X531410GBz2yhr;
	Sat, 14 Sep 2024 04:36:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726252584;
	cv=none; b=oxVPqLtKL7/+DJ1plwx/Ifcs6V+qclFJNo8GIt0ruW/Z4pdpj7g9lfllWtFMQoZ5UoekGRFW2icUTn7hFcwosEjkTeBRvqJprGmZw7aXw4AxKDOErjBkCsoEO0svgZz6LjTBz0IbvxsCENsa6QDIqHqOE7q9fn/A56AloV84bz99mVou4rn0AlZzKHNjKJlRb5piv5MuYOvZ4UNPJYh26sn3PAVoDdsdCOfO7Wcmwv1ltU3fY2+HynBBaAGOsZIMOpNeJo1KoT3S8ypY4sWAVC+pFDkYoy7OhDvaAIvLKJusoNdRxNj2JqsmbQ0eAgyQ57t7XQfszeA4KElPUlzx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726252584; c=relaxed/relaxed;
	bh=r1+U3jG2WIDSmmYQ1XOaiib8/+EeajdxXEJQNK1cbXs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GCpuoDpzIF0qmwaa2/SNfEF53LqgCAgM0BrPkTQ7o/p/zx03bwa2v84poapQspOXHyhF8m39n8fIuRwJ9j8nrAcyIwS2pmfVwijf+cOVNfiHdqeub10ZK9XXy/LxVAarcHt3mGaLNrRLDwUpDb9GoX7r18LBRnMyrkHRGXeGeQYjrexRXMwsj6IhUlb3KP88wKW2a0H7KFs3D7JOEkLTdpZINSYpBWcrkGJ28M29J5VkPOkoW81SbkWLscxvoUz4gqityrZXdjDwaPDUsAgtTiJO8EW8C2lyMIX5KAH5Z7o+V9DhBmZ8IKKy2vHR49MTy70Dd2x5KbgN27dxz1CmJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xlv+s7kP; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xlv+s7kP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X53136SHrz2yZZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 04:36:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D64575C5921;
	Fri, 13 Sep 2024 18:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A3FC4CEC7;
	Fri, 13 Sep 2024 18:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726252581;
	bh=DURmSPn3hom3PMUxw/RlZtYS/umXZDq7ki4xEsaW4H8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xlv+s7kPhsmgjQZBlLvI3WTkA6JEchOXapISdINJTYfeRg2vU4frhVKqkjOyge/1R
	 mgFpvgCji8IgbyiDL0CaV+ZBFtFJd62/iejaVctLAsScJ8sCYCoaGrvTHRXQWNZ0yQ
	 36MTNljr+yuN+1AwEl2bhfN/CnVGJV0WHerKKENrpO6MY5e8kbuR2GfMurhEb5/Mfn
	 12JvjDcUfbYv/cL/hJ4IJBpDeEUBZhc6x9alaJVRgfD758sRPioXjkJi09oMbkhXuS
	 dR+CBktToH5tvoH/ZO9vfZkGxTpjYOaZwtF58EUtGn2rDTKSvzQ3gD5FCkO8TGffW5
	 uFvfK1+lKTzRA==
Date: Fri, 13 Sep 2024 11:36:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Cc: christophe.leroy2@cs-soprasteria.com, David Miller
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
Message-ID: <20240913113619.4bf2bf16@kernel.org>
In-Reply-To: <CAHS8izPf29T51QB4u46NJRc=C77vVDbR1nXekJ5-ysJJg8fK8g@mail.gmail.com>
References: <20240913125302.0a06b4c7@canb.auug.org.au>
	<20240912200543.2d5ff757@kernel.org>
	<20240913204138.7cdb762c@canb.auug.org.au>
	<20240913083426.30aff7f4@kernel.org>
	<20240913084938.71ade4d5@kernel.org>
	<913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com>
	<CAHS8izPf29T51QB4u46NJRc=C77vVDbR1nXekJ5-ysJJg8fK8g@mail.gmail.com>
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

On Fri, 13 Sep 2024 09:27:17 -0700 Mina Almasry wrote:
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 5769fe6e4950..ea4005d2d1a9 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -239,8 +239,8 @@ static inline unsigned long _compound_head(const
> struct page *page)
>  {
>         unsigned long head = READ_ONCE(page->compound_head);
> 
> -       if (unlikely(head & 1))
> -               return head - 1;
> +       if (unlikely(head & 1UL))
> +               return head & ~1UL;
>         return (unsigned long)page_fixed_fake_head(page);
>  }
> 
> Other than that I think this is a correct fix. Jakub, what to do here.
> Do I send this fix to the mm tree or to net-next?

Yes, please, send this out and CC all the relevant people.
We can decide which tree it will go into once its reviewed.

Stephen, would you be willing to slap this on top of linux-next for now?
I can't think of a better bandaid we could put in net-next,
and it'd be sad to revert a major feature because of a compiler bug(?)

