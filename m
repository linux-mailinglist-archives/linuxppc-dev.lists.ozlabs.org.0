Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E20A43998D8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 06:05:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwXPc2htjz308k
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 14:05:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TTyiAwJ3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TTyiAwJ3; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwXP70VsTz2xv2
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 14:05:30 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id z26so3895784pfj.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jun 2021 21:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=795WZ/W4WPdDcq8kKiZWiu2NEgJWT4oKxelx0R4hEO8=;
 b=TTyiAwJ3SUuLjCZCApR55XIk/saCQ2zDy3RFA8o0NikxDgZWw5nMzYJONgf6XJaxYb
 lgEzTUfE9efXxv1XawtZ5IVAs6wW7nJyCMyOw0tayWGQ0EeBR033QPQcYOhCG4ZcU+6H
 xTLP2GCR3qOpcv/druIRfwQYYuHFjvMuclo70aBQYQlTKZOl/O/07r7HWE8uwzX7f8sp
 nIZAWDJ/vb7HJ8Zd7TD5hX9rjqSfgNYrjnEn8fIA25dDmovwxzxfEiVm8BlMR69wuyYT
 EvaSUN+qdsOhf8Ia7Xt3zh1DAJC57L48jDo3tx4NXmp01t9LVKjonvy9UqOqYJESePvx
 bLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=795WZ/W4WPdDcq8kKiZWiu2NEgJWT4oKxelx0R4hEO8=;
 b=NfNSFzB0Wqb1TzYpWFtzyWxvPKEWk2FWKfzBRkzqHqWZW09hdI0HfQP+knfr4NLWbo
 2sNIRPFEtjsexxJOyZ+RxjTaAtJNzG1G/vuqTb/98mXBOMDx0xgDgcmL2gCRBHAD2P6L
 18TJPJz/hwXbL9FlT5EaiKmFUrXOM7oz4O90Zs4GfwnQ3BTrs+bm5wEwK4o//Vaufvum
 p5hA947qFC5w0YC2pZA2018U6SgPXm2RG/ZAh1wjLZEWuHAqVQ1nhFBwgTyQtcklYxm5
 9RfKAzhgI0t1j5aCnQmrbWTDbA0E4I0CoUTHOsf9vi0mwbZHXtj5135PFT/WTIBF2wHx
 eXWA==
X-Gm-Message-State: AOAM532PgJl95PnHA7wNws7fBzDAUVEm1TmulbkM62I3smBMXde0XUcn
 nVF5QnzLrH64OiQ/ryAex6c=
X-Google-Smtp-Source: ABdhPJxVoCnWCCNm0vxBcFiQoxnCNx14ajI5glsJBXgYwhpbmFtoq5eaCOa9y/iGLdrQ9WXniVTkjQ==
X-Received: by 2002:a63:1c6:: with SMTP id 189mr37271392pgb.144.1622693126063; 
 Wed, 02 Jun 2021 21:05:26 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id n129sm501962pfn.167.2021.06.02.21.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 21:05:25 -0700 (PDT)
Date: Thu, 03 Jun 2021 14:05:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 03/16] powerpc/vas: Add platform specific user window
 operations
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <f4fb4b7bb98580ae3c025d83148a6406541de892.camel@linux.ibm.com>
In-Reply-To: <f4fb4b7bb98580ae3c025d83148a6406541de892.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1622692598.4iphcb4vdf.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of May 21, 2021 7:30 pm:
>=20
> PowerNV uses registers to open/close VAS windows, and getting the
> paste address. Whereas the hypervisor calls are used on PowerVM.
>=20
> This patch adds the platform specific user space window operations
> and register with the common VAS user space interface.

Basic idea makes sense. I don't understand this code in detail though.
A couple of things,

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/vas.h              | 14 +++++-
>  arch/powerpc/platforms/book3s/vas-api.c     | 52 ++++++++++++---------
>  arch/powerpc/platforms/powernv/vas-window.c | 46 +++++++++++++++++-
>  3 files changed, 89 insertions(+), 23 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index 6076adf9ab4f..668303198772 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -5,6 +5,7 @@
> =20
>  #ifndef _ASM_POWERPC_VAS_H
>  #define _ASM_POWERPC_VAS_H
> +#include <uapi/asm/vas-api.h>
> =20
>  struct vas_window;
> =20
> @@ -48,6 +49,16 @@ enum vas_cop_type {
>  	VAS_COP_TYPE_MAX,
>  };
> =20
> +/*
> + * User space window operations used for powernv and powerVM
> + */
> +struct vas_user_win_ops {
> +	struct vas_window * (*open_win)(struct vas_tx_win_open_attr *,
> +				enum vas_cop_type);
> +	u64 (*paste_addr)(void *);
> +	int (*close_win)(void *);

Without looking further into the series, why do these two take void *=20
when the first returns a vas_window * which appears to be the required
argument to these?

> +static struct vas_user_win_ops vops =3D  {
> +	.open_win	=3D	vas_user_win_open,
> +	.paste_addr	=3D	vas_user_win_paste_addr,
> +	.close_win	=3D	vas_user_win_close,
> +};

const?

Thanks,
Nick
