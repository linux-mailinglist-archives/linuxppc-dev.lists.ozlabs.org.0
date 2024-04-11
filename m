Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4395E8A057B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 03:28:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZlSs7Avy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFMXq01nvz3vbF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 11:28:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZlSs7Avy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com; envelope-from=thiago.bauermann@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFMX414dtz3cM4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 11:28:02 +1000 (AEST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-2330f85c2ebso752644fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 18:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712798875; x=1713403675; darn=lists.ozlabs.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zY1vBuYzXUVAUPu7RYDaF9UtFORvIFjy44r4Y5Ige4g=;
        b=ZlSs7AvyTsKL75V1yGmur0c/FLJn/UHceAdUYm4oahOXGAi5j8PI3Ml+68hwLckgOa
         dhRKOqSiL2/Mu6vOD/6jcFQ9f69fxqUIjZoQ4yNcLEq+SWpMm1o8H1YHovsBKik3ixpV
         s6UDMaX6ChcTzkrhST+z6+vXFSfoGH2s3gRkKQ+IUhIUGMArCTxGZwisj5uAKP0xbk78
         18UbKmUMNgQ++upicoOzWg7yYeu979uBiKx11NFMUyxI+1FIndLGPAiv+SprrZze/pg6
         orTIFRN3PVvXJhfa5JdBcfUllCEJGpSXu/XQfSqXtoaXnGSMMfIEbEtQ2zAYZMBxZz4o
         pCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712798875; x=1713403675;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zY1vBuYzXUVAUPu7RYDaF9UtFORvIFjy44r4Y5Ige4g=;
        b=nry27vhpu/drKVKmkTHnqOUQgzmwdhz++AHBAuH8oJjlwPCDVzCf67tc5PVtobkcTy
         ZYjiV6XiGprVLXQOoRH4av7faa4dT33jxX+eIccLDHAi1bKICq9DaZbowhCNc1GNPFfJ
         epe4uZu/oYY2Xc1Yuj80ihVAb15ijhDTTtAuCR9MHoQFZL2Ybg6yJxJPWgZKMjmpIybb
         IhCfO1oTcxEDUtBtHGYZDCyUbbMsDsTp3/i8bLYzhtEPAhZRpO2RxQIXu4EJnYNI1q9b
         j3VqDUUBedeXdstybb4BXKTeGtB7SOLJYdZVekM0mU2pWr9Osrh9Z+k3xm/cO4J1jGUT
         8oFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6owenpNqwyB8Ug2vD3RncnuX7ZTY5W0PGXiQgD829qnpIoEiIba7VU/Ib6z5N5ywhRlZhbLGIpA/TjXO7p3VhtCGBydetQRGZDwISJg==
X-Gm-Message-State: AOJu0Yx3IghLwRZgaJUMaMgizddnI4eMSjdTHDVJkEIIkO316cH0B0Cv
	Qt0KsaEdkeGup0Giq4fz0/QT0jXIiByAWMeruUJpJG00iYwXTl3LzbYwSIQSGaA=
X-Google-Smtp-Source: AGHT+IF8lPPFTalL1WPSfnBvduuYhf5K6F9EIeC9RLCCka0Vl/mHkW4wRauCXJubFXwb7faJCr3ffA==
X-Received: by 2002:a05:6870:518:b0:22e:bcfd:deb0 with SMTP id j24-20020a056870051800b0022ebcfddeb0mr4667832oao.41.1712798874921;
        Wed, 10 Apr 2024 18:27:54 -0700 (PDT)
Received: from localhost ([2804:14d:7e39:8470:fcac:9b42:fe81:c62f])
        by smtp.gmail.com with ESMTPSA id c1-20020aa78c01000000b006ed38291aebsm289791pfd.178.2024.04.10.18.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 18:27:54 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
In-Reply-To: <4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com> (Samuel
	Holland's message of "Wed, 10 Apr 2024 20:11:04 -0500")
References: <20240329072441.591471-1-samuel.holland@sifive.com>
	<20240329072441.591471-14-samuel.holland@sifive.com>
	<87wmp4oo3y.fsf@linaro.org>
	<75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com>
	<87wmp4ogoe.fsf@linaro.org>
	<4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com>
User-Agent: mu4e 1.12.2; emacs 29.3
Date: Wed, 10 Apr 2024 22:27:52 -0300
Message-ID: <87le5kofhj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hello Samuel,

Samuel Holland <samuel.holland@sifive.com> writes:

> On 2024-04-10 8:02 PM, Thiago Jung Bauermann wrote:
>> Samuel Holland <samuel.holland@sifive.com> writes:
>>> On 2024-04-10 5:21 PM, Thiago Jung Bauermann wrote:
>>>>
>>>> Unfortunately this patch causes build failures on arm with allyesconfig
>>>> and allmodconfig. Tested with next-20240410.
>>
>> <snip>
>>
>>> In both cases, the issue is that the toolchain requires runtime support to
>>> convert between `unsigned long long` and `double`, even when hardware FP is
>>> enabled. There was some past discussion about GCC inlining some of these
>>> conversions[1], but that did not get implemented.
>>
>> Thank you for the explanation and the bugzilla reference. I added a
>> comment there mentioning that the problem came up again with this patch
>> series.
>>
>>> The short-term fix would be to drop the `select ARCH_HAS_KERNEL_FPU_SUPPORT` for
>>> 32-bit arm until we can provide these runtime library functions.
>>
>> Does this mean that patch 2 in this series:
>>
>> [PATCH v4 02/15] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>>
>> will be dropped?
>
> No, because later patches in the series (3, 6) depend on the definition of
> CC_FLAGS_FPU from that patch. I will need to send a fixup patch unless I can
> find a GPL-2 compatible implementation of the runtime library functions.

Ok, thank you for clarifying.

Andrew Pinski just responded on the GCC bugzilla and if I understood his
point correctly, it seems to be a matter of changing function names to
what GCC (or actually the arm EABI) expects...

--
Thiago
