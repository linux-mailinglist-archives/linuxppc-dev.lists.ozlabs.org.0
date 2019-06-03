Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D0E329BB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 09:35:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HRfc3v0NzDqP4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 17:35:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mDyXWlAN"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HRc53zWCzDqQn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 17:33:09 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id f97so6646848plb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 00:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=XRXWzhhQ9DIxETmRTpZ6RWTE2V4h8Oq4dP59PIsZ374=;
 b=mDyXWlANvoQIGBM4+R9I74CrVraWvog4entAXK+a1oNbpRcI4i0LRPSx8MHMAihXSG
 7I7MVw1WDriCklP0GoMz3cFPG1vlJrLm2Nw/t8uvlZilosFDWoPKsUOIxqH0qk++09e6
 HcZPHb0F1S/DvCB9DjYdCtBKpgXYW8CrDdfyTLmRWoT/iTGpcRn1at1VJpxIqU4wOoAe
 b4TvLa0wakgS2M++4C2cVkE6BjC+Y43uSyig9hA5LXZ0IiQU79ExZu1vulXC0k1wpnGg
 ZmOVr2z+G9qEtDu/J6G0uY3x8SERSJvWEjL+pi+ME9HQWaD4+v8G+bEus9zfXmiJF9n3
 t2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=XRXWzhhQ9DIxETmRTpZ6RWTE2V4h8Oq4dP59PIsZ374=;
 b=DeMlqQCIBrqJwswACkQGPk07Uksi3EqIloeCvvs0PbyuNyON/NvWPKSYLkPHtcKxBJ
 NK+QSpSCA/egyHs/K1Qv9WJHuFHh5E+1ihwnEFGPEBxHiO6MyjiASmE44wextMbuLIVK
 nrFss4Y9lOUqHzaoH5sy7XU4gDAFvOOA4DVrZxa0ezGN7Ty7/k2qnmVcaFAOQfMvHGwW
 GUxjuaBj5HbratpvLmcyKAr7pTwAhEKvbaVe9R/EfnPP/CiEDw7fwppSNbTseVGKSywO
 Ynp+1va8vGLYFgqd/WQHI5UgOP93oGTLeXIHd5MW3+IxtWF8RMPYQ0t3r1oRVTVegv4N
 G3LQ==
X-Gm-Message-State: APjAAAXo0plMiyUhOHd2q05nc8MUMx1sy22UtOZ9Y0muoa97zOUpbN9/
 Ouxbswo92gg1xjBtIR0Eeuo=
X-Google-Smtp-Source: APXvYqzo0vrjEfnEc408DXeJrbeOsVSBpaLygXs66aLV2ENm3q35xbjQJCqOSuW7AJVQPpyGbF7T1g==
X-Received: by 2002:a17:902:9b85:: with SMTP id
 y5mr27695727plp.313.1559547185601; 
 Mon, 03 Jun 2019 00:33:05 -0700 (PDT)
Received: from localhost (193-116-109-153.tpgi.com.au. [193.116.109.153])
 by smtp.gmail.com with ESMTPSA id u14sm16275446pfc.31.2019.06.03.00.33.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 00:33:04 -0700 (PDT)
Date: Mon, 03 Jun 2019 17:33:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: Fix THP PMD collapse serialisation
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20190603060531.13088-1-npiggin@gmail.com>
 <bb7eabc7-8dbb-14e9-f797-6dfd339bb0ba@linux.ibm.com>
In-Reply-To: <bb7eabc7-8dbb-14e9-f797-6dfd339bb0ba@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1559545067.vujftvzy2h.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh Kumar K.V's on June 3, 2019 4:43 pm:
> On 6/3/19 11:35 AM, Nicholas Piggin wrote:
>> Commit 1b2443a547f9 ("powerpc/book3s64: Avoid multiple endian conversion
>> in pte helpers") changed the actual bitwise tests in pte_access_permitte=
d
>> by using pte_write() and pte_present() helpers rather than raw bitwise
>> testing _PAGE_WRITE and _PAGE_PRESENT bits.
>>=20
>> The pte_present change now returns true for ptes which are !_PAGE_PRESEN=
T
>> and _PAGE_INVALID, which is the combination used by pmdp_invalidate to
>> synchronize access from lock-free lookups. pte_access_permitted is used =
by
>> pmd_access_permitted, so allowing GUP lock free access to proceed with
>> such PTEs breaks this synchronisation.
>>=20
>> This bug has been observed on HPT host, with random crashes and corrupti=
on
>> in guests, usually together with bad PMD messages in the host.
>>=20
>> Fix this by adding an explicit check in pmd_access_permitted, and
>> documenting the condition explicitly.
>>=20
>> The pte_write() change should be okay, and would prevent GUP from fallin=
g
>> back to the slow path when encountering savedwrite ptes, which matches
>> what x86 (that does not implement savedwrite) does.
>>=20
>> Fixes: 1b2443a547f9 ("powerpc/book3s64: Avoid multiple endian conversion=
 in pte helpers")
>> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/book3s/64/pgtable.h | 19 ++++++++++++++++++-
>>   arch/powerpc/mm/book3s64/pgtable.c           |  3 +++
>>   2 files changed, 21 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc=
/include/asm/book3s/64/pgtable.h
>> index 7dede2e34b70..aaa72aa1b765 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -1092,7 +1092,24 @@ static inline int pmd_protnone(pmd_t pmd)
>>   #define pmd_access_permitted pmd_access_permitted
>>   static inline bool pmd_access_permitted(pmd_t pmd, bool write)
>>   {
>> -	return pte_access_permitted(pmd_pte(pmd), write);
>> +	pte_t pte =3D pmd_pte(pmd);
>> +	unsigned long pteval =3D pte_val(pte);
>> +
>> +	/*
>> +	 * pmdp_invalidate sets this combination (that is not caught by
>> +	 * !pte_present() check in pte_access_permitted), to prevent
>> +	 * lock-free lookups, as part of the serialize_against_pte_lookup()
>> +	 * synchronisation.
>> +	 *
>> +	 * This check inadvertently catches the case where the PTE's hardware
>> +	 * PRESENT bit is cleared while TLB is flushed, to work around
>> +	 * hardware TLB issues. This is suboptimal, but should not be hit
>> +	 * frequently and should be harmless.
>> +	 */
>> +	if ((pteval & _PAGE_INVALID) && !(pteval & _PAGE_PRESENT))
>> +		return false;
>> +
>> +	return pte_access_permitted(pte, write);
>>   }
>>  =20
>=20
>=20
> you need to do similar for other lockless page table walk like=20
> find_linux_pte

Yeah good point as discussed offline. I was going to make that a
separate patch, it would have a different Fixes:. I have not been
able to trigger any bugs caused by it, whereas the bug caused by
this patch hits reliably in about 10 minutes or less.

Maybe the race window is just a lot smaller or the function is
less frequently used?

Thanks,
Nick


=
