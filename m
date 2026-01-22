Return-Path: <linuxppc-dev+bounces-16146-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNa4EKMmcmkVdwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16146-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 14:31:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE638674CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 14:31:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxhlv3cQbz2ySb;
	Fri, 23 Jan 2026 00:31:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769088667;
	cv=none; b=oPh1h25Q+TV7SqpWJcYG/IkcCpJSsX00GyWOqMex9IQMqKR6RlXIS3weR05xL+/yZfb0flz8GxbOWq340Fq8MoleUiI8voQY75ARsDhCk/q2jLG9m8ugSrrKObV5DApVD8kfJjCqqVQm7fmTnJzAm9j03/IabVUnM4ELrp69V30+SH7fgbezydKoqcU9Eg1O9AdZ0miWJMdhu0Lo8y+A3iIaw2SkVz2373SiYn3JWv0vawwkbOaMBJKAauwViCfC8k8WP8BRWIkk2+x17neO6TesjmDHB2V3J/Mkkr3yfL44k6D3wEW0FiZNnbCv2Z/XAsdEgS00gBC7rEQDzHpKZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769088667; c=relaxed/relaxed;
	bh=ygO6E/yFoiu/JFC2P3b+RxdrA81db2d+y5sfB0WsRgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NRULG5AZxWGA3uiUCs2MF1z88daCGsox+CLVz/4N1DL3OudyuPTGzp5u6AHgcbAHbHIiknVN40RQN+MCM9NNrtnbdITyEVnW6Ks8f/eN9tns/D6FrzTecppL3URqxXhwud6Kcv81x1PuklN/Myuxfti/nbZHvb0LAwm+bRlnm2OArciVFPH3CE2WBmn2yoGllBjz6JiO+6Rw0MrVX2qzuAfTb1LLVQq8Jf7wtCNG3NJ2dUvPRX3JrMxo/RgXP2YN8tGF4J9DJEfgmBtoXTFE4jLJ835Y0MR1toqcLVgVrvdyhuM6tCDNgGDasC3LoLIiOwcc+i9dwqcNBce9T9bizw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iK+NaXIy; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iK+NaXIy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxhlp4W70z2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 00:31:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D329A600C4;
	Thu, 22 Jan 2026 13:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB31C116C6;
	Thu, 22 Jan 2026 13:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769088659;
	bh=twxTRuFnVYVE2Dx9ChLpfEUVMJCd3R0n1EGIg+Kgvws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iK+NaXIyHXWnXtzyn3dteHg0VaNd8TU3unpCqAR/Oqw2BTHeBO3VaysYiKDSb4cTT
	 m05IBu2a5sZmXoIv4eVd76R+5StNTnX0cK/fUR4YFd5beQ1hBLYngLquy44iyplAUN
	 Kg4TFr21bCEl0htl6w8iJAwds/JSHCyTqOghLhJe4LRbLi+5SWflxksLzJs401BRdx
	 Jqg8OktrxRFU70bvytgg+QkJS6aaLs8JDbnvYQPQCwWoKKD/BvOljXHaE/VCUAfyky
	 K6CMA06d9THMmbEOCDBOQPRkf1P38gAdBSgMOUlenbimAeU3vYHg/AHJQKFnsWFT8Z
	 7asm0PcK7oHuA==
Message-ID: <b4563946-9653-4546-b52d-4a9299ad63da@kernel.org>
Date: Thu, 22 Jan 2026 14:30:55 +0100
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
 <6cb02dc1-bbaa-46e6-ace6-15698bc139e1@kernel.org>
 <20260122123416-4e3cd7de-5aa0-4fcc-ba64-4b5f089ab83a@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260122123416-4e3cd7de-5aa0-4fcc-ba64-4b5f089ab83a@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16146-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:alexander.sverdlin@siemens.com,m:npiggin@gmail.com,m:luto@kernel.org,m:maddy@linux.ibm.com,m:tglx@kernel.org,m:mpe@ellerman.id.au,m:vincenzo.frascino@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[siemens.com,gmail.com,kernel.org,linux.ibm.com,ellerman.id.au,arm.com,lists.ozlabs.org,vger.kernel.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: DE638674CD
X-Rspamd-Action: no action



Le 22/01/2026 à 12:41, Thomas Weißschuh a écrit :
> On Thu, Jan 22, 2026 at 12:31:32PM +0100, Christophe Leroy (CS GROUP) wrote:
>> Le 22/01/2026 à 12:07, Thomas Weißschuh a écrit :
>>> On Thu, Jan 22, 2026 at 11:58:04AM +0100, Christophe Leroy (CS GROUP) wrote:
>>>>
>>>>
>>>> Le 22/01/2026 à 11:49, Thomas Weißschuh a écrit :
>>>>> On Thu, Jan 22, 2026 at 11:27:43AM +0100, Christophe Leroy (CS GROUP) wrote:
>>>>>> Hi Thomas,
>>>>>>
>>>>>> Le 22/01/2026 à 10:50, Thomas Weißschuh a écrit :
>>>>>>> Hi Alexander,
>>>>>>>
>>>>>>> On Thu, Jan 22, 2026 at 09:39:09AM +0000, Sverdlin, Alexander wrote:
>>>>>>>> Hi Thomas, Christophe,
>>>>>>>>
>>>>>>>> On Wed, 2026-01-14 at 08:26 +0100, Thomas Weißschuh wrote:
>>>>>>>>> For consistency with __vdso_clock_gettime64() there should also be a
>>>>>>>>> 64-bit variant of clock_getres(). This will allow the extension of
>>>>>>>>> CONFIG_COMPAT_32BIT_TIME to the vDSO and finally the removal of 32-bit
>>>>>>>>> time types from the kernel and UAPI.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>>>>>>>>
>>>>>>>> I've bisected this patch to cause the following build failure on my side:
>>>>>>>>
>>>>>>>>       LDS     arch/powerpc/kernel/vdso/vdso32.lds
>>>>>>>>       VDSO32A arch/powerpc/kernel/vdso/sigtramp32-32.o
>>>>>>>>       VDSO32A arch/powerpc/kernel/vdso/gettimeofday-32.o
>>>>>>>>       VDSO32A arch/powerpc/kernel/vdso/datapage-32.o
>>>>>>>>       VDSO32A arch/powerpc/kernel/vdso/cacheflush-32.o
>>>>>>>>       VDSO32A arch/powerpc/kernel/vdso/note-32.o
>>>>>>>>       VDSO32A arch/powerpc/kernel/vdso/getcpu-32.o
>>>>>>>>       VDSO32A arch/powerpc/kernel/vdso/getrandom-32.o
>>>>>>>>       VDSO32A arch/powerpc/kernel/vdso/vgetrandom-chacha-32.o
>>>>>>>>       VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
>>>>>>>>       VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
>>>>>>>>       VDSO32A arch/powerpc/kernel/vdso/crtsavres-32.o
>>>>>>>>       VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
>>>>>>>> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supported
>>>>>>>> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
>>>>>>>> make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
>>>>>>>
>>>>>>> Thanks for the report!
>>>>>>>
>>>>>>>> Does it ring any bells? What could I try/test?
>>>>>>>
>>>>>>> Not immediately, but I'll look into it.
>>>>>>>
>>>>>>>> I'm using gcc-15.2.0 and binutils 2.45.1.
>>>>>>>
>>>>>>> Is this a toolchain from https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcdn.kernel.org%2Fpub%2Ftools%2Fcrosstool%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cbd6434eab4334cea44fe08de59ab274e%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639046788822130060%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=K7PlfBLHdNEBRgsPQ5aNBgu2v8DqDrhmzwoHrcOc5s8%3D&reserved=0 ?
>>>>>>> Could you also share your configuration?
>>>>>>
>>>>>> I've just been able to reproduce it with ppc64_defconfig +
>>>>>> CONFIG_CC_OPTIMIZE_FOR_SIZE
>>>>>
>>>>> Thanks for the hint, no I can reproduce it, too.
>>>>>>
>>>>>>      VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
>>>>>> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not
>>>>>> supported
>>>>>> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79:
>>>>>> arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
>>>>>> make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
>>>>>> make: *** [Makefile:248: __sub-make] Error 2
>>>>>>
>>>>>> I'll investigate
>>>>>
>>>>> It seems the compiler decides to call memset(), which is not valid from the
>>>>> vDSO. We are are using -ffreestanding. Disabling CONFIG_INIT_STACK_ALL_ZERO
>>>>> fixes the issue. So I guess we should a) figure out why -ffreestanding does
>>>>> not seem to work here and b) exclude the vDSO from the stack initialization
>>>>> logic.
>>>>>
>>>>
>>>> Ah, ok.
>>>>
>>>> Reminds me commit b91c8c42ffdd ("lib/vdso: Force inlining of
>>>> __cvdso_clock_gettime_common()")
>>>
>>> Good pointer.
>>>
>>>> Problem fixed with:
>>>>
>>>> diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
>>>> index 95df0153f05ab..4399e143d43a5 100644
>>>> --- a/lib/vdso/gettimeofday.c
>>>> +++ b/lib/vdso/gettimeofday.c
>>>> @@ -421,7 +421,7 @@ static __maybe_unused __kernel_old_time_t
>>>> __cvdso_time(__kernel_old_time_t *time
>>>>    #endif /* VDSO_HAS_TIME */
>>>>
>>>>    #ifdef VDSO_HAS_CLOCK_GETRES
>>>> -static __maybe_unused
>>>> +static __always_inline
>>>>    bool __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t
>>>> clock,
>>>>    				 struct __kernel_timespec *res)
>>>>    {
>>>
>>> Do you want to run the measurements for this one, too and submit a fix?
>>> This should get us past the immediate breakage.
>>
>> I'm travelling at the moment and won't be able to come with measurement
>> before next month. But the performance degradation is obvious.
> 
> Ack, then I'll send a patch. Thanks for all the information.
> 
>> With the fix, the function is stackless:
> 
> (...)
> 
>> Without the fix, see below, __c_kernel_clock_getres() has to setup a stack
>> in order to call __cvdso_clock_getres_common(), and in addition we see that
>> __cvdso_clock_getres_common() is more or less the same size as
>> __c_kernel_clock_getres() above, so time increase unquestionable.
> 
> (...)
> 
>>> I'll still try to get the stack initialization out of the vDSO.
>>> It might bite us at any time in the future. As these options are meant
>>> to prevent information leaks and the vDSO has no sensitive information in
>>> the first place, we might as well filter them out.
>>
>> Well, from the first day we converted powerpc to C time vdso, we've done our
>> best in order to keep vdso stackless. So I'm not sure it is worth dealing
>> with the above. Indeed if keeping it as is helps us detect everytime a
>> change jeoperdises the stackless approach, that's not bad.
> 
> I was not aware about the stacklessness. Then this should be reason enough.
> We should get a better system to detect these additional stacks though.
> I'll think about it a bit more.

Well, that's only a "best effort", at the end we don't success in all 
cases, refer commit 08c18b63d965 ("powerpc/vdso32: Add missing 
_restgpr_31_x to fix build failure"), there are not enough volatile 
registers for __c_kernel_clock_gettime(), part of this function sets up 
a stack frame to save one non-volatile register and use it. But at least 
for time we can keep flat functions that don't have to suffer the 
overcost of saving volatile registers for calling subfunctions.

For __c_kernel_getrandom() that's different because it has to call 
__arch_chacha20_blocks_nostack() so a stack frame is definitely needed 
but at least we also avoid there to have multiple sub-function calls.

Christophe

