Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF872185CA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 13:14:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1xXR1xn5zDr0w
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 21:14:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1xVj2FqyzDqyB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 21:13:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VKhQDUTO; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1xVh6NPpz9sDX;
 Wed,  8 Jul 2020 21:13:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594206780;
 bh=q4IUb+L/TelDHVJSgRXq/ljEnyuPjr0ghtLKqra0i4Y=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VKhQDUTOMjJ/Qc/NIPa+OVOI25qNTv1it5ofNQKNsc549N6UkH0xBOn0t8VWTniQm
 BqYKNpXMi1cWxYzcFAr39GqrokPu5DoEDZ1KIjQ1OxCsan/tuT0mEZPds/JNLzJ8ku
 D7LUe1CPwPbbY+FZ4x5BfrakL7MIC4vB4tsNIFYENbayGfOIZhG8qB9OOLmP4Bo+RK
 1TlXVI8LEu4N4PSrABmLTDh9HWf/8nwtMUCvWPZAlPFykVfysBpUKbnRBNE0rw6gqZ
 E2/FvgdLtMnGh1GzMeejo3i/zSLEUM9L20+GQUyNRjvRMWPsDF8jqeVXg0iTmfIOGl
 YNCvVe68KCtkg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 04/10] powerpc/perf: Add power10_feat to dt_cpu_ftrs
In-Reply-To: <1593595262-1433-5-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-5-git-send-email-atrajeev@linux.vnet.ibm.com>
Date: Wed, 08 Jul 2020 21:15:16 +1000
Message-ID: <87y2nu2r7f.fsf@mpe.ellerman.id.au>
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
> Add power10 feature function to dt_cpu_ftrs.c along
> with a power10 specific init() to initialize pmu sprs.
>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/reg.h        |  3 +++
>  arch/powerpc/kernel/cpu_setup_power.S |  7 +++++++
>  arch/powerpc/kernel/dt_cpu_ftrs.c     | 26 ++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 21a1b2d..900ada1 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -1068,6 +1068,9 @@
>  #define MMCR0_PMC2_LOADMISSTIME	0x5
>  #endif
>  
> +/* BHRB disable bit for PowerISA v3.10 */
> +#define MMCRA_BHRB_DISABLE	0x0000002000000000
> +
>  /*
>   * SPRG usage:
>   *
> diff --git a/arch/powerpc/kernel/cpu_setup_power.S b/arch/powerpc/kernel/cpu_setup_power.S
> index efdcfa7..e8b3370c 100644
> --- a/arch/powerpc/kernel/cpu_setup_power.S
> +++ b/arch/powerpc/kernel/cpu_setup_power.S
> @@ -233,3 +233,10 @@ __init_PMU_ISA207:
>  	li	r5,0
>  	mtspr	SPRN_MMCRS,r5
>  	blr
> +
> +__init_PMU_ISA31:
> +	li	r5,0
> +	mtspr	SPRN_MMCR3,r5
> +	LOAD_REG_IMMEDIATE(r5, MMCRA_BHRB_DISABLE)
> +	mtspr	SPRN_MMCRA,r5
> +	blr

This doesn't seem like it belongs in this patch. It's not called?

cheers
