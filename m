Return-Path: <linuxppc-dev+bounces-10347-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A21BB0CDAB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 01:19:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmGYx6cbCz2yZ6;
	Tue, 22 Jul 2025 09:19:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753139957;
	cv=none; b=e07J8ywCANFX2nLeC1lfgSXqdFkG98GhQ3m7Y3uyT+57ipS6NSjWeLsxFiQfQvyLZbrbc67h3Mt0/sgcU98hE8jwLjMutEzXILuRHeCtAdf9O/+nEWgL/reTsZ6QRS41wCTV4PTvpgP/IbgHee8B9y7UqYG1LJf7VkNIPTJVYTwJtgvSR1KEFMKoFhXWRJcs8uCTirchX30mJ3ihQ2dya6pbQlpSh/lQrncDSlxPQLxVHj8cDTqybCsE8yWVPH1SG4H4PLx0sdovZ/etNg3X0XqcH8ogUl6dHDl6+wBRQL9JPhk4vlXpQ9jAoMrmvmt2OcQzjGFD9aJfU7k+DJ3vsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753139957; c=relaxed/relaxed;
	bh=k7uUxr86UctpR4wo5BHRFyvrfjd8nsrpfmZh9G1fUjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AcC4Kz1j6foHZB5p6sig6XGWI1XjiVo97/Yn8WiMsr3j/msLVcOUTUCoNeJeF1b5VO2+/sTcyow9pfNJboJzx9SGnK9idTxQcnxoaqCdeEtPEBm/p1DFun9ylBk73t7+Wrf2IMha6a4fCgAZUivflNdisA/80r1q6m/5x7bwO4sNX5kFhc0PCL2oxnExj+eotXfiWiJnin/nKlPxO7byeUJ+vT600D4ZrVELT9q0jfp9siiIJRcnjp+jWQ8BdEbhpIQstSvqBXVVfMqnzkSHm5vO+oV+H1I+FtJvYwrQqiDI81BDZFCuDPD2z4Wl4hfQAHukFr87SVaJMqWZoCBoyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M2+4QYgt; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M2+4QYgt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmGYw630mz2yFP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 09:19:16 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ae3a4b3fa38so4562166b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 16:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753139953; x=1753744753; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k7uUxr86UctpR4wo5BHRFyvrfjd8nsrpfmZh9G1fUjI=;
        b=M2+4QYgtHEvBkN5CUNtQFdCg+aDwFi/4uZbt0WoE4tvcJLZ428w97tBCNPUwqIsI11
         tI5Ye76f7oNZBOI9/0PRr1jcdEZqmC8SUW2Kt6WJwocbTNRrKNza7IjbZMlobaZAK5SH
         4hDoPKBcvv47GZvxdagJegL2vf/FZzDWZgK5/QarxRF4aok2daKf4WlRl9oHASNwcZCC
         eFXc9hO/IFuWkoWosaF3mdrCtljR5m4k76q+WYGSZDS1+eJTb1+2On4y8pFlc5KjxZyY
         ucasIuBW/wrzte5nWT+j4Bw4CFXx/g0YYFqM+I5it5BjrTRKjUnndf28J6aNpopwGjMi
         7jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753139953; x=1753744753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7uUxr86UctpR4wo5BHRFyvrfjd8nsrpfmZh9G1fUjI=;
        b=si16rZuCsVL+MyfoIn+bRGqnECCxaZsObxLsFMFPSigi+cIP5g4Peb7RfQO90zSYYL
         u1QwhCaCqoJYbFNy+vtrtEl7gpLLA+Kwusr8V59EX2CmxOO0Dnff1FqbHYDWJVpK5WKD
         rZ9s1SX/eZO35AG02X2swq6ulQxG0dOx7WllZjjP1y+xuifMuVdMDV2J3gW1vIgzZtMu
         ITJmDhivntxM3CnxMUb0L11z/yMryMbbWHh77yTf/tleZAs9Q9xIESSVMxmTZ7GADQ9G
         z9g7Xnt1LDk/IfTupLq4pgee/Sv6MCjkOCseeVUQGi1Wt6XviTkTVD7cegKoG9aXziW3
         NqKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlk7u9IUvfzC/OAKc6ETRbUFJepRWdZuRGP1gt9sktAwb9ZFnMDsihFRsQfWMq1UFxW4mO3Y3hD2JIvLo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YySGq+qsFholTFTzzLCnq2FAV1ePdQDZgkC1b644Fk8VdTFlaua
	LEP+xq0jFWY7hGp0MZSSvGDUZ3xbiSsFy7wfDK+f29Y1lxhWX7fTdqtj
X-Gm-Gg: ASbGnctWzdY2IieJsaf3Sp4tULHVq84kj6qyHtlfFUrqGj88hHDND6yzpS1OQHbzSoD
	UcZA4t1rTvG7AadNhag7xYFIDkgWNKLwnQ/RgEqoSGhMrLzwoNpcZNEU8YyI/Iy9uEv1vtuCWaR
	sF/audSbxkyoToAoPO0cWO/ilaNQNLcf6JQS+caArMbfeqQgY7Bp82l+zs8ZVZmDv8sQH+8y9Bl
	0uKN24BN5Sk+YNyoZmeFukGNt+7eDXhqTwK58hfUDbjpAgmLUtXX6eTqUoHfseNsXkGqBAB31hb
	YpezuW/+dK3s8/nzLYvf4sW0ZVU8tOMgK8vm+DmZAyr1lfQk0TlH6+0JGCpAj5NX/rTLphE7WDD
	LsGV7o5LKFNbIG4nefOtgNMWSv/vVC0PCywHFwVqH63I8o5x/x1ozPHRE2Vh5CzGhzEnd
X-Google-Smtp-Source: AGHT+IEyAyDIGzGDBFvxWK+s5z/H1D9rPFTjwAnBXhww3QxIrjDEOAm8ilmaU8TjGW6AeZa6UNDATw==
X-Received: by 2002:a17:907:706:b0:ad8:8200:ecf7 with SMTP id a640c23a62f3a-ae9c99aa29fmr821747766b.4.1753139953227;
        Mon, 21 Jul 2025 16:19:13 -0700 (PDT)
Received: from [192.168.0.18] (cable-94-189-142-142.dynamic.sbb.rs. [94.189.142.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7ea53sm757005366b.133.2025.07.21.16.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 16:19:12 -0700 (PDT)
Message-ID: <a1bc7a9d-817d-49cc-b7f1-79a900090136@gmail.com>
Date: Tue, 22 Jul 2025 01:18:52 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] lib/kasan: introduce CONFIG_ARCH_DEFER_KASAN
 option
To: Andrew Morton <akpm@linux-foundation.org>,
 Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com,
 agordeev@linux.ibm.com, glider@google.com, dvyukov@google.com,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
 <20250717142732.292822-2-snovitoll@gmail.com>
 <20250717151048.bb6124bea54a31cd2b41faaf@linux-foundation.org>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250717151048.bb6124bea54a31cd2b41faaf@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 7/18/25 12:10 AM, Andrew Morton wrote:
> On Thu, 17 Jul 2025 19:27:21 +0500 Sabyrzhan Tasbolatov <snovitoll@gmail.com> wrote:
> 
>> Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures that need
>> to defer KASAN initialization until shadow memory is properly set up.
>>
>> Some architectures (like PowerPC with radix MMU) need to set up their
>> shadow memory mappings before KASAN can be safely enabled, while others
>> (like s390, x86, arm) can enable KASAN much earlier or even from the
>> beginning.
>>
>> This option allows us to:
>> 1. Use static keys only where needed (avoiding overhead)
>> 2. Use compile-time constants for arch that don't need runtime checks
>> 3. Maintain optimal performance for both scenarios
>>
>> Architectures that need deferred KASAN should select this option.
>> Architectures that can enable KASAN early will get compile-time
>> optimizations instead of runtime checks.
> 
> Looks nice and appears quite mature.  I'm reluctant to add it to mm.git
> during -rc6, especially given the lack of formal review and ack tags.
> 
> But but but, that's what the mm-new branch is for.  I guess I'll add it
> to get some additional exposure, but whether I'll advance it into
> mm-unstable/linux-next for this cycle is unclear.
> 
> What do you (and others) think?

After looking a bit, it breaks UM and probably LoongArch too.
I'd say it needs more work and not ready even for mm-new.

