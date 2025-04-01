Return-Path: <linuxppc-dev+bounces-7418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED9BA781B2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Apr 2025 19:53:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRwbk5qmyz2yqy;
	Wed,  2 Apr 2025 04:53:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1029"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743530034;
	cv=none; b=IPuTj+V5BuCtt20reyerCZb0v/ZpgO4HRG0kB24jc/1DXvkbnyk+fuZtbiHFjPK6YGGUIv13i43z+3erpwuIkazF8FK7dIf8XDJSgQ/ikVCzeJRuoUnDh8Nm/Eea/XnWuT8tAeJeKQWxyavnubYPa/yNIq0+1ghMCS8La6R5Cvg78cux7e7i6fKyyPIJky8SOiW8r8muRwe1e5+dYyOuWUS4IJp0YguxP/wMSMh9omV7CyO7unQep1X+F4NEYd0mof9aDLR9W9pLZfp38zKCGXr3qMnB9ltmylsNDCbHZZABPdKx+HWcySnEGGYgk8y/gAiWuE3aYX6cTLuVcBgrnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743530034; c=relaxed/relaxed;
	bh=JAMVOcHUHUp9NIh99z5L1mUQFRtZqcxl3Eb+q823hSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WubjXrCxs0/Snw6NrQZsx//rnTxNoqhsFSWPCtrOhOxl34VwIL+xyFJQD+4B3iXqyjeRYoRJbOPGb+zfEp1qA25omLZ6ZqvvL+710RhrMOLq+AHHpcE8G1dUT4fJf4/TdUbJOIkiCJX7rhTWK1NZ60M/HrvU5H8sgFx7V5vl7p9SG15WluP6QrSPJop0OelcJvIHlluTqjjA+qCNhJDgGRETPGR2sxN+AJny+3B7caG9S+C0fhZgX49eNikp3RT8uO3glOuq+cZ/QePpdjNvUZ44Yi0PCbLW7sRJ9fwqekFNZCfDycXEW2ddJt0NBcnZW1ErDIplGqx7BtoyV49kdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PHonO35c; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PHonO35c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRwbj0Kjfz2yVX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Apr 2025 04:53:51 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-30362ee1312so10300493a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Apr 2025 10:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743530029; x=1744134829; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JAMVOcHUHUp9NIh99z5L1mUQFRtZqcxl3Eb+q823hSk=;
        b=PHonO35cOl4eB9XRPG7nmJwvD9QHeGYSyy3hG6o+jtKcMjioGrKNppbGZ9Bno1SU4O
         3PvIoFxPzCxiscHm/Yz7l1mGNCskqfu4Jt2s5tKVFxkqPdAqumcCmXE2tl+plDmT6rUR
         xshh0z4DctqTUTzUXT63qwYo0j0lTutKt14zX88FdLE7GsxE5TrdsRmfo5MfzGcUg7hA
         A5f0LPFmJc0hJ6aqKx1UWR6b4hlXL6BAeScgek9+8veA3LZdFBpLNT+d7BWRioEkXNcv
         j+UXcDaXMKgSK8EoWUJ8Ks68F7RkjxoY8a8S6q/iButMbXfiyneyat9S5c6cFBWpzI22
         zQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743530029; x=1744134829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAMVOcHUHUp9NIh99z5L1mUQFRtZqcxl3Eb+q823hSk=;
        b=PifTtVf09k9/Cnrcr+NPorLpuBwczxjRgOoygvYhxAdDZfglJmgD8x9C3oS/VC3C8Q
         XvM/wAj98yfH8jIUPMqL9LSHoVzTpB97KMaVzl30V6BurGpb7ioo2FPffc4gueJtYwga
         qBKIDm7/Fsr4nz6pT7FP2rdeIE6P4mG4mGTRDw/JlTu2A1lnMjmi7fqbGpqg+YFe+4bj
         3iJ+eNrDV1dAS+a1LbzkXuQk+4GFiRjAcfW62xpvvIyma6kkuVOf3uG//n75L2J/n8e3
         B79rkPvwojQvszg/73POVlxxELo8+g02bZVVyReTaUArdsQqMZRDV5XULSp0IboJl8Z5
         FPlw==
X-Forwarded-Encrypted: i=1; AJvYcCWIu+bLSdoxiAYoVDMxdFvSsvjLoRREbcDr6c4IFJKDXmzTdgX/3H7txSyuhi3c3sqKInDeKZ9q52efKbU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz+ZYMWItqOsB765X7CxyQn5PDJZ+arG5K8cWJq0B/0yJOIWMSc
	sApmJBNDhLBWsFjTtEhbyzPE9PNOzcGbaQ5+SCvoSDqer/ezfyTo
X-Gm-Gg: ASbGncvM9HVq8zZrcNIBCT5EaPsSJB8JH/K2KrsjLj9e8D5AY6AphcRwJDQCMY3Rfrd
	RGPBO6+266K+joxGHEKgex5q01d0FYW8FnF9StE/NpO5VasjfTXhWk7FhWeFwVzAMMbnVwwzuoW
	WWio8Vr8FhmgpHAcFC2GC5eIl8/dW36CqixsYEIv/u4Y7ZadDS0JyjDrmo2PqG1r+9+u5iGIOyU
	uToaKAULPUeIB61r690NK2YACVXxIE7l4MCqKHFbyZwdrEB+kNrmIxc7w1H/H/q7H1j8KxsY80h
	f+wuNWQY/V0idPUyDy2vJc/rBmYK+Zq2h7OVr0TRNh0mCsEYbihVr0mkVeGAmngzTTOWprYSbtE
	oxOpouI6TolOO1kWgDw==
X-Google-Smtp-Source: AGHT+IFhOMd4yd6M+FWAK5Hy8goXBks0rAj4TVyMNP7GV5VDf1+ABmWCHzxIltBfqT7LAbEN+HeHUw==
X-Received: by 2002:a17:90b:1d48:b0:2fe:b774:3ec8 with SMTP id 98e67ed59e1d1-305321471fcmr18084239a91.23.1743530029346;
        Tue, 01 Apr 2025 10:53:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516d62c57sm9624079a91.28.2025.04.01.10.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 10:53:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ddc7939f-fb98-43af-aed1-0bc0594ecc41@roeck-us.net>
Date: Tue, 1 Apr 2025 10:53:46 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/14] x86: Add support for suppressing warning
 backtraces
To: Peter Zijlstra <peterz@infradead.org>,
 Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard
 <mripard@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-7-acarmina@redhat.com>
 <20250401170829.GO5880@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250401170829.GO5880@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 4/1/25 10:08, Peter Zijlstra wrote:
> On Thu, Mar 13, 2025 at 11:43:21AM +0000, Alessandro Carminati wrote:
>> From: Guenter Roeck <linux@roeck-us.net>
>>
>> Add name of functions triggering warning backtraces to the __bug_table
>> object section to enable support for suppressing WARNING backtraces.
>>
>> To limit image size impact, the pointer to the function name is only added
>> to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
>> CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
>> parameter is replaced with a (dummy) NULL parameter to avoid an image size
>> increase due to unused __func__ entries (this is necessary because __func__
>> is not a define but a virtual variable).
>>
>> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
>> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Borislav Petkov <bp@alien8.de>
>> Cc: Dave Hansen <dave.hansen@linux.intel.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
>> ---
>>   arch/x86/include/asm/bug.h | 21 ++++++++++++++++-----
>>   1 file changed, 16 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
>> index e85ac0c7c039..f6e13fc675ab 100644
>> --- a/arch/x86/include/asm/bug.h
>> +++ b/arch/x86/include/asm/bug.h
>> @@ -35,18 +35,28 @@
>>   
>>   #ifdef CONFIG_DEBUG_BUGVERBOSE
>>   
>> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
>> +# define HAVE_BUG_FUNCTION
>> +# define __BUG_FUNC_PTR	__BUG_REL(%c1)
>> +# define __BUG_FUNC	__func__
>> +#else
>> +# define __BUG_FUNC_PTR
>> +# define __BUG_FUNC	NULL
>> +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
>> +
>>   #define _BUG_FLAGS(ins, flags, extra)					\
>>   do {									\
>>   	asm_inline volatile("1:\t" ins "\n"				\
>>   		     ".pushsection __bug_table,\"aw\"\n"		\
>>   		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
>>   		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
>> -		     "\t.word %c1"        "\t# bug_entry::line\n"	\
>> -		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
>> -		     "\t.org 2b+%c3\n"					\
>> +		     "\t"  __BUG_FUNC_PTR "\t# bug_entry::function\n"	\
>> +		     "\t.word %c2"        "\t# bug_entry::line\n"	\
>> +		     "\t.word %c3"        "\t# bug_entry::flags\n"	\
>> +		     "\t.org 2b+%c4\n"					\
>>   		     ".popsection\n"					\
>>   		     extra						\
>> -		     : : "i" (__FILE__), "i" (__LINE__),		\
>> +		     : : "i" (__FILE__), "i" (__BUG_FUNC), "i" (__LINE__),\
>>   			 "i" (flags),					\
>>   			 "i" (sizeof(struct bug_entry)));		\
>>   } while (0)
>> @@ -92,7 +102,8 @@ do {								\
>>   do {								\
>>   	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
>>   	instrumentation_begin();				\
>> -	_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
>> +	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
>> +		_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
>>   	instrumentation_end();					\
>>   } while (0)
> 
> NAK, this grows the BUG site for now appreciable reason.

Only if CONFIG_KUNIT_SUPPRESS_BACKTRACE is enabled. Why does that warrant a NACK ?

Guenter



