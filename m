Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 665275FD433
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 07:21:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnyY428l9z3dt2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 16:21:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZYktr17U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZYktr17U;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnyWt09WSz3chT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 16:20:09 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id p14so988970pfq.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 22:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j339I4LKiSmkjT8SwB4/ylltBaTona5Ee0gHV/DqG/M=;
        b=ZYktr17UImf5XPu8Ob2vrY6PSZ0nsHPOPGytdOayvYaZaz2EurrTfnNdPcah4itVBD
         XSawQ1egXSsmRIC+BJhzuyeCV7qah8VuI6z/mkwBdCgOn36VyhN1FlDv942YS8hJoX2g
         yzSQ/mM5iuhV2jMB6DPNE8hzN7+fXKwl1i6YbaSn8NFjapLJp/2LRwf/5ejJGtiYJgpA
         PpAnKmN+PgvogrPmSFWishhpMRNwYLvgk++EB3XxovgnFCDWB0NaB7GsrUQ64fYEhc2q
         bzGK17CTQUastpx/pIJnS18H1mrLdeLT5oz3b9F/tiMtW8t4lwAbR1yBiTEXVAZcAepM
         n/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j339I4LKiSmkjT8SwB4/ylltBaTona5Ee0gHV/DqG/M=;
        b=wFxYnArsfU3FPAwFOrQITV+v0UrPo5Bmo8zelWkKVlLHQKvqPnN+7VXuFUy5dd4P0A
         lteIGW2/53WBi0GVQYoQfGFXNsgjta86eyK52di5criFrzc4tFcjHjiy/5hs19qXVNGS
         32bMQmIPnYWso4n8flCYhCxmzVNhsULd9pkK6Lf4fD4pi/PbB7PuqK5NA8QUwJ44aEA9
         eIbN0gixxkaScMZMdytilOU/49GkVAPvF/Ip+DTTRu/M10+k1fgZVJvpTub+xsXsic/k
         idQialaIItX6bENsyiRyHPtVvC0j46qTSL9mKRaMfJEBhHXMEAbChszOz0WRCEyLh7z0
         mUyA==
X-Gm-Message-State: ACrzQf1c3dXVo8Bf9gtanxZgC8MHatjQQiNaU3nKyO7J0yyKglvI5MWM
	rP6Gwfqnzb4jwTG/JAkZSyY=
X-Google-Smtp-Source: AMsMyM5AV5Z/58Cx/5fQXKMNAh6hOETtKM5qigRaM9XNRUelZfM2yR4jFNTdf/UxDsMcVv4ATpFdiA==
X-Received: by 2002:a63:1e0f:0:b0:44b:796c:bc14 with SMTP id e15-20020a631e0f000000b0044b796cbc14mr27981439pge.563.1665638405394;
        Wed, 12 Oct 2022 22:20:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z8-20020a170903018800b00177c488fea5sm11736743plg.12.2022.10.12.22.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 22:20:04 -0700 (PDT)
Message-ID: <c67aa49c-e260-fedc-4f91-18278dc21f1f@roeck-us.net>
Date: Wed, 12 Oct 2022 22:20:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <20221012141827.GA2405914@roeck-us.net> <Y0biBtCUtc2mowbQ@zx2c4.com>
 <20221012164452.GA2990467@roeck-us.net> <Y0b3ZsTRHWG6jGK8@zx2c4.com>
 <20221012221615.GA364143@roeck-us.net> <87bkqgmvxl.fsf@mpe.ellerman.id.au>
 <20221013002148.GA535574@roeck-us.net> <CNKJ6FE6U35I.3ERMDQR9MHRLX@bobo>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
In-Reply-To: <CNKJ6FE6U35I.3ERMDQR9MHRLX@bobo>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/12/22 22:03, Nicholas Piggin wrote:
> On Thu Oct 13, 2022 at 10:21 AM AEST, Guenter Roeck wrote:
>> On Thu, Oct 13, 2022 at 11:03:34AM +1100, Michael Ellerman wrote:
>>> Guenter Roeck <linux@roeck-us.net> writes:
>>>> On Wed, Oct 12, 2022 at 11:20:38AM -0600, Jason A. Donenfeld wrote:
>>>>>
>>>>> I've also managed to not hit this bug a few times. When it triggers,
>>>>> after "kprobes: kprobe jump-optimization is enabled. All kprobes are
>>>>> optimized if possible.", there's a long hang - tens seconds before it
>>>>> continues. When it doesn't trigger, there's no hang at that point in the
>>>>> boot process.
>>>>>
>>>>
>>>> I managed to bisect the problem. See below for results. Reverting the
>>>> offending patch fixes the problem for me.
>>>
>>> Thanks.
>>>
>>> This is probably down to me/us not testing with PREEMPT enabled enough.
>>>
>> Not sure. My configuration has
>>
>> CONFIG_PREEMPT_NONE=y
>> # CONFIG_PREEMPT_VOLUNTARY is not set
>> # CONFIG_PREEMPT is not set
> 
> Thanks very much for helping with this. The config snippet you posted here
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-October/249758.html
> has CONFIG_PREEMPT=y. How do you turn that into a .config, olddefconfig?
> 
> I can't reproduce this so far using your config and qemu command line,
> but the patch you've bisected it to definitely could cause this. I'll
> keep trying...
> 

Uuh, sorry, I think I got confused with running multiple bisects on the
same branch, and took the above from a different bisect run. You are
correct, PREEMPT is enabled in the configuration.

Timing is definitely involved; I see the problem more often on a loaded
system. To bisect it, I had to repeat the test for each bisect step
several times (I set the limit to 20 retries; that gave me reliable
results).

Guenter
