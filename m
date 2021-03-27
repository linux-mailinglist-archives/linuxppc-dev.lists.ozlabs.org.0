Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3CF34B891
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 18:43:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F75mX63DZz3btg
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Mar 2021 04:43:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=iOVm2RbQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2a00:1450:4864:20::330;
 helo=mail-wm1-x330.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256
 header.s=google header.b=iOVm2RbQ; dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F75m56HgCz301s
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 04:43:14 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id g25so4563857wmh.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 10:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yNxslCOJwZYx+SbKa/upP8KV5ZgrhKAsdDOHz5EQWWM=;
 b=iOVm2RbQPCV69seaL+izj3Bh/O+c+idV03XMwCDg2iHiirkdVubBYmkj553VX0J2ok
 zuShUO2DF47DlNjsapux1l2sQoDajBgT4RsWa0+pLHFe1u0Eac7PzMI+m1CikXRkfEF8
 yJ6kcQ1Lq1RVadI5LDrJyQoIPUtJJIttewRzCdHHO7cj1wDHOQZPUhQ5x9A9LHV0So3q
 z+7xgFoIjzTtqpO8Y2UHpyiQMXt/0DZbW6i3U8ogktx26lN0NKVhMkSHCoMHeQA8pNNk
 oCcqTNHyUyw8Ld7r3TgJyqc2luHHrk7NhfY3V1NB7/KRyhY8zlZ+lajtJbOSqXt3ag4V
 7jOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yNxslCOJwZYx+SbKa/upP8KV5ZgrhKAsdDOHz5EQWWM=;
 b=Q7D5DAUtPdo2mWGSgO+lZhipR5q5/6dmhuECd4f4rZla6Uy6YkAr8zCg2SwqsObj3B
 Jbh6c6hHurDVgAVR2RSgumns/U4WrWjOqWDXsLDObP8cHgiN7tCEqCjSG0slhDgiyb/l
 7t1FxpwMhCMR7evmc70X0It+uCj1l0VJj6ej42617l29xyUbqCUJf3rDMzvKkeYyY2oK
 vMxuf8VAXsTY3gL0cNK0+Zn2cEPKrtnTgkgXsrXOLByvH90WU1tELqQXZBYNHQkn8NLN
 +Dl9teMyuVSYVzvJxX0/N0hcYpzfcnvGdD1rVs1ehQVWzt78C9IWaIltiabtNqeuRhBw
 kE/A==
X-Gm-Message-State: AOAM530mpG83dH6zbF82BGopAafbndQmXbT8wnygTr82Vgv72hKcEIH3
 c6Zc+ZfoPXbl42mflaKtFK8I0w==
X-Google-Smtp-Source: ABdhPJxz8erCB49wvD/D6v8ICiz9rIyHy8vRfJ50YOzrz9LIBHUBMGNkAjOtzYj+4k637hV9/bnj4A==
X-Received: by 2002:a05:600c:3553:: with SMTP id
 i19mr18021218wmq.1.1616866986716; 
 Sat, 27 Mar 2021 10:43:06 -0700 (PDT)
Received: from ?IPv6:2a02:8084:e84:2480:228:f8ff:fe6f:83a8?
 ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id u20sm20705443wru.6.2021.03.27.10.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Mar 2021 10:43:06 -0700 (PDT)
Subject: Re: [PATCH] powerpc/vdso: Separate vvar vma from vdso
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org
References: <20210326191720.138155-1-dima@arista.com>
 <52562f46-6767-ba04-7301-04c6209fe4f1@csgroup.eu>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <1b1494a8-da80-e170-78fa-48dfb3226e75@arista.com>
Date: Sat, 27 Mar 2021 17:43:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <52562f46-6767-ba04-7301-04c6209fe4f1@csgroup.eu>
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
Cc: Dmitry Safonov <0x7f454c46@gmail.com>, stable@vger.kernel.org,
 Andrei Vagin <avagin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 3/27/21 5:19 PM, Christophe Leroy wrote:
[..]
>> I opportunistically Cc stable on it: I understand that usually such
>> stuff isn't a stable material, but that will allow us in CRIU have
>> one workaround less that is needed just for one release (v5.11) on
>> one platform (ppc64), which we otherwise have to maintain.
> 
> Why is that a workaround, and why for one release only ? I think the
> solution proposed by Laurentto use the aux vector AT_SYSINFO_EHDR should
> work with any past and future release.

Yeah, I guess.
Previously, (before v5.11/power) all kernels had ELF start at "[vdso]"
VMA start, now we'll have to carry the offset in the VMA. Probably, not
the worst thing, but as it will be only for v5.11 release it can break,
so needs separate testing.
Kinda life was a bit easier without this additional code.

>> I wouldn't go as far as to say that the commit 511157ab641e is ABI
>> regression as no other userspace got broken, but I'd really appreciate
>> if it gets backported to v5.11 after v5.12 is released, so as not
>> to complicate already non-simple CRIU-vdso code. Thanks!
>>
>> Cc: Andrei Vagin <avagin@gmail.com>
>> Cc: Andy Lutomirski <luto@kernel.org>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Laurent Dufour <ldufour@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: stable@vger.kernel.org # v5.11
>> [1]: https://github.com/checkpoint-restore/criu/issues/1417
>> Signed-off-by: Dmitry Safonov <dima@arista.com>
>> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> I tested it with sifreturn_vdso selftest and it worked, because that
> selftest doesn't involve VDSO data.

Thanks again on helping with testing it, I appreciate it!

> But if I do a mremap() on the VDSO text vma without remapping VVAR to
> keep the same distance between the two vmas, gettimeofday() crashes. The
> reason is that the code obtains the address of the data by calculating a
> fix difference from its own address with the below macro, the delta
> being resolved at link time:
> 
> .macro get_datapage ptr
>     bcl    20, 31, .+4
> 999:
>     mflr    \ptr
> #if CONFIG_PPC_PAGE_SHIFT > 14
>     addis    \ptr, \ptr, (_vdso_datapage - 999b)@ha
> #endif
>     addi    \ptr, \ptr, (_vdso_datapage - 999b)@l
> .endm
> 
> So the datapage needs to remain at the same distance from the code at
> all time.
> 
> Wondering how the other architectures do to have two independent VMAs
> and be able to move one independently of the other.

It's alright as far as I know. If userspace remaps vdso/vvar it should
be aware of this (CRIU keeps this in mind, also old vdso image is dumped
to compare on restore with the one that the host has).

Thanks,
          Dmitry
