Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DEB21634E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 03:25:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B14WY6h6JzDqY1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 11:25:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B14Tt6m19zDqR3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 11:24:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=msuwGaLw; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B14Tt4rS5z9sR4;
 Tue,  7 Jul 2020 11:24:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594085058;
 bh=YEZVcBtOSHSdo7GkRm5XobNyiw3pBUS9p90hf0qtESY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=msuwGaLwYX1lfvaGVEluTBb8bjOkN1vEh5asdj5wV1KY0yZ+3BnL+300tuSyfhUw5
 H3UsOwklipCxObsFRvCnuDkcOXn5vvdL2o9d2qCC4DDXgj9+xaUc3c2yvOCc31s74z
 59GBkz01Fwgn0zBAWOqkOTD7ZzmVCGBF12yLdIGbWAqXje7FLnD3NHp7dESNte0HuS
 ATG6Yp0R7Ox019T/DpTig7rijUi5f0sTWE9k4MfRRNYh4suUoyFL8nNDVR8Ae59n8G
 oPs9bPKf3j/ap3uv0xOZA8bjPXO2zq+IVCYttqHsKnrJwc2cOcLgn/2opvSeJZN/r2
 xXb6b3Wx4g2Yw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 10/26] powerpc/book3s64/pkeys: Convert pkey_total to
 max_pkey
In-Reply-To: <15527f2f-1b50-2ff2-3e05-b03dec985391@linux.ibm.com>
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
 <20200619135850.47155-11-aneesh.kumar@linux.ibm.com>
 <87tuyl5dko.fsf@mpe.ellerman.id.au>
 <15527f2f-1b50-2ff2-3e05-b03dec985391@linux.ibm.com>
Date: Tue, 07 Jul 2020 11:26:33 +1000
Message-ID: <87r1to3yk6.fsf@mpe.ellerman.id.au>
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
Cc: linuxram@us.ibm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> On 7/6/20 12:34 PM, Michael Ellerman wrote:
>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>> max_pkey now represents max key value that userspace can allocate.
>>>
>
> I guess commit message is confusing.

And the name.

If it's called max_pkey then it should be the maximum allowed pkey
value.

cheers


>>> diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
>>> index 75d2a2c19c04..652bad7334f3 100644
>>> --- a/arch/powerpc/include/asm/pkeys.h
>>> +++ b/arch/powerpc/include/asm/pkeys.h
>>> @@ -12,7 +12,7 @@
>>>   #include <asm/firmware.h>
>>>   
>>>   DECLARE_STATIC_KEY_FALSE(pkey_disabled);
>>> -extern int pkeys_total; /* total pkeys as per device tree */
>>> +extern int max_pkey;
>>>   extern u32 initial_allocation_mask; /*  bits set for the initially allocated keys */
>>>   extern u32 reserved_allocation_mask; /* bits set for reserved keys */
>>>   
>>> @@ -44,7 +44,10 @@ static inline int vma_pkey(struct vm_area_struct *vma)
>>>   	return (vma->vm_flags & ARCH_VM_PKEY_FLAGS) >> VM_PKEY_SHIFT;
>>>   }
>>>   
>>> -#define arch_max_pkey() pkeys_total
>>> +static inline int arch_max_pkey(void)
>>> +{
>>> +	return max_pkey;
>>> +}
>> 
>> If pkeys_total = 32 then max_pkey = 31.
>
> we have
>
> #ifdef CONFIG_PPC_4K_PAGES
> 	/*
> 	 * The OS can manage only 8 pkeys due to its inability to represent them
> 	 * in the Linux 4K PTE. Mark all other keys reserved.
> 	 */
> 	max_pkey = min(8, pkeys_total);
> #else
> 	max_pkey = pkeys_total;
> #endif
>
> so it is 32.
>
>> 
>> So we can't just substitute one for the other. ie. arch_max_pkey() must
>> have been wrong, or it is wrong now.
>> 
>>> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
>>> index 87d882a9aaf2..a4d7287082a8 100644
>>> --- a/arch/powerpc/mm/book3s64/pkeys.c
>>> +++ b/arch/powerpc/mm/book3s64/pkeys.c
>>> @@ -14,7 +14,7 @@
>>>   
>>>   DEFINE_STATIC_KEY_FALSE(pkey_disabled);
>>>   DEFINE_STATIC_KEY_FALSE(execute_pkey_disabled);
>>> -int  pkeys_total;		/* Total pkeys as per device tree */
>>> +int  max_pkey;			/* Maximum key value supported */
>>>   u32  initial_allocation_mask;   /* Bits set for the initially allocated keys */
>>>   /*
>>>    *  Keys marked in the reservation list cannot be allocated by  userspace
>>> @@ -84,7 +84,7 @@ static int scan_pkey_feature(void)
>>>   
>>>   static int pkey_initialize(void)
>>>   {
>>> -	int os_reserved, i;
>>> +	int pkeys_total, i;
>>>   
>>>   	/*
>>>   	 * We define PKEY_DISABLE_EXECUTE in addition to the arch-neutral
>>> @@ -122,12 +122,12 @@ static int pkey_initialize(void)
>>>   	 * The OS can manage only 8 pkeys due to its inability to represent them
>>>   	 * in the Linux 4K PTE. Mark all other keys reserved.
>>>   	 */
>>> -	os_reserved = pkeys_total - 8;
>>> +	max_pkey = min(8, pkeys_total);
>> 
>> Shouldn't it be 7 ?
>> 
>>>   #else
>>> -	os_reserved = 0;
>>> +	max_pkey = pkeys_total;
>>>   #endif
>>>   
>>> -	if (unlikely((pkeys_total - os_reserved) <= execute_only_key)) {
>>> +	if (unlikely(max_pkey <= execute_only_key)) {
>> 
>> Isn't that an off-by-one now?
>> 
>> This is one-off boot time code, there's no need to clutter it with
>> unlikely.
>> 
>>>   		/*
>>>   		 * Insufficient number of keys to support
>>>   		 * execute only key. Mark it unavailable.
>>> @@ -174,10 +174,10 @@ static int pkey_initialize(void)
>>>   	default_uamor &= ~(0x3ul << pkeyshift(1));
>>>   
>>>   	/*
>>> -	 * Prevent the usage of OS reserved the keys. Update UAMOR
>>> +	 * Prevent the usage of OS reserved keys. Update UAMOR
>>>   	 * for those keys.
>>>   	 */
>>> -	for (i = (pkeys_total - os_reserved); i < pkeys_total; i++) {
>>> +	for (i = max_pkey; i < pkeys_total; i++) {
>> 
>> Another off-by-one? Shouldn't we start from max_pkey + 1 ?
>> 
>>>   		reserved_allocation_mask |= (0x1 << i);
>>>   		default_uamor &= ~(0x3ul << pkeyshift(i));
>>>   	}
>> 
>
> It is the commit message. It is max pkey such that userspace can 
> allocate 0 - maxp_pkey -1.
>
> -aneesh
