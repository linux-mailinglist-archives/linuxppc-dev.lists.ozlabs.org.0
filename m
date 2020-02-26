Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E95F016FF56
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 13:51:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SFzW0N83zDqBH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 23:51:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=kNbLyoSC; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SDzw3scgzDqP5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 23:06:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48SDzq5Z9mz9txW2;
 Wed, 26 Feb 2020 13:06:31 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=kNbLyoSC; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id q2WOI2UxJZVp; Wed, 26 Feb 2020 13:06:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48SDzq4WvRz9txVB;
 Wed, 26 Feb 2020 13:06:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582718791; bh=c8Yt1n514JUBCOQI8K1Iwqa23w30mCl6+9N4bJ38+Hg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kNbLyoSCp2Ltuz7qDC8CBgShOpBF8Awf8dOfICPGOIUAg4M+NIiEaQwVYjvDr9Mvh
 KVC94sHpRDPJMN5MuOdHg1sWgwGdXYPZGarBcTmDE8ZdNP3oKXmA680G5I0fMTBJZL
 OLz5wpGkVQ1clphazcc2iqm9QSS/4/BNMtCex/1g=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A88388B845;
 Wed, 26 Feb 2020 13:06:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eXlx6v64ng-r; Wed, 26 Feb 2020 13:06:32 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 227B98B776;
 Wed, 26 Feb 2020 13:06:32 +0100 (CET)
Subject: Re: [RFC PATCH v2 02/12] powerpc/ptrace: drop unnecessary #ifdefs
 CONFIG_PPC64
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, mikey@neuling.org
References: <cover.1561735587.git.christophe.leroy@c-s.fr>
 <34af3942cd27f6b5365caae772fb8e0af44763d5.1561735587.git.christophe.leroy@c-s.fr>
 <878sks1csl.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <66e65eec-ce09-4e7e-aa71-38d19b3d4fee@c-s.fr>
Date: Wed, 26 Feb 2020 13:06:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <878sks1csl.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/02/2020 à 11:48, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> Drop a bunch of #ifdefs CONFIG_PPC64 that are not vital.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/include/asm/ptrace.h      |  9 ++++-----
>>   arch/powerpc/include/uapi/asm/ptrace.h | 12 ++++--------
>>   arch/powerpc/kernel/ptrace/ptrace.c    | 24 +++---------------------
>>   3 files changed, 11 insertions(+), 34 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
>> index faa5a338ac5a..1506a9c61d50 100644
>> --- a/arch/powerpc/include/asm/ptrace.h
>> +++ b/arch/powerpc/include/asm/ptrace.h
>> @@ -36,11 +36,10 @@ struct pt_regs
>>   			unsigned long link;
>>   			unsigned long xer;
>>   			unsigned long ccr;
>> -#ifdef CONFIG_PPC64
>> -			unsigned long softe;
>> -#else
>> -			unsigned long mq;
>> -#endif
>> +			union {
>> +				unsigned long softe;
>> +				unsigned long mq;
>> +			};
>>   			unsigned long trap;
>>   			unsigned long dar;
>>   			unsigned long dsisr;
>> diff --git a/arch/powerpc/include/uapi/asm/ptrace.h b/arch/powerpc/include/uapi/asm/ptrace.h
>> index f5f1ccc740fc..37d7befbb8dc 100644
>> --- a/arch/powerpc/include/uapi/asm/ptrace.h
>> +++ b/arch/powerpc/include/uapi/asm/ptrace.h
>> @@ -43,12 +43,11 @@ struct pt_regs
>>   	unsigned long link;
>>   	unsigned long xer;
>>   	unsigned long ccr;
>> -#ifdef __powerpc64__
>> -	unsigned long softe;		/* Soft enabled/disabled */
>> -#else
>> -	unsigned long mq;		/* 601 only (not used at present) */
>> +	union {
>> +		unsigned long softe;	/* Soft enabled/disabled */
>> +		unsigned long mq;	/* 601 only (not used at present) */
>>   					/* Used on APUS to hold IPL value. */
>> -#endif
>> +	};
> 
> As Andreas pointed out this is not safe as this is a uapi header.

Ok, dropped

> 
>>   	unsigned long trap;		/* Reason for being here */
>>   	/* N.B. for critical exceptions on 4xx, the dar and dsisr
>>   	   fields are overloaded to hold srr0 and srr1. */
>> @@ -105,11 +104,8 @@ struct pt_regs
>>   #define PT_LNK	36
>>   #define PT_XER	37
>>   #define PT_CCR	38
>> -#ifndef __powerpc64__
>>   #define PT_MQ	39
>> -#else
>>   #define PT_SOFTE 39
>> -#endif
> 
> I'd also rather leave that as it is.
> 
> There's a slim chance it could break some code that already has either
> of those defined.
> 
> If you need them both defined to make other code work in the kernel
> that's fine, in the kernel header we can do:
> 
> // Ensure these are always defined inside the kernel to avoid #ifdefs
> #ifdef CONFIG_PPC64
> #define PT_MQ	39
> #else
> #define PT_SOFTE 39
> #endif

Ok.

Only the PT_SOFTE is missing, I added the following in the relevant case:

#define PT_SOFTE PT_MQ

> 
> 
>>   #define PT_TRAP	40
>>   #define PT_DAR	41
>>   #define PT_DSISR 42
>> diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
>> index 684b0b315c32..0afb223c4d57 100644
>> --- a/arch/powerpc/kernel/ptrace/ptrace.c
>> +++ b/arch/powerpc/kernel/ptrace/ptrace.c
>> @@ -113,11 +113,8 @@ static const struct pt_regs_offset regoffset_table[] = {
>>   	REG_OFFSET_NAME(link),
>>   	REG_OFFSET_NAME(xer),
>>   	REG_OFFSET_NAME(ccr),
>> -#ifdef CONFIG_PPC64
>>   	REG_OFFSET_NAME(softe),
>> -#else
>>   	REG_OFFSET_NAME(mq),
>> -#endif
> 
> Pretty sure that will cause breakage. The offset is ABI.

Ok, dropped

Christophe
