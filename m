Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8194588B9A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 06:03:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ax3EFaGT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3d3q1sv2z3vXF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 16:03:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ax3EFaGT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3d353n2nz3bx0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 16:02:39 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e0d82d441bso8634755ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 22:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711429358; x=1712034158; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nIhrywFoGE/FB0l12vjAjrM2buYxUGncKgITpiq2JlY=;
        b=ax3EFaGTVcGljMPjyZIpcQqMHs2VulxKMvv8yROiegm3q6vqNCyR2Wu0LQeaZbXFPX
         w/YO7JinbU3vLz346TsglV/fLZ7UaBFK8hPrnJVhL0Xpj5Cvc8ANr+0k2m0OKNrNkaed
         7aS1YGZvsQJ7me88fJs54m2xXElyRoTR3/XPu9KMyqBeyF7Sts6gH/iPrJlRHKL7DQ/z
         jMAEP66flqKddwW0utN+yEoBR18ZZrW0/Q9msA8RDZnHVaacQo0JHCvy3kOO0uRgCnUL
         Pr82P/syuCsxmfWCZ2oIoJts3PHevLfpftj1aoDMi3ReMpK40Sfr+encH86wQhd8DIZ7
         XlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711429358; x=1712034158;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIhrywFoGE/FB0l12vjAjrM2buYxUGncKgITpiq2JlY=;
        b=FNDzKFTm87Ei8nAfpx5uObqwmjqioJtPHtMJ9JhyVeSgpMgBQ9KWTaKkMpOoNg1joF
         Jx0uJykD6Sh5a+PAQVzK5XPBuEvV6ObXv/P1BN9oX1r5HvXebVYstNO2yW5zAxA9zn1t
         SMkrTzHKaFOdEdaE7VNMmvup1ccm2oL5jEduNVyVk3mZ5mIsWi9e/fGmlgOY57C0Tebx
         LnlYQwpmKubnsWYc/I26oJ0tv3HxwSzV88EuS3yK1GIscpQTXNrQnJ0geZmDVzWJYsaW
         bl+PxK5/2yMVbdXXqqMWw2JDxMaXVSDMCF4r7DBwY/5+wk8ajJMiYAaRi2E/LkwzPZZJ
         IsMA==
X-Forwarded-Encrypted: i=1; AJvYcCXBpeIKlSU8UX85VUM6IUmQeJVOscmPEFwzJlwKkTGZBy3wDr0aISz5GGX8Z+fCHQ6PBkR8m+2YvW2oMptpYLjMldHhd9QREC44CQrE5w==
X-Gm-Message-State: AOJu0YxWyZRq+Uqt2JodoChG4qEu6c5mS1D7GdPAZBrsfLcRb0JPI6Tp
	RNTrFyuGZ0BHwdeoo52BKBKXpOrTJzodMoeYiX/riujQSK5MIc8q
X-Google-Smtp-Source: AGHT+IEcTHB/02f9HaB1tS0cP2ZsRx971NBiGwEGqHnjokk6umDjAiHMd//taF/o4xULvRj25jCExA==
X-Received: by 2002:a17:902:a586:b0:1e0:cd8a:581 with SMTP id az6-20020a170902a58600b001e0cd8a0581mr42211plb.23.1711429357721;
        Mon, 25 Mar 2024 22:02:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j11-20020a170902690b00b001dd64048f78sm5700013plk.211.2024.03.25.22.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 22:02:36 -0700 (PDT)
Message-ID: <4799424e-8dfc-4848-8c4f-affedaec9dfe@roeck-us.net>
Date: Mon, 25 Mar 2024 22:02:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] drm: Suppress intentional warning backtraces in
 scaling unit tests
Content-Language: en-US
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-6-linux@roeck-us.net>
 <0729b218-53f1-4139-b165-a324794a9abd@igalia.com>
 <e880828b-552e-488e-9f31-3989bec276ae@roeck-us.net>
 <7f6a223f-f432-4e1b-a67e-3816448224a1@igalia.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <7f6a223f-f432-4e1b-a67e-3816448224a1@igalia.com>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, linux-sh@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, Linux Kernel Functional Testing <lkft@linaro.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimme
 rmann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/25/24 18:09, Maíra Canal wrote:
> On 3/25/24 16:24, Guenter Roeck wrote:
>> Hi,
>>
>> On Mon, Mar 25, 2024 at 04:05:06PM -0300, Maíra Canal wrote:
>>> Hi Guenter,
>>>
>>> On 3/25/24 14:52, Guenter Roeck wrote:
>>>> The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
>>>> intentionally trigger warning backtraces by providing bad parameters to
>>>> the tested functions. What is tested is the return value, not the existence
>>>> of a warning backtrace. Suppress the backtraces to avoid clogging the
>>>> kernel log.
>>>>
>>>> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>>> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>> ---
>>>> - Rebased to v6.9-rc1
>>>> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
>>>>
>>>>    drivers/gpu/drm/tests/drm_rect_test.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
>>>> index 76332cd2ead8..75614cb4deb5 100644
>>>> --- a/drivers/gpu/drm/tests/drm_rect_test.c
>>>> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
>>>> @@ -406,22 +406,28 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
>>>>    static void drm_test_rect_calc_hscale(struct kunit *test)
>>>>    {
>>>> +    DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
>>>>        const struct drm_rect_scale_case *params = test->param_value;
>>>>        int scaling_factor;
>>>> +    START_SUPPRESSED_WARNING(drm_calc_scale);
>>>
>>> I'm not sure if it is not that obvious only to me, but it would be nice
>>> to have a comment here, remembering that we provide bad parameters in
>>> some test cases.
>>
>> Sure. Something like this ?
>>
>>          /*
>>           * drm_rect_calc_hscale() generates a warning backtrace whenever bad
>>           * parameters are passed to it. This affects all unit tests with an
>>           * error code in expected_scaling_factor.
>>           */
>>
> 
> Yeah, perfect. With that, feel free to add my
> 
> Acked-by: Maíra Canal <mcanal@igalia.com>
> 

Thanks!
Guenter

