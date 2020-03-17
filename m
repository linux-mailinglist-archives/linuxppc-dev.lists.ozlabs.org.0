Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EF1187804
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 04:14:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hJF94N0ZzDqPK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 14:14:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hJCY4sWXzDqQh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 14:13:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=W87B5m7H; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48hJCY35Sgz9sR4; Tue, 17 Mar 2020 14:13:29 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48hJCY0Zyrz9sPR;
 Tue, 17 Mar 2020 14:13:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584414809;
 bh=ezGsF1UeoLbn/OJ/iZaLkSdfEqbF8RmQREJ6TMA/QYo=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=W87B5m7Hhhtjv0k2eyuuOmxJycvegwOUDjOcCYG9PYelJBtwKoOQGGcNR2hXNFYDo
 7GKZzyDKdb4tyRbGz0+NNKHnwx2Phrry6sOIP7umvhiL57Vnu6djkfHYf5rCaPa+Eu
 HbapjvBfS2mdE9kJo0UUx0AzgpOcqZjTyJVOkSDjivQlz223yt1djIBsKegGnuyjhG
 QGmtSrdAe/O8A2TT0XOVEnc90ZnJpuSuwCBxw36vXVAaSL+hE9myqF+AFW60lAc+ke
 G7R2EbQqc4XmIPrh/j9PDvs1HBKhKGNFpA8cNRvjapmjJZqUolFzRDa7vFybOn2bPI
 sig7V7ZCRl5NA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org, svaidy@linux.ibm.com, ego@linux.vnet.ibm.com,
 linuxram@us.ibm.com, pratik.sampat@in.ibm.com, psampat@linux.ibm.com,
 pratik.r.sampat@gmail.com
Subject: Re: [PATCH v4 3/3] powerpc/powernv: Parse device tree,
 population of SPR support
In-Reply-To: <1f5138b5080606804162b0a7cf20c134589b96b1.1581505210.git.psampat@linux.ibm.com>
References: <cover.1581505210.git.psampat@linux.ibm.com>
 <1f5138b5080606804162b0a7cf20c134589b96b1.1581505210.git.psampat@linux.ibm.com>
Date: Tue, 17 Mar 2020 14:13:31 +1100
Message-ID: <87tv2nptb8.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pratik Rajesh Sampat <psampat@linux.ibm.com> writes:
> Parse the device tree for nodes self-save, self-restore and populate
> support for the preferred SPRs based what was advertised by the device
> tree.

These should be documented in:
  Documentation/devicetree/bindings/powerpc/opal/power-mgt.txt

> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index 97aeb45e897b..27dfadf609e8 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -1436,6 +1436,85 @@ static void __init pnv_probe_idle_states(void)
>  		supported_cpuidle_states |= pnv_idle_states[i].flags;
>  }
>  
> +/*
> + * Extracts and populates the self save or restore capabilities
> + * passed from the device tree node
> + */
> +static int extract_save_restore_state_dt(struct device_node *np, int type)
> +{
> +	int nr_sprns = 0, i, bitmask_index;
> +	int rc = 0;
> +	u64 *temp_u64;
> +	u64 bit_pos;
> +
> +	nr_sprns = of_property_count_u64_elems(np, "sprn-bitmask");
> +	if (nr_sprns <= 0)
> +		return rc;

Using <= 0 means zero SPRs is treated by success as the caller, is that
intended? If so a comment would be appropriate.

> +	temp_u64 = kcalloc(nr_sprns, sizeof(u64), GFP_KERNEL);
> +	if (of_property_read_u64_array(np, "sprn-bitmask",
> +				       temp_u64, nr_sprns)) {
> +		pr_warn("cpuidle-powernv: failed to find registers in DT\n");
> +		kfree(temp_u64);
> +		return -EINVAL;
> +	}
> +	/*
> +	 * Populate acknowledgment of support for the sprs in the global vector
> +	 * gotten by the registers supplied by the firmware.
> +	 * The registers are in a bitmask, bit index within
> +	 * that specifies the SPR
> +	 */
> +	for (i = 0; i < nr_preferred_sprs; i++) {
> +		bitmask_index = preferred_sprs[i].spr / 64;
> +		bit_pos = preferred_sprs[i].spr % 64;

This is basically a hand coded bitmap, see eg. BIT_WORD(), BIT_MASK() etc.

I don't think there's an easy way to convert temp_u64 into a proper
bitmap, so it's probably not worth doing that. But at least use the macros.

> +		if ((temp_u64[bitmask_index] & (1UL << bit_pos)) == 0) {
> +			if (type == SELF_RESTORE_TYPE)
> +				preferred_sprs[i].supported_mode &=
> +					~SELF_RESTORE_STRICT;
> +			else
> +				preferred_sprs[i].supported_mode &=
> +					~SELF_SAVE_STRICT;
> +			continue;
> +		}
> +		if (type == SELF_RESTORE_TYPE) {
> +			preferred_sprs[i].supported_mode |=
> +				SELF_RESTORE_STRICT;
> +		} else {
> +			preferred_sprs[i].supported_mode |=
> +				SELF_SAVE_STRICT;
> +		}
> +	}
> +
> +	kfree(temp_u64);
> +	return rc;
> +}
> +
> +static int pnv_parse_deepstate_dt(void)
> +{
> +	struct device_node *sr_np, *ss_np;

You never use these concurrently AFAICS, so you could just have a single *np.

> +	int rc = 0, i;
> +
> +	/* Self restore register population */
> +	sr_np = of_find_node_by_path("/ibm,opal/power-mgt/self-restore");

I know the existing idle code uses of_find_node_by_path(), but that's
because it's old and crufty. Please don't add new searches by path. You
should be searching by compatible.

> +	if (!sr_np) {
> +		pr_warn("opal: self restore Node not found");

This warning and the others below will fire on all existing firmware
versions, which is not OK.

> +	} else {
> +		rc = extract_save_restore_state_dt(sr_np, SELF_RESTORE_TYPE);
> +		if (rc != 0)
> +			return rc;
> +	}
> +	/* Self save register population */
> +	ss_np = of_find_node_by_path("/ibm,opal/power-mgt/self-save");
> +	if (!ss_np) {
> +		pr_warn("opal: self save Node not found");
> +		pr_warn("Legacy firmware. Assuming default self-restore support");
> +		for (i = 0; i < nr_preferred_sprs; i++)
> +			preferred_sprs[i].supported_mode &= ~SELF_SAVE_STRICT;
> +	} else {
> +		rc = extract_save_restore_state_dt(ss_np, SELF_SAVE_TYPE);
> +	}
> +	return rc;

You're leaking references on all the device_nodes in here, you need
of_node_put() before exiting.

> +}


cheers
