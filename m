Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D140474F72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 01:46:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDGlk3R4Gz3cQp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 11:46:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDGk407D5z2x9F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 11:45:16 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JDGk34nMwz4xhm;
 Wed, 15 Dec 2021 11:45:15 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Sean Christopherson <seanjc@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20211213174556.3871157-1-seanjc@google.com>
References: <20211213174556.3871157-1-seanjc@google.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV P9: Use kvm_arch_vcpu_get_wait() to
 get rcuwait object
Message-Id: <163952881459.928111.11067384310708851429.b4-ty@ellerman.id.au>
Date: Wed, 15 Dec 2021 11:40:14 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Dec 2021 17:45:56 +0000, Sean Christopherson wrote:
> Use kvm_arch_vcpu_get_wait() to get a vCPU's rcuwait object instead of
> using vcpu->wait directly in kvmhv_run_single_vcpu().  Functionally, this
> is a nop as vcpu->arch.waitp is guaranteed to point at vcpu->wait.  But
> that is not obvious at first glance, and a future change coming in via
> the KVM tree, commit 510958e99721 ("KVM: Force PPC to define its own
> rcuwait object"), will hide vcpu->wait from architectures that define
> __KVM_HAVE_ARCH_WQP to prevent generic KVM from attepting to wake a vCPU
> with the wrong rcuwait object.
> 
> [...]

Applied to powerpc/next.

[1/1] KVM: PPC: Book3S HV P9: Use kvm_arch_vcpu_get_wait() to get rcuwait object
      https://git.kernel.org/powerpc/c/63fa47ba886b86cbd58f03b3b01b04bd57a1f233

cheers
