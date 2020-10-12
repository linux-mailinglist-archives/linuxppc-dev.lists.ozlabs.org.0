Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD3E28BBEA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 17:31:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C92hf509WzDqkX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 02:31:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZqYWiA+g; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C92dh3HSjzDqf3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 02:28:52 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09CF2RJO065990; Mon, 12 Oct 2020 11:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=QWQmHlXwpOPNBHJ3a+EOwU1jDz5V4/rkeOx0zg2Qy98=;
 b=ZqYWiA+gM61S43t5KSq+4lIY1nIqHuVTyeY72vGgNT+SvaSSjZawstHTrYLdHHDA0kt3
 kBbvnAlAhF46CEgvBUTIE5l4ecMw7r1CUN2opgFhuWRA1Diw3cgi+BYZS4nNwooUql2W
 QAK4o2LjonG8faR0A7ahg2heJRR/hfPvTgwR0Wbl6dqyLTj7t5LpIbmEdkMFMvqbmh8v
 sQIBzsNZrZdtSN5xAG0+Rv7hGB83gx8LUPJCe7YAPTqgH9ExGi6cw/KkYj2rwSsQyWye
 d3YC0OrrAB8nrRXYwlAI71xffdZUr0wFjn/QJ0B9PiCDTUAKrNzK9gK3KUn2WTGk9bFR UA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 344s75hgy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 11:28:50 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09CFRgQn015922;
 Mon, 12 Oct 2020 15:28:48 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3434k7t5d0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 15:28:47 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09CFSjYo24838654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Oct 2020 15:28:45 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C13E642042;
 Mon, 12 Oct 2020 15:28:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 960C04203F;
 Mon, 12 Oct 2020 15:28:42 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.68.118])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 12 Oct 2020 15:28:40 +0000 (GMT)
Date: Mon, 12 Oct 2020 20:58:36 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [RFC v1 2/2] KVM: PPC: Book3S HV: abstract secure VM related
 calls.
Message-ID: <20201012152836.GK185637@in.ibm.com>
References: <1602487663-7321-1-git-send-email-linuxram@us.ibm.com>
 <1602487663-7321-2-git-send-email-linuxram@us.ibm.com>
 <1602487663-7321-3-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602487663-7321-3-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-12_12:2020-10-12,
 2020-10-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011
 lowpriorityscore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=5 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010120117
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
Reply-To: bharata@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 farosas@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 12, 2020 at 12:27:43AM -0700, Ram Pai wrote:
> Abstract the secure VM related calls into generic calls.
> 
> These generic calls will call the corresponding method of the
> backend that prvoides the implementation to support secure VM.
> 
> Currently there is only the ultravisor based implementation.
> Modify that implementation to act as a backed to the generic calls.
> 
> This plumbing will provide the flexibility to add more backends
> in the future.
> 
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> ---
>  arch/powerpc/include/asm/kvm_book3s_uvmem.h   | 100 -----------
>  arch/powerpc/include/asm/kvmppc_svm_backend.h | 250 ++++++++++++++++++++++++++
>  arch/powerpc/kvm/book3s_64_mmu_radix.c        |   6 +-
>  arch/powerpc/kvm/book3s_hv.c                  |  28 +--
>  arch/powerpc/kvm/book3s_hv_uvmem.c            |  78 ++++++--
>  5 files changed, 327 insertions(+), 135 deletions(-)
>  delete mode 100644 arch/powerpc/include/asm/kvm_book3s_uvmem.h
>  create mode 100644 arch/powerpc/include/asm/kvmppc_svm_backend.h
> 
> diff --git a/arch/powerpc/include/asm/kvmppc_svm_backend.h b/arch/powerpc/include/asm/kvmppc_svm_backend.h
> new file mode 100644
> index 0000000..be60d80
> --- /dev/null
> +++ b/arch/powerpc/include/asm/kvmppc_svm_backend.h
> @@ -0,0 +1,250 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + *
> + * Copyright IBM Corp. 2020
> + *
> + * Authors: Ram Pai <linuxram@us.ibm.com>
> + */
> +
> +#ifndef __POWERPC_KVMPPC_SVM_BACKEND_H__
> +#define __POWERPC_KVMPPC_SVM_BACKEND_H__
> +
> +#include <linux/mutex.h>
> +#include <linux/timer.h>
> +#include <linux/types.h>
> +#include <linux/kvm_types.h>
> +#include <linux/kvm_host.h>
> +#include <linux/bug.h>
> +#ifdef CONFIG_PPC_BOOK3S
> +#include <asm/kvm_book3s.h>
> +#else
> +#include <asm/kvm_booke.h>
> +#endif
> +#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
> +#include <asm/paca.h>
> +#include <asm/xive.h>
> +#include <asm/cpu_has_feature.h>
> +#endif
> +
> +struct kvmppc_hmm_backend {

Though we started with HMM initially, what we ended up with eventually
has nothing to do with HMM. Please don't introduce hmm again :-)

> +	/* initialize */
> +	int (*kvmppc_secmem_init)(void);
> +
> +	/* cleanup */
> +	void (*kvmppc_secmem_free)(void);
> +
> +	/* is memory available */
> +	bool (*kvmppc_secmem_available)(void);
> +
> +	/* allocate a protected/secure page for the secure VM */
> +	unsigned long (*kvmppc_svm_page_in)(struct kvm *kvm,
> +			unsigned long gra,
> +			unsigned long flags,
> +			unsigned long page_shift);
> +
> +	/* recover the protected/secure page from the secure VM */
> +	unsigned long (*kvmppc_svm_page_out)(struct kvm *kvm,
> +			unsigned long gra,
> +			unsigned long flags,
> +			unsigned long page_shift);
> +
> +	/* initiate the transition of a VM to secure VM */
> +	unsigned long (*kvmppc_svm_init_start)(struct kvm *kvm);
> +
> +	/* finalize the transition of a secure VM */
> +	unsigned long (*kvmppc_svm_init_done)(struct kvm *kvm);
> +
> +	/* share the page on page fault */
> +	int (*kvmppc_svm_page_share)(struct kvm *kvm, unsigned long gfn);
> +
> +	/* abort the transition to a secure VM */
> +	unsigned long (*kvmppc_svm_init_abort)(struct kvm *kvm);
> +
> +	/* add a memory slot */
> +	int (*kvmppc_svm_memslot_create)(struct kvm *kvm,
> +		const struct kvm_memory_slot *new);
> +
> +	/* free a memory slot */
> +	void (*kvmppc_svm_memslot_delete)(struct kvm *kvm,
> +		const struct kvm_memory_slot *old);
> +
> +	/* drop pages allocated to the secure VM */
> +	void (*kvmppc_svm_drop_pages)(const struct kvm_memory_slot *free,
> +			     struct kvm *kvm, bool skip_page_out);
> +};

Since the structure has kvmppc_ prefix, may be you can drop
the same from its members to make the fields smaller?

> +
> +extern const struct kvmppc_hmm_backend *kvmppc_svm_backend;
> +
> +static inline int kvmppc_svm_page_share(struct kvm *kvm, unsigned long gfn)
> +{
> +	if (!kvmppc_svm_backend)
> +		return -ENODEV;
> +
> +	return kvmppc_svm_backend->kvmppc_svm_page_share(kvm,
> +				gfn);
> +}
> +
> +static inline void kvmppc_svm_drop_pages(const struct kvm_memory_slot *memslot,
> +			struct kvm *kvm, bool skip_page_out)
> +{
> +	if (!kvmppc_svm_backend)
> +		return;
> +
> +	kvmppc_svm_backend->kvmppc_svm_drop_pages(memslot,
> +			kvm, skip_page_out);
> +}
> +
> +static inline int kvmppc_svm_page_in(struct kvm *kvm,
> +			unsigned long gpa,
> +			unsigned long flags,
> +			unsigned long page_shift)
> +{
> +	if (!kvmppc_svm_backend)
> +		return -ENODEV;
> +
> +	return kvmppc_svm_backend->kvmppc_svm_page_in(kvm,
> +			gpa, flags, page_shift);
> +}
> +
> +static inline int kvmppc_svm_page_out(struct kvm *kvm,
> +			unsigned long gpa,
> +			unsigned long flags,
> +			unsigned long page_shift)
> +{
> +	if (!kvmppc_svm_backend)
> +		return -ENODEV;
> +
> +	return kvmppc_svm_backend->kvmppc_svm_page_out(kvm,
> +			gpa, flags, page_shift);
> +}
> +
> +static inline int kvmppc_svm_init_start(struct kvm *kvm)
> +{
> +	if (!kvmppc_svm_backend)
> +		return -ENODEV;
> +
> +	return kvmppc_svm_backend->kvmppc_svm_init_start(kvm);
> +}
> +
> +static inline int kvmppc_svm_init_done(struct kvm *kvm)
> +{
> +	if (!kvmppc_svm_backend)
> +		return -ENODEV;
> +
> +	return kvmppc_svm_backend->kvmppc_svm_init_done(kvm);
> +}
> +
> +static inline int kvmppc_svm_init_abort(struct kvm *kvm)
> +{
> +	if (!kvmppc_svm_backend)
> +		return -ENODEV;
> +
> +	return kvmppc_svm_backend->kvmppc_svm_init_abort(kvm);
> +}
> +
> +static inline void kvmppc_svm_memslot_create(struct kvm *kvm,
> +		const struct kvm_memory_slot *memslot)
> +{
> +	if (!kvmppc_svm_backend)
> +		return;
> +
> +	kvmppc_svm_backend->kvmppc_svm_memslot_create(kvm,
> +			memslot);
> +}
> +
> +static inline void kvmppc_svm_memslot_delete(struct kvm *kvm,
> +		const struct kvm_memory_slot *memslot)
> +{
> +	if (!kvmppc_svm_backend)
> +		return;
> +
> +	kvmppc_svm_backend->kvmppc_svm_memslot_delete(kvm,
> +			memslot);
> +}
> +
> +static inline int kvmppc_secmem_init(void)
> +{
> +#ifdef CONFIG_PPC_UV
> +	extern const struct kvmppc_hmm_backend kvmppc_uvmem_backend;
> +
> +	kvmppc_svm_backend = NULL;
> +	if (kvmhv_on_pseries()) {
> +		/* @TODO add the protected memory backend */
> +		return 0;
> +	}
> +
> +	kvmppc_svm_backend = &kvmppc_uvmem_backend;
> +
> +	if (!kvmppc_svm_backend->kvmppc_secmem_init) {

You have a function named kvmppc_secmem_init() and the field
named the same, can be confusing.

> +		pr_err("KVM-HV: kvmppc_svm_backend has no %s\n", __func__);
> +		goto err;
> +	}
> +	if (!kvmppc_svm_backend->kvmppc_secmem_free) {
> +		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_secmem_free()\n");
> +		goto err;
> +	}
> +	if (!kvmppc_svm_backend->kvmppc_secmem_available) {
> +		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_secmem_available()\n");
> +		goto err;
> +	}
> +	if (!kvmppc_svm_backend->kvmppc_svm_page_in) {
> +		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_page_in()\n");
> +		goto err;
> +	}
> +	if (!kvmppc_svm_backend->kvmppc_svm_page_out) {
> +		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_page_out()\n");
> +		goto err;
> +	}
> +	if (!kvmppc_svm_backend->kvmppc_svm_init_start) {
> +		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_init_start()\n");
> +		goto err;
> +	}
> +	if (!kvmppc_svm_backend->kvmppc_svm_init_done) {
> +		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_init_done()\n");
> +		goto err;
> +	}
> +	if (!kvmppc_svm_backend->kvmppc_svm_page_share) {
> +		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_page_share()\n");
> +		goto err;
> +	}
> +	if (!kvmppc_svm_backend->kvmppc_svm_init_abort) {
> +		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_init_abort()\n");
> +		goto err;
> +	}
> +	if (!kvmppc_svm_backend->kvmppc_svm_memslot_create) {
> +		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_memslot_create()\n");
> +		goto err;
> +	}
> +	if (!kvmppc_svm_backend->kvmppc_svm_memslot_delete) {
> +		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_memslot_delete()\n");
> +		goto err;
> +	}
> +	if (!kvmppc_svm_backend->kvmppc_svm_drop_pages) {
> +		pr_err("KVM-HV: kvmppc_svm_backend has no kvmppc_svm_drop_pages()\n");
> +		goto err;
> +	}

Do you really need to check each and every callback like above?
If so, may be the check can be optimized?

Regards,
Bharata.
