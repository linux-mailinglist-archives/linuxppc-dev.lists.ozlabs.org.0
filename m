Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6296E364200
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:48:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP67Y2yGnz2xxn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 22:48:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TFIpWRcw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TFIpWRcw; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP6791qTNz2xVt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 22:48:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FP67838LLz9tkF;
 Mon, 19 Apr 2021 22:48:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618836500;
 bh=dUS+5SQxWKfvwCRCgKVc26Hy5CEil6TC/hjd6Gd+C8Y=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TFIpWRcwvx5DUHdAlqtcOrbUyLeyhhzGbDOMjCmMoRfmB4wLqPOplLH0Q4PPww1qT
 p1aAnYoG8PvPYMgWV8tTDtwniO6cScSWqGPn7B3KXRbt5i08QpY7waaOIDNiV3ueWy
 FgWs4w8idT4dUvhkYxYKY07onMmOQCzt59fY6dVplyiT4dHXB/ucz+SBnm4N/oC8lw
 TQRlrExGOzhk8W5UxgncN7HXbJzIhgLicYbf8EEtvUz6Rs4Kx4rKv048Uc1WEpT7R6
 UbdGj4dgqosgreuR0+5P99DUMGOlNvmFx1MIxj3mlMkZMxgxF6XbKoQCVhabcCL96K
 Mq3JqHGQ2hm1A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] hotplug-cpu.c: set UNISOLATE on dlpar_cpu_remove()
 failure
In-Reply-To: <20210416210216.380291-3-danielhb413@gmail.com>
References: <20210416210216.380291-1-danielhb413@gmail.com>
 <20210416210216.380291-3-danielhb413@gmail.com>
Date: Mon, 19 Apr 2021 22:48:19 +1000
Message-ID: <87v98icuek.fsf@mpe.ellerman.id.au>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> The RTAS set-indicator call, when attempting to UNISOLATE a DRC that is
> already UNISOLATED or CONFIGURED, returns RTAS_OK and does nothing else
> for both QEMU and phyp. This gives us an opportunity to use this
> behavior to signal the hypervisor layer when an error during device
> removal happens, allowing it to do a proper error handling, while not
> breaking QEMU/phyp implementations that don't have this support.
>
> This patch introduces this idea by unisolating all CPU DRCs that failed
> to be removed by dlpar_cpu_remove_by_index(), when handling the
> PSERIES_HP_ELOG_ID_DRC_INDEX event. This is being done for this event
> only because its the only CPU removal event QEMU uses, and there's no
> need at this moment to add this mechanism for phyp only code.

Have you also confirmed that phyp is not bothered by it? ie. everything
seems to continue working when you trigger this path on phyp.

cheers

> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index 12cbffd3c2e3..ed66895c2f51 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -802,8 +802,15 @@ int dlpar_cpu(struct pseries_hp_errorlog *hp_elog)
>  	case PSERIES_HP_ELOG_ACTION_REMOVE:
>  		if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_COUNT)
>  			rc = dlpar_cpu_remove_by_count(count);
> -		else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX)
> +		else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX) {
>  			rc = dlpar_cpu_remove_by_index(drc_index);
> +			/* Setting the isolation state of an UNISOLATED/CONFIGURED
> +			 * device to UNISOLATE is a no-op, but the hypervison can
> +			 * use it as a hint that the cpu removal failed.
> +			 */
> +			if (rc)
> +				dlpar_unisolate_drc(drc_index);
> +		}
>  		else
>  			rc = -EINVAL;
>  		break;
> -- 
> 2.30.2
