Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C476365111
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 05:43:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPV0X3ZkNz30Q9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 13:43:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=k6jJY9Wr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=k6jJY9Wr; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPV070KlFz2xfk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 13:43:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FPV055YrFz9vFD;
 Tue, 20 Apr 2021 13:43:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618890214;
 bh=jxmTx0ZoVRaEB7nRR/gUMFpdqQqapvdEocelqPt1wTs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=k6jJY9WrR/0O7CjJyN3N7nXe1Hu4GwfDNn3en9SPZ55OBPPipQe8mhrv0m2DYBf7N
 k58RcU/d96WEZ1WbwR5PTrUfh6M+7sPBQJpRpo97yDn32WEAxRhzd0qyUULmvRsJbO
 nULlirbofIIlMzDEiwTwb6Ku1MtfMHGGcl3t9gOugHPzUK0muw1rXCK7yiEmH0YNgC
 tkfHPFhBcEoFK7+xoIcn14YxQ2cY/XoVTF7T6JOF+3lJ2OUo6VeXbr39YsIQo1emoC
 N0+VrkcjQ7wQQ17+V2ZL5EcQ/HHyP5U9mm4pJ6N04agF5z4YBFh7RjcPrJq+PBG0tz
 0Llwet/PhB3iA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Subject: Re: [PATCH v4 4/9] powerpc/mm/book3s64: Fix possible build error
In-Reply-To: <20210414085915.301189-5-aneesh.kumar@linux.ibm.com>
References: <20210414085915.301189-1-aneesh.kumar@linux.ibm.com>
 <20210414085915.301189-5-aneesh.kumar@linux.ibm.com>
Date: Tue, 20 Apr 2021 13:43:33 +1000
Message-ID: <87k0oxd3iy.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 kaleshsingh@google.com, joel@joelfernandes.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Update _tlbiel_pid() such that we can avoid build errors like below when
> using this function in other places.
>
> arch/powerpc/mm/book3s64/radix_tlb.c: In function =E2=80=98__radix__flush=
_tlb_range_psize=E2=80=99:
> arch/powerpc/mm/book3s64/radix_tlb.c:114:2: warning: =E2=80=98asm=E2=80=
=99 operand 3 probably does not match constraints
>   114 |  asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
>       |  ^~~
> arch/powerpc/mm/book3s64/radix_tlb.c:114:2: error: impossible constraint =
in =E2=80=98asm=E2=80=99
> make[4]: *** [scripts/Makefile.build:271: arch/powerpc/mm/book3s64/radix_=
tlb.o] Error 1
> m
>
> With this fix, we can also drop the __always_inline in __radix_flush_tlb_=
range_psize
> which was added by commit e12d6d7d46a6 ("powerpc/mm/radix: mark __radix__=
flush_tlb_range_psize() as __always_inline")
>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/radix_tlb.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3=
s64/radix_tlb.c
> index 409e61210789..817a02ef6032 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -291,22 +291,30 @@ static inline void fixup_tlbie_lpid(unsigned long l=
pid)
>  /*
>   * We use 128 set in radix mode and 256 set in hpt mode.
>   */
> -static __always_inline void _tlbiel_pid(unsigned long pid, unsigned long=
 ric)
> +static inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
>  {
>  	int set;
>=20=20
>  	asm volatile("ptesync": : :"memory");
>=20=20
> -	/*
> -	 * Flush the first set of the TLB, and if we're doing a RIC_FLUSH_ALL,
> -	 * also flush the entire Page Walk Cache.
> -	 */
> -	__tlbiel_pid(pid, 0, ric);
> +	switch (ric) {
> +	case RIC_FLUSH_PWC:
>=20=20
> -	/* For PWC, only one flush is needed */
> -	if (ric =3D=3D RIC_FLUSH_PWC) {
> +		/* For PWC, only one flush is needed */
> +		__tlbiel_pid(pid, 0, RIC_FLUSH_PWC);
>  		ppc_after_tlbiel_barrier();
>  		return;
> +	case RIC_FLUSH_TLB:
> +		__tlbiel_pid(pid, 0, RIC_FLUSH_TLB);
> +		break;
> +	case RIC_FLUSH_ALL:
> +	default:
> +		/*
> +		 * Flush the first set of the TLB, and if
> +		 * we're doing a RIC_FLUSH_ALL, also flush
> +		 * the entire Page Walk Cache.
> +		 */
> +		__tlbiel_pid(pid, 0, RIC_FLUSH_ALL);
>  	}
>=20=20
>  	if (!cpu_has_feature(CPU_FTR_ARCH_31)) {
> @@ -1176,7 +1184,7 @@ void radix__tlb_flush(struct mmu_gather *tlb)
>  	}
>  }
>=20=20
> -static __always_inline void __radix__flush_tlb_range_psize(struct mm_str=
uct *mm,
> +static void __radix__flush_tlb_range_psize(struct mm_struct *mm,
>  				unsigned long start, unsigned long end,
>  				int psize, bool also_pwc)
>  {
> --=20
> 2.30.2
