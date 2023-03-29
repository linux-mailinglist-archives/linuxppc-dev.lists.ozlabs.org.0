Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C826CF7E2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 02:00:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pn3T12wzpz2xBV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 11:00:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=in9Yqqkl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pn3S910hRz3c6R
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 10:59:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=in9Yqqkl;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pn3S816GNz4xDn;
	Thu, 30 Mar 2023 10:59:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680134360;
	bh=QjU/3+HiBzvoD78RQQNgOACB6ehBJw/P/6iRJxUBDyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=in9YqqklVEuhZ4RAJvrGnZpVvzZKa0iFvTasr4dGVU11K1xIULrTEsOjqio4zrxBq
	 0abG6VEPkZ0qDCtyUZeOyJcz/LbuD0tZ7aNNY1PhwmPslm/ozPoel60SBWi7eFbsM0
	 wVAkpDhQZMzB/OoMdLXqRX6CLwyi+CvndbdWepQWLnhftOtUw9Qw0dH2YSOHtAkVzq
	 tfIhsBnGCrq/Rfr0BpNQow712QXrXMSiV8YtjtiL2pP8LlC0R/u5P+t//P7Dbceelv
	 GnSiNYwQYjSgpyQANKqMkT3zd/GZx6ekk+jPbZYCywnApYpfqrxqMtg+wBcxchl16x
	 Nd9uj5uptR/WQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Subject: Re: [PATCH] arch/powerpc/kvm: kvmppc_core_vcpu_create_hv: check for
 kzalloc failure
In-Reply-To: <ZCLe2Jf0n6GR9Qhw@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230323074718.2810914-1-kconsul@linux.vnet.ibm.com>
 <87pm8tcir3.fsf@mpe.ellerman.id.au>
 <ZCK96ohvWRY12zZ3@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <ZCLHFw1U4Mq/QK2A@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <87fs9pcce6.fsf@mpe.ellerman.id.au>
 <ZCLe2Jf0n6GR9Qhw@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Date: Thu, 30 Mar 2023 10:59:19 +1100
Message-ID: <87tty3az3c.fsf@mpe.ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> On 2023-03-28 23:02:09, Michael Ellerman wrote:
>> Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
>> > On 2023-03-28 15:44:02, Kautuk Consul wrote:
>> >> On 2023-03-28 20:44:48, Michael Ellerman wrote:
>> >> > Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
>> >> > > kvmppc_vcore_create() might not be able to allocate memory through
>> >> > > kzalloc. In that case the kvm->arch.online_vcores shouldn't be
>> >> > > incremented.
>> >> > 
>> >> > I agree that looks wrong.
>> >> > 
>> >> > Have you tried to test what goes wrong if it fails? It looks like it
>> >> > will break the LPCR update, which likely will cause the guest to crash
>> >> > horribly.
>> > Also, are you referring to the code in kvmppc_update_lpcr()?
>> > That code will not crash as it checks for the vc before trying to
>> > dereference it.
>> 
>> Yeah that's what I was looking at. I didn't mean it would crash, but
>> that it would bail out early when it sees a NULL vcore, leaving other
>> vcores with the wrong LPCR value.
>> 
>> But as you say it doesn't happen because qemu quits on the first ENOMEM.
>> 
>> And regardless if qemu does something that means the guest is broken
>> that's just a qemu bug, no big deal as far as the kernel is concerned.

> But there could be another user-mode application other than qemu that
> actually tries to create a vcpu after it gets a -ENOMEM for another
> vcpu. Shouldn't the kernel be independent of qemu?

Yes, the kernel is independent of qemu.

On P8 we had kvmtool, and there's several other VMMs these days, though
most don't support Power.

I didn't mean qemu specifically above. If any VMM continues blindly
after getting ENOMEM back from the KVM API then that's a bug in that
VMM.

>> > But the following 2 places that utilize the arch.online_vcores will have
>> > problems in logic if the usermode test-case doesn't pull down the
>> > kvm context after the -ENOMEM vcpu allocation failure:
>> > book3s_hv.c:3030:       if (!kvm->arch.online_vcores) {
>> > book3s_hv_rm_mmu.c:44:  if (kvm->arch.online_vcores == 1 && local_paca->kvm_hstate.kvm_vcpu)
>> 
>> OK. Both of those look harmless to the host.

> Harmless to the host in terms of a crash, not in terms of behavior.
> For example in the case of kvmhv_set_smt_mode:
> If we got a kzalloc failure once (and online_vcores was wrongly incremented), 
> then if kvmhv_set_smt_mode() is called after that then it would be
> not be setting the arch.smt_mode and arch.emul_smt_mode correctly and it
> would be wrongly returning with -EBUSY instead of 0.

But again that bug only affects that VM, which the VMM should have
terminated when it got the ENOMEM back.

It's definitely a bug that we increment online_vcores incorrectly, but
it only affects that VM, and a correctly operating VMM will terminate
the VM anyway because of the ENOMEM.

cheers
