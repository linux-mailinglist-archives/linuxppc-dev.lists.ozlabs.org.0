Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5175431012
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 07:59:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXmR11vWnz3086
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 16:59:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Lx6Kua8e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Lx6Kua8e; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXmQL1ltyz2yLJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 16:58:32 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id m26so13894020pff.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Oct 2021 22:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=X4ObKuSSQv+G50bHKT8TIyKSkdwsT91S+K4zGdNUDYc=;
 b=Lx6Kua8eCdB6ynkVlMcdhmK5TPoD66KEfA5sFkjG/jTtVfqyJExe3fuC0Puxhk8YDW
 oMbdqYvv8LDN5Fl7oeWI1jsOaMhDpBXR56LaquS2aHLuOG+chQvabNZZiYOgQw2jCRXx
 GjqHc3TmuiHshjuXyEvHVNkjO+/pj9Nt+n8rlscssMhmARCGM0bkwW3hBJxfoW2Ns9lI
 9+lZARUtvknB91k784nVDrt8t1ZL45iOFMhOZ8uIXyEdX+qkq8QlZCtWuGvFsRsuieHm
 i9hlkomX8vHYTO13Yqzs+HvKtBJi/31h/KAhjzJ06LpbBnHy8UWyCoDLACtjvJnquGex
 3DsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=X4ObKuSSQv+G50bHKT8TIyKSkdwsT91S+K4zGdNUDYc=;
 b=DkMjygmnx7v9n4PHc2Ixw266c+X4TfH0gPseWncFPqwMYoxF9pKw4/m0btCxQ98jVX
 D0Ew8mwCUFQU8+VGNRdcLw8dt2YJDRkRhNUZRd/pq/43J3vRRgDWjhoDHA7g+SUrnBI/
 h8904TImlVqZzh+fUvpmXPtCIlFC5ZkDlzlxIj+wkUFRQ1Bv/tSKPMYW/bmIoFtzotNm
 MDC87u5zsYF+uasbkZr/qO1ygcT+h0WJL24BN41Gee0gs8gLaKS/iFu3ZyeLnx5Y0gqH
 59OaE9ebDdJW02joCx1lylKlm0mqZ9NxUExCdnYGEJbnc7etz0+eJda+fktxx/EcP3tb
 CYyg==
X-Gm-Message-State: AOAM531pbknHpOuxBr6Y5LHfjtmmTt5hVgCnrFCG/b/E10kh67ropjHM
 g+mlWyJQpE+VYKYExF+jCcc=
X-Google-Smtp-Source: ABdhPJwB4aZOEF4c4x+POdQ74CsyuEUoXurySgutsGWF+Sp9p2tOiLlNP0zuxpWool6b+cUy0ckW/Q==
X-Received: by 2002:a63:340c:: with SMTP id b12mr21911013pga.241.1634536707973; 
 Sun, 17 Oct 2021 22:58:27 -0700 (PDT)
Received: from localhost ([1.128.241.174])
 by smtp.gmail.com with ESMTPSA id c12sm11569352pfc.161.2021.10.17.22.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 22:58:27 -0700 (PDT)
Date: Mon, 18 Oct 2021 15:58:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 01/12] powerpc: Move and rename func_descr_t
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Kees Cook <keescook@chromium.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1634457599.git.christophe.leroy@csgroup.eu>
 <637a9a11263afa216fdfa7fb470a54479c67c61c.1634457599.git.christophe.leroy@csgroup.eu>
In-Reply-To: <637a9a11263afa216fdfa7fb470a54479c67c61c.1634457599.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634536669.2nedzrtfjt.astroid@bobo.none>
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
> There are three architectures with function descriptors, try to
> have common names for the address they contain in order to
> refactor some functions into generic functions later.
>=20
> powerpc has 'entry'
> ia64 has 'ip'
> parisc has 'addr'
>=20
> Vote for 'addr' and update 'func_descr_t' accordingly.
>=20
> Move it in asm/elf.h to have it at the same place on all
> three architectures, remove the typedef which hides its real
> type, and change it to a smoother name 'struct func_desc'.
>=20

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/code-patching.h | 2 +-
>  arch/powerpc/include/asm/elf.h           | 6 ++++++
>  arch/powerpc/include/asm/types.h         | 6 ------
>  arch/powerpc/kernel/signal_64.c          | 8 ++++----
>  4 files changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/incl=
ude/asm/code-patching.h
> index 4ba834599c4d..c6e805976e6f 100644
> --- a/arch/powerpc/include/asm/code-patching.h
> +++ b/arch/powerpc/include/asm/code-patching.h
> @@ -110,7 +110,7 @@ static inline unsigned long ppc_function_entry(void *=
func)
>  	 * function's descriptor. The first entry in the descriptor is the
>  	 * address of the function text.
>  	 */
> -	return ((func_descr_t *)func)->entry;
> +	return ((struct func_desc *)func)->addr;
>  #else
>  	return (unsigned long)func;
>  #endif
> diff --git a/arch/powerpc/include/asm/elf.h b/arch/powerpc/include/asm/el=
f.h
> index b8425e3cfd81..971589a21bc0 100644
> --- a/arch/powerpc/include/asm/elf.h
> +++ b/arch/powerpc/include/asm/elf.h
> @@ -176,4 +176,10 @@ do {									\
>  /* Relocate the kernel image to @final_address */
>  void relocate(unsigned long final_address);
> =20
> +struct func_desc {
> +	unsigned long addr;
> +	unsigned long toc;
> +	unsigned long env;
> +};
> +
>  #endif /* _ASM_POWERPC_ELF_H */
> diff --git a/arch/powerpc/include/asm/types.h b/arch/powerpc/include/asm/=
types.h
> index f1630c553efe..97da77bc48c9 100644
> --- a/arch/powerpc/include/asm/types.h
> +++ b/arch/powerpc/include/asm/types.h
> @@ -23,12 +23,6 @@
> =20
>  typedef __vector128 vector128;
> =20
> -typedef struct {
> -	unsigned long entry;
> -	unsigned long toc;
> -	unsigned long env;
> -} func_descr_t;
> -
>  #endif /* __ASSEMBLY__ */
> =20
>  #endif /* _ASM_POWERPC_TYPES_H */
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal=
_64.c
> index 1831bba0582e..36537d7d5191 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -933,11 +933,11 @@ int handle_rt_signal64(struct ksignal *ksig, sigset=
_t *set,
>  		 * descriptor is the entry address of signal and the second
>  		 * entry is the TOC value we need to use.
>  		 */
> -		func_descr_t __user *funct_desc_ptr =3D
> -			(func_descr_t __user *) ksig->ka.sa.sa_handler;
> +		struct func_desc __user *ptr =3D
> +			(struct func_desc __user *)ksig->ka.sa.sa_handler;
> =20
> -		err |=3D get_user(regs->ctr, &funct_desc_ptr->entry);
> -		err |=3D get_user(regs->gpr[2], &funct_desc_ptr->toc);
> +		err |=3D get_user(regs->ctr, &ptr->addr);
> +		err |=3D get_user(regs->gpr[2], &ptr->toc);
>  	}
> =20
>  	/* enter the signal handler in native-endian mode */
> --=20
> 2.31.1
>=20
>=20
>=20
