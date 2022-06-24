Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 562B3558EC1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 05:09:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LThtN1mHYz3cdv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 13:09:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JHX2Ao+4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LThsp0v1Bz3bZC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 13:09:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JHX2Ao+4;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LThsm5TPjz4xLT;
	Fri, 24 Jun 2022 13:09:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656040142;
	bh=K++hI2FDkjV3G5478DzfpzmGcEObLlrEm0qg0VKmAH4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JHX2Ao+4jSwUp4Lj3ajWxHaaPO+OTH7kx/LBQVq9vuerTA4WfbzY9j1VeA0zTZGbv
	 gcWkiP8DEDI6VrW7PNNv7SmUrjOTBHcGIoIKzsLffPV4aq49KcTKjF1roSxxvzMKok
	 tiRC1n0QTPGF7Bzel47PCPX+J+KSGmVd+Ui9HJ9soXKau2mD1hHEjSNxiyVVXLTlpF
	 lWYq24g9zZHP87qx2D4YMG9CXWdExUBszaJL74+t+p7QKOCh3XK7byz3HiuelNGnza
	 q1+9XMBDq6/VqO8NipT1I3rObNZs3VaiOK6VHqpdduGeZxQWDhaEsMY8ks7q4Vzsoi
	 lnyvRUex8xctA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Rob Herring
 <robh+dt@kernel.org>
Subject: Re: [PATCH] powerpc: dts: Add DTS file for CZ.NIC Turris 1.x routers
In-Reply-To: <20220511143712.22550-1-pali@kernel.org>
References: <20220511143712.22550-1-pali@kernel.org>
Date: Fri, 24 Jun 2022 13:08:59 +1000
Message-ID: <877d5669mc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Josef Schlehofer <josef.schlehofer@nic.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Marek Behun <marek.behun@nic.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pali Roh=C3=A1r <pali@kernel.org> writes:
> CZ.NIC Turris 1.0 and 1.1 are open source routers, they have dual-core
> PowerPC Freescale P2020 CPU and are based on Freescale P2020RDB-PC-A boar=
d.
> Hardware design is fully open source, all firmware and hardware design
> files are available at Turris project website:
>
> https://docs.turris.cz/hw/turris-1x/turris-1x/
> https://project.turris.cz/en/hardware.html
>
> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
> ---
>  arch/powerpc/boot/dts/turris1x.dts | 470 +++++++++++++++++++++++++++++
>  1 file changed, 470 insertions(+)
>  create mode 100644 arch/powerpc/boot/dts/turris1x.dts

The headers say you Cc'ed this to the devicetree list, but I don't see
it in the devicetree patchwork:

  https://patchwork.ozlabs.org/project/devicetree-bindings/list/?state=3D*&=
q=3Dturris&archive=3Dboth

Which means it hasn't been run through Rob's CI scripts.

Maybe try a resend?

cheers
