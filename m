Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CB835A95E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 02:05:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHFd63743z3c1V
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 10:05:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=F3EPpP2A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=F3EPpP2A; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHFcf48T4z30CS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Apr 2021 10:05:05 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FHFcS3gNBz9sW4;
 Sat, 10 Apr 2021 10:04:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618013099;
 bh=0UpzDyN9WxIPWbZ5xFLUOA/9nu8DvdJ3YDveQaB65Lw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=F3EPpP2Ar/DYclLcROCWkVY7jkokRFDxbTVhGUC/mRVYPDfYPLoaI48lWsMEp8Tan
 ABXD1uyDYlZkFEhjIHk+9/dW1vIcqF2X3J82j9R1v3XolWcXozlbXHbhGA5tTIWKs0
 8PDpWyLcDxelKxnJAcdaLnx/tdzbMiBtckdiKlqTOAASAeeHnuKaj6c+dqV/7M4six
 tWDygLG64Wttb5SpPfb1D9HaDZTqNl+S4vccn1VNlesVLfqS6Ek/XZ70HzgByCtw7D
 zE9x/7L/sfVCSq6vY0mcj6MUQe66LtM4ySAzs7g3XNxRdAkfxBmnvUuY1eS7NnjGjF
 X5I1woWwgLFnQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Xiongwei Song
 <sxwjean@me.com>, benh@kernel.crashing.org, paulus@samba.org,
 oleg@redhat.com, npiggin@gmail.com, aneesh.kumar@linux.ibm.com,
 ravi.bangoria@linux.ibm.com, mikey@neuling.org, haren@linux.ibm.com,
 akpm@linux-foundation.org, rppt@kernel.org, jniethe5@gmail.com,
 atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, peterz@infradead.org,
 kjain@linux.ibm.com, kan.liang@linux.intel.com, aik@ozlabs.ru,
 alistair@popple.id.au, pmladek@suse.com, john.ogness@linutronix.de
Subject: Re: [PATCH v3] powerpc/traps: Enhance readability for trap types
In-Reply-To: <70ece993-12bd-335c-d246-914564eb51dd@csgroup.eu>
References: <20210408140750.26832-1-sxwjean@me.com>
 <70ece993-12bd-335c-d246-914564eb51dd@csgroup.eu>
Date: Sat, 10 Apr 2021 10:04:49 +1000
Message-ID: <874kgfdmxq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Xiongwei Song <sxwjean@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 08/04/2021 =C3=A0 16:07, Xiongwei Song a =C3=A9crit=C2=A0:
>> From: Xiongwei Song <sxwjean@gmail.com>
>>=20
>> Create a new header named traps.h, define macros to list ppc interrupt
>> types in traps.h, replace the reference of the trap hex values with these
>> macros.
...
>> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include=
/asm/interrupt.h
>> index 7c633896d758..5ce9898bc9a6 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -8,6 +8,7 @@
>>   #include <asm/ftrace.h>
>>   #include <asm/kprobes.h>
>>   #include <asm/runlatch.h>
>> +#include <asm/traps.h>
>>=20=20=20
>>   struct interrupt_state {
>>   #ifdef CONFIG_PPC_BOOK3E_64
>> @@ -59,7 +60,7 @@ static inline void interrupt_enter_prepare(struct pt_r=
egs *regs, struct interrup
>>   		 * CT_WARN_ON comes here via program_check_exception,
>>   		 * so avoid recursion.
>>   		 */
>> -		if (TRAP(regs) !=3D 0x700)
>> +		if (TRAP(regs) !=3D INTERRUPT_PROGRAM)
>>   			CT_WARN_ON(ct_state() !=3D CONTEXT_KERNEL);
>>   	}
>>   #endif
>> @@ -156,7 +157,8 @@ static inline void interrupt_nmi_enter_prepare(struc=
t pt_regs *regs, struct inte
>>   	/* Don't do any per-CPU operations until interrupt state is fixed */
>>   #endif
>>   	/* Allow DEC and PMI to be traced when they are soft-NMI */
>> -	if (TRAP(regs) !=3D 0x900 && TRAP(regs) !=3D 0xf00 && TRAP(regs) !=3D =
0x260) {
>> +	if (TRAP(regs) !=3D INTERRUPT_DECREMENTER &&
>> +	    TRAP(regs) !=3D INTERRUPT_PERFMON) {
>
> I think too long names hinder readability, see later for suggestions.

I asked for the longer names :)

I think they make it easier for people who are less familiar with the
architecture than us to make sense of the names.

And there's only a couple of cases where it requires splitting a line,
and they could be converted to use switch if we think it's a problem.

>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>> index 0c0b1c2cfb49..641b3feef7ee 100644
>> --- a/arch/powerpc/mm/fault.c
>> +++ b/arch/powerpc/mm/fault.c
>> @@ -588,20 +589,24 @@ void __bad_page_fault(struct pt_regs *regs, int si=
g)
>>   	/* kernel has accessed a bad area */
>>=20=20=20
>>   	switch (TRAP(regs)) {
>> -	case 0x300:
>> -	case 0x380:
>> -	case 0xe00:
>> +	case INTERRUPT_DATA_STORAGE:
>> +#ifdef CONFIG_PPC_BOOK3S
>> +	case INTERRUPT_DATA_SEGMENT:
>> +	case INTERRUPT_H_DATA_STORAGE:
>> +#endif
>
> It would be better to avoid #ifdefs when none where necessary before.

Yes I agree.

I think these can all be avoided by defining most of the values
regardless of what platform we're building for. Only the values that
overlap need to be kept behind an ifdef.

cheers
