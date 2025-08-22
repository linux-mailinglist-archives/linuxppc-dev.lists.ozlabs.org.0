Return-Path: <linuxppc-dev+bounces-11189-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBC9B31B19
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:18:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7j3b6kjwz3cgW;
	Sat, 23 Aug 2025 00:18:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755871926;
	cv=none; b=mBGFWPZEXppXijYZywhfx0fLSd9jag5wTBnyqHzY6T3ZLTS8m9NQ0LiHdxERwdiQY9Pv9Wdu+JaDejSaG6JuHEA1+GLtvAMCHzacj72ByYsi6fkvt4RNkvOgxQXWebp4HCAGBaVnu25WdC0MkonlfELjObwUbEhaeO6R9TMnVj9s5+O/xp9DA9eyV+VMtw7HcOqL2W4u964ocM+WDxjFWFKdfOeqd1I0BW1uS81/qVDzdTi/QlSBI9r8ifW8Kcdl/gCy/7vGCTnXW5UPqEvvtivXw4vgiN3rE8RJVuODiMB7/zJcOrtVDyyod4s0sTB72bfdUJ3Yd1hu4XQOVJWExA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755871926; c=relaxed/relaxed;
	bh=SUrkI8gRxT8al9H8bcipd0cfLDrY2l84rj0Cw0HvR90=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=K5dRjKGrEF9Ps5Ws++Gt78VQ+j5KAmhIOxYRuGgj2Awln0p7P8H4cuq1GDfo4AhOpvirCXnh0wXu+QN241NRrvzKnF9y/G0rHm2a+o9YNzOt24aWbRH1Rgv+lFpAVpuuCLrhCmO/Qd4otlKX2w7cUdbe8mSUqTfvLHDg+DT+bcND399F34sGHiwwuVk1h2LRDcQ0V+kIYKvAIMpiLM+fFWYMrslkbFT9UtSsYCSGYQI1VN2idu2jC1xummSOgcV8kTW0OHKbwaZZ2sB59ezo2hCehuQHRxb7lKU3PK1x685a0kGxYeZ7bk1mGvL/RIqgy8vk4W54aMLv4E/Y6AcV3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FWNX1N8S; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=giorgitchankvetadze1997@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FWNX1N8S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=giorgitchankvetadze1997@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7hvn5yfrz3cfv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:12:04 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45b51bafcc1so612475e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 07:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755871921; x=1756476721; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUrkI8gRxT8al9H8bcipd0cfLDrY2l84rj0Cw0HvR90=;
        b=FWNX1N8S6I3ApSuwOn27yx5gnjrY8OB2n/8dFoyRTjBU6eBUxYkqXO6Dn05UXAxBwn
         eckyHHq39HqPgQqDDK4sFale54HdvQ0aypKDesteAUuWfgYOQea+NFtf3Orn+7VkJlKf
         HLnvZl+j7OQ0a6dT9AfXePdLeont0revhcmTiqJJMkA/pAhSPSbmwy96NTxKcsxMWCS7
         mlpoCHjrYj+14aQeHy+68wJhgAcKf4N5CFHNXK3boWkbyVL4gRdcR6bilqdcfeX9k38p
         b5qcaVp3W2yu4TrlGOBid+/pMLDbgrR32GlRjZSiP0ptWbhqw+zNpcjNWoysyCXM15lN
         y7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755871921; x=1756476721;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SUrkI8gRxT8al9H8bcipd0cfLDrY2l84rj0Cw0HvR90=;
        b=MHL7GmAPK7AuVS+P8Ka7wG4K7j1718Av+O5btgD+bry9QGoxGXyw0RRC46J7XVEmR8
         38sdDRoJW6IAvX7Ie/oIMNl1+PeGjqrIR4zC4oq4P5wma8hJ6MSjl1yEaDyGNPQGnGdJ
         LaLJk7WUs+KXl6BsCwYVoKzqsqmI+t0hdNoD9D2N9mNHlV28lopst8iLgmr2hPj+xni5
         DsQ0q+aZwooC5Z4afhUQNQWSkuSiGO50uyxz99O2elttFbFm4Am82EukZDoNf2pNA1a4
         vxVrelo+w2jlBzUB+I3hI3tfZJozwrpTp+w/nvnFhUtFgsF0RJUlzr6eMfeTwPJcm4FG
         1ETA==
X-Forwarded-Encrypted: i=1; AJvYcCX4cBzw/yRRoNZdDyx0zoo4Xa/9ESLHDYZ+G1QD/wph3eWvBVYHj1Z6lSDV7dCmUA0S4YP7hUEkFgKpQQo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxLXHkzDZpWQmLDy9ZcY2kckYK9VGuijNv6o590GQKHboPA8A5w
	5RHYhR2h1qXmXidpHIMIuATWPwy+ehHHuFSiqQnqBv5Q0/fGl7N4ve6e
X-Gm-Gg: ASbGncsWVuF7J8ygm7ckyK+eDYX+QKlp4kLfy3ejrDwy01LJdvqhLmfjj3GfvUQnZbd
	UuvuqJuvwg+34M/BTN/aN/Qr4+bNSL2V+T3+OGVH4JR5R4fCJUGu90PKkRxfkwhw8Nb+PC4uX2/
	HPQscQiv+9A/WtA6S6bFQ3MYadXw8ahnowDekGAn5H2EUFKLb2K4HDrhxB0LUFQQm+CAUVr0pet
	TSEMkwSMf8iURUSbOndCq8VQ/aBnEu6uvJr4rACqI0PgEy1bxvUSyR+kl45473jd7+HEisSrHiX
	eFWCBWQzY8DwhHgnTTc9Oxi2kISSkmx++RWcn7Cq5wX/UY/Jq95paf7hCKkmmUwt+0xJj2dfdMN
	aOHLI2Dm/T30kCr1825iASxjFiH4MiqoMh33EHFISovdxwGdLJdr6vE6tkSINp2tDL2wzrhbbi8
	r2UrI2n48Q
X-Google-Smtp-Source: AGHT+IFjwShx3D0jJMvSWdaLG4T39JgpaQyzemTxwtJre4OZUc8C3M5BPxw9JQYLkgJW8PLQe/esRQ==
X-Received: by 2002:a05:6000:25c3:b0:3c5:7050:e2af with SMTP id ffacd0b85a97d-3c5dcdfc35fmr1024231f8f.9.1755871921342;
        Fri, 22 Aug 2025 07:12:01 -0700 (PDT)
Received: from [192.168.100.6] ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c6c737b303sm576035f8f.47.2025.08.22.07.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 07:12:00 -0700 (PDT)
Message-ID: <98191ca5-9581-44fd-b9b1-6f0b932f141e@gmail.com>
Date: Fri, 22 Aug 2025 18:11:58 +0400
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
To: torvalds@linux-foundation.org
Cc: akpm@linux-foundation.org, andrealmeid@igalia.com, brauner@kernel.org,
 christophe.leroy@csgroup.eu, daniel@iogearbox.net,
 dave.hansen@linux.intel.com, dave@stgolabs.net,
 david.laight.linux@gmail.com, dvhart@infradead.org, jack@suse.cz,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com,
 mpe@ellerman.id.au, npiggin@gmail.com, peterz@infradead.org,
 tglx@linutronix.de, viro@zeniv.linux.org.uk
References: <CAHk-=whKeVCEtR2mQJQjT2ndSOXGDdb+L0=WoVUQUGumm88VpA@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] uaccess: Add speculation barrier to
 copy_from_user_iter()
Content-Language: en-US
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
In-Reply-To: <CAHk-=whKeVCEtR2mQJQjT2ndSOXGDdb+L0=WoVUQUGumm88VpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

so we can use speculation barrier? and fix the problem locally


On 8/22/2025 5:52 PM, Linus Torvalds wrote:
> On Fri, 22 Aug 2025 at 05:58, Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>> > The results of "access_ok()" can be mis-speculated. The result is 
> that > you can end speculatively: > > if (access_ok(from, size)) > // 
> Right here
> I actually think that we should probably just make access_ok() itself do this.
> 
> We don't have *that* many users since we have been de-emphasizing the
> "check ahead of time" model, and any that are performance-critical can
> these days be turned into masked addresses.
> 
> As it is, now we're in the situation that careful places - like
> _inline_copy_from_user(), and with your patch  copy_from_user_iter() -
> do maybe wethis by hand and are ugly as a result, and lazy and
> probably incorrect places don't do it at all.
> 
> That said, I don't object to this patch and maybe we should do that
> access_ok() change later and independently of any powerpc work.
> 
>                   Linus
> 



