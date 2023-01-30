Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E96A680534
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 05:48:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P4wgP0WsGz3cXf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 15:48:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Tp4Ih8kF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P4wfV3Yctz2xdw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 15:48:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Tp4Ih8kF;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P4wfQ5BWqz4xVG;
	Mon, 30 Jan 2023 15:47:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675054078;
	bh=XQwYX+EMLbty1h8gVJYIE2S1CbsF6LntEO9AGkjzcsk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Tp4Ih8kFKV1XrkbSJJkEyoDtMjUCj36UCBX1nIFGeAFa6ystY84c4vxwft4kyzHs7
	 EDohRBrL9U6JcPM3GNaRCFdrS1p4BXXMl4r5aGEqqB6yUQJjj/jI8SZon9k8gUwADv
	 zVznMErqxQclF5O/jG8ixSYQtbJHCPLAj9A9niJLZ9SNO5FcgzMRQCCC+3eRItid7y
	 GxOsLhy+JglNdlmbnqSzh/ETpX1XZA4gMGUt/IpyDd3GwfbgUDExt93LNU8LLluWzE
	 s2kSiI3oxXTgPRrHmV3dIQATHmU5tnDlG56dv3GvddLxZRH0e/+2alz0Vb2iyIbkP4
	 00mumgLRV3Rug==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Dawei Li <set_pte_at@outlook.com>, npiggin@gmail.com
Subject: Re: [PATCH v2] powerpc: macio: Make remove callback of macio driver
 void returned
In-Reply-To: <TYCP286MB2323FA245F0C35C5D7486CC9CAC09@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB2323FA245F0C35C5D7486CC9CAC09@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
Date: Mon, 30 Jan 2023 15:47:55 +1100
Message-ID: <87sffssk5g.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Dawei Li <set_pte_at@outlook.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dawei Li <set_pte_at@outlook.com> writes:
> Commit fc7a6209d571 ("bus: Make remove callback return void") forces
> bus_type::remove be void-returned, it doesn't make much sense for any
> bus based driver implementing remove callbalk to return non-void to
> its caller.
>
> This change is for macio bus based drivers.
>
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> ---
> v1 -> v2
> - Revert unneeded changes.
> - Rebased on latest powerpc/next.
>
> v1
> - https://lore.kernel.org/all/TYCP286MB2323FCDC7ECD87F8D97CB74BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/
> ---
>  arch/powerpc/include/asm/macio.h                | 2 +-
>  drivers/ata/pata_macio.c                        | 4 +---
>  drivers/macintosh/rack-meter.c                  | 4 +---
>  drivers/net/ethernet/apple/bmac.c               | 4 +---
>  drivers/net/ethernet/apple/mace.c               | 4 +---
>  drivers/net/wireless/intersil/orinoco/airport.c | 4 +---
>  drivers/scsi/mac53c94.c                         | 5 +----
>  drivers/scsi/mesh.c                             | 5 +----
>  drivers/tty/serial/pmac_zilog.c                 | 7 ++-----
>  sound/aoa/soundbus/i2sbus/core.c                | 4 +---
>  10 files changed, 11 insertions(+), 32 deletions(-)

I realise the patch has to be merged via a single subsystem, and powerpc
is probably the most appropriate, but please Cc the relevant lists for
the drivers touched.

AFAICS neither this version or v1 was Cc'ed to relevant lists, eg.
netdev, linux-wireless, linux-scsi, alsa-devel etc.

cheers
