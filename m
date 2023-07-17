Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EC4755DE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 10:08:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eyn1bEtW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4F7k0Wj3z2yN0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 18:08:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eyn1bEtW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4F6r5qwLz2yGK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 18:07:16 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36H7kg05007367;
	Mon, 17 Jul 2023 08:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=xITvjzT9g3XvstpA3uEElVkGk4s6oFe09DTaR2+xwIg=;
 b=eyn1bEtW8R3+p25YWN7rnfUVSEY0DLsEvCo5m6EnAuCTT5isZknGPkGfHGY5946x1yoV
 5ZJ33oRQ6YK38BN2LoZ5DEO/uxe0ty0587Hlucge/R81UDYkzDcLSqK/yU/IMdooz0Ak
 +XKLXagnxE83BpjM4YiP9UosNhTNh21wsQ2YOaJ+vbDXb3ahLcwW9z+lQfdwqE29LM3c
 LOzfLJCdiIpdpyc2WBqOUHpW8lJcyJBBTBxnB9FqLMQDut+ycuzUnu38i6qE+MVfvgQ3
 2k7Eqq6Etz8PjiwrTiiWUQPuk+XZ/VQImlQ3y39HWK2VtokZf2nnk9SSkBa/+RfJH5DP mA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rw1j7rh5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 08:07:07 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36H7xFOu018439;
	Mon, 17 Jul 2023 08:07:06 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rw1j7rh52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 08:07:06 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36H3ehHE016244;
	Mon, 17 Jul 2023 08:07:05 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3ruk35hpxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 08:07:05 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36H8746S25494034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jul 2023 08:07:04 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4754758056;
	Mon, 17 Jul 2023 08:07:04 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4B8458060;
	Mon, 17 Jul 2023 08:07:00 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.109.212.144])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Jul 2023 08:07:00 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] KVM: ppc64: Enable ring-based dirty memory tracking
 on ppc64: enable config options and implement relevant functions
In-Reply-To: <20230717071208.1134783-1-kconsul@linux.vnet.ibm.com>
References: <20230717071208.1134783-1-kconsul@linux.vnet.ibm.com>
Date: Mon, 17 Jul 2023 13:36:58 +0530
Message-ID: <87pm4rarml.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nQNAlqLU-sTEJiZxt1rr2OtNIaj7kE_Q
X-Proofpoint-ORIG-GUID: zPMtmFIrGic2UyunelEsJMUS4ltseuET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_05,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0 mlxlogscore=761
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307170072
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
Cc: linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:

> - Enable CONFIG_HAVE_KVM_DIRTY_RING_ACQ_REL as ppc64 is weakly
>   ordered.
> - Enable CONFIG_NEED_KVM_DIRTY_RING_WITH_BITMAP because the
>   kvmppc_xive_native_set_attr is called in the context of an ioctl
>   syscall and will call kvmppc_xive_native_eq_sync for setting the
>   KVM_DEV_XIVE_EQ_SYNC attribute which will call mark_dirty_page()
>   when there isn't a running vcpu. Implemented the
>   kvm_arch_allow_write_without_running_vcpu to always return true
>   to allow mark_page_dirty_in_slot to mark the page dirty in the
>   memslot->dirty_bitmap in this case.
> - Set KVM_DIRTY_LOG_PAGE_OFFSET for the ring buffer's physical page
>   offset.
> - Implement the kvm_arch_mmu_enable_log_dirty_pt_masked function required
>   for the generic KVM code to call.
> - Add a check to kvmppc_vcpu_run_hv for checking whether the dirty
>   ring is soft full.
> - Implement the kvm_arch_flush_remote_tlbs_memslot function to support
>   the CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT config option.
>
> Test Results
> ============
> On testing with live migration it was found that there is around
> 150-180 ms improvment in overall migration time with this patch.
>
> Bare Metal P9 testing with patch:
> --------------------------------
> (qemu) info migrate
> globals:
> store-global-state: on
> only-migratable: off
> send-configuration: on
> send-section-footer: on
> decompress-error-check: on
> clear-bitmap-shift: 18
> Migration status: completed
> total time: 20694 ms
> downtime: 73 ms
> setup: 23 ms
> transferred ram: 2604370 kbytes
> throughput: 1033.55 mbps
> remaining ram: 0 kbytes
> total ram: 16777216 kbytes
> duplicate: 3555398 pages
> skipped: 0 pages
> normal: 642026 pages
> normal bytes: 2568104 kbytes
> dirty sync count: 3
> page size: 4 kbytes
> multifd bytes: 0 kbytes
> pages-per-second: 32455
> precopy ram: 2581549 kbytes
> downtime ram: 22820 kbytes
>
> Bare Metal P9 testing without patch:
> -----------------------------------
> (qemu) info migrate
> globals:
> store-global-state: on
> only-migratable: off
> send-configuration: on
> send-section-footer: on
> decompress-error-check: on
> clear-bitmap-shift: 18
> Migration status: completed
> total time: 20873 ms
> downtime: 62 ms
> setup: 19 ms
> transferred ram: 2612900 kbytes
> throughput: 1027.83 mbps
> remaining ram: 0 kbytes
> total ram: 16777216 kbytes
> duplicate: 3553329 pages
> skipped: 0 pages
> normal: 644159 pages
> normal bytes: 2576636 kbytes
> dirty sync count: 4
> page size: 4 kbytes
> multifd bytes: 0 kbytes
> pages-per-second: 88297
> precopy ram: 2603645 kbytes
> downtime ram: 9254 kbytes
>
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> ---
>  Documentation/virt/kvm/api.rst      |  2 +-
>  arch/powerpc/include/uapi/asm/kvm.h |  2 ++
>  arch/powerpc/kvm/Kconfig            |  2 ++
>  arch/powerpc/kvm/book3s.c           | 46 +++++++++++++++++++++++++++++
>  arch/powerpc/kvm/book3s_hv.c        |  3 ++
>  include/linux/kvm_dirty_ring.h      |  5 ++++
>  virt/kvm/dirty_ring.c               |  1 +
>  7 files changed, 60 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index c0ddd3035462..84c180ccd178 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -8114,7 +8114,7 @@ regardless of what has actually been exposed through the CPUID leaf.
>  8.29 KVM_CAP_DIRTY_LOG_RING/KVM_CAP_DIRTY_LOG_RING_ACQ_REL
>  ----------------------------------------------------------
>  
> -:Architectures: x86, arm64
> +:Architectures: x86, arm64, ppc64
>  :Parameters: args[0] - size of the dirty log ring
>  
>  KVM is capable of tracking dirty memory using ring buffers that are
> diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/uapi/asm/kvm.h
> index 9f18fa090f1f..f722309ed7fb 100644
> --- a/arch/powerpc/include/uapi/asm/kvm.h
> +++ b/arch/powerpc/include/uapi/asm/kvm.h
> @@ -33,6 +33,8 @@
>  /* Not always available, but if it is, this is the correct offset.  */
>  #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
>  
> +#define KVM_DIRTY_LOG_PAGE_OFFSET 64
> +
>  struct kvm_regs {
>  	__u64 pc;
>  	__u64 cr;
> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> index 902611954200..c93354ec3bd5 100644
> --- a/arch/powerpc/kvm/Kconfig
> +++ b/arch/powerpc/kvm/Kconfig
> @@ -26,6 +26,8 @@ config KVM
>  	select IRQ_BYPASS_MANAGER
>  	select HAVE_KVM_IRQ_BYPASS
>  	select INTERVAL_TREE
> +	select HAVE_KVM_DIRTY_RING_ACQ_REL
> +	select NEED_KVM_DIRTY_RING_WITH_BITMAP
>  
>  config KVM_BOOK3S_HANDLER
>  	bool
> diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
> index 686d8d9eda3e..01aa4fe2c424 100644
> --- a/arch/powerpc/kvm/book3s.c
> +++ b/arch/powerpc/kvm/book3s.c
> @@ -32,6 +32,7 @@
>  #include <asm/mmu_context.h>
>  #include <asm/page.h>
>  #include <asm/xive.h>
> +#include <asm/book3s/64/radix.h>
>  
>  #include "book3s.h"
>  #include "trace.h"
> @@ -1070,6 +1071,51 @@ int kvm_irq_map_chip_pin(struct kvm *kvm, unsigned irqchip, unsigned pin)
>  
>  #endif /* CONFIG_KVM_XICS */
>  
> +/*
> + * kvm_arch_mmu_enable_log_dirty_pt_masked - enable dirty logging for selected
> + * dirty pages.
> + *
> + * It write protects selected pages to enable dirty logging for them.
> + */
> +void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
> +					     struct kvm_memory_slot *slot,
> +					     gfn_t gfn_offset,
> +					     unsigned long mask)
> +{
> +	phys_addr_t base_gfn = slot->base_gfn + gfn_offset;
> +	phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
> +	phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
> +
> +	while (start < end) {
> +		pte_t *ptep;
> +		unsigned int shift;
> +
> +		ptep = find_kvm_secondary_pte(kvm, start, &shift);
> +
> +		if (radix_enabled())
> +			__radix_pte_update(ptep, _PAGE_WRITE, 0);
> +		else
> +			*ptep = __pte(pte_val(*ptep) & ~(_PAGE_WRITE));
> +
> +		start += PAGE_SIZE;
> +	}
>


I am not sure about that. You are walking partition scoped table here
and you are checking for hypervisor translation mode and doing pte
updates. That doesn't look correct.

-aneesh
