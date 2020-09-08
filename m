Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAFF260DF9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 10:49:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlzN54Fx7zDq72
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 18:49:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=orjZ5zvY; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlzJx0qx5zDqL9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 18:46:25 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id 5so9565006pgl.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Sep 2020 01:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=iUr/Su9o46jDL8dJ97KU/SAIedxE8wYUU6GmXx2CUe4=;
 b=orjZ5zvYHX979PfoKGpK6WspSuFOTkxwX+tutMgFqQql4M7UyfLeQxMK5lPexMjT95
 ut0MocRiWDV0e0jPYbfYYfuqNmzVPI31yAL6SXg3ItxY3hRT9MoKEAaThjHivXZl5Uby
 I+tt5L/77G4e6MLCU0itxGoXrulmY7LWH9ewfXKrW77ybimd45poRnO/QqTW5nu6rSmV
 On2jwLueoyDZItDZFJGbqt+xk23C+xK2+42z/3wpK4ZgPQcSXYMTO3UoZDpROXy0qJDM
 17XmYsDJoW0aBquPs0QgONe+OebBLtBf7dtVlnfUna13qSd6AjJVIQRGn+DLJqoP58Hb
 138g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=iUr/Su9o46jDL8dJ97KU/SAIedxE8wYUU6GmXx2CUe4=;
 b=jXMas1qqJSWzVlDt7PY3nWwh85XzKdRPEFpWX0+8r3P93n/P4ZQFVHqRBc/ShbMNBc
 VKQHJlq2dkARlZ1JwmpbiOaiBYoNzlGnV6g29P8vp2NoTpJYM3klCAnNo+xCF59C1DH7
 U0wUtsu3fnCJeMA5SqQ5CKW5WCOJUSLLc/ehSj+0oson53edccVNFhxzfWioSHK5BayH
 fUc+zK3K7BejCdVOx8Eot+5vZalRo7ZnPJF3CwMyPnkAEjfSHMSuOeYgUA4iP/1S7Hqe
 hrPZ4h5nkRZTMzHv9o0oGk0/69bNSGE7eMIldIIeeNgJ052FmLRJ4SSWpDOsuC+cRsl2
 ztmw==
X-Gm-Message-State: AOAM531p2okSI50GRYjMMd6WKoTCV6F9b8EoC00Hyn9oeHHXEtxcadL0
 MwCg+HebnUmHX1TUoljquJQ=
X-Google-Smtp-Source: ABdhPJyOVyOCMnX/Do5FoHS/0+ie/pYHozaQjsvIasZ99RXIt7QLRxoOzJZqK1cCqM7u0UKA66JdPw==
X-Received: by 2002:a17:902:b493:b029:d0:cbe1:e782 with SMTP id
 y19-20020a170902b493b02900d0cbe1e782mr196976plr.41.1599554780729; 
 Tue, 08 Sep 2020 01:46:20 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id e125sm3802182pfe.154.2020.09.08.01.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:46:20 -0700 (PDT)
Date: Tue, 08 Sep 2020 18:46:15 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 3/5] powerpc/fault: Reorder tests in bad_kernel_fault()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <7baae4086cbb9ffb08c933b065ff7d29dbc03dd6.1596734104.git.christophe.leroy@csgroup.eu>
 <ef827b73770a7b155079393f8d8430e10a99ec94.1596734104.git.christophe.leroy@csgroup.eu>
In-Reply-To: <ef827b73770a7b155079393f8d8430e10a99ec94.1596734104.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1599554731.otayyrz92r.astroid@bobo.none>
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
> Check address earlier to simplify the following test.

Good logic reduction.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/fault.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 9ef9ee244f72..525e0c2b5406 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -210,17 +210,17 @@ static bool bad_kernel_fault(struct pt_regs *regs, =
unsigned long error_code,
>  		return true;
>  	}
> =20
> -	if (!is_exec && address < TASK_SIZE && (error_code & DSISR_PROTFAULT) &=
&
> +	// Kernel fault on kernel address is bad
> +	if (address >=3D TASK_SIZE)
> +		return true;
> +
> +	if (!is_exec && (error_code & DSISR_PROTFAULT) &&
>  	    !search_exception_tables(regs->nip)) {
>  		pr_crit_ratelimited("Kernel attempted to access user page (%lx) - expl=
oit attempt? (uid: %d)\n",
>  				    address,
>  				    from_kuid(&init_user_ns, current_uid()));
>  	}
> =20
> -	// Kernel fault on kernel address is bad
> -	if (address >=3D TASK_SIZE)
> -		return true;
> -
>  	// Fault on user outside of certain regions (eg. copy_tofrom_user()) is=
 bad
>  	if (!search_exception_tables(regs->nip))
>  		return true;
> --=20
> 2.25.0
>=20
>=20
