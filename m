Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7777B67762E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 09:17:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0jdq2JTcz3cC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 19:17:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PbtbFjx/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=nadav.amit@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PbtbFjx/;
	dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0jct1dnPz2xVn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 19:17:00 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso9967087wmc.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 00:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mASwyI0y84zkiwwYs/n5l2nc6iOYa0RADtrERsvZZ/4=;
        b=PbtbFjx/YiFhnvdSh29MEa6PF9nytW6aCWO3mfmnb/mQIcXmYF78LAsc2CggFv8ULD
         e4BRWhtMDFcjb48YrV5CwLYYEDCSPpFwiZtDp3EIPeH4ghdvc/kRyAgMJZFsjxPBIoTz
         +SoqSV1LzOhYpwZP13Fz2w7f8NCsVFjpHxINOB7Fv4jVkf8oPTVcds0QmhBw/FdMKTv3
         C3YWOZXlKHC0ry7oZ/l4Dn9zEN/mCuHKvr5terRV3WZlPSZGrqDpxLJDEVtSKWbICyJo
         TUdsnRByRwYR97rhmP9tjgC7v4IL/MFGCM/gxVMcS86Dkk73qsm7esM5DLU3bXjo/yG2
         nBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mASwyI0y84zkiwwYs/n5l2nc6iOYa0RADtrERsvZZ/4=;
        b=5N5t26s0tFWuBKDw13ytnckCNnkZN7EIshMMsYDn4tdWcXEz8d5IX9Hch8AwUCn1Mu
         lZO5WdCelHyvkzROM7kNSwFPZj2N90qC24SnLtWkIrezAORMmnEr/o4wAMhYvQPBVJuW
         XbY4w9YozPZHHFQbV8d6SmyqVg77mikWw3SdrGtgmGTxu1P72xW+nrdFrawNvuypcPKV
         z+UPLaLrenF5I5ixJ9defnZ54d2TBJzEzZAwXGAWtTTvdylQlxJZq/gTjm5HGkYaVMvu
         GyKPIajV54Ux4k8tKc9fHQvYNWz6UKc6DO9QXbJmPkGALr3nFIf5gQb/+hMoX1Ea0Weo
         NkRA==
X-Gm-Message-State: AFqh2kor8rhINkLeglM87szqRiUTkq1swoKfQvpO3CC3BffITxkoGhD8
	DIN/Kf4hKaGtbdVs+TpYqe0=
X-Google-Smtp-Source: AMrXdXs78YIwmy6vXp8dUen1lH+gRIzlW9AG1nDQeN2sZijzpWuNRWZPH+x2GWIkurJEuK4QH4aP5A==
X-Received: by 2002:a05:600c:1c8e:b0:3d9:e5f9:984c with SMTP id k14-20020a05600c1c8e00b003d9e5f9984cmr23361419wms.2.1674461815625;
        Mon, 23 Jan 2023 00:16:55 -0800 (PST)
Received: from [192.168.86.94] ([77.137.66.37])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c468700b003db0bb81b6asm10522350wmo.1.2023.01.23.00.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 00:16:55 -0800 (PST)
Message-ID: <e8fac6e0-487f-37c3-5be4-19518ffa845e@gmail.com>
Date: Mon, 23 Jan 2023 10:16:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.0
Subject: Re: [PATCH v6 3/5] lazy tlb: shoot lazies, non-refcounting lazy tlb
 mm reference handling scheme
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>
References: <20230118080011.2258375-1-npiggin@gmail.com>
 <20230118080011.2258375-4-npiggin@gmail.com>
 <5F3590B8-3F25-4EFB-BE3A-D32AAAC0B2F4@gmail.com>
 <CPVVOWQ6SE2S.NQ3R9R77MFKI@bobo>
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <CPVVOWQ6SE2S.NQ3R9R77MFKI@bobo>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-mm <linux-mm@kvack.org>, Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/19/23 6:22 AM, Nicholas Piggin wrote:
> On Thu Jan 19, 2023 at 8:22 AM AEST, Nadav Amit wrote:
>>
>>
>>> On Jan 18, 2023, at 12:00 AM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>>
>>> +static void do_shoot_lazy_tlb(void *arg)
>>> +{
>>> +	struct mm_struct *mm = arg;
>>> +
>>> + 	if (current->active_mm == mm) {
>>> + 		WARN_ON_ONCE(current->mm);
>>> + 		current->active_mm = &init_mm;
>>> + 		switch_mm(mm, &init_mm, current);
>>> + 	}
>>> +}
>>
>> I might be out of touch - doesn’t a flush already take place when we free
>> the page-tables, at least on common cases on x86?
>>
>> IIUC exit_mmap() would free page-tables, and whenever page-tables are
>> freed, on x86, we do shootdown regardless to whether the target CPU TLB state
>> marks is_lazy. Then, flush_tlb_func() should call switch_mm_irqs_off() and
>> everything should be fine, no?
>>
>> [ I understand you care about powerpc, just wondering on the effect on x86 ]
> 
> Now I come to think of it, Rik had done this for x86 a while back.
> 
> https://lore.kernel.org/all/20180728215357.3249-10-riel@surriel.com/
> 
> I didn't know about it when I wrote this, so I never dug into why it
> didn't get merged. It might have missed the final __mmdrop races but
> I'm not not sure, x86 lazy tlb mode is too complicated to know at a
> glance. I would check with him though.

My point was that naturally (i.e., as done today), when exit_mmap() is 
done, you release the page tables (not just the pages). On x86 it means 
that you also send shootdown IPI to all the *lazy* CPUs to perform a 
flush, so they would exit the lazy mode.

[ this should be true for 99% of the cases, excluding cases where there
   were not page-tables, for instance ]

So the patch of Rik, I think, does not help in the common cases, 
although it may perhaps make implicit actions more explicit in the code.
