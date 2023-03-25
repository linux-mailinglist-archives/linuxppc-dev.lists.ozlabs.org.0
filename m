Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEC66C8989
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 01:21:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pk09z6RGlz3fSb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 11:21:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=32+/wIIq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=32+/wIIq;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pk09066cmz3fFD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 11:20:33 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-62810466cccso168194b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 17:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1679703630;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ndu5doDjig+0uYBGAJgS6rF7FglS0YRUfP41ZsMzBdA=;
        b=32+/wIIq5Gmb08yWcqgVdh/mLFsv6QUbUmnTl6D+NuXF17+sHT05rpjUHZdsjC1Fj3
         biy4iG6IsXzB5CkPSsvk5+eRUYaLWfMLE3qXOwjXPrlfSBk9XdG9rtX5T67WmhYMBMdG
         y3gonguIyqa/eALT1nPXVyUe6HMi5wbK22L3pvrbETTOOzgrUQGq3kpBopv5ppk+qo99
         t2E3NVNFnfpzvfPr6r0zsv2WQDhu+5f74jAWhNLh4r9lmbkMdF9fWDUyp3QpkXCdFbvN
         pM9V5ahn6zIh+EqOBuDAiF1MtAT/NfbUj3z0K+A5K8QXO5YRVHT4LZBss6THZv7jxOgS
         x39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679703630;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ndu5doDjig+0uYBGAJgS6rF7FglS0YRUfP41ZsMzBdA=;
        b=BKJbbausG8VCTTgVYs2S4qXpgyLW3Cf0ux6+UiSCJRY78TQ4mUOioFLdnYnwRpIPBe
         tHYuiwwl2kco+W92dqD+pNGE6KSOU+vpPip0liKKcr2M5FYgbL+vFA+6HR7sFYl4li0M
         fiELWSVOrdFf/JJeW5ydHIS8gx/kR1wqv+3doqPw5ZIIrjD9VNXXeHHkdQ/jn4yw2HpL
         zjOvpoYtoWufo+1Fu6iZ5rQSvdImG0bQqGUDROj7f6xf3BShA/UnyStaXr7FNC0PT9ef
         iZqU9SuzJZt7r9aKZELzSsm84KzpvRiRU8Msl+xmq/7GFbLg7VvrOHCa5SbnRCwJRDLr
         fuSA==
X-Gm-Message-State: AO0yUKWWLoECAp9NdE9BvAW7VVkan4/slk3VGQWAXHLPYvws5JV3YgYr
	83sg5swim58yPGnOPuil28qrrw==
X-Google-Smtp-Source: AK7set9Va7YB/CQM9VrqZ+7eitIXzQnbnM/mzQ3kPvCT4inOfiNaVhCkmTpkoUhjMG1s140dogWmzw==
X-Received: by 2002:a05:6a20:69a3:b0:cc:4118:65c4 with SMTP id t35-20020a056a2069a300b000cc411865c4mr4709700pzk.5.1679703630046;
        Fri, 24 Mar 2023 17:20:30 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id n2-20020aa79042000000b00625e885a6ffsm4042398pfo.18.2023.03.24.17.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 17:20:29 -0700 (PDT)
Message-ID: <6e289a1c-9cb0-6759-1d38-ddf2f5a251f5@kernel.dk>
Date: Fri, 24 Mar 2023 18:20:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Memory coherency issue with IO thread offloading?
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>
References: <2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk>
 <272cda99-3b1a-95cd-ce03-bc3d17d572ec@csgroup.eu>
 <5fa06524-7170-aeb4-4b5c-2be2ffad696b@kernel.dk>
 <87jzz5u1nv.fsf@mpe.ellerman.id.au>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <87jzz5u1nv.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/24/23 6:15 PM, Michael Ellerman wrote:
> Jens Axboe <axboe@kernel.dk> writes:
>> On 3/24/23 1:27?AM, Christophe Leroy wrote:
>>> Le 23/03/2023 ? 19:54, Jens Axboe a ?crit :
>>>> I got a report sent to me from mariadb, in where 5.10.158 works fine and
>>>> 5.10.162 is broken. And in fact, current 6.3-rc also fails the test
>>>> case. Beware that this email is long, as I'm trying to include
>>>> everything that may be relevant...
>>>
>>> Which variant of powerpc ? 32 or 64 bits ? Book3S or BookE ?
>>
>> I knew I'd forget something important... It's power9:
>>
>> processor	: 0
>> cpu		: POWER9 (architected), altivec supported
>> clock		: 2200.000000MHz
>> revision	: 2.2 (pvr 004e 1202)
> 
> Believe it or not there's still more variables in play, Power9 has two
> different MMUs, and Linux can run on two different hypervisors as well
> as on bare metal P9 :)

Just my luck :-)

> 
> Can you paste the last ~10 lines of /proc/cpuinfo, with the "machine",
> "firmware" and "MMU" lines, that should tell us everything we need to
> know.

timebase	: 512000000
platform	: pSeries
model		: IBM pSeries (emulated by qemu)
machine		: CHRP IBM pSeries (emulated by qemu)
MMU		: Radix

I know it reproduces bare metal as well, but no details on what
that box is. I just know I was able to reproduce it in this vm that
I was able to get my hands on.

-- 
Jens Axboe


