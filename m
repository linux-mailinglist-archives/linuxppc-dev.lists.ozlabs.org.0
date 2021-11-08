Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFD54479E2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 06:21:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hnfbs0BYMz2yZ2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 16:21:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D5KrqRQv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnfbC0G1nz2xD3
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 16:20:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=D5KrqRQv; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hnfb93gSqz4xdJ;
 Mon,  8 Nov 2021 16:20:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1636348853;
 bh=uEmJ3ph/l3srN9YvznaemZm28WBx9z72frhe7f4XMWg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=D5KrqRQvmd3BE5FT4OD/MmC8lEgbkSjaJlyO83M4HyfXSykBZHKZEaSnmcTsng8B4
 Cw+ife8sXVYhGT+60vCQGqXN3PZReAkaUCsm4JwHe0FORzCuqypVwwey5Zbv1G5Adx
 xo22fBQrXMgmtHCJSWkQU8P1qKOpFpVwAgZv24wsP8QFcrlZHfapgc4d+lhmD9zDVY
 8ViFNgkQmbG4IcoQb+JP6kIGOZNE24kqB91Z1XNoP3v5L6RxKwiAfMtGFNHSKu65mY
 DorToKmJQoLkkg8m2qteE7u8n/9gNUFdUk8afo1Kj87gdqwEnCNKImrukwI61wIqaf
 K2xv7tAYj1XJA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: Fix numa FORM2 parsing fallback code
In-Reply-To: <20211105132909.1582449-1-npiggin@gmail.com>
References: <20211105132909.1582449-1-npiggin@gmail.com>
Date: Mon, 08 Nov 2021 16:20:49 +1100
Message-ID: <87sfw76x5a.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> In case the FORM2 distance table from firmware is not the expected size,
> there is fallback code that just populates the lookup table as local vs
> remote.
>
> However it then continues on to use the distance table. Fix.
>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Fixes: 1c6b5a7e7405 ("powerpc/pseries: Add support for FORM2 associativity")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/mm/numa.c | 29 +++++++++++++----------------
>  1 file changed, 13 insertions(+), 16 deletions(-)
>
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 6f14c8fb6359..0789cde7f658 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -380,6 +380,7 @@ static void initialize_form2_numa_distance_lookup_table(void)
>  	const __be32 *numa_lookup_index;
>  	int numa_dist_table_length;
>  	int max_numa_index, distance_index;
> +	bool good = true;

numa_dist_table is a pointer, so couldn't we just set it to NULL if the
info it's pointing at is invalid?

>  
>  	if (firmware_has_feature(FW_FEATURE_OPAL))
>  		root = of_find_node_by_path("/ibm,opal");
> @@ -407,30 +408,26 @@ static void initialize_form2_numa_distance_lookup_table(void)
>  
>  	if (numa_dist_table_length != max_numa_index * max_numa_index) {
>  		WARN(1, "Wrong NUMA distance information\n");
> -		/* consider everybody else just remote. */
> -		for (i = 0;  i < max_numa_index; i++) {
> -			for (j = 0; j < max_numa_index; j++) {
> -				int nodeA = numa_id_index_table[i];
> -				int nodeB = numa_id_index_table[j];
> -
> -				if (nodeA == nodeB)
> -					numa_distance_table[nodeA][nodeB] = LOCAL_DISTANCE;
> -				else
> -					numa_distance_table[nodeA][nodeB] = REMOTE_DISTANCE;
> -			}
> -		}
> +		good = false;

ie.		numa_dist_table = NULL;

>  	}
> -
>  	distance_index = 0;
>  	for (i = 0;  i < max_numa_index; i++) {
>  		for (j = 0; j < max_numa_index; j++) {
>  			int nodeA = numa_id_index_table[i];
>  			int nodeB = numa_id_index_table[j];
> -
> -			numa_distance_table[nodeA][nodeB] = numa_dist_table[distance_index++];
> -			pr_debug("dist[%d][%d]=%d ", nodeA, nodeB, numa_distance_table[nodeA][nodeB]);
> +			int dist;
> +
> +			if (good)

			if (numa_dist_table)

> +				dist = numa_dist_table[distance_index++];
> +			else if (nodeA == nodeB)
> +				dist = LOCAL_DISTANCE;
> +			else
> +				dist = REMOTE_DISTANCE;
> +			numa_distance_table[nodeA][nodeB] = dist;
> +			pr_debug("dist[%d][%d]=%d ", nodeA, nodeB, dist);
>  		}
>  	}
> +
>  	of_node_put(root);
>  }


But maybe before we do that we can rename it, because it is really easy
to confuse numa_dist_table and numa_distance_table if you don't look
closely.

cheers
