Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EF47437AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 10:43:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qspkb2xHFz3bqx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 18:43:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.52; helo=mail-ej1-f52.google.com; envelope-from=jirislaby@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qspk63bBzz2xpd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 18:43:08 +1000 (AEST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-992ca792065so109660966b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 01:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114585; x=1690706585;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5B4IVr8Ja8HmXEBGoLMWf9UwelCEFdj8Ikbkk9A1VuU=;
        b=Czdskz4Ynv1fhLoqTzFtTrF/Ll/tzp/DdOtdfHf/oOZeHAwx5rckY4MKWCEoejuMJX
         apeht9MGN3rxCDEXm8YcWOTVAivsj14512MTpLoKU30S62z/MDrGOwZ0jGLwuZAcrpSK
         yVcAE4cGYeQmUdPKFddXwnRm7SuFjCb2ZtPBMN7iYATjhagKCcABNPWCiAXHToagt2Xe
         EfK91tgG6Hjyt0hbmgQbzuucfxBvI8HGMOG364UdeISPrNWTc2Uzb2FJfHx69NfRRk8I
         yogyZto+UsL5Q/4tMdrf7wbZNJJF8NZYlPrsJMJ066LGQunlMedlXzNov+gj70fPU3SJ
         o1fg==
X-Gm-Message-State: ABy/qLY/BsC+nanNJFgWrmWwDewpE16al5X6i6ct8JyfILiz5VQr2M9e
	duCcxVubCaj2NxQvhIDAzLE=
X-Google-Smtp-Source: APBJJlFeNIVHPqaAGPftDvBSqiTQ4Tr/AXjHL5jLgbaPc4SKjWIPk0fOpqH5cRG+2Lv/IuCHmqm3Mg==
X-Received: by 2002:a17:906:e48:b0:988:882b:9a3 with SMTP id q8-20020a1709060e4800b00988882b09a3mr1415031eji.36.1688114585311;
        Fri, 30 Jun 2023 01:43:05 -0700 (PDT)
Received: from [192.168.1.58] (185-219-167-24-static.vivo.cz. [185.219.167.24])
        by smtp.gmail.com with ESMTPSA id t14-20020a170906948e00b0098d2f703408sm7724415ejx.118.2023.06.30.01.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 01:43:04 -0700 (PDT)
Message-ID: <f8864bb0-3d76-20d5-8a25-aab9726354f2@kernel.org>
Date: Fri, 30 Jun 2023 10:43:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 29/33] x86/mm: try VMA lock-based page fault handling
 first
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
References: <20230227173632.3292573-1-surenb@google.com>
 <20230227173632.3292573-30-surenb@google.com>
 <dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.org>
 <CAJuCfpF7LweMwpvXavjJZhAciK7wK-bdLz2aFhOZGSHeK5tA9A@mail.gmail.com>
 <9a8d788c-b8ba-1b8a-fd79-0e25b1b60bed@kernel.org>
 <f7ad7a42-13c8-a486-d0b7-01d5acf01e13@kernel.org>
In-Reply-To: <f7ad7a42-13c8-a486-d0b7-01d5acf01e13@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundati
 on.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30. 06. 23, 10:28, Jiri Slaby wrote:
>  > 2348 
> clone3({flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, child_tid=0x7fcaa5882990, parent_tid=0x7fcaa5882990, exit_signal=0, stack=0x7fcaa5082000, stack_size=0x7ffe00, tls=0x7fcaa58826c0} => {parent_tid=[2351]}, 88) = 2351
>  > 2350  <... clone3 resumed> => {parent_tid=[2372]}, 88) = 2372
>  > 2351  <... clone3 resumed> => {parent_tid=[2354]}, 88) = 2354
>  > 2351  <... clone3 resumed> => {parent_tid=[2357]}, 88) = 2357
>  > 2354  <... clone3 resumed> => {parent_tid=[2355]}, 88) = 2355
>  > 2355  <... clone3 resumed> => {parent_tid=[2370]}, 88) = 2370
>  > 2370  mmap(NULL, 262144, PROT_READ|PROT_WRITE, 
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0 <unfinished ...>
>  > 2370  <... mmap resumed>)               = 0x7fca68249000
>  > 2372  <... clone3 resumed> => {parent_tid=[2384]}, 88) = 2384
>  > 2384  <... clone3 resumed> => {parent_tid=[2388]}, 88) = 2388
>  > 2388  <... clone3 resumed> => {parent_tid=[2392]}, 88) = 2392
>  > 2392  <... clone3 resumed> => {parent_tid=[2395]}, 88) = 2395
>  > 2395  write(2, "runtime: marked free object in s"..., 36 <unfinished 
> ...>
> 
> I.e. IIUC, all are threads (CLONE_VM) and thread 2370 mapped ANON 
> 0x7fca68249000 - 0x7fca6827ffff and go in thread 2395 thinks for some 
> reason 0x7fca6824bec8 in that region is "bad".

As I was noticed, this might be as well be a fail of the go's 
inter-thread communication (or alike) too. It might now be only more 
exposed with vma-based locks as we can do more parallelism now.

There are older hard to reproduce bugs in go with similar symptoms (we 
see this error sometimes now too):
https://github.com/golang/go/issues/15246

Or this 2016 bug is a red herring. Hard to tell...

>> thanks,
-- 
js
suse labs

