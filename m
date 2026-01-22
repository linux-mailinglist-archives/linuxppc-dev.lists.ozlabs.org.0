Return-Path: <linuxppc-dev+bounces-16144-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCIdDKEKcmmOagAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16144-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 12:31:45 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A123B6606B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 12:31:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxf6500Bhz2ySb;
	Thu, 22 Jan 2026 22:31:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769081500;
	cv=none; b=h3xnxPuM67qON98HMH0jjVtSyXw2X29aYgarfpDYgBDJIAOe7EKnOd/OkhX/HRkBaKfiH0dTli8l98HytM2XrWAXKpasm0gsQRUDpaYxmco6uDeVBYydu0tcVcmj4ihm8NquzmayvGY9+Ny1IkDl5//Mh5kk5nSQ1lokBQHbY+Se3Y1qpNADvmZvNZFBZkT3Yg2pO8LRYKrjRyGuRzVEacPUI2e1iffIOyZwk/3+wzoR3c+pA3MO+Z7UNys4xr/bBlO7uOBBVzzurQJmc4X0gnXbDxom8+kIwZdHQnWD+05vXLfh0xLBfac//qNHF+44mdQkB1VwnFDLh7dsA/w6sA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769081500; c=relaxed/relaxed;
	bh=H+4NdDcV9uCPCPv0bYcrlhexLMS+ohw/vJK7qIPW550=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZuQMp4XppBn1CqZ7rPbVWlMDe5eNrfMwh/43DIFQNWvDbSAwoKKOYBw+8JT40FPitmka5p8twwzH8gDWbVFQRMDaMN5L3A1p8a2BIUwPX1Q3I16T296UI9/2FWIv5pyyBApIT78C7TYXjBvApbTKKWVNMVRbrfbhVw/dig0Xz0KAbetyIpLwNtQihlU6B8U/RrZYwlMkYEfp3185zz+pYJOZJCKk/JYg+Xq1jEU6ogz7shb9rO3gB4XwdB7ay0BDE9dv6IQg0pO+cGbYolea4+ehDrWY/HKVm9hIHDGKhHpHUkFW7a0XmelEFoP7/Dw5wG21jrWV/BQb+Nnwi8lfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WGj7t5Y1; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WGj7t5Y1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxf635drnz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 22:31:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 356C6600C3;
	Thu, 22 Jan 2026 11:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F268C116D0;
	Thu, 22 Jan 2026 11:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769081496;
	bh=OpGGQWT0XPKl69eoDNr8As07A43eHYDAvpc87C1/HfU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WGj7t5Y1DyO1H33Iu9GXzHRiGoYIc9lr2LwzW90WdSqPbKgLzU6ADPPn5AMh5X/HO
	 buQb35VqrDEnRaRijnUZDohoFmDt3C9H73JmRXAHqPnvbS2jjaX/APeQMfhJ/Gtx/d
	 dav/tBXTb1Qrbo4QmekQrRWVykPH8XZ/LyhwDVw4AKGXZXZTGqXokhqxe7iLBkAjX7
	 JgG5MZSSEcAqDdzWybIAUpGReVuJIhv0PHpDPdlqVZ+y9GGfZKGdYYn3torny3vqjA
	 hIXg3cMnoMKSYn3OXmYVhaErffRuyg8G/X33+cU4dcsBeNW0oEy9Ixjta8TNkiZgBV
	 8W+HHFKaIrWbQ==
Message-ID: <6cb02dc1-bbaa-46e6-ace6-15698bc139e1@kernel.org>
Date: Thu, 22 Jan 2026 12:31:32 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/vdso: Provide clock_getres_time64()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>,
 "npiggin@gmail.com" <npiggin@gmail.com>, "luto@kernel.org"
 <luto@kernel.org>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
 "tglx@kernel.org" <tglx@kernel.org>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "vincenzo.frascino@arm.com"
 <vincenzo.frascino@arm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260114-vdso-powerpc-align-v1-1-acf09373d568@linutronix.de>
 <f45316f65a46da638b3c6aa69effd8980e6677b9.camel@siemens.com>
 <20260122104257-3124dc96-5916-4d25-bbce-9b868b30ee18@linutronix.de>
 <f0bee121-41cc-4162-8c02-2b279f54c11f@kernel.org>
 <20260122114217-79f13c16-0931-4c33-b68c-08e884a26004@linutronix.de>
 <230c749f-ebd6-4829-93ee-601d88000a45@kernel.org>
 <20260122120333-59de004f-2273-49d2-ae93-eb3abe498ab1@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260122120333-59de004f-2273-49d2-ae93-eb3abe498ab1@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16144-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[siemens.com,gmail.com,kernel.org,linux.ibm.com,ellerman.id.au,arm.com,lists.ozlabs.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:alexander.sverdlin@siemens.com,m:npiggin@gmail.com,m:luto@kernel.org,m:maddy@linux.ibm.com,m:tglx@kernel.org,m:mpe@ellerman.id.au,m:vincenzo.frascino@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:url,linutronix.de:email]
X-Rspamd-Queue-Id: A123B6606B
X-Rspamd-Action: no action



Le 22/01/2026 à 12:07, Thomas Weißschuh a écrit :
> On Thu, Jan 22, 2026 at 11:58:04AM +0100, Christophe Leroy (CS GROUP) wrote:
>>
>>
>> Le 22/01/2026 à 11:49, Thomas Weißschuh a écrit :
>>> On Thu, Jan 22, 2026 at 11:27:43AM +0100, Christophe Leroy (CS GROUP) wrote:
>>>> Hi Thomas,
>>>>
>>>> Le 22/01/2026 à 10:50, Thomas Weißschuh a écrit :
>>>>> Hi Alexander,
>>>>>
>>>>> On Thu, Jan 22, 2026 at 09:39:09AM +0000, Sverdlin, Alexander wrote:
>>>>>> Hi Thomas, Christophe,
>>>>>>
>>>>>> On Wed, 2026-01-14 at 08:26 +0100, Thomas Weißschuh wrote:
>>>>>>> For consistency with __vdso_clock_gettime64() there should also be a
>>>>>>> 64-bit variant of clock_getres(). This will allow the extension of
>>>>>>> CONFIG_COMPAT_32BIT_TIME to the vDSO and finally the removal of 32-bit
>>>>>>> time types from the kernel and UAPI.
>>>>>>>
>>>>>>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>>>>>>
>>>>>> I've bisected this patch to cause the following build failure on my side:
>>>>>>
>>>>>>      LDS     arch/powerpc/kernel/vdso/vdso32.lds
>>>>>>      VDSO32A arch/powerpc/kernel/vdso/sigtramp32-32.o
>>>>>>      VDSO32A arch/powerpc/kernel/vdso/gettimeofday-32.o
>>>>>>      VDSO32A arch/powerpc/kernel/vdso/datapage-32.o
>>>>>>      VDSO32A arch/powerpc/kernel/vdso/cacheflush-32.o
>>>>>>      VDSO32A arch/powerpc/kernel/vdso/note-32.o
>>>>>>      VDSO32A arch/powerpc/kernel/vdso/getcpu-32.o
>>>>>>      VDSO32A arch/powerpc/kernel/vdso/getrandom-32.o
>>>>>>      VDSO32A arch/powerpc/kernel/vdso/vgetrandom-chacha-32.o
>>>>>>      VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
>>>>>>      VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
>>>>>>      VDSO32A arch/powerpc/kernel/vdso/crtsavres-32.o
>>>>>>      VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
>>>>>> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supported
>>>>>> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
>>>>>> make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
>>>>>
>>>>> Thanks for the report!
>>>>>
>>>>>> Does it ring any bells? What could I try/test?
>>>>>
>>>>> Not immediately, but I'll look into it.
>>>>>
>>>>>> I'm using gcc-15.2.0 and binutils 2.45.1.
>>>>>
>>>>> Is this a toolchain from https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcdn.kernel.org%2Fpub%2Ftools%2Fcrosstool%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C7f1accdfc7ef4d8ea82c08de59a664b8%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639046768343248286%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=7WB%2FCB2ZDhP9bD0GYwEftyRwfDCoRwuQ5uMA98JhfmE%3D&reserved=0 ?
>>>>> Could you also share your configuration?
>>>>
>>>> I've just been able to reproduce it with ppc64_defconfig +
>>>> CONFIG_CC_OPTIMIZE_FOR_SIZE
>>>
>>> Thanks for the hint, no I can reproduce it, too.
>>>>
>>>>     VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
>>>> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not
>>>> supported
>>>> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79:
>>>> arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
>>>> make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
>>>> make: *** [Makefile:248: __sub-make] Error 2
>>>>
>>>> I'll investigate
>>>
>>> It seems the compiler decides to call memset(), which is not valid from the
>>> vDSO. We are are using -ffreestanding. Disabling CONFIG_INIT_STACK_ALL_ZERO
>>> fixes the issue. So I guess we should a) figure out why -ffreestanding does
>>> not seem to work here and b) exclude the vDSO from the stack initialization
>>> logic.
>>>
>>
>> Ah, ok.
>>
>> Reminds me commit b91c8c42ffdd ("lib/vdso: Force inlining of
>> __cvdso_clock_gettime_common()")
> 
> Good pointer.
> 
>> Problem fixed with:
>>
>> diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
>> index 95df0153f05ab..4399e143d43a5 100644
>> --- a/lib/vdso/gettimeofday.c
>> +++ b/lib/vdso/gettimeofday.c
>> @@ -421,7 +421,7 @@ static __maybe_unused __kernel_old_time_t
>> __cvdso_time(__kernel_old_time_t *time
>>   #endif /* VDSO_HAS_TIME */
>>
>>   #ifdef VDSO_HAS_CLOCK_GETRES
>> -static __maybe_unused
>> +static __always_inline
>>   bool __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t
>> clock,
>>   				 struct __kernel_timespec *res)
>>   {
> 
> Do you want to run the measurements for this one, too and submit a fix?
> This should get us past the immediate breakage.

I'm travelling at the moment and won't be able to come with measurement 
before next month. But the performance degradation is obvious.

With the fix, the function is stackless:

00000728 <__c_kernel_clock_getres>:
  728:	28 03 00 17 	cmplwi  r3,23
  72c:	41 81 00 50 	bgt     77c <__c_kernel_clock_getres+0x54>
  730:	81 45 00 04 	lwz     r10,4(r5)
  734:	6d 49 80 00 	xoris   r9,r10,32768
  738:	2c 09 ff ff 	cmpwi   r9,-1
  73c:	40 82 00 08 	bne     744 <__c_kernel_clock_getres+0x1c>
  740:	3c a5 00 01 	addis   r5,r5,1
  744:	39 20 00 01 	li      r9,1
  748:	7d 29 18 30 	slw     r9,r9,r3
  74c:	71 2a 08 93 	andi.   r10,r9,2195
  750:	41 82 00 18 	beq     768 <__c_kernel_clock_getres+0x40>
  754:	81 25 08 c8 	lwz     r9,2248(r5)
  758:	2c 04 00 00 	cmpwi   r4,0
  75c:	40 82 00 40 	bne     79c <__c_kernel_clock_getres+0x74>
  760:	38 60 00 00 	li      r3,0
  764:	4e 80 00 20 	blr
  768:	71 2a 00 60 	andi.   r10,r9,96
  76c:	40 82 00 24 	bne     790 <__c_kernel_clock_getres+0x68>
  770:	75 29 00 ff 	andis.  r9,r9,255
  774:	39 20 00 01 	li      r9,1
  778:	40 82 ff e0 	bne     758 <__c_kernel_clock_getres+0x30>
  77c:	38 00 00 f7 	li      r0,247
  780:	44 00 00 02 	sc
  784:	40 e3 00 08 	bns+    78c <__c_kernel_clock_getres+0x64>
  788:	7c 63 00 d0 	neg     r3,r3
  78c:	4e 80 00 20 	blr
  790:	3d 20 00 0f 	lis     r9,15
  794:	61 29 42 40 	ori     r9,r9,16960
  798:	4b ff ff c0 	b       758 <__c_kernel_clock_getres+0x30>
  79c:	39 40 00 00 	li      r10,0
  7a0:	91 24 00 04 	stw     r9,4(r4)
  7a4:	91 44 00 00 	stw     r10,0(r4)
  7a8:	4b ff ff b8 	b       760 <__c_kernel_clock_getres+0x38>

Without the fix, see below, __c_kernel_clock_getres() has to setup a 
stack in order to call __cvdso_clock_getres_common(), and in addition we 
see that __cvdso_clock_getres_common() is more or less the same size as 
__c_kernel_clock_getres() above, so time increase unquestionable.

00000000 <__cvdso_clock_getres_common>:
    0:	28 04 00 17 	cmplwi  r4,23
    4:	41 81 00 8c 	bgt     90 <__cvdso_clock_getres_common+0x90>
    8:	81 43 00 04 	lwz     r10,4(r3)
    c:	6d 49 80 00 	xoris   r9,r10,32768
   10:	2c 09 ff ff 	cmpwi   r9,-1
   14:	40 82 00 08 	bne     1c <__cvdso_clock_getres_common+0x1c>
   18:	3c 63 00 01 	addis   r3,r3,1
   1c:	39 20 00 01 	li      r9,1
   20:	7d 24 20 30 	slw     r4,r9,r4
   24:	70 89 08 93 	andi.   r9,r4,2195
   28:	41 82 00 34 	beq     5c <__cvdso_clock_getres_common+0x5c>
   2c:	81 23 08 c8 	lwz     r9,2248(r3)
   30:	39 40 00 00 	li      r10,0
   34:	2c 05 00 00 	cmpwi   r5,0
   38:	41 82 00 1c 	beq     54 <__cvdso_clock_getres_common+0x54>
   3c:	38 c0 00 00 	li      r6,0
   40:	38 e0 00 00 	li      r7,0
   44:	91 45 00 08 	stw     r10,8(r5)
   48:	91 25 00 0c 	stw     r9,12(r5)
   4c:	90 c5 00 00 	stw     r6,0(r5)
   50:	90 e5 00 04 	stw     r7,4(r5)
   54:	38 60 00 01 	li      r3,1
   58:	48 00 00 20 	b       78 <__cvdso_clock_getres_common+0x78>
   5c:	70 89 00 60 	andi.   r9,r4,96
   60:	40 82 00 20 	bne     80 <__cvdso_clock_getres_common+0x80>
   64:	74 84 00 ff 	andis.  r4,r4,255
   68:	38 60 00 00 	li      r3,0
   6c:	39 40 00 00 	li      r10,0
   70:	39 20 00 01 	li      r9,1
   74:	40 82 ff c0 	bne     34 <__cvdso_clock_getres_common+0x34>
   78:	54 63 07 fe 	clrlwi  r3,r3,31
   7c:	4e 80 00 20 	blr
   80:	3d 20 00 0f 	lis     r9,15
   84:	39 40 00 00 	li      r10,0
   88:	61 29 42 40 	ori     r9,r9,16960
   8c:	4b ff ff a8 	b       34 <__cvdso_clock_getres_common+0x34>
   90:	38 60 00 00 	li      r3,0
   94:	4b ff ff e4 	b       78 <__cvdso_clock_getres_common+0x78>

000007c0 <__c_kernel_clock_getres>:
  7c0:	94 21 ff d0 	stwu    r1,-48(r1)
  7c4:	7c 08 02 a6 	mflr    r0
  7c8:	bf a1 00 24 	stmw    r29,36(r1)
  7cc:	7c 7e 1b 78 	mr      r30,r3
  7d0:	7c bd 2b 78 	mr      r29,r5
  7d4:	7c 9f 23 78 	mr      r31,r4
  7d8:	38 a0 00 10 	li      r5,16
  7dc:	90 01 00 34 	stw     r0,52(r1)
  7e0:	38 80 00 00 	li      r4,0
  7e4:	38 61 00 08 	addi    r3,r1,8
  7e8:	48 00 00 01 	bl      7e8 <__c_kernel_clock_getres+0x28>
			7e8: R_PPC_REL24	memset
  7ec:	7f c4 f3 78 	mr      r4,r30
  7f0:	7f a3 eb 78 	mr      r3,r29
  7f4:	38 a1 00 08 	addi    r5,r1,8
  7f8:	4b ff f8 09 	bl      0 <__cvdso_clock_getres_common>
  7fc:	2c 03 00 00 	cmpwi   r3,0
  800:	40 82 00 24 	bne     824 <__c_kernel_clock_getres+0x64>
  804:	38 00 00 f7 	li      r0,247
  808:	7f c3 f3 78 	mr      r3,r30
  80c:	7f e4 fb 78 	mr      r4,r31
  810:	44 00 00 02 	sc
  814:	40 e3 00 08 	bns+    81c <__c_kernel_clock_getres+0x5c>
  818:	7c 63 00 d0 	neg     r3,r3
  81c:	39 61 00 30 	addi    r11,r1,48
  820:	48 00 00 00 	b       820 <__c_kernel_clock_getres+0x60>
			820: R_PPC_REL24	_restgpr_29_x
  824:	2c 1f 00 00 	cmpwi   r31,0
  828:	41 82 00 14 	beq     83c <__c_kernel_clock_getres+0x7c>
  82c:	81 21 00 0c 	lwz     r9,12(r1)
  830:	91 3f 00 00 	stw     r9,0(r31)
  834:	81 21 00 14 	lwz     r9,20(r1)
  838:	91 3f 00 04 	stw     r9,4(r31)
  83c:	38 60 00 00 	li      r3,0
  840:	4b ff ff dc 	b       81c <__c_kernel_clock_getres+0x5c>

> 
> I'll still try to get the stack initialization out of the vDSO.
> It might bite us at any time in the future. As these options are meant
> to prevent information leaks and the vDSO has no sensitive information in
> the first place, we might as well filter them out.

Well, from the first day we converted powerpc to C time vdso, we've done 
our best in order to keep vdso stackless. So I'm not sure it is worth 
dealing with the above. Indeed if keeping it as is helps us detect 
everytime a change jeoperdises the stackless approach, that's not bad.

Christophe

