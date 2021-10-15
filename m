Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9BB42E89B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 07:58:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVwYt2B2sz3c6G
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 16:58:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BvkezB9D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BvkezB9D; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVwY80RyDz2yy3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 16:58:03 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id ls18so6491197pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 22:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=S0rBIBfnndl4sO0SZD30iqTuRSBoy5r+zNmXEO729ec=;
 b=BvkezB9DzKzErquz1XZOTKqoL0XOL3U6Eb5odSJ6flnnPgmmGEa3vMoyopsdwVJpIo
 +kJ9msCSx7YGPh77U30LXnNLubl1IugeDdeSuYmeI37nvbmhSm5CsYs8iAoSKXMNhzxO
 6i912LlK4afHQGJIc4S85mDVOKR5UpDhCrBkxj6ietrjMxi2fywEBEuiLIZgu19q/I1g
 +8t1vHWN0EHqjETvz4uZZN6EvLLpsZtZkFFYte3N8uN6vsiAuv/ZnqxmivZw24+wB8Ud
 WkPTCZYNe4CFVIiv/WGJwu9SWhmgRP+wcQq7L1rL9ZDmaijfZRGwseytUWA+JVHD4hhp
 bQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=S0rBIBfnndl4sO0SZD30iqTuRSBoy5r+zNmXEO729ec=;
 b=7wcMKg2O34hgzWbQo65ATBolK7Uv9GYdemK5LvSwtbyuXdTA9GZRllJUcuvFt/8DWk
 CBlBZ97eOr3gs7dcrBTdk4EJstxy/He8PRDm70/UZPYjICnmEDEoN2yWjuuRR0HNfmTj
 kMyUwK7k92GyzUbypX0LdEaJpL5PbFZAK+z3hOjLSXZX1UdEAmBQG242XxVc7wECFHPG
 Z882Da4RbuNLoIwniNkcc42mbgorE7+l0JoafrOIBLioM3VWirErVueNDnroVigavAAT
 eOq9bzlQVpaAoRh/SI7KlEoCVwouOyC+2b+kVZDfBK5HA6WTJJNAqWwuYWB7Q2y3CVbp
 YJKA==
X-Gm-Message-State: AOAM533icOmQhwdYa61FhHRS11J425fbRwA3UF0tHyMXKFIvGxxR66M5
 UwFatIoNhGBzaZpanph5Eip2kpgsVgc=
X-Google-Smtp-Source: ABdhPJyXz4rN56bUpmFK5R707chQeiJbYyyVjPcMsN6ywtX2cPlh5ALJb3tBLebih8BJB0NaHGRlvg==
X-Received: by 2002:a17:902:d488:b0:13f:165e:f491 with SMTP id
 c8-20020a170902d48800b0013f165ef491mr9412847plg.12.1634277481786; 
 Thu, 14 Oct 2021 22:58:01 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 t126sm4092988pfc.80.2021.10.14.22.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 22:58:01 -0700 (PDT)
Date: Fri, 15 Oct 2021 15:57:56 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 01/13] powerpc: Move 'struct ppc64_opd_entry' back into
 asm/elf.h
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Kees Cook <keescook@chromium.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1634190022.git.christophe.leroy@csgroup.eu>
 <42d2a571677e60082c0a5b3e52e855aa58c0b1fc.1634190022.git.christophe.leroy@csgroup.eu>
In-Reply-To: <42d2a571677e60082c0a5b3e52e855aa58c0b1fc.1634190022.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634277306.r82aohhn4e.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of October 14, 2021 3:49 pm:
> 'struct ppc64_opd_entry' doesn't belong to uapi/asm/elf.h
>=20
> It was initially in module_64.c and commit 2d291e902791 ("Fix compile
> failure with non modular builds") moved it into asm/elf.h
>=20
> But it was by mistake added outside of __KERNEL__ section,
> therefore commit c3617f72036c ("UAPI: (Scripted) Disintegrate
> arch/powerpc/include/asm") moved it to uapi/asm/elf.h
>=20
> Move it back into asm/elf.h, this brings it back in line with
> IA64 and PARISC architectures.
>=20
> Fixes: 2d291e902791 ("Fix compile failure with non modular builds")
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/elf.h      | 6 ++++++
>  arch/powerpc/include/uapi/asm/elf.h | 8 --------
>  2 files changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/elf.h b/arch/powerpc/include/asm/el=
f.h
> index b8425e3cfd81..a4406714c060 100644
> --- a/arch/powerpc/include/asm/elf.h
> +++ b/arch/powerpc/include/asm/elf.h
> @@ -176,4 +176,10 @@ do {									\
>  /* Relocate the kernel image to @final_address */
>  void relocate(unsigned long final_address);
> =20
> +/* There's actually a third entry here, but it's unused */
> +struct ppc64_opd_entry {
> +	unsigned long funcaddr;
> +	unsigned long r2;
> +};

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

I wonder if we should add that third entry, just for completeness. And=20
'r2' isn't a good name should probably be toc. And should it be packed?=20
At any rate that's not for your series, a cleanup I might think about
for later.

Thanks,
Nick
