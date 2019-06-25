Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF36551FDE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 02:23:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Xn1g5qN5zDqVq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 10:23:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lCqYJd0f"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Xmzg3ZvFzDqSt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 10:21:19 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id i189so8419584pfg.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 17:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=9GWfUGprvA4ILcpimuVJoGtm5PW6KPiiPRGCbFZh52w=;
 b=lCqYJd0fDqFS6i7DNl565RTG+AMIJ12ZQw/A8KlWcTmhSBSVfi7R1JjAyw0diyQp5w
 0icVERPM79uGIRc4rPDhlMIs9Eo2BQh1ycTUT9KC3ODr0hA1PyMBys+Jaotlrqmw8rAA
 Wt8yT3wpCentyV+O8DJ5e6cvFVmdPSqFV2Kc8+YOWKsXjw4VYlWdsJC5lXkAL0PqpP0o
 73Yf4SJ4tYZJkdlgJGAysG7Ig2VZPMOIU5e0ItUS6tJ6xASc27CJzVnMXH5w13pWwPWd
 Jr57070WGncwHZKG0t81ad61He+o8mdJstJQKs1+pRI7NVN6/ZXpvO99jSOqxg8lWbPb
 L5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=9GWfUGprvA4ILcpimuVJoGtm5PW6KPiiPRGCbFZh52w=;
 b=UQLUkBcbyeWkpuEFP4q9WULDFFlvewOrCGdmTKg1UfzY/s2IoEjlvNZ7FQkNiHMVNp
 mic+uRVgp3MelTcZVxV6ZrkOgzIVq9vfqrC55PSiCeKoVPI2E/6Ils8hHqTGLUiiLd5d
 kqwL0MFqFstpenfLlky5RzK0Ia2Y5x6rRStpu5yWP7HByYObWvUcXtH7cneP+Bn6Y/m3
 s4xk5hO4urhIVEG450k2jZYOT962W/3X2/jcVhLR4mx8gDMhIPoQoBtVGTRHljrmmLMh
 UiZ+RT23zn/EHnSDVDr9PN6/Jah3dYi4l0PxpQUS2JmHityebau17wqwL6NylTwiAYLV
 HUHg==
X-Gm-Message-State: APjAAAUspfOAJPD2ZVMZzXESIrSrxcDAOzpteNTEJXY+0vrU4dbNCZkz
 W/qXVhoVd1ZiU30VwadLDko=
X-Google-Smtp-Source: APXvYqyinR+SxTKAhy01mEzpneT2onpFntPNglVujvIPVOk7YeZhmGjQ045hT6anajo5VX8LeLss3w==
X-Received: by 2002:a65:4c0c:: with SMTP id u12mr35552980pgq.130.1561422075888; 
 Mon, 24 Jun 2019 17:21:15 -0700 (PDT)
Received: from localhost ([1.129.213.195])
 by smtp.gmail.com with ESMTPSA id j23sm13670632pgb.63.2019.06.24.17.21.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 17:21:14 -0700 (PDT)
Date: Tue, 25 Jun 2019 10:20:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/3] mm/vmalloc: fix vmalloc_to_page for huge vmap mappings
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <20190623094446.28722-1-npiggin@gmail.com>
 <20190623094446.28722-4-npiggin@gmail.com>
 <8668f76d-faad-4e57-2f7b-f2b8969b1026@arm.com>
In-Reply-To: <8668f76d-faad-4e57-2f7b-f2b8969b1026@arm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1561421882.9uwq6zqlvo.astroid@bobo.none>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anshuman Khandual's on June 24, 2019 4:52 pm:
>=20
>=20
> On 06/23/2019 03:14 PM, Nicholas Piggin wrote:
>> vmalloc_to_page returns NULL for addresses mapped by larger pages[*].
>> Whether or not a vmap is huge depends on the architecture details,
>> alignments, boot options, etc., which the caller can not be expected
>> to know. Therefore HUGE_VMAP is a regression for vmalloc_to_page.
>>=20
>> This change teaches vmalloc_to_page about larger pages, and returns
>> the struct page that corresponds to the offset within the large page.
>> This makes the API agnostic to mapping implementation details.
>>=20
>> [*] As explained by commit 029c54b095995 ("mm/vmalloc.c: huge-vmap:
>>     fail gracefully on unexpected huge vmap mappings")
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  include/asm-generic/4level-fixup.h |  1 +
>>  include/asm-generic/5level-fixup.h |  1 +
>>  mm/vmalloc.c                       | 37 +++++++++++++++++++-----------
>>  3 files changed, 26 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/include/asm-generic/4level-fixup.h b/include/asm-generic/4l=
evel-fixup.h
>> index e3667c9a33a5..3cc65a4dd093 100644
>> --- a/include/asm-generic/4level-fixup.h
>> +++ b/include/asm-generic/4level-fixup.h
>> @@ -20,6 +20,7 @@
>>  #define pud_none(pud)			0
>>  #define pud_bad(pud)			0
>>  #define pud_present(pud)		1
>> +#define pud_large(pud)			0
>>  #define pud_ERROR(pud)			do { } while (0)
>>  #define pud_clear(pud)			pgd_clear(pud)
>>  #define pud_val(pud)			pgd_val(pud)
>> diff --git a/include/asm-generic/5level-fixup.h b/include/asm-generic/5l=
evel-fixup.h
>> index bb6cb347018c..c4377db09a4f 100644
>> --- a/include/asm-generic/5level-fixup.h
>> +++ b/include/asm-generic/5level-fixup.h
>> @@ -22,6 +22,7 @@
>>  #define p4d_none(p4d)			0
>>  #define p4d_bad(p4d)			0
>>  #define p4d_present(p4d)		1
>> +#define p4d_large(p4d)			0
>>  #define p4d_ERROR(p4d)			do { } while (0)
>>  #define p4d_clear(p4d)			pgd_clear(p4d)
>>  #define p4d_val(p4d)			pgd_val(p4d)
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 4c9e150e5ad3..4be98f700862 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -36,6 +36,7 @@
>>  #include <linux/rbtree_augmented.h>
>> =20
>>  #include <linux/uaccess.h>
>> +#include <asm/pgtable.h>
>>  #include <asm/tlbflush.h>
>>  #include <asm/shmparam.h>
>> =20
>> @@ -284,26 +285,36 @@ struct page *vmalloc_to_page(const void *vmalloc_a=
ddr)
>> =20
>>  	if (pgd_none(*pgd))
>>  		return NULL;
>> +
>>  	p4d =3D p4d_offset(pgd, addr);
>>  	if (p4d_none(*p4d))
>>  		return NULL;
>> -	pud =3D pud_offset(p4d, addr);
>> +	if (WARN_ON_ONCE(p4d_bad(*p4d)))
>> +		return NULL;
>=20
> The warning here is a required addition but it needs to be moved after p4=
d_large()
> check. Please see the next comment below.
>=20
>> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
>> +	if (p4d_large(*p4d))
>> +		return p4d_page(*p4d) + ((addr & ~P4D_MASK) >> PAGE_SHIFT);
>> +#endif
>> =20
>> -	/*
>> -	 * Don't dereference bad PUD or PMD (below) entries. This will also
>> -	 * identify huge mappings, which we may encounter on architectures
>> -	 * that define CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy. Such regions will be
>> -	 * identified as vmalloc addresses by is_vmalloc_addr(), but are
>> -	 * not [unambiguously] associated with a struct page, so there is
>> -	 * no correct value to return for them.
>> -	 */
>> -	WARN_ON_ONCE(pud_bad(*pud));
>> -	if (pud_none(*pud) || pud_bad(*pud))
>> +	pud =3D pud_offset(p4d, addr);
>> +	if (pud_none(*pud))
>> +		return NULL;
>> +	if (WARN_ON_ONCE(pud_bad(*pud)))
>>  		return NULL;
>> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
>> +	if (pud_large(*pud))
>> +		return pud_page(*pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
>> +#endif
>> +
>=20
> pud_bad() on arm64 returns true when the PUD does not point to a next pag=
e
> table page implying the fact that it might be a large/huge entry. I am no=
t
> sure if the semantics holds good for other architectures too. But on arm6=
4
> if pud_large() is true, then pud_bad() will be true as well. So pud_bad()
> check must happen after pud_large() check. So the sequence here should be
>=20
> 1. pud_none()	--> Nothing is in here, return NULL
> 2. pud_large()	--> Return offset page address from the huge page mapping
> 3. pud_bad()	--> Return NULL as there is no more page table level left
>=20
> Checking pud_bad() first can return NULL for a valid huge mapping.
>=20
>>  	pmd =3D pmd_offset(pud, addr);
>> -	WARN_ON_ONCE(pmd_bad(*pmd));
>> -	if (pmd_none(*pmd) || pmd_bad(*pmd))
>> +	if (pmd_none(*pmd))
>> +		return NULL;
>> +	if (WARN_ON_ONCE(pmd_bad(*pmd)))
>>  		return NULL;
>> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
>> +	if (pmd_large(*pmd))
>> +		return pmd_page(*pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
>> +#endif
>=20
> Ditto.
>=20
> I see that your previous proposal had this right which got changed in thi=
s
> manner after my comments. Sorry about it.
>=20
> It was recently when I learned (correctly) that expected semantics of pxx=
_bad()
> is that - It does not point to the next page table page.  Hence I wonder =
why is
> this not renamed as pxx_table() instead to make it absolutely clear.
>=20

Okay, I'll change it and resend. It worked okay on powerpc but it
looks like the usual precedent is testing for large before bad so we
will have to go with that.

Thanks,
Nick
=
