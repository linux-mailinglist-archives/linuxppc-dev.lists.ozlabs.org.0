Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 343D187C032
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 16:30:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JTnHRPnI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwWXY6hNsz3vbQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 02:30:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JTnHRPnI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwWWs0k2Xz3dHV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 02:29:27 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5dc949f998fso773378a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 08:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710430165; x=1711034965; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LY7692bTyayLkoksNBH6BmxzoRrgRDh0JILFH+Hu4mE=;
        b=JTnHRPnIjK4rXCIU6Ys78V4zzyxX8swUz++gVuJcYBa8urUH9UtWyMrgM22Nv3/LGe
         KnSHhhzq7gIZhg7csxzWR4xf3/DsqpX/t2aKfkQ9t8PI5Ax4/i3QSfXzyPNB4yoGBzzn
         2BDP5KXNpCnSckdKZQvVzJjMsYTn7gEZ1VhPxtjsU+VcVydzch+5rjeGdVmpBA6jNsNg
         7a4tH/L0sxGEYe/CnnvljxV56ej9Vnudbn4YG52mKZQ6FnBKfqlLbmcC/TTRp1G94jtW
         Ws2VO42tAuKkCZucYDSkHud5vRN4VqcZ8KNaLYGJpya11WUMNYETA2ilhetkNmh24Wya
         MeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710430165; x=1711034965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LY7692bTyayLkoksNBH6BmxzoRrgRDh0JILFH+Hu4mE=;
        b=LpQH8ch2sPgBocf3AsXoYJwEdYec9qw1XK5pFBL5u7h8Acam1eXy8lwf0G8J/Wt5+W
         mvJOlxeepu1d0oOSll4lmBrUoSx77g4GUArmAEj7x1hDTYyDnAtG0IlCH8JnrpJxE+E9
         hdLv79zV2mu4d8ocyRObyESsK+VffJSqEMjJ0xMMdwZRO3R06i9qk7NwF3S2i0JRQ0sf
         qEH4/Yfi+UQnuETlvHFWsv9RZpSOlSzfHZ6m812IX0HugsKaRrqR674GFTlvfczHMa9U
         iMH2SSws6XZgq/zm2mgB6HSn+8V0l7NRYpnKJGMetU4kd0ATaSFYUYjL8nsF/0jQqB74
         oUUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeHCe8e1uoh4cb6RyWZWZHjEo/LQTJ2kceg8d9M2cCYK43uXsGAt2HBKyHGR8MaUCCCece8R0JSXzOGSSs/e64RQxY/wv/irXDWLKCRA==
X-Gm-Message-State: AOJu0Yy2XlnKCl18CsAc7BSU8UoAYoBRkaPMNp5wVBWc1bLgxCda0laB
	kK8dZ7b7nEXMrQcKjrbuskcGnhtCTuP8XHuTbdNZ1x5o3m7w/AcV
X-Google-Smtp-Source: AGHT+IEWwlqh10aaLXnz79mTPQ/n+RJWvWMKiaSxEVVrgfvkkAPUMESJkl3thWtTXScKP4Egfyd75w==
X-Received: by 2002:a17:903:1cf:b0:1dd:afa1:3094 with SMTP id e15-20020a17090301cf00b001ddafa13094mr2404810plh.36.1710430164855;
        Thu, 14 Mar 2024 08:29:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k18-20020a170902f29200b001dee5da5f3dsm425201plc.100.2024.03.14.08.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 08:29:24 -0700 (PDT)
Message-ID: <3f43bbdf-7ad2-4ca8-ba06-e32876cc8e53@roeck-us.net>
Date: Thu, 14 Mar 2024 08:29:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <CAMuHMdUkvagJVEfnhq=Nx2jnmdS0Ax+zy1CvyN0k7k1EwUpu+g@mail.gmail.com>
 <6d9269c0-bd38-4965-a454-4358e0a182e3@roeck-us.net>
 <20240314-victorious-chupacabra-of-management-baa5c4@houat>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240314-victorious-chupacabra-of-management-baa5c4@houat>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Dan Carpenter <dan.carpenter@linaro.org>, netdev@lists.linux.dev, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <
 tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/14/24 08:02, Maxime Ripard wrote:
> On Thu, Mar 14, 2024 at 07:37:13AM -0700, Guenter Roeck wrote:
>> On 3/14/24 06:36, Geert Uytterhoeven wrote:
>>> Hi Günter,
>>>
>>> On Tue, Mar 12, 2024 at 6:03 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>> Some unit tests intentionally trigger warning backtraces by passing bad
>>>> parameters to kernel API functions. Such unit tests typically check the
>>>> return value from such calls, not the existence of the warning backtrace.
>>>>
>>>> Such intentionally generated warning backtraces are neither desirable
>>>> nor useful for a number of reasons.
>>>> - They can result in overlooked real problems.
>>>> - A warning that suddenly starts to show up in unit tests needs to be
>>>>     investigated and has to be marked to be ignored, for example by
>>>>     adjusting filter scripts. Such filters are ad-hoc because there is
>>>>     no real standard format for warnings. On top of that, such filter
>>>>     scripts would require constant maintenance.
>>>>
>>>> One option to address problem would be to add messages such as "expected
>>>> warning backtraces start / end here" to the kernel log.  However, that
>>>> would again require filter scripts, it might result in missing real
>>>> problematic warning backtraces triggered while the test is running, and
>>>> the irrelevant backtrace(s) would still clog the kernel log.
>>>>
>>>> Solve the problem by providing a means to identify and suppress specific
>>>> warning backtraces while executing test code. Support suppressing multiple
>>>> backtraces while at the same time limiting changes to generic code to the
>>>> absolute minimum. Architecture specific changes are kept at minimum by
>>>> retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
>>>> CONFIG_KUNIT are enabled.
>>>>
>>>> The first patch of the series introduces the necessary infrastructure.
>>>> The second patch introduces support for counting suppressed backtraces.
>>>> This capability is used in patch three to implement unit tests.
>>>> Patch four documents the new API.
>>>> The next two patches add support for suppressing backtraces in drm_rect
>>>> and dev_addr_lists unit tests. These patches are intended to serve as
>>>> examples for the use of the functionality introduced with this series.
>>>> The remaining patches implement the necessary changes for all
>>>> architectures with GENERIC_BUG support.
>>>
>>> Thanks for your series!
>>>
>>> I gave it a try on m68k, just running backtrace-suppression-test,
>>> and that seems to work fine.
>>>
>>>> Design note:
>>>>     Function pointers are only added to the __bug_table section if both
>>>>     CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE are enabled to avoid image
>>>>     size increases if CONFIG_KUNIT=n. There would be some benefits to
>>>>     adding those pointers all the time (reduced complexity, ability to
>>>>     display function names in BUG/WARNING messages). That change, if
>>>>     desired, can be made later.
>>>
>>> Unfortunately this also increases kernel size in the CONFIG_KUNIT=m
>>> case (ca. 80 KiB for atari_defconfig), making it less attractive to have
>>> kunit and all tests enabled as modules in my standard kernel.
>>>
>>
>> Good point. Indeed, it does. I wanted to avoid adding a configuration option,
>> but maybe I should add it after all. How about something like this ?
>>
>> +config KUNIT_SUPPRESS_BACKTRACE
>> +       bool "KUnit - Enable backtrace suppression"
>> +       default y
>> +       help
>> +         Enable backtrace suppression for KUnit. If enabled, backtraces
>> +         generated intentionally by KUnit tests can be suppressed. Disable
>> +         to reduce kernel image size if image size is more important than
>> +         suppression of backtraces generated by KUnit tests.
>> +
> 
> How are tests using that API supposed to handle it then?
> 
> Select the config option or put an ifdef?
> 
> If the former, we end up in the same situation than without the symbol.
> If the latter, we end up in a similar situation than disabling KUNIT
> entirely, with some tests not being run which is just terrible.
> 

The API definitions are themselves within #ifdef and dummies if
KUNIT_SUPPRESS_BACKTRACE (currently CONFIG_KUNIT) is disabled.
In include/kunit/bug.h:

#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
...
#else
#define DEFINE_SUPPRESSED_WARNING(func)
#define START_SUPPRESSED_WARNING(func)
#define END_SUPPRESSED_WARNING(func)
#define IS_SUPPRESSED_WARNING(func) (false)
#define SUPPRESSED_WARNING_COUNT(func) (0)
#endif

Only difference to the current patch series would be

- #if IS_ENABLED(CONFIG_KUNIT)
+ #ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE

in that file and elsewhere.

With KUNIT_SUPPRESS_BACKTRACE=n you'd still get warning backtraces
triggered by the tests, but the number of tests executed as well
as the test results would still be the same.

Thanks,
Guenter

