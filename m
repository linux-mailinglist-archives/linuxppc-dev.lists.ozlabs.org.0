Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B462718A02
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 21:18:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWfFW4pDKz3fL5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 05:18:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EuO9Wmuu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=schmitzmic@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EuO9Wmuu;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWfDK6Wjrz3fFS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 05:17:53 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-64d41763796so98495b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 12:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685560671; x=1688152671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRXn+Cy0RvW1WV+5bzVi+rN/pdYikDqitAksVBeXVYc=;
        b=EuO9WmuuKtJgo4lBRnyvIyxTOy9aVaVtH958FX5rYCAK9ebeGpuNWy4LCDCJ7tgtwE
         v8KWz8C1BRfePhrrRgtWbGB/097dG/fm/w8lJUKxMFBI0FG/EeQYidzpE8r2odFV7Hm8
         0w5CGfMRo2DeXeSG7DC2/jdfyrDpf4lNY13c4wSENrakuCSZqraYIPMnDs8SGyQI8DeS
         4YUjE1eduWUpgvu9OgQZ5D7hzQfPt6n+0xgp/TakD7BBPTVK/3AdWNF/fkis0b1E0uyj
         f5FUSFjESXltyW69Nt/q0vdDbC2e7qiO3CaUnCTtbyPD5hy/37AsaFH8WHmP36rL3luz
         wrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685560671; x=1688152671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hRXn+Cy0RvW1WV+5bzVi+rN/pdYikDqitAksVBeXVYc=;
        b=AqaYxGo976iPQTKLC4eEdOvaPqPY2vXmV4CO+1BSOEllMF3pZdHGlYZJqtn8A9hg3L
         cxoCWUXJ5UHN0xQnaPjrPRVuZNjB3gQRNNVq82Mmo+vScLtKYn948+AUWmvUQfrovKE2
         9aghld+Zx90w7Q2stM9aAtR8JZGJIONzJQbYL9MNr4pEaZcx5l6bRU1g6QHFRcRHTzVQ
         4oyyXvq0uLQMDaWE7Gpf+Lt14TlpDw9sdXLg77S3aWeyBj6F4DTHzGdZN4/ykW/xyibx
         N69KkyoqnZov179arnjBGIoB5yCBkbnttpl2w/7m3UsudCBb3grwIOEn4PAB4yR8ad7I
         4ocQ==
X-Gm-Message-State: AC+VfDwykRr2MoUPRZBRiV3Vpju4DP6zipNMLVoKOva4w9s7cu3kbs5N
	y0OzUwb8aF5PV1lqeTiQ2f4=
X-Google-Smtp-Source: ACHHUZ6JEfEzcQ63O6e6hUpl79Dub3S1WceBl5T0WyKTt8XrQMOJrY9Wd7ylaeB21wY4TWeCqdYChw==
X-Received: by 2002:a05:6a00:1592:b0:64d:3fb3:9ed9 with SMTP id u18-20020a056a00159200b0064d3fb39ed9mr6519475pfk.23.1685560671394;
        Wed, 31 May 2023 12:17:51 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:e888:4048:539d:b33c? ([2001:df0:0:200c:e888:4048:539d:b33c])
        by smtp.gmail.com with ESMTPSA id z16-20020aa785d0000000b0063b806b111csm3627068pfn.169.2023.05.31.12.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 12:17:50 -0700 (PDT)
Message-ID: <1806cc8f-f119-a1e6-230d-03b45e182efa@gmail.com>
Date: Thu, 1 Jun 2023 07:17:45 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] MAINTAINERS: Exclude m68k-only drivers from powerpc entry
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20230531125023.1121060-1-mpe@ellerman.id.au>
 <CAMuHMdUbVmjcYyXmparBm6pQwu3q7HpTKsKfi_aAHGOSX97MUw@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdUbVmjcYyXmparBm6pQwu3q7HpTKsKfi_aAHGOSX97MUw@mail.gmail.com>
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
Cc: linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Finn Thain <fthain@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Geert,

On 1/06/23 00:59, Geert Uytterhoeven wrote:
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11916,6 +11916,8 @@ L:      linuxppc-dev@lists.ozlabs.org
>>   S:     Odd Fixes
>>   F:     arch/powerpc/platforms/powermac/
>>   F:     drivers/macintosh/
>> +X:     drivers/macintosh/adb-iop.c
>> +X:     drivers/macintosh/via-macii.c
>>
>>   LINUX FOR POWERPC (32-BIT AND 64-BIT)
>>   M:     Michael Ellerman <mpe@ellerman.id.au>
> LGTM, as there are already entries for these two files under
> "M68K ON APPLE MACINTOSH".
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Which leads us to a related topic: Is Joshua still around?  Should Finn
> be added or replace Joshua in the "M68K ON APPLE MACINTOSH" entry?

Add Finn, at the very least (if he's agreed). Haven't seen mail from 
Joshua in the past 13 years myself.

Cheers,

     Michael

>
> Gr{oetje,eeting}s,
>
>                          Geert
>
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
