Return-Path: <linuxppc-dev+bounces-10812-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 874DDB21136
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 18:13:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c106V4khTz3d3M;
	Tue, 12 Aug 2025 02:13:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754928786;
	cv=none; b=BLbrFdgd8HjDj7xZSHNPz6eQl92fO28scfCgcODn4hnyJ85GeYQhol8jt7l9Iw3TGdyWHovQCUsS+1745RnSzEfi7FfijAhMo6STGPR68pPv6Xv8tYtvKkXwV3spxkZa9L8SSV4jYRtzSc72zlKO0q2Gv4zTRjjh2ssR6iTKa5mkvWOCbDZt3P8DBdyIZNYPDpnpvUUBzO8OstluPsGlr0p6Ygri8Dk4AC2o8TSElfhwf60g6xUcT1HNZnhR4ojwov1tcJrJ75eoTy1a/6JCGbcQnrONLhuyEkiBokqRi5p1+dS6GRIRP47x7Uh00x8BMoh6+8ad2+Pf2aUNon4OJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754928786; c=relaxed/relaxed;
	bh=s/zTYD4qQEy0ve9tQCzps7rSClGIjdTwWyvUkrLMc6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ixJjmPP4pp/4yJR515gU70JEauICKeTLnKg4iTqvPbAX6QdQX+49Rc3K7D145UFRGFGZEEDFWzarhydg+6JYb9XgL2swUq7v5hOyw76sJvNvsB5HCzttGpNsY1MZynNHxwTOKARaXRzWixRwSRJnuh5hhPhqG/Bbg+l538yd3kh/5DZau2kYViNuStOIISfOx86uXoWAEQ4RZS7EfizMx6MVKMCQTgB5A7Xr4AoWVf+ZDvLnDRYP8BUlQR9birmf4/XTJxnKAPNFUdb6Dxeoo9MyhNQwoK9pd5/hKY6Y+HEKOv0l9C8Chyxc8Z72JKm2ecZ2YmpuotgvqWs0CG4alg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WSyh0M2p; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=sven@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WSyh0M2p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=sven@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c106T1zs5z3d2c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 02:13:05 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D82DD43468;
	Mon, 11 Aug 2025 16:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A02FC4CEED;
	Mon, 11 Aug 2025 16:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754928782;
	bh=sdcquYL9LCEdj0rf4SjNKoacwa3L7q0NPmRbFt63VgM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WSyh0M2pKerUaE6ZU/c25KWrQzfnS5upssYVicTGvR+Gj+gEhHlDc5RnZpf6aGAQA
	 owMm7ZcWzqIS3i4k8mgvk1pfgY15q5+H5LX4wTjDWnMLnG+73sfqvxijUb8TCf5n/e
	 6sw9rviRAasvexyubCFsdJ5ur8w8DWqlgAo0LY4lIncToCc0y9C7ck9bfSkQMBtETf
	 WewFxgX6k6qFUTPcJMngbXNWauoxaVhKKEDxk+Xu3txIThNjBKtAHk6tK9jqDgbLX1
	 GI9ZkCeDj7sW13JKpRbJImOm1ZsjNbpKVktrqeE8OtRf6C2/WxI9ER4LQJJNhT7+gW
	 Gc31F9lilPPlg==
Message-ID: <d4b0a847-0617-4735-b6a1-ff5375f166bd@kernel.org>
Date: Mon, 11 Aug 2025 18:12:59 +0200
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c-pasemi messages since kernel 6.16
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: linux-i2c@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 hypexed@yahoo.com.au, Christian Zigotzky <info@xenosoft.de>
References: <2810E95B-8DB4-48CB-80F6-DF01EB7BEEFC@xenosoft.de>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <2810E95B-8DB4-48CB-80F6-DF01EB7BEEFC@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

hi,

On 10.08.25 18:47, Christian Zigotzky wrote:
> Hello Sven,
> 
> Since the kernel 6.16 we have the following messages during the boot.
> 
> [    9.459706] i2c-pasemi 0000:00:1c.0: NACK, status 0x08210100
> [    9.649736] i2c-pasemi 0000:00:1c.0: Issuing reset due to status 0x08210100 (xfstatus 0x00000001)
> [    9.690696] i2c-pasemi 0000:00:1c.1: NACK, status 0x08210100
> [    9.708651] i2c-pasemi 0000:00:1c.1: Issuing reset due to status 0x08210100 (xfstatus 0x00000001)
> [    9.892693] i2c-pasemi 0000:00:1c.2: NACK, status 0x08210100
> [    9.911535] i2c-pasemi 0000:00:1c.2: Issuing reset due to status 0x08210100 (xfstatus 0x00000001)
> 
> What exactly do these messages mean?

Do you just see these messages or are there also any other issues like a 
device on the i2c bus not working anymore when it worked fine before?
We added some additional logging recently and I suspect that this has 
always been happening and no one noticed.



Sven



