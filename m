Return-Path: <linuxppc-dev+bounces-15704-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6E1D1D1A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:27:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drfPS2fQ1z2xlP;
	Wed, 14 Jan 2026 19:27:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768379260;
	cv=none; b=mw8nASjQMKqQDE1GBLaYeW6IQYESdQyFFEcG39Jj3r/qeu9bCYwR73KTxrxPdMTV7hGr2EFkeuMU/Lx4XwQ/4VT0vXxyOetcp6Lcg8nPFZOIoou2z42rM1hNsvASrhxiR0KYImc10SY52HSS8alEhKThjHyKg5zcPxLzmk7/vMj1gYZaFeuBRSkl/jdG9LavH+jb5HxJEmGFW510Y2PfBtH6NvUWDraTSd76FtpUHpDWYH2MZ8bLaElAWst4Fr9dhE0Ol3WbLR3cW6dVarvFC+5lxywq9da40JfA6iRayR59Sf5kfTvePs8h0Skz2Xm4rEedvz4Dn1428n6/80R88g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768379260; c=relaxed/relaxed;
	bh=1QwCcuQ6a1BIxKAAHOyPaYUIVLvaGXhXWQxTl0ImiD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQUe4+11nz8qRyPJMIJ9bR7KsYL1nqYDnyr/X+Pxikxz1SoxCSPdDXdeCfszQ0X6AooiZVxT/mX4gCT9axVHoAiMuTexL/Bvb3C3/QNH3e/BU07kJD1QhaBnb4fZQUYk2SbVJb1HDQuFNg8rPOn2XcS4Gjh5XasoEbeE67E1a2Sp1xkIJDkcFSt2BvL0PjZH7iU441vMQTjQsGUInZGnAmeuIOYXuzMfz7WiIzt3h8l5OZqHz8k1ENEPJb44uh/nTWotxMbzJHB8MEvzzoBelaXp8U2oUImFuR19SHKb3J0fWbR3onSToCNfL5re0gPJvwh+3u2amsxFp900jHPBJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eYpj8Thf; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eYpj8Thf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drfPR25YRz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:27:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02D7D4026D;
	Wed, 14 Jan 2026 08:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEF0C4CEF7;
	Wed, 14 Jan 2026 08:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768379256;
	bh=NA3qo9DrxluI1phzSkZ0+eMoPIthmXtuUNEbkNpNeFM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eYpj8ThfBqr+GuQRVFLvsB9/BOMDgWAk5taqiwI/C0p5RqLoop9A4qmQJnrAx4F2O
	 Vy7Pt5jB0HwOITRue+s6d6XqMD7jWpiKrZQJY/fgl9fZZ1p9XlyM5m+KoYTETYBYBX
	 Pd11J3UOSSMXOOQvk8RCz83YFJHf/gVsynValiEsySKaw3Ja/2t8SwFP0i6vkh3W/Y
	 sDfwPQiV5HjHE0GxQmVAdQyGGK4ujlcuBeoZz7cVHWscRs7eDYQFwBIAgwLb/a9C2X
	 7iO+V09kSK5Y6cQbsX416oc3pXtjorPqqHTNZwEHNCHZqj58XyXPHKVMYnviK2XRP0
	 LG95PDHo0Kgzw==
Message-ID: <b6592afe-a0b2-4af7-9c64-ddd2e1b08a0e@kernel.org>
Date: Wed, 14 Jan 2026 09:27:33 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/vdso: Provide clock_getres_time64()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20260114-vdso-powerpc-align-v1-1-acf09373d568@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260114-vdso-powerpc-align-v1-1-acf09373d568@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/01/2026 à 08:26, Thomas Weißschuh a écrit :
> For consistency with __vdso_clock_gettime64() there should also be a
> 64-bit variant of clock_getres(). This will allow the extension of
> CONFIG_COMPAT_32BIT_TIME to the vDSO and finally the removal of 32-bit
> time types from the kernel and UAPI.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
> Based on tip/timers/vdso.
> 
> This was missed in the original vdso_getres_time64() series as powerpc
> does not use include/vdso/gettime.h.
> ---
>   arch/powerpc/include/asm/vdso/gettimeofday.h |  2 ++
>   arch/powerpc/kernel/vdso/gettimeofday.S      | 12 ++++++++++++
>   arch/powerpc/kernel/vdso/vdso32.lds.S        |  1 +
>   arch/powerpc/kernel/vdso/vgettimeofday.c     |  6 ++++++
>   4 files changed, 21 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
> index ab3df12c8d94..8ea397e26ad0 100644
> --- a/arch/powerpc/include/asm/vdso/gettimeofday.h
> +++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
> @@ -135,6 +135,8 @@ int __c_kernel_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts,
>   			       const struct vdso_time_data *vd);
>   int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res,
>   			    const struct vdso_time_data *vd);
> +int __c_kernel_clock_getres_time64(clockid_t clock_id, struct __kernel_timespec *res,
> +				   const struct vdso_time_data *vd);
>   #endif
>   int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz,
>   			    const struct vdso_time_data *vd);
> diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kernel/vdso/gettimeofday.S
> index 79c967212444..1c8e51691bf8 100644
> --- a/arch/powerpc/kernel/vdso/gettimeofday.S
> +++ b/arch/powerpc/kernel/vdso/gettimeofday.S
> @@ -103,6 +103,18 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
>   	cvdso_call __c_kernel_clock_getres
>   V_FUNCTION_END(__kernel_clock_getres)
>   
> +/*
> + * Exact prototype of clock_getres_time64()
> + *
> + * int __kernel_clock_getres(clockid_t clock_id, struct __timespec64 *res);
> + *
> + */
> +#ifndef __powerpc64__
> +V_FUNCTION_BEGIN(__kernel_clock_getres_time64)
> +	cvdso_call __c_kernel_clock_getres_time64
> +V_FUNCTION_END(__kernel_clock_getres_time64)
> +#endif
> +
>   
>   /*
>    * Exact prototype of time()
> diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
> index 72a1012b8a20..3f384a2526ae 100644
> --- a/arch/powerpc/kernel/vdso/vdso32.lds.S
> +++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
> @@ -124,6 +124,7 @@ VERSION
>   		__kernel_clock_gettime;
>   		__kernel_clock_gettime64;
>   		__kernel_clock_getres;
> +		__kernel_clock_getres_time64;
>   		__kernel_time;
>   		__kernel_get_tbfreq;
>   		__kernel_sync_dicache;
> diff --git a/arch/powerpc/kernel/vdso/vgettimeofday.c b/arch/powerpc/kernel/vdso/vgettimeofday.c
> index 6f5167d81af5..3c194e1ab562 100644
> --- a/arch/powerpc/kernel/vdso/vgettimeofday.c
> +++ b/arch/powerpc/kernel/vdso/vgettimeofday.c
> @@ -35,6 +35,12 @@ int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res,
>   {
>   	return __cvdso_clock_getres_time32_data(vd, clock_id, res);
>   }
> +
> +int __c_kernel_clock_getres_time64(clockid_t clock_id, struct __kernel_timespec *res,
> +				   const struct vdso_time_data *vd)
> +{
> +	return __cvdso_clock_getres_data(vd, clock_id, res);
> +}
>   #endif
>   
>   int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz,
> 
> ---
> base-commit: 0e55e7636697077abceb2301d7d2718d75c34389
> change-id: 20260113-vdso-powerpc-align-e8e93664da2b
> 
> Best regards,


