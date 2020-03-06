Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A9217B5D7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 05:52:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YZwm41FnzDr0K
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 15:52:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=e/Ei7Y5I; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YZv45rlQzDqFS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 15:50:56 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id j7so1181372qkd.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 20:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0wipnWw1cldWf5kaoeA+yDqtsFNc3E5tyyjbRgywYFs=;
 b=e/Ei7Y5Ik8WM1Taux+DExv+Jv/Fqylv3LWaQkFS1tZS+VrdFV5zge1M+oSCL4N6nh1
 kqFutv0Jhd1kKJrkscv0XC4U8PWfWKvyp3UwW0tl0lYe99dOzId8l7/YWA1Xv+08VLY7
 hDJuO8ZOTI4vrG1s7V8krX9kJIqrXheC0YSn2thFWrdtdf55B18kKm6SouQ/651zKGQe
 w6qrjn9AzZRZiIJD/tYfimUsaWF6T2SnV5KzAUzqTJ6hVwCwgw3BQORlcmjO/INQpYpH
 /OGE6z0l6tphlsbCSsGA6ecMIRTXWlG6RPo9hVW3aJY8iZn1Laz5XEu2ALoMD9XX1pJD
 Lltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0wipnWw1cldWf5kaoeA+yDqtsFNc3E5tyyjbRgywYFs=;
 b=alY1xh4/H+1yk9f1488abdidvOhhNwNR+hKWsFjtAdeFi8htCVKOVsUkiYTeCQr5zs
 ihDFv8xyyywTCRxVH+vy1mJ3GuSj4oue7n/UWvFuR2niSQ3XQwTeGvGNAXITUCPdcqLB
 s/LkH+L083yWNruAjac/yuqvy7PrAI9ljnifOWaDggU7/H4MCKo6a7neUL5HgzLD5yBl
 QCuD2q0o0Xghdi8H1hdjwi4iebzYBpnNqdnUHqwyKvQMO+2J9rHv5pHmGTVGb1cTq1DN
 v5Iwj+CmH6PIyiXbadHkZyt13QOW3hvkevRSbYPRBTRfFCwi1Ir6XQXODoTIOmufWqc+
 75Gw==
X-Gm-Message-State: ANhLgQ2//Hj5iPP8nn1NAk+fwJqldBLZf3jA+/gsUlzjJv7FOJ6woIM8
 CTONVCcxxI8szo3Tyb0dpRyojA==
X-Google-Smtp-Source: ADFU+vtic/BvcsQbXvszV0ThZDIcumBI/9MYEWzwIe8iZkHUwmR0NoS2w+h/h8sIk6M2DubtQ4nVmA==
X-Received: by 2002:a37:a08b:: with SMTP id j133mr1326092qke.265.1583470253067; 
 Thu, 05 Mar 2020 20:50:53 -0800 (PST)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id b5sm7520197qkk.16.2020.03.05.20.50.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Mar 2020 20:50:52 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH -next v2] powerpc/64s/pgtable: fix an undefined behaviour
From: Qian Cai <cai@lca.pw>
In-Reply-To: <a082f4c3-db68-6ca3-c832-b1abb5363e3a@c-s.fr>
Date: Thu, 5 Mar 2020 23:50:51 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <A40C59F0-B4E2-4A6B-B3AF-0173C93DEB9C@lca.pw>
References: <1583418759-16105-1-git-send-email-cai@lca.pw>
 <a082f4c3-db68-6ca3-c832-b1abb5363e3a@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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
Cc: rashmicy@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Mar 5, 2020, at 2:22 PM, Christophe Leroy <christophe.leroy@c-s.fr> =
wrote:
>=20
>=20
>=20
> Le 05/03/2020 =C3=A0 15:32, Qian Cai a =C3=A9crit :
>> Booting a power9 server with hash MMU could trigger an undefined
>> behaviour because pud_offset(p4d, 0) will do,
>> 0 >> (PAGE_SHIFT:16 + PTE_INDEX_SIZE:8 + H_PMD_INDEX_SIZE:10)
>> Fix it by converting pud_offset() and friends to static inline
>> functions.
>=20
> I was suggesting to convert pud_index() to static inline, because =
that's where the shift sits. Is it not possible ?
>=20
> Here you seems to fix the problem for now, but if someone reuses =
pud_index() in another macro one day, the same problem may happen again.
>=20

Sounds reasonable. I send out a v3,

https://lore.kernel.org/lkml/20200306044852.3236-1-cai@lca.pw/T/#u

> Christophe
>=20
>>  UBSAN: shift-out-of-bounds in arch/powerpc/mm/ptdump/ptdump.c:282:15
>>  shift exponent 34 is too large for 32-bit type 'int'
>>  CPU: 6 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc4-next-20200303+ =
#13
>>  Call Trace:
>>  dump_stack+0xf4/0x164 (unreliable)
>>  ubsan_epilogue+0x18/0x78
>>  __ubsan_handle_shift_out_of_bounds+0x160/0x21c
>>  walk_pagetables+0x2cc/0x700
>>  walk_pud at arch/powerpc/mm/ptdump/ptdump.c:282
>>  (inlined by) walk_pagetables at arch/powerpc/mm/ptdump/ptdump.c:311
>>  ptdump_check_wx+0x8c/0xf0
>>  mark_rodata_ro+0x48/0x80
>>  kernel_init+0x74/0x194
>>  ret_from_kernel_thread+0x5c/0x74
>> Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> Signed-off-by: Qian Cai <cai@lca.pw>
>> ---
>>  arch/powerpc/include/asm/book3s/64/pgtable.h | 20 =
++++++++++++++------
>>  1 file changed, 14 insertions(+), 6 deletions(-)
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h =
b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> index fa60e8594b9f..4967bc9e25e2 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -1016,12 +1016,20 @@ static inline bool p4d_access_permitted(p4d_t =
p4d, bool write)
>>    #define pgd_offset(mm, address)	 ((mm)->pgd + =
pgd_index(address))
>>  -#define pud_offset(p4dp, addr)	\
>> -	(((pud_t *) p4d_page_vaddr(*(p4dp))) + pud_index(addr))
>> -#define pmd_offset(pudp,addr) \
>> -	(((pmd_t *) pud_page_vaddr(*(pudp))) + pmd_index(addr))
>> -#define pte_offset_kernel(dir,addr) \
>> -	(((pte_t *) pmd_page_vaddr(*(dir))) + pte_index(addr))
>> +static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
>> +{
>> +	return (pud_t *)p4d_page_vaddr(*p4d) + pud_index(address);
>> +}
>> +
>> +static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
>> +{
>> +	return (pmd_t *)pud_page_vaddr(*pud) + pmd_index(address);
>> +}
>> +
>> +static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long =
address)
>> +{
>> +	return (pte_t *)pmd_page_vaddr(*pmd) + pte_index(address);
>> +}
>>    #define pte_offset_map(dir,addr)	pte_offset_kernel((dir), (addr))
>> =20

