Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B25CB4755FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 11:14:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDWLn4p8Yz3cMQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 21:14:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a8eNNWo6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDWL75nt6z2yxL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 21:13:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=a8eNNWo6; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JDWL53dllz4xhp;
 Wed, 15 Dec 2021 21:13:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1639563231;
 bh=3WntohgGBSsd5zLTEq/JbPVU3YTQL8XrTLe5DXnpfYU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=a8eNNWo605MEiL8ylUOt7YdhmBZnPIijg5uWdKFJI3EqXiu+9jJpFpl0qRgxjzNJr
 55GgeghdhXOIhoWSsLRVt5H5NVVbMTJzW2/EjE5nILpENBmH45hJ0/QPUHs7Pj2XRc
 /o9AAUkwztZJ310T95OfI0JVUjoY7WFCJ+z7ykWMAka6NRYrnV1Q9t1M2A3byErDiI
 cjyrvJtn5OSAe6ONWSFVW8pDPsEZs9qTceN3/135nZOJfw1fK94BI4LRatIT6WHA08
 KkCkMzLAlITDIIbrhWV0KkJLHITxpaRN4bnqsKy8EHEWN95bNBXOqGub2C2EtCC5Xs
 lnLM4fX6QarMA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>, John Crispin <john@phrozen.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Frank
 Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v3] of/fdt: Rework early_init_dt_scan_memory() to call
 directly
In-Reply-To: <20211214202652.3894707-1-robh@kernel.org>
References: <20211214202652.3894707-1-robh@kernel.org>
Date: Wed, 15 Dec 2021 21:13:46 +1100
Message-ID: <871r2emazp.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, Frank Rowand <frank.rowand@sony.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rob Herring <robh@kernel.org> writes:
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 5e216555fe4f..97d7607625ec 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1078,49 +1078,50 @@ u64 __init dt_mem_next_cell(int s, const __be32 **cellp)
>  /*
>   * early_init_dt_scan_memory - Look for and parse memory nodes
>   */
> -int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
> -				     int depth, void *data)
> +int __init early_init_dt_scan_memory(void)
>  {
> -	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
> -	const __be32 *reg, *endp;
> -	int l;
> -	bool hotpluggable;
> -
> -	/* We are scanning "memory" nodes only */
> -	if (type == NULL || strcmp(type, "memory") != 0)
> -		return 0;
> +	int node;
> +	const void *fdt = initial_boot_params;
>  
> -	reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
> -	if (reg == NULL)
> -		reg = of_get_flat_dt_prop(node, "reg", &l);
> -	if (reg == NULL)
> -		return 0;
> +	for (node = fdt_node_offset_by_prop_value(fdt, -1, "device_type", "memory", 6);
> +	     node != -FDT_ERR_NOTFOUND;
> +	     node = fdt_node_offset_by_prop_value(fdt, node, "device_type", "memory", 6)) {

The 6 there doesn't work on my machines.

It needs to match the trailing NULL, so 7 or sizeof("memory") works.

cheers
