Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F26306B63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 04:08:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR55D5M3bzDrSG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 14:08:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=V4lrTq6a; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR53W3sgFzDrRQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 14:06:43 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id i7so3337950pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 19:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZHGhaggkiWKHKI1RBp1ORHwIPl9NAUcAJ7g4Qaj7Ygc=;
 b=V4lrTq6awed93ip+WwCzdy0piJjONZe373p4vZljaK8MhCZ5AglnYmuwzwYrde8roh
 z/aR4pZRFSlz/ZCzrXwQVisWsOWop5a6S+ABi80WzflRDtUSQCLp0js7T9wIAl6SJIVS
 n2Ej7kEFU/hBzMXECoDxviQpZTOp7IrkHLYebr3Jv9cxP1XJQfOC5IygLclMigrCEsSH
 JkH94jJt7G8+3XSpqtzcjMLomFJ7IgnY2Fuv8EhZwDvGQW1CQyUiJSF+9wE2QwEhW65o
 f0zOhZ+luDTgV4Kl20EgkFbPOwKgpbE/bg69KdkE7EaIpkB7LWz5skvXR5+c+hJmH/Wu
 ITHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZHGhaggkiWKHKI1RBp1ORHwIPl9NAUcAJ7g4Qaj7Ygc=;
 b=A7I287DyCeN/tBkfG88WFhi46+QDXcIy03GR+jme9EiKjcvxLTuseMDgEwBSAa47t9
 GzfH38ArxV9cGavx+LLDbew2Cgmmw242cVLEeyGAp1/mmo8x7rBypR/iuJTsP5TDOiNZ
 /vywT4t19b3hsV8jnu8k1qvoJXiSI41U/AEwRd9qmyYQ4KjlxAxCfVRvAF3rzSrYSvam
 YfccRvr7CWrUhZ7IqIiUBUXN18+NpFNncgHDJ8ZdneEJpkEGbZAk8CPlY07y838q/9j7
 kEIWhXHmyArgTzxFGPBBVmOLgufAattU7jUb6vQXE9jE7tl0jBpg9TRZQDI1RuUCUPgp
 ehOQ==
X-Gm-Message-State: AOAM5306RKXP3svrtbxkjI/HljYShu1TppuHnr/WI4m7xEf2HbbpvZtP
 IrXcOxdeZe1nd0QGOYEg9OmMZa6gU39Tlw==
X-Google-Smtp-Source: ABdhPJyZQJBwJAMZuh90P/2Q6e9SCYjIsDiflUTPUPShMvz1hvnZUEzc0CBTUFiZU0MfxOa8vVMZUQ==
X-Received: by 2002:a63:7e10:: with SMTP id z16mr14497437pgc.263.1611803199650; 
 Wed, 27 Jan 2021 19:06:39 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
 by smtp.gmail.com with ESMTPSA id
 b65sm3926172pfg.3.2021.01.27.19.06.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 19:06:39 -0800 (PST)
Subject: Re: [PATCH] powerpc/fault: fix wrong KUAP fault for IO_URING
To: Zorro Lang <zlang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
References: <20210127145648.348135-1-zlang@redhat.com>
 <cce83328-d996-defc-6c87-97cd24ec7027@csgroup.eu>
 <a8013c71-433a-96b3-c657-66ac2ba5b838@kernel.dk>
 <1611792928.nw4g8h8kj4.astroid@bobo.none>
 <20210128031355.GP14354@localhost.localdomain>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <66061f75-c8de-c1eb-aaaf-9594a31be790@kernel.dk>
Date: Wed, 27 Jan 2021 20:06:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128031355.GP14354@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/27/21 8:13 PM, Zorro Lang wrote:
> On Thu, Jan 28, 2021 at 10:18:07AM +1000, Nicholas Piggin wrote:
>> Excerpts from Jens Axboe's message of January 28, 2021 5:29 am:
>>> On 1/27/21 9:38 AM, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 27/01/2021 à 15:56, Zorro Lang a écrit :
>>>>> On powerpc, io_uring test hit below KUAP fault on __do_page_fault.
>>>>> The fail source line is:
>>>>>
>>>>>    if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write)))
>>>>>        return SIGSEGV;
>>>>>
>>>>> The is_user() is based on user_mod(regs) only. This's not suit for
>>>>> io_uring, where the helper thread can assume the user app identity
>>>>> and could perform this fault just fine. So turn to use mm to decide
>>>>> if this is valid or not.
>>>>
>>>> I don't understand why testing is_user would be an issue. KUAP purpose
>>>> it to block any unallowed access from kernel to user memory
>>>> (Equivalent to SMAP on x86). So it really must be based on MSR_PR bit,
>>>> that is what is_user provides.
>>>>
>>>> If the kernel access is legitimate, kernel should have opened
>>>> userspace access then you shouldn't get this "Bug: Read fault blocked
>>>> by KUAP!".
>>>>
>>>> As far as I understand, the fault occurs in
>>>> iov_iter_fault_in_readable() which calls fault_in_pages_readable() And
>>>> fault_in_pages_readable() uses __get_user() so it is a legitimate
>>>> access and you really should get a KUAP fault.
>>>>
>>>> So the problem is somewhere else, I think you proposed patch just
>>>> hides the problem, it doesn't fix it.
>>>
>>> If we do kthread_use_mm(), can we agree that the user access is valid?
>>
>> Yeah the io uring code is fine, provided it uses the uaccess primitives 
>> like any other kernel code. It's looking more like a an arch/powerpc bug.
>>
>>> We should be able to copy to/from user space, and including faults, if
>>> that's been done and the new mm assigned. Because it really should be.
>>> If SMAP was a problem on x86, we would have seen it long ago.
>>>
>>> I'm assuming this may be breakage related to the recent uaccess changes
>>> related to set_fs and friends? Or maybe recent changes on the powerpc
>>> side?
>>>
>>> Zorro, did 5.10 work?
>>
>> Would be interesting to know.
> 
> Sure Nick and Jens, which 5.10 rc? version do you want to know ? Or any git
> commit(be the HEAD) in 5.10 phase?

I forget which versions had what series of this, but 5.10 final - and if
that fails, then 5.9 final. IIRC, 5.9 was pre any of these changes, and
5.10 definitely has them.

-- 
Jens Axboe

