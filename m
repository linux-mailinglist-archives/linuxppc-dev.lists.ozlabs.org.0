Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8208630D0B5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 02:19:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVkPG3qxczDqNW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:19:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVMk63l1VzDqqs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 22:18:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MdAZieYX; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DVMk472jpz9sWj;
 Tue,  2 Feb 2021 22:18:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612264685;
 bh=iE+gbEP060kvP74UY/8AE3SdYXHv8DpZ3HU98j2rBPA=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=MdAZieYXTkUrkVV4Hi5KYqXPuDDnasCpzlh271BrgmtaIdLAlF5amJq3qMAzCXpt7
 6ZfntSG+HfbGGEgQ6i5S5az87Bgy709RNAgroIg+T4V9wwinaf2+/BRBsBvY57Yl21
 7kOmTHHppjnknit7zqmDskzE35bF/42NRWCejp6/HN8Hiw5E4shibyAfjReg9eVY4G
 PJafYcwoAReocdeudpyot1cdIbIlwItw/bPPWvTLP6x/+v/bSDpxGyGKGHpb5ZLt6C
 eH/EhE+/cSWyTB8UcH+lYrHIaZeUGA9BpHwGbFcX3SzaN/BMDqvLZtGoVli7GNdga/
 fFcNWUiQw4uUA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Raoni Fassina Firmino <raoni@linux.ibm.com>
Subject: Re: [PATCH] powerpc/64/signal: Fix regression in
 __kernel_sigtramp_rt64 semantics
In-Reply-To: <1612251472.a7pzsfoixm.astroid@bobo.none>
References: <20210201200505.iz46ubcizipnkcxe@work-tp>
 <1612251472.a7pzsfoixm.astroid@bobo.none>
Date: Tue, 02 Feb 2021 22:18:03 +1100
Message-ID: <875z3ad8gk.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Raoni Fassina Firmino's message of February 2, 2021 6:05 am:
>> Tested on powerpc64 and powerpc64le, with a glibc build and running the
>> affected glibc's testcase[2], inspected that glibc's backtrace() now gives
>> the correct result and gdb backtrace also keeps working as before.
>> 
>> I believe this should be backported to releases 5.9 and 5.10 as userspace
>> is affected in this releases.
>> 
>> ---- 8< ----
>
> Thanks for this, I don't know the glibc code but the kernel change seems 
> okay to me.

I turned this into an Acked-by from you.
 
>> A Change[1] in __kernel_sigtramp_rt64 VDSO and trampoline code introduced a
>> regression in the way glibc's backtrace()[2] detects the signal-handler
>> stack frame.  Apart from the practical implications, __kernel_sigtram_rt64
>> was a VDSO with the semantics that it is a function you can call from
>> userspace to end a signal handling.  Now this semantics are no longer
>> valid.
>> 
>> I believe the aforementioned change affects all releases since 5.9.
>> 
>> This patch tries to fix both the semantics and practical aspect of
>> __kernel_sigtramp_rt64 returning it to the previous code, whilst keeping
>> the intended behavior from[1] by adding a new symbol to serve as the jump
>> target from the kernel to the trampoline. Now the trampoline has two parts,
>> an new entry point and the old return point.
>> 
>> [1] commit 0138ba5783ae0dcc799ad401a1e8ac8333790df9 ("powerpc/64/signal:
>>     Balance return predictor stack in signal trampoline")
>> [2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-January/223194.html
>> 
>> Fixes: 0138ba5783ae ("powerpc/64/signal: Balance return predictor stack in signal trampoline")
>> Signed-off-by: Raoni Fassina Firmino <raoni@linux.ibm.com>
>> ---
>>  arch/powerpc/kernel/vdso64/sigtramp.S   | 9 ++++++++-
>>  arch/powerpc/kernel/vdso64/vdso64.lds.S | 2 +-
>>  2 files changed, 9 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/powerpc/kernel/vdso64/sigtramp.S b/arch/powerpc/kernel/vdso64/sigtramp.S
>> index bbf68cd01088..f0fd8d2a9fc4 100644
>> --- a/arch/powerpc/kernel/vdso64/sigtramp.S
>> +++ b/arch/powerpc/kernel/vdso64/sigtramp.S
>> @@ -15,11 +15,18 @@
>>  
>>  	.text
>>  
>> +/* __kernel_start_sigtramp_rt64 and __kernel_sigtramp_rt64 together
>> +   are one function split in two parts. The kernel jumps to the former
>> +   and the signal handler indirectly (by blr) returns to the latter.
>> +   __kernel_sigtramp_rt64 needs to point to the return address so
>> +   glibc can correctly identify the trampoline stack frame.  */
>
> Are you planning to update glibc to cope with this as well? Any idea 
> about musl? If so, including version numbers would be good (not that
> it's really a problem to carry this patch around).
>
> I was just about to ask to turn the comment into kernel style, but the
> whole file has this style so nevermind about that! :)

Yeah, copying the existing style was the right thing to do.

... but I really can't deal with that comment style so I reformatted it
to match kernel style :)

Parts of that file use two-space indents as well, the whole thing could
do with a pass through clang-format or similar one day.

cheers
