Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A530172EB48
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 20:55:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YozCldYN;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=l6BZB5sr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qgd5t3b9Dz30fF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 04:54:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YozCldYN;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=l6BZB5sr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 94753 seconds by postgrey-1.37 at boromir; Wed, 14 Jun 2023 04:54:09 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qgd4x1Hhlz30LQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 04:54:09 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1686682437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cdtlI8O+BR0qXbj58jg6FvKGaw0Wgflhz7GcVSQmqTs=;
	b=YozCldYNSkvTr+p9N13aPfwrZCetTLmVfUgIMbRgkvTdFFB+KsP7Bc/nFSb3Aypyiv3CtJ
	HiuQX/BkK7i+txHUJVO80Cn39d+oKpyNlYvhUF6GtTt/iEmIeLnL4hHBqe9qfjvYA8icZW
	JNHNPfIj64QFoIrIGtcCm13NRVIint6VhQQnicYv56ihWKYgciJBCzhZPAkHZaFFBXXc1A
	8607gVBbh+RzZYZJD+9BxOzRVoHJ/rUVtqyFpu3qlIjx34p5HeSyUYw2Z62Fs7yM4TdSfE
	uLF4gJ6HFLP7AbKgTVN3BrFWVDHbfFUnF1+bUBT4A5G674zBIhW963/HDlYDgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1686682437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cdtlI8O+BR0qXbj58jg6FvKGaw0Wgflhz7GcVSQmqTs=;
	b=l6BZB5sr7NAcDi+r4y/BXgbOdgHhlHQ9Vb1NshrItcfbmq+cZw4PchfvnAucey7KgaZUrI
	PGUXnPawzxE9tdAg==
To: Laurent Dufour <ldufour@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] cpu/SMT: Store the current/max number of threads
In-Reply-To: <d42e9452-8210-a06a-4c91-6c2f1d038a61@linux.ibm.com>
References: <20230524155630.794584-1-mpe@ellerman.id.au>
 <20230524155630.794584-3-mpe@ellerman.id.au> <87fs6z80w5.ffs@tglx>
 <d42e9452-8210-a06a-4c91-6c2f1d038a61@linux.ibm.com>
Date: Tue, 13 Jun 2023 20:53:56 +0200
Message-ID: <87sfav5h2z.ffs@tglx>
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com, bp@alien8.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 13 2023 at 19:16, Laurent Dufour wrote:
> On 10/06/2023 23:26:18, Thomas Gleixner wrote:
>> On Thu, May 25 2023 at 01:56, Michael Ellerman wrote:
>>>  #ifdef CONFIG_HOTPLUG_SMT
>>>  enum cpuhp_smt_control cpu_smt_control __read_mostly = CPU_SMT_ENABLED;
>>> +static unsigned int cpu_smt_max_threads __ro_after_init;
>>> +unsigned int cpu_smt_num_threads;
>> 
>> Why needs this to be global? cpu_smt_control is pointlessly global already.
>
> I agree that cpu_smt_*_threads should be static.
>
> Howwever, regarding cpu_smt_control, it is used in 2 places in the x86 code:
>  - arch/x86/power/hibernate.c in arch_resume_nosmt()
>  - arch/x86/kernel/cpu/bugs.c in spectre_v2_user_select_mitigation()

Bah. I must have fatfingered the grep then.

> An accessor function may be introduced to read that value in these 2
> functions, but I'm wondering if that's really the best option.
>
> Unless there is a real need to change this through this series, I think
> cpu_smt_control can remain global.

That's fine.

Thanks,

        tglx
