Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C24110DC27
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 03:16:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Pw3z4VGgzDqQh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 13:16:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b42;
 helo=mail-yb1-xb42.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mv7BOpck"; 
 dkim-atps=neutral
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Pw1q1Sc7zDqCV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 13:14:51 +1100 (AEDT)
Received: by mail-yb1-xb42.google.com with SMTP id r201so12214691ybc.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 18:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cI8/7z9v59sx8rV1YXAjrbhcz/dsn2bdotkY6ICnSSs=;
 b=mv7BOpckWzaTp/9wQ29LHYha8g5Fmm5opmo5Qp5W7XxK4FGCE2NIDj9AY9bgdQ2ZMq
 EBNupNB8mjJ2QaR4QzsWXZJ0UCwW4m1MbyNcGO4nNaodfCXgrOGxCnD+UNBUFTyToJAf
 HnEvs6pY0DfWrM6lleJdfIZGeRn7UnDT1mT4xRw35M+pMi+5mxPNQ4HXDx4xsiAFsAHp
 BwQlWBk2/lGuegNxDi+eeIvw0aHKxr7UR6KdFvLchbC+zg74/rKKRiSF7N0+5kjL0ZnB
 GWYLKRU+76pnp6zffYWvpTQ8SDa+L+WaDjC1mEgzDnQJfFbD37nN+5SKylTTkfV3MB0+
 U0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cI8/7z9v59sx8rV1YXAjrbhcz/dsn2bdotkY6ICnSSs=;
 b=BvenXYfBTpkJak85z3goy/a9ibRawEAYWuNBKXpQcGyueTjzwol3GNznVhy07ObO6p
 1RwfUj6tzifb3wUjQ26MSJIVd/VQS8T6RJK33jwNCLSOL/usmpRhyuoUlZj9rp7iPoCk
 md7OVUenA1hTEFsudFGFQai+JC+qmpXr31GF4sGT2kBplcDyf73+ohP0K0ZDAoFYSlQ8
 a2z4jvkyEwB/Eap62OZhFS8TmFeDOWgKETyzEh+lkpPQSAjdW7Ftm2qqMIMSWYVoqZAo
 kJSDHGNTbnuwXD+224O1pY+n6jQNdolFfTyWZgEKEillaXfXW82A2bnsIWHlnlDRCpBD
 vd7Q==
X-Gm-Message-State: APjAAAXC0vlYmXNqz5jJRtMJe1GGU45DCZ4kdk8oG6BvE3Tmx9E1l0fH
 TG6jk3iMoPRwLvY72oTcJds=
X-Google-Smtp-Source: APXvYqzHY3DrUeXIWwAdco703XfexT4OkbxHjgBhdWN5aycdweyJhyEIUqT6C/Ay0Qz2o0wd0992rg==
X-Received: by 2002:a25:9346:: with SMTP id g6mr43480381ybo.6.1575080088485;
 Fri, 29 Nov 2019 18:14:48 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net.
 [73.88.245.53])
 by smtp.gmail.com with ESMTPSA id x84sm10978604ywg.47.2019.11.29.18.14.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Nov 2019 18:14:48 -0800 (PST)
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
Date: Fri, 29 Nov 2019 20:14:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/29/19 9:10 AM, Sebastian Andrzej Siewior wrote:
> I've been looking at phandle_cache and noticed the following: The raw
> phandle value as generated by dtc starts at zero and is incremented by
> one for each phandle entry. The qemu pSeries model is using Slof (which
> is probably the same thing as used on real hardware) and this looks like
> a poiner value for the phandle.
> With
> 	qemu-system-ppc64le -m 16G -machine pseries -smp 8 
> 
> I got the following output:
> | entries: 64
> | phandle 7e732468 slot 28 hash c
> | phandle 7e732ad0 slot 10 hash 27
> | phandle 7e732ee8 slot 28 hash 3a
> | phandle 7e734160 slot 20 hash 36
> | phandle 7e734318 slot 18 hash 3a
> | phandle 7e734428 slot 28 hash 33
> | phandle 7e734538 slot 38 hash 2c
> | phandle 7e734850 slot 10 hash e
> | phandle 7e735220 slot 20 hash 2d
> | phandle 7e735bf0 slot 30 hash d
> | phandle 7e7365c0 slot 0 hash 2d
> | phandle 7e736f90 slot 10 hash d
> | phandle 7e737960 slot 20 hash 2d
> | phandle 7e738330 slot 30 hash d
> | phandle 7e738d00 slot 0 hash 2d
> | phandle 7e739730 slot 30 hash 38
> | phandle 7e73bd08 slot 8 hash 17
> | phandle 7e73c2e0 slot 20 hash 32
> | phandle 7e73c7f8 slot 38 hash 37
> | phandle 7e782420 slot 20 hash 13
> | phandle 7e782ed8 slot 18 hash 1b
> | phandle 7e73ce28 slot 28 hash 39
> | phandle 7e73d390 slot 10 hash 22
> | phandle 7e73d9a8 slot 28 hash 1a
> | phandle 7e73dc28 slot 28 hash 37
> | phandle 7e73de00 slot 0 hash a
> | phandle 7e73e028 slot 28 hash 0
> | phandle 7e7621a8 slot 28 hash 36
> | phandle 7e73e458 slot 18 hash 1e
> | phandle 7e73e608 slot 8 hash 1e
> | phandle 7e740078 slot 38 hash 28
> | phandle 7e740180 slot 0 hash 1d
> | phandle 7e740240 slot 0 hash 33
> | phandle 7e740348 slot 8 hash 29
> | phandle 7e740410 slot 10 hash 2
> | phandle 7e740eb0 slot 30 hash 3e
> | phandle 7e745390 slot 10 hash 33
> | phandle 7e747b08 slot 8 hash c
> | phandle 7e748528 slot 28 hash f
> | phandle 7e74a6e0 slot 20 hash 18
> | phandle 7e74aab0 slot 30 hash b
> | phandle 7e74f788 slot 8 hash d
> | Used entries: 8, hashed: 29
> 
> So the hash array has 64 entries out which only 8 are populated. Using
> hash_32() populates 29 entries.
> Could someone with real hardware verify this?
> I'm not sure how important this performance wise, it looks just like a
> waste using only 1/8 of the array.

The hash used is based on the assumptions you noted, and as stated in the
code, that phandle property values are in a contiguous range of 1..n
(not starting from zero), which is what dtc generates.

We knew that for systems that do not match the assumptions that the hash
will not be optimal.  Unless there is a serious performance problem for
such systems, I do not want to make the phandle hash code more complicated
to optimize for these cases.  And the pseries have been performing ok
without phandle related performance issues that I remember hearing since
before the cache was added, which could have only helped the performance.
Yes, if your observations are correct, some memory is being wasted, but
a 64 entry cache is not very large on a pseries.

There is already some push back from Rob that the existing code is more
complex than needed (eg variable cache size).

-Frank

> 
> The patch used for testing:
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 1d667eb730e19..2640d4bc81a9a 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -197,6 +197,7 @@ void of_populate_phandle_cache(void)
>  	u32 cache_entries;
>  	struct device_node *np;
>  	u32 phandles = 0;
> +	struct device_node **cache2;
>  
>  	raw_spin_lock_irqsave(&devtree_lock, flags);
>  
> @@ -214,14 +215,32 @@ void of_populate_phandle_cache(void)
>  
>  	phandle_cache = kcalloc(cache_entries, sizeof(*phandle_cache),
>  				GFP_ATOMIC);
> +	cache2 = kcalloc(cache_entries, sizeof(*phandle_cache), GFP_ATOMIC);
>  	if (!phandle_cache)
>  		goto out;
>  
> +	pr_err("%s(%d) entries: %d\n", __func__, __LINE__, cache_entries);
>  	for_each_of_allnodes(np)
>  		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL) {
> +			int slot;
>  			of_node_get(np);
>  			phandle_cache[np->phandle & phandle_cache_mask] = np;
> +			slot = hash_32(np->phandle, __ffs(cache_entries));
> +			cache2[slot] = np;
> +			pr_err("%s(%d) phandle %x slot %x hash %x\n", __func__, __LINE__,
> +			       np->phandle, np->phandle & phandle_cache_mask, slot);
>  		}
> +	{
> +		int i, filled = 0, filled_hash = 0;
> +
> +		for (i = 0; i < cache_entries; i++) {
> +			if (phandle_cache[i])
> +				filled++;
> +			if (cache2[i])
> +				filled_hash++;
> +		}
> +		pr_err("%s(%d) Used entries: %d, hashed: %d\n", __func__, __LINE__, filled, filled_hash);
> +	}
>  
>  out:
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
> 
> Sebastian
> 

