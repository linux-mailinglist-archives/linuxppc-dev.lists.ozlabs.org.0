Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F488356B68
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 13:38:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFj830yVxz3bqt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 21:38:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=J9aYfimi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=J9aYfimi; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFj7g44Dnz2yYg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 21:38:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FFj7f6sL1z9sPf;
 Wed,  7 Apr 2021 21:38:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617795487;
 bh=l/vhPByOgQ2nlr3XYmVgUsu5dxA/qR7PGkmDuRQiOs0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=J9aYfimirNO5e+51K4/+aNdXFhY0JjVrEw9LrFJToZsvDCAqpsgOJ5iwd8oyRklrU
 paeXLooMF8qhR7FCDWjAOHOfSMsetdB5MoBrlFHFUNV6vWkfq4rZHjdeXm/vBX4zmN
 fBuMxvLkyKQREjdtA6NxvQGp6u2KUUPlJOc+dqvDNswowdmGLVffIyDhy/8MFq0zY6
 DS2vo6gbmBLNX88TyFDOWvhYZSHlpEhP/xHBf9isUZzC3zNhYcoesPiuVPiLHEX8ZC
 prezCh5LLM9VcoBPke3NudXq5/4qLXCZGtYqcj/w++oGRMQleudkf7hP2brqibb0UH
 FTODZs5/VeR0w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] powerpc/perf: Infrastructure to support checking
 of attr.config*
In-Reply-To: <20210325115326.143151-1-maddy@linux.ibm.com>
References: <20210325115326.143151-1-maddy@linux.ibm.com>
Date: Wed, 07 Apr 2021 21:38:06 +1000
Message-ID: <87sg42e34x.fsf@mpe.ellerman.id.au>
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Madhavan Srinivasan <maddy@linux.ibm.com> writes:
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 6817331e22ff..c6eeb4fdc5fd 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -1958,6 +1958,20 @@ static int power_pmu_event_init(struct perf_event *event)
>  
>  		if (ppmu->blacklist_ev && is_event_blacklisted(ev))
>  			return -EINVAL;
> +		/*
> +		 * PMU config registers have fields that are
> +		 * reserved and specific value to bit field as reserved.
> +		 * For ex., MMCRA[61:62] is Randome Sampling Mode (SM)
> +		 * and value of 0b11 to this field is reserved.
> +		 *
> +		 * This check is needed only for raw event type,
> +		 * since tools like fuzzer use raw event type to
> +		 * provide randomized event code values for test.
> +		 *
> +		 */
> +		if (ppmu->check_attr_config &&
> +		    ppmu->check_attr_config(event))
> +			return -EINVAL;
>  		break;

It's not obvious from the diff, but you're only doing the check for RAW
events.

But I think that's wrong, we should always check, even if the event code
comes from the kernel we should still apply the same checks. Otherwise
we might inadvertently use an invalid event code for a HARDWARE or CACHE
event.

cheers
