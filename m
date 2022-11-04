Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE08E619565
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 12:33:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3dly1C62z3dv5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 22:33:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hLh+Fyy5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=yuan.yao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hLh+Fyy5;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3TtR5QFtz3cBf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 16:38:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667540288; x=1699076288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EgmtsBqJVK3JbLONjG56zRgFCzcOwywt2/xTnCkOP1Y=;
  b=hLh+Fyy5dQkcPzZBdGKcSO0JA5NUgJeCa/p6qkrHHt9ZoDv/irrt/BWn
   E43ERVl7CjY9/v2/oSRA7Fp3r+q5lP+YnVtgXdWLSMAyvtPRmpjlt20lM
   HtG5GiVSemLnx0d1uF9yx41WZuLFPHb31hpcx14hTiFz8gnCudfJTS1XN
   0HqRgV1Kc/Z3Vhf6CWg1wfzd/YDwgoC4gDjrNSUJpb61MhsmTtqdePzW1
   kdDIc/ST/XB3uok5+eDmMx2jf/u/x1r4+I0UdBXmHt4hbv34FXzDNb/NC
   HhefkukFEKWMA7Ke90y1Zc6VlJTvrdArD18Th3LpanNt+fPPQfo2Ci7XS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="396185948"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="396185948"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 22:37:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="666249074"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="666249074"
Received: from yy-desk-7060.sh.intel.com (HELO localhost) ([10.239.159.76])
  by orsmga008.jf.intel.com with ESMTP; 03 Nov 2022 22:37:46 -0700
Date: Fri, 4 Nov 2022 13:37:45 +0800
From: Yuan Yao <yuan.yao@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 03/44] KVM: Allocate cpus_hardware_enabled after arch
 hardware setup
Message-ID: <20221104053745.qvi35kflf2i2ifgs@yy-desk-7060>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-4-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102231911.3107438-4-seanjc@google.com>
User-Agent: NeoMutt/20171215
X-Mailman-Approved-At: Fri, 04 Nov 2022 22:32:15 +1100
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, 
 linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 02, 2022 at 11:18:30PM +0000, Sean Christopherson wrote:
> Allocate cpus_hardware_enabled after arch hardware setup so that arch
> "init" and "hardware setup" are called back-to-back and thus can be
> combined in a future patch.  cpus_hardware_enabled is never used before
> kvm_create_vm(), i.e. doesn't have a dependency with hardware setup and
> only needs to be allocated before /dev/kvm is exposed to userspace.
>
> Free the object before the arch hooks are invoked to maintain symmetry,
> and so that arch code can move away from the hooks without having to
> worry about ordering changes.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/kvm_main.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index e0424af52acc..8b7534cc953b 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5843,15 +5843,15 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>  	if (r)
>  		return r;
>
> +	r = kvm_arch_hardware_setup(opaque);
> +	if (r < 0)
> +		goto err_hw_setup;
> +
>  	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL)) {
>  		r = -ENOMEM;
>  		goto err_hw_enabled;
>  	}
>
> -	r = kvm_arch_hardware_setup(opaque);
> -	if (r < 0)
> -		goto out_free_1;
> -
>  	c.ret = &r;
>  	c.opaque = opaque;
>  	for_each_online_cpu(cpu) {
> @@ -5937,10 +5937,10 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>  	unregister_reboot_notifier(&kvm_reboot_notifier);
>  	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
>  out_free_2:
> -	kvm_arch_hardware_unsetup();
> -out_free_1:
>  	free_cpumask_var(cpus_hardware_enabled);
>  err_hw_enabled:
> +	kvm_arch_hardware_unsetup();
> +err_hw_setup:
>  	kvm_arch_exit();
>  	return r;
>  }
> @@ -5967,9 +5967,9 @@ void kvm_exit(void)
>  	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
>  	on_each_cpu(hardware_disable_nolock, NULL, 1);
>  	kvm_irqfd_exit();
> +	free_cpumask_var(cpus_hardware_enabled);
>  	kvm_arch_hardware_unsetup();
>  	kvm_arch_exit();
> -	free_cpumask_var(cpus_hardware_enabled);
>  	kvm_vfio_ops_exit();

Looks good to me.

Reviewed-by: Yuan Yao <yuan.yao@intel.com>

>  }
>  EXPORT_SYMBOL_GPL(kvm_exit);
> --
> 2.38.1.431.g37b22c650d-goog
>
