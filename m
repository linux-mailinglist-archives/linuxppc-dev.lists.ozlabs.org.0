Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB302CEE92
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 14:05:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnXxQ3yXyzDr3t
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 00:05:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnXft6JymzDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 23:52:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mIhRVif9; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CnXfp4VdBz9sWj;
 Fri,  4 Dec 2020 23:52:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607086354;
 bh=/TyEDR3TnCQwUmoTfEEcSNTIuEYy8t6R8q2Wc3xQXb8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mIhRVif9jq3uabRYVp5bt23LBaCcmcd+ur7NSrc1DOEGmWVizsovhcZnC0g3tM7Et
 dXfzipRp44m9Lpp/6rBtvYcTCd63XfM8BraDhp0PbfIuC20WpS2dPcQg3MDy/p1tyL
 wyCvqbMjeuhS+7Klh/MJGwwZ3ZDoldV1dR5YU8Pp/dXAbJiGwaIlZki8dcnKGhcNqW
 VHG8DxRy52gRLhhThwmOt+SU1ZgnZpk1CL/jXVbcfE5fPpEkq163RZsHo6594rvdtj
 wgjH6QfkhbhHRjpffh7UZO7Quydm4wdeyHI3HWWIR/wrbWKiIZjv6PvIQVHtvBC5Wy
 +FoHODDkPSoMQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 13/29] powerpc/pseries/mobility: use stop_machine for
 join/suspend
In-Reply-To: <20201030011805.1224603-14-nathanl@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
 <20201030011805.1224603-14-nathanl@linux.ibm.com>
Date: Fri, 04 Dec 2020 23:52:33 +1100
Message-ID: <875z5hvilq.fsf@mpe.ellerman.id.au>
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nathan,

Just a couple of nits ...

Nathan Lynch <nathanl@linux.ibm.com> writes:
> The partition suspend sequence as specified in the platform
> architecture requires that all active processor threads call
> H_JOIN, which:
...
> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
> index 1b8ae221b98a..44ca7d4e143d 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -412,6 +414,128 @@ static int wait_for_vasi_session_suspending(u64 handle)
...

> +
> +static int do_join(void *arg)
> +{
> +	atomic_t *counter = arg;
> +	long hvrc;
> +	int ret;
> +
> +	/* Must ensure MSR.EE off for H_JOIN. */
> +	hard_irq_disable();

Didn't stop_machine() already do that for us?

In the state machine in multi_cpu_stop().

> +	hvrc = plpar_hcall_norets(H_JOIN);
> +
> +	switch (hvrc) {
> +	case H_CONTINUE:
> +		/*
> +		 * All other CPUs are offline or in H_JOIN. This CPU
> +		 * attempts the suspend.
> +		 */
> +		ret = do_suspend();
> +		break;
> +	case H_SUCCESS:
> +		/*
> +		 * The suspend is complete and this cpu has received a
> +		 * prod.
> +		 */
> +		ret = 0;
> +		break;
> +	case H_BAD_MODE:
> +	case H_HARDWARE:
> +	default:
> +		ret = -EIO;
> +		pr_err_ratelimited("H_JOIN error %ld on CPU %i\n",
> +				   hvrc, smp_processor_id());
> +		break;
> +	}
> +
> +	if (atomic_inc_return(counter) == 1) {
> +		pr_info("CPU %u waking all threads\n", smp_processor_id());
> +		prod_others();
> +	}

Do we even need the counter? IIUC only one CPU receives H_CONTINUE. So
couldn't we just have that CPU do the prodding of others?

> +	/*
> +	 * Execution may have been suspended for several seconds, so
> +	 * reset the watchdog.
> +	 */
> +	touch_nmi_watchdog();
> +	return ret;
> +}
> +
> +static int pseries_migrate_partition(u64 handle)
> +{
> +	atomic_t counter = ATOMIC_INIT(0);
> +	int ret;
> +
> +	ret = wait_for_vasi_session_suspending(handle);
> +	if (ret)
> +		goto out;

Direct return would be clearer IMHO.

> +
> +	ret = stop_machine(do_join, &counter, cpu_online_mask);
> +	if (ret == 0)
> +		post_mobility_fixup();
> +out:
> +	return ret;
> +}
> +

cheers
