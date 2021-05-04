Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBDA372896
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 12:15:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZG1f6KLZz3bTs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 20:15:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oM+ogurN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oM+ogurN; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZG0n594bz303Q
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 20:14:33 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id y30so6374775pgl.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 03:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=7iDm+iy2vv0gvGhRKV9ucXH0e1bBgrE+86qry7t/ENk=;
 b=oM+ogurNOu4EOIZYwS8ZYM5Y409XYeBzXlWzgGM/pFIGDYlVjmuHgsP3Pkmc8aeDa4
 zaXjsBCEilPgNNHXLevQnq5Trb/duTBGWwcODXkYn3Q+uUimppR2Q4pecRdp7pDrQETM
 3fkTSwMRnnKj3d0EkQUGHebEefKSCtbGH4C1L2JsWsF6tGnW42yeLyFAnCw134HnYZg5
 Hy1D6jBkzyXwftlsAQbjzRBValsXd41hoM0wJJtOgvdy+CbwNnlt+8EUowFXXRg30G74
 0flltxjqjiDWfffqf/TV8anjqD5eIEAjdVswqdE4gea6hvSkqFOgJ7VZEAmfotVKMgbN
 kImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=7iDm+iy2vv0gvGhRKV9ucXH0e1bBgrE+86qry7t/ENk=;
 b=T6bEZPzOsyULatldRXIb4ChagohjRXWlX/ImYqSUQGtysx3hOQ1PIUevlZ5cho3R6y
 Oba1bPTbeVFbyjeQfaNC/kK/sJWIZ5xAewsDjWR1bKFTpkKwmuMYGQHOXYUDABc5ZXjX
 etUO3XQ3IjaI4ZHoAEp2PloCUiXsS8oRNA6uzHCmuDF8TN1ERHm5WkPT/go4hm7IKgI5
 rM5OvNmC5jbyEV2wbgy8SQCh/S9MJvyFp7mIV/Wl6aZKZQaFI5HBxo6iJdPllBGyAFug
 j1d1VHxcnoizR2AAirDcDjRxBJt2VvKbnbM2gekvCh0AUNGCouMv6nf0vV2H4j08B1IF
 E5AA==
X-Gm-Message-State: AOAM530eyMu6+HEF1eIGyFh3W6ocamDTPH3SegVQ+yxAI8lM5GasBhnG
 vdUNI7d7syIccBePOrIH+VE=
X-Google-Smtp-Source: ABdhPJwiTsfdvzaek4HRxZWtS8iwwUxU5lEhEvjHJfL72LY74TF7US11zYha5XrWIvKQImAPlfz+IA==
X-Received: by 2002:a63:2d47:: with SMTP id t68mr22775932pgt.416.1620123271078; 
 Tue, 04 May 2021 03:14:31 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id bx12sm3117557pjb.1.2021.05.04.03.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:14:30 -0700 (PDT)
Date: Tue, 04 May 2021 20:14:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/paca: Remove mm_ctx_id and
 mm_ctx_slb_addr_limit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <f38728dbe96df5fef84c868640def5f6d7c114bc.1620060357.git.christophe.leroy@csgroup.eu>
 <cc8bc507cce433bc9bbfe86f6fc22b29ce21d461.1620060357.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cc8bc507cce433bc9bbfe86f6fc22b29ce21d461.1620060357.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1620123253.cqvw3t8th6.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of May 4, 2021 2:46 am:
> mm_ctx_id and mm_ctx_slb_addr_limit are not used anymore.
>=20
> Remove them.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/include/asm/paca.h | 2 --
>  arch/powerpc/kernel/paca.c      | 2 --
>  2 files changed, 4 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/p=
aca.h
> index ec18ac818e3a..ecc8d792a431 100644
> --- a/arch/powerpc/include/asm/paca.h
> +++ b/arch/powerpc/include/asm/paca.h
> @@ -149,11 +149,9 @@ struct paca_struct {
>  #endif /* CONFIG_PPC_BOOK3E */
> =20
>  #ifdef CONFIG_PPC_BOOK3S
> -	mm_context_id_t mm_ctx_id;
>  #ifdef CONFIG_PPC_MM_SLICES
>  	unsigned char mm_ctx_low_slices_psize[BITS_PER_LONG / BITS_PER_BYTE];
>  	unsigned char mm_ctx_high_slices_psize[SLICE_ARRAY_SIZE];
> -	unsigned long mm_ctx_slb_addr_limit;
>  #else
>  	u16 mm_ctx_user_psize;
>  	u16 mm_ctx_sllp;
> diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
> index 7f5aae3c387d..9bd30cac852b 100644
> --- a/arch/powerpc/kernel/paca.c
> +++ b/arch/powerpc/kernel/paca.c
> @@ -346,10 +346,8 @@ void copy_mm_to_paca(struct mm_struct *mm)
>  #ifdef CONFIG_PPC_BOOK3S
>  	mm_context_t *context =3D &mm->context;
> =20
> -	get_paca()->mm_ctx_id =3D context->id;
>  #ifdef CONFIG_PPC_MM_SLICES
>  	VM_BUG_ON(!mm_ctx_slb_addr_limit(context));
> -	get_paca()->mm_ctx_slb_addr_limit =3D mm_ctx_slb_addr_limit(context);
>  	memcpy(&get_paca()->mm_ctx_low_slices_psize, mm_ctx_low_slices(context)=
,
>  	       LOW_SLICE_ARRAY_SZ);
>  	memcpy(&get_paca()->mm_ctx_high_slices_psize, mm_ctx_high_slices(contex=
t),
> --=20
> 2.25.0
>=20
>=20
