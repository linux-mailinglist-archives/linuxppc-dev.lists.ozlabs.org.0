Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CE46542E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 11:52:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45krvq2tZtzDqgl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 19:52:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G6q59/d5"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45krrr0fbQzDqcv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 19:50:19 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id i18so2666365pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 02:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=E3/j+bc8Tk5SqOw85OYmjAw37lWq5WZ74e+W7GT4X4w=;
 b=G6q59/d5IV5Dpa78hTtVT2+oyDoV4d/zMohU08nSePRszCnvypWDjP0JrggWheXN8U
 aISGjOmYX5CvM3aOP3pH1grfQuleovRSREHAIeSbgnV/XnBoF7GHV5/ORTJcKdU1Mkjv
 pKNMy9ASac8xfF5FmG2/Co+yus1cSx7ZLF6rvA6oY9WbAsJL/uHuX5Yh/658DNK/e+Ng
 aHc8fIJFHWBtekr2slvxQcMilPs1bzbq6ecP3DZRKW4m5dNFxLQfXNS0dw2H22F4qU9o
 Bq3h5PyjaWu0hGobiXd5YrTmLGxrTIDdCRqjU4u67yei70BOhpm2I5Uymun/3maDGDja
 rE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=E3/j+bc8Tk5SqOw85OYmjAw37lWq5WZ74e+W7GT4X4w=;
 b=ZxJc9Wphh9e/kWbgVQ5V5S5Juegrg0KGaFBb2ZkQN3WfS23C1SzyyGJkEpNRKz8PXx
 p5chHIXPCvFEe+Rp4EfVqJbamrhOtwiRJqliXBslDFhsIrWFY844tJSNhugaXBdUIMnA
 G7oZ21jJ1O8l8RpzyVbm7Gmo3MFBmQPhHAPhbe9qqJmt5fimOYLEfpyB+S09fzWYf8Bk
 Z9XBTg3hSpX+5NzC1iVjMWUcdPMNkVZxI92BEg83FAeS+3B9lNkAkC829jt6M7a1qg1b
 5+EVg0UHkA0YxzjF4XrDgwYGwcSTTNOHM8RxKWH2pWOM2D7LYwEt/ybaHdx9H8Gx7eHp
 hR+g==
X-Gm-Message-State: APjAAAVnfkk5pXQYdOmDxWbsITJ2KlPYkCk6GQ34r0hMLlM4ceUSIS/i
 ijS3wnYsl/+rR5VSvaX2GFk=
X-Google-Smtp-Source: APXvYqyIHKIyoqJ/xLIkBODlh8Zzic0vQ95MU3Yfyu/5IW5dvWqfni8w8npQg6VH7u6CjGYc3NIc4g==
X-Received: by 2002:a63:7a06:: with SMTP id v6mr3459347pgc.115.1562838616544; 
 Thu, 11 Jul 2019 02:50:16 -0700 (PDT)
Received: from localhost (193-116-118-149.tpgi.com.au. [193.116.118.149])
 by smtp.gmail.com with ESMTPSA id r13sm5851993pfr.25.2019.07.11.02.50.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 02:50:15 -0700 (PDT)
Date: Thu, 11 Jul 2019 19:47:18 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [v5 4/6] extable: Add function to search only kernel exception
 table
To: linux-kernel@vger.kernel.org, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, Santosh Sivaraj <santosh@fossix.org>
References: <20190709121524.18762-1-santosh@fossix.org>
 <20190709121524.18762-5-santosh@fossix.org>
In-Reply-To: <20190709121524.18762-5-santosh@fossix.org>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562837939.bik9erongk.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Reza Arbab <arbab@linux.ibm.com>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Santosh Sivaraj's on July 9, 2019 10:15 pm:
> In real mode, the search_exception tables cannot be called because
> it also searches the module exception tables if entry is not found
> in the kernel exception tables.

This is a patch for generic kernel code, it may not go through
powerpc tree and someone doing git blame or something won't have
any idea what this changelog means.

Can you re-word this and just say something like, "certain architecture
$specific operating modes (e.g., in powerpc machine check handler that
is unable to access vmalloc memory)."

>=20
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> ---
>  include/linux/extable.h |  2 ++
>  kernel/extable.c        | 16 +++++++++++++---
>  2 files changed, 15 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/linux/extable.h b/include/linux/extable.h
> index 41c5b3a25f67..0c2819ba67f0 100644
> --- a/include/linux/extable.h
> +++ b/include/linux/extable.h
> @@ -19,6 +19,8 @@ void trim_init_extable(struct module *m);
> =20
>  /* Given an address, look for it in the exception tables */
>  const struct exception_table_entry *search_exception_tables(unsigned lon=
g add);
> +const struct
> +exception_table_entry *search_kernel_exception_table(unsigned long addr)=
;
> =20
>  #ifdef CONFIG_MODULES
>  /* For extable.c to search modules' exception tables. */
> diff --git a/kernel/extable.c b/kernel/extable.c
> index e23cce6e6092..6d544cb79fff 100644
> --- a/kernel/extable.c
> +++ b/kernel/extable.c
> @@ -40,13 +40,23 @@ void __init sort_main_extable(void)
>  	}
>  }
> =20
> -/* Given an address, look for it in the exception tables. */
> +/* For the given address, look for it in the kernel exception table */

Nitpick, no reason to vary the structure of the comment.

Code wise it looks fine, so with the comments and changelog fixed,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> +const
> +struct exception_table_entry *search_kernel_exception_table(unsigned lon=
g addr)
> +{
> +	return search_extable(__start___ex_table,
> +			      __stop___ex_table - __start___ex_table, addr);
> +}
> +
> +/*
> + * Given an address, look for it in the kernel and the module exception
> + * tables.
> + */
>  const struct exception_table_entry *search_exception_tables(unsigned lon=
g addr)
>  {
>  	const struct exception_table_entry *e;
> =20
> -	e =3D search_extable(__start___ex_table,
> -			   __stop___ex_table - __start___ex_table, addr);
> +	e =3D search_kernel_exception_table(addr);
>  	if (!e)
>  		e =3D search_module_extables(addr);
>  	return e;
> --=20
> 2.20.1
>=20
>=20
=
