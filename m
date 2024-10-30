Return-Path: <linuxppc-dev+bounces-2732-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A67179B6696
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 15:55:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdqtY2j56z2yDS;
	Thu, 31 Oct 2024 01:55:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730300133;
	cv=none; b=mCfk0rFJDMUUWEhZspV6IyYkD7g8o3suShQ3hL90k9lduJbdfF1xyrOAZaCVXwc+N0DSu/qMoi7RgMVrUVkzTtEOH7CwKJS2n2LWIK+8t88EbHysnTcfVkGZq3F/7alLNg6R7QXinKEVtWDcPJt/QQy9HuKPYfM5ERaLgiLXaWBS+XoBlPa/GzHo8vf4litK1ubnoSelxCvlLyIVPJt0LXniQLhaiqMP9KWGk1sXz3F8rvnSaBmSm4B3yo9N5BxSPBqerhc5d5lBoxQaJ+Q42Cath0JHmHKAgcd/4xEGm8MOtJQyxUIlizlslW9PkQIrzFQpcwb32V7aHy67z8HP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730300133; c=relaxed/relaxed;
	bh=CMLlcuyrBExBFQ7cARmq4EKvLPPMbZK83A9cofBFpAU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RBTXi3AJcK7wQgl+/kThCak7RuCOJHrBlD47bQ4a3eCvv/iA6R8gptiQk/xFx+uZr1MCkQ0CdEZKlCr16uzxglEwdtJDeiFOBz4JS6/qOuEZLgu29f0HH9Rk9KDq7MEfN2q8trZRqv0xXvYTl6M8pEM+elCNDkWd+zeM6c6Dieo1sJsGDBMUHMkHCG6vq/+1b2MDhgIZxhqQtRppWLZUaUqrEfs9heqsSLrRje19I1HppcmAgXgjxIg6TwZiKlRzBGLlrlmJJOQ2YvhymsNRRYN1DLzFbPyjNMYDycoUGP/10OWR/Nmwwj0AOBm2+1hIqBqQGUp0G3EUkZP2A0aEdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rNKB143K; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=sXqooMKj; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rNKB143K;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=sXqooMKj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (unknown [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdqtX2582z2y8X
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 01:55:32 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730300117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CMLlcuyrBExBFQ7cARmq4EKvLPPMbZK83A9cofBFpAU=;
	b=rNKB143K8Ctczk3QICRDrjfntQZPdO2TZ1f0bQAU/xyc6baIqN5IkK9Z1iloHVIxUm4eL1
	DTVv8Fa2zQg7+4CZn8EqI2YxizzNT94IXwGJldgfESCpFi6tePC7ZXoOvt4WTbdXbhNgsq
	1sT6qx//LyoEXjk+Aun+OKMoPlBU4KnBmGMKRt4xsjZgQAyu/XFDtMSRHOd40hHQX9Fo2n
	4/W7322h5dgZu3XjP0zpmdf4ZW0uFTLVzALlgwMozRxJJo5igweVCQUhEX2JHXJ6Rz8QLP
	2fsyjfqPZS9d4ZOG8O6oLnV0CtqmcDSqZcWxXIHUaPt9YqxHPn4NTUd8w/mAQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730300117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CMLlcuyrBExBFQ7cARmq4EKvLPPMbZK83A9cofBFpAU=;
	b=sXqooMKj4WSJGhKapgzAlZ6y8k02GuQUsISSgkOq1Val6CrIZxncFkQriu8lZfjdEsOgzR
	Xb0yWorE+ouD/cDA==
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, sudeep.holla@arm.com, peterz@infradead.org,
 mpe@ellerman.id.au, linux-arm-kernel@lists.infradead.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 pierre.gondois@arm.com, dietmar.eggemann@arm.com
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org,
 jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 linuxarm@huawei.com, yangyicong@hisilicon.com, xuwei5@huawei.com,
 guohanjun@huawei.com
Subject: Re: [PATCH v7 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
In-Reply-To: <20241030125415.18994-2-yangyicong@huawei.com>
References: <20241030125415.18994-1-yangyicong@huawei.com>
 <20241030125415.18994-2-yangyicong@huawei.com>
Date: Wed, 30 Oct 2024 15:55:17 +0100
Message-ID: <87ttcty71m.ffs@tglx>
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
Content-Type: text/plain
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RDNS_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 30 2024 at 20:54, Yicong Yang wrote:
>  
> +#ifndef topology_is_primary_thread
> +#define topology_is_primary_thread topology_is_primary_thread

Please do not glue defines and functions together w/o a newline in between.

> +static inline bool topology_is_primary_thread(unsigned int cpu)
> +{
> +	/*
> +	 * On SMT hotplug the primary thread of the SMT won't be disabled.
> +	 * Architectures do have a special primary thread (e.g. x86) need
> +	 * to override this function. Otherwise just make the first thread
> +	 * in the SMT as the primary thread.
> +	 */
> +	return cpu == cpumask_first(topology_sibling_cpumask(cpu));

How is that supposed to work? Assume both siblings are offline, then the
sibling mask is empty and you can't boot the CPU anymore.

Thanks,

        tglx

