Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD787E9A00
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 11:17:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VZo3CTC1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STQNC6Szhz3cW5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 21:17:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VZo3CTC1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STQMP2h4gz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 21:16:49 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cc30bf9e22so31629935ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 02:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699870607; x=1700475407; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxxLg7po90XVw3RnxBZK4jj0bO0hDyH6xNxVERS+obg=;
        b=VZo3CTC1bWhH9A0zadWh0i/0b+MYZWVZnB4BNaKbLTGLfODM4FNs/NEynKseKoLfwD
         1OMf/3mUEmz41CZsERgIz+/oDwAfrPt0Q7/hK/vYjR4gcsUnSfEQ1WGdlIX5eEmEgv8q
         2Bf/kb1+C+8SrmrlRNm2yEPpxkhFuVWtpmxp6tSL7gWC9kfRp5GP91EgpzVrS4KpAzIT
         NFg95GuOAwr173LUyIMp9tR+UXItbj6IVgzmw8+XTKXCJKdqDneRDIyiwILiJcdsMIer
         tO7gy6gf04vgcQtjc+F+M7Je5ZdYOlEf9ikSWFojpyp6Gjvx79yEY1I7McA7r0ft45iF
         W9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699870607; x=1700475407;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NxxLg7po90XVw3RnxBZK4jj0bO0hDyH6xNxVERS+obg=;
        b=R7sb0EurV0KTCHEDZthVIUMeXwsTwjalPL31p8YKBZ8RxmUrADOLunUG16QlvlGrjT
         Zk8/Szy6rxtTB16YKfGlPq8NqNVAU47zKCdLOkglECkHH6MeTEvt7833q3//kYCdCBaA
         oEbpTMX5CkBt5X3Ta6WeF9RuwhaQzrWjQyeDmXLbWNB1vyoqZ6u9hQv9sTnnTj5Sewf1
         oCqcWJDsehV31iEJ6i2gcgJM5gOwViDzIpHOi6gSKYzkXE5iBW/g3DR+rv+kd5vpXW6j
         V/0BPUT84ZCMf3dBv1dIicbjx9a51NeOcNa61i9m2BBucnu0W3BDo/CEl7lLCFgjKqf/
         DtFg==
X-Gm-Message-State: AOJu0YyHfE2iyMEEjPgdZnytecwQ1+Jc9P1ZgPylZ6SQBJy979Vq4UU9
	4BsYB7Bq/r8T6Td3LrtfOPltJT2ivWA=
X-Google-Smtp-Source: AGHT+IFZds9Sqy7v957V/iMycg9dbHrx/N7oyx97G9WoFBDNgfs54xdvMlaPoao3ZtiKnnpkxwI1hw==
X-Received: by 2002:a17:902:f690:b0:1c3:e2eb:f79d with SMTP id l16-20020a170902f69000b001c3e2ebf79dmr15139617plg.8.1699870606594;
        Mon, 13 Nov 2023 02:16:46 -0800 (PST)
Received: from localhost (121-44-82-40.tpgi.com.au. [121.44.82.40])
        by smtp.gmail.com with ESMTPSA id jw6-20020a170903278600b001c444106bcasm3789058plb.46.2023.11.13.02.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 02:16:46 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Nov 2023 20:16:41 +1000
Message-Id: <CWXLU5UP91CT.1AP3JHL6TR6UT@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>, <mpe@ellerman.id.au>,
 <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH] powerpc/book3s/hash: Drop _PAGE_PRIVILEGED from
 PAGE_NONE
X-Mailer: aerc 0.15.2
References: <20231102132327.294050-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20231102132327.294050-1-aneesh.kumar@linux.ibm.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Nov 2, 2023 at 11:23 PM AEST, Aneesh Kumar K.V wrote:
> There used to be a dependency on _PAGE_PRIVILEGED with pte_savedwrite.
> But that got dropped by
> commit 6a56ccbcf6c6 ("mm/autonuma: use can_change_(pte|pmd)_writable() to=
 replace savedwrite")
>
> With this change numa fault pte (pte_protnone()) gets mapped as regular u=
ser pte
> with RWX cleared (no-access).

You mean "that" above change (not *this* change), right?

> This also remove pte_user() from
> book3s/64.

Nice cleanup. That was an annoying hack.

> pte_access_permitted() now checks for _PAGE_EXEC because we now support
> EXECONLY mappings.

AFAIKS pte_exec() is not required, GUP is really only for read or
write access. It should be a separate patch if you think it's needed.

>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 23 +++++---------------
>  arch/powerpc/mm/book3s64/hash_utils.c        | 17 +++++++++++++++
>  2 files changed, 23 insertions(+), 17 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/=
include/asm/book3s/64/pgtable.h
> index cb77eddca54b..7c7de7b56df0 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -17,12 +17,6 @@
>  #define _PAGE_EXEC		0x00001 /* execute permission */
>  #define _PAGE_WRITE		0x00002 /* write access allowed */
>  #define _PAGE_READ		0x00004	/* read access allowed */
> -#define _PAGE_NA		_PAGE_PRIVILEGED
> -#define _PAGE_NAX		_PAGE_EXEC
> -#define _PAGE_RO		_PAGE_READ
> -#define _PAGE_ROX		(_PAGE_READ | _PAGE_EXEC)
> -#define _PAGE_RW		(_PAGE_READ | _PAGE_WRITE)
> -#define _PAGE_RWX		(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC)
>  #define _PAGE_PRIVILEGED	0x00008 /* kernel access only */
>  #define _PAGE_SAO		0x00010 /* Strong access order */
>  #define _PAGE_NON_IDEMPOTENT	0x00020 /* non idempotent memory */

Did you leave PAGE_NONE as _PAGE_BASE | _PAGE_PRIVILEGED below?
Shouldn't that be changed too? Then this patch is not only hash
but also radix.

Why is the hash change required? Previously PAGE_NONE relied on
privileged bit to prevent access, now you need to handle a PTE
without that bit? In that case could that be patch 1, then the
rest patch 2?

__pte_flags_need_flush() should be updated after this too,
basically revert commit 1abce0580b894.

> @@ -119,9 +113,9 @@
>  /*
>   * user access blocked by key
>   */
> -#define _PAGE_KERNEL_RW		(_PAGE_PRIVILEGED | _PAGE_RW | _PAGE_DIRTY)
>  #define _PAGE_KERNEL_RO		 (_PAGE_PRIVILEGED | _PAGE_READ)
>  #define _PAGE_KERNEL_ROX	 (_PAGE_PRIVILEGED | _PAGE_READ | _PAGE_EXEC)
> +#define _PAGE_KERNEL_RW		(_PAGE_PRIVILEGED | _PAGE_RW | _PAGE_DIRTY)
>  #define _PAGE_KERNEL_RWX	(_PAGE_PRIVILEGED | _PAGE_DIRTY | _PAGE_RW | _P=
AGE_EXEC)
>  /*
>   * _PAGE_CHG_MASK masks of bits that are to be preserved across

No need to reorder defines.

Thanks,
Nick

> @@ -523,19 +517,14 @@ static inline bool arch_pte_access_permitted(u64 pt=
e, bool write, bool execute)
>  }
>  #endif /* CONFIG_PPC_MEM_KEYS */
> =20
> -static inline bool pte_user(pte_t pte)
> -{
> -	return !(pte_raw(pte) & cpu_to_be64(_PAGE_PRIVILEGED));
> -}
> -
>  #define pte_access_permitted pte_access_permitted
>  static inline bool pte_access_permitted(pte_t pte, bool write)
>  {
> -	/*
> -	 * _PAGE_READ is needed for any access and will be
> -	 * cleared for PROT_NONE
> -	 */
> -	if (!pte_present(pte) || !pte_user(pte) || !pte_read(pte))
> +
> +	if (!pte_present(pte))
> +		return false;
> +
> +	if (!(pte_read(pte) || pte_exec(pte)))
>  		return false;
> =20
>  	if (write && !pte_write(pte))
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book=
3s64/hash_utils.c
> index ad2afa08e62e..b2eda22195f0 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -310,9 +310,26 @@ unsigned long htab_convert_pte_flags(unsigned long p=
teflags, unsigned long flags
>  			else
>  				rflags |=3D 0x3;
>  		}
> +		WARN_ON(!(pteflags & _PAGE_RWX));
>  	} else {
>  		if (pteflags & _PAGE_RWX)
>  			rflags |=3D 0x2;
> +		else {
> +			/*
> +			 * PAGE_NONE will get mapped to 0b110 (slb key 1 no access)
> +			 * We picked 0b110 instead of 0b000 so that slb key 0 will
> +			 * get only read only access for the same rflags.
> +			 */
> +			if (mmu_has_feature(MMU_FTR_KERNEL_RO))
> +				rflags |=3D (HPTE_R_PP0 | 0x2);
> +			/*
> +			 * rflags =3D HPTE_R_N
> +			 * Without KERNEL_RO feature this will result in slb
> +			 * key 0 with read/write. But ISA only supports that.
> +			 * There is no key 1 no-access and key 0 read-only
> +			 * pp bit support.
> +			 */
> +		}
>  		if (!((pteflags & _PAGE_WRITE) && (pteflags & _PAGE_DIRTY)))
>  			rflags |=3D 0x1;
>  	}

