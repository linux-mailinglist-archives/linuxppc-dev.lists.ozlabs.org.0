Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADB0260D8F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 10:30:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Blyyb2bLpzDqRW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 18:30:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qDwAzoF1; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bly2b6hyfzDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 17:48:55 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id m5so9461497pgj.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Sep 2020 00:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=VvEFGowA+wK2W6qNulPSUNosobtFAVCsLQZybi/EwSQ=;
 b=qDwAzoF1OIleeqQ++Rws4QKfwIOb8W0pzh6PIa+SBp6uXK1oXcRrJ8QHPkD4fKkbIJ
 xeFgYNycovthxUs6W0pd1oOHx9J0I/+tnSCIJVb2Qp3oYO4x98UXFT2AnnhaIFljyxGC
 Qmn7kU7GsJqB4453dVTPa1z0peBe4ATr1UvDGyY0aVu3kYEsO2EXftDqI1VoKllnEivY
 ydDNjqJjnQ+aE0UbScJVzNw72k4Pcv6DxtAdz2cbcpJR5wm/xwHf38gWQ9O2WIROSgrF
 1esJyA5XwVCMsCYx3Tf6+7B7+RKsU7WtmD66OCFJtyw5lXP7tv9rtw1zIg33rLf8MeXh
 EYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=VvEFGowA+wK2W6qNulPSUNosobtFAVCsLQZybi/EwSQ=;
 b=eXOrMxurr16ZsXgsm2/utqIA9ifgM9b6Xo+ZqZ6468CetV1WSJ822mbv7veXl8HDs8
 B64BDBtQz7ha+Z8PNH49zNHKHkhdKMerp4+cOwQ8ptYh/xq8Ie5KlMd2MUCwYFqBfRYy
 Gzk+xbIeQNyN/2+v4c7EJEdzcyUleSxXUrnom7fh+yIs+huZaVpSki6Z2wk5UU4npe/n
 9xohi3scWEI1TVnwDxLcaZIP59zqcp61Xo48/K45tYo/PBzg8XJbHTKVSIAmG05U08//
 m7524PddKYi9dHZIU4hfK3vNTSNypvX/KpRt5KCdD/mN4lp4gwO1VEhWnz6IcUI1cJs7
 qHeA==
X-Gm-Message-State: AOAM531qjih43vFY6O4UcApP317Zk48PxRTQgzZN9YhgSGcDoyMcrwNu
 pTHAJ2cEUX04kH7mM1b1p8s=
X-Google-Smtp-Source: ABdhPJz9jTPvPRw89uOQDcIuXo7Ms95yP431hJK8P22Ki3Hy7XJXSveRWcECqv7tjaX5FXjtLeREfw==
X-Received: by 2002:a62:dd01:0:b029:13c:f607:5fff with SMTP id
 w1-20020a62dd010000b029013cf6075fffmr15747741pff.3.1599551332557; 
 Tue, 08 Sep 2020 00:48:52 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id s67sm18580315pfs.117.2020.09.08.00.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 00:48:52 -0700 (PDT)
Date: Tue, 08 Sep 2020 17:48:46 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 02/12] powerpc: remove arguments from interrupt
 handler functions
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20200905174335.3161229-1-npiggin@gmail.com>
 <20200905174335.3161229-3-npiggin@gmail.com>
 <e34fead9-a356-3ae6-aa33-544380230bd5@csgroup.eu>
 <1599478457.27656.1.camel@po17688vm.idsi0.si.c-s.fr>
In-Reply-To: <1599478457.27656.1.camel@po17688vm.idsi0.si.c-s.fr>
MIME-Version: 1.0
Message-Id: <1599551224.3zoap14y55.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of September 7, 2020 9:34 pm:
> On Mon, 2020-09-07 at 11:20 +0200, Christophe Leroy wrote:
>>=20
>> Le 05/09/2020 =C3=A0 19:43, Nicholas Piggin a =C3=A9crit :
>> > Make interrupt handlers all just take the pt_regs * argument and load
>> > DAR/DSISR etc from that. Make those that return a value return long.
>>=20
>> I like this, it will likely simplify a bit the VMAP_STACK mess.
>>=20
>> Not sure it is that easy. My board is stuck after the start of init.
>>=20
>>=20
>> On the 8xx, on Instruction TLB Error exception, we do
>>=20
>> 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
>>=20
>> On book3s/32, on ISI exception we do:
>> 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
>>=20
>> On 40x and bookE, on ISI exception we do:
>> 	li	r5,0			/* Pass zero as arg3 */
>>=20
>>=20
>> And regs->dsisr will just contain nothing
>>=20
>> So it means we should at least write back r5 into regs->dsisr from there=
=20
>> ? The performance impact should be minimal as we already write _DAR so=20
>> the cache line should already be in the cache.
>>=20
>> A hacky 'stw r5, _DSISR(r1)' in handle_page_fault() does the trick,=20
>> allthough we don't want to do it for both ISI and DSI at the end, so=20
>> you'll have to do it in every head_xxx.S
>=20
> To get you series build and work, I did the following hacks:

Great, thanks for this.

> diff --git a/arch/powerpc/include/asm/interrupt.h
> b/arch/powerpc/include/asm/interrupt.h
> index acfcc7d5779b..c11045d3113a 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -93,7 +93,9 @@ static inline void interrupt_nmi_exit_prepare(struct
> pt_regs *regs, struct inter
>  {
>  	nmi_exit();
> =20
> +#ifdef CONFIG_PPC64
>  	this_cpu_set_ftrace_enabled(state->ftrace_enabled);
> +#endif

This seems okay, not a hack.

>  #ifdef CONFIG_PPC_BOOK3S_64
>  	/* Check we didn't change the pending interrupt mask. */
> diff --git a/arch/powerpc/kernel/entry_32.S
> b/arch/powerpc/kernel/entry_32.S
> index f4d0af8e1136..66f7adbe1076 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -663,6 +663,7 @@ ppc_swapcontext:
>   */
>  	.globl	handle_page_fault
>  handle_page_fault:
> +	stw	r5,_DSISR(r1)
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  #ifdef CONFIG_PPC_BOOK3S_32
>  	andis.  r0,r5,DSISR_DABRMATCH@h

Is this what you want to do for 32, or do you want to seperate
ISI and DSI sides?

Thanks,
Nick
