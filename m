Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F70A519F68
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 14:28:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktbhy3lrqz3bwL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 22:28:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LS9ncdRq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtbhK4Tgmz2ywH
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 22:28:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=LS9ncdRq; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KtbhG63vZz4xbN;
 Wed,  4 May 2022 22:27:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651667278;
 bh=ouXKk5oMgxpG8yCG+3NTyhx/itcH/Jtt6iFfUWfmWJ0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=LS9ncdRqBlNMm9XZ7OwBg2MysyHDOCuXoKF/meR+qEiSc6oieLNTRVK5IS8rXTdvi
 4jrXsCCmYlL0HwFDiCr7aRAmhw4nS+PxpQObst2Vp9B5t5QGzt5GH1lV+F4ONOyP+9
 1iVbZ64L0K7LdKr+14/CYt5wZU3ltaoO1NPAXpVkWmk3v2wsYfkmPp2Q/xgKrpWME8
 vjFsUElErX0LOz8QdZNFl66huEooG+2deHlR2S3moTHMEvTjGDdPBL/hQu9dhL2UEF
 50BEwFGmJHsCDhvqMhLPLbUV64uoiVD294rmdcUmB73n+GCjCwBU4XV8gOW+ngIZka
 Wew9M+lESp8iw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/vdso: Fix incorrect CFI in gettimeofday.S
In-Reply-To: <20220502142705.GU25951@gate.crashing.org>
References: <20220502125010.1319370-1-mpe@ellerman.id.au>
 <20220502142705.GU25951@gate.crashing.org>
Date: Wed, 04 May 2022 22:27:54 +1000
Message-ID: <878rrhv5x1.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, amodra@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> Hi!
>
> On Mon, May 02, 2022 at 10:50:10PM +1000, Michael Ellerman wrote:
>> As reported by Alan, the CFI (Call Frame Information) in the VDSO time
>> routines is incorrect since commit ce7d8056e38b ("powerpc/vdso: Prepare
>> for switching VDSO to generic C implementation.").
>> 
>> In particular the changes to the frame address register (r1) are not
>> properly described, which prevents gdb from being able to generate a
>> backtrace from inside VDSO functions, eg:
>
> Note that r1 is not the same as the CFA: r1 is the stack pointer, while
> the CFA is a DWARF concept.  Often (but not always) they point to the
> same thing, for us.  "When we change the stack pointer we should change
> the DWARF CFA as well"?
 
Thanks, I reworded it a bit:

    DWARF has a concept called the CFA (Canonical Frame Address), which on
    powerpc is calculated as an offset from the stack pointer (r1). That
    means when the stack pointer is changed there must be a corresponding
    CFI directive to update the calculation of the CFA.

    The current code is missing those directives for the changes to r1,
    which prevents gdb from being able to generate a backtrace from inside
    VDSO functions, eg

>> Alan helpfully describes some rules for correctly maintaining the CFI information:
>> 
>>   1) Every adjustment to the current frame address reg (ie. r1) must be
>>      described, and exactly at the instruction where r1 changes. Why?
>>      Because stack unwinding might want to access previous frames.
>>   2) If a function changes LR or any non-volatile register, the save
>>      location for those regs must be given. The cfi can be at any
>>      instruction after the saves up to the point that the reg is
>>      changed. (Exception: LR save should be described before a bl.)
>
> That isn't an exception?  bl changes the current LR after all :-)
 
As Alan mentioned the exception is the the CFI has to appear before the
bl not after, I noted that in the change log.

>>   3) If asychronous unwind info is needed then restores of LR and
>>      non-volatile regs must also be described. The cfi can be at any
>>      instruction after the reg is restored up to the point where the
>>      save location is (potentially) trashed.
>
> The general rule is that your CFI must enable a debugger to reconstruct
> the state at function entry (or it can explicitly say something has been
> clobbered), using only data available at any point in the program we are
> at now.  If something is available in multiple places (in some
> registers, somewhere in memory) either place can be used; only one such
> place is described in the CFI.  A store or even a restore does not have
> to be described at the exact spot it happens (but that is by far the
> most readable / least confusing way to do it).

Ack.

I moved the LR restore down one line, which saves one CFA_advance_loc and
is not hard on the reader.

>> --- a/arch/powerpc/kernel/vdso/gettimeofday.S
>> +++ b/arch/powerpc/kernel/vdso/gettimeofday.S
>> @@ -22,12 +22,15 @@
>>  .macro cvdso_call funct call_time=0
>>    .cfi_startproc
>>  	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
>> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
>>  	mflr		r0
>> -  .cfi_register lr, r0
>>  	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
>> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
>>  	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
>> +  .cfi_rel_offset lr, PPC_MIN_STKFRM + PPC_LR_STKOFF
>
> So you don't need to describe lr being saved in r0, because at all times
> it is available elsewhere, namely in the lr reg still, or on the stack.
> If lr could be clobbered before r0 is saved to the stack slot you would
> still need to describe r0 containing the value of lr at function entry,
> because that value then isn't available elsewhere.
>
> The patch looks good to me :-)
>
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>

Thanks.

cheers
