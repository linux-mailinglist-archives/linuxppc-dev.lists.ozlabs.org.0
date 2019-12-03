Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A6710F4D3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 03:11:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Rlp20FTvzDqND
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 13:11:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Rllm4zsFzDqN1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 13:09:08 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB327NZs106517
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Dec 2019 21:09:04 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wm6uyxjge-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2019 21:09:04 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Tue, 3 Dec 2019 02:09:02 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Dec 2019 02:08:58 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB328vHp56230038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Dec 2019 02:08:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 538F311C052;
 Tue,  3 Dec 2019 02:08:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7644211C04C;
 Tue,  3 Dec 2019 02:08:53 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.173.229])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  3 Dec 2019 02:08:53 +0000 (GMT)
Date: Mon, 2 Dec 2019 18:08:50 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1575269124-17885-1-git-send-email-linuxram@us.ibm.com>
 <1575269124-17885-2-git-send-email-linuxram@us.ibm.com>
 <f08ace25-fa94-990b-1b6d-a1c0f30d6348@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f08ace25-fa94-990b-1b6d-a1c0f30d6348@ozlabs.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19120302-0028-0000-0000-000003C3C298
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120302-0029-0000-0000-00002486DA25
Message-Id: <20191203020850.GA12354@oc0525413822.ibm.com>
Subject: RE: [PATCH v4 1/2] powerpc/pseries/iommu: Share the per-cpu TCE page
 with the hypervisor.
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-02_06:2019-11-29,2019-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=48 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912030018
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
Cc: andmike@us.ibm.com, mst@redhat.com, mdroth@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, ram.n.pai@gmail.com, cai@lca.pw,
 tglx@linutronix.de, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de, bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 03, 2019 at 11:56:43AM +1100, Alexey Kardashevskiy wrote:
> 
> 
> On 02/12/2019 17:45, Ram Pai wrote:
> > H_PUT_TCE_INDIRECT hcall uses a page filled with TCE entries, as one of
> > its parameters. One page is dedicated per cpu, for the lifetime of the
> > kernel for this purpose. On secure VMs, contents of this page, when
> > accessed by the hypervisor, retrieves encrypted TCE entries.  Hypervisor
> > needs to know the unencrypted entries, to update the TCE table
> > accordingly.  There is nothing secret or sensitive about these entries.
> > Hence share the page with the hypervisor.
> 
> This unsecures a page in the guest in a random place which creates an
> additional attack surface which is hard to exploit indeed but
> nevertheless it is there.
> A safer option would be not to use the
> hcall-multi-tce hyperrtas option (which translates FW_FEATURE_MULTITCE
> in the guest).


Hmm... How do we not use it?  AFAICT hcall-multi-tce option gets invoked
automatically when IOMMU option is enabled.  This happens even
on a normal VM when IOMMU is enabled. 


> 
> Also what is this for anyway? 

This is for sending indirect-TCE entries to the hypervisor.
The hypervisor must be able to read those TCE entries, so that it can 
use those entires to populate the TCE table with the correct mappings.

> if I understand things right, you cannot
> map any random guest memory, you should only be mapping that 64MB-ish
> bounce buffer array but 1) I do not see that happening (I may have
> missed it) 2) it should be done once and it takes a little time for
> whatever memory size we allow for bounce buffers anyway. Thanks,

Any random guest memory can be shared by the guest. 

Maybe you are confusing this with the SWIOTLB bounce buffers used by PCI
devices, to transfer data to the hypervisor?

> 
> 
> > 
> > Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/iommu.c | 23 ++++++++++++++++++++---
> >  1 file changed, 20 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> > index 6ba081d..0720831 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -37,6 +37,7 @@
> >  #include <asm/mmzone.h>
> >  #include <asm/plpar_wrappers.h>
> >  #include <asm/svm.h>
> > +#include <asm/ultravisor.h>
> >  
> >  #include "pseries.h"
> >  
> > @@ -179,6 +180,23 @@ static int tce_build_pSeriesLP(struct iommu_table *tbl, long tcenum,
> >  
> >  static DEFINE_PER_CPU(__be64 *, tce_page);
> >  
> > +/*
> > + * Allocate a tce page.  If secure VM, share the page with the hypervisor.
> > + *
> > + * NOTE: the TCE page is shared with the hypervisor explicitly and remains
> > + * shared for the lifetime of the kernel. It is implicitly unshared at kernel
> > + * shutdown through a UV_UNSHARE_ALL_PAGES ucall.
> > + */
> > +static __be64 *alloc_tce_page(void)
> > +{
> > +	__be64 *tcep = (__be64 *)__get_free_page(GFP_ATOMIC);
> > +
> > +	if (tcep && is_secure_guest())
> > +		uv_share_page(PHYS_PFN(__pa(tcep)), 1);
> > +
> > +	return tcep;
> > +}
> > +
> >  static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
> >  				     long npages, unsigned long uaddr,
> >  				     enum dma_data_direction direction,
> > @@ -206,8 +224,7 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
> >  	 * from iommu_alloc{,_sg}()
> >  	 */
> >  	if (!tcep) {
> > -		tcep = (__be64 *)__get_free_page(GFP_ATOMIC);
> > -		/* If allocation fails, fall back to the loop implementation */
> > +		tcep = alloc_tce_page();
> >  		if (!tcep) {
> >  			local_irq_restore(flags);
> >  			return tce_build_pSeriesLP(tbl, tcenum, npages, uaddr,
> > @@ -405,7 +422,7 @@ static int tce_setrange_multi_pSeriesLP(unsigned long start_pfn,
> >  	tcep = __this_cpu_read(tce_page);
> >  
> >  	if (!tcep) {
> > -		tcep = (__be64 *)__get_free_page(GFP_ATOMIC);
> > +		tcep = alloc_tce_page();
> >  		if (!tcep) {
> >  			local_irq_enable();
> >  			return -ENOMEM;
> > 
> 
> -- 
> Alexey

-- 
Ram Pai

