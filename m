Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0324F24E57
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 13:50:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457Ywf1dzPzDqLV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 21:50:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457Yv41lHPzDq99
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 21:48:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 457Yv36XJHz9s7h;
 Tue, 21 May 2019 21:48:47 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/powernv: Return for invalid IMC domain
In-Reply-To: <20190520085753.19670-1-anju@linux.vnet.ibm.com>
References: <20190520085753.19670-1-anju@linux.vnet.ibm.com>
Date: Tue, 21 May 2019 21:48:46 +1000
Message-ID: <87sgt86na9.fsf@concordia.ellerman.id.au>
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
Cc: pavsubra@in.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anju T Sudhakar <anju@linux.vnet.ibm.com> writes:
> Currently init_imc_pmu() can be failed either because
> an IMC unit with invalid domain(i.e an IMC node not
> supported by the kernel) is attempted a pmu-registration
> or something went wrong while registering a valid IMC unit.
> In both the cases kernel provides a 'Registration failed'
> error message.
>
> Example:
> Log message, when trace-imc node is not supported by the kernel, and the
> skiboot supports trace-imc node.
>
> So for kernel, trace-imc node is now an unknown domain.
>
> [    1.731870] nest_phb5_imc performance monitor hardware support registered
> [    1.731944] nest_powerbus0_imc performance monitor hardware support registered
> [    1.734458] thread_imc performance monitor hardware support registered
> [    1.734460] IMC Unknown Device type
> [    1.734462] IMC PMU (null) Register failed
> [    1.734558] nest_xlink0_imc performance monitor hardware support registered
> [    1.734614] nest_xlink1_imc performance monitor hardware support registered
> [    1.734670] nest_xlink2_imc performance monitor hardware support registered
> [    1.747043] Initialise system trusted keyrings
> [    1.747054] Key type blacklist registered
>
>
> To avoid ambiguity on the error message, return for invalid domain
> before attempting a pmu registration. 

What do we print once the patch is applied?

cheers

> Fixes: 8f95faaac56c1 (`powerpc/powernv: Detect and create IMC device`)
> Reported-by: Pavaman Subramaniyam <pavsubra@in.ibm.com>
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/opal-imc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
> index 58a0794..4e8b0e1 100644
> --- a/arch/powerpc/platforms/powernv/opal-imc.c
> +++ b/arch/powerpc/platforms/powernv/opal-imc.c
> @@ -161,6 +161,10 @@ static int imc_pmu_create(struct device_node *parent, int pmu_index, int domain)
>  	struct imc_pmu *pmu_ptr;
>  	u32 offset;
>  
> +	/* Return for unknown domain */
> +	if (domain < 0)
> +		return -EINVAL;
> +
>  	/* memory for pmu */
>  	pmu_ptr = kzalloc(sizeof(*pmu_ptr), GFP_KERNEL);
>  	if (!pmu_ptr)
> -- 
> 1.8.3.1
