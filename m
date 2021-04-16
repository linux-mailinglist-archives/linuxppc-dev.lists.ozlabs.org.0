Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4676361E22
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 12:41:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMCS75sDSz3c2g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 20:41:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dlrfmoa6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=dlrfmoa6; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMCRh4yX4z2yRF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 20:41:03 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FMCRd1BPDz9sVv;
 Fri, 16 Apr 2021 20:41:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618569661;
 bh=SeOzQ9Fg9C2zAMuj8cY5McP+aFk25PiM311deR2n+II=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dlrfmoa66rjbsgjm/6d63tAsvauWz+/zCQSBCnuup3KRzbygxslVoQS9YLGzEmxCp
 BlmJROc2q2TCvBVUIsPXowKqD3tb+ePzQL27V3dkPyfXbwzb78UU1jdjd137lpsvKm
 KRliFf+AabCTWYguQlPH0zI4TXJyjldAKamw26SoqGPY25rAGdtoTIaVkio+4Uf4L1
 SEAb53oUP9Z4uROoJLiyxDIETXgY4VU69wU0ZSnGCG4nWNO75litn3pAbksUGbd/82
 gAnYfZRakpES4+dl5kRnYehiwK32L5HnaGG6PdUlZ0kv9Tk4UjgZL+TxjgXEcebnmo
 67fGXanIuuK6g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Tony Ambardar <tony.ambardar@gmail.com>
Subject: Re: [PATCH v3] powerpc: fix EDEADLOCK redefinition error in
 uapi/asm/errno.h
In-Reply-To: <CAPGftE-Q+Q479j7SikDBQLiM+VKbpXpRYnTeEJeAHeZrh_Ok2A@mail.gmail.com>
References: <20200917000757.1232850-1-Tony.Ambardar@gmail.com>
 <20200917135437.1238787-1-Tony.Ambardar@gmail.com>
 <CAPGftE-Q+Q479j7SikDBQLiM+VKbpXpRYnTeEJeAHeZrh_Ok2A@mail.gmail.com>
Date: Fri, 16 Apr 2021 20:41:00 +1000
Message-ID: <87r1jaeclf.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 LKML <linux-kernel@vger.kernel.org>, Stable <stable@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Rosen Penev <rosenp@gmail.com>,
 bpf <bpf@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tony Ambardar <tony.ambardar@gmail.com> writes:
> Hello Michael,
>
> The latest version of this patch addressed all feedback I'm aware of
> when submitted last September, and I've seen no further comments from
> reviewers since then.
>
> Could you please let me know where this stands and if anything further
> is needed?

Sorry, it's still sitting in my inbox :/

I was going to reply to suggest we split the tools change out. The
headers under tools are usually updated by another maintainer, I think
it might even be scripted.

Anyway I've applied your patch and done that (dropped the change to
tools/.../errno.h), which should also mean the stable backport is more
likely to work automatically.

It will hit mainline in v5.13-rc1 and then be backported to the stable
trees.

I don't think you actually need the tools version of the header updated
to fix your bug? In which case we can probably just wait for it to be
updated automatically when the tools headers are sync'ed with the kernel
versions.

cheers


> On Thu, 17 Sept 2020 at 06:54, Tony Ambardar <tony.ambardar@gmail.com> wrote:
>>
>> A few archs like powerpc have different errno.h values for macros
>> EDEADLOCK and EDEADLK. In code including both libc and linux versions of
>> errno.h, this can result in multiple definitions of EDEADLOCK in the
>> include chain. Definitions to the same value (e.g. seen with mips) do
>> not raise warnings, but on powerpc there are redefinitions changing the
>> value, which raise warnings and errors (if using "-Werror").
>>
>> Guard against these redefinitions to avoid build errors like the following,
>> first seen cross-compiling libbpf v5.8.9 for powerpc using GCC 8.4.0 with
>> musl 1.1.24:
>>
>>   In file included from ../../arch/powerpc/include/uapi/asm/errno.h:5,
>>                    from ../../include/linux/err.h:8,
>>                    from libbpf.c:29:
>>   ../../include/uapi/asm-generic/errno.h:40: error: "EDEADLOCK" redefined [-Werror]
>>    #define EDEADLOCK EDEADLK
>>
>>   In file included from toolchain-powerpc_8540_gcc-8.4.0_musl/include/errno.h:10,
>>                    from libbpf.c:26:
>>   toolchain-powerpc_8540_gcc-8.4.0_musl/include/bits/errno.h:58: note: this is the location of the previous definition
>>    #define EDEADLOCK       58
>>
>>   cc1: all warnings being treated as errors
>>
>> CC: Stable <stable@vger.kernel.org>
>> Reported-by: Rosen Penev <rosenp@gmail.com>
>> Signed-off-by: Tony Ambardar <Tony.Ambardar@gmail.com>
>> ---
>> v1 -> v2:
>>  * clean up commit description formatting
>>
>> v2 -> v3: (per Michael Ellerman)
>>  * drop indeterminate 'Fixes' tags, request stable backports instead
>> ---
>>  arch/powerpc/include/uapi/asm/errno.h       | 1 +
>>  tools/arch/powerpc/include/uapi/asm/errno.h | 1 +
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/arch/powerpc/include/uapi/asm/errno.h b/arch/powerpc/include/uapi/asm/errno.h
>> index cc79856896a1..4ba87de32be0 100644
>> --- a/arch/powerpc/include/uapi/asm/errno.h
>> +++ b/arch/powerpc/include/uapi/asm/errno.h
>> @@ -2,6 +2,7 @@
>>  #ifndef _ASM_POWERPC_ERRNO_H
>>  #define _ASM_POWERPC_ERRNO_H
>>
>> +#undef EDEADLOCK
>>  #include <asm-generic/errno.h>
>>
>>  #undef EDEADLOCK
>> diff --git a/tools/arch/powerpc/include/uapi/asm/errno.h b/tools/arch/powerpc/include/uapi/asm/errno.h
>> index cc79856896a1..4ba87de32be0 100644
>> --- a/tools/arch/powerpc/include/uapi/asm/errno.h
>> +++ b/tools/arch/powerpc/include/uapi/asm/errno.h
>> @@ -2,6 +2,7 @@
>>  #ifndef _ASM_POWERPC_ERRNO_H
>>  #define _ASM_POWERPC_ERRNO_H
>>
>> +#undef EDEADLOCK
>>  #include <asm-generic/errno.h>
>>
>>  #undef EDEADLOCK
>> --
>> 2.25.1
>>
