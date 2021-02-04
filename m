Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC6D30EAE1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 04:24:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWP774kn3zDwqn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 14:24:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FYI8wFHP; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWP5c2cJRzDwpc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 14:23:28 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id o63so1164780pgo.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Feb 2021 19:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=2p3pUBdY1h3+/I+uMKphCmeip/rUaX6KNV7mEykP7XM=;
 b=FYI8wFHP/GuSBPUntQS2XigFbbh+/+Xl/ANQy4yAyh4dA9JCECPoFBhbH35xhMlLIB
 9JKcBOQCsz2/bIZipKRuR955rkZTxmecGYV8DcVACWfmZ6sYXfwPI9C7k3xixpHrUe5L
 YWBO7YMygchoZ0VsTwt1nbjzezI7iEooCHbyF/eNLiZ4Jx4pJucIgLongB1ckYJaRsEn
 8qQU5XQtBzjCzzscENMGzEuRGTh1HzCLAet69h/eZrerYj8AqNuV18EYyPBTBkefJl6l
 nmCOK1Cdh/cH7T51zQd9AOyCsk4hAc/VZGG4DnMPr8oLlYO1eH96xJALl4KwFngT2ciR
 HCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=2p3pUBdY1h3+/I+uMKphCmeip/rUaX6KNV7mEykP7XM=;
 b=hUHIUkDMiLe55TLI1MsWtpP6npf9xQ2ww96qMet02+5AHaA60M8Z0Li20Uy0Eh8ITx
 Xr9VtyP6YjJIPrRsf3OqxlzFM8luxVXiMvmhu6jw+FTCySu9UjdBXKgkadWO+l8fy4GU
 Y0/S8g4kHR9MBJgF2iJLwwydWoqtP9RE+jGj3tHlm6pSt0rtwQlnVNrMx5xEfAsLKXfT
 gmB6TL/Jr9OHAQMmSnQ4IuGX/LSMGoBGDUCTACl7pGvfxrTvfERu7+1b9QSLTmKXsrYy
 e3S5gORSTd0x7KxOCx6oW2kbFT36KfemUtd8CisexQIThsnR+NsmAu2VzSDkHobQwc3U
 FLtg==
X-Gm-Message-State: AOAM5325Xa4UNsrdzsvvTcSCmcsj1IUFGbWjWJi8wCV4LJuN51cG/jwK
 kjPCMtppy9AopK/wZIlpWi4=
X-Google-Smtp-Source: ABdhPJxrRli+GguIfnzaEVtdGLQNmKkSt3XzVijYqT3k/PJdRKG54vWXd6aG39jHcLMPXegMEPGP1Q==
X-Received: by 2002:aa7:972c:0:b029:1bb:15d2:3b9f with SMTP id
 k12-20020aa7972c0000b02901bb15d23b9fmr5915894pfg.25.1612409004570; 
 Wed, 03 Feb 2021 19:23:24 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id x17sm3714593pff.180.2021.02.03.19.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 19:23:24 -0800 (PST)
Date: Thu, 04 Feb 2021 13:23:18 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] mm/memory.c: Remove pte_sw_mkyoung()
To: Andrew Morton <akpm@linux-foundation.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
References: <f302ef92c48d1f08a0459aaee1c568ca11213814.1612345700.git.christophe.leroy@csgroup.eu>
 <20210203164630.ada46d0c84e0e9f0a474b283@linux-foundation.org>
In-Reply-To: <20210203164630.ada46d0c84e0e9f0a474b283@linux-foundation.org>
MIME-Version: 1.0
Message-Id: <1612408831.1l3aypsvyz.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jia He <justin.he@arm.com>, linux-kernel@vger.kernel.org,
 Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andrew Morton's message of February 4, 2021 10:46 am:
> On Wed,  3 Feb 2021 10:19:44 +0000 (UTC) Christophe Leroy <christophe.ler=
oy@csgroup.eu> wrote:
>=20
>> Commit 83d116c53058 ("mm: fix double page fault on arm64 if PTE_AF
>> is cleared") introduced arch_faults_on_old_pte() helper to identify
>> platforms that don't set page access bit in HW and require a page
>> fault to set it.
>>=20
>> Commit 44bf431b47b4 ("mm/memory.c: Add memory read privilege on page
>> fault handling") added pte_sw_mkyoung() which is yet another way to
>> manage platforms that don't set page access bit in HW and require a
>> page fault to set it.
>>=20
>> Remove that pte_sw_mkyoung() helper and use the already existing
>> arch_faults_on_old_pte() helper together with pte_mkyoung() instead.
>=20
> This conflicts with mm/memory.c changes in linux-next.  In
> do_set_pte().  Please check my efforts:

I wanted to just get rid of it completely --

https://marc.info/?l=3Dlinux-mm&m=3D160860750115163&w=3D2

Waiting for MIPs to get that patch mentioned merged or nacked but
as yet seems to be no response from maintainers.

https://lore.kernel.org/linux-arch/20201019081257.32127-1-huangpei@loongson=
.cn/

Thanks,
Nick

>=20
> --- a/arch/mips/include/asm/pgtable.h~mm-memoryc-remove-pte_sw_mkyoung
> +++ a/arch/mips/include/asm/pgtable.h
> @@ -406,8 +406,6 @@ static inline pte_t pte_mkyoung(pte_t pt
>  	return pte;
>  }
> =20
> -#define pte_sw_mkyoung	pte_mkyoung
> -
>  #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
>  static inline int pte_huge(pte_t pte)	{ return pte_val(pte) & _PAGE_HUGE=
; }
> =20
> --- a/include/linux/pgtable.h~mm-memoryc-remove-pte_sw_mkyoung
> +++ a/include/linux/pgtable.h
> @@ -424,22 +424,6 @@ static inline void ptep_set_wrprotect(st
>  }
>  #endif
> =20
> -/*
> - * On some architectures hardware does not set page access bit when acce=
ssing
> - * memory page, it is responsibilty of software setting this bit. It bri=
ngs
> - * out extra page fault penalty to track page access bit. For optimizati=
on page
> - * access bit can be set during all page fault flow on these arches.
> - * To be differentiate with macro pte_mkyoung, this macro is used on pla=
tforms
> - * where software maintains page access bit.
> - */
> -#ifndef pte_sw_mkyoung
> -static inline pte_t pte_sw_mkyoung(pte_t pte)
> -{
> -	return pte;
> -}
> -#define pte_sw_mkyoung	pte_sw_mkyoung
> -#endif
> -
>  #ifndef pte_savedwrite
>  #define pte_savedwrite pte_write
>  #endif
> --- a/mm/memory.c~mm-memoryc-remove-pte_sw_mkyoung
> +++ a/mm/memory.c
> @@ -2902,7 +2902,8 @@ static vm_fault_t wp_page_copy(struct vm
>  		}
>  		flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
>  		entry =3D mk_pte(new_page, vma->vm_page_prot);
> -		entry =3D pte_sw_mkyoung(entry);
> +		if (arch_faults_on_old_pte())
> +			entry =3D pte_mkyoung(entry);
>  		entry =3D maybe_mkwrite(pte_mkdirty(entry), vma);
> =20
>  		/*
> @@ -3560,7 +3561,8 @@ static vm_fault_t do_anonymous_page(stru
>  	__SetPageUptodate(page);
> =20
>  	entry =3D mk_pte(page, vma->vm_page_prot);
> -	entry =3D pte_sw_mkyoung(entry);
> +	if (arch_faults_on_old_pte())
> +		entry =3D pte_mkyoung(entry);
>  	if (vma->vm_flags & VM_WRITE)
>  		entry =3D pte_mkwrite(pte_mkdirty(entry));
> =20
> @@ -3745,8 +3747,8 @@ void do_set_pte(struct vm_fault *vmf, st
> =20
>  	if (prefault && arch_wants_old_prefaulted_pte())
>  		entry =3D pte_mkold(entry);
> -	else
> -		entry =3D pte_sw_mkyoung(entry);
> +	else if (arch_faults_on_old_pte())
> +		entry =3D pte_mkyoung(entry);
> =20
>  	if (write)
>  		entry =3D maybe_mkwrite(pte_mkdirty(entry), vma);
> _
>=20
>=20
>=20
