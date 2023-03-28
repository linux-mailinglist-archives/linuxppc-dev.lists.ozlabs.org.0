Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E856E6CC1EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 16:18:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmBcN63npz3fQr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 01:18:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fHXjS8SG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fHXjS8SG;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmBbW55ptz3cBj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 01:17:43 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DA798617F3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 14:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C307EC433AC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 14:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680013060;
	bh=CeTJeyHjFur2f8WQY7ADogd1pxku0UIl/9w1d1coW7s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fHXjS8SG3+3woOSAsFZdKMiLfHOR8D8y4ypuURIO9m+IDdndbuq9tPM/esayv+V1f
	 ZJ3/M/o/DBlJq0UvTMV8GZlYG9qvJS7Qah2rXNf5BPaXQLtAP1fo/WxvNFqzLPCA8p
	 62NWv6TP+8OgLFioR1AbfMCEvvjdocPm7oYfxQmmwkY1BGaYt8ZW+xB/zRGryvHjJM
	 RZ0d4I9ditQjW8Y3Ju7NluGRCu3lyzz81HVFHKN74eT954FNjbuvJtAYLL9jB3sdhB
	 C80k1uFjRGovCo5TCMimpPNua/7+NY3ZQZuhfwNTUejLIZvFMlPc78tikqP3aHk1fa
	 zpSEdkmO7XDGQ==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-536af432ee5so233269477b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 07:17:40 -0700 (PDT)
X-Gm-Message-State: AAQBX9esqs/BY+9NZHLJ72v9/sKR1SguWUFvAJO7JwIiJVyXS25YdGo/
	0qvO6AmPb6LpVnyi7ZFmPKzaj7FNWzsyapK2iA==
X-Google-Smtp-Source: AKy350bpnUIh0Y3dOsByH0JInTgzU6Fdniof4Id3yRA3M5UehlXCBkq6XqT1KY0HTUQS4VYyL/VzpN9pZZ3dOqvJVvM=
X-Received: by 2002:a81:b149:0:b0:543:9065:b225 with SMTP id
 p70-20020a81b149000000b005439065b225mr7296521ywh.5.1680013059755; Tue, 28 Mar
 2023 07:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com> <20230321110813.26808-5-jiaxun.yang@flygoat.com>
In-Reply-To: <20230321110813.26808-5-jiaxun.yang@flygoat.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 28 Mar 2023 09:17:28 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+jFqKPVwheobNYNHVk5=u41CXbyyiEdfhEUSAGZmgCoA@mail.gmail.com>
Message-ID: <CAL_Jsq+jFqKPVwheobNYNHVk5=u41CXbyyiEdfhEUSAGZmgCoA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] of: address: Always use dma_default_coherent for
 default coherency
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
> As for now all arches have dma_default_coherent reflecting default
> DMA coherency for of devices, so there is no need to have a standalone
> config option.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v3: Squash setting ARCH_DMA_DEFAULT_COHERENT into this patch.
> ---
>  arch/powerpc/Kconfig |  2 +-
>  arch/riscv/Kconfig   |  2 +-
>  drivers/of/Kconfig   |  4 ----
>  drivers/of/address.c | 10 +---------
>  4 files changed, 3 insertions(+), 15 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
