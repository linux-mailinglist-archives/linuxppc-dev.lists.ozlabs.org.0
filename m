Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F98744C15
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jul 2023 05:04:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=GIbz09WV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qtv6P1ryyz3bv8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jul 2023 13:04:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=GIbz09WV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qtv5V130Lz3075
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jul 2023 13:03:41 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6686c74183cso2608479b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Jul 2023 20:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688267016; x=1690859016;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+WkD1spmkCtSByMtGbTNiya9x18zjitcw6zTIWUJH4=;
        b=GIbz09WVg7xNtgefGpf32hZ6ZxYca2OFbdDyTaszABCACg/4CH9MkOu4l4Nl3gxgWN
         YubC5PWZmWa/GRi1Yvv5hyi5OzFxtuOaAMuf4jz8syzRofFApCctiDHpW4j2F5iFV6Sn
         gX2dJXhNdW8cumMub8w/D25yGfhpOEcokRmyu6Q0vBLlXVq1Klrlx+hldFChw2Lx8fn5
         fF+VNnsqA0IVp0wYhY0sSsZbwNFQOoy1NS5Gt/z3P5pcYNX6UXtlRbBIVqcYwT6Ahchs
         GUYpAyq2sArhVdvrxeT3JLF/Ff7yZVAhYkcJ9W8ATeCBayghWoFCp2CO5ZTqPSWNhiD2
         ZwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688267016; x=1690859016;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0+WkD1spmkCtSByMtGbTNiya9x18zjitcw6zTIWUJH4=;
        b=eZHWLh2T1Owb1/0z0zm1uuWhHr4YeyhZchNmgtPilAM9gryXNZpllbweOYITL4oKZG
         un1u5PwntkshCo4uNVF1IdQK1UIxTeOrQHb/hmFOlWpuaQ4O4lkYilokyZP/GSj0IUCe
         NxTfkqqpFvCSq62j81n8jmFfW6ldWYev5OZSm6/SV9pqMjnhslrH5kgq37ipiMi6TAcg
         GR6OM4IOvNox0ZVoj7PJctgfxcrIt+ajhIAHnOQe9UivLWqjOgzty+l//Yt/q+XlFJJS
         A5XYJpBe+sja34FvT4y618Cb6aWLQehj1BG0NDoL31NzkWBvLX1ybcLaLrDPAid/QLXI
         tqow==
X-Gm-Message-State: ABy/qLbGl9TMkTlOFpvDRqkZb2GEDo+wWAB+Vgp6xrAcxtwzLztC4S5T
	NwBrSNncsKRVO/jvAoNacOk=
X-Google-Smtp-Source: APBJJlE3EOfGlv4GwutC6Fr9Wf5e7s+tgg0H+RBJMnTQRCrpa9+9+63Ln4KG7fGGJ8CZdXFrLQkyig==
X-Received: by 2002:a05:6a00:1806:b0:66b:6021:10fe with SMTP id y6-20020a056a00180600b0066b602110femr9802737pfa.31.1688267015903;
        Sat, 01 Jul 2023 20:03:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 5-20020aa79145000000b006688e3de86fsm11979372pfi.85.2023.07.01.20.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jul 2023 20:03:35 -0700 (PDT)
Message-ID: <8d0e1a7c-3533-4b02-c1d6-3732f9680b2b@roeck-us.net>
Date: Sat, 1 Jul 2023 20:03:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 6/6] watchdog/hardlockup: Define
 HARDLOCKUP_DETECTOR_ARCH
To: Doug Anderson <dianders@chromium.org>
References: <20230616150618.6073-1-pmladek@suse.com>
 <20230616150618.6073-7-pmladek@suse.com>
 <7cfc15f1-d8d0-4418-b7a1-5aa9e90e3fb3@roeck-us.net>
 <CAD=FV=UsgweS0pTpr=6xE-+Dx0fqXgjN=3Gf-4MQcNAzjL+64w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD=FV=UsgweS0pTpr=6xE-+Dx0fqXgjN=3Gf-4MQcNAzjL+64w@mail.gmail.com>
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/1/23 09:08, Doug Anderson wrote:
> Hi,
> 
> On Sat, Jul 1, 2023 at 7:40 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Fri, Jun 16, 2023 at 05:06:18PM +0200, Petr Mladek wrote:
>>> The HAVE_ prefix means that the code could be enabled. Add another
>>> variable for HAVE_HARDLOCKUP_DETECTOR_ARCH without this prefix.
>>> It will be set when it should be built. It will make it compatible
>>> with the other hardlockup detectors.
>>>
>>> The change allows to clean up dependencies of PPC_WATCHDOG
>>> and HAVE_HARDLOCKUP_DETECTOR_PERF definitions for powerpc.
>>>
>>> As a result HAVE_HARDLOCKUP_DETECTOR_PERF has the same dependencies
>>> on arm, x86, powerpc architectures.
>>>
>>> Signed-off-by: Petr Mladek <pmladek@suse.com>
>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>> ...
>>> --- a/include/linux/nmi.h
>>> +++ b/include/linux/nmi.h
>>> @@ -9,7 +9,7 @@
>>>   #include <asm/irq.h>
>>>
>>>   /* Arch specific watchdogs might need to share extra watchdog-related APIs. */
>>> -#if defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)
>>> +#if defined(CONFIG_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)
>>
>> This results in:
>>
>> arch/powerpc/platforms/pseries/mobility.c: In function 'pseries_migrate_partition':
>> arch/powerpc/platforms/pseries/mobility.c:753:17: error: implicit declaration of function 'watchdog_hardlockup_set_timeout_pct'; did you mean 'watchdog_hardlockup_stop'? [-Werror=implicit-function-declaration]
>>    753 |                 watchdog_hardlockup_set_timeout_pct(factor);
>>
>> with ppc64_defconfig -CONFIG_HARDLOCKUP_DETECTOR, because the dummy
>> for watchdog_hardlockup_set_timeout_pct() is still defined in
>> arch/powerpc/include/asm/nmi.h which is no longer included.
> 
> Can you test with:
> 
> https://lore.kernel.org/r/20230629124500.1.I55e2f4e7903d686c4484cb23c033c6a9e1a9d4c4@changeid
> 

Sorry for the noise. I didn't find that one.

Yes, that should work. It is a bit odd that including both linux/nmi.h
and asm/nmi.h is required, but as it turns out that is actually quite common.

Thanks,
Guenter


