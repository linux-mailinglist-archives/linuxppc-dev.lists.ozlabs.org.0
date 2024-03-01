Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD9386E0B0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 12:51:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KFSPsmPk;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KFSPsmPk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmRHl3qFpz3vdb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 22:50:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KFSPsmPk;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KFSPsmPk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmRH12mY0z3d2S
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 22:50:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709293817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sbxmYCmx7KEXKZU1W11M9tIsGjyOf9fGQFP2JCkJplU=;
	b=KFSPsmPkFewkGQcoH2wiR+8bFA9FYSy0BqbWuD8OdrDh1IhLiivWVBBYbYkJajU9FKqQ2l
	LFuR8BfmK95Vkv3I0LyQQbmDE1n0KBPlIXrbjXku04/VTM6DtL9mIuKoFiNXVckhI6S3kZ
	7yJ/JDsUHSguL2yZMCXdRAzFHGKZNww=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709293817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sbxmYCmx7KEXKZU1W11M9tIsGjyOf9fGQFP2JCkJplU=;
	b=KFSPsmPkFewkGQcoH2wiR+8bFA9FYSy0BqbWuD8OdrDh1IhLiivWVBBYbYkJajU9FKqQ2l
	LFuR8BfmK95Vkv3I0LyQQbmDE1n0KBPlIXrbjXku04/VTM6DtL9mIuKoFiNXVckhI6S3kZ
	7yJ/JDsUHSguL2yZMCXdRAzFHGKZNww=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-KqWqu9XuPCWf2vSoJQaseg-1; Fri, 01 Mar 2024 06:50:16 -0500
X-MC-Unique: KqWqu9XuPCWf2vSoJQaseg-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-787f2059cfcso229724785a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Mar 2024 03:50:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709293815; x=1709898615;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sbxmYCmx7KEXKZU1W11M9tIsGjyOf9fGQFP2JCkJplU=;
        b=j6zukak9yf9FGjY6H+pO8KchFmm5J4Iwsw9jXK06mW95ZrTMtW1ifeuQLZzDS3KFO7
         JCqZHxrfWn/2REQ+b6S9pciGkTYCrKd8QK22BRveH8cuYYv8xfNvk2QmexoQoI/2l2B0
         yzWEZ0YoovHttHtZUevdnIN7xG3cSgooowqeRMh4uztIpei/3uaq03XkXPZo+YQZHNCx
         i8kn7Kwzr2W5s6wY8HST811bhGRgYn63MswwSZpIQTX+p7HeW1bJ2Foda2P2oLkPtJXl
         YyleiaWcaz8ou45PtB7gDcvyS+yBwavQmwOTC8sfjhmVO1L1t5y5qWWCKDM9T2OY8n4h
         jecw==
X-Forwarded-Encrypted: i=1; AJvYcCUhso6R3R9OIzENHdebOyYGudosc43DaCaal2kAFaX3lxmdX89sVXkp5Q+DpMHQmm5OX+eqOOh8kVafPu/TYedMjGZ8sAmKy8akj2LG1w==
X-Gm-Message-State: AOJu0Ywc0iUyG0PDjW06gVFlxvN+J2ZF3/eLL6MdXjsZX93GFB/ppmMn
	fdfmYlTb2N1L9YNdsRlU7C1l43XfAnDCDgV3rlEF6ocr/TXw/2EQp9izsqLCdfyhuURFbW4cOuC
	uWhnbtkCfWLNqlQ+9U/cPFn07Qs8wzvWb3F6Yi3OS/2J55g5Ic+ovYyZGRo1wblo=
X-Received: by 2002:a05:620a:1643:b0:787:ec02:92f6 with SMTP id c3-20020a05620a164300b00787ec0292f6mr1238266qko.73.1709293815745;
        Fri, 01 Mar 2024 03:50:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiDwPYWVHkDqooggwtDzoTfzET85vE65+rQl/isQu55HmdcDVvr5OWdGkWeT82LeVW5FmW+A==
X-Received: by 2002:a05:620a:1643:b0:787:ec02:92f6 with SMTP id c3-20020a05620a164300b00787ec0292f6mr1238253qko.73.1709293815465;
        Fri, 01 Mar 2024 03:50:15 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-133.web.vodafone.de. [109.43.178.133])
        by smtp.gmail.com with ESMTPSA id br37-20020a05620a462500b007872d50caf5sm1570063qkb.19.2024.03.01.03.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 03:50:15 -0800 (PST)
Message-ID: <a9441736-e254-49f0-9bea-e8008cec3e96@redhat.com>
Date: Fri, 1 Mar 2024 12:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 12/32] powerpc: Fix emulator illegal
 instruction test for powernv
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-13-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240226101218.1472843-13-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26/02/2024 11.11, Nicholas Piggin wrote:
> Illegal instructions cause 0xe40 (HEAI) interrupts rather
> than program interrupts.
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   lib/powerpc/asm/processor.h |  1 +
>   lib/powerpc/setup.c         | 13 +++++++++++++
>   powerpc/emulator.c          | 21 ++++++++++++++++++++-
>   3 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
> index 9d8061962..cf1b9d8ff 100644
> --- a/lib/powerpc/asm/processor.h
> +++ b/lib/powerpc/asm/processor.h
> @@ -11,6 +11,7 @@ void do_handle_exception(struct pt_regs *regs);
>   #endif /* __ASSEMBLY__ */
>   
>   extern bool cpu_has_hv;
> +extern bool cpu_has_heai;
>   
>   static inline uint64_t mfspr(int nr)
>   {
> diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
> index 89e5157f2..3c81aee9e 100644
> --- a/lib/powerpc/setup.c
> +++ b/lib/powerpc/setup.c
> @@ -87,6 +87,7 @@ static void cpu_set(int fdtnode, u64 regval, void *info)
>   }
>   
>   bool cpu_has_hv;
> +bool cpu_has_heai;
>   
>   static void cpu_init(void)
>   {
> @@ -108,6 +109,18 @@ static void cpu_init(void)
>   		hcall(H_SET_MODE, 0, 4, 0, 0);
>   #endif
>   	}
> +
> +	switch (mfspr(SPR_PVR) & PVR_VERSION_MASK) {
> +	case PVR_VER_POWER10:
> +	case PVR_VER_POWER9:
> +	case PVR_VER_POWER8E:
> +	case PVR_VER_POWER8NVL:
> +	case PVR_VER_POWER8:
> +		cpu_has_heai = true;
> +		break;
> +	default:
> +		break;
> +	}
>   }
>   
>   static void mem_init(phys_addr_t freemem_start)
> diff --git a/powerpc/emulator.c b/powerpc/emulator.c
> index 39dd59645..c9b17f742 100644
> --- a/powerpc/emulator.c
> +++ b/powerpc/emulator.c
> @@ -31,6 +31,20 @@ static void program_check_handler(struct pt_regs *regs, void *opaque)
>   	regs->nip += 4;
>   }
>   
> +static void heai_handler(struct pt_regs *regs, void *opaque)
> +{
> +	int *data = opaque;
> +
> +	if (verbose) {
> +		printf("Detected invalid instruction %#018lx: %08x\n",
> +		       regs->nip, *(uint32_t*)regs->nip);
> +	}
> +
> +	*data = 8; /* Illegal instruction */
> +
> +	regs->nip += 4;
> +}
> +
>   static void alignment_handler(struct pt_regs *regs, void *opaque)
>   {
>   	int *data = opaque;
> @@ -362,7 +376,12 @@ int main(int argc, char **argv)
>   {
>   	int i;
>   
> -	handle_exception(0x700, program_check_handler, (void *)&is_invalid);
> +	if (cpu_has_heai) {
> +		handle_exception(0xe40, heai_handler, (void *)&is_invalid);
> +		handle_exception(0x700, program_check_handler, (void *)&is_invalid);
> +	} else {
> +		handle_exception(0x700, program_check_handler, (void *)&is_invalid);

The 0x700 line looks identical to the other part of the if-statement ... I'd 
suggest to leave it outside of the if-statement, drop the else-part and just 
set 0xe40 if cpu_has_heai.

  Thomas

> +	}
>   	handle_exception(0x600, alignment_handler, (void *)&alignment);
>   
>   	for (i = 1; i < argc; i++) {

