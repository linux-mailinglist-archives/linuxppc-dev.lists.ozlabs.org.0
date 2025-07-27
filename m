Return-Path: <linuxppc-dev+bounces-10415-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA0AB1301D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Jul 2025 17:41:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bqm796z8fz3091;
	Mon, 28 Jul 2025 01:41:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753630901;
	cv=none; b=dUBOyf7nhAmGlmnHcURFBmOSiehgQSaWi9FKS92AA57fYB6uqewCBcoVemVdM9sQYEUgLktZzObro5tu54EvrlWqwbpkXi1/xWqSirTzPSKsbr9XdsVcalwoZv7keF72Xztwj5poeQu6ByfZrFfwReT7BIXJfGV0BW8TCra4LZMDNxLHjIb9VONTf7EJbxR4GFZDZhCjvKEBimLa9huZpw+9lqHirSzohJem8kst0maxir1gS3+8ePocKMHhFYOaPFfXRTsEu4zPgYmJwP0x3mngjRUsN/1jzS0aHOXyXfij1ojVwCbwUHrwZAhwHwqeRgaySRQX7WgdtczsZsr2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753630901; c=relaxed/relaxed;
	bh=d5ryRhpyND7wEhukHccAa9IlpSds5iUzN84/Vv2SGcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+3ic5NTzefE+wYYCmHVZEbtEaJKguEX6ZKe8CCc6bUlFlWSRrL3wj+nsPMzvdE8+EfYYP4fIqYVhyfERXAuRe6fjAsio8j8TgfjAX5GADCkPcbD+2ehJUTipxvDl9NTW1mv2mByqG3G4sUNDpMODSxBNe6Bh2FDMbkVKd7OJgbyV4bV8h8aUumUuaYbZVoPYxE1JH+IupPdk/L5bBl0F6/a+Ob2LEXSb5IJ2WaPIiLV4lhyp8zATfDHbQ/QAUUuhrq8s5CZI7XW4fQFCxTj9KXBKPmd0Y5MzhE5LYhBbaiQEwyLuz9tgPtnrB/R6MdJOttYaKBiW6Ae3T3dJrae7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yWSXGF17; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yWSXGF17;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bqm756jRyz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jul 2025 01:41:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=d5ryRhpyND7wEhukHccAa9IlpSds5iUzN84/Vv2SGcQ=; b=yWSXGF17nfhsTwPzfkXMnKng+G
	Ca7TNYvp8is2UUWbCdHkcOpGPCEYAJalh+xSrYC2DFYAYxC6l+r//97CaobWk+/G4zd3ss1z1qx7m
	X/O5q8q/R7qiH3xZFDA3+SlcG+DAvP9ben3LkEr7vZg7We60/DVI2IJds2Gm6TQwlIzKvYKh4fiLg
	QPw5+pt5Flj1os1isgRv+OBsehHfJOYiIM2cCLsPNaI4EUfpOzOT3QIAC2QVdzRJkqY4IUe4MluQx
	TiRmnzXeR7UNoZBHTf78499PVy6DX5p7QM3Dv+5TD41WSKr4DJ6DtJkkVESeOG6q9xlNFNlGfCxDT
	kHNqC0Rg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug3V7-0000000Cs3W-1fxZ;
	Sun, 27 Jul 2025 15:41:25 +0000
Message-ID: <5ac25ceb-023d-409d-8e7e-014d010c5028@infradead.org>
Date: Sun, 27 Jul 2025 08:41:24 -0700
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
Subject: Re: [PATCH] docs: powerpc: add htm.rst to toctree
To: Vishal Parmar <vishistriker@gmail.com>, maddy@linux.ibm.com
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 corbet@lwn.net, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20250727110145.839906-1-vishistriker@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250727110145.839906-1-vishistriker@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 7/27/25 4:01 AM, Vishal Parmar wrote:
> The file Documentation/arch/powerpc/htm.rst is not included in the
> index.rst toctree. This results in a warning when building the docs:
> 
>   WARNING: document isn't included in any toctree: htm.rst
> 
> Add it to the index.rst file so that it is properly included in the
> PowerPC documentation TOC.
> 
> Signed-off-by: Vishal Parmar <vishistriker@gmail.com>

There is a fix is available and scheduled to be merged (when?).

See
https://lore.kernel.org/all/98a8a5ef-45fd-4b1e-a775-d1e1306ad682@linux.ibm.com/


| Yes. I am planning to send it as a fix patch in earliest rc for 6.16.

@Maddy, does that mean during the merge window after 6.16 or as a
merge into 6.16-rcX (which is now)?

Thanks.

> ---
>  Documentation/arch/powerpc/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
> index 0560cbae5fa1..173a787b6cc3 100644
> --- a/Documentation/arch/powerpc/index.rst
> +++ b/Documentation/arch/powerpc/index.rst
> @@ -36,6 +36,7 @@ powerpc
>      vas-api
>      vcpudispatch_stats
>      vmemmap_dedup
> +    htm
>  
>      features
>  

-- 
~Randy


