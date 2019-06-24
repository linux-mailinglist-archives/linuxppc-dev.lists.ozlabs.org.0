Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 889F24FE4F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 03:05:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XB1920DXzDqVN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 11:05:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ag4NTY3l"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45X9zL1VYLzDqSh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 11:03:56 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id z75so3557654pgz.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2019 18:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=10UN6J/YbdV5MTCC7OaZGc+TXHA7ebNeq/rBek8GY5Q=;
 b=ag4NTY3lB4udThivgbedabVVEvQmb0u4BCtvjJiEhNaTn/XQVPt6RBDMZKhtvBnaq6
 aFVyP5Xn2PP0ppx6Szcjsvu9lvt0OG2h0fWXhkTwT8rROs5VizQJMkhjvdcS+nb6Zpm4
 Pxbpimb6ZW8ZAJhRRPY2tKOuPbWMp1pGkQq+HIDYy/C8RbdEHGfoj1R8/lQISoyV5HBw
 bxlDGR5Pt5P1UwGrrYmgE1S7DEChXR47OiP18zqox93v2JXWyCJomwnQV2tqTTDmI/A5
 RKcUZZl67JklML3i37xN1rAy6fuJCds0zBlgE/++Xldg58P0ZlGswt3Mph3umXDGsogc
 5exw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=10UN6J/YbdV5MTCC7OaZGc+TXHA7ebNeq/rBek8GY5Q=;
 b=r8/6/5/o0u/r6OSVcGWMmNhwoReREQRMGnvBZ205+loJyrcDEWBiqKqHuCKU8ZAoIg
 iPD1OXjBQZE0t2UadqrUIvQS5q1VUJ/UmbPNGDxEBodKEMkpZXtrr7B2sVIJvT7hNX1a
 Ae6kXGGT7wkgIpHg2C7cFiKaLU2h4ASuAWZsGGd5nLVTrfO5FygYNmHVTiwfvxyPCTid
 p50LD24JV2eWacqD/3KoW/iR3/g/QCOXMZqvsk2HUwd2pazWQaTFQGE8bQ8Kf89ksKTp
 5WZq6l2iW2+Bm+syRAlYWhPDIzGNazOooskUXRQ7Fy3LDVlZ/F090Ai+zSLLTtUO/tQy
 ODmw==
X-Gm-Message-State: APjAAAU4fA3EO+4s89vU7wZuO7rsTkn9+QQKbrRJTdMRsSZsvBsNvXBc
 ZGbMtmccvakB/z1WsZeu1pM=
X-Google-Smtp-Source: APXvYqzebJkQb4mKwKdmz9/AvMZKZAveNcQ64Xpl1dh7MJaDHMff1Mk21OcjRNQdjpGr8ZK8Y9PZcg==
X-Received: by 2002:a17:90a:aa81:: with SMTP id
 l1mr20545679pjq.55.1561338232558; 
 Sun, 23 Jun 2019 18:03:52 -0700 (PDT)
Received: from localhost ([1.144.167.45])
 by smtp.gmail.com with ESMTPSA id j2sm11288674pfn.135.2019.06.23.18.03.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 23 Jun 2019 18:03:51 -0700 (PDT)
Date: Mon, 24 Jun 2019 11:03:07 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc/64s/radix: ioremap use ioremap_page_range
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190610030818.17965-1-npiggin@gmail.com>
 <20190610030818.17965-2-npiggin@gmail.com>
 <1a9a36aa-f2bb-1ce8-78d5-ddf24e336078@c-s.fr>
 <1560915874.eudrz3r20a.astroid@bobo.none>
 <d4e026c5-d0cd-df5f-56d3-1cf62c3a18bd@c-s.fr>
In-Reply-To: <d4e026c5-d0cd-df5f-56d3-1cf62c3a18bd@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1561337403.4co5diqgun.astroid@bobo.none>
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

Christophe Leroy's on June 19, 2019 10:49 pm:
>=20
>=20
> Le 19/06/2019 =C3=A0 05:59, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Christophe Leroy's on June 11, 2019 4:46 pm:
>>>
>>>
>>> Le 10/06/2019 =C3=A0 05:08, Nicholas Piggin a =C3=A9crit=C2=A0:
>=20
> [snip]
>=20
>>>> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/m=
m/book3s64/radix_pgtable.c
>>>> index c9bcf428dd2b..db993bc1aef3 100644
>>>> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
>>>> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
>>>> @@ -11,6 +11,7 @@
>>>>   =20
>>>>    #define pr_fmt(fmt) "radix-mmu: " fmt
>>>>   =20
>>>> +#include <linux/io.h>
>>>>    #include <linux/kernel.h>
>>>>    #include <linux/sched/mm.h>
>>>>    #include <linux/memblock.h>
>>>> @@ -1122,3 +1123,23 @@ void radix__ptep_modify_prot_commit(struct vm_a=
rea_struct *vma,
>>>>   =20
>>>>    	set_pte_at(mm, addr, ptep, pte);
>>>>    }
>>>> +
>>>> +int radix__ioremap_range(unsigned long ea, phys_addr_t pa, unsigned l=
ong size,
>>>> +			pgprot_t prot, int nid)
>>>> +{
>>>> +	if (likely(slab_is_available())) {
>>>> +		int err =3D ioremap_page_range(ea, ea + size, pa, prot);
>>>> +		if (err)
>>>> +			unmap_kernel_range(ea, size);
>>>> +		return err;
>>>> +	} else {
>>>> +		unsigned long i;
>>>> +
>>>> +		for (i =3D 0; i < size; i +=3D PAGE_SIZE) {
>>>> +			int err =3D map_kernel_page(ea + i, pa + i, prot);
>>>> +			if (WARN_ON_ONCE(err)) /* Should clean up */
>>>> +				return err;
>>>> +		}
>>>
>>> Same loop again.
>>>
>>> What about not doing a radix specific function and just putting
>>> something like below in the core ioremap_range() function ?
>>>
>>> 	if (likely(slab_is_available()) && radix_enabled()) {
>>> 		int err =3D ioremap_page_range(ea, ea + size, pa, prot);
>>>
>>> 		if (err)
>>> 			unmap_kernel_range(ea, size);
>>> 		return err;
>>> 	}
>>>
>>> Because I'm pretty sure will more and more use ioremap_page_range().
>>=20
>> Well I agree the duplication is not so nice, but it's convenient
>> to see what is going on for each MMU type.
>>=20
>> There is a significant amount of churn that needs to be done in
>> this layer so I prefer to make it a bit simpler despite duplication.
>>=20
>> I would like to remove the early ioremap or make it into its own
>> function. Re-implement map_kernel_page with ioremap_page_range,
>> allow page tables that don't use slab to avoid the early check,
>> unbolt the hptes mapped in early boot, etc.
>>=20
>> I just wanted to escape out the 64s and hash/radix implementations
>> completely until that settles.
>=20
> I can understand the benefit in some situations but here I just can't.=20
> And code duplication should be avoided as much as possible as it makes=20
> code maintenance more difficult.
>=20
> Here you have:
>=20
> +static int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned=20
> long size, pgprot_t prot, int nid)
> +{
> +	unsigned long i;
> +
> +	for (i =3D 0; i < size; i +=3D PAGE_SIZE) {
> +		int err =3D map_kernel_page(ea + i, pa + i, prot);
> +		if (err) {
> +			if (slab_is_available())
> +				unmap_kernel_range(ea, size);
> +			else
> +				WARN_ON_ONCE(1); /* Should clean up */
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
>=20
> You now create a new one in another file, that is almost identical:
>=20
> +int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned long size,=20
> pgprot_t prot, int nid)
> +{
> +	unsigned long i;
> +
> +	if (radix_enabled())
> +		return radix__ioremap_range(ea, pa, size, prot, nid);
> +
> +	for (i =3D 0; i < size; i +=3D PAGE_SIZE) {
> +		int err =3D map_kernel_page(ea + i, pa + i, prot);
> +		if (err) {
> +			if (slab_is_available())
> +				unmap_kernel_range(ea, size);
> +			else
> +				WARN_ON_ONCE(1); /* Should clean up */
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
>=20
> Then you have to make the original one __weak.
>=20
> Sorry I'm still having difficulties understanding what the benefit is.
>=20
> radix_enabled() is defined for every platforms so could just add the=20
> following on top of the existing ioremap_range() and voila.
>=20
> +	if (radix_enabled())
> +		return radix__ioremap_range(ea, pa, size, prot, nid);
>=20
>=20
> And with that you wouldn't have the __weak stuff to handle.

I guess so. I don't really like radix_enabled escaping from 64s too
much though. I'll try to improve the code in follow ups if possible.

>>>> -static int ioremap_range(unsigned long ea, phys_addr_t pa, unsigned l=
ong size, pgprot_t prot, int nid)
>>>> +int __weak ioremap_range(unsigned long ea, phys_addr_t pa, unsigned l=
ong size, pgprot_t prot, int nid)
>>>
>>> Hum. Weak functions remain in unused in vmlinux unless
>>> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is selected.
>>>
>>> Also, they are some how dangerous because people might change them
>>> without seeing that it is overridden for some particular configuration.
>>=20
>> Well you shouldn't assume that when you see a weak function, but
>> what's the preferred alternative? A config option?
>=20
> Yes you are right, nobody should assume that, but ...
>=20
> But I think if the fonctions were really different, the preferred=20
> alternative would be to move the original function into a file dedicated=20
> to nohash64.

Possibly we could do that, but we might be able to just collapse these
back to using generic ioremap_page_range.

Thanks,
Nick

=
