Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 110AF72FE84
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 14:26:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VDJHBwbn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qh4Qf6qnnz30gQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 22:26:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VDJHBwbn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::38; helo=out-56.mta0.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 76 seconds by postgrey-1.37 at boromir; Wed, 14 Jun 2023 22:25:13 AEST
Received: from out-56.mta0.migadu.com (out-56.mta0.migadu.com [IPv6:2001:41d0:1004:224b::38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qh4Pj2qwPz30PZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 22:25:12 +1000 (AEST)
Date: Wed, 14 Jun 2023 12:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1686745418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wQb4z5JVMfEidGknQD3xscf32z72ie53CeaTZ4MqnRo=;
	b=VDJHBwbnWvVpVV2I5wdZ1dSmkV4OW6DcXGB7WkRvbQbH6ER5gTv95Aul+DGOp3MA8pjOAX
	0zLmfb5AUIxalCYMg97MGheRtghN8tPVWj5eSM3htLfyZm7zxBgdLPibhTnINAzEYZORpr
	wAQ4FhHqgISs2x21TFI+MTTB8WH2WY8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH RESEND v2] KVM: move KVM_CAP_DEVICE_CTRL to the generic
 check
Message-ID: <ZImxRC3QlLbPhwsC@linux.dev>
References: <20230315101606.10636-1-wei.w.wang@intel.com>
 <ZIjcoOaexz5YAyWT@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIjcoOaexz5YAyWT@google.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Wei Wang <wei.w.wang@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, pbonzini@redhat.com, linux-riscv@lists.infradead.org, Christian Borntraeger <borntraeger@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 13, 2023 at 02:16:16PM -0700, Sean Christopherson wrote:
> +<everyone else>
> 
> Please use scripts/get_maintainer.pl to generate the To/Cc lists.  This may be
> trivial, but it still needs eyeballs from the relevant maintainers.

+1000. I'd buy someone a beer if they made a bot that just ran
get_maintainer on patches that hit the list :)

> On Wed, Mar 15, 2023, Wei Wang wrote:
> > KVM_CAP_DEVICE_CTRL allows userspace to check if the kvm_device
> > framework (e.g. KVM_CREATE_DEVICE) is supported by KVM. Move
> > KVM_CAP_DEVICE_CTRL to the generic check for the two reasons:
> > 1) it already supports arch agnostic usages (i.e. KVM_DEV_TYPE_VFIO).
> > For example, userspace VFIO implementation may needs to create
> > KVM_DEV_TYPE_VFIO on x86, riscv, or arm etc. It is simpler to have it
> > checked at the generic code than at each arch's code.
> > 2) KVM_CREATE_DEVICE has been added to the generic code.
> > 
> > Link: https://lore.kernel.org/all/20221215115207.14784-1-wei.w.wang@intel.com
> > Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> > Reviewed-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/arm64/kvm/arm.c       | 1 -
> >  arch/powerpc/kvm/powerpc.c | 1 -
> >  arch/riscv/kvm/vm.c        | 1 -
> >  arch/s390/kvm/kvm-s390.c   | 1 -
> >  virt/kvm/kvm_main.c        | 1 +
> >  5 files changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 3bd732eaf087..96329e675771 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -202,7 +202,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> >  		r = vgic_present;
> >  		break;
> >  	case KVM_CAP_IOEVENTFD:
> > -	case KVM_CAP_DEVICE_CTRL:
> >  	case KVM_CAP_USER_MEMORY:
> >  	case KVM_CAP_SYNC_MMU:
> >  	case KVM_CAP_DESTROY_MEMORY_REGION_WORKS:

for arm64:

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver
