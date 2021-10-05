Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D1B421E74
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 07:53:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNmwV0gMWz2ynJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 16:53:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ka3iPqs5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNmvt3Twbz2yMy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 16:52:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ka3iPqs5; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNmvr0YzQz4xbT;
 Tue,  5 Oct 2021 16:52:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1633413176;
 bh=6fFfGXnlkv8ChMdtcWF8kZ8uQuOaYZS2CMAl1vECsNA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ka3iPqs5QAU4Sp2SvzYlRkIdxNFkGMRHoxNhK0NhauTdY9BpCx7fAqn6M8eectADe
 2lTKbCbysnQ3spJhhIBvYbNyCXUTYe3jyAmxXTOuzISHctbq14gL+iGhmIsDyN/0aG
 2YXw2ifDKt3o7FNA6SbH22XUyh3nEeFYUSIuox9urLn9Vz2DRIdTquQ9F5FyL0YgUE
 HB8XnRRYHMEcWF1wu/Fk3aCgS2Ycq6fmy9WNi8hrfsLnMLK6IiG3icGMmjpmS0KHWJ
 FnB1tGXgLGN4TpDLdyuyWIUpRMz0orBW4/1C1qT4TTu5LU3rXM+6KHfeKU/qW4h/18
 qYH4TJpCjuWEg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org
Subject: Re: [V2 1/4] powerpc/perf: Refactor the code definition of perf reg
 extended mask
In-Reply-To: <20210930122055.1390-2-atrajeev@linux.vnet.ibm.com>
References: <20210930122055.1390-1-atrajeev@linux.vnet.ibm.com>
 <20210930122055.1390-2-atrajeev@linux.vnet.ibm.com>
Date: Tue, 05 Oct 2021 16:52:52 +1100
Message-ID: <87sfxgnhl7.fsf@mpe.ellerman.id.au>
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
> PERF_REG_PMU_MASK_300 and PERF_REG_PMU_MASK_31 defines the mask
> value for extended registers. Current definition of these mask values
> uses hex constant and does not use registers by name, making it less
> readable. Patch refactor the macro values by or'ing together the actual
> register value constants. Also include PERF_REG_EXTENDED_MAX as
> part of enum definition.
>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/uapi/asm/perf_regs.h | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/include/uapi/asm/perf_regs.h b/arch/powerpc/inc=
lude/uapi/asm/perf_regs.h
> index 578b3ee86105..fb1d8a9b4393 100644
> --- a/arch/powerpc/include/uapi/asm/perf_regs.h
> +++ b/arch/powerpc/include/uapi/asm/perf_regs.h
> @@ -61,27 +61,32 @@ enum perf_event_powerpc_regs {
>  	PERF_REG_POWERPC_PMC4,
>  	PERF_REG_POWERPC_PMC5,
>  	PERF_REG_POWERPC_PMC6,
> -	/* Max regs without the extended regs */
> +	/* Max mask value for interrupt regs w/o extended regs */
>  	PERF_REG_POWERPC_MAX =3D PERF_REG_POWERPC_MMCRA + 1,
> +	/* Max mask value for interrupt regs including extended regs */
> +	PERF_REG_EXTENDED_MAX =3D PERF_REG_POWERPC_PMC6 + 1,
>  };
>=20=20
>  #define PERF_REG_PMU_MASK	((1ULL << PERF_REG_POWERPC_MAX) - 1)
>=20=20
> -/* Exclude MMCR3, SIER2, SIER3 for CPU_FTR_ARCH_300 */
> -#define	PERF_EXCLUDE_REG_EXT_300	(7ULL << PERF_REG_POWERPC_MMCR3)
> -
>  /*
>   * PERF_REG_EXTENDED_MASK value for CPU_FTR_ARCH_300
>   * includes 9 SPRS from MMCR0 to PMC6 excluding the
> - * unsupported SPRS in PERF_EXCLUDE_REG_EXT_300.
> + * unsupported SPRS MMCR3, SIER2 and SIER3.
>   */
> -#define PERF_REG_PMU_MASK_300   ((0xfffULL << PERF_REG_POWERPC_MMCR0) - =
PERF_EXCLUDE_REG_EXT_300)
> +#define PERF_REG_PMU_MASK_300	\
> +	((1ul << PERF_REG_POWERPC_MMCR0) | (1ul << PERF_REG_POWERPC_MMCR1) | \
> +	(1ul << PERF_REG_POWERPC_MMCR2) | (1ul << PERF_REG_POWERPC_PMC1) | \
> +	(1ul << PERF_REG_POWERPC_PMC2) | (1ul << PERF_REG_POWERPC_PMC3) | \
> +	(1ul << PERF_REG_POWERPC_PMC4) | (1ul << PERF_REG_POWERPC_PMC5) | \
> +	(1ul << PERF_REG_POWERPC_PMC6))

These all need to be unsigned long long. Otherwise when building on big
endian (which defaults to 32-bit), we see errors such as:

  In file included from /home/michael/linux/tools/perf/arch/powerpc/include=
/perf_regs.h:7:0,
                   from arch/powerpc/util/../../../util/perf_regs.h:30,
                   from arch/powerpc/util/perf_regs.c:7:
  arch/powerpc/util/perf_regs.c: In function =E2=80=98arch__intr_reg_mask=
=E2=80=99:
  /home/michael/linux/tools/arch/powerpc/include/uapi/asm/perf_regs.h:78:8:=
 error: left shift count >=3D width of type [-Werror=3Dshift-count-overflow]
    ((1ul << PERF_REG_POWERPC_MMCR0) | (1ul << PERF_REG_POWERPC_MMCR1) | \
          ^
  arch/powerpc/util/perf_regs.c:206:19: note: in expansion of macro =E2=80=
=98PERF_REG_PMU_MASK_300=E2=80=99
     extended_mask =3D PERF_REG_PMU_MASK_300;
                     ^

cheers
