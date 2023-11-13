Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3E27E9B5F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 12:49:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gFXmhR8t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STSQ51vHtz3dFx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 22:49:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gFXmhR8t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STSNN4FNnz3cTY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 22:47:48 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-357ccaf982eso15919225ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 03:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699876065; x=1700480865; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PKpgMy92VjpNjXGMxK5Wcd2yCxdKp3hyPyliiGiCFk=;
        b=gFXmhR8twFn/m2gBviuKhZD9m2/3TddIfzNIgC3wKL1l874gnArJG7ZICiGzOR0Zyr
         rbGb59PLgztXi1FxGc0H1zUR/oAwMzqLjRI8wD45DWcGO9/7azCn4gXTmVVPVMveheSW
         mS0VSQGhN0P63OiFLbKQP3xEFcgMNGvHOO0AXXEZkBtvbGxm6D+SC07ivgEH2wQR8xpd
         yqWQC6Gil0YNkASItNEKbftLVIiuybLjb6+SknioURtU9Lo63VMywBrgp3Lv6xpD+k5H
         oT5mw8eNc8UGPnpeGUpkUbU3aXBUqg0HtmRbSgqunvkeFoG2yz7+UYnUtWd7VYJ9A1AV
         AhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699876065; x=1700480865;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3PKpgMy92VjpNjXGMxK5Wcd2yCxdKp3hyPyliiGiCFk=;
        b=I8BwEWZRz8nSfazn83McxiQx5QgJc5D67Ebp8gr4fHeKlWxutugFDFyvtPhE4CORCp
         XkA1tj9JVLT5IhGAcPO9ewN/VJw9xpKa0sqNbt3khfo1paVM76S4UURc4JP1+ePfrFTM
         /W34eVtGlNi0+LylNq929NzFPwIlG5nK7GOKKEwh5fbFo8ckhEVNcI+mJPFwhioUAmxv
         gI9bm2LP8ecVhRSr0/RrHsxVQ2G/nGpANoGgUDGKIfAOq9963S5DU3PJk4nHPIii+7iM
         y5HMBhJZDAkOrOV72zt+0PbZG4lEcU3WuwVx/T3O1tOu23xLHsYT0/dl8ewCh/142mLk
         5PdA==
X-Gm-Message-State: AOJu0YwDRKQI1v72j/mJXVgAIkp+jKkr5L35EZl25+X6smJ5M+wjEDWG
	lpNryYTJ+ve7bk52AMP+F0A=
X-Google-Smtp-Source: AGHT+IEVM97GNG++BEZNXFq5wWo/HsktAQJooQ2ZdPZXAk2oP6X2cK58XgKH1r+8cq0ELFgHwTn//Q==
X-Received: by 2002:a05:6e02:1c27:b0:359:4fde:6294 with SMTP id m7-20020a056e021c2700b003594fde6294mr10035133ilh.23.1699876065188;
        Mon, 13 Nov 2023 03:47:45 -0800 (PST)
Received: from localhost (121-44-82-40.tpgi.com.au. [121.44.82.40])
        by smtp.gmail.com with ESMTPSA id e14-20020a056a001a8e00b006c60b150383sm3505753pfv.12.2023.11.13.03.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 03:47:44 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Nov 2023 21:47:40 +1000
Message-Id: <CWXNRTMZNWQG.1SU5NB1QVDLO1@wheely>
Subject: Re: [RFC PATCH] powerpc/book3s/hash: Drop _PAGE_PRIVILEGED from
 PAGE_NONE
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Aneesh Kumar K V" <aneesh.kumar@linux.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>, <mpe@ellerman.id.au>,
 <christophe.leroy@csgroup.eu>
X-Mailer: aerc 0.15.2
References: <20231102132327.294050-1-aneesh.kumar@linux.ibm.com>
 <CWXLU5UP91CT.1AP3JHL6TR6UT@wheely>
 <02b602c0-2b40-4cf9-b0ca-4bc12ac267cd@linux.ibm.com>
In-Reply-To: <02b602c0-2b40-4cf9-b0ca-4bc12ac267cd@linux.ibm.com>
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

On Mon Nov 13, 2023 at 8:45 PM AEST, Aneesh Kumar K V wrote:
> On 11/13/23 3:46 PM, Nicholas Piggin wrote:
> > On Thu Nov 2, 2023 at 11:23 PM AEST, Aneesh Kumar K.V wrote:
> >> There used to be a dependency on _PAGE_PRIVILEGED with pte_savedwrite.
> >> But that got dropped by
> >> commit 6a56ccbcf6c6 ("mm/autonuma: use can_change_(pte|pmd)_writable()=
 to replace savedwrite")
> >>
> >> With this change numa fault pte (pte_protnone()) gets mapped as regula=
r user pte
> >> with RWX cleared (no-access).
> >=20
> > You mean "that" above change (not *this* change), right?
> >=20
>
> With the change in this patch numa fault pte will not have _PAGE_PRIVILEG=
ED set because=20
> PAGE_NONE now maps to just _PAGE_BASE

Right, I guess I was confused because I missed the pgtable-mask.h move.

> >> This also remove pte_user() from
> >> book3s/64.
> >=20
> > Nice cleanup. That was an annoying hack.
> >=20
> >> pte_access_permitted() now checks for _PAGE_EXEC because we now suppor=
t
> >> EXECONLY mappings.
> >=20
> > AFAIKS pte_exec() is not required, GUP is really only for read or
> > write access. It should be a separate patch if you think it's needed.
> >=20
>
> I have a v2 dropping that based on https://lore.kernel.org/linux-mm/87bkc=
1oe8c.fsf@linux.ibm.com=20
> I kept pte_user with pte_access_permitted being the only user. I can open=
 code that
> if needed.=20

I don't mind keeping pte_user() and the check in pte_access_permitted().

> >>
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >> ---
> >>  arch/powerpc/include/asm/book3s/64/pgtable.h | 23 +++++--------------=
-
> >>  arch/powerpc/mm/book3s64/hash_utils.c        | 17 +++++++++++++++
> >>  2 files changed, 23 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/power=
pc/include/asm/book3s/64/pgtable.h
> >> index cb77eddca54b..7c7de7b56df0 100644
> >> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> >> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> >> @@ -17,12 +17,6 @@
> >>  #define _PAGE_EXEC		0x00001 /* execute permission */
> >>  #define _PAGE_WRITE		0x00002 /* write access allowed */
> >>  #define _PAGE_READ		0x00004	/* read access allowed */
> >> -#define _PAGE_NA		_PAGE_PRIVILEGED
> >> -#define _PAGE_NAX		_PAGE_EXEC
> >> -#define _PAGE_RO		_PAGE_READ
> >> -#define _PAGE_ROX		(_PAGE_READ | _PAGE_EXEC)
> >> -#define _PAGE_RW		(_PAGE_READ | _PAGE_WRITE)
> >> -#define _PAGE_RWX		(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC)
> >>  #define _PAGE_PRIVILEGED	0x00008 /* kernel access only */
> >>  #define _PAGE_SAO		0x00010 /* Strong access order */
> >>  #define _PAGE_NON_IDEMPOTENT	0x00020 /* non idempotent memory */
> >=20
> > Did you leave PAGE_NONE as _PAGE_BASE | _PAGE_PRIVILEGED below?
> > Shouldn't that be changed too? Then this patch is not only hash
> > but also radix.
> >=20
>
> A recent patch moved PAGE_NONE to pgtable-mask.h=20
> a5a08dc90f4513d1a78582ec24b687fad01cc843

Thanks I did miss it.

>
> > Why is the hash change required? Previously PAGE_NONE relied on
> > privileged bit to prevent access, now you need to handle a PTE
> > without that bit? In that case could that be patch 1, then the
> > rest patch 2?
> >=20
>
> Looking at older kernel, I guess check_pte_access used _PAGE_PRIVILEGED=
=20
> as a way to prevent access to PAGE_NONE ptes. We now depend on
> _PAGE_READ
>
> > __pte_flags_need_flush() should be updated after this too,
> > basically revert commit 1abce0580b894.
> >=20
>
> Will update the patch to include the revert.
>
> >> @@ -119,9 +113,9 @@
> >>  /*
> >>   * user access blocked by key
> >>   */
> >> -#define _PAGE_KERNEL_RW		(_PAGE_PRIVILEGED | _PAGE_RW | _PAGE_DIRTY)
> >>  #define _PAGE_KERNEL_RO		 (_PAGE_PRIVILEGED | _PAGE_READ)
> >>  #define _PAGE_KERNEL_ROX	 (_PAGE_PRIVILEGED | _PAGE_READ | _PAGE_EXEC=
)
> >> +#define _PAGE_KERNEL_RW		(_PAGE_PRIVILEGED | _PAGE_RW | _PAGE_DIRTY)
> >>  #define _PAGE_KERNEL_RWX	(_PAGE_PRIVILEGED | _PAGE_DIRTY | _PAGE_RW |=
 _PAGE_EXEC)
> >>  /*
> >>   * _PAGE_CHG_MASK masks of bits that are to be preserved across
> >=20
> > No need to reorder defines.
> >=20
>
> ok
>
>
> > Thanks,
> > Nick
> >=20
> >> @@ -523,19 +517,14 @@ static inline bool arch_pte_access_permitted(u64=
 pte, bool write, bool execute)
> >>  }
> >>  #endif /* CONFIG_PPC_MEM_KEYS */
> >> =20
> >> -static inline bool pte_user(pte_t pte)
> >> -{
> >> -	return !(pte_raw(pte) & cpu_to_be64(_PAGE_PRIVILEGED));
> >> -}
> >> -
> >>  #define pte_access_permitted pte_access_permitted
> >>  static inline bool pte_access_permitted(pte_t pte, bool write)
> >>  {
> >> -	/*
> >> -	 * _PAGE_READ is needed for any access and will be
> >> -	 * cleared for PROT_NONE
> >> -	 */
> >> -	if (!pte_present(pte) || !pte_user(pte) || !pte_read(pte))
> >> +
> >> +	if (!pte_present(pte))
> >> +		return false;
> >> +
> >> +	if (!(pte_read(pte) || pte_exec(pte)))
> >>  		return false;
> >> =20
> >>  	if (write && !pte_write(pte))
> >> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/b=
ook3s64/hash_utils.c
> >> index ad2afa08e62e..b2eda22195f0 100644
> >> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> >> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> >> @@ -310,9 +310,26 @@ unsigned long htab_convert_pte_flags(unsigned lon=
g pteflags, unsigned long flags
> >>  			else
> >>  				rflags |=3D 0x3;
> >>  		}
> >> +		WARN_ON(!(pteflags & _PAGE_RWX));
> >>  	} else {
> >>  		if (pteflags & _PAGE_RWX)
> >>  			rflags |=3D 0x2;
> >> +		else {
> >> +			/*
> >> +			 * PAGE_NONE will get mapped to 0b110 (slb key 1 no access)
> >> +			 * We picked 0b110 instead of 0b000 so that slb key 0 will
> >> +			 * get only read only access for the same rflags.
> >> +			 */
> >> +			if (mmu_has_feature(MMU_FTR_KERNEL_RO))
> >> +				rflags |=3D (HPTE_R_PP0 | 0x2);
> >> +			/*
> >> +			 * rflags =3D HPTE_R_N
> >> +			 * Without KERNEL_RO feature this will result in slb
> >> +			 * key 0 with read/write. But ISA only supports that.
> >> +			 * There is no key 1 no-access and key 0 read-only
> >> +			 * pp bit support.
> >> +			 */
> >> +		}
> >>  		if (!((pteflags & _PAGE_WRITE) && (pteflags & _PAGE_DIRTY)))
> >>  			rflags |=3D 0x1;
> >>  	}
> >=20
>
> V2 is also dropping the above change, because we will never have hash tab=
le entries inserted.=20
>
> This is added to commit message.
>
>     Hash fault handling code did get some WARN_ON added because those
>     functions are not expected to get called with _PAGE_READ cleared.
>     commit 18061c17c8ec ("powerpc/mm: Update PROTFAULT handling in the pa=
ge fault path")
>     explains the details.

Should it be a WARN_ON_ONCE? Any useful way to recover from it? Could
the added WARN come with some comments from that commit that explain
it?

Thanks,
Nick

