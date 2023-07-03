Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B50745A8D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 12:48:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvjLz0wVTz3bV3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 20:48:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.43; helo=mail-lf1-f43.google.com; envelope-from=jirislaby@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvjLQ3ddkz2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 20:47:40 +1000 (AEST)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f875b267d9so6633044e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jul 2023 03:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688381257; x=1690973257;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q0pgiVTiJV85KYdFZsn/u4+OjbChkIzO5jipDAA2eIs=;
        b=bE+Pf22TaZdTgKl48UvwJTTJf1/m66NcC3ir3xWELv2eAtfC8cRSHvAuQ4zbuI4IvC
         lMn3RfL/4QDL1AQ7/ReqJDhPEVjtp3nAwjauzsiR0xLYx8zOQjgdN6xZywvWkoF+IRuo
         U8b1TW/aRvL/vvoUhBSYg8uM+gGxfh6mRdFzkLXgNqibJmDqyyWxW4TW0u23X5zJW1Ao
         21z+/DvYFJnm5a72YznKj+55CULdcrqXObrLgmuSg+Qw+aeM6teeCK+Fg3ajAnhdfmGl
         j+Zvga2vHHtYxKjszVSz1wxfycwFVKJC6+gA7UrcOyqCTNPwcEDQHCOtzCjn9ujLyeKF
         dgtQ==
X-Gm-Message-State: ABy/qLZJpKRqS8AgRiFKu7Q8aKRQlgbkE9mMj2JNrRtSjuLg6rpy2n0T
	+04eWmcSo4ZAz1TwzbYzJe8=
X-Google-Smtp-Source: APBJJlHQ/cbXe9ha7CIPXP3O2bAfXoMcUZ/X0EY7P046JU2Y4R8qaIbjyO02AceXRYrZ0C013Zie2w==
X-Received: by 2002:a05:6512:3e29:b0:4fb:73b5:e1cf with SMTP id i41-20020a0565123e2900b004fb73b5e1cfmr8329655lfv.64.1688381256424;
        Mon, 03 Jul 2023 03:47:36 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id y17-20020a1c4b11000000b003f90a604885sm26673425wma.34.2023.07.03.03.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 03:47:35 -0700 (PDT)
Message-ID: <2f150512-e460-a9ae-65db-39dc54fe99d6@kernel.org>
Date: Mon, 3 Jul 2023 12:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 29/33] x86/mm: try VMA lock-based page fault handling
 first
Content-Language: en-US
To: Suren Baghdasaryan <surenb@google.com>
References: <20230227173632.3292573-1-surenb@google.com>
 <20230227173632.3292573-30-surenb@google.com>
 <dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.org>
 <CAJuCfpF7LweMwpvXavjJZhAciK7wK-bdLz2aFhOZGSHeK5tA9A@mail.gmail.com>
 <9a8d788c-b8ba-1b8a-fd79-0e25b1b60bed@kernel.org>
 <f7ad7a42-13c8-a486-d0b7-01d5acf01e13@kernel.org>
 <f8864bb0-3d76-20d5-8a25-aab9726354f2@kernel.org>
 <CAJuCfpGLozRzxE9KZehgW1dAYpNxe4b+nnjH+ppbeAuFtRNGBQ@mail.gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <CAJuCfpGLozRzxE9KZehgW1dAYpNxe4b+nnjH+ppbeAuFtRNGBQ@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, jacobly.alt@gmail.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.o
 rg, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc Jacob Young (from kernel bugzilla)

On 30. 06. 23, 19:40, Suren Baghdasaryan wrote:
> On Fri, Jun 30, 2023 at 1:43 AM Jiri Slaby <jirislaby@kernel.org> wrote:
>>
>> On 30. 06. 23, 10:28, Jiri Slaby wrote:
>>>   > 2348
>>> clone3({flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, child_tid=0x7fcaa5882990, parent_tid=0x7fcaa5882990, exit_signal=0, stack=0x7fcaa5082000, stack_size=0x7ffe00, tls=0x7fcaa58826c0} => {parent_tid=[2351]}, 88) = 2351
>>>   > 2350  <... clone3 resumed> => {parent_tid=[2372]}, 88) = 2372
>>>   > 2351  <... clone3 resumed> => {parent_tid=[2354]}, 88) = 2354
>>>   > 2351  <... clone3 resumed> => {parent_tid=[2357]}, 88) = 2357
>>>   > 2354  <... clone3 resumed> => {parent_tid=[2355]}, 88) = 2355
>>>   > 2355  <... clone3 resumed> => {parent_tid=[2370]}, 88) = 2370
>>>   > 2370  mmap(NULL, 262144, PROT_READ|PROT_WRITE,
>>> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0 <unfinished ...>
>>>   > 2370  <... mmap resumed>)               = 0x7fca68249000
>>>   > 2372  <... clone3 resumed> => {parent_tid=[2384]}, 88) = 2384
>>>   > 2384  <... clone3 resumed> => {parent_tid=[2388]}, 88) = 2388
>>>   > 2388  <... clone3 resumed> => {parent_tid=[2392]}, 88) = 2392
>>>   > 2392  <... clone3 resumed> => {parent_tid=[2395]}, 88) = 2395
>>>   > 2395  write(2, "runtime: marked free object in s"..., 36 <unfinished
>>> ...>
>>>
>>> I.e. IIUC, all are threads (CLONE_VM) and thread 2370 mapped ANON
>>> 0x7fca68249000 - 0x7fca6827ffff and go in thread 2395 thinks for some
>>> reason 0x7fca6824bec8 in that region is "bad".
> 
> Thanks for the analysis Jiri.
> Is it possible from these logs to identify whether 2370 finished the
> mmap operation before 2395 tried to access 0x7fca6824bec8? That access
> has to happen only after mmap finishes mapping the region.

Hi,

it's hard to tell, but I assume so.

For now, forget about this go's overly complicated, hard to reproduce 
case and concentrate on the very nice reduced testcase in:
  https://bugzilla.kernel.org/show_bug.cgi?id=217624
;)

FWIW, I can reproduce using the test case too.

thanks,
-- 
js
suse labs

