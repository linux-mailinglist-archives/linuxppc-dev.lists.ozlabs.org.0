Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B64786CC1DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 16:16:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmBZ34VqQz3f4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 01:16:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NjwxT+f/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NjwxT+f/;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmBY56CHmz3cBj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 01:15:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6763C617FB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 14:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D82CC433A8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680012933;
	bh=KTQ5pqCwMxjCLp76U2Ck6TsKhM8aPCCJcsNQkFmamtQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NjwxT+f/vKnR4L6Jji+0GXiJYbs3EytFhBJu6zjfnJlKNjoJfNbWafw5LbezNcfCL
	 cB5BVrYIvGqgLPm8zf4MFSkEcBaMzER02mm7yB4tE/NdOSWFa++lmRQ2OpyEpwv+o1
	 S1jeLSdaTtOIktyXA9Jkbj/m+Ba8Nge9aNb2ckgkMe3YB59VyFgcBQdkUkMzwohfNP
	 ubiwVWkkp1MwoBwIj4IVRf9SUodlO3Ll4e6qqgPi1wtV2z7j0za1tfxg1ZDxTy3ZgT
	 gDefivX83lskrgK0iS1yAkFfGIGstJa77tyqE2guTtAzlfwYCb4l/SQvnAyw9Tj36w
	 tCOkzOIQHkqBg==
Received: by mail-yb1-f176.google.com with SMTP id e65so15190392ybh.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 07:15:33 -0700 (PDT)
X-Gm-Message-State: AAQBX9f71zi8ufecANh+hjeWZdzY2a8aj/6vdnssvKGNcGYgmSlvXuXA
	qcTtALLTmPzF6yfgSdvxVUceJbFCX13Iefrf3w==
X-Google-Smtp-Source: AKy350ZeXniVT2W0ktHF46dUuFUd+2aQjm+2XyAkxeqa0Slnktr+HmXjjIzlRv8cYTFNbgA1dPwAYhkFOMccqFv+ZgM=
X-Received: by 2002:a05:6902:1586:b0:b68:7b14:186b with SMTP id
 k6-20020a056902158600b00b687b14186bmr7386177ybu.1.1680012932155; Tue, 28 Mar
 2023 07:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com> <20230321110813.26808-2-jiaxun.yang@flygoat.com>
In-Reply-To: <20230321110813.26808-2-jiaxun.yang@flygoat.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 28 Mar 2023 09:15:20 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKxJ-u4owKhY1tSiDyBo0=92iQoJM0G6TAZ7BSNpJAZAw@mail.gmail.com>
Message-ID: <CAL_JsqKxJ-u4owKhY1tSiDyBo0=92iQoJM0G6TAZ7BSNpJAZAw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] of: address: Fix default coherency for MIPS
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
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
Cc: tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 21, 2023 at 6:08=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
> DT-based MIPS doesn't use OF_DMA_DEFAULT_COHERENT, but
> might override the system-wide default at runtime.
>
> Use dma_default_coherent to override default coherence for
> MIPS.
>

I assume you want this tagged for stable? Otherwise, I don't
understand why you add this here and then remove in patch 4.

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  drivers/of/address.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 4c0b169ef9bf..c105d66a1fa4 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -1105,6 +1105,14 @@ bool of_dma_is_coherent(struct device_node *np)
>         struct device_node *node;
>         bool is_coherent =3D IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT);
>
> +       /*
> +        * DT-based MIPS doesn't use OF_DMA_DEFAULT_COHERENT, but
> +        * might override the system-wide default at runtime.
> +        */
> +#if defined(CONFIG_MIPS) && defined(CONFIG_DMA_NONCOHERENT)
> +       is_coherent =3D dma_default_coherent;
> +#endif
> +
>         node =3D of_node_get(np);
>
>         while (node) {
> --
> 2.37.1 (Apple Git-137.1)
>
