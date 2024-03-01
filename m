Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E8286DEA4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 10:54:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZMX9GPvg;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IKZclaiS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmNj50rntz3vY3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 20:54:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZMX9GPvg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IKZclaiS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmNhL5cwNz3brV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 20:53:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709286813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rKaVjzDzVzAg13LfZUs0YrZbyYdj1H5q858pGQoSjpY=;
	b=ZMX9GPvgWiYQjTSBHVrJZqx/KYN/Qsv4g5wIRGgP7Kn1Nsx7ZJyVf5O7aKWh3wYfbRNvDG
	frF8VBNI5xrKrx2377jemhHbrnGmj9yrky9DnEG5tfX+bbWb1KGH/lS70Ga62kPJJAkep/
	lbqIZ4pJ/lhMfHh9sEbYlcGwh9CTJX4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709286814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rKaVjzDzVzAg13LfZUs0YrZbyYdj1H5q858pGQoSjpY=;
	b=IKZclaiSkdG15EnpVv28t8pyToccgJ6cOgT2RtVvndZZyQI++TCSq/r8ZffKXmC0HosIDj
	jSABfUsNqchcALZMFTp8CVbSH91FETD3w27cfXg8IenqwGKHrgMhyph0FtXS+V08ilP2GD
	KETps99ClJcGT2+2HizHW/WB9pn8rO4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-LTDmsKqAMcm9adESpXxw-Q-1; Fri, 01 Mar 2024 04:53:32 -0500
X-MC-Unique: LTDmsKqAMcm9adESpXxw-Q-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7880fabfdbaso2493585a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Mar 2024 01:53:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709286811; x=1709891611;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKaVjzDzVzAg13LfZUs0YrZbyYdj1H5q858pGQoSjpY=;
        b=PRy8nNoY0QqUdlrhEogXHSwGKyxq/N8fITjZPzLFV7NbfNLj0LtNgVcwb8KmE8pFoR
         RKiFPLQlCsq1lOY6cfyU2PBfnwFif2icXkL74GnWXDDcGMYkamaKtrg9W+2qSIZFvWhp
         Q18EVx/BLlj35ijgR2fZCCU5bcVYETgSHM9Of0WG7b9eKzJI9WH0et3bT1w+8WZNocU4
         3uJLVg3RyUdFK0yICTDBVFsZ8H3K3QnALVDicTzkQ2NxY7HFMCuSQ+PtsHO5CTAwhFw6
         cPBy1V7i8E8u4J9xmAIqjRE9sE2F8JAMm84X7xX64qJtoBxLAFHiShh/7uhilhbvtqPz
         8VQA==
X-Forwarded-Encrypted: i=1; AJvYcCUhRkbUk1cQkiQ+AXOtT7CKuQULLCsS6uNt8aI8a0c+EJ+7Hh4Z66QctOkdaEHl29meCARZnEIg704OktRTN9xqwQE4EWH291JnYvC15g==
X-Gm-Message-State: AOJu0YzPnZ9pfMG6WXvkbrnA9nsnfiZIgu63owix6LVKSSotf/h0eNa2
	6UKj1a7/lQhmjf7gMAYoPEsp2KPgajOJY4bvQjQ0h7NAUWXZJlcLo2IrxJwZCr1rlSq7loBw42U
	qk4JtVSVH4fJ6/c4qUr/yKJx3IxEru9LQmc42l4GcaJSr5U0Gkv8ojg2Qh4r0E3q4TM2bbYE=
X-Received: by 2002:a37:de19:0:b0:787:c6fc:db8e with SMTP id h25-20020a37de19000000b00787c6fcdb8emr944069qkj.22.1709286811717;
        Fri, 01 Mar 2024 01:53:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbWpWc5cFsI6iwOcyKtY6gP87lUXmXdExKltBw9jw5bBwlqvn6qOfAcMMhwn2/D3/vnv8+fQ==
X-Received: by 2002:a37:de19:0:b0:787:c6fc:db8e with SMTP id h25-20020a37de19000000b00787c6fcdb8emr944063qkj.22.1709286811443;
        Fri, 01 Mar 2024 01:53:31 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-133.web.vodafone.de. [109.43.178.133])
        by smtp.gmail.com with ESMTPSA id q13-20020ae9e40d000000b00787ed60cb17sm1479905qkc.59.2024.03.01.01.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 01:53:31 -0800 (PST)
Message-ID: <9d1166ed-e24f-4257-a441-080f577d3dde@redhat.com>
Date: Fri, 1 Mar 2024 10:53:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 04/32] powerpc: interrupt stack backtracing
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-5-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240226101218.1472843-5-npiggin@gmail.com>
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
> Add support for backtracing across interrupt stacks, and
> add interrupt frame backtrace for unhandled interrupts.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   lib/powerpc/processor.c |  4 ++-
>   lib/ppc64/asm/stack.h   |  3 +++
>   lib/ppc64/stack.c       | 55 +++++++++++++++++++++++++++++++++++++++++
>   powerpc/Makefile.ppc64  |  1 +
>   powerpc/cstart64.S      |  7 ++++--
>   5 files changed, 67 insertions(+), 3 deletions(-)
>   create mode 100644 lib/ppc64/stack.c
> 
> diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
> index ad0d95666..114584024 100644
> --- a/lib/powerpc/processor.c
> +++ b/lib/powerpc/processor.c
> @@ -51,7 +51,9 @@ void do_handle_exception(struct pt_regs *regs)
>   		return;
>   	}
>   
> -	printf("unhandled cpu exception %#lx at NIA:0x%016lx MSR:0x%016lx\n", regs->trap, regs->nip, regs->msr);
> +	printf("Unhandled cpu exception %#lx at NIA:0x%016lx MSR:0x%016lx\n",
> +			regs->trap, regs->nip, regs->msr);
> +	dump_frame_stack((void *)regs->nip, (void *)regs->gpr[1]);
>   	abort();
>   }
>   
> diff --git a/lib/ppc64/asm/stack.h b/lib/ppc64/asm/stack.h
> index 9734bbb8f..94fd1021c 100644
> --- a/lib/ppc64/asm/stack.h
> +++ b/lib/ppc64/asm/stack.h
> @@ -5,4 +5,7 @@
>   #error Do not directly include <asm/stack.h>. Just use <stack.h>.
>   #endif
>   
> +#define HAVE_ARCH_BACKTRACE
> +#define HAVE_ARCH_BACKTRACE_FRAME
> +
>   #endif
> diff --git a/lib/ppc64/stack.c b/lib/ppc64/stack.c
> new file mode 100644
> index 000000000..fcb7fa860
> --- /dev/null
> +++ b/lib/ppc64/stack.c
> @@ -0,0 +1,55 @@
> +#include <libcflat.h>
> +#include <asm/ptrace.h>
> +#include <stack.h>
> +
> +extern char exception_stack_marker[];
> +
> +int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
> +{
> +	static int walking;
> +	int depth = 0;
> +	const unsigned long *bp = (unsigned long *)frame;
> +	void *return_addr;
> +
> +	asm volatile("" ::: "lr"); /* Force it to save LR */
> +
> +	if (walking) {
> +		printf("RECURSIVE STACK WALK!!!\n");
> +		return 0;
> +	}
> +	walking = 1;
> +
> +	bp = (unsigned long *)bp[0];
> +	return_addr = (void *)bp[2];
> +
> +	for (depth = 0; bp && depth < max_depth; depth++) {
> +		return_addrs[depth] = return_addr;
> +		if (return_addrs[depth] == 0)
> +			break;
> +		if (return_addrs[depth] == exception_stack_marker) {
> +			struct pt_regs *regs;
> +
> +			regs = (void *)bp + STACK_FRAME_OVERHEAD;
> +			bp = (unsigned long *)bp[0];
> +			/* Represent interrupt frame with vector number */
> +			return_addr = (void *)regs->trap;
> +			if (depth + 1 < max_depth) {
> +				depth++;
> +				return_addrs[depth] = return_addr;
> +				return_addr = (void *)regs->nip;
> +			}
> +		} else {
> +			bp = (unsigned long *)bp[0];
> +			return_addr = (void *)bp[2];
> +		}
> +	}
> +
> +	walking = 0;
> +	return depth;
> +}
> +
> +int backtrace(const void **return_addrs, int max_depth)
> +{
> +	return backtrace_frame(__builtin_frame_address(0), return_addrs,
> +			       max_depth);
> +}
> diff --git a/powerpc/Makefile.ppc64 b/powerpc/Makefile.ppc64
> index b0ed2b104..eb682c226 100644
> --- a/powerpc/Makefile.ppc64
> +++ b/powerpc/Makefile.ppc64
> @@ -17,6 +17,7 @@ cstart.o = $(TEST_DIR)/cstart64.o
>   reloc.o  = $(TEST_DIR)/reloc64.o
>   
>   OBJDIRS += lib/ppc64
> +cflatobjs += lib/ppc64/stack.o
>   
>   # ppc64 specific tests
>   tests = $(TEST_DIR)/spapr_vpa.elf
> diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
> index 14ab0c6c8..278af84a6 100644
> --- a/powerpc/cstart64.S
> +++ b/powerpc/cstart64.S
> @@ -188,6 +188,7 @@ call_handler:
>   	.endr
>   	mfsprg1	r0
>   	std	r0,GPR1(r1)
> +	std	r0,0(r1)
>   
>   	/* lr, xer, ccr */
>   
> @@ -206,12 +207,12 @@ call_handler:
>   	subi	r31, r31, 0b - start_text
>   	ld	r2, (p_toc_text - start_text)(r31)
>   
> -	/* FIXME: build stack frame */
> -
>   	/* call generic handler */
>   
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	do_handle_exception
> +	.global exception_stack_marker
> +exception_stack_marker:
>   
>   	/* restore context */
>   
> @@ -321,6 +322,7 @@ handler_trampoline:
>   	/* nip and msr */
>   	mfsrr0	r0
>   	std	r0, _NIP(r1)
> +	std	r0, INT_FRAME_SIZE+16(r1)

So if I got that right, INT_FRAME_SIZE+16 points to the stack frame of the 
function that was running before the interrupt handler? Is it such a good 
idea to change that here? Please add a comment here explaining this line. 
Thanks!


>   	mfsrr1	r0
>   	std	r0, _MSR(r1)
> @@ -337,6 +339,7 @@ handler_htrampoline:
>   	/* nip and msr */
>   	mfspr	r0, SPR_HSRR0
>   	std	r0, _NIP(r1)
> +	std	r0, INT_FRAME_SIZE+16(r1)

dito.

>   	mfspr	r0, SPR_HSRR1
>   	std	r0, _MSR(r1)

  Thomas

