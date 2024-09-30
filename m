Return-Path: <linuxppc-dev+bounces-1689-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A989298A141
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2024 13:58:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHKMz5zb4z2x9M;
	Mon, 30 Sep 2024 21:58:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.179
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697502;
	cv=none; b=CTtFwqNbUT3aRk8pljYlAFDPvoQkNFjlQrGxM1nwItIr1eQ+KwtMnHX3oEbqx/S4m23n4T14sJbiYsHoEpkWozL0P/F9y4iuRg92Uc7uBsBO9U8880cNESO8gG6t7JCBLC2H/TY2Ou7Rcpm2BCFL6eKPK+OaXPi1pVrbLjJ6+Xo0XXEpzEMmy++WRUZzmnCzlFmxvl+dY9DFA9wDmEOHVdUS4owjC501br0172tPtv776TWnzynL7XLV+HBwCgB62Smy+ZcHtshVc4rb1mWjGbNjFgpvR0mZhbj43AzyVJ2EO5ry261/vUfJfzyOFyINVDEZz7KmCZZ8RIocCgZhcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697502; c=relaxed/relaxed;
	bh=GBhQUD2ivI1lM/FdIQwroSXOb0UcPWeoSjL72i76dRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dorxN1d9/8/M5EwmeW7+6C4ba/dndrusJmJpEX21uk4Au4ogK5dH8HZI08wu+CAXA983oVvxP3fGpBwnQOm3XZ5dG4Ms8dTrc9tnja6IIWUk7escfLhs4jWJPw+sDNHrMyRAsYOPsmOBqpz+X5Pv9Zs4sfl85pGT1X7oBetOijpHawpCwqPzlDYQVxDN7oHz0A6/9QXiF13suE4fytxJFk9qJQ8VZl5Hv2uCjjZ7G4P6F+RIZ+dNVREBFy0qkJq6Ta5C3BkV+k5fcE949vmF18Agdki3lMzwIXM8s5jAisTruyTEJd6cmBqe45aJ/jZf8G+PA31Ii7dQM71OvGZh1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.219.179; helo=mail-yb1-f179.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.179; helo=mail-yb1-f179.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKMx43dtz2x98
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 21:58:20 +1000 (AEST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e0b7efa1c1bso4303009276.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 04:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697496; x=1728302296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBhQUD2ivI1lM/FdIQwroSXOb0UcPWeoSjL72i76dRc=;
        b=vh6g/Gox4UoEcSnm0Frpiff4/v0yA5rpG8ciOLEEq5VdbqyRj3+QzKspqfI0du0iPx
         AZGGXZp5s5FC/NZU3bOo/zUR209uovfYWYzKeurLYHS65dOxkU9jDzV5w6b5MQuoGKF8
         /W3AFm7lw09+2ySokDbicDbKj0RQN5z0ztqWmMnkBr7kGn9egxwrnwCcZ5B97eZ/PEFR
         o1mb+h1vj4dTQbb1UFuCbF/vqu3HxahdRIjNKUCuqyMSk8URb0qIFsAb6mIA+Ik/mosw
         8/SSOhiXalqawBHM2TzCTVZeNhPn4q5F4h5Xy055zg4WVBdgLassbDt8SnZUJzMVLFbI
         YAtA==
X-Forwarded-Encrypted: i=1; AJvYcCWUxYWvASsOZktKGp/HDnRLDgN+CKiBeSelB9YK/0SL1mGRby4WqmrGZSBxUYWp4nEXQ2xtNAs+achXyHM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzlgjHbOyjCuO0l57p0Rygsy+A1aSZBNSYOXxHjPI/7L8zpe9Im
	QjO5zfw6PTJiKTZaUrIPgF0eSuEUXHpEYG3rSC4Sumw65w6Ugbea3QcZGgr+
X-Google-Smtp-Source: AGHT+IGvhKbt1eZCRWPdVcQfLtHbRDYY2QEy69W1ljNA8rHhQGwAf2bgNk2TZv/xBsgMCRkXIZDEaA==
X-Received: by 2002:a05:6902:a86:b0:e26:29cd:c1e9 with SMTP id 3f1490d57ef6-e2629cdc362mr15182276.34.1727697496170;
        Mon, 30 Sep 2024 04:58:16 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e6c3285esm2179327276.64.2024.09.30.04.58.15
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 04:58:16 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6dbb24ee34dso36498427b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 04:58:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURX9+c1qhoVGFgETl1UXw7oFEsW2pQ4mk30hFeMjdfNkGZVGaxuzQ39bQW5F/1lhasbCICQkSornxK2Jc=@lists.ozlabs.org
X-Received: by 2002:a05:690c:4243:b0:63b:f919:2e89 with SMTP id
 00721157ae682-6e24750a977mr72447177b3.2.1727697495763; Mon, 30 Sep 2024
 04:58:15 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240930112121.95324-1-Julia.Lawall@inria.fr> <20240930112121.95324-12-Julia.Lawall@inria.fr>
In-Reply-To: <20240930112121.95324-12-Julia.Lawall@inria.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Sep 2024 13:58:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=y_yx8qxmNZUV9ALxW_ZcMpEgXYirnHr70SHGYnWTRA@mail.gmail.com>
Message-ID: <CAMuHMdW=y_yx8qxmNZUV9ALxW_ZcMpEgXYirnHr70SHGYnWTRA@mail.gmail.com>
Subject: Re: [PATCH 11/35] powerpc/ps3: Reorganize kerneldoc parameter names
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Geoff Levand <geoff@infradead.org>, kernel-janitors@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.7 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Sep 30, 2024 at 1:24=E2=80=AFPM Julia Lawall <Julia.Lawall@inria.fr=
> wrote:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
>
> Problems identified using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/powerpc/platforms/ps3/repository.c
> +++ b/arch/powerpc/platforms/ps3/repository.c
> @@ -940,7 +940,7 @@ int __init ps3_repository_read_vuart_sysmgr_port(unsi=
gned int *port)
>
>  /**
>    * ps3_repository_read_boot_dat_info - Get address and size of cell_ext=
_os_area.
> -  * address: lpar address of cell_ext_os_area
> +  * @lpar_addr: lpar address of cell_ext_os_area
>    * @size: size of cell_ext_os_area
>    */

Not really a reordering, but good to have it ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

