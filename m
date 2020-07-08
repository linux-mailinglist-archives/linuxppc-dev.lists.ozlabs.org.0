Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83774218577
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 13:04:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1xJk5Zj9zDr7N
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 21:04:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1xGc2PNnzDr30
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 21:02:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aSrscXK+; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1xGb4Gfbz9sRK;
 Wed,  8 Jul 2020 21:02:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594206151;
 bh=+DPI5azVuQ4kVRPLT3fkQQ80oKm73Myeb1ZiX0FJUUs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aSrscXK+cGj35xAewRPrCpKVI99FbZcUxCCnr78ovlIllG0lrl7oa5+mRNyTTebII
 Nz/tFgWpdGiry6DHAUtHVDA0OINQCGGMJvG8/Kd2rhWirYpEgP/4FZWBxy8fbBBHWY
 xs5RKo+NUj6uo0dkoSabDBo+21MeJJykL2+fmuFqR60guQHbHJFcoconesbcm2jHph
 jOY+9Pwr61HsGeqCBIiitl/XOVJUWegpLwtMdQRPOLYG/zMf2RfHURBbZxbivyjHZZ
 stGpL/dh/gcEnqkXbymWi4InMTu6Ldif9GX0JlcmirmYlEAHbZ2f8c7fXowYV4ANMD
 L6eOVhy65abdQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 03/10] powerpc/xmon: Add PowerISA v3.1 PMU SPRs
In-Reply-To: <1593595262-1433-4-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-4-git-send-email-atrajeev@linux.vnet.ibm.com>
Date: Wed, 08 Jul 2020 21:04:46 +1000
Message-ID: <871rlm469d.fsf@mpe.ellerman.id.au>
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
Cc: mikey@neuling.org, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
> From: Madhavan Srinivasan <maddy@linux.ibm.com>
>
> PowerISA v3.1 added three new perfromance
> monitoring unit (PMU) speical purpose register (SPR).
> They are Monitor Mode Control Register 3 (MMCR3),
> Sampled Instruction Event Register 2 (SIER2),
> Sampled Instruction Event Register 3 (SIER3).
>
> Patch here adds a new dump function dump_310_sprs
> to print these SPR values.
>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>  arch/powerpc/xmon/xmon.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 7efe4bc..8917fe8 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -2022,6 +2022,20 @@ static void dump_300_sprs(void)
>  #endif
>  }
>  
> +static void dump_310_sprs(void)
> +{
> +#ifdef CONFIG_PPC64
> +	if (!cpu_has_feature(CPU_FTR_ARCH_31))
> +		return;
> +
> +	printf("mmcr3  = %.16lx\n",
> +		mfspr(SPRN_MMCR3));
> +
> +	printf("sier2  = %.16lx  sier3  = %.16lx\n",
> +		mfspr(SPRN_SIER2), mfspr(SPRN_SIER3));

Why not all on one line like many of the others?

cheers
