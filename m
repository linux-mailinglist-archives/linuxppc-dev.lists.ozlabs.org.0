Return-Path: <linuxppc-dev+bounces-3117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F99D9C5751
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 13:07:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnlXB0Hrbz2xQ8;
	Tue, 12 Nov 2024 23:07:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731413225;
	cv=none; b=gqvj+EkXXtznkquWdPait8oSVE4ELaUjYDe+STN7y7spt0CYqv8w8K8MiXQRxgLycolF5Nw+dBuUVCXuA4ciHMAqe+MEvyS1du3iZJlK5o/JhaRuQ5abLq5FjhFmoLrFPM6G6wTIxqmz9UFGRSGAJA3FkIGM9kVlK74Oqq/EItyN25qBTb8zCjiMkUb/La/fxuxrOP0OQtZhMchrl7EBDlMZaW4LDUDR2UYQ5eCOd4xUDRcrxs1rvzAaf2KlQegHc+byqbSGtYpLnIB4HhBthtXYAFWXalIUpnnGKLSJn2M/a0Kld4OnbyHkFoj7MEggE7Q5Ui4AOy+Iqs6pvgw/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731413225; c=relaxed/relaxed;
	bh=Hr6Hoa/KP2En5pzKnS+somng4tNtzIBHSByHOUsb3jw=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=kzwn73IdFOS6C893KMUINyy+i0J6k6Vdrq7JG60i7TtW2mx7N7IClfS04rAaynIq7PBj+gwGZXKJ25ByseaGfw3akW89+NsjurGXvatW1MNcGcYaKGlOWj8EV4ctLZw87m6k4dKmm0Z1TxxkhJTsZ+hrZ7iAeLFLmCJlEnhP1ZWVefQTXCJ0ZEePaPh6jNqSZQuo7ebu0P8FNBkWLfPjTbNCgdDb+9lp1TP0hYyUtJQZAWc9cONF973FvALkG4i+UWSeLySS1INZe4Lwn8AuzSKqJCvz2zwh4df82o3a+XtWt2r22yOid5IvhadPmJgQK7umaP6wZFQbT2IHhxfGHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C/aakDk5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C/aakDk5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnlX859B4z2xDM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 23:07:03 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-720be27db74so4156401b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 04:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731413220; x=1732018020; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hr6Hoa/KP2En5pzKnS+somng4tNtzIBHSByHOUsb3jw=;
        b=C/aakDk5dVMrhW7GkGO3XwQAP0hh6Qu37BKqgXVcLtpO3cb26Ep3DcWERPje8BDgPY
         kB1hExHJrbXQaqqYi/Ge39xOqcvsx3d7gSWxCmCpXbshXgNOOX+vDA43HsxiJXM6rzKm
         p84qdx4npFosU77PMljmSGzvcVbWPuUd1elFOX5N+9vSPH8aIRfM9VEePFoAiI3bys5L
         iwUBH7Bsl7wP19TcJd6Uga5KlzU8Z4rtHx/DNmpfAa3jYuuANePpLvTqxDXDZqbNIpWs
         sxo4zbFiXVVxLE/scHWa6M0bJ0VbaKqjdPio5kiiCqCx8wwuRlirOacbHtlsQpuFItcl
         GaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731413220; x=1732018020;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hr6Hoa/KP2En5pzKnS+somng4tNtzIBHSByHOUsb3jw=;
        b=o36G2KUolfwyXqnL0T0IhCu/fMico6i2h3o/fdR6Zd4Q3XLbCJQkdp0M0Ol/oS1rC+
         la27Fgl0U6V3EbA0mgHvZ19t44Jd/FJ6Uz+07i1ufGxPBuiuBwgw001ndjf4VioXxPPv
         jyZQFWV9oCWoxAxF5BABNBs6vSAEnitAaHhK5Qq9IJ+uAK/nkgiz8cbRcZkqRKXlKEzz
         O2O1QMYAKTKCEV7o2TAlM+YvsszNbEULGohUOcldS+Kcrx6+oDVkXMC7C3K5VQ/BKHAJ
         MXkDy3pXpX7W9nQ+nS/M4j4LMO5tVozk37rmIvKLl7LhSyNankO+aaGWk/ryfEdCHTn2
         gN/A==
X-Forwarded-Encrypted: i=1; AJvYcCW+Hs0IttLfFm8k1Xcmu0enJoxrE7ygglxlvXn0sSfjtO+VQaFpEuMsNKaDF6KbxucZtaFpHwCyXdFQr8k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz+eIn3uT8xXyfsSZU/X1uIfR28X/Yps7/WxTtqkknBkId+sl11
	vqHP/4lpF40fACX/fPgXqvXpuYBteQ8C42hqOb3QDJWRbylatIhdR2GJww==
X-Google-Smtp-Source: AGHT+IFTxymrBH9s9nuUko3kGbAbMg1itVpeA/PWkhAST2DNK14SEosjOOKpWhlUxS0gE9WFSMS3Qg==
X-Received: by 2002:a05:6a21:6d9e:b0:1d7:1288:8338 with SMTP id adf61e73a8af0-1dc23321c12mr25225507637.8.1731413220251;
        Tue, 12 Nov 2024 04:07:00 -0800 (PST)
Received: from dw-tp ([171.76.87.84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f643cf5sm10400406a12.61.2024.11.12.04.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 04:06:59 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] fadump: reserve param area if below boot_mem_top
In-Reply-To: <87ttccn0oz.fsf@gmail.com>
Date: Tue, 12 Nov 2024 17:23:56 +0530
Message-ID: <87serwmzvv.fsf@gmail.com>
References: <20241107055817.489795-1-sourabhjain@linux.ibm.com> <20241107055817.489795-2-sourabhjain@linux.ibm.com> <87zfm5m0p5.fsf@gmail.com> <b2047c3b-ec84-456f-8f95-734bcb9a0cd1@linux.ibm.com> <87ttccn0oz.fsf@gmail.com>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:

> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>
>> Hello Ritesh,
>>
>>
>> On 12/11/24 11:51, Ritesh Harjani (IBM) wrote:
>>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>>
>>>> The param area is a memory region where the kernel places additional
>>>> command-line arguments for fadump kernel. Currently, the param memory
>>>> area is reserved in fadump kernel if it is above boot_mem_top. However,
>>>> it should be reserved if it is below boot_mem_top because the fadump
>>>> kernel already reserves memory from boot_mem_top to the end of DRAM.
>>> did you mean s/reserves/preserves ?
>>
>> Yeah, preserves is better.
>>
>>>
>>>> Currently, there is no impact from not reserving param memory if it is
>>>> below boot_mem_top, as it is not used after the early boot phase of the
>>>> fadump kernel. However, if this changes in the future, it could lead to
>>>> issues in the fadump kernel.
>>> This will only affect Hash and not radix correct? Because for radix your
>>> param_area is somewhere within [memblock_end_of_DRAM() / 2, memblock_end_of_DRAM()]
>>> which is anyway above boot_mem_top so it is anyway preserved as is...
>>
>> Yes.
>>
>>>
>>> ... On second thoughts since param_area during normal kernel boot anyway
>>> comes from memblock now. And irrespective of where it falls (above or below
>>> boot_mem_top), we anyway append the bootargs to that. So we don't really
>>> preserve the original contents :) right?
>>
>> Sorry I didn't get it. We append strings from param_area to 
>> boot_command_line
>> not the other way.
>>
>>
>
> Right. My bad. 
>
>>> So why not just always call for
>>> memblock_reserve() on param_area during capture kernel run?
>>>
>>> Thoughts?
>>
>> Yes, there is no harm in calling memblock_reserve regardless of whether 
>> param_area
>> is below or above boot_mem_top. However, calling it when param_area is 
>> higher than
>> boot_mem_top is redundant, as we know fadump preserves memory from 
>> boot_mem_top
>> to the end of DRAM during early boot.
>
> So if we don't reserve the param_area then the kernel may use it for
> some other purposes once memory is released to buddy, right. But I guess,
> given we anyway copied the param_area in fadump_append_bootargs() during
> early boot to cmdline (before parse_early_param()), we anyway don't need
> it for later, right?
>
> In that case we don't need for Hash too (i.e when param_area falls under
> boot_mem_top), right? Since we anyway copied the param_area before
> parse_early_param() in fadump_append_bootargs. So what is the point in
> calling memblock_reserve() on that? Maybe I am missing something, can
> you please help explain.
>

Ok. I think I got it now. You did mention in the changelog - 

"Currently, there is no impact from not reserving param memory if it is
below boot_mem_top, as it is not used after the early boot phase of the
fadump kernel. However, if this changes in the future, it could lead to
issues in the fadump kernel."


So it is not an issue now, since the param area is not used after the
contents is copied over. So I think today we anyway don't need to call
memblock_reserve() on the param area - but if we are making it future
proof then we might as well just call memblock_reserve() on param_area
irrespective because otherwise once the kernel starts up it might re-use
that area for other purposes. So isn't it better to reserve for fadump
use of the param_area for either during early boot or during late kernel
boot phase of the capture kernel?

But now that I understand I don't have a strong opinion too (since it is
just future proofing). But I would prefer the safer approach of doing
memblock_reserve() always for param_area. So I will leave it upto you
and others. 

>>
>> According to the memblock documentation, when reserving memory regions, 
>> the new
>> regions can overlap with existing ones, but I don't see any advantage in 
>> calling memblock_reserve
>> for param_area if it falls above boot_mem_top.
>>
>> Regardless, I don’t have a strong opinion. If you think we should call 
>> memblock_reserve regardless
>> of where param_area is placed, I can do that. Please let me know your 
>> opinion.
>>
>> Sourabh Jain
>>
>>
>>
>>>
>>>> Fixes: 3416c9daa6b1 ("powerpc/fadump: pass additional parameters when fadump is active")

Not really IIUC, this is not really a fix but a future proofing of if
fadump ever tries to use param_area later during early boot or during 
late kernel boot.

-ritesh

>>>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>>> Acked-by: Hari Bathini <hbathini@linux.ibm.com>
>>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>>> ---
>>>>
>>>> Changelog:
>>>>
>>>> Since v1: https://lore.kernel.org/all/20241104083528.99520-1-sourabhjain@linux.ibm.com/
>>>>    - Include Fixes and Acked-by tag in the commit message
>>>>    - No functional changes
>>>>
>>>> ---
>>>>   arch/powerpc/kernel/fadump.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>>>> index 3a2863307863..3f3674060164 100644
>>>> --- a/arch/powerpc/kernel/fadump.c
>>>> +++ b/arch/powerpc/kernel/fadump.c
>>>> @@ -143,7 +143,7 @@ void __init fadump_append_bootargs(void)
>>>>   	if (!fw_dump.dump_active || !fw_dump.param_area_supported || !fw_dump.param_area)
>>>>   		return;
>>>>   
>>>> -	if (fw_dump.param_area >= fw_dump.boot_mem_top) {
>>>> +	if (fw_dump.param_area < fw_dump.boot_mem_top) {
>>>>   		if (memblock_reserve(fw_dump.param_area, COMMAND_LINE_SIZE)) {
>>>>   			pr_warn("WARNING: Can't use additional parameters area!\n");
>>>>   			fw_dump.param_area = 0;
>>>> -- 
>>>> 2.46.2

