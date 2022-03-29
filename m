Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2364EA91C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 10:23:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSMyY2Tc4z2xt0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 19:23:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=do8wrfby;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=do8wrfby; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSMxt127Gz2xT8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 19:22:41 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id z128so14194030pgz.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 01:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=u+eOiR/JQGj21WH/g/6/ThX1ZxYwYrc08hxhIyZJdXw=;
 b=do8wrfbyUYPlF15QBTTaREmSpP6vTRJgsYPGDwNovTThFdcraXgHXhwuE2i55wYGkq
 x5DRkt/cIVY5f9pASZvp7SrOPBnk+C0GcEC8eiqJ7S6v43n4DaEiDJAavYMQfelINO0s
 3uE9LQ45q28F0mY3ezOhg7cDfQ0+Bx3yERur+R+ek7zpMbaFs38Rw3N+RPFRMYreUTSa
 9nRICKCV1ewJd4GFZdOOCrirGOKqnuxQE/+fr6tbFb0yZLjMFuetmOzIN1gFCkto1/q/
 O1s5ETecjelfbM5E1Z77X7jxxi+kZwRD8OZy/8HPz/2JRs69uWaFFofNpjwGBnS79e9L
 RXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=u+eOiR/JQGj21WH/g/6/ThX1ZxYwYrc08hxhIyZJdXw=;
 b=LrnCYjP2ZBBhXE/KHwi6QdbMIUDNoJaugOlYb5uh0XtpYBgat7T70DGW3rdpvCqXz7
 PWcYrV7uuv/RA5Nb/5Jy0e5M4VNfNPk7fGUhi98C77NstYrO5eN5SFTfuQ6kYAhukue9
 eOuqrvNh26ioYt+iY4vuZ7SDiwiN1H2sR2BDyGOZG4Sf6C228NQFTOd86a8inYpWXDca
 1GQNr4DHG4P+A8YmH5ZiO+ekz7NckVK7jJHnFzeQR/vWUT55YJ2Z9VTcv1VbKa1/e5EI
 pS1fT6fToKipaNokrRbLmVOnfCruawCFlo8pPljKDl5myeA5st9tnnWnugqRS6PGr7Eq
 MCkw==
X-Gm-Message-State: AOAM5339vycgZQkDRxt7rgYTw5DIsgoeJVLkXKDyT33xwq2K5ivxm6SA
 ClNcvq1aHtkuZO553MdhnBo=
X-Google-Smtp-Source: ABdhPJwHEY8IZNGIbEt08JmgXbNuNgvYuXk6DC6Cg5y9CY0T2RgfV1IjinLIYrKIM8PHMCXXTXVnrQ==
X-Received: by 2002:a05:6a00:1c9e:b0:4fa:d946:378b with SMTP id
 y30-20020a056a001c9e00b004fad946378bmr27137436pfw.46.1648542158916; 
 Tue, 29 Mar 2022 01:22:38 -0700 (PDT)
Received: from localhost (58-6-255-110.tpgi.com.au. [58.6.255.110])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a17090ad59600b001b7deb42251sm1879863pju.15.2022.03.29.01.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 01:22:38 -0700 (PDT)
Date: Tue, 29 Mar 2022 18:22:28 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: Fix build failure with allyesconfig in
 book3s_64_entry.S
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <89cf27bf43ee07a0b2879b9e8e2f5cd6386a3645.1648366338.git.christophe.leroy@csgroup.eu>
In-Reply-To: <89cf27bf43ee07a0b2879b9e8e2f5cd6386a3645.1648366338.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1648542114.vy2hyu1uzt.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of March 27, 2022 5:32 pm:
> Using conditional branches between two files is hasardous,
> they may get linked to far from each other.
>=20
> 	arch/powerpc/kvm/book3s_64_entry.o:(.text+0x3ec): relocation truncated
> 	to fit: R_PPC64_REL14 (stub) against symbol `system_reset_common'
> 	defined in .text section in arch/powerpc/kernel/head_64.o
>=20
> Reorganise the code to use non conditional branches.

Thanks for the fix, I agree this is better.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Fixes: 89d35b239101 ("KVM: PPC: Book3S HV P9: Implement the rest of the P=
9 path in C")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kvm/book3s_64_entry.S | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s=
_64_entry.S
> index 05e003eb5d90..99fa36df36fa 100644
> --- a/arch/powerpc/kvm/book3s_64_entry.S
> +++ b/arch/powerpc/kvm/book3s_64_entry.S
> @@ -414,10 +414,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_DAWR1)
>  	 */
>  	ld	r10,HSTATE_SCRATCH0(r13)
>  	cmpwi	r10,BOOK3S_INTERRUPT_MACHINE_CHECK
> -	beq	machine_check_common
> +	beq	1f
> =20
>  	cmpwi	r10,BOOK3S_INTERRUPT_SYSTEM_RESET
> -	beq	system_reset_common
> +	bne	.
> =20
> -	b	.
> +	b	system_reset_common
> +1:	b	machine_check_common
>  #endif
> --=20
> 2.35.1
>=20
>=20
