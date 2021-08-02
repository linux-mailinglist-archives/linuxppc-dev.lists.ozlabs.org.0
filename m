Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 049143DD225
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 10:40:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdWfj6Njvz3cLc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 18:40:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.41; helo=mail-ej1-f41.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdWfK0rNkz303f
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Aug 2021 18:40:08 +1000 (AEST)
Received: by mail-ej1-f41.google.com with SMTP id e19so29634260ejs.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Aug 2021 01:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zz03E5xQt7p2VN7cWkxfZkNKl6W24aLbb5bhnlK6M/Y=;
 b=kFK85vDzDgzBQ8KkyeQzyLQxD7ouBNOCANWOKpp1kylKpLsGvUZM/6N7GJzVy2eD3G
 A++T78jliJlu+Mcm8cM4fVOFVQM4TRQoRSK8JvTpTRU92pJVWvhlWnzAvBDWfxoY6xbj
 GgwG0cVRWHpfscJu9N5entbtqIKDQ4i4Xszl1NvDBG7RAus9RRHM0rvtY36OpFgvFISz
 nM8Eb0qMkYoJxViFXZ2AKKI1U6BWLmIKYhAYuyld0AWo8KzyNxBYz8Fn/tw7deSlrxco
 2CjcrE79laejbSoxvduwgnqKPGyB/gGzAX7VK79EPTi8wPFKMMjxfwYhqgx/8+aNBEkX
 9lDQ==
X-Gm-Message-State: AOAM530XP77h6wtNcn/5LESKbCNfWWQ50VHe92T3KXxrv63eNM0c8OcY
 obTTat2v1VFIenz6WgNYNQY=
X-Google-Smtp-Source: ABdhPJwNQd3t1Hni44DinFugXrDzcKsPIzaWgkeB9qalXL+5uv984oWzkAMVLlGBGUqmkB7JpErwhg==
X-Received: by 2002:a17:906:3048:: with SMTP id
 d8mr14693966ejd.534.1627893604790; 
 Mon, 02 Aug 2021 01:40:04 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id n10sm4284468ejk.86.2021.08.02.01.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 01:40:04 -0700 (PDT)
Subject: Re: [PATCH 2/2] virtio-console: remove unnecessary kmemdup()
To: Xianting Tian <xianting.tian@linux.alibaba.com>,
 gregkh@linuxfoundation.org, amit@kernel.org, arnd@arndb.de
References: <20210801051655.79048-1-xianting.tian@linux.alibaba.com>
 <b5554967-a683-96ae-deb9-2d4980d33b41@kernel.org>
 <5ad81a0e-fbb2-a849-6db7-f5718633d282@linux.alibaba.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <a2598ec9-7bc9-be42-bcab-fa19c9e734f7@kernel.org>
Date: Mon, 2 Aug 2021 10:40:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <5ad81a0e-fbb2-a849-6db7-f5718633d282@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: osandov@fb.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02. 08. 21, 10:32, Xianting Tian wrote:
> 
> 在 2021/8/2 下午3:25, Jiri Slaby 写道:
>> Hi,
>>
>> why is this 2/2? I seem (Lore neither) to find 1/2.
> You didn't receive 1/2?
> [PATCH 1/2] tty: hvc: pass DMA capable memory to put_chars()
> https://lkml.org/lkml/2021/8/1/8 <https://lkml.org/lkml/2021/8/1/8>

Oh, I did, but it's not properly threaded. PLease fix your setup.

>> On 01. 08. 21, 7:16, Xianting Tian wrote:
>>> hvc framework will never pass stack memory to the put_chars() function,
>>
>> Am I blind or missing something?
>>
>> hvc_console_print(...)
>> {
>>   char c[N_OUTBUF]
>> ...
>>   cons_ops[index]->put_chars(vtermnos[index], c, i);
>>
>> The same here:
>>
>> hvc_poll_put_char(..., char ch)
>> {
>> ...
>>    n = hp->ops->put_chars(hp->vtermno, &ch, 1);
>>
>> AFAICS both of them *pass* a pointer to stack variable.
> 
> yes, I discussed the issue with Arnd before in below thread,  you can 
> get the history, thanks
> 
> https://lkml.org/lkml/2021/7/27/494 <https://lkml.org/lkml/2021/7/27/494>

So is this a v2? You should have noted that. And what changed from v1 too.

>>> So the calling of kmemdup() is unnecessary, remove it.
>>>
>>> Fixes: c4baad5029 ("virtio-console: avoid DMA from stack")
>>
>> This patch doesn't "Fix" -- it reverts the commit. You should've CCed 
>> the author too.
> 
> yes, we discussed ther issue in above thread, which we CCed the author.

I don't see any input from the author?


Anyway, 1/2 does not even build, so you will send v3 with all the above 
fixed, hopefully.

thanks,
-- 
js
