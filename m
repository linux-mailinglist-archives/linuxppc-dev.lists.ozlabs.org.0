Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C42CA1333
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 10:02:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jw7c26SyzDrBv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 18:02:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jw513WQczDqWy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 18:00:04 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7T7xtCk034709
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 04:00:01 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2up9f52pjt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 04:00:00 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Thu, 29 Aug 2019 08:57:57 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 29 Aug 2019 08:57:55 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7T7vr9045416700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 07:57:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95EF842042;
 Thu, 29 Aug 2019 07:57:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA5324204C;
 Thu, 29 Aug 2019 07:57:51 +0000 (GMT)
Received: from in.ibm.com (unknown [9.124.35.109])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 29 Aug 2019 07:57:51 +0000 (GMT)
Date: Thu, 29 Aug 2019 13:27:49 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Subject: Re: [PATCH v7 5/7] kvmppc: Radix changes for secure guest
References: <20190822102620.21897-1-bharata@linux.ibm.com>
 <20190822102620.21897-6-bharata@linux.ibm.com>
 <20190829030552.GA17673@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829030552.GA17673@us.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 19082907-0008-0000-0000-0000030E8B2E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082907-0009-0000-0000-00004A2CCDFA
Message-Id: <20190829075749.GC31913@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-29_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908290087
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 28, 2019 at 08:05:52PM -0700, Sukadev Bhattiprolu wrote:
> > - After the guest becomes secure, when we handle a page fault of a page
> >   belonging to SVM in HV, send that page to UV via UV_PAGE_IN.
> > - Whenever a page is unmapped on the HV side, inform UV via UV_PAGE_INVAL.
> > - Ensure all those routines that walk the secondary page tables of
> >   the guest don't do so in case of secure VM. For secure guest, the
> >   active secondary page tables are in secure memory and the secondary
> >   page tables in HV are freed when guest becomes secure.
> > 
> > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/kvm_host.h       | 12 ++++++++++++
> >  arch/powerpc/include/asm/ultravisor-api.h |  1 +
> >  arch/powerpc/include/asm/ultravisor.h     |  5 +++++
> >  arch/powerpc/kvm/book3s_64_mmu_radix.c    | 22 ++++++++++++++++++++++
> >  arch/powerpc/kvm/book3s_hv_devm.c         | 20 ++++++++++++++++++++
> >  5 files changed, 60 insertions(+)
> > 
> > diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> > index 66e5cc8c9759..29333e8de1c4 100644
> > --- a/arch/powerpc/include/asm/kvm_host.h
> > +++ b/arch/powerpc/include/asm/kvm_host.h
> > @@ -867,6 +867,8 @@ static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
> >  #ifdef CONFIG_PPC_UV
> >  extern int kvmppc_devm_init(void);
> >  extern void kvmppc_devm_free(void);
> > +extern bool kvmppc_is_guest_secure(struct kvm *kvm);
> > +extern int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gpa);
> >  #else
> >  static inline int kvmppc_devm_init(void)
> >  {
> > @@ -874,6 +876,16 @@ static inline int kvmppc_devm_init(void)
> >  }
> > 
> >  static inline void kvmppc_devm_free(void) {}
> > +
> > +static inline bool kvmppc_is_guest_secure(struct kvm *kvm)
> > +{
> > +	return false;
> > +}
> > +
> > +static inline int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gpa)
> > +{
> > +	return -EFAULT;
> > +}
> >  #endif /* CONFIG_PPC_UV */
> > 
> >  #endif /* __POWERPC_KVM_HOST_H__ */
> > diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
> > index 46b1ee381695..cf200d4ce703 100644
> > --- a/arch/powerpc/include/asm/ultravisor-api.h
> > +++ b/arch/powerpc/include/asm/ultravisor-api.h
> > @@ -29,5 +29,6 @@
> >  #define UV_UNREGISTER_MEM_SLOT		0xF124
> >  #define UV_PAGE_IN			0xF128
> >  #define UV_PAGE_OUT			0xF12C
> > +#define UV_PAGE_INVAL			0xF138
> > 
> >  #endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
> > diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
> > index 719c0c3930b9..b333241bbe4c 100644
> > --- a/arch/powerpc/include/asm/ultravisor.h
> > +++ b/arch/powerpc/include/asm/ultravisor.h
> > @@ -57,4 +57,9 @@ static inline int uv_unregister_mem_slot(u64 lpid, u64 slotid)
> >  	return ucall_norets(UV_UNREGISTER_MEM_SLOT, lpid, slotid);
> >  }
> > 
> > +static inline int uv_page_inval(u64 lpid, u64 gpa, u64 page_shift)
> > +{
> > +	return ucall_norets(UV_PAGE_INVAL, lpid, gpa, page_shift);
> > +}
> > +
> >  #endif	/* _ASM_POWERPC_ULTRAVISOR_H */
> > diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> > index 2d415c36a61d..93ad34e63045 100644
> > --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> > +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> > @@ -19,6 +19,8 @@
> >  #include <asm/pgtable.h>
> >  #include <asm/pgalloc.h>
> >  #include <asm/pte-walk.h>
> > +#include <asm/ultravisor.h>
> > +#include <asm/kvm_host.h>
> > 
> >  /*
> >   * Supported radix tree geometry.
> > @@ -915,6 +917,9 @@ int kvmppc_book3s_radix_page_fault(struct kvm_run *run, struct kvm_vcpu *vcpu,
> >  	if (!(dsisr & DSISR_PRTABLE_FAULT))
> >  		gpa |= ea & 0xfff;
> > 
> > +	if (kvmppc_is_guest_secure(kvm))
> > +		return kvmppc_send_page_to_uv(kvm, gpa & PAGE_MASK);
> > +
> >  	/* Get the corresponding memslot */
> >  	memslot = gfn_to_memslot(kvm, gfn);
> > 
> > @@ -972,6 +977,11 @@ int kvm_unmap_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
> >  	unsigned long gpa = gfn << PAGE_SHIFT;
> >  	unsigned int shift;
> > 
> > +	if (kvmppc_is_guest_secure(kvm)) {
> > +		uv_page_inval(kvm->arch.lpid, gpa, PAGE_SIZE);
> > +		return 0;
> > +	}
> 
> If it is a page we share with UV, won't we need to drop the HV mapping
> for the page?

I believe we come here via MMU notifies only after dropping HV mapping.

Regards,
Bharata.

