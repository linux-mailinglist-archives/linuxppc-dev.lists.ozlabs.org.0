Return-Path: <linuxppc-dev+bounces-16136-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePPKGaPzcWmvZwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16136-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 10:53:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5465064D6E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 10:53:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxbwv5Kmfz2ySb;
	Thu, 22 Jan 2026 20:53:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769075615;
	cv=none; b=VjBMzcn1p8ZmQs/wtJKEmPIqrLStXNB4hHsNea6VpKqW/azwAP2rOClpBWy4L2dDolJhtzcYU3AWk5iu42sJHGA6BCkXtourMUK7iDiRKZ5aiHp5zsj4UqraTYbMftiadvkDOeHvGmAb644KUw4DHslXJSD0G89KZp9KKdaP6SdYbUtvqtOLe63Oj3eBNzDDSLLnqZ87+SCThi2hq9ccxNpkHAtcl8jx2ZBexrIF8PhumpMXpbP+mrJOI40hQAY1iwQNHZHs3YABAiZQkhI5DijBOYL4Emj+DQ+6t/gLp9md4uZURIyDOo/L1gRO3Fhj+11f0mZnohSKXjLr+uZK0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769075615; c=relaxed/relaxed;
	bh=Kfs3ADWaof+sERNNuNcd1lFkfl5RbcIw2kStvIqlpqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VolDVKHgZ7pyNvqtEkp5rWaqFfsMe3DPg1/Dh9+y0uw4pCxdKTEL9I5N7jCBLAcZKdGuz1v0csqT8MsdNd+PxIab4zs6uqqfs2DnQY0AmXZe/uwu5y8s0V7Cej+4pHWXQJ9pEmGBeYQ10cUFPDd7s1rSZHuFi32KsDFd3TvlVWrabAadlUMv7nU7PCH1DzBwZBHDlNzswifwlfijS137f1AJcLIuSrcQUJfykTRMg0sQLmeZRRinalXISFH/2rajhnAcZJGXrah1R43N0NTiwlV9rnrsYxHPwwb7ILxSrIpf4QPc3BKwA88BZ7rW5hMW+HoOxzTN4Lq9a+sW0I7xIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JcH8wviT; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JcH8wviT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxbwt2zdWz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 20:53:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFC8B408D9;
	Thu, 22 Jan 2026 09:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F73C116C6;
	Thu, 22 Jan 2026 09:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769075611;
	bh=5Xlh+rc8mupa7TgdSGKmWTLCLN88DLA0+Z9CfAN8dCw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JcH8wviTnXWXJQfK1UvZcqlJaLSTofTXwDX9p5vvOBbWLlesZ8rbfk0Rf6eegoJqf
	 rx2rqpn+1z7uBwC5uVKmWYsU9oBk5E48yYLP53+H5ERYAwO4SnKDit6ZSGDmlaTudK
	 S4cL599V6Ztz5En2CExPhIAhXHBRN05yVJiR2gTIlEO7mt+RyBTdOFp45AON/XYth8
	 am7H7qtsucSi0Z73PJH2UkggNvLx1yYK00/K3rWkg8uYpCKpLAgJLQAPf2M/2I1qG/
	 R8mYEMj4zSH61EpNIIAlYjuusoQ5UBiUbFi9CZTm7tF5L6Dq7p6SxqZ+ddZgOGYylX
	 oELLhzxmTf/ew==
Message-ID: <e7c8bb78-e993-41bc-8444-07266d81b838@kernel.org>
Date: Thu, 22 Jan 2026 10:53:26 +0100
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
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>,
 "thomas.weissschuh@linutronix.de" <thomas.weissschuh@linutronix.de>,
 "npiggin@gmail.com" <npiggin@gmail.com>, "luto@kernel.org"
 <luto@kernel.org>, "chleroy@kernel.org" <chleroy@kernel.org>,
 "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
 "tglx@kernel.org" <tglx@kernel.org>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260114-vdso-powerpc-align-v1-1-acf09373d568@linutronix.de>
 <f45316f65a46da638b3c6aa69effd8980e6677b9.camel@siemens.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <f45316f65a46da638b3c6aa69effd8980e6677b9.camel@siemens.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.sverdlin@siemens.com,m:thomas.weissschuh@linutronix.de,m:npiggin@gmail.com,m:luto@kernel.org,m:chleroy@kernel.org,m:maddy@linux.ibm.com,m:tglx@kernel.org,m:mpe@ellerman.id.au,m:vincenzo.frascino@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16136-lists,linuxppc-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[siemens.com,linutronix.de,gmail.com,kernel.org,linux.ibm.com,ellerman.id.au,arm.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5465064D6E
X-Rspamd-Action: no action

Hi Alexandre,

Le 22/01/2026 à 10:39, Sverdlin, Alexander a écrit :
> Hi Thomas, Christophe,
> 
> On Wed, 2026-01-14 at 08:26 +0100, Thomas Weißschuh wrote:
>> For consistency with __vdso_clock_gettime64() there should also be a
>> 64-bit variant of clock_getres(). This will allow the extension of
>> CONFIG_COMPAT_32BIT_TIME to the vDSO and finally the removal of 32-bit
>> time types from the kernel and UAPI.
>>
>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> 
> I've bisected this patch to cause the following build failure on my side:
> 
>    LDS     arch/powerpc/kernel/vdso/vdso32.lds
>    VDSO32A arch/powerpc/kernel/vdso/sigtramp32-32.o
>    VDSO32A arch/powerpc/kernel/vdso/gettimeofday-32.o
>    VDSO32A arch/powerpc/kernel/vdso/datapage-32.o
>    VDSO32A arch/powerpc/kernel/vdso/cacheflush-32.o
>    VDSO32A arch/powerpc/kernel/vdso/note-32.o
>    VDSO32A arch/powerpc/kernel/vdso/getcpu-32.o
>    VDSO32A arch/powerpc/kernel/vdso/getrandom-32.o
>    VDSO32A arch/powerpc/kernel/vdso/vgetrandom-chacha-32.o
>    VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
>    VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
>    VDSO32A arch/powerpc/kernel/vdso/crtsavres-32.o
>    VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supported
> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
> make[1]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
> 
> Does it ring any bells? What could I try/test?
> 
> I'm using gcc-15.2.0 and binutils 2.45.1.

Can you share your defconfig ?

I don't have such a problem with mpc885_ads_defconfig using same 
gcc/binutils as you.

Christophe

> 
>> ---
>> Based on tip/timers/vdso.
>>
>> This was missed in the original vdso_getres_time64() series as powerpc
>> does not use include/vdso/gettime.h.
>> ---
>>   arch/powerpc/include/asm/vdso/gettimeofday.h |  2 ++
>>   arch/powerpc/kernel/vdso/gettimeofday.S      | 12 ++++++++++++
>>   arch/powerpc/kernel/vdso/vdso32.lds.S        |  1 +
>>   arch/powerpc/kernel/vdso/vgettimeofday.c     |  6 ++++++
>>   4 files changed, 21 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
>> index ab3df12c8d94..8ea397e26ad0 100644
>> --- a/arch/powerpc/include/asm/vdso/gettimeofday.h
>> +++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
>> @@ -135,6 +135,8 @@ int __c_kernel_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts,
>>   			       const struct vdso_time_data *vd);
>>   int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res,
>>   			    const struct vdso_time_data *vd);
>> +int __c_kernel_clock_getres_time64(clockid_t clock_id, struct __kernel_timespec *res,
>> +				   const struct vdso_time_data *vd);
>>   #endif
>>   int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz,
>>   			    const struct vdso_time_data *vd);
>> diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kernel/vdso/gettimeofday.S
>> index 79c967212444..1c8e51691bf8 100644
>> --- a/arch/powerpc/kernel/vdso/gettimeofday.S
>> +++ b/arch/powerpc/kernel/vdso/gettimeofday.S
>> @@ -103,6 +103,18 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
>>   	cvdso_call __c_kernel_clock_getres
>>   V_FUNCTION_END(__kernel_clock_getres)
>>   
>> +/*
>> + * Exact prototype of clock_getres_time64()
>> + *
>> + * int __kernel_clock_getres(clockid_t clock_id, struct __timespec64 *res);
>> + *
>> + */
>> +#ifndef __powerpc64__
>> +V_FUNCTION_BEGIN(__kernel_clock_getres_time64)
>> +	cvdso_call __c_kernel_clock_getres_time64
>> +V_FUNCTION_END(__kernel_clock_getres_time64)
>> +#endif
>> +
>>   
>>   /*
>>    * Exact prototype of time()
>> diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
>> index 72a1012b8a20..3f384a2526ae 100644
>> --- a/arch/powerpc/kernel/vdso/vdso32.lds.S
>> +++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
>> @@ -124,6 +124,7 @@ VERSION
>>   		__kernel_clock_gettime;
>>   		__kernel_clock_gettime64;
>>   		__kernel_clock_getres;
>> +		__kernel_clock_getres_time64;
>>   		__kernel_time;
>>   		__kernel_get_tbfreq;
>>   		__kernel_sync_dicache;
>> diff --git a/arch/powerpc/kernel/vdso/vgettimeofday.c b/arch/powerpc/kernel/vdso/vgettimeofday.c
>> index 6f5167d81af5..3c194e1ab562 100644
>> --- a/arch/powerpc/kernel/vdso/vgettimeofday.c
>> +++ b/arch/powerpc/kernel/vdso/vgettimeofday.c
>> @@ -35,6 +35,12 @@ int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res,
>>   {
>>   	return __cvdso_clock_getres_time32_data(vd, clock_id, res);
>>   }
>> +
>> +int __c_kernel_clock_getres_time64(clockid_t clock_id, struct __kernel_timespec *res,
>> +				   const struct vdso_time_data *vd)
>> +{
>> +	return __cvdso_clock_getres_data(vd, clock_id, res);
>> +}
>>   #endif
>>   
>>   int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz,
>>
>> ---
>> base-commit: 0e55e7636697077abceb2301d7d2718d75c34389
>> change-id: 20260113-vdso-powerpc-align-e8e93664da2b
>>
>> Best regards,
> 


