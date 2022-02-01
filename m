Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2248D4A5407
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 01:26:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jnm247443z3c9d
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 11:26:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Zf9m/10E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Zf9m/10E; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jnm1M45gsz2xMQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 11:25:40 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id s16so13673456pgs.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 16:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7OiM2+K1ZSXcDkF9dC6yiTeIYuWrcda9CES4W2kkiT0=;
 b=Zf9m/10E3qO9xHyOHCK1mNSJL5wQr/VB77/LWwdsTGt4HUxkozkJDq0B99+tw6XOEe
 eU6txKGQ1qHa+LaCOzwX67x682s17RPtlgX7AkZj+s70bMEPIsWjiJnOMk0NO8t6gTzx
 WaITP3EBCAAT9i8q4GB+79pBKlVAYsvJ5OHmFQMuns5cnD9yoTzXrAvXhrfO1xNNE1CR
 RhLqvLRsbqcWqFjMfg8tDh+1sYNPoWogO4NZ3PVD6IcIkOW8KoefRiaXiAP2pSf+td2r
 9jLbs0B6AxcXwptyypGJsp9lDskXTXdCa7jZnBHBJ/EvNR4K7o5sDOFDHeIxvIkrJbDI
 +fFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7OiM2+K1ZSXcDkF9dC6yiTeIYuWrcda9CES4W2kkiT0=;
 b=rPZB5qP0d7i7yDO9/2fOYOnlC0BEzqEVyAZ5w4Q3EqReoe/lor1jwOPY+ePxmqcvkN
 HB3GQFgil3YFu1y9Se+pGoTjFfOIfOk8jrNmgVVMolS7ITF/htVHVfgpjnYlBYR/7F3j
 KMoyZRXPmwAvdEsc+sHiVyeQkFgs6mlwoEupVM9xrWp6wjx/pAtPeA8gUpXjGK4yezBE
 mu7G70BssCcCaoBnfHRlWFmWL4VAJ3oJyWC38O4+x/BhOtuV3b7+G7KWLLxsF2chX1pX
 YwQ/Sp7a3KtbqMM/djLwpjEQAprJARCJkPhSLMx1VAs5VYr4NqYDqtZe3AULkdotskR1
 XQIQ==
X-Gm-Message-State: AOAM5321dtTC1XdSs33Kojg1tLUf6g1BPSlWOV8K+CcdKgS7zIpfpuSB
 55pWSCm28HFMFX0ORLa/R4kLuRyK4bNz9AOh
X-Google-Smtp-Source: ABdhPJzpaqfug3DOVDv6g41z+dsW+S6V5kfw5QIS4qdPeMPx1HVv09hWqgTZtePPsBObTOVUEtA7Gw==
X-Received: by 2002:a63:5f44:: with SMTP id t65mr18433781pgb.587.1643675137691; 
 Mon, 31 Jan 2022 16:25:37 -0800 (PST)
Received: from [192.168.10.24] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id
 ip4sm446391pjb.8.2022.01.31.16.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 16:25:37 -0800 (PST)
Message-ID: <c131311f-1609-7b3e-c5ec-84b0c09c1b92@ozlabs.ru>
Date: Tue, 1 Feb 2022 11:25:31 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0
Subject: Re: [PATCH kernel] powerpc/64: Add UADDR64 relocation support
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220131041407.435244-1-aik@ozlabs.ru>
 <07a92a00-cd74-ae19-0e84-25e3afb17cae@csgroup.eu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <07a92a00-cd74-ae19-0e84-25e3afb17cae@csgroup.eu>
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
Cc: Alan Modra <amodra@au1.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/31/22 17:38, Christophe Leroy wrote:
> 
> 
> Le 31/01/2022 à 05:14, Alexey Kardashevskiy a écrit :
>> When ld detects unaligned relocations, it emits R_PPC64_UADDR64
>> relocations instead of R_PPC64_RELATIVE. Currently R_PPC64_UADDR64 are
>> detected by arch/powerpc/tools/relocs_check.sh and expected not to work.
>> Below is a simple chunk to trigger this behaviour:
> 
> According to relocs_check.sh, this is expected to happen only with
> binutils < 2.19. Today minimum binutils version is 2.23
> 
> Have you observed this problem with newer version of binutils ?

Oh yeah. 2.36.1. And the toolchain folks explained internally that this 
is correct behavior and this was a ticking bomb which exploded now and 
the kernel has to deal with it.


>>
>> \#pragma GCC push_options
>> \#pragma GCC optimize ("O0")
> 
> AFAIU Linux Kernel is always built with O2

Correct. Even O1 hides this.

> Have you observed the problem with O2 ?


Yes, I see it once I enable CONFIG_PRINTK_INDEX (this is how it was 
spotted with my particular config, there is still a fair chance that 
this config option does not cause UADDR64 always) but I did not debug 
with it enabled as pretty much every single __func__ passed to printk 
caused unaligned relocation (tens of thousands). Note that this 
particular case can be fixed by removing __packed from "struct pi_entry" 
(== re-arm the bomb). Thanks,


> 
> 
>> struct entry {
>>           const char *file;
>>           int line;
>> } __attribute__((packed));
>> static const struct entry e1 = { .file = __FILE__, .line = __LINE__ };
>> static const struct entry e2 = { .file = __FILE__, .line = __LINE__ };
>> ...
>> prom_printf("e1=%s %lx %lx\n", e1.file, (unsigned long) e1.file, mfmsr());
>> prom_printf("e2=%s %lx\n", e2.file, (unsigned long) e2.file);
>> \#pragma GCC pop_options
>>
>>
>> This adds support for UADDR64 for 64bit. This reuses __dynamic_symtab
>> from the 32bit which supports more relocation types already.
>>
>> This adds a workaround for the number of relocations as the DT_RELACOUNT
>> ELF Dynamic Array Tag does not include relocations other than
>> R_PPC64_RELATIVE. This instead iterates over the entire .rela.dyn section.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>
>> Tested via qemu gdb stub (the kernel is loaded at 0x400000).
>>
>> Disasm:
>>
>> c000000001a804d0 <e1>:
>> c000000001a804d0:       b0 04 a8 01     .long 0x1a804b0
>>                           c000000001a804d0: R_PPC64_RELATIVE      *ABS*-0x3ffffffffe57fb50
>> c000000001a804d4:       00 00 00 c0     lfs     f0,0(0)
>> c000000001a804d8:       fa 08 00 00     .long 0x8fa
>>
>> c000000001a804dc <e2>:
>>           ...
>>                           c000000001a804dc: R_PPC64_UADDR64       .rodata+0x4b0
>>
>> Before relocation:
>>
>>>>> p *(unsigned long *) 0x1e804d0
>> $1 = 0xc000000001a804b0
>>>>> p *(unsigned long *) 0x1e804dc
>> $2 = 0x0
>>
>> After:
>>>>> p *(unsigned long *) 0x1e804d0
>> $1 = 0x1e804b0
>>>>> p *(unsigned long *) 0x1e804dc
>> $2 = 0x1e804b0
>> ---
>>    arch/powerpc/kernel/reloc_64.S     | 47 +++++++++++++++++++++++++-----
>>    arch/powerpc/kernel/vmlinux.lds.S  |  3 +-
>>    arch/powerpc/tools/relocs_check.sh |  6 ----
>>    3 files changed, 41 insertions(+), 15 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/reloc_64.S b/arch/powerpc/kernel/reloc_64.S
>> index 02d4719bf43a..a91175723d9d 100644
>> --- a/arch/powerpc/kernel/reloc_64.S
>> +++ b/arch/powerpc/kernel/reloc_64.S
>> @@ -10,6 +10,7 @@
>>    RELA = 7
>>    RELACOUNT = 0x6ffffff9
>>    R_PPC64_RELATIVE = 22
>> +R_PPC64_UADDR64 = 43
>>    
>>    /*
>>     * r3 = desired final address of kernel
>> @@ -25,6 +26,8 @@ _GLOBAL(relocate)
>>    	add	r9,r9,r12	/* r9 has runtime addr of .rela.dyn section */
>>    	ld	r10,(p_st - 0b)(r12)
>>    	add	r10,r10,r12	/* r10 has runtime addr of _stext */
>> +	ld	r13,(p_sym - 0b)(r12)
>> +	add	r13,r13,r12	/* r13 has runtime addr of .dynsym */
>>    
>>    	/*
>>    	 * Scan the dynamic section for the RELA and RELACOUNT entries.
>> @@ -46,8 +49,8 @@ _GLOBAL(relocate)
>>    	b	1b
>>    4:	cmpdi	r7,0		/* check we have both RELA and RELACOUNT */
>>    	cmpdi	cr1,r8,0
>> -	beq	6f
>> -	beq	cr1,6f
>> +	beq	9f
>> +	beq	cr1,9f
>>    
>>    	/*
>>    	 * Work out linktime address of _stext and hence the
>> @@ -60,25 +63,55 @@ _GLOBAL(relocate)
>>    	subf	r10,r7,r10
>>    	subf	r3,r10,r3	/* final_offset */
>>    
>> +	/*
>> +	 * FIXME
>> +	 * Here r8 is a number of relocations in .rela.dyn.
>> +	 * When ld issues UADDR64 relocations, they end up at the end
>> +	 * of the .rela.dyn section. However RELACOUNT does not include
>> +	 * them so the loop below is going to finish after the last
>> +	 * R_PPC64_RELATIVE as they normally go first.
>> +	 * Work out the size of .rela.dyn at compile time.
>> +	 */
>> +	ld	r8,(p_rela_end - 0b)(r12)
>> +	ld	r18,(p_rela - 0b)(r12)
>> +	sub	r8,r8,r18
>> +	li      r18,24		/* 24 == sizeof(elf64_rela) */
>> +	divd	r8,r8,r18
>> +
>>    	/*
>>    	 * Run through the list of relocations and process the
>> -	 * R_PPC64_RELATIVE ones.
>> +	 * R_PPC64_RELATIVE and R_PPC64_UADDR64 ones.
>>    	 */
>>    	mtctr	r8
>> -5:	ld	r0,8(9)		/* ELF64_R_TYPE(reloc->r_info) */
>> +5:	lwa	r0,8(r9)	/* ELF64_R_TYPE(reloc->r_info) */
>>    	cmpdi	r0,R_PPC64_RELATIVE
>>    	bne	6f
>>    	ld	r6,0(r9)	/* reloc->r_offset */
>>    	ld	r0,16(r9)	/* reloc->r_addend */
>> -	add	r0,r0,r3
>> +	b	7f
>> +
>> +6:	cmpdi	r0,R_PPC64_UADDR64
>> +	bne	8f
>> +	ld	r6,0(r9)
>> +	ld	r0,16(r9)
>> +	lwa	r14,12(r9) 	/* ELF64_R_SYM(reloc->r_info) */
>> +	mulli	r14,r14,24	/* 24 == sizeof(elf64_sym) */
>> +	add	r14,r14,r13	/* elf64_sym[ELF64_R_SYM] */
>> +	ld	r14,8(r14)
>> +	add	r0,r0,r14
>> +
>> +7:	add	r0,r0,r3
>>    	stdx	r0,r7,r6
>> -	addi	r9,r9,24
>> +
>> +8:	addi	r9,r9,24
>>    	bdnz	5b
>>    
>> -6:	blr
>> +9:	blr
>>    
>>    .balign 8
>>    p_dyn:	.8byte	__dynamic_start - 0b
>>    p_rela:	.8byte	__rela_dyn_start - 0b
>> +p_rela_end:	.8byte __rela_dyn_end - 0b
>> +p_sym:		.8byte __dynamic_symtab - 0b
>>    p_st:	.8byte	_stext - 0b
>>    
>> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
>> index 2bcca818136a..e9d9bda3ffaf 100644
>> --- a/arch/powerpc/kernel/vmlinux.lds.S
>> +++ b/arch/powerpc/kernel/vmlinux.lds.S
>> @@ -281,9 +281,7 @@ SECTIONS
>>    	. = ALIGN(8);
>>    	.dynsym : AT(ADDR(.dynsym) - LOAD_OFFSET)
>>    	{
>> -#ifdef CONFIG_PPC32
>>    		__dynamic_symtab = .;
>> -#endif
>>    		*(.dynsym)
>>    	}
>>    	.dynstr : AT(ADDR(.dynstr) - LOAD_OFFSET) { *(.dynstr) }
>> @@ -299,6 +297,7 @@ SECTIONS
>>    	{
>>    		__rela_dyn_start = .;
>>    		*(.rela*)
>> +		__rela_dyn_end = .;
>>    	}
>>    #endif
>>    	/* .exit.data is discarded at runtime, not link time,
>> diff --git a/arch/powerpc/tools/relocs_check.sh b/arch/powerpc/tools/relocs_check.sh
>> index 014e00e74d2b..956b9e236a60 100755
>> --- a/arch/powerpc/tools/relocs_check.sh
>> +++ b/arch/powerpc/tools/relocs_check.sh
>> @@ -54,9 +54,3 @@ fi
>>    num_bad=$(echo "$bad_relocs" | wc -l)
>>    echo "WARNING: $num_bad bad relocations"
>>    echo "$bad_relocs"
>> -
>> -# If we see this type of relocation it's an idication that
>> -# we /may/ be using an old version of binutils.
>> -if echo "$bad_relocs" | grep -q -F -w R_PPC64_UADDR64; then
>> -	echo "WARNING: You need at least binutils >= 2.19 to build a CONFIG_RELOCATABLE kernel"
>> -fi
