Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE08B1ED0BF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 15:27:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cV840WNlzDqNZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 23:27:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cV5q59k3zDq5k
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 23:25:35 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 053D4GO3046338; Wed, 3 Jun 2020 09:25:28 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31e3kqgp56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 09:25:27 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 053DKGN8007367;
 Wed, 3 Jun 2020 13:25:25 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 31bf4804ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 13:25:25 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 053DPM2P13042014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jun 2020 13:25:22 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A31142041;
 Wed,  3 Jun 2020 13:25:22 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 589CB42042;
 Wed,  3 Jun 2020 13:25:19 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.211.130.237])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  3 Jun 2020 13:25:19 +0000 (GMT)
Date: Wed, 3 Jun 2020 06:25:16 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v1 4/4] KVM: PPC: Book3S HV: migrate hot plugged memory
Message-ID: <20200603132516.GA5423@oc0525413822.ibm.com>
References: <1590892071-25549-1-git-send-email-linuxram@us.ibm.com>
 <1590892071-25549-5-git-send-email-linuxram@us.ibm.com>
 <1df25542-1977-fad4-c56d-b6b2c40a6852@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1df25542-1977-fad4-c56d-b6b2c40a6852@linux.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_12:2020-06-02,
 2020-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 cotscore=-2147483648 bulkscore=0 clxscore=1015 suspectscore=2 mlxscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 adultscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006030103
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org, bharata@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 02, 2020 at 10:31:32AM +0200, Laurent Dufour wrote:
> Le 31/05/2020 à 04:27, Ram Pai a écrit :
> >From: Laurent Dufour <ldufour@linux.ibm.com>
> >
> >When a memory slot is hot plugged to a SVM, GFNs associated with that
> >memory slot automatically default to secure GFN. Hence migrate the
> >PFNs associated with these GFNs to device-PFNs.
> >
> >uv_migrate_mem_slot() is called to achieve that. It will not call
> >UV_PAGE_IN since this request is ignored by the Ultravisor.
> >NOTE: Ultravisor does not trust any page content provided by
> >the Hypervisor, ones the VM turns secure.
> >
> >Cc: Paul Mackerras <paulus@ozlabs.org>
> >Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> >Cc: Michael Ellerman <mpe@ellerman.id.au>
> >Cc: Bharata B Rao <bharata@linux.ibm.com>
> >Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> >Cc: Laurent Dufour <ldufour@linux.ibm.com>
> >Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> >Cc: David Gibson <david@gibson.dropbear.id.au>
> >Cc: Claudio Carvalho <cclaudio@linux.ibm.com>
> >Cc: kvm-ppc@vger.kernel.org
> >Cc: linuxppc-dev@lists.ozlabs.org
> >Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> >	(fixed merge conflicts. Modified the commit message)
> >Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> >---
> >  arch/powerpc/include/asm/kvm_book3s_uvmem.h |  4 ++++
> >  arch/powerpc/kvm/book3s_hv.c                | 11 +++++++----
> >  arch/powerpc/kvm/book3s_hv_uvmem.c          |  3 +--
> >  3 files changed, 12 insertions(+), 6 deletions(-)
> >
> >diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> >index f0c5708..2ec2e5afb 100644
> >--- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> >+++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> >@@ -23,6 +23,7 @@ unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
> >  void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
> >  			     struct kvm *kvm, bool skip_page_out,
> >  			     bool purge_gfn);
> >+int uv_migrate_mem_slot(struct kvm *kvm, const struct kvm_memory_slot *memslot);
> >  #else
> >  static inline int kvmppc_uvmem_init(void)
> >  {
> >@@ -78,5 +79,8 @@ static inline int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
> >  kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
> >  			struct kvm *kvm, bool skip_page_out,
> >  			bool purge_gfn) { }
> >+
> >+static int uv_migrate_mem_slot(struct kvm *kvm,
> >+		const struct kvm_memory_slot *memslot);
> 
> That line was not part of the patch I sent to you!

Your patch is rebased on top of my patches. This prototype declaration
is for the ifndef CONFIG_PPC_UV   case.

> 
> 
> >  #endif /* CONFIG_PPC_UV */
> >  #endif /* __ASM_KVM_BOOK3S_UVMEM_H__ */
> >diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> >index 4c62bfe..604d062 100644
> >--- a/arch/powerpc/kvm/book3s_hv.c
> >+++ b/arch/powerpc/kvm/book3s_hv.c
> >@@ -4516,13 +4516,16 @@ static void kvmppc_core_commit_memory_region_hv(struct kvm *kvm,
> >  	case KVM_MR_CREATE:
> >  		if (kvmppc_uvmem_slot_init(kvm, new))
> >  			return;
> >-		uv_register_mem_slot(kvm->arch.lpid,
> >-				     new->base_gfn << PAGE_SHIFT,
> >-				     new->npages * PAGE_SIZE,
> >-				     0, new->id);
> >+		if (uv_register_mem_slot(kvm->arch.lpid,
> >+					 new->base_gfn << PAGE_SHIFT,
> >+					 new->npages * PAGE_SIZE,
> >+					 0, new->id))
> >+			return;
> >+		uv_migrate_mem_slot(kvm, new);
> >  		break;
> >  	case KVM_MR_DELETE:
> >  		uv_unregister_mem_slot(kvm->arch.lpid, old->id);
> >+		kvmppc_uvmem_drop_pages(old, kvm, true, true);
> 
> Again that line has been changed from the patch I sent to you. The
> last 'true' argument has nothing to do here.

yes. i did add another parameter to kvmppc_uvmem_drop_pages() in my
patch series. So had to adapt your patch to operate on top my mine.
> 
> Is that series really building?

yes. it built for me.

RP
