Return-Path: <linuxppc-dev+bounces-14918-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8910CCD2E0D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Dec 2025 12:18:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dYMN90s4Qz2yFQ;
	Sat, 20 Dec 2025 22:18:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.50 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766229513;
	cv=pass; b=PRNqNO3j8misMGECtgyNyWXZJZOpuGZ6odR6NAwjBUm2UzIP7S7pdHCgCxtSXv4r9XfDfUOf/vDOhsMxy5g3l56a08lctaapAlYirwrLPTg13VZI0iiZ0Luhnz1mqVKQPu8WyptTGYRbaGbsO/7tg4xA4e8AdcovHGkBlTWISZMsu8c0VPPP+s9DFMcTnm45Blp2IhrRZ8a+CUgZLURE3HU5+eoUqrNI9i/i1QDARkoIsn9/dp83GE4N50dFWkGV5YQIzXvQSB6Dtu3K1KQ/YQLJeLMlE+HL2+1H4hc0ZU8N/rPxsVIR/Ew6EjMtqwPriLqyvjaiwQjMMPFf9sKTmg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766229513; c=relaxed/relaxed;
	bh=9EnJJOFz0YxV4Mx+dW+7qgAk7LiNUV4sgcP4KAKrUTU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=DE6lfA+n8PQt3rhQJ3avY9ouUY8nlQOtG/NQWGIy8uUZOWn/N2k4v1NvrWmKXJ6wHugTBBRCTdGnu/IC53QYOOx7Nbl9lxL2mHcSGL8GfudPEPf+PZfDpXFYxlkfY1DXtzgZTnNrFyFT0+3QUP5ngYnEdIxelAh3K4Do1hJtj7MxFCHTqcvuq9rQty03/4YDvLVE1LizNCMIKeFtBhYt6bUJzibS/d8LfZ71zG0wjWKpBq66o4c0Bt7gk9Zg8a2M2sAH//56ivUGR1jQJYGU2lBcF+jDZB7f6xUcXVQJTsvD8I4A6FhA+QaB5/TX3mudlucU/+Oe8RHIhZW5zYIJ3A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Ppi04v4n; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=uyfkbg+J; dkim-atps=neutral; spf=pass (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Ppi04v4n;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=uyfkbg+J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dYMN460hCz2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Dec 2025 22:18:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1766229477; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tQBDHzifMy22i4OjSgA+4C6GzSLa1mHQVS0yoyk4IIgiulYk4b09TZf9lmjmvUD9kp
    LkrQ1w91omYo6nJkhip0qir660qIlW2NWfnrTQTxPACtWusFew5T2NCnUOgMrEDfwlpZ
    kejjyRsR7AokFah3IdNgVBCeIqlbIL/G0z5GgSV1giWJrVeyFm3YLnkciwIoqbCanSaW
    KxLtQ5HR4OMBCMrvnwZEZ4je9wD12zve1Zuodcdi+EVvX8fG85+G5VV10kutp1Hys45A
    gTdp9OIfkHW6NxG+YP3Q2YgEti3Auc42dgOiTc2lHPKZVZA5haEaXanYIaPKEElT1Yp/
    7hjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1766229477;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=9EnJJOFz0YxV4Mx+dW+7qgAk7LiNUV4sgcP4KAKrUTU=;
    b=gAl9QZq66A1h7OQpW++C1jzJTvvcOQn8CMLJsr1ofysRXb0EsV9abXPxst0MKz0s74
    eImcylceENA9SNlPYvZyK0P1WQYcd2JBdUlIwPS3/zsUTmFGC/abxWwsEsGelh28ndB6
    Rvn/IPYFSiQ6K/jBcqHX/ODQoU/7NvIg+nme7refW0HdhZCVH8lijrcIEskdwpf2QRng
    qKiTTGjOTP3PkYvMXr4uuT2YCIUXApJ/ND9QbxRsNo4UxknteHbqsmH7v4VleDRUOajG
    yqT5vVL8pIn4HnMo5QH57UsmqPl+sceS3CcWYSDUHjkJfbWCEs0ZbnXTKgnGvfzcYbnZ
    tOuw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1766229477;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=9EnJJOFz0YxV4Mx+dW+7qgAk7LiNUV4sgcP4KAKrUTU=;
    b=Ppi04v4nsBh7iY3ZGE2oILxtG1P+KcHaRPtNEgvP/FgcZ+3IE8rXuUoLSYkbePK9k6
    fYAuLntSGhPUX+9KP8fB9DMymyEikIA5T6gv4pr6TUCv1zYAJbYIHLcXwWcubdm6mL56
    1eCmM8CqQmBCSBMaykz8xbof+SULC7MSqv9xR+2ueKBNpreyhytqeLvPXS0SLJ8IlGIR
    i2H7Psl53ZWilNWcryg0Pijv/pKYO2GCQnBTfCd/Pj5QRGo3fMqy8qaBxXXdvz3mgO9P
    KH/r7SNY+6ea0ay9HgeYA3Xa+en7lskqTI/aCK2KVvzrGhtwo3vwvJR2fN3TQCymMQRP
    pC1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1766229477;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=9EnJJOFz0YxV4Mx+dW+7qgAk7LiNUV4sgcP4KAKrUTU=;
    b=uyfkbg+JdqUjEe+W+tPxECO0HUyYEI3euwc7PxIuEt+lUhCDzvUsp53g2QRy/u1CRz
    9pu+CsNZBniWs56yhZDw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIS+l7x3g"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 54.1.0 DYNA|AUTH)
    with ESMTPSA id efe0e51BKBHtZD1
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 20 Dec 2025 12:17:55 +0100 (CET)
Subject: Re: [PATCH] powerpc/32: Restore disabling of interrupts at
 interrupt/syscall exit
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Guenter Roeck <linux@roeck-us.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, hypexed@yahoo.com.au,
 Christian Zigotzky <info@xenosoft.de>
References: <585ea521b2be99d293b539bbfae148366cfb3687.1766146895.git.chleroy@kernel.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <0cce7da7-9524-05c6-11bb-2f0f1977ca94@xenosoft.de>
Date: Sat, 20 Dec 2025 12:17:55 +0100
X-Mailer: BrassMonkey/33.9.1
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
In-Reply-To: <585ea521b2be99d293b539bbfae148366cfb3687.1766146895.git.chleroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 19/12/25 13:23, Christophe Leroy (CS GROUP) wrote:
> Commit 2997876c4a1a ("powerpc/32: Restore clearing of MSR[RI] at
> interrupt/syscall exit") delayed clearing of MSR[RI], but missed that
> both MSR[RI] and MSR[EE] are cleared at the same time, so the commit
> also delayed the disabling of interrupts, leading to unexpected
> behaviour.
>
> To fix that, mostly revert the blamed commit and restore the clearing
> of MSR[RI] in interrupt_exit_kernel_prepare() instead. For 8xx it
> implies adding a synchronising instruction after the mtspr in order to
> make sure no instruction counter interrupt (used for perf events) will
> fire just after clearing MSR[RI].
>
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Closes: https://lore.kernel.org/all/4d0bd05d-6158-1323-3509-744d3fbe8fc7@xenosoft.de/
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/all/6b05eb1c-fdef-44e0-91a7-8286825e68f1@roeck-us.net/
> Fixes: 2997876c4a1a ("powerpc/32: Restore clearing of MSR[RI] at interrupt/syscall exit")
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---
>   arch/powerpc/include/asm/hw_irq.h |  2 +-
>   arch/powerpc/include/asm/reg.h    |  1 +
>   arch/powerpc/kernel/entry_32.S    | 15 ---------------
>   arch/powerpc/kernel/interrupt.c   |  5 ++++-
>   4 files changed, 6 insertions(+), 17 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
> index 1078ba88efaf..9cd945f2acaf 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -90,7 +90,7 @@ static inline void __hard_EE_RI_disable(void)
>   	if (IS_ENABLED(CONFIG_BOOKE))
>   		wrtee(0);
>   	else if (IS_ENABLED(CONFIG_PPC_8xx))
> -		wrtspr(SPRN_NRI);
> +		wrtspr_sync(SPRN_NRI);
>   	else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
>   		__mtmsrd(0, 1);
>   	else
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 3fe186635432..3449dd2b577d 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -1400,6 +1400,7 @@ static inline void mtmsr_isync(unsigned long val)
>   				     : "r" ((unsigned long)(v)) \
>   				     : "memory")
>   #define wrtspr(rn)	asm volatile("mtspr " __stringify(rn) ",2" : : : "memory")
> +#define wrtspr_sync(rn)	asm volatile("mtspr " __stringify(rn) ",2; sync" : : : "memory")
>   
>   static inline void wrtee(unsigned long val)
>   {
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
> index 16f8ee6cb2cd..d8426251b1cd 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -101,17 +101,6 @@ SYM_FUNC_END(__kuep_unlock)
>   .endm
>   #endif
>   
> -.macro	clr_ri trash
> -#ifndef CONFIG_BOOKE
> -#ifdef CONFIG_PPC_8xx
> -	mtspr   SPRN_NRI, \trash
> -#else
> -	li	\trash, MSR_KERNEL & ~MSR_RI
> -	mtmsr	\trash
> -#endif
> -#endif
> -.endm
> -
>   	.globl	transfer_to_syscall
>   transfer_to_syscall:
>   	stw	r3, ORIG_GPR3(r1)
> @@ -160,7 +149,6 @@ ret_from_syscall:
>   	cmpwi	r3,0
>   	REST_GPR(3, r1)
>   syscall_exit_finish:
> -	clr_ri	r4
>   	mtspr	SPRN_SRR0,r7
>   	mtspr	SPRN_SRR1,r8
>   
> @@ -237,7 +225,6 @@ fast_exception_return:
>   	/* Clear the exception marker on the stack to avoid confusing stacktrace */
>   	li	r10, 0
>   	stw	r10, 8(r11)
> -	clr_ri	r10
>   	mtspr	SPRN_SRR1,r9
>   	mtspr	SPRN_SRR0,r12
>   	REST_GPR(9, r11)
> @@ -270,7 +257,6 @@ interrupt_return:
>   .Lfast_user_interrupt_return:
>   	lwz	r11,_NIP(r1)
>   	lwz	r12,_MSR(r1)
> -	clr_ri	r4
>   	mtspr	SPRN_SRR0,r11
>   	mtspr	SPRN_SRR1,r12
>   
> @@ -313,7 +299,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
>   	cmpwi	cr1,r3,0
>   	lwz	r11,_NIP(r1)
>   	lwz	r12,_MSR(r1)
> -	clr_ri	r4
>   	mtspr	SPRN_SRR0,r11
>   	mtspr	SPRN_SRR1,r12
>   
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index aea6f7e8e9c6..e63bfde13e03 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -38,7 +38,7 @@ static inline bool exit_must_hard_disable(void)
>   #else
>   static inline bool exit_must_hard_disable(void)
>   {
> -	return false;
> +	return true;
>   }
>   #endif
>   
> @@ -443,6 +443,9 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>   
>   		if (unlikely(stack_store))
>   			__hard_EE_RI_disable();
> +#else
> +	} else {
> +		__hard_EE_RI_disable();
>   #endif /* CONFIG_PPC64 */
>   	}
>   

The patched kernel 6.19.0-rc1 boots without any problems. Thank you.

Tested-by Christian Zigotzky <chzigotzky@xenosoft.de>

-- 
Sent with BrassMonkey 33.9.1 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.9.1)


