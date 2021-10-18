Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0F0431087
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 08:28:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXn4Q6fFDz3c6S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 17:28:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Yk6LSNqk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Yk6LSNqk; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXn3h1SMCz2yn9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 17:27:27 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so11754008pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Oct 2021 23:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=xax6w8vdDeorgOHfukYruV4crW1zSmA0Yn4dKXojVlM=;
 b=Yk6LSNqkisKS10pGs8UquN9x1ScpNWbbgjoL8+BGGKLSgbjdOJ3dp2g4efx3BdfCeO
 cpsPii0dvmpI5i4at1AfbwppVJhgOZ26idOW0GLdOQeVwmefcEItygifPo86mrnha+x4
 NIWZpYpHR6kFun2FQLxF27U9o+qV07b0vK5G5WgPn0ZpzX17VLkkiSKRVCgpZqXAf1zx
 dde5W/U0tdvOvf4D4gu07I1Mu1xeQafVvUZkcLv7n3kFF4kmbn3gONaEYyunqyFktKGo
 6DMc6sMtkN+zto4NUMtwLpDv/oq52HG/WZSSVvcUNKEUfVlsnVRXiyWwOzDYjZsSlcBw
 1jHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=xax6w8vdDeorgOHfukYruV4crW1zSmA0Yn4dKXojVlM=;
 b=DjZZIiBt43se66jaAY7onsi35glutBtjVOAw7uF3EoC3J8Em/+STf5z1YODpiuY3pZ
 k2I3f9KJ6BXvzUhiV2B7qW1JDerH9JN5+j3OJg9eplH8TMvY6g6cqWPfxYXsSM3dX9xY
 Zb3A36fITMpohMAG0KD2AhoDSu3GmhZw3b29H87sGxBzzIAr1sG/g1v1+2di9d3I6OLj
 Bwzf2vZ+GEEzRaGetAvAJjXe/2fX+8bZZ0sHvXdSwXgao/KhDqUef+KGqfv7R+NGTK3a
 YgyMKU6x6dBo8l+44VpC1PwrvKIwJLL9iIDn2GW017wTfIM8KXndNnyoHhxOIt1FeLWa
 or9g==
X-Gm-Message-State: AOAM532fvaWVvkM2XizwbabP/mWZ6y//0n1CF/kKrHS8BXemvB8WkYMH
 DgAqnWPSKPvvN9HQYBIbMX8=
X-Google-Smtp-Source: ABdhPJw0GP7RprUuWC+8YWTOwY32i9+w+LmnM+jhtULZlF66OhLA6thzoj0Ge0GcMhEsc7ZGu2Pfgw==
X-Received: by 2002:a17:90a:1a43:: with SMTP id
 3mr46829314pjl.242.1634538444308; 
 Sun, 17 Oct 2021 23:27:24 -0700 (PDT)
Received: from localhost ([1.128.241.185])
 by smtp.gmail.com with ESMTPSA id t125sm11910863pfc.119.2021.10.17.23.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 23:27:24 -0700 (PDT)
Date: Mon, 18 Oct 2021 16:27:17 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 04/12] powerpc: Prepare func_desc_t for refactorisation
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Kees Cook <keescook@chromium.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1634457599.git.christophe.leroy@csgroup.eu>
 <86c393ce0a6f603f94e6d2ceca08d535f654bb23.1634457599.git.christophe.leroy@csgroup.eu>
In-Reply-To: <86c393ce0a6f603f94e6d2ceca08d535f654bb23.1634457599.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634536863.oq0s171f8c.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of October 17, 2021 10:38 pm:
> In preparation of making func_desc_t generic, change the ELFv2
> version to a struct containing 'addr' element.
>=20
> This allows using single helpers common to ELFv1 and ELFv2.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>  arch/powerpc/kernel/module_64.c | 32 ++++++++++++++------------------
>  1 file changed, 14 insertions(+), 18 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module=
_64.c
> index a89da0ee25e2..b687ef88c4c4 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -33,19 +33,13 @@
>  #ifdef PPC64_ELF_ABI_v2
> =20
>  /* An address is simply the address of the function. */
> -typedef unsigned long func_desc_t;
> +typedef struct {
> +	unsigned long addr;
> +} func_desc_t;

I'm not quite following why this change is done. I guess it is so you=20
can move this func_desc_t type into core code, but why do that? Is it
just to avoid using the preprocessor?

On its own this patch looks okay.

Acked-by: Nicholas Piggin <npiggin@gmail.com>
