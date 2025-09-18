Return-Path: <linuxppc-dev+bounces-12364-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A27ADB83E04
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 11:45:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cS9jg189Kz30Qk;
	Thu, 18 Sep 2025 19:45:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758188727;
	cv=none; b=MAWRa+4b8SW+nOScRxVhXgBIk5o5OvqwzEwZI5iXqAufehwBoLAU2T00KFGcEE98ic/C102xcIEqfLbayquwOTOxt/yvjbHBa6Tjl3bEVTAMOX/Vngy8mLXPpgCfKWSciyJbjuJmddGELHDE107qEUCX1XdBv4o7qL4U8ef3BLgt35LCgwg10gUfcL+xkBL/ly8XWxng3eHs2IGwRIYd7ypz1GbzIL8qssJMqVKpOPWvaurENHe8zBoDIKcj/2eXJNNCfyOTr+ZeeeGcXkJbuDIjBgDpFD4jSOcG6FGufCkf4rwH7qeE4vSZR1D796Tl4Ap6pakIHWq+faAKR3WDig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758188727; c=relaxed/relaxed;
	bh=oatovYDAScMrOSI4YJqu+8QfMHSB+UupX7Jb81hVJMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OscYmB/uNsgdZHcw0u46xVFDh9w9lxMLvXM+aBfBcKVzEROpVdrmSBMiYIJE67slvzWbNUtXB1BIqQT5CVzWdQYurovJ7D0gERYj+rgbVSlLF3W1vOEAW0JDAFIZ7PuCiOKdmKwBMid6VkvC4rfweDD61cW6rX+5mX2u+cs3SZDh0teQ/bmwJRQmRyyVUMxfMsgIhuqCX52xVHQnTwGDjTT7C95xmazgz0qSjzHhmGKg3qXadF2pHlYa/bQkAljJAl8mtsNZhHsJfAlqmrMP/4VRBhEUbqHooVo31IJ8M+T8IDAu64aWRpi0gTxDIDhV7RBEk0aWj7uXLKFxBObvTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=npeh8vK1; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zLUdVVXl; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=npeh8vK1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zLUdVVXl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cS9jf0MDrz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 19:45:25 +1000 (AEST)
Date: Thu, 18 Sep 2025 11:45:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758188719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oatovYDAScMrOSI4YJqu+8QfMHSB+UupX7Jb81hVJMw=;
	b=npeh8vK1axW173XNV/57Ddlty9173ssL9rJnbepqPLIAY2b9ddBGZbJszCR8v5+yAnAza2
	kVk2bM75nmKVo+3NA6tQv8ZvtE8aLMkGl6L37YfcJ4aLLXSWYaPfUywm1UUrwKq6jSgRsC
	ND/kiW40tkFP/FhbRVJASUPXYDtBgTB+jH99ujoX71c9WCMoCpdvgkxQfiu3Ve9aiLiiEu
	jPVsW56Awgt5dGnJDSwfxWGZqSDZ4AKOZBKWhQhJwRTzaSZptY7adDuhvB5TS4HsN9nTDR
	K5WBKS1u+7EmwMtkZeBvQP+IdO3REyj6slgscSYyJS5p0fpCRbpyDvj27kdU4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758188719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oatovYDAScMrOSI4YJqu+8QfMHSB+UupX7Jb81hVJMw=;
	b=zLUdVVXlpmvHz2/eYvNhI+3rMkRnInxUcPnt0gY/crKm5AlquvcirC7UxKQOZg0/ZbK+3k
	7EF71dKWJQe9lTCg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] powerpc/smp: Add check for kcalloc() in
 parse_thread_groups()
Message-ID: <20250918114130-3148bc05-4e21-44d6-b19f-dde33834a32e@linutronix.de>
References: <20250918093415.3441741-1-lgs201920130244@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918093415.3441741-1-lgs201920130244@gmail.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 18, 2025 at 05:34:15PM +0800, Guangshuo Li wrote:
> As kcalloc() may fail, check its return value to avoid a NULL pointer
> dereference when passing it to of_property_read_u32_array().
> 
> Fixes: 790a1662d3a26 ("powerpc/smp: Parse ibm,thread-groups with multiple properties")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  arch/powerpc/kernel/smp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index dac45694a9c9..34de27d75b1b 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -822,9 +822,9 @@ static int parse_thread_groups(struct device_node *dn,
>  
>  	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
>  	thread_group_array = kcalloc(count, sizeof(u32), GFP_KERNEL);
> -	if (!thread_group_array) {
> -	ret = -ENOMEM;
> -	goto out_free;
> +	if (!thread_group_array) {	/* check kcalloc() to avoid NULL deref */
> +		ret = -ENOMEM;
> +		goto out_free;

Thanks for the patch!

This diff looks wrong, did you forget to squash two commits?
The comment is unnecessary.
It is enough to just 'return -ENOMEM'.
The return value documentation needs an update, too.

>  	}
>  	ret = of_property_read_u32_array(dn, "ibm,thread-groups",
>  					 thread_group_array, count);
> -- 
> 2.43.0
> 

