Return-Path: <linuxppc-dev+bounces-1881-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AFC996A2C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 14:37:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNsqH6ct0z3bc2;
	Wed,  9 Oct 2024 23:37:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728477467;
	cv=none; b=ifG1CCY1IykjavpDfj4BVM7o7bV8Cl69QFyjp0K5XUT1ly+gXrDCDCfc056lEzSY3n2R6wR3DPjoy3dduj8S3c3AD8sCypvja7Va4Pnoj457V303NWnt2s06h58XhjMqpZdWlQYyzr3DMDQ7yg0p0gASqz62QbZKUHGAkz+Z4l9ejkN370jjejeZS8shgyv/Zv0LtD+pT6Dj27fKD8I+0/10dzlRs0rVsFpoziOZHnZ5Gulii5jLDLwIXkW5ims+psJ6BsdRc905p+yTJksFqbwmHc58vJT/OECJJ5HfrqYQlhgtK45JkoXeYEAfmstZSAQH7K8Mo+XBqCytALBsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728477467; c=relaxed/relaxed;
	bh=ZCHBvNOjHlkX+siLDns1RWXcMRQzDNM2td9g9/7Nm3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXx1Vktn448Ky5DGQmtz8YjIb1N1JLSL5n35YF3DVK8DcdSuJp1SV+4Kt3jX/7HyBR8Of6SnCDz9uyfZ5ccDo7YLo83qjSdWouA//5roEnCbyx9UZhhqZaHie/tdLEqLQ1bqOENlq+wWsX3kaOFg7A/ORVGqrd+zYQVkSt6Qjq9kCuLXMJnVN6ekL6Ho4yajHC04NRG+BYESslyRcqcJ67VT1dn6S3bVR85XruPgvEMgm4kM3XhgqzEMeRK7iXTpGVePcvfpnMT8KIS3rbIZsKXVtu5qqs0upS+u8672kL1+uMCFeVXSArCTCn5G+a36Tyq9gcfBmNId1FcFAqHZgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YaRGcAan; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YaRGcAan;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNsqG6vN3z3bbp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 23:37:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F2F525C5DE9;
	Wed,  9 Oct 2024 12:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1073AC4CEC5;
	Wed,  9 Oct 2024 12:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728477461;
	bh=SiPDqZbxdSHfqnUOudAIzwHzWZ2S9RZMyYHTMYzP3+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YaRGcAanTwjPEkDoyGR9D6z5u3sMlPha6DWGOE3lb0ty7pGXzFuMMuNwq9OzbFlq7
	 8m3XnrP2/LEeJqq3rNLC4xqZDt+1+t/wszAoZQEq9XuPA7AAoCMeBnb+m/ystzAut9
	 a/woHoyBuGKKxKUIc5zsamSBMZibvU/tfJrmQnuCIp3VcV+twrS3tX+u4HjGIqFm03
	 MIoVvCvAeeSCRsqCBwpGYn4xxuLInE1TXkTf73VDTzb7p58euLetE1oowAAllyDOgC
	 i/S8jJUzMsbp4BjSmw3CC4woc4DTRhu2CLQNkBsoKfnqtsEgxPP9khl542ZmvL7Y+8
	 JcavTl2PwmUbA==
Date: Wed, 9 Oct 2024 13:37:35 +0100
From: Simon Horman <horms@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, kda@linux-powerpc.org, arnd@arndb.de,
	tsbogend@alpha.franken.de, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
	pctammela@mojatatu.com, victor@mojatatu.com,
	coelacanthushex@gmail.com, jhs@mojatatu.com, shannon.nelson@amd.com,
	sd@queasysnail.net, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next] eth: remove the DLink/Sundance (ST201) driver
Message-ID: <20241009123735.GR99782@kernel.org>
References: <20241008154824.1448370-1-kuba@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008154824.1448370-1-kuba@kernel.org>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 08, 2024 at 08:48:24AM -0700, Jakub Kicinski wrote:
> Konstantin reports the maintainer's address bounces.
> There is no other maintainer and the driver is quite old.
> There is a good chance nobody is using this driver any more.
> Let's try to remove it completely, we can revert it back in
> if someone complains.
> 
> Link: https://lore.kernel.org/20240925-bizarre-earwig-from-pluto-1484aa@lemu/
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


