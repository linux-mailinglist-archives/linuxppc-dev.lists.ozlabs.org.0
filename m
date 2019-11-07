Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B70F2D90
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 12:38:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4781cf6RVqzF3mx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 22:38:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4781YH74B4zF3Z2
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 22:35:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="o3qasFtd"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4781YG0fg6z9sP3;
 Thu,  7 Nov 2019 22:35:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573126530;
 bh=mZO1wIsvrCLpv1p4aIZzgPWhlA2TFQEjpAgDdVkHfps=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=o3qasFtdtDjH3tTxg3k88KhT2rW8XqsRlRuXsHwc7BA/9pSfp56c2OdswulsLzdVS
 /b3Rsuymvo9DgvhmlQhdHLep2YyDnmMcPnjIKOjLiTwd5q0s06TTFKp/GshUgs7HDw
 0SqxmtxkAa94UUQu15x4KVw4ykP/sIvIChfCmN08OVYp0kURd2iKmWFCh5RJdy7+Ko
 Ui/m4D5J6CbhqEC/v/N28V5A8nyeifTWTN+F7K6TE41UQ9meWhUijz0FZrljOJy/bD
 fVbw8KGILlf+7C+dwEYLR7Jjy2z+WlAUlbGb6f+aNbAhQs1VMzLvqsGQXEeQXsKgX9
 RjA1bWZunQwaA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH 3/9] powerpc/pseries: Add cpu DLPAR support for drc-info
 property
In-Reply-To: <1572967453-9586-4-git-send-email-tyreld@linux.ibm.com>
References: <1572967453-9586-1-git-send-email-tyreld@linux.ibm.com>
 <1572967453-9586-4-git-send-email-tyreld@linux.ibm.com>
Date: Thu, 07 Nov 2019 22:35:26 +1100
Message-ID: <878sor6hs1.fsf@mpe.ellerman.id.au>
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index bbda646..9ba006c 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -730,24 +774,49 @@ static int find_dlpar_cpus_to_add(u32 *cpu_drcs, u32 cpus_to_add)
>  		return -1;
>  	}
>  
> -	/* Search the ibm,drc-indexes array for possible CPU drcs to
> -	 * add. Note that the format of the ibm,drc-indexes array is
> -	 * the number of entries in the array followed by the array
> -	 * of drc values so we start looking at index = 1.
> -	 */
> -	index = 1;
> -	while (cpus_found < cpus_to_add) {
> -		u32 drc;
> +	info = of_find_property(parent, "ibm,drc-info", NULL);
> +	if (info) {
> +		struct of_drc_info drc;
> +		const __be32 *value;
> +		int count;
>  
> -		rc = of_property_read_u32_index(parent, "ibm,drc-indexes",
> -						index++, &drc);
> -		if (rc)
> -			break;
> +		value = of_prop_next_u32(info, NULL, &count);
> +		if (value)
> +			value++;
>  
> -		if (dlpar_cpu_exists(parent, drc))
> -			continue;
> +		for (i = 0; i < count; i++) {
> +			of_read_drc_info_cell(&info, &value, &drc);
> +			if (strncmp(drc.drc_type, "CPU", 3))
> +				break;
> +
> +			for (j = 0; j < drc.num_sequential_elems && cpus_found < cpus_to_add; j++) {

This line's nearly 100 columns, which suggests that this logic has
gotten too convoluted to be a single function.

So I think you should split one or both arms of the if out into separate
functions.

You're basically doing nothing after the if, so possibly you can just
return the result of the split out functions directly.

cheers

> +				drc_index = drc.drc_index_start + (drc.sequential_inc * j);
> +
> +				if (dlpar_cpu_exists(parent, drc_index))
> +					continue;
> +
> +				cpu_drcs[cpus_found++] = drc_index;
> +			}
> +		}
> +	} else {
> +		/* Search the ibm,drc-indexes array for possible CPU drcs to
> +		 * add. Note that the format of the ibm,drc-indexes array is
> +		 * the number of entries in the array followed by the array
> +		 * of drc values so we start looking at index = 1.
> +		 */
> +		index = 1;
> +		while (cpus_found < cpus_to_add) {
> +			rc = of_property_read_u32_index(parent, "ibm,drc-indexes",
> +							index++, &drc_index);
> +
> +			if (rc)
> +				break;
>  
> -		cpu_drcs[cpus_found++] = drc;
> +			if (dlpar_cpu_exists(parent, drc_index))
> +				continue;
> +
> +			cpu_drcs[cpus_found++] = drc_index;
> +		}
>  	}
>  
>  	of_node_put(parent);
