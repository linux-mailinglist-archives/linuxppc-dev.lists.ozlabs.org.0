Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0C889D51D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 11:08:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=adCrhg8t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDKrG4tpmz3dWP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 19:08:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=adCrhg8t;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDKqZ3fPZz3cVG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 19:07:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712653674;
	bh=KC6HaNNF0yOrVA/+Njb4GLZU4s8BloBuMzzCyP7i85Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=adCrhg8tGDsRsN5jVSsR5EzTJk6D5nsJHlfH6E81pmrUsZfGJ+btxhf1m87PzAHgd
	 9U2Xh47vMwX1LW/w02U6BJ5RqzXUroPzkAGnSRsaZwozuD7rY0hCP8IVdt9Ybl1fL3
	 JWSvFQQ4U/dod49EbzoHQVbqqu7Ke4F0c+UJKICVQKr6C46/e8wQ6mByiPmjOZrbqP
	 bCD3H3x8oLfdKcgHuhPc9PBgXpuFpcGBn9aoy7fIDR2+PsUBNmjSdLQGzpF3sKBfVr
	 D7URpTmHmJxzvcEePTgno3qRSVDARmGkl9EApHLMkgUs7l75j06G+JbKH4ve3vQJnZ
	 beEx0sd8l6Y0w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VDKqY6N1cz4wyk;
	Tue,  9 Apr 2024 19:07:53 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/eeh: Permanently disable the removed device
In-Reply-To: <20240405131420.998618-1-ganeshgr@linux.ibm.com>
References: <20240405131420.998618-1-ganeshgr@linux.ibm.com>
Date: Tue, 09 Apr 2024 19:07:53 +1000
Message-ID: <87v84qaopi.fsf@mail.lhotse>
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
Cc: Sahitya.Damerla@ibm.com, Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ganesh,

Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
> When a device is hot removed on powernv, the hotplug
> driver clears the device's state. However, on pseries,
> if a device is removed by phyp after reaching the error
> threshold, the kernel remains unaware, leading to the
> device not being torn down. This prevents necessary
> remediation actions like failover.
>
> Permanently disable the device if the presence check
> fails.

You can wrap your changelogs a bit wider, 70 or 80 columns is fine.

> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index ab316e155ea9..8d1606406d3f 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -508,7 +508,9 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
>  	 * state, PE is in good state.
>  	 */
>  	if ((ret < 0) ||
> -	    (ret == EEH_STATE_NOT_SUPPORT) || eeh_state_active(ret)) {
> +	    (ret == EEH_STATE_NOT_SUPPORT &&
> +	     dev->error_state == pci_channel_io_perm_failure) ||
> +	    eeh_state_active(ret)) {
>  		eeh_stats.false_positives++;
>  		pe->false_positives++;
>  		rc = 0;

How does this hunk relate the changelog?

This is adding an extra condition to the false positive check, so
there's a risk this causes devices to go into failure when previously
they didn't, right? So please explain why it's a good change. The
comment above the if needs updating too.

> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
> index 48773d2d9be3..10317badf471 100644
> --- a/arch/powerpc/kernel/eeh_driver.c
> +++ b/arch/powerpc/kernel/eeh_driver.c
> @@ -867,7 +867,13 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>  	if (!devices) {
>  		pr_debug("EEH: Frozen PHB#%x-PE#%x is empty!\n",
>  			pe->phb->global_number, pe->addr);
> -		goto out; /* nothing to recover */

The other cases that go to recover_failed usually print something at
warn level, so this probably should too. So either make the above a
pr_warn(), or change it to a warn with a more helpful message.

> +		/*
> +		 * The device is removed, Tear down its state,
> +		 * On powernv hotplug driver would take care of
> +		 * it but not on pseries, Permanently disable the
> +		 * card as it is hot removed.
> +		 */

Formatting and punctuation is weird. It can be wider, and capital letter
is only required after a full stop, not a comma.

Also you say that the powernv hotplug driver "would" take care of it,
that's past tense, is that what you mean? Does the powernv hotplug
driver still take care of it after this change? And (how) does that
driver cope with it happening here also?

> +		goto recover_failed;
>  	}
>  	
cheers
