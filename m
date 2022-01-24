Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D894499D16
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 23:16:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjPTF2bVbz3cbf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 09:16:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FdH8nfVJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FdH8nfVJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjPRz0s4Zz2yfc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 09:15:10 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OLgnpc019358
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=jgYcn+l4QRaad9iLhrgYBeWumDNyM+n6x/0r37CFBqg=;
 b=FdH8nfVJ8F6WySJ10w4PWNYsRU//x/dZixiTYepQaQNBdhPkFfB5SeqpoBlF4JQfoBu8
 KJnTLRhmRyh8FV3DfsiNTc5vqUkR3lKdUia0WuxHTVJ3OUBIkiDCmYVHNHgt9GBzOVzb
 OukB9Eq/cU4T1oadX5/Z3RUTg9/007l534wcc2iZNUpTkwQ0AIvJ80e5Qb+fMshEwoSc
 wkNylnIb1d3vlsp4wAegkGBCvlrlzdglPNRgcVN9XtOWYqjB4UApvocTWslksHeq2jpk
 hzj0PocElZQeZoHnOqBHaXwxxkk01f7dBcpgPI1chxokq5h8YTivxVRcaGy5vlqikhtl Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt48rrjuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:15:08 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20OLgbMd019033
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:15:08 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt48rrju7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 22:15:08 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OM8wLW017558;
 Mon, 24 Jan 2022 22:15:07 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 3dt1x8uvrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 22:15:07 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OMF67d17826054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 22:15:06 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E51C7AE084;
 Mon, 24 Jan 2022 22:15:05 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00A17AE063;
 Mon, 24 Jan 2022 22:15:04 +0000 (GMT)
Received: from localhost (unknown [9.163.24.67])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 24 Jan 2022 22:15:04 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/6] KVM: PPC: Book3S Nested: Use explicit 4096 LPID
 maximum
In-Reply-To: <20220123120043.3586018-6-npiggin@gmail.com>
References: <20220123120043.3586018-1-npiggin@gmail.com>
 <20220123120043.3586018-6-npiggin@gmail.com>
Date: Mon, 24 Jan 2022 19:15:02 -0300
Message-ID: <87czkgeq6x.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 30iHCc6qPBzdbnocJl3ZeybzF9RQgXxe
X-Proofpoint-ORIG-GUID: FI3ruPpNSpIxHBhvv6odJLa7rGsDc_jp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201240143
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Rather than tie this to KVMPPC_NR_LPIDS which is becoming more dynamic,
> fix it to 4096 (12-bits) explicitly for now.
>
> kvmhv_get_nested() does not have to check against KVM_MAX_NESTED_GUESTS
> because the L1 partition table registration hcall already did that, and
> it checks against the partition table size.
>
> This patch also puts all the partition table size calculations into the
> same form, using 12 for the architected size field shift and 4 for the
> shift corresponding to the partition table entry size.
>
> Signed-of-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/kvm_host.h |  7 ++++++-
>  arch/powerpc/kvm/book3s_64_mmu_hv.c |  2 +-
>  arch/powerpc/kvm/book3s_hv_nested.c | 24 +++++++++++-------------
>  3 files changed, 18 insertions(+), 15 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 5fd0564e5c94..e6fb03884dcc 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -34,7 +34,12 @@
>  #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>  #include <asm/kvm_book3s_asm.h>		/* for MAX_SMT_THREADS */
>  #define KVM_MAX_VCPU_IDS	(MAX_SMT_THREADS * KVM_MAX_VCORES)
> -#define KVM_MAX_NESTED_GUESTS	KVMPPC_NR_LPIDS
> +
> +/*
> + * Limit the nested partition table to 4096 entries (because that's what
> + * hardware supports). Both guest and host use this value.
> + */
> +#define KVM_MAX_NESTED_GUESTS_SHIFT	12
>
>  #else
>  #define KVM_MAX_VCPU_IDS	KVM_MAX_VCPUS
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> index 5be92d5bc099..f983fb36cbf2 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> @@ -266,7 +266,7 @@ int kvmppc_mmu_hv_init(void)
>  			return -EINVAL;
>  		nr_lpids = 1UL << mmu_lpid_bits;
>  	} else {
> -		nr_lpids = KVM_MAX_NESTED_GUESTS;
> +		nr_lpids = 1UL << KVM_MAX_NESTED_GUESTS_SHIFT;
>  	}
>
>  	if (nr_lpids > KVMPPC_NR_LPIDS)
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index 1eff969b095c..75169e0753ce 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -439,10 +439,11 @@ long kvmhv_nested_init(void)
>  	if (!radix_enabled())
>  		return -ENODEV;
>
> -	/* find log base 2 of KVMPPC_NR_LPIDS, rounding up */
> -	ptb_order = __ilog2(KVMPPC_NR_LPIDS - 1) + 1;
> -	if (ptb_order < 8)
> -		ptb_order = 8;
> +	/* Partition table entry is 1<<4 bytes in size, hence the 4. */
> +	ptb_order = KVM_MAX_NESTED_GUESTS_SHIFT + 4;
> +	/* Minimum partition table size is 1<<12 bytes */
> +	if (ptb_order < 12)
> +		ptb_order = 12;
>  	pseries_partition_tb = kmalloc(sizeof(struct patb_entry) << ptb_order,
>  				       GFP_KERNEL);
>  	if (!pseries_partition_tb) {
> @@ -450,7 +451,7 @@ long kvmhv_nested_init(void)
>  		return -ENOMEM;
>  	}
>
> -	ptcr = __pa(pseries_partition_tb) | (ptb_order - 8);
> +	ptcr = __pa(pseries_partition_tb) | (ptb_order - 12);
>  	rc = plpar_hcall_norets(H_SET_PARTITION_TABLE, ptcr);
>  	if (rc != H_SUCCESS) {
>  		pr_err("kvm-hv: Parent hypervisor does not support nesting (rc=%ld)\n",
> @@ -534,16 +535,14 @@ long kvmhv_set_partition_table(struct kvm_vcpu *vcpu)
>  	long ret = H_SUCCESS;
>
>  	srcu_idx = srcu_read_lock(&kvm->srcu);
> -	/*
> -	 * Limit the partition table to 4096 entries (because that's what
> -	 * hardware supports), and check the base address.
> -	 */
> -	if ((ptcr & PRTS_MASK) > 12 - 8 ||
> +	/* Check partition size and base address. */
> +	if ((ptcr & PRTS_MASK) + 12 - 4 > KVM_MAX_NESTED_GUESTS_SHIFT ||
>  	    !kvm_is_visible_gfn(vcpu->kvm, (ptcr & PRTB_MASK) >> PAGE_SHIFT))
>  		ret = H_PARAMETER;
>  	srcu_read_unlock(&kvm->srcu, srcu_idx);
>  	if (ret == H_SUCCESS)
>  		kvm->arch.l1_ptcr = ptcr;
> +
>  	return ret;
>  }
>
> @@ -639,7 +638,7 @@ static void kvmhv_update_ptbl_cache(struct kvm_nested_guest *gp)
>
>  	ret = -EFAULT;
>  	ptbl_addr = (kvm->arch.l1_ptcr & PRTB_MASK) + (gp->l1_lpid << 4);
> -	if (gp->l1_lpid < (1ul << ((kvm->arch.l1_ptcr & PRTS_MASK) + 8))) {
> +	if (gp->l1_lpid < (1ul << ((kvm->arch.l1_ptcr & PRTS_MASK) + 12 - 4))) {
>  		int srcu_idx = srcu_read_lock(&kvm->srcu);
>  		ret = kvm_read_guest(kvm, ptbl_addr,
>  				     &ptbl_entry, sizeof(ptbl_entry));
> @@ -809,8 +808,7 @@ struct kvm_nested_guest *kvmhv_get_nested(struct kvm *kvm, int l1_lpid,
>  {
>  	struct kvm_nested_guest *gp, *newgp;
>
> -	if (l1_lpid >= KVM_MAX_NESTED_GUESTS ||
> -	    l1_lpid >= (1ul << ((kvm->arch.l1_ptcr & PRTS_MASK) + 12 - 4)))
> +	if (l1_lpid >= (1ul << ((kvm->arch.l1_ptcr & PRTS_MASK) + 12 - 4)))
>  		return NULL;
>
>  	spin_lock(&kvm->mmu_lock);
