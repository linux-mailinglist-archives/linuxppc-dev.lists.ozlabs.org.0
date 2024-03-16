Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6CA87DABB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 17:17:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gdH5+cDe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TxmVh2kWjz3dXP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Mar 2024 03:17:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gdH5+cDe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TxmTt3sQjz2ytj
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Mar 2024 03:17:05 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1deefb08b9eso10942265ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Mar 2024 09:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710605820; x=1711210620; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Ad79nxUV3suzPFik/TywaNEexbwGs2i2M0+RnoUpzx8=;
        b=gdH5+cDeBmJyfNiDJRqS8AyvTcm97t/twWMlTjeXMbzqWbf4HP/hyDS4GN0P/aoFZh
         fgGyqPSZpTcBD58JQtdHBsDKB1J3hJ1CClCZUOL7Uvw6pMAqP21aFHI6qPplRL26AvJA
         xljuvrRzP5iixL1Hbp5R8UEZeyTcWrczXCbQO1DFdGebbFnBqgfiVH+nT1E2UQOzABzZ
         zot0jlybhz4eRGCuqrpwNb0rtoN8H0JMDTEcVMPN4lIkArdebuoEuNy68jE8THs9Lue8
         ifdVSVCDdwWzom5h772GTdzZJbDH11nOlKjF0ic9VHVJ74Id+gwSIvqvpjN/v7BT5LR7
         Jd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710605820; x=1711210620;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ad79nxUV3suzPFik/TywaNEexbwGs2i2M0+RnoUpzx8=;
        b=H9XICpm368wBmXQQ2C8+0TrQUrBwBf/yzs1H6B2oA8dePNxbeosdarLBLJ66ATIEdr
         qG/LHXtyCJx/gL/iRl/g+ZovdrNCJd+iYVEa1Z6TBpdQavXxv6h2+zz7pFEXbTGXGw+q
         LLF3cGbz5PCWtp/7U2AUGe7vkABnPuqrejkMAqsPPyQGMXwuhVqkezErBtPEH7wuLB9v
         qXH0FzvVOu7UO+XNwrzYlY44Txr0pAR5910I7AHpHNGO7GOLtZZdp0S6R8HrASmLlict
         FTMEx/YYZQrDRouTHB2hhHHww9+xAKXcFj9GnHinoBxcaba1DgSgWFD5trHuanj8qG02
         m9Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUovCfMaGrQwRfy+QOpl6nHgtADlBTbUWx0gG/tOUxIyoTs7olPgPzCOy6yKfnGCJZlL8PlHc+X9Wyd8m3/WxSYgHVq1V4evqWYRAE2Jg==
X-Gm-Message-State: AOJu0Yzj8/tRYxAfEp/hnPiUBUijHe+MrPVg+OLCaNPIbZrEnxd3fzIu
	bIBcj2y0XjFrsRH6YcRdOvHewGuFt4xroDOQvsWOQN1epc/uT9IR
X-Google-Smtp-Source: AGHT+IGA+TA01Bxsw9/mfWXt9gpOVUmZyN7CpbFyOEGBY8brlAsGWTPBr93mRcRuI84f8oFkGg0zAg==
X-Received: by 2002:a17:903:22c6:b0:1e0:9a7:e606 with SMTP id y6-20020a17090322c600b001e009a7e606mr552821plg.0.1710605820013;
        Sat, 16 Mar 2024 09:17:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z17-20020a170903409100b001dd88a5dc47sm5958808plc.290.2024.03.16.09.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Mar 2024 09:16:59 -0700 (PDT)
Message-ID: <04f34097-7788-490d-a9c2-82b44bf6af44@roeck-us.net>
Date: Sat, 16 Mar 2024 09:16:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <CAMuHMdUkvagJVEfnhq=Nx2jnmdS0Ax+zy1CvyN0k7k1EwUpu+g@mail.gmail.com>
 <6d9269c0-bd38-4965-a454-4358e0a182e3@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <6d9269c0-bd38-4965-a454-4358e0a182e3@roeck-us.net>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, netdev@lists.linux.dev, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmer
 mann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/14/24 07:37, Guenter Roeck wrote:
> On 3/14/24 06:36, Geert Uytterhoeven wrote:
>> Hi Günter,
>>
>> On Tue, Mar 12, 2024 at 6:03 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>> Some unit tests intentionally trigger warning backtraces by passing bad
>>> parameters to kernel API functions. Such unit tests typically check the
>>> return value from such calls, not the existence of the warning backtrace.
>>>
>>> Such intentionally generated warning backtraces are neither desirable
>>> nor useful for a number of reasons.
>>> - They can result in overlooked real problems.
>>> - A warning that suddenly starts to show up in unit tests needs to be
>>>    investigated and has to be marked to be ignored, for example by
>>>    adjusting filter scripts. Such filters are ad-hoc because there is
>>>    no real standard format for warnings. On top of that, such filter
>>>    scripts would require constant maintenance.
>>>
>>> One option to address problem would be to add messages such as "expected
>>> warning backtraces start / end here" to the kernel log.  However, that
>>> would again require filter scripts, it might result in missing real
>>> problematic warning backtraces triggered while the test is running, and
>>> the irrelevant backtrace(s) would still clog the kernel log.
>>>
>>> Solve the problem by providing a means to identify and suppress specific
>>> warning backtraces while executing test code. Support suppressing multiple
>>> backtraces while at the same time limiting changes to generic code to the
>>> absolute minimum. Architecture specific changes are kept at minimum by
>>> retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
>>> CONFIG_KUNIT are enabled.
>>>
>>> The first patch of the series introduces the necessary infrastructure.
>>> The second patch introduces support for counting suppressed backtraces.
>>> This capability is used in patch three to implement unit tests.
>>> Patch four documents the new API.
>>> The next two patches add support for suppressing backtraces in drm_rect
>>> and dev_addr_lists unit tests. These patches are intended to serve as
>>> examples for the use of the functionality introduced with this series.
>>> The remaining patches implement the necessary changes for all
>>> architectures with GENERIC_BUG support.
>>
>> Thanks for your series!
>>
>> I gave it a try on m68k, just running backtrace-suppression-test,
>> and that seems to work fine.
>>
>>> Design note:
>>>    Function pointers are only added to the __bug_table section if both
>>>    CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE are enabled to avoid image
>>>    size increases if CONFIG_KUNIT=n. There would be some benefits to
>>>    adding those pointers all the time (reduced complexity, ability to
>>>    display function names in BUG/WARNING messages). That change, if
>>>    desired, can be made later.
>>
>> Unfortunately this also increases kernel size in the CONFIG_KUNIT=m
>> case (ca. 80 KiB for atari_defconfig), making it less attractive to have
>> kunit and all tests enabled as modules in my standard kernel.
>>
> 
> Good point. Indeed, it does. I wanted to avoid adding a configuration option,
> but maybe I should add it after all. How about something like this ?
> 
> +config KUNIT_SUPPRESS_BACKTRACE
> +       bool "KUnit - Enable backtrace suppression"
> +       default y
> +       help
> +         Enable backtrace suppression for KUnit. If enabled, backtraces
> +         generated intentionally by KUnit tests can be suppressed. Disable
> +         to reduce kernel image size if image size is more important than
> +         suppression of backtraces generated by KUnit tests.
> +
> 

Any more comments / feedback on this ? Otherwise I'll introduce the
above configuration option in v2 of the series.

In this context, any suggestions if it should be enabled or disabled by
default ? I personally think it would be more important to be able to
suppress backtraces, but I understand that others may not be willing to
accept a ~1% image size increase with CONFIG_KUNIT=m unless
KUNIT_SUPPRESS_BACKTRACE is explicitly disabled.

Thanks,
Guenter

