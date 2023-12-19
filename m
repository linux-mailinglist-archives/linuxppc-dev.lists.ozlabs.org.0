Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2396B818161
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 07:15:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cMP1G1+V;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZyBoH60N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvRJk5nwvz3cNV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 17:15:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cMP1G1+V;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZyBoH60N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvRHw46STz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 17:15:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702966504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=N4xpaJDAj+StH+2TtuN2nBP+xYkEOxE/YoKqAKSnixo=;
	b=cMP1G1+VvhNkPx2aGwXGGlGBq0PHPOb4uM37y49n9+/8OS9HijrGgJ2nJfYGLTLBjgb4Xh
	dkM5vUdkG/3dS4AQkNdZaIbFp8EfmX6pfwbPsCVkfgP+/DS8LULZJUIqTlJYgCeuuJ7zgP
	kKZEhUyiiQ2CP6t0bD1RHkQl5vwF9cc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702966505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=N4xpaJDAj+StH+2TtuN2nBP+xYkEOxE/YoKqAKSnixo=;
	b=ZyBoH60Nohw8y/C0tystA3s6vIt+FssuLbdnZGtjSrUKaV7zCp0/ucbltAepk8qZ3RJTGr
	X8uG6yRPlN4CtZku8pe7kHHS9iqW13tyfX2gqJ1GYKW4UFqCnvZNKd6rHgOZu8PBYcKzPT
	CIJYWx0S1BfRNRGuvNDEWLv+facGVsk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-dgthdwwRMtOQ_QpUxOWLXQ-1; Tue, 19 Dec 2023 01:15:02 -0500
X-MC-Unique: dgthdwwRMtOQ_QpUxOWLXQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2358a5de1dso88969166b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 22:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702966501; x=1703571301;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4xpaJDAj+StH+2TtuN2nBP+xYkEOxE/YoKqAKSnixo=;
        b=RW0uaAw1UqZ4YYxnVe2bufjxHXQsf1D+Ew3RioqfKLI9Z4BcnYyY3YenNxy2kEwBer
         leOvFb7+qT6+OH+CcLd71lV8FoELutxpds+0bB6dR8NKMKqvtE4fURozgpn2ClAJ/7TW
         TuNF92NJG58kbox+gcky+FjHvIRbAgCgbSq1GvvEzWoTHLPQ35u2Q9DhYTMGvPKOiw73
         bmWnMJHF6+sXcs10VPrxEc9vpbapLObm55Y9apoWIBkvUdcvyFNZwu5bg+WNs51rk0r5
         x/bTioGCb7u3Do/sK1j/ORsc0jQ9dZ5qvo2GgcY3xd30mJ8LH4Qqe0XDzNVYMUp91F6h
         8BtA==
X-Gm-Message-State: AOJu0YxQeHXJ71jEriTea+L8pHkmqacQqENTbludRbjpEOhBmgzCvsXI
	zyCW33EZJlo8mkStzfKq3amEQhc1skqRgpstCYggyQ5DzNYgxD44MpRhRndgMsFwXzTkaKYzXCI
	C8Px8tm6LltRoYAC66Nn6Ck9P2A==
X-Received: by 2002:a17:906:dd6:b0:a23:537a:a3cf with SMTP id p22-20020a1709060dd600b00a23537aa3cfmr1475059eji.135.1702966501299;
        Mon, 18 Dec 2023 22:15:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEH0UwRGUpzBCQ7lscPgvahcmeHybTOnpGKJdS5qfOqe+3S/cVYFVm7c5wX02ch1FjPqPqfsQ==
X-Received: by 2002:a17:906:dd6:b0:a23:537a:a3cf with SMTP id p22-20020a1709060dd600b00a23537aa3cfmr1475055eji.135.1702966500993;
        Mon, 18 Dec 2023 22:15:00 -0800 (PST)
Received: from [192.168.0.6] (ip-109-43-177-45.web.vodafone.de. [109.43.177.45])
        by smtp.gmail.com with ESMTPSA id uv8-20020a170907cf4800b00a1d232b39b9sm14813410ejc.184.2023.12.18.22.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 22:15:00 -0800 (PST)
Message-ID: <49fe69ad-828e-4ac7-8693-7fd983e5152e@redhat.com>
Date: Tue, 19 Dec 2023 07:14:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v5 10/29] powerpc/sprs: Specify SPRs with
 data rather than code
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20231216134257.1743345-1-npiggin@gmail.com>
 <20231216134257.1743345-11-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231216134257.1743345-11-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16/12/2023 14.42, Nicholas Piggin wrote:
> A significant rework that builds an array of 'struct spr', where each
> element describes an SPR. This makes various metadata about the SPR
> like name and access type easier to carry and use.
> 
> Hypervisor privileged registers are described despite not being used
> at the moment for completeness, but also the code might one day be
> reused for a hypervisor-privileged test.
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   powerpc/sprs.c | 643 ++++++++++++++++++++++++++++++++++---------------
>   1 file changed, 450 insertions(+), 193 deletions(-)
> 
> diff --git a/powerpc/sprs.c b/powerpc/sprs.c
> index 57e487ce..cd8b472d 100644
> --- a/powerpc/sprs.c
> +++ b/powerpc/sprs.c
> @@ -28,231 +28,465 @@
>   #include <asm/processor.h>
>   #include <asm/barrier.h>
>   
> -uint64_t before[1024], after[1024];
> -
> -/* Common SPRs for all PowerPC CPUs */
> -static void set_sprs_common(uint64_t val)
> +/* "Indirect" mfspr/mtspr which accept a non-constant spr number */
> +static uint64_t __mfspr(unsigned spr)
>   {
> -	mtspr(9, val);		/* CTR */
> -	// mtspr(273, val);	/* SPRG1 */  /* Used by our exception handler */
> -	mtspr(274, val);	/* SPRG2 */
> -	mtspr(275, val);	/* SPRG3 */
> +	uint64_t tmp;
> +	uint64_t ret;
> +
> +	asm volatile(
> +"	bcl	20, 31, 1f		\n"
> +"1:	mflr	%0			\n"
> +"	addi	%0, %0, (2f-1b)		\n"
> +"	add	%0, %0, %2		\n"
> +"	mtctr	%0			\n"
> +"	bctr				\n"
> +"2:					\n"
> +".LSPR=0				\n"
> +".rept 1024				\n"
> +"	mfspr	%1, .LSPR		\n"
> +"	b	3f			\n"
> +"	.LSPR=.LSPR+1			\n"
> +".endr					\n"
> +"3:					\n"
> +	: "=&r"(tmp),
> +	  "=r"(ret)
> +	: "r"(spr*8) /* 8 bytes per 'mfspr ; b' block */
> +	: "lr", "ctr");
> +
> +	return ret;
>   }
>   
> -/* SPRs from PowerPC Operating Environment Architecture, Book III, Vers. 2.01 */
> -static void set_sprs_book3s_201(uint64_t val)
> +static void __mtspr(unsigned spr, uint64_t val)
>   {
> -	mtspr(18, val);		/* DSISR */
> -	mtspr(19, val);		/* DAR */
> -	mtspr(152, val);	/* CTRL */
> -	mtspr(256, val);	/* VRSAVE */
> -	mtspr(786, val);	/* MMCRA */
> -	mtspr(795, val);	/* MMCR0 */
> -	mtspr(798, val);	/* MMCR1 */
> +	uint64_t tmp;
> +
> +	asm volatile(
> +"	bcl	20, 31, 1f		\n"
> +"1:	mflr	%0			\n"
> +"	addi	%0, %0, (2f-1b)		\n"
> +"	add	%0, %0, %2		\n"
> +"	mtctr	%0			\n"
> +"	bctr				\n"
> +"2:					\n"
> +".LSPR=0				\n"
> +".rept 1024				\n"
> +"	mtspr	.LSPR, %1		\n"
> +"	b	3f			\n"
> +"	.LSPR=.LSPR+1			\n"
> +".endr					\n"
> +"3:					\n"
> +	: "=&r"(tmp)
> +	: "r"(val),
> +	  "r"(spr*8) /* 8 bytes per 'mfspr ; b' block */
> +	: "lr", "ctr", "xer");
>   }
>   
> +static uint64_t before[1024], after[1024];
> +
> +#define SPR_PR_READ	0x0001
> +#define SPR_PR_WRITE	0x0002
> +#define SPR_OS_READ	0x0010
> +#define SPR_OS_WRITE	0x0020
> +#define SPR_HV_READ	0x0100
> +#define SPR_HV_WRITE	0x0200
> +
> +#define RW		0x333
> +#define RO		0x111
> +#define WO		0x222
> +#define OS_RW		0x330
> +#define OS_RO		0x110
> +#define OS_WO		0x220
> +#define HV_RW		0x300
> +#define HV_RO		0x100
> +#define HV_WO		0x200
> +
> +#define SPR_ASYNC	0x1000	/* May be updated asynchronously */
> +#define SPR_INT		0x2000	/* May be updated by synchronous interrupt */
> +#define SPR_HARNESS	0x4000	/* Test harness uses the register */
> +
> +struct spr {
> +	const char	*name;
> +	uint8_t		width;
> +	uint16_t	access;
> +	uint16_t	type;
> +};
> +
> +/* SPRs common denominator back to PowerPC Operating Environment Architecture */
> +static const struct spr sprs_common[1024] = {
> +  [1] = {"XER",		64,	RW,		SPR_HARNESS, }, /* Compiler */
> +  [8] = {"LR", 		64,	RW,		SPR_HARNESS, }, /* Compiler, mfspr/mtspr */
> +  [9] = {"CTR",		64,	RW,		SPR_HARNESS, }, /* Compiler, mfspr/mtspr */
> + [18] = {"DSISR",	32,	OS_RW,		SPR_INT, },
> + [19] = {"DAR",		64,	OS_RW,		SPR_INT, },
> + [26] = {"SRR0",	64,	OS_RW,		SPR_INT, },
> + [27] = {"SRR1",	64,	OS_RW,		SPR_INT, },
> +[268] = {"TB",		64,	RO	,	SPR_ASYNC, },
> +[269] = {"TBU",		32,	RO,		SPR_ASYNC, },
> +[272] = {"SPRG0",	64,	OS_RW,		SPR_HARNESS, }, /* Int stack */
> +[273] = {"SPRG1",	64,	OS_RW,		SPR_HARNESS, }, /* Scratch */
> +[274] = {"SPRG2",	64,	OS_RW, },
> +[275] = {"SPRG3",	64,	OS_RW, },
> +[287] = {"PVR",		32,	OS_RO, },

Just a little stylish nit: You've got a space before the closing "}", but no 
space after the opening "{". Looks a little bit weird to me. Maybe add a 
space after the "{", too?

  Thomas

