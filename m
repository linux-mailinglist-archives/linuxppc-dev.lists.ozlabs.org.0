Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6168F8A0555
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 03:11:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=fRzeCsRT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFM9M1L6cz3vYB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 11:11:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=fRzeCsRT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFM8c3lvXz3cRB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 11:11:10 +1000 (AEST)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5aa1bf6cb40so2410744eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 18:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712797866; x=1713402666; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7z1/Srv4eZ2vooDSDvwwBej5oDKDz5itKY0SDj8VoQ=;
        b=fRzeCsRTjGzwoYBcGpzq00SB6L8L2qnFIIefycg7NSRWkZFt4gSQjgclMkhu36i0R3
         zxLebed7YuZFqWIzE6kdEIPYWM2K4sOJuXOD4f3IlB9eiU36RJOJVR1Prb9+EhyHyjfV
         MVyRVJl1Y31abS26yz+CM1v7PE3ZTn8SuPiEZvCTx18wXBAUwCenBeuxAaFhHEPKR/YV
         Ztjw3dLKhwGmeJ4m+LRdnrNms+h54gHy8Nzzap7lhR/SQHthim4AHDHDJmvrBQ41im1D
         t7YMdmM0izqfjf08hGejEIQLxrILffeRf2ItiuhcjlQOdhSvxe2U2m0F3P1eFhvw2V30
         gwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712797866; x=1713402666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7z1/Srv4eZ2vooDSDvwwBej5oDKDz5itKY0SDj8VoQ=;
        b=Gy7KRxHcURMMmfiHAQCD5D6h6mOtuPkLep8NscM9fkcUWi0xm5QVoP6rgbn6h5jUSm
         7C1arMMe59OAMdSrgsH1OSeb9jmkPIpUBw67GOVYmsHRRsj09YyoSz7rNTwWB8luCYls
         G0AA3N1sjrHRK9JlYbz/tSXlkFv30tywg6OKrtReBUkCgug8zwoOxrJfi82KZZGdKy2t
         /BEa/EVamujogRVGzLkQZ0wbW9ofTFQfGYZ5piNdNbrfZvymIz3u38j0w/fztPUPJ8Xp
         MgIZhCstT0PUwosBKe9IRVVM8/oFnhV7aWSfw1zOVkDlLyyezmfpvnxKZeJXTq8FiLCt
         zKxA==
X-Forwarded-Encrypted: i=1; AJvYcCUbe6ZiGVXs5LYDd0nqqnhUgpSM7UCF34q9QBCUKz29f50HPJ11RmwHzzJNCKNBO086ibuPttuqX/pXXc4nM6RfF3DzpBQFqMIsoz4ykg==
X-Gm-Message-State: AOJu0YyLVPQloeTPFGlrmIXUmeESjebFJzsOEASquxB3gT26Fgjn9fXw
	kHiLEwZLeiTa8RQ1uMxZGAnLtMpePPsgd4IMrRKJUX0huGPkEtmmRyBX+ed5nk0=
X-Google-Smtp-Source: AGHT+IFvdAWGolMk2tEZ8bM2BAlC1TsYZtb/fNUYXyTQY+hWEfuiEC430lr0paNhGs3so4u/3MehIA==
X-Received: by 2002:a4a:e9f3:0:b0:5aa:6a28:27ea with SMTP id w19-20020a4ae9f3000000b005aa6a2827eamr3725829ooc.6.1712797866523;
        Wed, 10 Apr 2024 18:11:06 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.167])
        by smtp.gmail.com with ESMTPSA id db1-20020a056820270100b005a4bc907f0asm113158oob.15.2024.04.10.18.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 18:11:06 -0700 (PDT)
Message-ID: <4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com>
Date: Wed, 10 Apr 2024 20:11:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com>
 <87wmp4oo3y.fsf@linaro.org> <75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com>
 <87wmp4ogoe.fsf@linaro.org>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <87wmp4ogoe.fsf@linaro.org>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thiago,

On 2024-04-10 8:02 PM, Thiago Jung Bauermann wrote:
> Samuel Holland <samuel.holland@sifive.com> writes:
>> On 2024-04-10 5:21 PM, Thiago Jung Bauermann wrote:
>>>
>>> Unfortunately this patch causes build failures on arm with allyesconfig
>>> and allmodconfig. Tested with next-20240410.
> 
> <snip>
> 
>> In both cases, the issue is that the toolchain requires runtime support to
>> convert between `unsigned long long` and `double`, even when hardware FP is
>> enabled. There was some past discussion about GCC inlining some of these
>> conversions[1], but that did not get implemented.
> 
> Thank you for the explanation and the bugzilla reference. I added a
> comment there mentioning that the problem came up again with this patch
> series.
> 
>> The short-term fix would be to drop the `select ARCH_HAS_KERNEL_FPU_SUPPORT` for
>> 32-bit arm until we can provide these runtime library functions.
> 
> Does this mean that patch 2 in this series:
> 
> [PATCH v4 02/15] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
> 
> will be dropped?

No, because later patches in the series (3, 6) depend on the definition of
CC_FLAGS_FPU from that patch. I will need to send a fixup patch unless I can
find a GPL-2 compatible implementation of the runtime library functions.

Regards,
Samuel

