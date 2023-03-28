Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6768B6CBE5B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 14:03:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm7c41WQHz3cj1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 23:03:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=m5cCeyYR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm7b72Xtqz3cV7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 23:02:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=m5cCeyYR;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pm7b53gtQz4x1N;
	Tue, 28 Mar 2023 23:02:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680004929;
	bh=8FDe1fg4SUXw3vXWP1S6Odi0LQ6CVYYIgUVbgRZCZ3s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m5cCeyYR2p3PPUbj/yrWGMmlLNwWye53nH07sVfKf3OocZC1+0spJyyrdR0mRUNWS
	 +aylyoKZz8WfJPB6jdCGAD0jMGyOChQ6aPUNeJw5KfvvTNwnvZ7CQ2vJxFpKpfK22P
	 48WYvkdJHQWgLr3DTLNOY25Itdjg+qZJ1QStFw2ekloTI3+aFlVPxK5Ahl1G6X5c8E
	 uS8JqmQk/PO2NGrGrMlT8HyuejUo0LW8lTZb5E1EdpmpCog1gao0Ie4Gt3B9ynqlYz
	 z/3UhKFL+W7A+K4QwIUA18WwAq3ioLcOUFwJfVgGLvha6fEl1kDCfG+rVhPqpH6nzZ
	 cZ6w8g0oydlEA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Subject: Re: [PATCH] arch/powerpc/kvm: kvmppc_core_vcpu_create_hv: check for
 kzalloc failure
In-Reply-To: <ZCLHFw1U4Mq/QK2A@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230323074718.2810914-1-kconsul@linux.vnet.ibm.com>
 <87pm8tcir3.fsf@mpe.ellerman.id.au>
 <ZCK96ohvWRY12zZ3@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <ZCLHFw1U4Mq/QK2A@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Date: Tue, 28 Mar 2023 23:02:09 +1100
Message-ID: <87fs9pcce6.fsf@mpe.ellerman.id.au>
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
> On 2023-03-28 15:44:02, Kautuk Consul wrote:
>> On 2023-03-28 20:44:48, Michael Ellerman wrote:
>> > Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
>> > > kvmppc_vcore_create() might not be able to allocate memory through
>> > > kzalloc. In that case the kvm->arch.online_vcores shouldn't be
>> > > incremented.
>> > 
>> > I agree that looks wrong.
>> > 
>> > Have you tried to test what goes wrong if it fails? It looks like it
>> > will break the LPCR update, which likely will cause the guest to crash
>> > horribly.
> Also, are you referring to the code in kvmppc_update_lpcr()?
> That code will not crash as it checks for the vc before trying to
> dereference it.

Yeah that's what I was looking at. I didn't mean it would crash, but
that it would bail out early when it sees a NULL vcore, leaving other
vcores with the wrong LPCR value.

But as you say it doesn't happen because qemu quits on the first ENOMEM.

And regardless if qemu does something that means the guest is broken
that's just a qemu bug, no big deal as far as the kernel is concerned.

> But the following 2 places that utilize the arch.online_vcores will have
> problems in logic if the usermode test-case doesn't pull down the
> kvm context after the -ENOMEM vcpu allocation failure:
> book3s_hv.c:3030:       if (!kvm->arch.online_vcores) {
> book3s_hv_rm_mmu.c:44:  if (kvm->arch.online_vcores == 1 && local_paca->kvm_hstate.kvm_vcpu)

OK. Both of those look harmless to the host.

If we find a case where a misbehaving qemu can crash the host then we
need to be a bit more careful and treat it at least as a
denial-of-service bug. But looks like this is not one of those.

cheers
