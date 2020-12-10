Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A28E2D6C01
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 00:53:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsW2J6WZGzDqtG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 10:53:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsW0r0pC4zDqkD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 10:51:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=A5WoxWxE; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CsW0q1crLz9sWQ;
 Fri, 11 Dec 2020 10:51:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607644315;
 bh=WAgITyjWKw1UWUBXllHBE79F8v9rjQ5BdATmk/bD830=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=A5WoxWxEnhqAuD/k900pcC/iNJ8t+hnddiQSYI+MajxW7Z9WZ0/eGzl6EuSoo1D1P
 0FCscP56e5FTh/bTXWpUM5Pje7PEmbg7BIKYHqb/4tpt86v8ECUXLAHU7tXKcQTBMl
 +QK1Zr1zbFFci/md5bvDxvAj5bT5eP5/F21HWtjHkd3z6keNTp8DZ+1iPJ68Cix7cM
 T8MySadvmnvsnyKpN6oi5Uk0jIrH/qYhCE3QdIWzuQ3qoMAhdugOL9AtFcF4B0YOAP
 T2nRgwLvH/8HL/JcwkeNmJ0IlJoH4AhZSUJX4NP5aQ2v1DzSnNh1Tw9vzVn8xUhTGh
 LALA9D8IjMkSA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 07/13] powerpc: Increase NR_IRQS range to support more
 KVM guests
In-Reply-To: <20201210171450.1933725-8-clg@kaod.org>
References: <20201210171450.1933725-1-clg@kaod.org>
 <20201210171450.1933725-8-clg@kaod.org>
Date: Fri, 11 Dec 2020 10:51:51 +1100
Message-ID: <87czzhrzhk.fsf@mpe.ellerman.id.au>
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
Cc: Greg Kurz <groug@kaod.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:
> PowerNV systems can handle up to 4K guests and 1M interrupt numbers
> per chip. Increase the range of allowed interrupts to support a larger
> number of guests.
>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 5181872f9452..c250fbd430d1 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -66,7 +66,7 @@ config NEED_PER_CPU_PAGE_FIRST_CHUNK
>=20=20
>  config NR_IRQS
>  	int "Number of virtual interrupt numbers"
> -	range 32 32768
> +	range 32 1048576
>  	default "512"
>  	help
>  	  This defines the number of virtual interrupt numbers the kernel

We should really do what other arches do, and size this appropriately
based on the config, rather than asking users to guess what size they
need.

But I guess I'll take this for now, and we can do something fancier
later.

cheers
