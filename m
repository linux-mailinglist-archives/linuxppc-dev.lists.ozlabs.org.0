Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A573DFAF6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 07:15:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gfg0h2Gdnz3d7s
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 15:15:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=C0Ck3geE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C0Ck3geE; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gfg0C30Wsz2yLh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 15:14:34 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so7160037pjs.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Aug 2021 22:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=g2lEclpK8rx1SxIedmLq/RnIwOdwyXFvHeDeTMr9HDM=;
 b=C0Ck3geEryRzahd+bxFsI4qgXJucnZzpVkrOMejBVaaskUW0ERJc2tAOAykQcHoYAU
 wc31TLWGa/uRT5C72c8rLl1Rwuwo27j/tCuffqlosRe4QR1CZVOvc4C2nXXZzIwTER4c
 CQOBe3RKevOdw4Qp2itcbEn69dduvqshl/NnfC4/KIlknfzATS0kRynFlvnCv6PdgN5W
 pVji9Bel4zr9eitlopANPCOp+MGTOqUA8ZznpWWr5/EIEdcuyfCTEFPGSFhdvr4bfK9q
 XVVih5YzH9HHXRHIBCqmH34TSedSPJB891y/4ZAh7nF9nMAybzrUvohlHSFk6QJL92i4
 fUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=g2lEclpK8rx1SxIedmLq/RnIwOdwyXFvHeDeTMr9HDM=;
 b=QbfN2WLTRyq1jV4eXS+q1gU6E2oocuw8v4R4SmX32d6z8tAAquNuOobxxXFIa3/mAv
 gcCFYIGoB5IHXKACuQpa0EmJ/9Osi8GnUY2FmyS6WuExSD5FwysfQG+2RWO0sCWCByqy
 /oGap59CJEM5gx++lssiIM58A6FR/w4eIPDUn2XT/SItPv0q9kEZYlxyKHCwy5tiNq/Y
 peHK2VljzJXBhQZZJiS0PlAtM0yJZ6d1bJTZMsuQlqIz3zFtVabkM5nS0iHFiG/qXp+d
 Dw/nDxKShB3OlN3mt/geKRGAaDrBttO1EeD3Ncs83dSo8CO2h2GXIQ5uz/WlkRyzoDVG
 088A==
X-Gm-Message-State: AOAM5315iE17U6ltLa+s0QiQRsVSPOZE15OYWdArjlOW3gcJ6rmKXxNE
 6gCjwwCm/wNE+HIBa6jhg9M=
X-Google-Smtp-Source: ABdhPJyZw/u9guwaqSLigzQ95ESE/UIP7wKoGzzdh+MTpbf+trrBhpGNmJXFHqfksETGDPaBKK4sEA==
X-Received: by 2002:a63:d458:: with SMTP id i24mr738383pgj.289.1628054068123; 
 Tue, 03 Aug 2021 22:14:28 -0700 (PDT)
Received: from localhost (60-242-181-102.static.tpgi.com.au. [60.242.181.102])
 by smtp.gmail.com with ESMTPSA id
 l6sm975210pff.74.2021.08.03.22.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 22:14:27 -0700 (PDT)
Date: Wed, 04 Aug 2021 15:14:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] powerpc/book3s64/radix: Upgrade va tlbie to PID tlbie
 if we cross PMD_SIZE
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20210803143725.615186-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210803143725.615186-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1628053302.0qclx0xcj9.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Aneesh Kumar K.V's message of August 4, 2021 12:37 am:
> With shared mapping, even though we are unmapping a large range, the kern=
el
> will force a TLB flush with ptl lock held to avoid the race mentioned in
> commit 1cf35d47712d ("mm: split 'tlb_flush_mmu()' into tlb flushing and m=
emory freeing parts")
> This results in the kernel issuing a high number of TLB flushes even for =
a large
> range. This can be improved by making sure the kernel switch to pid based=
 flush if the
> kernel is unmapping a 2M range.

It would be good to have a bit more description here.

In any patch that changes a heuristic like this, I would like to see=20
some justification or reasoning that could be refuted or used as a=20
supporting argument if we ever wanted to change the heuristic later.
Ideally with some of the obvious downsides listed as well.

This "improves" things here, but what if it hurt things elsewhere, how=20
would we come in later and decide to change it back?

THP flushes for example, I think now they'll do PID flushes (if they=20
have to be broadcast, which they will tend to be when khugepaged does
them). So now that might increase jitter for THP and cause it to be a
loss for more workloads.

So where do you notice this? What's the benefit?

>=20
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/radix_tlb.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3=
s64/radix_tlb.c
> index aefc100d79a7..21d0f098e43b 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -1106,7 +1106,7 @@ EXPORT_SYMBOL(radix__flush_tlb_kernel_range);
>   * invalidating a full PID, so it has a far lower threshold to change fr=
om
>   * individual page flushes to full-pid flushes.
>   */
> -static unsigned long tlb_single_page_flush_ceiling __read_mostly =3D 33;
> +static unsigned long tlb_single_page_flush_ceiling __read_mostly =3D 32;
>  static unsigned long tlb_local_single_page_flush_ceiling __read_mostly =
=3D POWER9_TLB_SETS_RADIX * 2;
> =20
>  static inline void __radix__flush_tlb_range(struct mm_struct *mm,
> @@ -1133,7 +1133,7 @@ static inline void __radix__flush_tlb_range(struct =
mm_struct *mm,
>  	if (fullmm)
>  		flush_pid =3D true;
>  	else if (type =3D=3D FLUSH_TYPE_GLOBAL)
> -		flush_pid =3D nr_pages > tlb_single_page_flush_ceiling;
> +		flush_pid =3D nr_pages >=3D tlb_single_page_flush_ceiling;

Arguably >=3D is nicer than > here, but this shouldn't be in the same=20
patch as the value change.

>  	else
>  		flush_pid =3D nr_pages > tlb_local_single_page_flush_ceiling;

And it should change everything to be consistent. Although I'm not sure=20
it's worth changing even though I highly doubt any administrator would
be tweaking this.

Thanks,
Nick

>  	/*
> @@ -1335,7 +1335,7 @@ static void __radix__flush_tlb_range_psize(struct m=
m_struct *mm,
>  	if (fullmm)
>  		flush_pid =3D true;
>  	else if (type =3D=3D FLUSH_TYPE_GLOBAL)
> -		flush_pid =3D nr_pages > tlb_single_page_flush_ceiling;
> +		flush_pid =3D nr_pages >=3D tlb_single_page_flush_ceiling;
>  	else
>  		flush_pid =3D nr_pages > tlb_local_single_page_flush_ceiling;
> =20
> @@ -1505,7 +1505,7 @@ void do_h_rpt_invalidate_prt(unsigned long pid, uns=
igned long lpid,
>  			continue;
> =20
>  		nr_pages =3D (end - start) >> def->shift;
> -		flush_pid =3D nr_pages > tlb_single_page_flush_ceiling;
> +		flush_pid =3D nr_pages >=3D tlb_single_page_flush_ceiling;
> =20
>  		/*
>  		 * If the number of pages spanning the range is above
> --=20
> 2.31.1
>=20
>=20
