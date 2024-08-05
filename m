Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5169D94766F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 09:58:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UBQwR8Dv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wcphf1zBtz3cYb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 17:58:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UBQwR8Dv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wcpgz0QwZz3bnt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2024 17:57:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 74B89CE0018;
	Mon,  5 Aug 2024 07:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59266C32782;
	Mon,  5 Aug 2024 07:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722844650;
	bh=Geket5xHj+rV/lTGgYhI+mobx7QxgrRmSJGYSEDRkpk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UBQwR8Dv5k7JtkeG4laWC2Xs0oOnozRLy+3hVYnDYQn2Ed5eCrDNKiqSjdoXT4acx
	 1hPdTL4JDstUhQJJ7lCM7YYqnV4Qh1m6C+CK460q8siGoQwJJKzkWsjMOX4qcfmelz
	 A6Yt57Xlk92ABmDDhigDShW3vM0pnXKBZJdZWOrnwttmRyqlw3hP4oeUm/b5LanIcX
	 fVlLRwpf9c9nuW6b7SobjiC6lu0VN8iuGUvVZHCooHxsAnFt7ePn4zwuEV1kg+BLX4
	 tQQRPbEFjC/HMt7oQ6FPHcOxgz1D3ofgxyEIT69W/KjqEASCYIB1LwhYcesfg0NZf1
	 asOwN60f4YLIQ==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest
 memory while KVM is dirty logging
In-Reply-To: <ZqvNekQAjs-SN-se@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-3-seanjc@google.com> <yq5aikwku25o.fsf@kernel.org>
 <ZqvNekQAjs-SN-se@google.com>
Date: Mon, 05 Aug 2024 13:27:18 +0530
Message-ID: <yq5a5xsftna9.fsf@kernel.org>
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:

> On Thu, Aug 01, 2024, Aneesh Kumar K.V wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>> 
>> > Disallow copying MTE tags to guest memory while KVM is dirty logging, as
>> > writing guest memory without marking the gfn as dirty in the memslot could
>> > result in userspace failing to migrate the updated page.  Ideally (maybe?),
>> > KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
>> > and presumably the only use case for copy MTE tags _to_ the guest is when
>> > restoring state on the target.
>> >
>> > Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
>> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>> > ---
>> >  arch/arm64/kvm/guest.c | 5 +++++
>> >  1 file changed, 5 insertions(+)
>> >
>> > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
>> > index e1f0ff08836a..962f985977c2 100644
>> > --- a/arch/arm64/kvm/guest.c
>> > +++ b/arch/arm64/kvm/guest.c
>> > @@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>> >  
>> >  	mutex_lock(&kvm->slots_lock);
>> >  
>> > +	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
>> > +		ret = -EBUSY;
>> > +		goto out;
>> > +	}
>> > +
>> >
>> 
>> is this equivalent to kvm_follow_pfn() with kfp->pin = 1 ?
>
> No, gfn_to_pfn_prot() == FOLL_GET, kfp->pin == FOLL_PIN.  But that's not really
> relevant.
>


What I meant was, should we consider mte_copy_tags_from_user() as one
that update the page contents (even though it is updating tags) and
use kvm_follow_pfn() with kfp->pin = 1 instead?

Is my understanding correct in that, if we want to look up a pfn/page
from gfn with the intent of updating the page contents, we should use
kfp->pin == 1? 

-aneesh
