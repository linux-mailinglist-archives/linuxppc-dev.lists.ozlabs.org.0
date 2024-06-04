Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E608C8FAFF5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 12:39:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DwdEgbmi;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DwdEgbmi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtnBq0v0Qz3cWv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 20:38:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DwdEgbmi;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DwdEgbmi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtnB53Ltcz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 20:38:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717497495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7Nvp5AaQYpAVjvz+txzIU0wdf5FQKPdQuCtMNBtXpUw=;
	b=DwdEgbmiJaF3IOBT3G5hdRqeKRmZG+czAwN+Ldr6qdrPbpEntdSlexH+0HM8zutnCwhuDo
	8NjRdDsJ10+nTbyTIEm1YkE0IlN97ixUYnZrLBP1rSAPLtkGCoub6KDE8vd5LHZ8ghdx+Y
	uYVEQFbZ+XPeUrDq83yHUNJxmMS97us=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717497495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7Nvp5AaQYpAVjvz+txzIU0wdf5FQKPdQuCtMNBtXpUw=;
	b=DwdEgbmiJaF3IOBT3G5hdRqeKRmZG+czAwN+Ldr6qdrPbpEntdSlexH+0HM8zutnCwhuDo
	8NjRdDsJ10+nTbyTIEm1YkE0IlN97ixUYnZrLBP1rSAPLtkGCoub6KDE8vd5LHZ8ghdx+Y
	uYVEQFbZ+XPeUrDq83yHUNJxmMS97us=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-VG9wz2PsNmeiZ_YlqRIBLA-1; Tue, 04 Jun 2024 06:38:10 -0400
X-MC-Unique: VG9wz2PsNmeiZ_YlqRIBLA-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2eaaae3e600so21274651fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 03:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717497489; x=1718102289;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Nvp5AaQYpAVjvz+txzIU0wdf5FQKPdQuCtMNBtXpUw=;
        b=fTmMRT6yzF5NtLmpqtZVg9BuvkgX4zOkcuisUfYk2zvICe/EVXarNDbkUbmpruzYBZ
         eNDeobZJRU5xAmPzE7bmq07t4zdflCYM4xO+NQH7Juk4CvN05/eFUHEkJ4fYl+uSoLBY
         gmFScCEvgWzNvJGP4MaVOoB38AVtFytBM1s6xBr7UiIrOe7NgtHZ2WoaqBas6Y4jGeky
         y5+wwiw3GMeLfU+ur2fY81vTMVGBA5vXFGSIS7YJLhFcOL4is7ovxyxnBgQKgqLouKDB
         sVKBxEAsxGo0GuHcP+xVx6F0F8fXKEeOSSa7Q3aADpCjJhePN55hX78v3d7n39jCJ55A
         uXBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhTMV8ovvUnJ3/aO9vxkksGCKaoRwDT7B0jjdW0V10CjovGyI8Qf5ExZ59wdIGApRoLpZNfzkXvAc8Swf6icqeSUueb4Fd7iKlJ+0emw==
X-Gm-Message-State: AOJu0YypJeVqQ3v0c9gRFIYNF5+kt7E1ondGGqiyBDMBdLnL2LgVqI6R
	fxj0B/fYx+VrbS/SLTgaXs5SL65ifakwi8uFL4IClPpxgreneJUlqCth/TvhMzAtjlVlvHYXtLL
	zTvUZAY8lsz5sOwKH3twhLG7C8T/PqyRRHmEPFWdLGd/vklre8gDhNwVKSkb2BFQ=
X-Received: by 2002:a05:651c:1991:b0:2ea:7603:af63 with SMTP id 38308e7fff4ca-2ea95163bc3mr97230491fa.26.1717497489027;
        Tue, 04 Jun 2024 03:38:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGucLj+jsMZRzmFr7a7rwwFQ95iNenHorKzmqkWKAWnjfwZ3relZ2Y/3/C/VEsoRqpUk8ysUw==
X-Received: by 2002:a05:651c:1991:b0:2ea:7603:af63 with SMTP id 38308e7fff4ca-2ea95163bc3mr97230241fa.26.1717497488601;
        Tue, 04 Jun 2024 03:38:08 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-178-97.web.vodafone.de. [109.43.178.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b85c628sm149890405e9.25.2024.06.04.03.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 03:38:08 -0700 (PDT)
Message-ID: <c497801d-f043-46f5-bfa2-74eff672ae47@redhat.com>
Date: Tue, 4 Jun 2024 12:38:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v9 27/31] powerpc: add pmu tests
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-28-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240504122841.1177683-28-npiggin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/05/2024 14.28, Nicholas Piggin wrote:
> Add some initial PMU testing.
> 
> - PMC5/6 tests
> - PMAE / PMI test
> - BHRB basic tests
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
...
> diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
> index a4ff678ce..8ff4939e2 100644
> --- a/lib/powerpc/setup.c
> +++ b/lib/powerpc/setup.c
> @@ -33,6 +33,7 @@ u32 initrd_size;
>   u32 cpu_to_hwid[NR_CPUS] = { [0 ... NR_CPUS-1] = (~0U) };
>   int nr_cpus_present;
>   uint64_t tb_hz;
> +uint64_t cpu_hz;
>   
>   struct mem_region mem_regions[NR_MEM_REGIONS];
>   phys_addr_t __physical_start, __physical_end;
> @@ -42,6 +43,7 @@ struct cpu_set_params {
>   	unsigned icache_bytes;
>   	unsigned dcache_bytes;
>   	uint64_t tb_hz;
> +	uint64_t cpu_hz;
>   };
>   
>   static void cpu_set(int fdtnode, u64 regval, void *info)
> @@ -95,6 +97,22 @@ static void cpu_set(int fdtnode, u64 regval, void *info)
>   		data = (u32 *)prop->data;
>   		params->tb_hz = fdt32_to_cpu(*data);
>   
> +		prop = fdt_get_property(dt_fdt(), fdtnode,
> +					"ibm,extended-clock-frequency", NULL);
> +		if (prop) {
> +			data = (u32 *)prop->data;
> +			params->cpu_hz = fdt32_to_cpu(*data);
> +			params->cpu_hz <<= 32;
> +			data = (u32 *)prop->data + 1;
> +			params->cpu_hz |= fdt32_to_cpu(*data);

Why don't you simply cast to (u64 *) and use fdt64_to_cpu() here instead?

...
> diff --git a/powerpc/pmu.c b/powerpc/pmu.c
> new file mode 100644
> index 000000000..8b13ee4cd
> --- /dev/null
> +++ b/powerpc/pmu.c
> @@ -0,0 +1,403 @@
...
> +static void test_pmc5_with_fault(void)
> +{
> +	unsigned long pmc5_1, pmc5_2;
> +
> +	handle_exception(0x700, &illegal_handler, NULL);
> +	handle_exception(0xe40, &illegal_handler, NULL);
> +
> +	reset_mmcr0();
> +	mtspr(SPR_PMC5, 0);
> +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
> +	asm volatile(".long 0x0" ::: "memory");
> +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
> +	assert(got_interrupt);
> +	got_interrupt = false;
> +	pmc5_1 = mfspr(SPR_PMC5);
> +
> +	reset_mmcr0();
> +	mtspr(SPR_PMC5, 0);
> +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
> +	asm volatile(".rep 20 ; nop ; .endr ; .long 0x0" ::: "memory");
> +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
> +	assert(got_interrupt);
> +	got_interrupt = false;
> +	pmc5_2 = mfspr(SPR_PMC5);
> +
> +	/* TCG and POWER9 do not count instructions around faults correctly */
> +	report_kfail(true, pmc5_1 + 20 == pmc5_2, "PMC5 counts instructions with fault");

It would be nice to have the TCG detection patch before this patch, so you 
could use the right condition here right from the start.

> +	handle_exception(0x700, NULL, NULL);
> +	handle_exception(0xe40, NULL, NULL);
> +}
> +
> +static void test_pmc5_with_sc(void)
> +{
> +	unsigned long pmc5_1, pmc5_2;
> +
> +	handle_exception(0xc00, &sc_handler, NULL);
> +
> +	reset_mmcr0();
> +	mtspr(SPR_PMC5, 0);
> +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
> +	asm volatile("sc 0" ::: "memory");
> +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
> +	assert(got_interrupt);
> +	got_interrupt = false;
> +	pmc5_1 = mfspr(SPR_PMC5);
> +
> +	reset_mmcr0();
> +	mtspr(SPR_PMC5, 0);
> +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
> +	asm volatile(".rep 20 ; nop ; .endr ; sc 0" ::: "memory");
> +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
> +	assert(got_interrupt);
> +	got_interrupt = false;
> +	pmc5_2 = mfspr(SPR_PMC5);
> +
> +	/* TCG does not count instructions around syscalls correctly */
> +	report_kfail(true, pmc5_1 + 20 == pmc5_2, "PMC5 counts instructions with syscall");

dito

> +	handle_exception(0xc00, NULL, NULL);
> +}
> +
> +static void test_pmc56(void)
> +{
> +	unsigned long tmp;
> +
> +	report_prefix_push("pmc56");
> +
> +	reset_mmcr0();
> +	mtspr(SPR_PMC5, 0);
> +	mtspr(SPR_PMC6, 0);
> +	report(mfspr(SPR_PMC5) == 0, "PMC5 zeroed");
> +	report(mfspr(SPR_PMC6) == 0, "PMC6 zeroed");
> +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~MMCR0_FC);
> +	msleep(100);
> +	report(mfspr(SPR_PMC5) == 0, "PMC5 frozen");
> +	report(mfspr(SPR_PMC6) == 0, "PMC6 frozen");
> +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~MMCR0_FC56);
> +	mdelay(100);
> +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
> +	report(mfspr(SPR_PMC5) != 0, "PMC5 counting");
> +	report(mfspr(SPR_PMC6) != 0, "PMC6 counting");
> +
> +	/* Dynamic frequency scaling could cause to be out, so don't fail. */
> +	tmp = mfspr(SPR_PMC6);
> +	report(true, "PMC6 ratio to reported clock frequency is %ld%%", tmp * 1000 / cpu_hz);

report(true, ...) looks weird. Use report_info() instead?

  Thomas

