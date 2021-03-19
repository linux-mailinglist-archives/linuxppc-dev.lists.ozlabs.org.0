Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A07341294
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 03:01:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1nFY4dY8z3bwx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 13:01:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=D0+0jfnM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D0+0jfnM; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1nF81rh8z2yyy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 13:01:31 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id g15so4789616pfq.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 19:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=QEpGd7jX+B0qrjdTdIBX0022ORE/3qaJFvGk/9aSuew=;
 b=D0+0jfnMozvBfduOllLHFv81dqpQpWgZIty0W7dAvkiUojYFyWzHsdju6uAlsjYN5c
 G+h20Sgvc9I32DN9a4fP2Vm35LmS2gVB6Up6q/wBGSn2augy2oTv5wrdiWF3n1WbK4Ys
 au2JkytNG6/Q8dA4Rt+kw3P+xbsfDVmc9s6w613TOGOPTh1QB6c6IxHMmQekjDq05jRY
 0l95oTjEYDJ/4xw5j53WOqf22CCav6lN4kfUHlMwhrwdkokxOduRd6oxqCcFT5hQrEGk
 F3tff4K4k5RwpSu3PCJHd823bWUYini6poeUzEpjN8pf71WyWiKrAJjkeSx44N9vUf1k
 cSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=QEpGd7jX+B0qrjdTdIBX0022ORE/3qaJFvGk/9aSuew=;
 b=DTK/lQcZhzgU69i7R3ozsP3M1YVU22MhSM/WoUWGgZohsDXEbY+IW8hekBKasklImp
 4RRyVepocXVq7+8vjKjvjttNaxRwD+sEoSZmoZ/B9R3qc1FultPWpGRxeOomh8jjxYbk
 m8oa9lwy8E4lUIs2P3X57OVcFe3Mhj87ziBUi/Ezuz1gjYBPV4H6wXdpHUDL4r1dS7wb
 PDmLzPjTyN9bkI6qfvdcT3bvVqasTe8DFgpWhuo3vScyCLaIvv5kBqdb+ckDIrQ79PIK
 KLVtYjTmzluvo3mT1LOGbANsbWa7ImX8KDu0pL/p85OLomcGxmnczusZLgBJdq23XJle
 r2PQ==
X-Gm-Message-State: AOAM531vO8RabxzgrhVhLSQFPXlWhOmg3MOO8Prnt+ByI1WLerlqu9mG
 2NhWiTbdcjoKrtsKfbZ67Yo=
X-Google-Smtp-Source: ABdhPJz4KgtEf4/yZFUmz8nUZ74z/uKxCx1arKZrjb2MEJPK0yATGpQuBG+lhszStBqxdD6z7Fs1QQ==
X-Received: by 2002:a63:4f56:: with SMTP id p22mr9457316pgl.224.1616119288173; 
 Thu, 18 Mar 2021 19:01:28 -0700 (PDT)
Received: from localhost ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id f21sm3259358pfe.6.2021.03.18.19.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 19:01:27 -0700 (PDT)
Date: Fri, 19 Mar 2021 12:01:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 6/8] powerpc/mm/book3s64/hash: drop pre 2.06 tlbiel
 for clang
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org,
 llvmlinux@lists.linuxfoundation.org
References: <20210225031006.1204774-1-dja@axtens.net>
 <20210225031006.1204774-7-dja@axtens.net>
In-Reply-To: <20210225031006.1204774-7-dja@axtens.net>
MIME-Version: 1.0
Message-Id: <1616118111.i881ydq4h2.astroid@bobo.none>
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

Excerpts from Daniel Axtens's message of February 25, 2021 1:10 pm:
> The llvm integrated assembler does not recognise the ISA 2.05 tlbiel
> version. Eventually do this more smartly.

The whole thing with TLBIE and TLBIEL in this file seems a bit too=20
clever. We should have PPC_TLBIE* macros for all of them.

Thanks,
Nick

>=20
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>  arch/powerpc/mm/book3s64/hash_native.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/boo=
k3s64/hash_native.c
> index 52e170bd95ae..c5937f69a452 100644
> --- a/arch/powerpc/mm/book3s64/hash_native.c
> +++ b/arch/powerpc/mm/book3s64/hash_native.c
> @@ -267,9 +267,14 @@ static inline void __tlbiel(unsigned long vpn, int p=
size, int apsize, int ssize)
>  		va |=3D ssize << 8;
>  		sllp =3D get_sllp_encoding(apsize);
>  		va |=3D sllp << 5;
> +#if 0
>  		asm volatile(ASM_FTR_IFSET("tlbiel %0", "tlbiel %0,0", %1)
>  			     : : "r" (va), "i" (CPU_FTR_ARCH_206)
>  			     : "memory");
> +#endif
> +		asm volatile("tlbiel %0"
> +			     : : "r" (va)
> +			     : "memory");
>  		break;
>  	default:
>  		/* We need 14 to 14 + i bits of va */
> @@ -286,9 +291,14 @@ static inline void __tlbiel(unsigned long vpn, int p=
size, int apsize, int ssize)
>  		 */
>  		va |=3D (vpn & 0xfe);
>  		va |=3D 1; /* L */
> +#if 0
>  		asm volatile(ASM_FTR_IFSET("tlbiel %0", "tlbiel %0,1", %1)
>  			     : : "r" (va), "i" (CPU_FTR_ARCH_206)
>  			     : "memory");
> +#endif
> +		asm volatile("tlbiel %0"
> +			     : : "r" (va)
> +			     : "memory");
>  		break;
>  	}
>  	trace_tlbie(0, 1, va, 0, 0, 0, 0);
> --=20
> 2.27.0
>=20
>=20
