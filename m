Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DA918ABDB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 05:37:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jYzx4yM9zDqyZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 15:37:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jY8l0gZSzDr6f
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 15:00:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=p7pitOs8; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48jY8j20fYz9sPk; Thu, 19 Mar 2020 15:00:21 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48jY8h0SJFz9sPF;
 Thu, 19 Mar 2020 15:00:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584590420;
 bh=9wx1NLy6m5RpEPHePuI00IK9MMIShCWZkgfj4hiQWMA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=p7pitOs8CvfrQKLb3aV9cxqUbE4Mb3nt8QdsxHHwZLM19PGC6tN3bWPKonycbHz4a
 I3IIznOJOOOklgJSxutzVYayV1ZPo045LCcG5ys+h610RtkyncG0aS+WXX9/M5NPxj
 B4lOWZVWvxSIAo8HwUVMc7Lh8NCPWkuDmIw3UjAsdxSk/JQiaW+XuMO7uY9T9C0rgT
 MT3NzDshb6R8SFZul99sHdS/Mo+I6ex9XRODoDTuwKh2tJm6NFFwkLU1VnH7s2deQg
 MoUQqRvA2AHjvGVjNovT5YXTORAZJhB4cS3X2DoBxupVyL7V1cxFJjfD9zvMRCOg3g
 dm41WrkXrh6Cw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v5 2/2] powerpc/64: Prevent stack protection in early boot
In-Reply-To: <87wo7hn8az.fsf@dja-thinkpad.axtens.net>
References: <20200316124421.99211-1-mpe@ellerman.id.au>
 <20200316124421.99211-2-mpe@ellerman.id.au>
 <87wo7hn8az.fsf@dja-thinkpad.axtens.net>
Date: Thu, 19 Mar 2020 15:00:18 +1100
Message-ID: <87eetpdmel.fsf@mpe.ellerman.id.au>
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>
>> The previous commit reduced the amount of code that is run before we
>> setup a paca. However there are still a few remaining functions that
>> run with no paca, or worse, with an arbitrary value in r13 that will
>> be used as a paca pointer.
>>
>> In particular the stack protector canary is stored in the paca, so if
>> stack protector is activated for any of these functions we will read
>> the stack canary from wherever r13 points. If r13 happens to point
>> outside of memory we will get a machine check / checkstop.
>>
>> For example if we modify initialise_paca() to trigger stack
>> protection, and then boot in the mambo simulator with r13 poisoned in
>> skiboot before calling the kernel:
>>
>>   DEBUG: 19952232: (19952232): INSTRUCTION: PC=0xC0000000191FC1E8: [0x3C4C006D]: addis   r2,r12,0x6D [fetch]
>>   DEBUG: 19952236: (19952236): INSTRUCTION: PC=0xC00000001807EAD8: [0x7D8802A6]: mflr    r12 [fetch]
>>   FATAL ERROR: 19952276: (19952276): Check Stop for 0:0: Machine Check with ME bit of MSR off
>>   DEBUG: 19952276: (19952276): INSTRUCTION: PC=0xC0000000191FCA7C: [0xE90D0CF8]: ld      r8,0xCF8(r13) [Instruction Failed]
>>   INFO: 19952276: (19952277): ** Execution stopped: Mambo Error, Machine Check Stop,  **
>>   systemsim % bt
>>   pc:                             0xC0000000191FCA7C      initialise_paca+0x54
>>   lr:                             0xC0000000191FC22C      early_setup+0x44
>>   stack:0x00000000198CBED0        0x0     +0x0
>>   stack:0x00000000198CBF00        0xC0000000191FC22C      early_setup+0x44
>>   stack:0x00000000198CBF90        0x1801C968      +0x1801C968
>>
>> So annotate the relevant functions to ensure stack protection is never
>> enabled for them.
>
> This all makes sense to me, although I don't really understand the stack
> protector especially well.

The key details for this bug are that 1) some functions get stack
protection, if they have on-stack buffers etc. 2) that stack protection
involves reading a canary from the paca.


> I have checked and I can find no other C functions that are called
> before early_setup.

Thanks.

Except for all of prom_init.c but that's already built with no stack
protector.

> Do we need to do add setup_64.c to the part of the Makefile that
> disables tracing of early boot?
>
> ifdef CONFIG_FUNCTION_TRACER
> # Do not trace early boot code
> CFLAGS_REMOVE_cputable.o = $(CC_FLAGS_FTRACE)
> CFLAGS_REMOVE_prom_init.o = $(CC_FLAGS_FTRACE)
> CFLAGS_REMOVE_btext.o = $(CC_FLAGS_FTRACE)
> CFLAGS_REMOVE_prom.o = $(CC_FLAGS_FTRACE)
> -> should we add setup_64.c here?
> endif

No I don't think so.

Tracing is less of a concern during very early boot because although the
functions may be built to support tracing, you can't actually turn
tracing *on* that early.

Also setup_64.c is not purely early boot code, there are some functions
in there we would like to be able to trace.

As I was saying the other day, we may want to create a specific
directory (or file) for all the really early boot code where we turn off
all special options like tracing, kcov, stack protector etc.

cheers
