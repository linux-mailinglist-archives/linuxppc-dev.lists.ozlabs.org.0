Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C880F6028A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 11:46:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ms8C253MXz3c2L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 20:46:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rqZPiBsB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ms8B65Gk5z3c6d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Oct 2022 20:45:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rqZPiBsB;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ms8B629rKz4xG5;
	Tue, 18 Oct 2022 20:45:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1666086350;
	bh=LitIpUNPJXX8A9YpEnigfaQI8c2vxCGJKc4gdWmVIFE=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=rqZPiBsB0Ww7hyYbrZd5urgIXB4qH9jcisblvip9lqLDowogvSSEB0qLiUfsdatM0
	 Qf5VoUDxZCdQpc67pYd1x7SoJpLZZQojn5wL3Dpnl9JpwfQHliI013LM+De6orxIAn
	 QP/04qPPoRK0Ye/mNB6Tyys/xUwFIG2PhMXp4JpBAoSQr0cWjt6Uw446X1iadXktC/
	 sE7s83t2bV7PwXfg1VPvJaXFsdX+V80AWfBUfm9I2flYtZjOIjRolxAvzACkGPoH4p
	 qQUUjgO5minl06snJTer3UJc/pNvTpQuXBtHIftIfFf5mHfVfDrb/0kr0oaZOSSXZ3
	 d+r12lTvER4uw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] mm: remove kern_addr_valid() completely
In-Reply-To: <20221018074014.185687-1-wangkefeng.wang@huawei.com>
References: <20221018074014.185687-1-wangkefeng.wang@huawei.com>
Date: Tue, 18 Oct 2022 20:45:46 +1100
Message-ID: <87mt9tlb1x.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kefeng Wang <wangkefeng.wang@huawei.com> writes:
> Most architectures(except arm64/x86/sparc) simply return 1 for
> kern_addr_valid(), which is only used in read_kcore(), and it
> calls copy_from_kernel_nofault() which could check whether the
> address is a valid kernel address, so no need kern_addr_valid(),
> let's remove unneeded kern_addr_valid() completely.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/alpha/include/asm/pgtable.h          |  2 -
>  arch/arc/include/asm/pgtable-bits-arcv2.h |  2 -
>  arch/arm/include/asm/pgtable-nommu.h      |  2 -
>  arch/arm/include/asm/pgtable.h            |  4 --
>  arch/arm64/include/asm/pgtable.h          |  2 -
>  arch/arm64/mm/mmu.c                       | 47 -----------------------
>  arch/arm64/mm/pageattr.c                  |  3 +-
>  arch/csky/include/asm/pgtable.h           |  3 --
>  arch/hexagon/include/asm/page.h           |  7 ----
>  arch/ia64/include/asm/pgtable.h           | 16 --------
>  arch/loongarch/include/asm/pgtable.h      |  2 -
>  arch/m68k/include/asm/pgtable_mm.h        |  2 -
>  arch/m68k/include/asm/pgtable_no.h        |  1 -
>  arch/microblaze/include/asm/pgtable.h     |  3 --
>  arch/mips/include/asm/pgtable.h           |  2 -
>  arch/nios2/include/asm/pgtable.h          |  2 -
>  arch/openrisc/include/asm/pgtable.h       |  2 -
>  arch/parisc/include/asm/pgtable.h         | 15 --------
>  arch/powerpc/include/asm/pgtable.h        |  7 ----

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
