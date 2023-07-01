Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B91744A88
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 18:23:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Yu6rB9zp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qtctj73Psz3btl
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jul 2023 02:23:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Yu6rB9zp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QtcsP50f2z30f4
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jul 2023 02:22:16 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b6824141b4so17634765ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Jul 2023 09:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688228533; x=1690820533;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eqUKdurwe6L/lCzL+nDfeInRljPuUHPLpXkXa64hvDk=;
        b=Yu6rB9zpV2iWzMFz2uX0HZdqH0Pl2/8o54zaJG2YsxZhs0H9E46zOk+5RFz+CH+HFe
         C5lxxVmoyRIBmr9MYH4tMYF0dUGnz3hYvwGcfAXQbQfvZZkizPlP5CTNgP6vx7bUNhAu
         PHOlQ/XacJPR9M62K8dxJILm0sRcumDIGr2J3yFcTk0pNvEhNpzuH3v5UoaAb9e/cHyW
         XNcDCBAsGf0UcyVJoiPXroP8uI5BqeXpR4pWaF8OT/1kvLn5P9ocww2hBvauT+NixnPq
         72vrW5plPqkejIVKgJfBm3RtbKTAl9ySfLfdLWBNK13aXiM/a1nQlCOfN570m96SKPIJ
         W4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688228533; x=1690820533;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eqUKdurwe6L/lCzL+nDfeInRljPuUHPLpXkXa64hvDk=;
        b=lDWAziNNRedK1SFbv1Lbt0ugfzuFFQPqlwyqKLQPoFo70zcQHisozFeRHxDqadNSyD
         Uq6PwzvbOPGuHZL5MA4iLrYJ4/GcuekYR6hswGCQJBoKkA76AyM2i+f1O0RWIxVylVyv
         RvJETNGELab2OMtDpxvJ6wqu/Z1RVn1oGChOsIB+DeUaz10LDEZ5SzX7HKBUj1oOOYPe
         qiNCcDFeZp3Ke2IEyMYTtwO6k9CFB6UrnLhZg2Az2Ku8bw9cLOZHHWBF0TubPRqIcYdl
         IAjjK9MPiJ9pBoclS9X3qUaQsAys8ITNZuzNOHdZtC1oC0XyFVhgh/6c96d/6WokCjJQ
         Qrbw==
X-Gm-Message-State: ABy/qLY5ySfhdpihRAdNTy4hbj/zTUbz0XaISiAWuFuiSK2nARkvbGHM
	UrkQbBlwriLkCH0apzrGJlM=
X-Google-Smtp-Source: APBJJlF4DRTk5B+Ly7B1ketuD+8ABWyitJniEAI9zJpbQnWojtqCLeVtBTxW3tg6hE5OjUySzLE1lg==
X-Received: by 2002:a17:902:c406:b0:1b6:783d:9ba7 with SMTP id k6-20020a170902c40600b001b6783d9ba7mr8807226plk.27.1688228533345;
        Sat, 01 Jul 2023 09:22:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g12-20020a170902740c00b001b6674b6140sm12524647pll.290.2023.07.01.09.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jul 2023 09:22:12 -0700 (PDT)
Message-ID: <0025db66-545d-c52b-1c32-fa86e17ff0e7@roeck-us.net>
Date: Sat, 1 Jul 2023 09:22:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20230616150618.6073-1-pmladek@suse.com>
 <20230616150618.6073-7-pmladek@suse.com>
 <7cfc15f1-d8d0-4418-b7a1-5aa9e90e3fb3@roeck-us.net>
 <CAD=FV=UsgweS0pTpr=6xE-+Dx0fqXgjN=3Gf-4MQcNAzjL+64w@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 6/6] watchdog/hardlockup: Define
 HARDLOCKUP_DETECTOR_ARCH
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

Ah, I didn't find that one. Sorry for the noise.

Yes, that should work. It is a bit odd that including both linux/nmi.h
and asm/nmi.h is required, but as it turns out that is actually quite common.

Thanks,
Guenter

