Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F5481C2A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 02:17:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JwEtyxzp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sx8Xz0hTqz3cbN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 12:17:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JwEtyxzp;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sx8X81yNhz2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 12:16:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1703207799;
	bh=JIA//IHP0Me0Pc8sL62vOw+soEfxvkiZzbn5MDY7sf8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JwEtyxzpQ+ESmsQSdls5sNEhaIBKEJGDLR5mLVnatIdIQZcyLA0dvqEHe5ggdIfbY
	 x9feYcF7iHsrdLw6CKnX6xKLrHHVdK+Qsm8aIiu+FZCUVnxz5whaSHTL+3hFTMAdv2
	 /WqpUlghwPJASF5fkbOo4QliRReFyPasydAKo6TwDxmkJpM56PkemApuxnwcY9Lr9S
	 +B6f3eg7szMNiusQ4qJwo8jazXEYJ1DB0M/Apn64pI/mgORZw9ESe+6F+bhmIy1Z2l
	 NMN5JpXEWaGr1EYxANsrTwCo5zSbcYMqBLDBwWK1yhk3/VucBz90yVH7riEa0Itq4O
	 gLBuyW9UtftUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sx8X66JrGz4wcX;
	Fri, 22 Dec 2023 12:16:38 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/6xx: set High BAT Enable flag on G2 cores
In-Reply-To: <20231221124538.159706-1-matthias.schiffer@ew.tq-group.com>
References: <20231221124538.159706-1-matthias.schiffer@ew.tq-group.com>
Date: Fri, 22 Dec 2023 12:16:38 +1100
Message-ID: <875y0rkpe1.fsf@mail.lhotse>
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
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux@ew.tq-group.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Matthias Schiffer <matthias.schiffer@ew.tq-group.com> writes:
> MMU_FTR_USE_HIGH_BATS is set for G2-based cores (G2_LE, e300cX), but the
> high BATs need to be enabled in HID2 to work. Add register definitions
> and introduce a G2 variant of __setup_cpu_603.
>
> This fixes boot on CPUs like the MPC5200B with STRICT_KERNEL_RWX enabled.

Nice find.

Minor nit on naming. The 32-bit code mostly uses the numeric names, eg.
603, 603e, 604 etc. Can we stick with that, rather than using "G2"?

Wikipedia says G2 == 603e. But looking at your patch you're not changing
all the 603e cores, so I guess it's not that clear cut?

If using "G2" makes the most sense then it would be nice to update
Documentation/arch/powerpc/cpu_families.rst to mention it (not asking
you to do it necessarily, more a note for us).

cheers
