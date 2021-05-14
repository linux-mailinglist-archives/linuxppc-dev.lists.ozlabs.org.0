Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9A738011C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 02:20:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fh8LZ0hFvz30BJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 10:20:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=TuwTHhRr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.25;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=TuwTHhRr; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fh8Kx2g1kz2xvR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 10:19:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620951573; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=XFu6uPRu/YLBNUqOdJ0yI9nzn1M1wimgUw4x6xMgnZFYHgULO5HAcLHO00m1m7QrfH
 GaMNa33oMfkilmX3BTtimSWNL6CaVK6gaDMdy0ZtyT+EEDNjSBKlaawWuNV4BKGoCdUZ
 R5ObHBx2ayWsw2Tv2Tlco+V2F5O2iNqwGglkr5bukoytR0gOjh9CcCwcRk9yqRlo05J2
 n0FEEsrlfFn1aFUXHKdnZFYICH+jkzWGgWgYia3aWvLG1ba9OB10IoNi4ceiVAzSRo2K
 c490vezYBWZIHgB3oUP7FGpwnh7Kz3gOd+wLMDITYwbO+Yb/t3U+ItUX0ZDXEv9cKQ3T
 vOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620951573;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=S8Cx7YBiWJ8fdHjItLMgAdw9F00OFqGKjMEeRvjxdt4=;
 b=heOvXq8puPCIkLSpA7S6ZHKsZozj9K+Qs2OYeBV6Lil2as/Hnlx/KTVz8JTh51wLV6
 SlYTtDECFnxwUwrQAuS/HA9GErgzUpw2elG/hoS7ZAw/rN/a7+2OF3vvuemNlIrHOUao
 C3n9f11VOPYNFm+xYYW/MqcOahrKtxwkzkNTzC03y4Lib7DWqblRYaHgIp27NSvmuFGf
 aFyDjMPKUTXsfkeNdWd8C2SI8wBLDmkripHCk33UnQ2vRjYY8MbQfWhjPMEQKDlAhe/Y
 v50BI3ba7YZ896SY9ohLXqmcSw1M/0enDEpFvnCxwwokEDBbe5ImdEBHQTmFcMkOiF2J
 i/gg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620951573;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=S8Cx7YBiWJ8fdHjItLMgAdw9F00OFqGKjMEeRvjxdt4=;
 b=TuwTHhRrXNQmkMzR02PaHkGdEHG8A1Ekd+zc2lRiY8Rqde2h4zN41tWSCdUPcfR9X4
 dZq4cWPbnL2NRYNgiPmy4t/bBXPsDn4l4wwtN4rP4eBUmZ2oSZohuUBTVLLjoub7bop0
 WEgwFupl/GLUX+T00cb0DkZ0EftrUmYSsjmXn5kAaPhFmYtcSBaVtuGOtolt+ThrwsTk
 bePV2FxqNiom12dVq7DhK6G9mP8HVIGdbPywFZi/nPeS/Dnjj3MJaNCdh2SOXBmT5Bo9
 3P2NNLG9ZO5h/UqshDhSA6OIgHQvGLkACm5Hm48HbPqyfq73T0VBu3CfXpLcubV3heYi
 frDQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhRIpEojeO2aDitd5b9gKDWtbOmUg=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.25.7 AUTH)
 with ESMTPSA id j00466x4E0JW7yD
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 14 May 2021 02:19:32 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <72e138cd-5201-a059-e8aa-cebc3db4029c@csgroup.eu>
 <65116250-6EEB-4419-8A7D-B0882379A68B@xenosoft.de>
 <c90ba856-1ef2-c010-17ac-a091c5252a5c@csgroup.eu>
 <781a426e-8561-108f-0e5c-9393bc653e86@xenosoft.de>
 <56899373-f821-62e2-26ab-b1a98b3fe2e2@csgroup.eu>
 <4175f794-f8b8-d9fc-620d-408317e27eba@xenosoft.de>
 <ea99d32a-b544-e813-8e0f-1719f3600ba9@csgroup.eu>
 <2f00463c-a87a-6dbc-037c-5a8996790d23@xenosoft.de>
 <1620946444.gkflc9lqps.astroid@bobo.none>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <466592f3-b080-1fb6-a4d0-08a4951e3c03@xenosoft.de>
Date: Fri, 14 May 2021 02:19:32 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1620946444.gkflc9lqps.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14 May 2021 at 00:58am, Nicholas Piggin wrote:
> Excerpts from Christian Zigotzky's message of May 14, 2021 6:20 am:
>> On 13 May 2021 at 07:00pm, Christophe Leroy wrote:
>>> Ah yes, I remember this problem.
>>>
>>> Can you select CONFIG_VIRT_CPU_ACCOUNTING_GEN in your configuration ?
>>>
>>> Otherwise, I can try to fix the branch.
>>>
>>> Christophe
>> I selected this. After that it compiles.
>>
>> 1. git bisect good - Xorg restarts again and again
>>       Output: [f9aa0ac1e9e82b60401ad567bdabc30598325bc1] Revert
>> "powerpc/64e/interrupt: use new interrupt return"
>> 2. git bisect good - Xorg restarts again and again
>>       Output: [cd6d259a14704741bf0cd1dcadb84c0de22d7f77] Revert
>> "powerpc/64e/interrupt: always save nvgprs on interrupt"
>> 3. git bisect bad - Xorg works
>>       Output: [9bfa20ef2ae54d3b9088dfbcde4ef97062cf5ef2] Revert
>> "powerpc/interrupt: update common interrupt code for"
>> 4. git bisect good - Xorg restarts again and again
>>       Output:
>>
>> cd6d259a14704741bf0cd1dcadb84c0de22d7f77 is the first bad commit
>> commit cd6d259a14704741bf0cd1dcadb84c0de22d7f77
>> Author: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Date:   Thu May 13 09:52:06 2021 +0000
>>
>>       Revert "powerpc/64e/interrupt: always save nvgprs on interrupt"
>>
>>       This reverts commit 4228b2c3d20e9f80b847f809c38e6cf82864fa50.
>>
>> :040000 040000 156542c857ad72776b69bb67b2f244afeeb7abd3
>> 92ea86ed097fce16238b0c2f2b343473894e4e8e M    arch
> Thank you both very much for chasing this down.
>
> I think I see the problem, it's clobbering r14 and r15 for some
> interrupts. Something like this is required, I'll give it more
> review and testing though.
>
> Thanks,
> Nick
>
> ---
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
> index 7c3654b0d0f4..b91ef04f1ce2 100644
> --- a/arch/powerpc/kernel/exceptions-64e.S
> +++ b/arch/powerpc/kernel/exceptions-64e.S
> @@ -535,6 +535,10 @@ __end_interrupts:
>   				PROLOG_ADDITION_2REGS)
>   	mfspr	r14,SPRN_DEAR
>   	mfspr	r15,SPRN_ESR
> +	std	r14,_DAR(r1)
> +	std	r15,_DSISR(r1)
> +	ld	r14,PACA_EXGEN+EX_R14(r13)
> +	ld	r15,PACA_EXGEN+EX_R15(r13)
>   	EXCEPTION_COMMON(0x300)
>   	b	storage_fault_common
>   
> @@ -544,6 +548,10 @@ __end_interrupts:
>   				PROLOG_ADDITION_2REGS)
>   	li	r15,0
>   	mr	r14,r10
> +	std	r14,_DAR(r1)
> +	std	r15,_DSISR(r1)
> +	ld	r14,PACA_EXGEN+EX_R14(r13)
> +	ld	r15,PACA_EXGEN+EX_R15(r13)
>   	EXCEPTION_COMMON(0x400)
>   	b	storage_fault_common
>   
> @@ -557,6 +565,10 @@ __end_interrupts:
>   				PROLOG_ADDITION_2REGS)
>   	mfspr	r14,SPRN_DEAR
>   	mfspr	r15,SPRN_ESR
> +	std	r14,_DAR(r1)
> +	std	r15,_DSISR(r1)
> +	ld	r14,PACA_EXGEN+EX_R14(r13)
> +	ld	r15,PACA_EXGEN+EX_R15(r13)
>   	EXCEPTION_COMMON(0x600)
>   	b	alignment_more	/* no room, go out of line */
>   
> @@ -565,10 +577,10 @@ __end_interrupts:
>   	NORMAL_EXCEPTION_PROLOG(0x700, BOOKE_INTERRUPT_PROGRAM,
>   				PROLOG_ADDITION_1REG)
>   	mfspr	r14,SPRN_ESR
> -	EXCEPTION_COMMON(0x700)
>   	std	r14,_DSISR(r1)
> -	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	ld	r14,PACA_EXGEN+EX_R14(r13)
> +	EXCEPTION_COMMON(0x700)
> +	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	program_check_exception
>   	REST_NVGPRS(r1)
>   	b	interrupt_return
> @@ -725,11 +737,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
>   	 * normal exception
>   	 */
>   	mfspr	r14,SPRN_DBSR
> -	EXCEPTION_COMMON_CRIT(0xd00)
>   	std	r14,_DSISR(r1)
> -	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	ld	r14,PACA_EXCRIT+EX_R14(r13)
>   	ld	r15,PACA_EXCRIT+EX_R15(r13)
> +	EXCEPTION_COMMON_CRIT(0xd00)
> +	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	DebugException
>   	REST_NVGPRS(r1)
>   	b	interrupt_return
> @@ -796,11 +808,11 @@ kernel_dbg_exc:
>   	 * normal exception
>   	 */
>   	mfspr	r14,SPRN_DBSR
> -	EXCEPTION_COMMON_DBG(0xd08)
>   	std	r14,_DSISR(r1)
> -	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	ld	r14,PACA_EXDBG+EX_R14(r13)
>   	ld	r15,PACA_EXDBG+EX_R15(r13)
> +	EXCEPTION_COMMON_DBG(0xd08)
> +	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	DebugException
>   	REST_NVGPRS(r1)
>   	b	interrupt_return
> @@ -931,11 +943,7 @@ masked_interrupt_book3e_0x2c0:
>    * original values stashed away in the PACA
>    */
>   storage_fault_common:
> -	std	r14,_DAR(r1)
> -	std	r15,_DSISR(r1)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	ld	r14,PACA_EXGEN+EX_R14(r13)
> -	ld	r15,PACA_EXGEN+EX_R15(r13)
>   	bl	do_page_fault
>   	b	interrupt_return
>   
> @@ -944,11 +952,7 @@ storage_fault_common:
>    * continues here.
>    */
>   alignment_more:
> -	std	r14,_DAR(r1)
> -	std	r15,_DSISR(r1)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	ld	r14,PACA_EXGEN+EX_R14(r13)
> -	ld	r15,PACA_EXGEN+EX_R15(r13)
>   	bl	alignment_exception
>   	REST_NVGPRS(r1)
>   	b	interrupt_return
>
>
Hi Nicholas,

I compiled the RC1 with your patch today and Xorg works without any 
problems.

Many thanks! It was a long way.

Cheers,
Christian
