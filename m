Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5743583BAB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 12:02:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtmRj529Sz2xbJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 20:02:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bTJwS0Mm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtmR56yJ0z2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 20:02:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bTJwS0Mm;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LtmR34rGLz4x1S;
	Thu, 28 Jul 2022 20:02:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1659002545;
	bh=sPwx65IXOXOfoP6X8JNfSvi/mfHaolNTY7UuZAPTHxM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bTJwS0MmN71BhGqdr8ToWBSJvA6AplKAolqClqT1iGsuHDBv64mAEpIcQQshIye2q
	 HKTuJo6OZRytt6xw62TKmUMiQ8vffCP2zL1Rsa+EXaeUil62i//DyOa1V+g/MTdp/t
	 +Lb7zXH4ZernE31Yo+B3raBw+pncu+fIqCuOvfROyGIJe8uNmRYA7JQX0O9MfYdthM
	 h70R+U6xgOLRCrQ8OuVyFYHmK1I2DobOEoV8Fbjp++jf48Anjmo8ZMVVFxPPzOR60+
	 sgaWV7Gi4u07L+19Pc3c6AZqqXBLbVgn7+L5aSVIZVcdTw55v4L7N7KO701LIXF5XQ
	 Wcmys6hA+Olpg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org,
 linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-doc-tw-discuss@lists.sourceforge.net
Subject: Re: [PATCH 0/3] Documentation: powerpc: documentation fixes for
 Documentation/powerpc/elf_hwcaps.rst
In-Reply-To: <20220728033332.27836-1-bagasdotme@gmail.com>
References: <20220727220050.549db613@canb.auug.org.au>
 <20220728033332.27836-1-bagasdotme@gmail.com>
Date: Thu, 28 Jul 2022 20:02:22 +1000
Message-ID: <87fsila72p.fsf@mpe.ellerman.id.au>
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
Cc: Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Will Deacon <will@kernel.org>, Alex Shi <alexs@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bagas Sanjaya <bagasdotme@gmail.com> writes:
> After merging powerpc tree for linux-next integration testing, Stephen
> Rothwell reported htmldocs warnings at [1]. Fix these with self-explanatory
> fixes in the shortlog below.
>
> [1]: https://lore.kernel.org/linuxppc-dev/20220727220050.549db613@canb.auug.org.au/
>
> Bagas Sanjaya (3):
>   Documentation: powerpc: fix indentation warnings
>   Documentation: use different label names for each arch's
>     elf_hwcaps.rst
>   Documentation: powerpc: add elf_hwcaps to table of contents
>
>  Documentation/arm64/elf_hwcaps.rst              |  2 +-
>  Documentation/powerpc/elf_hwcaps.rst            | 17 +++++++----------
>  Documentation/powerpc/index.rst                 |  1 +
>  .../translations/zh_CN/arm64/elf_hwcaps.rst     |  2 +-
>  .../translations/zh_TW/arm64/elf_hwcaps.rst     |  2 +-
>  5 files changed, 11 insertions(+), 13 deletions(-)

Hi Bagas,

I'd actually already fixed these locally, but I'll take your versions
because you went to all the trouble of sending them :)

I've modified patch 2 to only change the powerpc label name, I don't
want to be touching the arm64 documentation this late in the development
cycle.

I've also installed every python package on earth and got my development
machine setup to build the docs again, so hopefully I'll catch errors
like this in future.

cheers
