Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B08578B83C5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 02:38:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jt/Q3cVC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTdTx2Gkzz3d9G
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 10:38:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jt/Q3cVC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.187; helo=out-187.mta1.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 557 seconds by postgrey-1.37 at boromir; Wed, 01 May 2024 10:38:05 AEST
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTdT92S12z3cTg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 10:38:05 +1000 (AEST)
Date: Wed, 1 May 2024 00:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1714523303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ioXgnZIoOxV6Gom6pZgkz9FqddFwrAkScDhYF7eexw0=;
	b=jt/Q3cVCB5txoE/zQITpY+KTWb0keYgIpc0qkzhVQFsJAZZR5RjRVVdyLf1AD37xVVVKy5
	AjuiDAvL2nLBEHIqEzLFqT7OazbzMr6NRwDmnhYgDnVnteqZKpKfa3eZfPYr7Wncyk+0Tk
	iJCFdMrcVNqaWoqklmPV1Wqci3CPJlw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 0/4] KVM: Fold kvm_arch_sched_in() into
 kvm_arch_vcpu_load()
Message-ID: <ZjGMn5tlq8edKZYv@linux.dev>
References: <20240430193157.419425-1-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430193157.419425-1-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 30, 2024 at 12:31:53PM -0700, Sean Christopherson wrote:
> Drop kvm_arch_sched_in() and instead pass a @sched_in boolean to
> kvm_arch_vcpu_load().
> 
> While fiddling with an idea for optimizing state management on AMD CPUs,
> I wanted to skip re-saving certain host state when a vCPU is scheduled back
> in, as the state (theoretically) shouldn't change for the task while it's
> scheduled out.  Actually doing that was annoying and unnecessarily brittle
> due to having a separate API for the kvm_sched_in() case (the state save
> needed to be in kvm_arch_vcpu_load() for the common path).
> 
> E.g. I could have set a "temporary"-ish flag somewhere in kvm_vcpu, but (a)
> that's gross and (b) it would rely on the arbitrary ordering between
> sched_in() and vcpu_load() staying the same.

Another option would be to change the rules around kvm_arch_sched_in()
where the callee is expected to load the vCPU context.

The default implementation could just call kvm_arch_vcpu_load() directly
and the x86 implementation can order things the way it wants before
kvm_arch_vcpu_load().

I say this because ...

> The only real downside I see is that arm64 and riscv end up having to pass
> "false" for their direct usage of kvm_arch_vcpu_load(), and passing boolean
> literals isn't ideal.  But that can be solved by adding an inner helper that
> omits the @sched_in param (I almost added a patch to do that, but I couldn't
> convince myself it was necessary).

Needing to pass @sched_in for other usage of kvm_arch_vcpu_load() hurts
readability, especially when no other architecture besides x86 cares
about it.

-- 
Thanks,
Oliver
