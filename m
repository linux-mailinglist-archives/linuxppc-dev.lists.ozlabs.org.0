Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8941D80D0FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 17:17:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=BJSXs39x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Spn240FDLz3c8Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 03:17:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=BJSXs39x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Spn1G3VXnz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 03:16:18 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-67ab16c38caso30713756d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 08:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702311375; x=1702916175; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9O17D9j4YT4XtoaSYd3/nhs4s1HCIt9uZx1EA+AxCks=;
        b=BJSXs39xsXYV01saArRcupW8hPA9lsMWyxvo6wl0lqJqjeF2VbczaLpuUPLVVKuLDU
         8PaM4qlK+6qbQsNdiKeLLXTTKXBDoZjynLgbd3WRKPSdLnbAnFgH7JARol29PY4OHXif
         00/x4M4alT6lC/N6rjpmT5Rvujgx4N6SC6Ydn65tN3ISiQ4Zj8Q7ESdEHOluEwdTUKwC
         HgWwO4zvGMp0yweJURcUzJ0F4+3FDTJcWFDSDYRAQu4qSJiTEBjwqiHqeNYM32hP7ovT
         viNaf7b8GklC9eGXCVVFGR6Ksf1WC5GKBt9oikFy04uZ6hCW8OFoCDvnCNWQk/k2tGOl
         d25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311375; x=1702916175;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9O17D9j4YT4XtoaSYd3/nhs4s1HCIt9uZx1EA+AxCks=;
        b=oo3fJeiscWpXYcH6Jm1wsgTShtWXmC5yosjtZDQjd9HYpTLP8TR5TUW9iayllenljk
         WQrWkrwQspvejD9BDwXsTmRPC33nzVLm8Yipkzb8+3A1WB8xA6k2YqRA2H3k1RuUeUcn
         Zqb32XEjavq2fwSugInWtsh6QLU605frYJ6PzUZfZJ2yA/paMLLLq9A2toUKcVEwpJm1
         RkJclCmcSp3ICzS3vpNQnpQHRljv6a83z6uzrdhJoZZKtTZ53d8e7hlgJ6SgX7mhViqx
         ZWjdYH05NkD2M3KkVFF4hK4nCfXYB9h7AHku7QrJNmoLMBoP2mqLmz4aD9ZMbXn3OELA
         5rtw==
X-Gm-Message-State: AOJu0YyZD7N5xTzTg7mrrrz+XXulyxOr1XwwBa98nLL3P+rnerk5liew
	ZFwoiDw04mcESjteBe41JrnRuw==
X-Google-Smtp-Source: AGHT+IHy4FKXKcoa5vr1zWRR7h8ldItNotN+bq27os2Gmy1WmTZV3fGNzyOi2gfObdJOXzxcGBLOzA==
X-Received: by 2002:a05:6214:1fd9:b0:67e:b878:8e48 with SMTP id jh25-20020a0562141fd900b0067eb8788e48mr4904522qvb.39.1702311375258;
        Mon, 11 Dec 2023 08:16:15 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:f8a3:26ec:ac85:392e? ([2600:1700:2000:b002:f8a3:26ec:ac85:392e])
        by smtp.gmail.com with ESMTPSA id d17-20020a0cf6d1000000b0067a18167533sm3380983qvo.83.2023.12.11.08.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 08:16:15 -0800 (PST)
Message-ID: <3f28c1f7-f29c-461f-a90e-58d8e0996cc0@sifive.com>
Date: Mon, 11 Dec 2023 10:16:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/12] riscv: Add support for kernel-mode FPU
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-10-samuel.holland@sifive.com>
 <ZXc0rAdi7Vo8nbS8@infradead.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZXc0rAdi7Vo8nbS8@infradead.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-12-11 10:11 AM, Christoph Hellwig wrote:
>> +#ifdef __riscv_f
>> +
>> +#define kernel_fpu_begin() \
>> +	static_assert(false, "floating-point code must use a separate translation unit")
>> +#define kernel_fpu_end() kernel_fpu_begin()
>> +
>> +#else
>> +
>> +void kernel_fpu_begin(void);
>> +void kernel_fpu_end(void);
>> +
>> +#endif
> 
> I'll assume this is related to trick that places code in a separate
> translation unit, but I fail to understand it.  Can you add a comment
> explaining it?

Yes, I can add a comment. Here, __riscv_f refers to RISC-V's F extension for
single-precision floating point, which is enabled by CC_FLAGS_FPU.

