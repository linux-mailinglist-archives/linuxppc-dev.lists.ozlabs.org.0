Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3C230E8FD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 01:54:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWKnt1wbrzDwp5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 11:54:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWKmB4Sc0zDwnJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 11:53:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qP6mvzf+; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWKm93Kbxz9sSC;
 Thu,  4 Feb 2021 11:53:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612399994;
 bh=lVahqb4V0aVWdvgERe9J5gdpmI6Vo1BJ74xccJLurN4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qP6mvzf+t3oFnKt0xn3JuyCEIII4FnKbVq7dlCiyncX82ZyBz/1Vv/I9/wZoPg/Bb
 gCw3g8iYI8Dxh+AYMRtrtt6on/EnY+d3pE6QBw/6oLcKfKPYVkJQ/jPhHkBcm9qjBe
 Mm31y7s5vppvPGS6exzxH6+9qDLU6v9SIVmGPenpllpXNIWe0qrX64aynNhwDFG4ec
 BAlYZApbGwa26WUv0+1Fvy9mKTz9OI+MLepcOUYAR00VQcKSxyx7jThrrjIRDegbmw
 ezr7lclnOzAokWslgnp45N8sq8Ggk4sheKETI3xR5tpDwKIBFf/sa4Iu4PbibOtMJU
 gupQI8v0Y5SUg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sandipan Das <sandipan@linux.ibm.com>, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc: sstep: Fix load and update emulation
In-Reply-To: <8e675de3-51df-0711-c90c-f450a1585f65@linux.ibm.com>
References: <20210203063841.431063-1-sandipan@linux.ibm.com>
 <20210203094909.GD210@DESKTOP-TDPLP67.localdomain>
 <8e675de3-51df-0711-c90c-f450a1585f65@linux.ibm.com>
Date: Thu, 04 Feb 2021 11:53:12 +1100
Message-ID: <87sg6cpsav.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ravi.bangoria@linux.ibm.com, ananth@linux.ibm.com, jniethe5@gmail.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sandipan Das <sandipan@linux.ibm.com> writes:
> On 03/02/21 3:19 pm, Naveen N. Rao wrote:
>> [...]
>> 
>> Wouldn't it be easier to just do the below at the end? Or, am I missing something?
>> 
>> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
>> index ede093e9623472..a2d726d2a5e9d1 100644
>> --- a/arch/powerpc/lib/sstep.c
>> +++ b/arch/powerpc/lib/sstep.c
>> @@ -2980,6 +2980,10 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>>         }
>>  #endif /* CONFIG_VSX */
>> 
>> +       if (GETTYPE(op->type) == LOAD && (op->type & UPDATE) &&
>> +                       (ra == 0 || ra == rd))
>> +               goto unknown_opcode;
>> +
>>         return 0;
>> 
>>   logical_done:
>> 
>
> This looks good?
>
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index e96cff845ef7..a9c149bfd2f5 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -3017,6 +3017,21 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  
>         }
>  
> +       if (op->type & UPDATE) {
> +               if (ra == rd && GETTYPE(op->type) == LOAD)
> +                       goto unknown_opcode;
> +               else if (ra == 0)
> +                       switch(GETTYPE(op->type)) {
> +                       case LOAD:
> +                       case STORE:
> +#ifdef CONFIG_PPC_FPU
> +                       case LOAD_FP:
> +                       case STORE_FP:
> +#endif

Why make it conditional?

cheers
