Return-Path: <linuxppc-dev+bounces-2746-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CF19B7BBF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 14:33:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfQ1b73dKz2yPD;
	Fri,  1 Nov 2024 00:33:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730381619;
	cv=none; b=SpEooPgI0w68p8gkrjnkDnFthFPiEEn836gqJBbidbc41XmivUw4DzSfFXlZ1JmLJkML8Bh+doaANkJc+C9yCgjVwm4F/hLETOvvcM69wof8HYga3hZDRgr/DHCiQHcu5ZcLIIFgslqNJmi6Ku21LJB4B19sfgLEjZr7+pOkUgz0rv8rjKRJMwAxjRUMoH7IgSYJvTqU2MbeJmXtLVd9tuqXPzZt8yMfE1/iHQVa3Na84d3pcRjsgty/4EKTfxkUogvjiN9xm0M24ucfb3eTmypQ4zh9SKCRTyy2JJOZugu7OvBGDbmIOjJCQpnqxocuf4ZYAj2WtCiHbukAi0zQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730381619; c=relaxed/relaxed;
	bh=26Hc5JbZE9H+bruksdDbu2UeUsWpWpzQwfy9DOEAULY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lq8/bT/ZoiPUfmlQEj0w0HjP0brAsQqVYcaPNhQlqn/Kol43womvGLM+GQrKYDvtaM2oShw0Kb290Wdj6s015A1IiB5u8CtYSOJvZn+8gMX96oz0gmnkzBwL7PmYxAft/FeZZEgUHs9dlFlaT/9B6dBASqwUUL4BjJRX5Snp1t/1mgYzZ1ySoIgposQYAHwRj3sTAuvB0pJRh+0hSc4LVBvHLomVwlABG21whHHsH5lPovrHSS9CdRONbuBxtvrat5+bO2+h6EBpVxCj8RmpWMFmYZaqH0l5QSX+MOs6llSDjki1kvRDgiZ/xKHPWRz4c0qogyS/xqp1frE5kQaMIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gagkVmBl; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=gv9/SICB; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gagkVmBl;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=gv9/SICB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (unknown [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfQ1Z2CxJz2y8Z
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2024 00:33:37 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730381603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=26Hc5JbZE9H+bruksdDbu2UeUsWpWpzQwfy9DOEAULY=;
	b=gagkVmBl6WnQSFOD69Xb95l+H7UmNHpjjkTYe6X/DWIDEh0GjAMD8+vmk0wUpfeDt8O2X1
	CNA9S2Iv7ftRB/v4mTD6XiFPHvKIRx1ts35Dvt+P9eY67JNkhcFQZ5DXQvtYEg9IvGCpI7
	a/0C2D0B6aFNWSo+gX/VichuLWITHmmbZrqy8LCFk+8dSe7HdrcpAXm07hPpl02NyGVtSB
	yu4cSWIV57zaOxhosEs23HTdt2nPHkGUGxMsIiL4erY0LsD2WVrA5dzHE+DoQWnYDMM9xf
	jq+1iL8avH7blQ39B7u5lOKChCBlbLUiNGUdImnUWh45ZCEF9bHLP9Go+o2+Rg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730381603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=26Hc5JbZE9H+bruksdDbu2UeUsWpWpzQwfy9DOEAULY=;
	b=gv9/SICB709Be4Ze+KmpFVPyPGNclfHrUo9edWFPCMcONde8dWy5Dl1l4sJaeLKcfstvyH
	5+/U5qFxfh6KU+Cg==
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, sudeep.holla@arm.com, peterz@infradead.org,
 mpe@ellerman.id.au, linux-arm-kernel@lists.infradead.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 pierre.gondois@arm.com, dietmar.eggemann@arm.com
Cc: yangyicong@hisilicon.com, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org,
 jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 linuxarm@huawei.com, xuwei5@huawei.com, guohanjun@huawei.com
Subject: Re: [PATCH v7 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
In-Reply-To: <488d8289-b538-01cb-5de7-d691f49c0d7b@huawei.com>
References: <20241030125415.18994-1-yangyicong@huawei.com>
 <20241030125415.18994-2-yangyicong@huawei.com> <87ttcty71m.ffs@tglx>
 <488d8289-b538-01cb-5de7-d691f49c0d7b@huawei.com>
Date: Thu, 31 Oct 2024 14:33:23 +0100
Message-ID: <87frocwg64.ffs@tglx>
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

On Thu, Oct 31 2024 at 20:17, Yicong Yang wrote:
> On 2024/10/30 22:55, Thomas Gleixner wrote:
>>> +static inline bool topology_is_primary_thread(unsigned int cpu)
>>> +{
>>> +	/*
>>> +	 * On SMT hotplug the primary thread of the SMT won't be disabled.
>>> +	 * Architectures do have a special primary thread (e.g. x86) need
>>> +	 * to override this function. Otherwise just make the first thread
>>> +	 * in the SMT as the primary thread.
>>> +	 */
>>> +	return cpu == cpumask_first(topology_sibling_cpumask(cpu));
>> 
>> How is that supposed to work? Assume both siblings are offline, then the
>> sibling mask is empty and you can't boot the CPU anymore.
>> 
>
> For architectures' using arch_topology, topology_sibling_cpumask() will at least
> contain the tested CPU itself. This is initialized in
> drivers/base/arch_topology.c:reset_cpu_topology(). So it won't be
> empty here.

Fair enough. Can you please expand the comment and say:

     The sibling cpumask of a offline CPU contains always the CPU
     itself.

> Besides we don't need to check topology_is_primary_thread() at boot time:
> -> cpu_up(cpu)
>      cpu_bootable()
>        if (cpu_smt_control == CPU_SMT_ENABLED &&
>            cpu_smt_thread_allowed(cpu)) // will always return true if !CONFIG_SMT_NUM_THREADS_DYNAMIC
>          return true; // we'll always return here and @cpu is always bootable

cpu_smt_control is not guaranteed to have CPU_SMT_ENABLED state, so this
argument is bogus.

> Also tested fine in practice.

I've heard that song before.

What matters is not what you tested. What matters is whether the code is
correct _and_ understandable.

Thanks,

        tglx

