Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 86E718CC40F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 17:26:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MR8HfGt/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vkw0M31cVz78gv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 01:17:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MR8HfGt/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.175; helo=out-175.mta1.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org)
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VkvzZ3M4kz3g8v
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 01:16:58 +1000 (AEST)
X-Envelope-To: seanjc@google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1716390977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qPx5VBeAtVusPub5h8jjoS2Zp/k7LiSDo3T23EUz3Cc=;
	b=MR8HfGt/7NWj1OeZKFuwxnVF9+ndS7xCoaOY+r1JI2bWBzf2MynLiEMDjC1DrcozAH8hei
	TUnFiYL5Pyj+E10/+shwWi4h/9LVvu0Mc6mkr1yRH6n++3msAFiuDQVzo86zkrGkaVb0hH
	6NbyKC1AGLafKPP8z0hv7d6a9IuqBaQ=
X-Envelope-To: maz@kernel.org
X-Envelope-To: zhaotianrui@loongson.cn
X-Envelope-To: maobibo@loongson.cn
X-Envelope-To: chenhuacai@kernel.org
X-Envelope-To: mpe@ellerman.id.au
X-Envelope-To: anup@brainfault.org
X-Envelope-To: paul.walmsley@sifive.com
X-Envelope-To: palmer@dabbelt.com
X-Envelope-To: aou@eecs.berkeley.edu
X-Envelope-To: borntraeger@linux.ibm.com
X-Envelope-To: frankja@linux.ibm.com
X-Envelope-To: imbrenda@linux.ibm.com
X-Envelope-To: pbonzini@redhat.com
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: kvmarm@lists.linux.dev
X-Envelope-To: kvm@vger.kernel.org
X-Envelope-To: loongarch@lists.linux.dev
X-Envelope-To: linux-mips@vger.kernel.org
X-Envelope-To: linuxppc-dev@lists.ozlabs.org
X-Envelope-To: kvm-riscv@lists.infradead.org
X-Envelope-To: linux-riscv@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
Date: Wed, 22 May 2024 08:16:07 -0700
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v2 1/6] KVM: Add a flag to track if a loaded vCPU is
 scheduled out
Message-ID: <Zk4MN49212SaW1_z@linux.dev>
References: <20240522014013.1672962-1-seanjc@google.com>
 <20240522014013.1672962-2-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522014013.1672962-2-seanjc@google.com>
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

On Tue, May 21, 2024 at 06:40:08PM -0700, Sean Christopherson wrote:
> Add a kvm_vcpu.scheduled_out flag to track if a vCPU is in the process of
> being scheduled out (vCPU put path), or if the vCPU is being reloaded
> after being scheduled out (vCPU load path).  In the short term, this will
> allow dropping kvm_arch_sched_in(), as arch code can query scheduled_out
> during kvm_arch_vcpu_load().
> 
> Longer term, scheduled_out opens up other potential optimizations, without
> creating subtle/brittle dependencies.  E.g. it allows KVM to keep guest
> state (that is managed via kvm_arch_vcpu_{load,put}()) loaded across
> kvm_sched_{out,in}(), if KVM knows the state isn't accessed by the host
> kernel.  Forcing arch code to coordinate between kvm_arch_sched_{in,out}()
> and kvm_arch_vcpu_{load,put}() is awkward, not reusable, and relies on the
> exact ordering of calls into arch code.
> 
> Adding scheduled_out also obviates the need for a kvm_arch_sched_out()
> hook, e.g. if arch code needs to do something novel when putting vCPU
> state.
> 
> And even if KVM never uses scheduled_out for anything beyond dropping
> kvm_arch_sched_in(), just being able to remove all of the arch stubs makes
> it worth adding the flag.
> 
> Link: https://lore.kernel.org/all/20240430224431.490139-1-seanjc@google.com
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver
