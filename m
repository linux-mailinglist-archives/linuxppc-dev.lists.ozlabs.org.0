Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 187AA72AE98
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 22:18:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qdq545wy5z3f5y
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jun 2023 06:18:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZJPuUMqP;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qeRl1VvS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZJPuUMqP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qeRl1VvS;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qdq4G116Fz3cLX
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jun 2023 06:17:18 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1686427785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VN3pKad915lgXyIEKLmAqU9HFdxhV2U8JR5HtaJJWAo=;
	b=ZJPuUMqPysjPBQOtwRD8hr8P3yWoBfFxIFRfQbmUhqrHISkVZgbVnK1l0yUcMF13n0ef88
	A2mJqnviZJYpqgkQxY2B/Iddyx7txFX0h7NoqsWvq/aS5ZDorHIECmwNtSrRXy99v55CFX
	vZk43IJuf1X9d6CQLl075CFuu5/Oys6EwYSawzk0iZamSVUjy9LANvOHsSKUag4l5ZR9nR
	Q3HlMi8k3dy1cxqrx9MNhyByLxphQeKZcd+bAxaElUyTvpVkQJS4oaIFSPIPWBwG7gb0HL
	AChWt/fe3Tma07iCZKUYsldPKXecOY2zpmpzjEFW0m1Ll51NyD0YY7gKE/Zb1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1686427785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VN3pKad915lgXyIEKLmAqU9HFdxhV2U8JR5HtaJJWAo=;
	b=qeRl1VvSqXcJA/dkR81UjTvbzFNl35KrBMfEEJ9dLP6GgKhRJYWyergbo9UAvaIL3/t4PF
	efaD08GmnCbVq0CA==
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] cpu/SMT: Allow enabling partial SMT states via sysfs
In-Reply-To: <20230524155630.794584-6-mpe@ellerman.id.au>
References: <20230524155630.794584-1-mpe@ellerman.id.au>
 <20230524155630.794584-6-mpe@ellerman.id.au>
Date: Sat, 10 Jun 2023 22:09:44 +0200
Message-ID: <87r0qj84fr.ffs@tglx>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, dave.hansen@linux.intel.com, mingo@redhat.com, bp@alien8.de, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 25 2023 at 01:56, Michael Ellerman wrote:
> There is a hook which allows arch code to control how many threads per

Can you please write out architecture in changelogs and comments?

I know 'arch' is commonly used but while my brain parser tolerates
'arch_' prefixes it raises an exception on 'arch' in prose as 'arch' is
a regular word with a completely different meaning. Changelogs and
comments are not space constraint.

> @@ -2505,20 +2505,38 @@ __store_smt_control(struct device *dev, struct device_attribute *attr,
>  	if (cpu_smt_control == CPU_SMT_NOT_SUPPORTED)
>  		return -ENODEV;
>  
> -	if (sysfs_streq(buf, "on"))
> +	if (sysfs_streq(buf, "on")) {
>  		ctrlval = CPU_SMT_ENABLED;
> -	else if (sysfs_streq(buf, "off"))
> +		num_threads = cpu_smt_max_threads;
> +	} else if (sysfs_streq(buf, "off")) {
>  		ctrlval = CPU_SMT_DISABLED;
> -	else if (sysfs_streq(buf, "forceoff"))
> +		num_threads = 1;
> +	} else if (sysfs_streq(buf, "forceoff")) {
>  		ctrlval = CPU_SMT_FORCE_DISABLED;
> -	else
> +		num_threads = 1;
> +	} else if (kstrtoint(buf, 10, &num_threads) == 0) {
> +		if (num_threads == 1)
> +			ctrlval = CPU_SMT_DISABLED;
> +		else if (num_threads > 1 && topology_smt_threads_supported(num_threads))
> +			ctrlval = CPU_SMT_ENABLED;
> +		else
> +			return -EINVAL;
> +	} else {
>  		return -EINVAL;
> +	}
>  
>  	ret = lock_device_hotplug_sysfs();
>  	if (ret)
>  		return ret;
>  
> -	if (ctrlval != cpu_smt_control) {
> +	orig_threads = cpu_smt_num_threads;
> +	cpu_smt_num_threads = num_threads;
> +
> +	if (num_threads > orig_threads) {
> +		ret = cpuhp_smt_enable();
> +	} else if (num_threads < orig_threads) {
> +		ret = cpuhp_smt_disable(ctrlval);
> +	} else if (ctrlval != cpu_smt_control) {
>  		switch (ctrlval) {
>  		case CPU_SMT_ENABLED:
>  			ret = cpuhp_smt_enable();

This switch case does not make sense anymore.

The only situation which reaches this is when the control value goes
from CPU_SMT_DISABLED to CPU_SMT_FORCE_DISABLED because that's not
changing the number of threads.

So something like this is completely sufficient:

	if (num_threads > orig_threads)
		ret = cpuhp_smt_enable();
        else if (num_threads < orig_threads || ctrval == CPU_SMT_FORCE_DISABLED)
		ret = cpuhp_smt_disable(ctrlval);

No?

Thanks,

        tglx
