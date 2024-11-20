Return-Path: <linuxppc-dev+bounces-3443-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA549D34F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2024 09:01:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtYhW6VBKz2xvR;
	Wed, 20 Nov 2024 19:00:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732089659;
	cv=none; b=AUIItRi6pKk7qGI9t4b8Sp+G6siQf79Tf7usdHaihCFWUFEJiqlEsTTRfEbrRaTD42O2AjYKJOtCj7GpTowuQ6qjTKlgr+fSsmuTLc2LTNIk4j67EAn1vFiSqfLPHSHsf/cEznqOVZn53aaK9RZkWHznH7UfTGAcMpxsnDvM/qY/allc38rXY9Jr04bT+KO4EP93BTioVsH6Pf8ALXpV8BaTgybZxXkwrHCOMYqLc70wY3jeoPe//i4jk3Lc3r3rUNITH/0DQH1vGX6HePzESN5AJ/ghMhXGdkC1lsgJxbZlV5ZJ+XQTxe9l/0NBOHBJlu6LcH0ykT14ty5645PqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732089659; c=relaxed/relaxed;
	bh=SEVpEjmgQ7bq91VH3hqrRL8uvO6sYBlXdQ5LRcrtgtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ha2Y7T7iw9k1aJH46wg/7Gzn21qeZcMA2oXQ5VyFN5Vti/mq2ET0z78qF5FKxxN5e4Vmf7QfR4/7L61ozLNERvnGligwjmr/tGHMc/Tv9MEEgH9Nvw9WMeXc4+IsL18hbSbtkWbqHWtJoioZYPCbLDJ4oM38t/srbJs2iZxGDRFGkw5M7Wq1u9Ld7iMTdn3G7zpx6qqMxa3GyDhxK7dQOCSBt2zYrJWe24SZL9pa+vNdqSB6NDOlFKqtfUV8JH7wgah6rEUGq7oI3vAFOSbOsXWu48q+M0avxqqbIxJCmPf+1v9bDHIjP5iRXAkko3gt9YWVFuqM9VhHZeXZgmy0mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=NIwonKLK; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3hvmcImj; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=NIwonKLK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3hvmcImj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtYhV3LlMz2xst
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2024 19:00:58 +1100 (AEDT)
Date: Wed, 20 Nov 2024 09:00:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732089642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SEVpEjmgQ7bq91VH3hqrRL8uvO6sYBlXdQ5LRcrtgtY=;
	b=NIwonKLKdzP6mKprX9dS12I8bqX4sU7XYj2EGmsC9tdEnYaHuwC2B1JVlJyzUpiVv3GXjN
	IkcZWBE1pGAxIzpafWvXawZpmMjqIqIGNDH670169gORC4i+YXh+t2erXXQ1YwPoVhq5zL
	/FFm4POUHAgdklFtBR/NqZuPKomwM5g/P6fqNYlp9g9VphhrEVidiOr0rCqqNhP3sZeScP
	2xqr8zx8tfTsUMq96ew2CX4CgjKEsm57e17BIpmIIemsk0s7cjlfCIaSiXAress7QiZG2k
	eUIlM2F9GQvJSR1WzjVcaYhTP4SF8Mhw8F0BxUT3wTae0xFKFjgOUR+rhfShdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732089642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SEVpEjmgQ7bq91VH3hqrRL8uvO6sYBlXdQ5LRcrtgtY=;
	b=3hvmcImj8Fd5N3x4VP3Mfd/ek5RtfATGqWrXu51ps57Y2oS3zk8p6naVFLv0fMAWlQRaSD
	QxqmKPvjMfFfLcCw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, maddy@linux.ibm.com,
	ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] powerpc: Large user copy aware of full:rt:lazy
 preemption
Message-ID: <20241120080041.aNFNqWCz@linutronix.de>
References: <20241116192306.88217-1-sshegde@linux.ibm.com>
 <20241116192306.88217-3-sshegde@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241116192306.88217-3-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024-11-17 00:53:06 [+0530], Shrikanth Hegde wrote:
> Large user copy_to/from (more than 16 bytes) uses vmx instructions to 
> speed things up. Once the copy is done, it makes sense to try schedule 
> as soon as possible for preemptible kernels. So do this for 
> preempt=full/lazy and rt kernel. 
> 
> Not checking for lazy bit here, since it could lead to unnecessary 
> context switches.
> 
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/lib/vmx-helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
> index d491da8d1838..58ed6bd613a6 100644
> --- a/arch/powerpc/lib/vmx-helper.c
> +++ b/arch/powerpc/lib/vmx-helper.c
> @@ -45,7 +45,7 @@ int exit_vmx_usercopy(void)
>  	 * set and we are preemptible. The hack here is to schedule a
>  	 * decrementer to fire here and reschedule for us if necessary.
>  	 */
> -	if (IS_ENABLED(CONFIG_PREEMPT) && need_resched())
> +	if (IS_ENABLED(CONFIG_PREEMPTION) && need_resched())
>  		set_dec(1);

Now looking at this again there is a comment why preempt_enable() is
bad. An interrupt between preempt_enable_no_resched() and set_dec() is
fine because irq-exit would preempt properly? Regular preemption works
again once copy_to_user() is done? So if you copy 1GiB, you are blocked
for that 1GiB?

>  	return 0;
>  }

Sebastian

