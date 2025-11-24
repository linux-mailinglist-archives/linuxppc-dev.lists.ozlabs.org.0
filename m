Return-Path: <linuxppc-dev+bounces-14464-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D5EC821CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 19:32:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFZDW2SG3z2xS2;
	Tue, 25 Nov 2025 05:32:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764009131;
	cv=none; b=BzIl6zHNgVF4toL8RXZNIrYz+P6h+DpwwkM66kbC6htemBrELuTsIHf0V3R+dp6381x9PXQA+s00rJvfP+K8gyvGDFaCE3GBGmbbTa/aPc1oAh+9f/vtP2UOXEZ0I0vZWLkkKP3uBFCU1YO0BQFT9Zn1uZIR3BRHHJDy9y6vqQwM0+cs0dFddfjGrslSviHd4JO9REC8WgKBNXf6H6JTdXPUXveeYDNgB8JNhF+R/poVu67vsh0e0SxUULN89HpV9P0yrZk/ILKLKFQa7zHe6cKAWU2mCRsruQbQXPJUncHEoYTv7QsiiO+Y56gIP2XRRLji0JspzBM6j2kd3HmOmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764009131; c=relaxed/relaxed;
	bh=M59jBTlMWczJQD7h71oNJP0VNXPKRi+lC/fpcU8Vahg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jjVhpKHfNKPn5iY/cF464VbQ4hdhE28GH8zwaxC3KB9tuAnVsJeRozlB95RPhQc5DriqHaS9qPiOAcar7YRkKR3FOvOAU+9f9Dq3HuVDhbdwKCPn3iJ9NGyzKfEQnsoRv3/LQT2VDXcduwtRszdVWN38Hw7KnsvJPK+VSdo1L3KEsrro5Vuiy7D/M+g6dyt6X+E/ajuBmzKo0pEzHjDW/HMIRdXQirXt3Nbw6lrY48MQ3+ribyh8b/qb+YFedxwr2G0bBJ62JzswfswuE3Hdqkldse6VX765ypzXJ2p1FX5LgE9xuvpIeLQbffSuuYhamKDwj8lc3fqM34bKPDi5NQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jLAQ3DMp; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jLAQ3DMp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFZDV529Cz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 05:32:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A841960103
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Nov 2025 18:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B19CC4AF09
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Nov 2025 18:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764009128;
	bh=/NNuAYjA+cYKSE9C8Z/aWVlDCUjpFcRWSApeHcQnHYI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jLAQ3DMpkoY3jTQNcOsQy59Be1x32wIvLPy9UoKXHoPwXRhS4YUXc2IvsrgWka2vp
	 0BOrPE4yBt/sU6u2oJI2mv1IMmpmsmljpJWMRvOC1gJqIgfEOGTkbtPodzOx0R/4Kw
	 IynuzsLpf2xA9EmPMfOR00JOkpX7vXeIXK/1AYf+kiNEZqsB1fCLMoKmmVWo+kwbal
	 /rMVxYdWBTXj678DYU2szKQwIvsXiiAGip8uGVWIOBAbHs+SayvnNHtpyLNboIRV84
	 Zx54Pqq9qNrNpmfz6Ip0e2x30y4W6oNUC34WZyLDWgRqszc6d5Ocy1ZbM020Oexoye
	 TX2Zd4KyMLEjg==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7373fba6d1so742811866b.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Nov 2025 10:32:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIF6ST9p7OV9wKZxTRqh0pibuRx6ntHMvGE3lTcCvjHVz20qo4YPENd382cxlfdx+1QYD7zVZgFDPThNA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yza8cDqOHB9P4aKmeTrsDj27z5XKZB73Go5a3GJUItPGqmAPCYV
	thwewvM07ISO3ytmjAiLEuxvJTDVcMU7mfRvoXiBwXABK4gKmdU2CNpIqJRlbZFLDGB7z3nnBqn
	8ztBLB0EAPBSWveTcPv9dNnFSctsDvg==
X-Google-Smtp-Source: AGHT+IEh009jWSdBFeUOPGdJeDnuYIa9j8P2N/bAYKPkQ1XCz8ABsOOB8jgwCEmn7v1HdDdcnspoFpo/DZfNOcP3l6Q=
X-Received: by 2002:a17:907:6e9e:b0:b76:2f40:a307 with SMTP id
 a640c23a62f3a-b7671b1a00dmr1349357766b.57.1764009126896; Mon, 24 Nov 2025
 10:32:06 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20251029174047.1620073-1-robh@kernel.org>
In-Reply-To: <20251029174047.1620073-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 24 Nov 2025 12:31:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKYbxwAXpMbMX20Hc_QJqbXiduUAmTbY1PX_omf5tQDvA@mail.gmail.com>
X-Gm-Features: AWmQ_bkZvqXE-tZHu7OBPqVDUl8SnKWLjarS0mV1FH5iYaoM94SwTd58b8OxJ20
Message-ID: <CAL_JsqKYbxwAXpMbMX20Hc_QJqbXiduUAmTbY1PX_omf5tQDvA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/prom_init: Fixup missing #size-cells on PowerMac
 media-bay nodes
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Stan Johnson <userm57@yahoo.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 29, 2025 at 12:41=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:
>
> Similar to other PowerMac mac-io devices, the media-bay node is missing t=
he
> "#size-cells" property.
>
> Depends-on: commit 045b14ca5c36 ("of: WARN on deprecated #address-cells/#=
size-cells handling")
> Reported-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/powerpc/kernel/prom_init.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Ping!

>
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_i=
nit.c
> index 827c958677f8..f26e80cbc615 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -2893,7 +2893,8 @@ static void __init fixup_device_tree_pmac(void)
>         for (node =3D 0; prom_next_node(&node); ) {
>                 type[0] =3D '\0';
>                 prom_getprop(node, "device_type", type, sizeof(type));
> -               if (prom_strcmp(type, "escc") && prom_strcmp(type, "i2s")=
)
> +               if (prom_strcmp(type, "escc") && prom_strcmp(type, "i2s")=
 &&
> +                   prom_strcmp(type, "media-bay"))
>                         continue;
>
>                 if (prom_getproplen(node, "#size-cells") !=3D PROM_ERROR)
> --
> 2.51.0
>

