Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94682745CEF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:14:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UR8Kcfgt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UR8Kcfgt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvmbk3WSWz3cB0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 23:14:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UR8Kcfgt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UR8Kcfgt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvmZT0kNYz3bc7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 23:13:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688389996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SxEeda1lP8vYHztO09buc7PNU+fvlt7zSS2H1ID2IBc=;
	b=UR8KcfgtNuoiw6GbkibBFCfbdHtP6BgN8FomZrwW/8W29fh3NSz4aRTWzj3JbdgaZrcUqy
	cnSt0buEql48ifPTFT+QA/ntEzNijrhYW4ruVcZOWXMZx4Dq4md5hF9jfgba6nFdPTrSqZ
	Dk2Lh9clVTsF5JYItXJ3cnHmLN3i8+M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688389996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SxEeda1lP8vYHztO09buc7PNU+fvlt7zSS2H1ID2IBc=;
	b=UR8KcfgtNuoiw6GbkibBFCfbdHtP6BgN8FomZrwW/8W29fh3NSz4aRTWzj3JbdgaZrcUqy
	cnSt0buEql48ifPTFT+QA/ntEzNijrhYW4ruVcZOWXMZx4Dq4md5hF9jfgba6nFdPTrSqZ
	Dk2Lh9clVTsF5JYItXJ3cnHmLN3i8+M=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-gKvbupqWPfmn6UCyN1Oqsg-1; Mon, 03 Jul 2023 09:13:14 -0400
X-MC-Unique: gKvbupqWPfmn6UCyN1Oqsg-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-635e0889cc5so46221406d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jul 2023 06:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688389994; x=1690981994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxEeda1lP8vYHztO09buc7PNU+fvlt7zSS2H1ID2IBc=;
        b=GUkX8t7Zf3fp/FZuJQ1/9lPhu5PCMda6pxOscm419A1tOGmUE/meOeRnmTPLxlcHog
         fCpvG+s9yviBZHT7ZMG/8kNBYxXaG8/yvttaUCHYDegqomcY9/Qx4V/awBXPCRo8PvvK
         8ApC0dSyxBy/nTtwJH+jz0uTmOYY2WxGlIGmbB38ycfvJWxm4COueaoOeP9fq0H+du44
         pmIBNV8MzRMw4/mM24zqA2GhUmnPmLcniJES7BqxWj2VQM0mQXlo469Mx1v7oBR+dYyM
         UB/0P7Fjk4qlt9Bssm+7dPT0IVy9TDLFNBtLTB3xtQZYn4ySCjJYTDtPgpBTlhj+IuRT
         lryA==
X-Gm-Message-State: ABy/qLYi1MRxsCnZ1ot+eW73rJa2P4SpzfLUfCrzTMphUX2U20sWH7g7
	2eJZ5R5soiLf9Y1tYzwD4Ew5yTg8xNFGoJCXk2jFcHCSFzLUdW8YvcVdZ74jugUfs3K3BLsEiVR
	hbv8PXRYiYcAAcV6RayBOUDA26Q==
X-Received: by 2002:a05:6214:494:b0:636:39ed:4dd1 with SMTP id pt20-20020a056214049400b0063639ed4dd1mr15625140qvb.29.1688389994533;
        Mon, 03 Jul 2023 06:13:14 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH70MSF5RsvM0aA7RGTUjQAfELnLWyU96GzzmqtXEz/JuVIKVH+1sOOL6whIcUNk07KLiGrBQ==
X-Received: by 2002:a05:6214:494:b0:636:39ed:4dd1 with SMTP id pt20-20020a056214049400b0063639ed4dd1mr15625118qvb.29.1688389994211;
        Mon, 03 Jul 2023 06:13:14 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-127.web.vodafone.de. [109.43.176.127])
        by smtp.gmail.com with ESMTPSA id j14-20020a056214032e00b00635eee57eb0sm5626982qvu.34.2023.07.03.06.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 06:13:12 -0700 (PDT)
Message-ID: <1d624930-fbd1-a760-772d-6175bfad84c1@redhat.com>
Date: Mon, 3 Jul 2023 15:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [kvm-unit-tests v4 03/12] powerpc: Abstract H_CEDE calls into a
 sleep functions
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230608075826.86217-1-npiggin@gmail.com>
 <20230608075826.86217-4-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230608075826.86217-4-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/06/2023 09.58, Nicholas Piggin wrote:
> This consolidates several implementations, and it no longer leaves
> MSR[EE] enabled after the decrementer interrupt is handled, but
> rather disables it on return.
> 
> The handler no longer allows a continuous ticking, but rather dec
> has to be re-armed and EE re-enabled (e.g., via H_CEDE hcall) each
> time.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   lib/powerpc/asm/handlers.h  |  2 +-
>   lib/powerpc/asm/ppc_asm.h   |  1 +
>   lib/powerpc/asm/processor.h |  7 ++++++
>   lib/powerpc/handlers.c      | 10 ++++-----
>   lib/powerpc/processor.c     | 43 +++++++++++++++++++++++++++++++++++++
>   powerpc/sprs.c              |  6 +-----
>   powerpc/tm.c                | 20 +----------------
>   7 files changed, 58 insertions(+), 31 deletions(-)
> 
> diff --git a/lib/powerpc/asm/handlers.h b/lib/powerpc/asm/handlers.h
> index 64ba727a..e4a0cd45 100644
> --- a/lib/powerpc/asm/handlers.h
> +++ b/lib/powerpc/asm/handlers.h
> @@ -3,6 +3,6 @@
>   
>   #include <asm/ptrace.h>
>   
> -void dec_except_handler(struct pt_regs *regs, void *data);
> +void dec_handler_oneshot(struct pt_regs *regs, void *data);
>   
>   #endif /* _ASMPOWERPC_HANDLERS_H_ */
> diff --git a/lib/powerpc/asm/ppc_asm.h b/lib/powerpc/asm/ppc_asm.h
> index 1b85f6bb..6299ff53 100644
> --- a/lib/powerpc/asm/ppc_asm.h
> +++ b/lib/powerpc/asm/ppc_asm.h
> @@ -36,6 +36,7 @@
>   #endif /* __BYTE_ORDER__ */
>   
>   /* Machine State Register definitions: */
> +#define MSR_EE_BIT	15			/* External Interrupts Enable */
>   #define MSR_SF_BIT	63			/* 64-bit mode */
>   
>   #endif /* _ASMPOWERPC_PPC_ASM_H */
> diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
> index ac001e18..ebfeff2b 100644
> --- a/lib/powerpc/asm/processor.h
> +++ b/lib/powerpc/asm/processor.h
> @@ -20,6 +20,8 @@ static inline uint64_t get_tb(void)
>   
>   extern void delay(uint64_t cycles);
>   extern void udelay(uint64_t us);
> +extern void sleep_tb(uint64_t cycles);
> +extern void usleep(uint64_t us);
>   
>   static inline void mdelay(uint64_t ms)
>   {
> @@ -27,4 +29,9 @@ static inline void mdelay(uint64_t ms)
>   		udelay(1000);
>   }
>   
> +static inline void msleep(uint64_t ms)
> +{
> +	usleep(ms * 1000);
> +}
> +
>   #endif /* _ASMPOWERPC_PROCESSOR_H_ */
> diff --git a/lib/powerpc/handlers.c b/lib/powerpc/handlers.c
> index c8721e0a..296f14ff 100644
> --- a/lib/powerpc/handlers.c
> +++ b/lib/powerpc/handlers.c
> @@ -9,15 +9,13 @@
>   #include <libcflat.h>
>   #include <asm/handlers.h>
>   #include <asm/ptrace.h>
> +#include <asm/ppc_asm.h>
>   
>   /*
>    * Generic handler for decrementer exceptions (0x900)
> - * Just reset the decrementer back to the value specified when registering the
> - * handler
> + * Return with MSR[EE] disabled.
>    */
> -void dec_except_handler(struct pt_regs *regs __unused, void *data)
> +void dec_handler_oneshot(struct pt_regs *regs, void *data)
>   {
> -	uint64_t dec = *((uint64_t *) data);
> -
> -	asm volatile ("mtdec %0" : : "r" (dec));
> +	regs->msr &= ~(1UL << MSR_EE_BIT);
>   }
> diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
> index 0550e4fc..aaf45b68 100644
> --- a/lib/powerpc/processor.c
> +++ b/lib/powerpc/processor.c
> @@ -10,6 +10,8 @@
>   #include <asm/ptrace.h>
>   #include <asm/setup.h>
>   #include <asm/barrier.h>
> +#include <asm/hcall.h>
> +#include <asm/handlers.h>
>   
>   static struct {
>   	void (*func)(struct pt_regs *, void *data);
> @@ -58,3 +60,44 @@ void udelay(uint64_t us)
>   {
>   	delay((us * tb_hz) / 1000000);
>   }
> +
> +void sleep_tb(uint64_t cycles)
> +{
> +	uint64_t start, end, now;
> +
> +	start = now = get_tb();
> +	end = start + cycles;
> +
> +	while (end > now) {
> +		uint64_t left = end - now;
> +
> +		/* TODO: Could support large decrementer */
> +		if (left > 0x7fffffff)
> +			left = 0x7fffffff;
> +
> +		/* DEC won't fire until H_CEDE is called because EE=0 */
> +		asm volatile ("mtdec %0" : : "r" (left));
> +		handle_exception(0x900, &dec_handler_oneshot, NULL);
> +		/*
> +		 * H_CEDE is called with MSR[EE] clear and enables it as part
> +		 * of the hcall, returning with EE enabled. The dec interrupt
> +		 * is then taken immediately and the handler disables EE.
> +		 *
> +		 * If H_CEDE returned for any other interrupt than dec
> +		 * expiring, that is considered an unhandled interrupt and
> +		 * the test case would be stopped.
> +		 */
> +		if (hcall(H_CEDE) != H_SUCCESS) {
> +			printf("H_CEDE failed\n");
> +			abort();
> +		}
> +		handle_exception(0x900, NULL, NULL);
> +
> +		now = get_tb();
> +	}
> +}
> +
> +void usleep(uint64_t us)
> +{
> +	sleep_tb((us * tb_hz) / 1000000);
> +}
> diff --git a/powerpc/sprs.c b/powerpc/sprs.c
> index 5cc1cd16..ba4ddee4 100644
> --- a/powerpc/sprs.c
> +++ b/powerpc/sprs.c
> @@ -254,7 +254,6 @@ int main(int argc, char **argv)
>   		0x1234567890ABCDEFULL, 0xFEDCBA0987654321ULL,
>   		-1ULL,
>   	};
> -	static uint64_t decr = 0x7FFFFFFF; /* Max value */
>   
>   	for (i = 1; i < argc; i++) {
>   		if (!strcmp(argv[i], "-w")) {
> @@ -288,10 +287,7 @@ int main(int argc, char **argv)
>   	if (pause) {
>   		migrate_once();
>   	} else {
> -		puts("Sleeping...\n");
> -		handle_exception(0x900, &dec_except_handler, &decr);
> -		asm volatile ("mtdec %0" : : "r" (0x3FFFFFFF));
> -		hcall(H_CEDE);
> +		msleep(2000);
>   	}
>   
>   	get_sprs(after);
> diff --git a/powerpc/tm.c b/powerpc/tm.c
> index 65cacdf5..7fa91636 100644
> --- a/powerpc/tm.c
> +++ b/powerpc/tm.c
> @@ -48,17 +48,6 @@ static int count_cpus_with_tm(void)
>   	return available;
>   }
>   
> -static int h_cede(void)
> -{
> -	register uint64_t r3 asm("r3") = H_CEDE;
> -
> -	asm volatile ("sc 1" : "+r"(r3) :
> -			     : "r0", "r4", "r5", "r6", "r7", "r8", "r9",
> -			       "r10", "r11", "r12", "xer", "ctr", "cc");
> -
> -	return r3;
> -}
> -
>   /*
>    * Enable transactional memory
>    * Returns:	FALSE - Failure
> @@ -95,14 +84,10 @@ static bool enable_tm(void)
>   static void test_h_cede_tm(int argc, char **argv)
>   {
>   	int i;
> -	static uint64_t decr = 0x3FFFFF; /* ~10ms */
>   
>   	if (argc > 2)
>   		report_abort("Unsupported argument: '%s'", argv[2]);
>   
> -	handle_exception(0x900, &dec_except_handler, &decr);
> -	asm volatile ("mtdec %0" : : "r" (decr));
> -
>   	if (!start_all_cpus(halt, 0))
>   		report_abort("Failed to start secondary cpus");
>   
> @@ -120,10 +105,7 @@ static void test_h_cede_tm(int argc, char **argv)
>   		      "bf 2,1b" : : : "cr0");
>   
>   	for (i = 0; i < 500; i++) {
> -		uint64_t rval = h_cede();
> -
> -		if (rval != H_SUCCESS)
> -			break;
> +		msleep(10);
>   		mdelay(5);

msleep() directly followed by an mdelay() looks weird now. Do we still need 
the mdelay()? Or could we maybe at least get a comment here why there are 
now two different delaying calls here?

  Thomas


>   	}
>   

