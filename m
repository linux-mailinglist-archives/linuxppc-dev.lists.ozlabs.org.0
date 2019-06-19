Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6DE4B08F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 06:06:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TBGX24FrzDqjj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 14:06:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dolS9hmu"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TBDb5jq4zDqTq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 14:05:03 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id b7so6615835pls.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 21:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=dlKKhOwJSEMVUliFjZN2VmR5N2DuU/WIVAWz++I4En0=;
 b=dolS9hmuP//ujTkYRW2m2EAWviPDRa4HKPhSzbF0Nii41LlDs6XOgChjvNZSElyNO4
 vQhpWgyGTUli/UF9dSKWaF0dZkih+/6cSIjx+vVuJymJl17M5pXGYSh5TNCZ8n7yLSje
 HaRCz+ma4h7EWalg/DsgATAMVHvCJcaQXGagtnp2Qr1iug8gslkAkjdlfJCxGvT2xiKr
 bFspFfypO1PT/dnr0QDBXRjrYXUMuhgQMBfT0IBY1Y1+lX5ZFkfknfwQ0YjxVEveMVL2
 vMIInaLLJl18jVl2kAqGAJ2JaZutd1U7UQiagFmm0uH3mgI1aJnc3jivR02ia+XDcRiS
 XxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=dlKKhOwJSEMVUliFjZN2VmR5N2DuU/WIVAWz++I4En0=;
 b=DlD1iKherlJOEoK+/x9es9avFRGQ4xo69IQJa325gV6erRudCrTXju9gg1gRJXQNUv
 xYBBggSSdyxH2zyqz9mcQgsSl/BgscBiuAemwSwPt5L0wENfKksaqCtSxQNcxmXeq/X0
 tQZ3nBTfO6DTnfn6TQ55bKfPuLlTCmYonk45HHOlPlYtmYOwCeUFP1RKhrWXvbNygOd4
 Qww6JgGhlsDL5ZyEyttUArMfImlVJ31qUpwBfhkt7IYPNe3gWbbvjNqbBqxbuqPzoU3a
 zGAXSSASn4/8x3teczZ8r0jiOJE355V9CYYMZd7k/GsFqnJJCKhiIxVUfKZxVv9FlvSM
 4u/w==
X-Gm-Message-State: APjAAAW87JqE0Z7tOm7yZiTOD8nAYHhe4Hg26ur/hOX1Q1GL1a6fGINB
 j1Npwy1WGMQ2aO759YGE5C0kFiyw
X-Google-Smtp-Source: APXvYqyPpepS8NDq7lIRHJO5N5DlNyKH8bsh8CFi3nNT3QyQR6SdkQtjur7CsvsamKBJ7Un57rmoKQ==
X-Received: by 2002:a17:902:9a91:: with SMTP id
 w17mr20726589plp.126.1560917100167; 
 Tue, 18 Jun 2019 21:05:00 -0700 (PDT)
Received: from localhost (193-116-92-108.tpgi.com.au. [193.116.92.108])
 by smtp.gmail.com with ESMTPSA id b135sm16216206pfb.44.2019.06.18.21.04.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 21:04:59 -0700 (PDT)
Date: Wed, 19 Jun 2019 13:59:53 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc/64s/radix: ioremap use ioremap_page_range
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190610030818.17965-1-npiggin@gmail.com>
 <20190610030818.17965-2-npiggin@gmail.com>
 <1a9a36aa-f2bb-1ce8-78d5-ddf24e336078@c-s.fr>
In-Reply-To: <1a9a36aa-f2bb-1ce8-78d5-ddf24e336078@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1560915874.eudrz3r20a.astroid@bobo.none>
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

Christophe Leroy's on June 11, 2019 4:46 pm:
>=20
>=20
> Le 10/06/2019 =C3=A0 05:08, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Radix can use ioremap_page_range for ioremap, after slab is available.
>> This makes it possible to enable huge ioremap mapping support.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/book3s/64/radix.h |  3 +++
>>   arch/powerpc/mm/book3s64/pgtable.c         | 21 +++++++++++++++++++++
>>   arch/powerpc/mm/book3s64/radix_pgtable.c   | 21 +++++++++++++++++++++
>>   arch/powerpc/mm/pgtable_64.c               |  2 +-
>>   4 files changed, 46 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/i=
nclude/asm/book3s/64/radix.h
>> index 574eca33f893..e04a839cb5b9 100644
>> --- a/arch/powerpc/include/asm/book3s/64/radix.h
>> +++ b/arch/powerpc/include/asm/book3s/64/radix.h
>> @@ -266,6 +266,9 @@ extern void radix__vmemmap_remove_mapping(unsigned l=
ong start,
>>   extern int radix__map_kernel_page(unsigned long ea, unsigned long pa,
>>   				 pgprot_t flags, unsigned int psz);
>>  =20
>> +extern int radix__ioremap_range(unsigned long ea, phys_addr_t pa,
>> +				unsigned long size, pgprot_t prot, int nid);
>> +
>=20
> 'extern' is pointless here, and checkpatch will cry.
>=20
>>   static inline unsigned long radix__get_tree_size(void)
>>   {
>>   	unsigned long rts_field;
>> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s=
64/pgtable.c
>> index ff98b663c83e..953850a602f7 100644
>> --- a/arch/powerpc/mm/book3s64/pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/pgtable.c
>> @@ -450,3 +450,24 @@ int pmd_move_must_withdraw(struct spinlock *new_pmd=
_ptl,
>>  =20
>>   	return true;
>>   }
>> +
>> +int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size,=
 pgprot_t prot, int nid)
>> +{
>> +	unsigned long i;
>> +
>> +	if (radix_enabled())
>> +		return radix__ioremap_range(ea, pa, size, prot, nid);
>=20
> This function looks pretty similar to the one in the previous patch.
> Since radix_enabled() is available and return false for all other=20
> subarches, I think the above could go in the generic ioremap_range(),=20
> you'll only need to move the function declaration in a common file, for=20
> instance asm/io.h
>=20
>> +
>> +	for (i =3D 0; i < size; i +=3D PAGE_SIZE) {
>> +		int err =3D map_kernel_page(ea + i, pa + i, prot);
>> +		if (err) {
>> +			if (slab_is_available())
>> +				unmap_kernel_range(ea, size);
>> +			else
>> +				WARN_ON_ONCE(1); /* Should clean up */
>> +			return err;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/=
book3s64/radix_pgtable.c
>> index c9bcf428dd2b..db993bc1aef3 100644
>> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> @@ -11,6 +11,7 @@
>>  =20
>>   #define pr_fmt(fmt) "radix-mmu: " fmt
>>  =20
>> +#include <linux/io.h>
>>   #include <linux/kernel.h>
>>   #include <linux/sched/mm.h>
>>   #include <linux/memblock.h>
>> @@ -1122,3 +1123,23 @@ void radix__ptep_modify_prot_commit(struct vm_are=
a_struct *vma,
>>  =20
>>   	set_pte_at(mm, addr, ptep, pte);
>>   }
>> +
>> +int radix__ioremap_range(unsigned long ea, phys_addr_t pa, unsigned lon=
g size,
>> +			pgprot_t prot, int nid)
>> +{
>> +	if (likely(slab_is_available())) {
>> +		int err =3D ioremap_page_range(ea, ea + size, pa, prot);
>> +		if (err)
>> +			unmap_kernel_range(ea, size);
>> +		return err;
>> +	} else {
>> +		unsigned long i;
>> +
>> +		for (i =3D 0; i < size; i +=3D PAGE_SIZE) {
>> +			int err =3D map_kernel_page(ea + i, pa + i, prot);
>> +			if (WARN_ON_ONCE(err)) /* Should clean up */
>> +				return err;
>> +		}
>=20
> Same loop again.
>=20
> What about not doing a radix specific function and just putting=20
> something like below in the core ioremap_range() function ?
>=20
> 	if (likely(slab_is_available()) && radix_enabled()) {
> 		int err =3D ioremap_page_range(ea, ea + size, pa, prot);
>=20
> 		if (err)
> 			unmap_kernel_range(ea, size);
> 		return err;
> 	}
>=20
> Because I'm pretty sure will more and more use ioremap_page_range().

Well I agree the duplication is not so nice, but it's convenient
to see what is going on for each MMU type.

There is a significant amount of churn that needs to be done in
this layer so I prefer to make it a bit simpler despite duplication.

I would like to remove the early ioremap or make it into its own
function. Re-implement map_kernel_page with ioremap_page_range,
allow page tables that don't use slab to avoid the early check,
unbolt the hptes mapped in early boot, etc.

I just wanted to escape out the 64s and hash/radix implementations
completely until that settles.

>> -static int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned lon=
g size, pgprot_t prot, int nid)
>> +int __weak ioremap_range(unsigned long ea, phys_addr_t pa, unsigned lon=
g size, pgprot_t prot, int nid)
>=20
> Hum. Weak functions remain in unused in vmlinux unless=20
> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is selected.
>=20
> Also, they are some how dangerous because people might change them=20
> without seeing that it is overridden for some particular configuration.

Well you shouldn't assume that when you see a weak function, but
what's the preferred alternative? A config option?

Thanks,
Nick

=
