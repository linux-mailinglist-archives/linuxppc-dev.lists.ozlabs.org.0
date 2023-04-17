Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECAB6E49EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 15:32:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0Sf600wHz3cf6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 23:32:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ApQLt+5h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ApQLt+5h;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0Sd94p3xz3c7S
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 23:31:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0BA4E6249A
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 13:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724EFC433D2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 13:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681738296;
	bh=Z1E7VRImbk5O8ynjKxbGEPL5/pNRjHf9QbC2IrDjeEw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ApQLt+5hMKVQIvzY5fCsHXN1O9d66Vkqdbnf/xozhB9nuWuwLcZf/MN0ppBlfhFIt
	 HQDUV2nEhzb6hm2lIFc6FOWsKV/xtHSrJDm16DGEKIk7rmSl1kCXD+7UtJki0cUM41
	 8okXBMRnAHqFb3pXt6yy8HLqPKgBBH01IvciEYmbPaO9iX7on0mQpD89z1YsQnCqhL
	 q322Ce5KqizgqcdNbLPtssnzKOay7XNC41dL/SlQYjEfg4XGzbmnPKW+wXhduIwJN+
	 v6rbKR36oXKryWyC6KbHqtudzstgkxltXOwyhoC5jg1NY3BT/2BLRzyKhheW+Oby7i
	 1ToU1aRNddTrw==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-54c12009c30so524369237b3.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 06:31:36 -0700 (PDT)
X-Gm-Message-State: AAQBX9f7jggBjp+ULOXaI9wJAbFWg0o4rgYEQvBqoHoN03uwcjAsGzvh
	wWUi0TtGYj26PYvae2mo49DvGObOBeKCvbhDzA==
X-Google-Smtp-Source: AKy350bviA6nMrYItp2UFoijYxMfOof9zLeZI1Waml/VUI/79m2nqsKw6eSDud+5a83sS7abqkKDxQ68edHzGfQfRRo=
X-Received: by 2002:a81:b60c:0:b0:54c:a67:90b with SMTP id u12-20020a81b60c000000b0054c0a67090bmr9245222ywh.5.1681738295535;
 Mon, 17 Apr 2023 06:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230412224620.8909-1-tanure@linux.com> <20230412224620.8909-2-tanure@linux.com>
In-Reply-To: <20230412224620.8909-2-tanure@linux.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 17 Apr 2023 08:31:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL1L4EOpVm7nXbZ0t8-9wHVq4531MN4Csemi-4SBd=zig@mail.gmail.com>
Message-ID: <CAL_JsqL1L4EOpVm7nXbZ0t8-9wHVq4531MN4Csemi-4SBd=zig@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] of: fdt: Scan /memreserve/ last
To: Lucas Tanure <tanure@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org, stefan@agner.ch, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@kernel.org>, jbrunet@baylibre.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 12, 2023 at 5:46=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> Change the order of scanning /memreserve/ and /reserved-memory node.
> /reserved-memory node should go first, as it has a more updated
> description of the memory regions and it can apply flags, like nomap.
> Also, /memreserve/ should avoid reserving regions described in
> /reserved-memory node.

Please give some background details why we need to make this change.
As-is, sounds like some theoretical issue. IOW, incorporate some of
the details in the cover letter here. For single patches, you don't
need a cover letter anyways.

Powerpc folks, please comment and/or test. I worry there could be some
subtle differences with this change.

>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  drivers/of/fdt.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index d1a68b6d03b3..c28aedd7ae1f 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -635,6 +635,9 @@ void __init early_init_fdt_scan_reserved_mem(void)
>         if (!initial_boot_params)
>                 return;
>
> +       fdt_scan_reserved_mem();
> +       fdt_reserve_elfcorehdr();
> +
>         /* Process header /memreserve/ fields */
>         for (n =3D 0; ; n++) {
>                 fdt_get_mem_rsv(initial_boot_params, n, &base, &size);
> @@ -643,8 +646,6 @@ void __init early_init_fdt_scan_reserved_mem(void)
>                 memblock_reserve(base, size);
>         }
>
> -       fdt_scan_reserved_mem();
> -       fdt_reserve_elfcorehdr();
>         fdt_init_reserved_mem();
>  }
>
> --
> 2.40.0
>
