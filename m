Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECBE72599A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 11:09:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbhP90534z3dy7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 19:09:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fz5R9Os5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fz5R9Os5;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbhNM1txqz300C
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 19:08:50 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b0314f057cso37161395ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 02:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686128928; x=1688720928;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7zdMICOOfXCMagTI3X9zTXWZ0bDy7cb5wAVqax4nXo=;
        b=fz5R9Os5W2YAM1xaOxzO3LKuXeh3EizcUiXRZKufgYFnaxI/St+Eg3ZzhOQNOkItdW
         ueeufDQmUxRJgYF+Pm+mPeYN+3mj4tsAaHwR3ue4egFLGtxJP6iAIL9W2U5qeOyLg0vE
         7V+OyFERqS5OK7COsRQX9iIxdsBdBd18BGmo1/wBA8rQtlW4tEGTT4I9/vVvzG5OPT5x
         FpSdTRnXKS8cGQzM0WEKBijY6+albls3h0AuJWX2UtABma27r+5+y7VhrUTBeRctUFAf
         ynHx6RkT8qRG8zwZFcdnsog6EXrrodC6DW1zSaZx2ZUuBWQXy5C7M01P6BjJ6S0sWaLw
         UB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128928; x=1688720928;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h7zdMICOOfXCMagTI3X9zTXWZ0bDy7cb5wAVqax4nXo=;
        b=UZP11Z7JyE1m+h7SQ/YHKdv1fa7kH4Shs5nfNHUoZJ3zaq+viMzDx3nKIOrdSzYLBB
         KSypFvp20lOaYLvo4D+IXBcVPu7HO/P5PZkU9YTPyl74RJBzc7gWWiQ9gZalNST+qP/N
         Lee6QNNae+XH3bPAJ7BkogB7MeB+vIJd0oL+yCmjZ4htqFbnEgeXudKJP+PvDfNMJIcH
         LaHuQ3DoegefCN4zmrTIRpmh07FoND1eJiOlsGbQ8DCJG2huXk0xDCD1uue0Hmn/dVFG
         x9VlsduYXtkHpcyF2D32udi5FyeslgsdfdLTUcYj4I2ialSPUhNHU4+u9JShUXP3b7JE
         irmQ==
X-Gm-Message-State: AC+VfDw6QbHkkYc6LtNiUDhCgo37+1o8f7RR4kaYdb4USlCnQatvMtVP
	OwcnTxj0k+oFOCLZkA58d0k=
X-Google-Smtp-Source: ACHHUZ6JgFxx+wi/jgTYI3jaqO5bvm6eTxnvR5CVmefpcjcfIkrAvEAw0p15C3rnM8+zUnfHM0jKpw==
X-Received: by 2002:a05:6a21:9182:b0:10f:759d:c5b2 with SMTP id tp2-20020a056a21918200b0010f759dc5b2mr739557pzb.45.1686128928064;
        Wed, 07 Jun 2023 02:08:48 -0700 (PDT)
Received: from localhost (58-6-224-112.tpgi.com.au. [58.6.224.112])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902860b00b001b045c9abd2sm9904994plo.143.2023.06.07.02.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 02:08:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jun 2023 19:08:40 +1000
Message-Id: <CT6ATGRN6KJU.12QZ7TJGGX7LC@wheely>
Subject: Re: [RFC PATCH v2 5/6] KVM: PPC: Add support for nested PAPR guests
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jpn@linux.vnet.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.14.0
References: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
 <20230605064848.12319-6-jpn@linux.vnet.ibm.com>
In-Reply-To: <20230605064848.12319-6-jpn@linux.vnet.ibm.com>
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
Cc: mikey@neuling.org, kautuk.consul.1980@gmail.com, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, sbhat@linux.ibm.com, vaibhav@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jun 5, 2023 at 4:48 PM AEST, Jordan Niethe wrote:
> A series of hcalls have been added to the PAPR which allow a regular
> guest partition to create and manage guest partitions of its own. Add
> support to KVM to utilize these hcalls to enable running nested guests.
>
> Overview of the new hcall usage:
>
> - L1 and L0 negotiate capabilities with
>   H_GUEST_{G,S}ET_CAPABILITIES()
>
> - L1 requests the L0 create a L2 with
>   H_GUEST_CREATE() and receives a handle to use in future hcalls
>
> - L1 requests the L0 create a L2 vCPU with
>   H_GUEST_CREATE_VCPU()
>
> - L1 sets up the L2 using H_GUEST_SET and the
>   H_GUEST_VCPU_RUN input buffer
>
> - L1 requests the L0 runs the L2 vCPU using H_GUEST_VCPU_RUN()
>
> - L2 returns to L1 with an exit reason and L1 reads the
>   H_GUEST_VCPU_RUN output buffer populated by the L0
>
> - L1 handles the exit using H_GET_STATE if necessary
>
> - L1 reruns L2 vCPU with H_GUEST_VCPU_RUN
>
> - L1 frees the L2 in the L0 with H_GUEST_DELETE()
>
> Support for the new API is determined by trying
> H_GUEST_GET_CAPABILITIES. On a successful return, the new API will then
> be used.
>
> Use the vcpu register state setters for tracking modified guest state
> elements and copy the thread wide values into the H_GUEST_VCPU_RUN input
> buffer immediately before running a L2. The guest wide
> elements can not be added to the input buffer so send them with a
> separate H_GUEST_SET call if necessary.
>
> Make the vcpu register getter load the corresponding value from the real
> host with H_GUEST_GET. To avoid unnecessarily calling H_GUEST_GET, track
> which values have already been loaded between H_GUEST_VCPU_RUN calls. If
> an element is present in the H_GUEST_VCPU_RUN output buffer it also does
> not need to be loaded again.
>
> There is existing support for running nested guests on KVM
> with powernv. However the interface used for this is not supported by
> other PAPR hosts. This existing API is still supported.
>
> Signed-off-by: Jordan Niethe <jpn@linux.vnet.ibm.com>
> ---
> v2:
>   - Declare op structs as static
>   - Use expressions in switch case with local variables
>   - Do not use the PVR for the LOGICAL PVR ID
>   - Handle emul_inst as now a double word
>   - Use new GPR(), etc macros
>   - Determine PAPR nested capabilities from cpu features
> ---
>  arch/powerpc/include/asm/guest-state-buffer.h | 105 +-
>  arch/powerpc/include/asm/hvcall.h             |  30 +
>  arch/powerpc/include/asm/kvm_book3s.h         | 122 ++-
>  arch/powerpc/include/asm/kvm_book3s_64.h      |   6 +
>  arch/powerpc/include/asm/kvm_host.h           |  21 +
>  arch/powerpc/include/asm/kvm_ppc.h            |  64 +-
>  arch/powerpc/include/asm/plpar_wrappers.h     | 198 ++++
>  arch/powerpc/kvm/Makefile                     |   1 +
>  arch/powerpc/kvm/book3s_hv.c                  | 126 ++-
>  arch/powerpc/kvm/book3s_hv.h                  |  74 +-
>  arch/powerpc/kvm/book3s_hv_nested.c           |  38 +-
>  arch/powerpc/kvm/book3s_hv_papr.c             | 940 ++++++++++++++++++
>  arch/powerpc/kvm/emulate_loadstore.c          |   4 +-
>  arch/powerpc/kvm/guest-state-buffer.c         |  49 +
>  14 files changed, 1684 insertions(+), 94 deletions(-)
>  create mode 100644 arch/powerpc/kvm/book3s_hv_papr.c
>
> diff --git a/arch/powerpc/include/asm/guest-state-buffer.h b/arch/powerpc=
/include/asm/guest-state-buffer.h
> index 65a840abf1bb..116126edd8e2 100644
> --- a/arch/powerpc/include/asm/guest-state-buffer.h
> +++ b/arch/powerpc/include/asm/guest-state-buffer.h
> @@ -5,6 +5,7 @@
>  #ifndef _ASM_POWERPC_GUEST_STATE_BUFFER_H
>  #define _ASM_POWERPC_GUEST_STATE_BUFFER_H
> =20
> +#include "asm/hvcall.h"
>  #include <linux/gfp.h>
>  #include <linux/bitmap.h>
>  #include <asm/plpar_wrappers.h>
> @@ -14,16 +15,16 @@
>   ***********************************************************************=
***/
>  #define GSID_BLANK			0x0000
> =20
> -#define GSID_HOST_STATE_SIZE		0x0001 /* Size of Hypervisor Internal Form=
at VCPU state */
> -#define GSID_RUN_OUTPUT_MIN_SIZE	0x0002 /* Minimum size of the Run VCPU =
output buffer */
> -#define GSID_LOGICAL_PVR		0x0003 /* Logical PVR */
> -#define GSID_TB_OFFSET			0x0004 /* Timebase Offset */
> -#define GSID_PARTITION_TABLE		0x0005 /* Partition Scoped Page Table */
> -#define GSID_PROCESS_TABLE		0x0006 /* Process Table */
> +#define GSID_HOST_STATE_SIZE		0x0001
> +#define GSID_RUN_OUTPUT_MIN_SIZE	0x0002
> +#define GSID_LOGICAL_PVR		0x0003
> +#define GSID_TB_OFFSET			0x0004
> +#define GSID_PARTITION_TABLE		0x0005
> +#define GSID_PROCESS_TABLE		0x0006

You lost your comments.

> diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include=
/asm/kvm_book3s.h
> index 0ca2d8b37b42..c5c57552b447 100644
> --- a/arch/powerpc/include/asm/kvm_book3s.h
> +++ b/arch/powerpc/include/asm/kvm_book3s.h
> @@ -12,6 +12,7 @@
>  #include <linux/types.h>
>  #include <linux/kvm_host.h>
>  #include <asm/kvm_book3s_asm.h>
> +#include <asm/guest-state-buffer.h>
> =20
>  struct kvmppc_bat {
>  	u64 raw;
> @@ -316,6 +317,57 @@ long int kvmhv_nested_page_fault(struct kvm_vcpu *vc=
pu);
> =20
>  void kvmppc_giveup_fac(struct kvm_vcpu *vcpu, ulong fac);
> =20
> +
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +
> +extern bool __kvmhv_on_papr;
> +
> +static inline bool kvmhv_on_papr(void)
> +{
> +	return __kvmhv_on_papr;
> +}

It's a nitpick, but kvmhv_on_pseries() is because we're runnning KVM-HV
on a pseries guest kernel. Which is a papr guest kernel. So this kind of
doesn't make sense if you read it the same way.

kvmhv_nested_using_papr() or something like that might read a bit
better.

This could be a static key too.

> @@ -575,6 +593,7 @@ struct kvm_vcpu_arch {
>  	ulong dscr;
>  	ulong amr;
>  	ulong uamor;
> +	ulong amor;
>  	ulong iamr;
>  	u32 ctrl;
>  	u32 dabrx;

This belongs somewhere else.

> @@ -829,6 +848,8 @@ struct kvm_vcpu_arch {
>  	u64 nested_hfscr;	/* HFSCR that the L1 requested for the nested guest *=
/
>  	u32 nested_vcpu_id;
>  	gpa_t nested_io_gpr;
> +	/* For nested APIv2 guests*/
> +	struct kvmhv_papr_host papr_host;
>  #endif

This is not exactly a papr host. Might have to come up with a better
name especially if we implement a L0 things could get confusing.

> @@ -342,6 +343,203 @@ static inline long plpar_get_cpu_characteristics(st=
ruct h_cpu_char_result *p)
>  	return rc;
>  }
> =20
> +static inline long plpar_guest_create(unsigned long flags, unsigned long=
 *guest_id)
> +{
> +	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
> +	unsigned long token;
> +	long rc;
> +
> +	token =3D -1UL;
> +	while (true) {
> +		rc =3D plpar_hcall(H_GUEST_CREATE, retbuf, flags, token);
> +		if (rc =3D=3D H_SUCCESS) {
> +			*guest_id =3D retbuf[0];
> +			break;
> +		}
> +
> +		if (rc =3D=3D H_BUSY) {
> +			token =3D retbuf[0];
> +			cpu_relax();
> +			continue;
> +		}
> +
> +		if (H_IS_LONG_BUSY(rc)) {
> +			token =3D retbuf[0];
> +			mdelay(get_longbusy_msecs(rc));

All of these things need a non-sleeping delay? Can we sleep instead?
Or if not, might have to think about going back to the caller and it
can retry.

get/set state might be a bit inconvenient, although I don't expect
that should potentially take so long as guest and vcpu create/delete,
so at least those ones would be good if they're called while
preemptable.

> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 521d84621422..f22ee582e209 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -383,6 +383,11 @@ static void kvmppc_core_vcpu_put_hv(struct kvm_vcpu =
*vcpu)
>  	spin_unlock_irqrestore(&vcpu->arch.tbacct_lock, flags);
>  }
> =20
> +static void kvmppc_set_pvr_hv(struct kvm_vcpu *vcpu, u32 pvr)
> +{
> +	vcpu->arch.pvr =3D pvr;
> +}

Didn't you lose this in a previous patch? I thought it must have moved
to a header but it reappears.

> +
>  /* Dummy value used in computing PCR value below */
>  #define PCR_ARCH_31    (PCR_ARCH_300 << 1)
> =20
> @@ -1262,13 +1267,14 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu=
)
>  			return RESUME_HOST;
>  		break;
>  #endif
> -	case H_RANDOM:
> +	case H_RANDOM: {
>  		unsigned long rand;
> =20
>  		if (!arch_get_random_seed_longs(&rand, 1))
>  			ret =3D H_HARDWARE;
>  		kvmppc_set_gpr(vcpu, 4, rand);
>  		break;
> +	}
>  	case H_RPT_INVALIDATE:
>  		ret =3D kvmppc_h_rpt_invalidate(vcpu, kvmppc_get_gpr(vcpu, 4),
>  					      kvmppc_get_gpr(vcpu, 5),

Compile fix for a previous patch.

> @@ -2921,14 +2927,21 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_=
vcpu *vcpu)
>  	vcpu->arch.shared_big_endian =3D false;
>  #endif
>  #endif
> -	kvmppc_set_mmcr_hv(vcpu, 0, MMCR0_FC);
> =20
> +	if (kvmhv_on_papr()) {
> +		err =3D kvmhv_papr_vcpu_create(vcpu, &vcpu->arch.papr_host);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	kvmppc_set_mmcr_hv(vcpu, 0, MMCR0_FC);
>  	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>  		kvmppc_set_mmcr_hv(vcpu, 0, kvmppc_get_mmcr_hv(vcpu, 0) | MMCR0_PMCCEX=
T);
>  		kvmppc_set_mmcra_hv(vcpu, MMCRA_BHRB_DISABLE);
>  	}
> =20
>  	kvmppc_set_ctrl_hv(vcpu, CTRL_RUNLATCH);
> +	kvmppc_set_amor_hv(vcpu, ~0);

This AMOR thing should go somewhere else. Not actually sure why it needs
to be added to the vcpu since it's always ~0. Maybe just put that in a
#define somewhere and use that.

> @@ -4042,6 +4059,50 @@ static void vcpu_vpa_increment_dispatch(struct kvm=
_vcpu *vcpu)
>  	}
>  }
> =20
> +static int kvmhv_vcpu_entry_papr(struct kvm_vcpu *vcpu, u64 time_limit, =
unsigned long lpcr, u64 *tb)
> +{
> +	struct kvmhv_papr_host *ph;
> +	unsigned long msr, i;
> +	int trap;
> +	long rc;
> +
> +	ph =3D &vcpu->arch.papr_host;
> +
> +	msr =3D mfmsr();
> +	kvmppc_msr_hard_disable_set_facilities(vcpu, msr);
> +	if (lazy_irq_pending())
> +		return 0;
> +
> +	kvmhv_papr_flush_vcpu(vcpu, time_limit);
> +
> +	accumulate_time(vcpu, &vcpu->arch.in_guest);
> +	rc =3D plpar_guest_run_vcpu(0, vcpu->kvm->arch.lpid, vcpu->vcpu_id,
> +				  &trap, &i);
> +
> +	if (rc !=3D H_SUCCESS) {
> +		pr_err("KVM Guest Run VCPU hcall failed\n");
> +		if (rc =3D=3D H_INVALID_ELEMENT_ID)
> +			pr_err("KVM: Guest Run VCPU invalid element id at %ld\n", i);
> +		else if (rc =3D=3D H_INVALID_ELEMENT_SIZE)
> +			pr_err("KVM: Guest Run VCPU invalid element size at %ld\n", i);
> +		else if (rc =3D=3D H_INVALID_ELEMENT_VALUE)
> +			pr_err("KVM: Guest Run VCPU invalid element value at %ld\n", i);
> +		return 0;
> +	}

This needs the proper error handling. Were you going to wait until I
sent that up for existing code?

> @@ -5119,6 +5183,7 @@ static void kvmppc_core_commit_memory_region_hv(str=
uct kvm *kvm,
>   */
>  void kvmppc_update_lpcr(struct kvm *kvm, unsigned long lpcr, unsigned lo=
ng mask)
>  {
> +	struct kvm_vcpu *vcpu;
>  	long int i;
>  	u32 cores_done =3D 0;
> =20
> @@ -5139,6 +5204,12 @@ void kvmppc_update_lpcr(struct kvm *kvm, unsigned =
long lpcr, unsigned long mask)
>  		if (++cores_done >=3D kvm->arch.online_vcores)
>  			break;
>  	}
> +
> +	if (kvmhv_on_papr()) {
> +		kvm_for_each_vcpu(i, vcpu, kvm) {
> +			kvmppc_set_lpcr_hv(vcpu, vcpu->arch.vcore->lpcr);
> +		}
> +	}
>  }

vcpu define could go in that scope I guess.

> @@ -5405,15 +5476,43 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm=
)
> =20
>  	/* Allocate the guest's logical partition ID */
> =20
> -	lpid =3D kvmppc_alloc_lpid();
> -	if ((long)lpid < 0)
> -		return -ENOMEM;
> -	kvm->arch.lpid =3D lpid;
> +	if (!kvmhv_on_papr()) {
> +		lpid =3D kvmppc_alloc_lpid();
> +		if ((long)lpid < 0)
> +			return -ENOMEM;
> +		kvm->arch.lpid =3D lpid;
> +	}
> =20
>  	kvmppc_alloc_host_rm_ops();
> =20
>  	kvmhv_vm_nested_init(kvm);
> =20
> +	if (kvmhv_on_papr()) {
> +		long rc;
> +		unsigned long guest_id;
> +
> +		rc =3D plpar_guest_create(0, &guest_id);
> +
> +		if (rc !=3D H_SUCCESS)
> +			pr_err("KVM: Create Guest hcall failed, rc=3D%ld\n", rc);
> +
> +		switch (rc) {
> +		case H_PARAMETER:
> +		case H_FUNCTION:
> +		case H_STATE:
> +			return -EINVAL;
> +		case H_NOT_ENOUGH_RESOURCES:
> +		case H_ABORTED:
> +			return -ENOMEM;
> +		case H_AUTHORITY:
> +			return -EPERM;
> +		case H_NOT_AVAILABLE:
> +			return -EBUSY;
> +		}
> +		kvm->arch.lpid =3D guest_id;
> +	}

I wouldn't mind putting lpid/guest_id in different variables. guest_id
is 64-bit isn't it? LPIDR is 32. If nothing else that could cause
issues if the hypervisor does something clever with the token.

> @@ -5573,10 +5675,14 @@ static void kvmppc_core_destroy_vm_hv(struct kvm =
*kvm)
>  		kvm->arch.process_table =3D 0;
>  		if (kvm->arch.secure_guest)
>  			uv_svm_terminate(kvm->arch.lpid);
> -		kvmhv_set_ptbl_entry(kvm->arch.lpid, 0, 0);
> +		if (!kvmhv_on_papr())
> +			kvmhv_set_ptbl_entry(kvm->arch.lpid, 0, 0);
>  	}

Would be nice to have a +ve test for the "existing" API. All we have to
do is think of a name for it.

Thanks,
Nick
