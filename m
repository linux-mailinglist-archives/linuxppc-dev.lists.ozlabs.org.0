Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BE657FA44
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 09:29:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrsB24sHGz3cBw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 17:29:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hq5GgIgK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hq5GgIgK;
	dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lrs9P4qgYz3bcZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 17:28:55 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id i13so3610145edj.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 00:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vMEnrGB4HYdP/eTvNNcIwLpDOuUcAudKRal9PHh2i7k=;
        b=hq5GgIgKeCBfU14aRy/moRxb86DWt6ZbGJn/vYeSSUv00MJguhXNpZ7RQ6rVHvg4DQ
         /mlok3N0gF2bs+nPxCC7EcDSY4d/n+G+DJUF8cVWzbimrmXVQdhz6TZZ1uKPjY1cpG7V
         Eci2TpATgrR0EdSrzys5pQIZbqoJltVSdt4mrjLiRsdmLS2DpXCkqJCVHxNGTFMXL6QE
         N8yJvqDHsH8s56sggqrtjgpMc5h9JECZqx++CZ48s3kAzHdz8KWEYP6SGBkuMDa+9XFu
         zFaO1tFyCkbcBDPvWwwATJAhesMYynG7ffKWtyTxiuZfA8om/x3MXXmbdIdDX3nZ7KMU
         eNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vMEnrGB4HYdP/eTvNNcIwLpDOuUcAudKRal9PHh2i7k=;
        b=yrhKxYq9dmfJtV279Wug9E+if2ewbyjociTJYIyMdcUUuY/9r7R9v0twn8tm286lsZ
         yZivDPjEnFM4j8YgQQDoXyj4nB32cOn5PFXnBVK1jtmPSfWFW3M+xGiQltZK6/mqqsd8
         gK3hp8nhNKIQShN0eKSdaxpmsnllm1TYXhVXm/KLcbFVgIx5GziHXq+HUw1gKmvUeuaX
         Eggjls4QKQxDj78x2vf4yQ4Rl7QryyHAClqWMTBgKE764830XM6YZN8fAJhnygj1kw9w
         g2UhBDaa3/RFI/l3aGhzZ3Ii99G58H09W8H2YpSiFK03INMSssv3z8aG33nSseauQinw
         o4zw==
X-Gm-Message-State: AJIora9SgdKLxo+UIVE4aZrnywmaan2KzvzAF+283QL3oRl9AalvuxmR
	a8OHquCO4B6jZTgKgdRAz6oBiK/954xoj4t/VvU=
X-Google-Smtp-Source: AGRyM1vdcAIHTjS02QftTovrDwGv8zlIcrR9fl04Bm4gKAIHUl3rgnkBKb7VLEoYIUbwOj6oZjkCrW9gXNf8bkHM6o4=
X-Received: by 2002:a05:6402:1768:b0:43b:c4b0:ffd3 with SMTP id
 da8-20020a056402176800b0043bc4b0ffd3mr11443522edb.163.1658734129332; Mon, 25
 Jul 2022 00:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220723214537.2054208-1-yury.norov@gmail.com> <20220723214537.2054208-2-yury.norov@gmail.com>
In-Reply-To: <20220723214537.2054208-2-yury.norov@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 09:28:12 +0200
Message-ID: <CAHp75VfOmN=cTEs7gbwxZ7W3hXjBo67N4AmHHiDfcVfFzHkMLA@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc: drop dependency on <asm/machdep.h> in archrandom.h
To: Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 24, 2022 at 12:19 AM Yury Norov <yury.norov@gmail.com> wrote:
>
> archrandom.h includes <asm/machdep.h> to refer ppc_md. This causes
> circular header dependency, if generic nodemask.h  includes random.h:
>
> In file included from include/linux/cred.h:16,
>                  from include/linux/seq_file.h:13,
>                  from arch/powerpc/include/asm/machdep.h:6,
>                  from arch/powerpc/include/asm/archrandom.h:5,
>                  from include/linux/random.h:109,
>                  from include/linux/nodemask.h:97,
>                  from include/linux/list_lru.h:12,
>                  from include/linux/fs.h:13,
>                  from include/linux/compat.h:17,
>                  from arch/powerpc/kernel/asm-offsets.c:12:
> include/linux/sched.h:1203:9: error: unknown type name 'nodemask_t'
>  1203 |         nodemask_t                      mems_allowed;
>       |         ^~~~~~~~~~
>
> Fix it by removing <asm/machdep.h> dependency from archrandom.h

...

>  EXPORT_SYMBOL_GPL(pm_power_off);

^^^ (Note this and read below)

...

> +EXPORT_SYMBOL(arch_get_random_seed_long);

It can't be like this. Brief browsing of the callees shows that.

-- 
With Best Regards,
Andy Shevchenko
