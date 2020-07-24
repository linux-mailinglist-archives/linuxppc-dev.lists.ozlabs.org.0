Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6880E22BD0F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 06:29:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCbp44NMQzDrFl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 14:29:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCbm722VTzDrhc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 14:28:07 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06O41fPb074478; Fri, 24 Jul 2020 00:27:55 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32faj75ycv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 00:27:55 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06O4OqVI026173;
 Fri, 24 Jul 2020 04:27:53 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 32brq86vhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 04:27:53 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06O4Rpen61735020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jul 2020 04:27:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FF82AE04D;
 Fri, 24 Jul 2020 04:27:51 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4537AE05D;
 Fri, 24 Jul 2020 04:27:48 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.85.193])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 24 Jul 2020 04:27:48 +0000 (GMT)
Date: Fri, 24 Jul 2020 09:57:46 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH v5 4/7] KVM: PPC: Book3S HV: in H_SVM_INIT_DONE, migrate
 remaining normal-GFNs to secure-GFNs.
Message-ID: <20200724042746.GD1082478@in.ibm.com>
References: <1595534844-16188-1-git-send-email-linuxram@us.ibm.com>
 <1595534844-16188-5-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595534844-16188-5-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_20:2020-07-23,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 suspectscore=5 bulkscore=0 adultscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007240024
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
Cc: ldufour@linux.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 sathnaga@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 23, 2020 at 01:07:21PM -0700, Ram Pai wrote:
> The Ultravisor is expected to explicitly call H_SVM_PAGE_IN for all the
> pages of the SVM before calling H_SVM_INIT_DONE. This causes a huge
> delay in tranistioning the VM to SVM. The Ultravisor is only interested
> in the pages that contain the kernel, initrd and other important data
> structures. The rest contain throw-away content.
> 
> However if not all pages are requested by the Ultravisor, the Hypervisor
> continues to consider the GFNs corresponding to the non-requested pages
> as normal GFNs. This can lead to data-corruption and undefined behavior.
> 
> In H_SVM_INIT_DONE handler, move all the PFNs associated with the SVM's
> GFNs to secure-PFNs. Skip the GFNs that are already Paged-in or Shared
> or Paged-in followed by a Paged-out.
> 
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Bharata B Rao <bharata@linux.ibm.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Claudio Carvalho <cclaudio@linux.ibm.com>
> Cc: kvm-ppc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> ---
>  Documentation/powerpc/ultravisor.rst        |   2 +
>  arch/powerpc/include/asm/kvm_book3s_uvmem.h |   2 +
>  arch/powerpc/kvm/book3s_hv_uvmem.c          | 136 +++++++++++++++++++++++++---
>  3 files changed, 127 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/powerpc/ultravisor.rst b/Documentation/powerpc/ultravisor.rst
> index a1c8c37..ba6b1bf 100644
> --- a/Documentation/powerpc/ultravisor.rst
> +++ b/Documentation/powerpc/ultravisor.rst
> @@ -934,6 +934,8 @@ Return values
>  	* H_UNSUPPORTED		if called from the wrong context (e.g.
>  				from an SVM or before an H_SVM_INIT_START
>  				hypercall).
> +	* H_STATE		if the hypervisor could not successfully
> +                                transition the VM to Secure VM.
>  
>  Description
>  ~~~~~~~~~~~
> diff --git a/arch/powerpc/include/asm/kvm_book3s_uvmem.h b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> index 9cb7d8b..f229ab5 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_uvmem.h
> @@ -23,6 +23,8 @@ unsigned long kvmppc_h_svm_page_out(struct kvm *kvm,
>  unsigned long kvmppc_h_svm_init_abort(struct kvm *kvm);
>  void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
>  			     struct kvm *kvm, bool skip_page_out);
> +int kvmppc_uv_migrate_mem_slot(struct kvm *kvm,
> +			const struct kvm_memory_slot *memslot);

I still don't see why this be a global function. You should be able
to move around a few functions in book3s_hv_uvmem.c up/down and
satisfy the calling order dependencies.

Otherwise, Reviewed-by: Bharata B Rao <bharata@linux.ibm.com>
