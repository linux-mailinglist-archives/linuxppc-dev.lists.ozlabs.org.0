Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FD6D6F99
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 08:31:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46slvX0BbKzDqtK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 17:31:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="fvMKJxrK"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sls83gCmzDqnr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 17:29:48 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id h195so11795247pfe.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 23:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=EVslka8YIIComg0Mb0g4qEN93Z7Bcof6eewif1bv3wA=;
 b=fvMKJxrKgp9CYweCSx4MbPgFiuWurTltPjobUhlnzb8Cmkn10UhyDvibnvLfhdCaPZ
 iAcFBr/ToDPczF6SCfKJW4c8wPd2bWUyqCWkL1mx5drZ4hYuVcGff1H76UgQlLjMw/Fk
 yNZnuw4mvgPV/E9nzi6lE81E6UMI/dcXYr0qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=EVslka8YIIComg0Mb0g4qEN93Z7Bcof6eewif1bv3wA=;
 b=nVVKDmiNMhFcQ/SGQqk9ZdeKDXcVSFyQeFH6YRqP606Q8ZHyvB05AxETQOrHu+ylqW
 siCeU+dwJI24mObyJwvFf+4wttVLbP6tnjKrVZWNDnAOT3BEd1vaHVwzr5fzh8C8cH/M
 ffR+rwfkoMJQCCn5QCswmzQa3A+Lrf7Meb6dsUhNFMgYVkk+0KdmQEUlDWPk0dGovMOk
 t2ty8e+CsBt8CuaEV6UIMJELDBJbY4NhrKZGr5iYktMkrJGCEPxcyiJZ/8fbyF2voBw1
 xqYvNuaum6UdkvbGhP3kCpCsm5mFTwwtR6fc6iPYOgXKSFRRrZfltWgaiXcJA5TiIGCR
 v8yw==
X-Gm-Message-State: APjAAAXK6TBFKdEjCSrBslxSa/XRy+T9ic4vxoFapIc/9vyu0l7F0Ru2
 xgy+b22YkTULNrvSxrjVnB747Q==
X-Google-Smtp-Source: APXvYqzYXrgvkLqJx+T8uaM5IYuUGK7SLiyvcJPx/6JLaQ1UBHy/P4sYrgAY4hiObjyQROeFg8fEOg==
X-Received: by 2002:a17:90a:9201:: with SMTP id
 m1mr41063558pjo.42.1571120984449; 
 Mon, 14 Oct 2019 23:29:44 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id s191sm14125845pgc.94.2019.10.14.23.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 23:29:43 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, x86@kernel.org, glider@google.com, luto@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, dvyukov@google.com,
 christophe.leroy@c-s.fr
Subject: Re: [PATCH v8 1/5] kasan: support backing vmalloc space with real
 shadow memory
In-Reply-To: <87ftjvtoo7.fsf@dja-thinkpad.axtens.net>
References: <20191001065834.8880-1-dja@axtens.net>
 <20191001065834.8880-2-dja@axtens.net>
 <352cb4fa-2e57-7e3b-23af-898e113bbe22@virtuozzo.com>
 <87ftjvtoo7.fsf@dja-thinkpad.axtens.net>
Date: Tue, 15 Oct 2019 17:29:40 +1100
Message-ID: <878spmttbf.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, gor@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>> @@ -2497,6 +2533,9 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
>>>  	if (!addr)
>>>  		return NULL;
>>>  
>>> +	if (kasan_populate_vmalloc(real_size, area))
>>> +		return NULL;
>>> +
>>
>> KASAN itself uses __vmalloc_node_range() to allocate and map shadow in memory online callback.
>> So we should either skip non-vmalloc and non-module addresses here or teach kasan's memory online/offline
>> callbacks to not use __vmalloc_node_range() (do something similar to kasan_populate_vmalloc() perhaps?). 
>
> Ah, right you are. I haven't been testing that.
>
> I am a bit nervous about further restricting kasan_populate_vmalloc: I
> seem to remember having problems with code using the vmalloc family of
> functions to map memory that doesn't lie within vmalloc space but which
> still has instrumented accesses.

I was wrong or remembering early implementation bugs.

If the memory we're allocating in __vmalloc_node_range falls outside of
vmalloc and module space, it shouldn't be getting shadow mapped for it
by kasan_populate_vmalloc. For v9, I've guarded the call with
is_vmalloc_or_module. It seems to work fine when tested with hotplugged
memory.

Thanks again.

Regards,
Daniel

> On the other hand, I'm not keen on rewriting any of the memory
> on/offline code if I can avoid it!
>
> I'll have a look and get back you as soon as I can.
>
> Thanks for catching this.
>
> Kind regards,
> Daniel
>
>>
>> -- 
>> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/352cb4fa-2e57-7e3b-23af-898e113bbe22%40virtuozzo.com.
