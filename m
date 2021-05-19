Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F37323883BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 02:26:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlDFl6w0Hz309M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 10:26:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZdlZTEFt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZdlZTEFt; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlDFH2zsFz2xvc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 10:26:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FlDFD2w1Jz9sRf;
 Wed, 19 May 2021 10:26:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1621383985;
 bh=Um1Dqv6AstXHBvsMIu67+mf10jU6QyH/8DtdTg8oTfo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZdlZTEFt0wQgPepbOySCe0puh044kqZobeuW9eaOTZWMnmWv6N59VRf/56cBYDgUX
 /0L+rzDASmQtbKfLGD7y/39rSGcxHbBgIcnfTVIBtl+eh/O1R/CZCxyfHeYuwqZrE6
 oN7YJzEeKH1PuJ9WHr6ni+BjF7+8iRv8R3oooZUkWSF4S+P19YSuotlO+Tl4r2i8Dc
 cjHDY5g8XoEOcikwvwUVj8u9Bx6EPMLTa2QAsJk/B9PWYYGsYE9dj07drw7GFStvof
 FENLPC3RWqToGqp/zhOSm7PHdS31p9tcKSk8kgfZgIXRbJlykNgRLi03Esk9pDlV7n
 xzuEx6jdXHuGg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Guenter Roeck <linux@roeck-us.net>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 5/9] powerpc/mm/book3s64: Update tlb flush routines
 to take a page walk cache flush argument
In-Reply-To: <a7dd34f3-7d79-c933-fb62-eaad5c83d37a@roeck-us.net>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-6-aneesh.kumar@linux.ibm.com>
 <20210515163525.GA1106462@roeck-us.net>
 <e0eba73a-c2df-71c3-e03d-d4074d908fca@linux.ibm.com>
 <d830fce9-c00a-e879-4115-94a2346a806f@roeck-us.net>
 <87pmxpqxb1.fsf@linux.ibm.com>
 <a7dd34f3-7d79-c933-fb62-eaad5c83d37a@roeck-us.net>
Date: Wed, 19 May 2021 10:26:22 +1000
Message-ID: <87a6ork1qp.fsf@mpe.ellerman.id.au>
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
Cc: npiggin@gmail.com, linux-mm@kvack.org, kaleshsingh@google.com,
 joel@joelfernandes.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Guenter Roeck <linux@roeck-us.net> writes:
> On 5/17/21 6:55 AM, Aneesh Kumar K.V wrote:
>> Guenter Roeck <linux@roeck-us.net> writes:
>>=20
>>> On 5/17/21 1:40 AM, Aneesh Kumar K.V wrote:
>>>> On 5/15/21 10:05 PM, Guenter Roeck wrote:
>>>>> On Thu, Apr 22, 2021 at 11:13:19AM +0530, Aneesh Kumar K.V wrote:
>>=20
>> ...
>>=20
>>>>>  =C2=A0 extern void radix__local_flush_all_mm(struct mm_struct *mm);
>>>>>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/po=
werpc/include/asm/book3s/64/tlbflush.h
>>>>>> index 215973b4cb26..f9f8a3a264f7 100644
>>>>>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
>>>>>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
>>>>>> @@ -45,13 +45,30 @@ static inline void tlbiel_all_lpid(bool radix)
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hash__tlbiel=
_all(TLB_INVAL_SCOPE_LPID);
>>>>>>  =C2=A0 }
>>>>>> +static inline void flush_pmd_tlb_pwc_range(struct vm_area_struct *v=
ma,
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned=
 long start,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned=
 long end,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool flu=
sh_pwc)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 if (radix_enabled())
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return radix__flush_pmd_=
tlb_range(vma, start, end, flush_pwc);
>>>>>> +=C2=A0=C2=A0=C2=A0 return hash__flush_tlb_range(vma, start, end);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>>>
>>>>>> +}
>>>>
>>>> In this specific case we won't have=C2=A0 build errors because,
>>>>
>>>> static inline void hash__flush_tlb_range(struct vm_area_struct *vma,
>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long start,=
 unsigned long end)
>>>> {
>>>>
>>>
>>> Sorry, you completely lost me.
>>>
>>> Building parisc:allnoconfig ... failed
>>> --------------
>>> Error log:
>>> In file included from arch/parisc/include/asm/cacheflush.h:7,
>>>                    from include/linux/highmem.h:12,
>>>                    from include/linux/pagemap.h:11,
>>>                    from include/linux/ksm.h:13,
>>>                    from mm/mremap.c:14:
>>> mm/mremap.c: In function 'flush_pte_tlb_pwc_range':
>>> arch/parisc/include/asm/tlbflush.h:20:2: error: 'return' with a value, =
in function returning void
>>=20
>> As replied here
>> https://lore.kernel.org/mm-commits/8eedb441-a612-1ec8-8bf7-b40184de9f6f@=
linux.ibm.com/
>>=20
>> That was the generic header change in the patch. I was commenting about =
the
>> ppc64 specific change causing build failures.
>
> Ah, sorry. I wasn't aware that the following is valid C code
>
> void f1()
> {
>      return f2();
>      ^^^^^^
> }
>
> as long as f2() is void as well. Confusing, but we live and learn.

It might be valid, but it's still bad IMHO.

It's confusing to readers, and serves no useful purpose.

cheers
