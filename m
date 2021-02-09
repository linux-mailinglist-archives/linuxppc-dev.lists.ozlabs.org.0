Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A603145A7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 02:31:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZQMd45W0zDvY7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 12:31:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CrJLNZss; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZQKb5Kc1zDql6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 12:29:23 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id d2so686040pjs.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 17:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=3BB8r2Xh3JusOcZJw/yjA416GCYQPgxgvzDoA5TTXR0=;
 b=CrJLNZssu+WGrZIJkQw44FIfx5dYnG8xsSrLlfBK3irS+EwMiPUZakiCgtjPe3jFJG
 YlwtGLP2BhpTlMPjra7DfATRyrEvyh1Uc63ZvV51us03Nkgs4lZxNuZBDaXBRVjF6aNF
 AsarGzU1tmIzxpxyC9hNEJsvZd4MRpNoGgapJZwwDEwOmkbzqbGCZqKaWD1+9IX2P/EC
 lqFBHnHVABnkGXOJuwUvu4GdHXm0yhiOIqg1KhF3Dzk2r/SgW0I+LKUgL6z0BlIf5t9J
 O7NtqtEVVwkHUfSjOf+Ftk24XKWHUk/ATTH1rg+/7VcbPc7Dzf4Bf7oBj0oTWQmrbcKi
 v4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=3BB8r2Xh3JusOcZJw/yjA416GCYQPgxgvzDoA5TTXR0=;
 b=TK7qFwuevLNVJEPNnJlAz+cyOsyqbSNriX8KROfI8B3SMqHslLeCPOZZbr69bPradC
 8PgFgQEcIFRy1D4JAc3EKBWY7GinCdx24TDV1Ffs2n3T1S/C8VyLE7zPG7SQsNLc99+V
 UWDJL7zWjPn/q6jka7tGGkXIH9UFDBNRDB9opVgltieLQTtaO6dAs0AuftzO0Q1lhguo
 SFcdGBqWNpesZUI2Mbhfq0qLdntzvbsouMEqqefq5TIEBrBJAFYPkVHINkqEXuetTFEY
 ueiqkdVdTMsLmFwBHcO2rt3EjqD81wTHVRgVPNXMhXBNHI34gdQA5Mu+fDXzoYknT/ZV
 b2cw==
X-Gm-Message-State: AOAM530pVWBuhaS7b6+i5AZY5JvYrXvnyhLONhpTc2kVOkwUh+DeviWV
 6ryRgrOXpG/RMkGi5n0TR2I=
X-Google-Smtp-Source: ABdhPJxJUTJb88NIgdD4iksB3Zs6MUxdshLWdT982GjNJdD1J9N01MG9DlVMVF6FoVOFMJMt5IlMjQ==
X-Received: by 2002:a17:90a:ca8f:: with SMTP id
 y15mr1536276pjt.119.1612834161575; 
 Mon, 08 Feb 2021 17:29:21 -0800 (PST)
Received: from localhost ([220.240.226.199])
 by smtp.gmail.com with ESMTPSA id 14sm19720222pfy.55.2021.02.08.17.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 17:29:20 -0800 (PST)
Date: Tue, 09 Feb 2021 11:29:15 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 10/22] powerpc/syscall: Use is_compat_task()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <c8094662199337a7200fea9f6e1d1f8b1b6d5f69.1612796617.git.christophe.leroy@csgroup.eu>
In-Reply-To: <c8094662199337a7200fea9f6e1d1f8b1b6d5f69.1612796617.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612834040.k147utsmdf.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
> Instead of hard comparing task flags with _TIF_32BIT, use
> is_compat_task(). The advantage is that it returns 0 on PPC32
> allthough _TIF_32BIT is always set.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>


> ---
>  arch/powerpc/kernel/interrupt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interr=
upt.c
> index 2dac4d2bb1cf..46fd195ca659 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -2,6 +2,8 @@
> =20
>  #include <linux/context_tracking.h>
>  #include <linux/err.h>
> +#include <linux/compat.h>
> +
>  #include <asm/asm-prototypes.h>
>  #include <asm/kup.h>
>  #include <asm/cputime.h>
> @@ -118,7 +120,7 @@ notrace long system_call_exception(long r3, long r4, =
long r5,
>  	/* May be faster to do array_index_nospec? */
>  	barrier_nospec();
> =20
> -	if (unlikely(is_32bit_task())) {
> +	if (unlikely(is_compat_task())) {
>  		f =3D (void *)compat_sys_call_table[r0];
> =20
>  		r3 &=3D 0x00000000ffffffffULL;
> --=20
> 2.25.0
>=20
>=20
