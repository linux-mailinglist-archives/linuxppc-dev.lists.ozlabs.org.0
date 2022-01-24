Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F99B499CFF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 23:15:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjPSS0CBbz3cXM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 09:15:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SFtELHCt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SFtELHCt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjPRg6zPdz3cQc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 09:14:55 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OJoF7e017493
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=0WfHVAgBsPAB5mvurR7B1NcFFYMtJc2Rxi+uuFlp8P8=;
 b=SFtELHCtgp9dYFiByBYOczGGutqTa4j5ZjIPTorAvGyiwW26xeNKbPuQkylBTUd3LcA9
 naIVvA5Yow4YpsmXyVwjF3vB3tYWngRkEl0XNvL+IT35GR7UpX5auStM0ph59QrUbqBJ
 yeJSxFHFspyuedncsSmbsFp/Q3zpOnDn9O+laH8BIfDC1erKhr5LI1wIF1+rEraNfeI0
 BdxgkhaMi4+G4Dy4boIdadHJyNDFAEDR+lXdUkcH0YhvJUSsJ7RSoXqyTo2fU+TtN1B5
 nFykhY6baZ+/hqSn8dqDqdAK/fM6VAKA6ftzTmAHZ6rJnuoI0/In+a0gj1iLoUtltP3G Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt09w65er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:14:53 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20OMEq5a003615
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:14:52 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt09w65en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 22:14:52 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OM7MMU011037;
 Mon, 24 Jan 2022 22:14:52 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 3dr9ja02hk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 22:14:52 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OMEp8d33751450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 22:14:51 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45820BE05A;
 Mon, 24 Jan 2022 22:14:51 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FF7FBE059;
 Mon, 24 Jan 2022 22:14:50 +0000 (GMT)
Received: from localhost (unknown [9.163.24.67])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 24 Jan 2022 22:14:50 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/6] KVM: PPC: Book3S HV Nested: Change nested guest
 lookup to use idr
In-Reply-To: <20220123120043.3586018-5-npiggin@gmail.com>
References: <20220123120043.3586018-1-npiggin@gmail.com>
 <20220123120043.3586018-5-npiggin@gmail.com>
Date: Mon, 24 Jan 2022 19:14:48 -0300
Message-ID: <87fspceq7b.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: a8xSV6m0gLwI-u7N3YpEnjk5T9RQPFAI
X-Proofpoint-ORIG-GUID: VYU7qn6PEIzQscveOpxJNHRKC6jdw57l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
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

> This removes the fixed sized kvm->arch.nested_guests array.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

>  arch/powerpc/include/asm/kvm_host.h |   3 +-
>  arch/powerpc/kvm/book3s_hv_nested.c | 110 +++++++++++++++-------------
>  2 files changed, 59 insertions(+), 54 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index d9bf60bf0816..5fd0564e5c94 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -326,8 +326,7 @@ struct kvm_arch {
>  	struct list_head uvmem_pfns;
>  	struct mutex mmu_setup_lock;	/* nests inside vcpu mutexes */
>  	u64 l1_ptcr;
> -	int max_nested_lpid;
> -	struct kvm_nested_guest *nested_guests[KVM_MAX_NESTED_GUESTS];
> +	struct idr kvm_nested_guest_idr;
>  	/* This array can grow quite large, keep it at the end */
>  	struct kvmppc_vcore *vcores[KVM_MAX_VCORES];
>  #endif
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index 9d373f8963ee..1eff969b095c 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -521,11 +521,6 @@ static void kvmhv_set_nested_ptbl(struct kvm_nested_guest *gp)
>  	kvmhv_set_ptbl_entry(gp->shadow_lpid, dw0, gp->process_table);
>  }
>
> -void kvmhv_vm_nested_init(struct kvm *kvm)
> -{
> -	kvm->arch.max_nested_lpid = -1;
> -}
> -
>  /*
>   * Handle the H_SET_PARTITION_TABLE hcall.
>   * r4 = guest real address of partition table + log_2(size) - 12
> @@ -660,6 +655,35 @@ static void kvmhv_update_ptbl_cache(struct kvm_nested_guest *gp)
>  	kvmhv_set_nested_ptbl(gp);
>  }
>
> +void kvmhv_vm_nested_init(struct kvm *kvm)
> +{
> +	idr_init(&kvm->arch.kvm_nested_guest_idr);
> +}
> +
> +static struct kvm_nested_guest *__find_nested(struct kvm *kvm, int lpid)
> +{
> +	return idr_find(&kvm->arch.kvm_nested_guest_idr, lpid);
> +}
> +
> +static bool __prealloc_nested(struct kvm *kvm, int lpid)
> +{
> +	if (idr_alloc(&kvm->arch.kvm_nested_guest_idr,
> +				NULL, lpid, lpid + 1, GFP_KERNEL) != lpid)
> +		return false;
> +	return true;
> +}
> +
> +static void __add_nested(struct kvm *kvm, int lpid, struct kvm_nested_guest *gp)
> +{
> +	if (idr_replace(&kvm->arch.kvm_nested_guest_idr, gp, lpid))
> +		WARN_ON(1);
> +}
> +
> +static void __remove_nested(struct kvm *kvm, int lpid)
> +{
> +	idr_remove(&kvm->arch.kvm_nested_guest_idr, lpid);
> +}
> +
>  static struct kvm_nested_guest *kvmhv_alloc_nested(struct kvm *kvm, unsigned int lpid)
>  {
>  	struct kvm_nested_guest *gp;
> @@ -720,13 +744,8 @@ static void kvmhv_remove_nested(struct kvm_nested_guest *gp)
>  	long ref;
>
>  	spin_lock(&kvm->mmu_lock);
> -	if (gp == kvm->arch.nested_guests[lpid]) {
> -		kvm->arch.nested_guests[lpid] = NULL;
> -		if (lpid == kvm->arch.max_nested_lpid) {
> -			while (--lpid >= 0 && !kvm->arch.nested_guests[lpid])
> -				;
> -			kvm->arch.max_nested_lpid = lpid;
> -		}
> +	if (gp == __find_nested(kvm, lpid)) {
> +		__remove_nested(kvm, lpid);
>  		--gp->refcnt;
>  	}
>  	ref = gp->refcnt;
> @@ -743,24 +762,22 @@ static void kvmhv_remove_nested(struct kvm_nested_guest *gp)
>   */
>  void kvmhv_release_all_nested(struct kvm *kvm)
>  {
> -	int i;
> +	int lpid;
>  	struct kvm_nested_guest *gp;
>  	struct kvm_nested_guest *freelist = NULL;
>  	struct kvm_memory_slot *memslot;
>  	int srcu_idx, bkt;
>
>  	spin_lock(&kvm->mmu_lock);
> -	for (i = 0; i <= kvm->arch.max_nested_lpid; i++) {
> -		gp = kvm->arch.nested_guests[i];
> -		if (!gp)
> -			continue;
> -		kvm->arch.nested_guests[i] = NULL;
> +	idr_for_each_entry(&kvm->arch.kvm_nested_guest_idr, gp, lpid) {
> +		__remove_nested(kvm, lpid);
>  		if (--gp->refcnt == 0) {
>  			gp->next = freelist;
>  			freelist = gp;
>  		}
>  	}
> -	kvm->arch.max_nested_lpid = -1;
> +	idr_destroy(&kvm->arch.kvm_nested_guest_idr);
> +	/* idr is empty and may be reused at this point */
>  	spin_unlock(&kvm->mmu_lock);
>  	while ((gp = freelist) != NULL) {
>  		freelist = gp->next;
> @@ -797,7 +814,7 @@ struct kvm_nested_guest *kvmhv_get_nested(struct kvm *kvm, int l1_lpid,
>  		return NULL;
>
>  	spin_lock(&kvm->mmu_lock);
> -	gp = kvm->arch.nested_guests[l1_lpid];
> +	gp = __find_nested(kvm, l1_lpid);
>  	if (gp)
>  		++gp->refcnt;
>  	spin_unlock(&kvm->mmu_lock);
> @@ -808,17 +825,19 @@ struct kvm_nested_guest *kvmhv_get_nested(struct kvm *kvm, int l1_lpid,
>  	newgp = kvmhv_alloc_nested(kvm, l1_lpid);
>  	if (!newgp)
>  		return NULL;
> +
> +	if (!__prealloc_nested(kvm, l1_lpid)) {
> +		kvmhv_release_nested(newgp);
> +		return NULL;
> +	}
> +
>  	spin_lock(&kvm->mmu_lock);
> -	if (kvm->arch.nested_guests[l1_lpid]) {
> -		/* someone else beat us to it */
> -		gp = kvm->arch.nested_guests[l1_lpid];
> -	} else {
> -		kvm->arch.nested_guests[l1_lpid] = newgp;
> +	gp = __find_nested(kvm, l1_lpid);
> +	if (!gp) {
> +		__add_nested(kvm, l1_lpid, newgp);
>  		++newgp->refcnt;
>  		gp = newgp;
>  		newgp = NULL;
> -		if (l1_lpid > kvm->arch.max_nested_lpid)
> -			kvm->arch.max_nested_lpid = l1_lpid;
>  	}
>  	++gp->refcnt;
>  	spin_unlock(&kvm->mmu_lock);
> @@ -841,20 +860,13 @@ void kvmhv_put_nested(struct kvm_nested_guest *gp)
>  		kvmhv_release_nested(gp);
>  }
>
> -static struct kvm_nested_guest *kvmhv_find_nested(struct kvm *kvm, int lpid)
> -{
> -	if (lpid > kvm->arch.max_nested_lpid)
> -		return NULL;
> -	return kvm->arch.nested_guests[lpid];
> -}
> -
>  pte_t *find_kvm_nested_guest_pte(struct kvm *kvm, unsigned long lpid,
>  				 unsigned long ea, unsigned *hshift)
>  {
>  	struct kvm_nested_guest *gp;
>  	pte_t *pte;
>
> -	gp = kvmhv_find_nested(kvm, lpid);
> +	gp = __find_nested(kvm, lpid);
>  	if (!gp)
>  		return NULL;
>
> @@ -960,7 +972,7 @@ static void kvmhv_remove_nest_rmap(struct kvm *kvm, u64 n_rmap,
>
>  	gpa = n_rmap & RMAP_NESTED_GPA_MASK;
>  	lpid = (n_rmap & RMAP_NESTED_LPID_MASK) >> RMAP_NESTED_LPID_SHIFT;
> -	gp = kvmhv_find_nested(kvm, lpid);
> +	gp = __find_nested(kvm, lpid);
>  	if (!gp)
>  		return;
>
> @@ -1152,16 +1164,13 @@ static void kvmhv_emulate_tlbie_all_lpid(struct kvm_vcpu *vcpu, int ric)
>  {
>  	struct kvm *kvm = vcpu->kvm;
>  	struct kvm_nested_guest *gp;
> -	int i;
> +	int lpid;
>
>  	spin_lock(&kvm->mmu_lock);
> -	for (i = 0; i <= kvm->arch.max_nested_lpid; i++) {
> -		gp = kvm->arch.nested_guests[i];
> -		if (gp) {
> -			spin_unlock(&kvm->mmu_lock);
> -			kvmhv_emulate_tlbie_lpid(vcpu, gp, ric);
> -			spin_lock(&kvm->mmu_lock);
> -		}
> +	idr_for_each_entry(&kvm->arch.kvm_nested_guest_idr, gp, lpid) {
> +		spin_unlock(&kvm->mmu_lock);
> +		kvmhv_emulate_tlbie_lpid(vcpu, gp, ric);
> +		spin_lock(&kvm->mmu_lock);
>  	}
>  	spin_unlock(&kvm->mmu_lock);
>  }
> @@ -1313,7 +1322,7 @@ long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
>  	 * H_ENTER_NESTED call. Since we can't differentiate this case from
>  	 * the invalid case, we ignore such flush requests and return success.
>  	 */
> -	if (!kvmhv_find_nested(vcpu->kvm, lpid))
> +	if (!__find_nested(vcpu->kvm, lpid))
>  		return H_SUCCESS;
>
>  	/*
> @@ -1657,15 +1666,12 @@ long int kvmhv_nested_page_fault(struct kvm_vcpu *vcpu)
>
>  int kvmhv_nested_next_lpid(struct kvm *kvm, int lpid)
>  {
> -	int ret = -1;
> +	int ret = lpid + 1;
>
>  	spin_lock(&kvm->mmu_lock);
> -	while (++lpid <= kvm->arch.max_nested_lpid) {
> -		if (kvm->arch.nested_guests[lpid]) {
> -			ret = lpid;
> -			break;
> -		}
> -	}
> +	if (!idr_get_next(&kvm->arch.kvm_nested_guest_idr, &ret))
> +		ret = -1;
>  	spin_unlock(&kvm->mmu_lock);
> +
>  	return ret;
>  }
