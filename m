Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B85AD260DD8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 10:45:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlzHx1cvNzDqC3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 18:45:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VVzWZ0PL; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlzG64xYvzDqLj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 18:43:58 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id gf14so7666651pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Sep 2020 01:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=OXlcroGke2HNevojS8gO7AGdbKr5HayaXxgh0v0a9Rw=;
 b=VVzWZ0PLhoBOyRnLqIhBP8KlfFI1wesE/ceDJIN6T0dgy7xPyIv2MSxmQkM/5WqrTI
 CFU0k8luUZ6jx5bUjXraLG3G3v1aUp5DWnYzAckklhZatgNFvBRMP8G1bzLRwmUMQ/M0
 PYyMPqh2IN0GJ0D6oJTzBd42wd9VCjv+SxeubQlPrU8G6nL2DQlHoxGas0g2MmPNJuYf
 jNUkMDi95Xfdu5HXwvf/SFKXlsv4hdCtz4HZ8itfx96TewzGNl5b32ilpqFKNr97eC44
 EWfDRmXwk+OGeJhaEDqBuHIlDO4cI5awDYMI2K0bmd5V6Oned79/6dnQ+TEbTTg+rtwM
 +wQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=OXlcroGke2HNevojS8gO7AGdbKr5HayaXxgh0v0a9Rw=;
 b=mWASjHVGjmwaiboDOGrjtnw8RePo8y69GFTRkxB7P+XuEPb0bC0Rj9wJrZd6IeXk7+
 L2wN6aGCLgQtxAogQUa6/u0UyiJvL0TKPWB9sWSYW8XehCT+K8ODSgrpM/QsE5hs7/bT
 keMt3B3cjci0cgyDZlplNCdmX3sGkdrGzzz4LVYelf8hxb2RNtwg9b7WEJGVvFSjlH/V
 ujkYvUq7WuqBvGnjpw898BnM0tOWvGN4MN7JTQxzfaw8T0Oxxc796bzYPuVrqsACr1m/
 nobbojspT7SzQmkErxwjGI19Jnfb0yIH/AuqMAvgGHgCUvefnIwR6nXuJ0edWhG4jGwm
 Zi5A==
X-Gm-Message-State: AOAM533cLzDsasahsn5QTQ3lBcYn5fFLnKmg7Gw/7RhxVIoYq89aymuv
 OYsdIwO646PEDimJEMvAAoE=
X-Google-Smtp-Source: ABdhPJxzyS9TfAzWvwCFoho2mIVMNDIB0pBbFX9ag1Dk5md5II1gAiOC+3ef0morgOeUwDCSINndIw==
X-Received: by 2002:a17:90a:e795:: with SMTP id
 iz21mr2979053pjb.8.1599554634620; 
 Tue, 08 Sep 2020 01:43:54 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id b10sm16891473pff.85.2020.09.08.01.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:43:54 -0700 (PDT)
Date: Tue, 08 Sep 2020 18:43:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 1/5] powerpc/mm: sanity_check_fault() should work for
 all, not only BOOK3S
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <7baae4086cbb9ffb08c933b065ff7d29dbc03dd6.1596734104.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7baae4086cbb9ffb08c933b065ff7d29dbc03dd6.1596734104.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1599554359.m174sr2fhg.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of August 7, 2020 3:15 am:
> The verification and message introduced by commit 374f3f5979f9
> ("powerpc/mm/hash: Handle user access of kernel address gracefully")
> applies to all platforms, it should not be limited to BOOK3S.
>=20
> Make the BOOK3S version of sanity_check_fault() the one for all,
> and bail out earlier if not BOOK3S.
>=20
> Fixes: 374f3f5979f9 ("powerpc/mm/hash: Handle user access of kernel addre=
ss gracefully")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/fault.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 925a7231abb3..2efa34d7e644 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -303,7 +303,6 @@ static inline void cmo_account_page_fault(void)
>  static inline void cmo_account_page_fault(void) { }
>  #endif /* CONFIG_PPC_SMLPAR */
> =20
> -#ifdef CONFIG_PPC_BOOK3S
>  static void sanity_check_fault(bool is_write, bool is_user,
>  			       unsigned long error_code, unsigned long address)
>  {
> @@ -320,6 +319,9 @@ static void sanity_check_fault(bool is_write, bool is=
_user,
>  		return;
>  	}
> =20
> +	if (!IS_ENABLED(CONFIG_PPC_BOOK3S))
> +		return;

Seems okay. Why is address =3D=3D -1 special though? I guess it's because=20
it may not be an exploit kernel reference but a buggy pointer underflow?=20
In that case -1 doesn't seem like it would catch very much. Would it be=20
better to test for high bit set for example ((long)address < 0) ?

Anyway for your patch

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> +
>  	/*
>  	 * For hash translation mode, we should never get a
>  	 * PROTFAULT. Any update to pte to reduce access will result in us
> @@ -354,10 +356,6 @@ static void sanity_check_fault(bool is_write, bool i=
s_user,
> =20
>  	WARN_ON_ONCE(error_code & DSISR_PROTFAULT);
>  }
> -#else
> -static void sanity_check_fault(bool is_write, bool is_user,
> -			       unsigned long error_code, unsigned long address) { }
> -#endif /* CONFIG_PPC_BOOK3S */
> =20
>  /*
>   * Define the correct "is_write" bit in error_code based
> --=20
> 2.25.0
>=20
>=20
