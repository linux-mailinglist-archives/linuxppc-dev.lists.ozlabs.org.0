Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 147B111DB16
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 01:24:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YryY2Pk6zDr5Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 11:24:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mdroth@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YrwS5rd1zDr4d
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 11:22:48 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBD0HCRE016056; Thu, 12 Dec 2019 19:22:25 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wuq3ws9jb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2019 19:22:25 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBD0HCll016119;
 Thu, 12 Dec 2019 19:22:25 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wuq3ws9j1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Dec 2019 19:22:24 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBD0M4LE028514;
 Fri, 13 Dec 2019 00:22:24 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 2wr3q7f0te-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2019 00:22:23 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBD0MMja49742194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Dec 2019 00:22:22 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38E6B6E050;
 Fri, 13 Dec 2019 00:22:22 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15E776E04C;
 Fri, 13 Dec 2019 00:22:21 +0000 (GMT)
Received: from localhost (unknown [9.53.179.218])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 13 Dec 2019 00:22:21 +0000 (GMT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Ram Pai <linuxram@us.ibm.com>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <20191212064502.GC5709@oc0525413822.ibm.com>
References: <1575681159-30356-1-git-send-email-linuxram@us.ibm.com>
 <1575681159-30356-2-git-send-email-linuxram@us.ibm.com>
 <1575681159-30356-3-git-send-email-linuxram@us.ibm.com>
 <157602860458.3810.8599908751067047456@sif>
 <20191212064502.GC5709@oc0525413822.ibm.com>
Message-ID: <157619635433.3810.2635705421787117448@sif>
User-Agent: alot/0.7
Subject: Re: [PATCH v5 2/2] powerpc/pseries/iommu: Use dma_iommu_ops for
 Secure VM.
Date: Thu, 12 Dec 2019 18:19:14 -0600
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-12_08:2019-12-12,2019-12-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912130001
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
Cc: andmike@us.ibm.com, mst@redhat.com, aik@ozlabs.ru,
 linux-kernel@vger.kernel.org, leonardo@linux.ibm.com, ram.n.pai@gmail.com,
 cai@lca.pw, tglx@linutronix.de, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Ram Pai (2019-12-12 00:45:02)
> On Tue, Dec 10, 2019 at 07:43:24PM -0600, Michael Roth wrote:
> > Quoting Ram Pai (2019-12-06 19:12:39)
> > > Commit edea902c1c1e ("powerpc/pseries/iommu: Don't use dma_iommu_ops =
on
> > >                 secure guests")
> > > disabled dma_iommu_ops path, for secure VMs. Disabling dma_iommu_ops
> > > path for secure VMs, helped enable dma_direct path.  This enabled
> > > support for bounce-buffering through SWIOTLB.  However it fails to
> > > operate when IOMMU is enabled, since I/O pages are not TCE mapped.
> > > =

> > > Renable dma_iommu_ops path for pseries Secure VMs.  It handles all
> > > cases including, TCE mapping I/O pages, in the presence of a
> > > IOMMU.
> > =

> > Wasn't clear to me at first, but I guess the main gist of this series is
> > that we want to continue to use SWIOTLB, but also need to create mappin=
gs
> > of it's bounce buffers in the IOMMU, so we revert to using dma_iommu_ops
> > and rely on the various dma_iommu_{map,alloc}_bypass() hooks throughout
> > to call into dma_direct_* ops rather than relying on the dma_is_direct(=
ops)
> > checks in DMA API functions to do the same.
> > =

> > That makes sense, but one issue I see with that is that
> > dma_iommu_map_bypass() only tests true if all the following are true:
> > =

> > 1) the device requests a 64-bit DMA mask via
> >    dma_set_mask/dma_set_coherent_mask
> > 2) DDW is enabled (i.e. we don't pass disable_ddw on command-line)
> > =

> > dma_is_direct() checks don't have this limitation, so I think for
> > anything cases, such as devices that use a smaller DMA mask, we'll
> > end up falling back to the non-bypass functions in dma_iommu_ops, which
> > will likely break for things like dma_alloc_coherent/dma_map_single
> > since they won't use SWIOTLB pages and won't do the necessary calls to
> > set_memory_unencrypted() to share those non-SWIOTLB buffers with
> > hypervisor.
> > =

> > Maybe that's ok, but I think we should be clearer about how to
> > fail/handle these cases.
> =

> Yes. makes sense. Device that cannot handle 64bit dma mask will not work.
> =

> > =

> > Though I also agree with some concerns Alexey stated earlier: it seems
> > wasteful to map the entire DDW window just so these bounce buffers can =
be
> > mapped.  Especially if you consider the lack of a mapping to be an addi=
tional
> > safe-guard against things like buggy device implementations on the QEMU
> > side. E.g. if we leaked pages to the hypervisor on accident, those pages
> > wouldn't be immediately accessible to a device, and would still require
> > additional work get past the IOMMU.
> =

> Well, an accidental unintented page leak to the hypervisor, is a very
> bad thing, regardless of any DMA mapping. The device may not be able to
> access it, but the hypervisor still can access it.

Agreed, but if IOMMU can provide additional isolation we should make use
of it when reasonable.

> =

> > =

> > What would it look like if we try to make all this work with disable_dd=
w passed
> > to kernel command-line (or forced for is_secure_guest())?
> > =

> >   1) dma_iommu_{alloc,map}_bypass() would no longer get us to dma_direc=
t_* ops,
> >      but an additional case or hook that considers is_secure_guest() mi=
ght do
> >      it.
> >      =

> >   2) We'd also need to set up an IOMMU mapping for the bounce buffers v=
ia
> >      io_tlb_start/io_tlb_end. We could do it once, on-demand via
> >      dma_iommu_bypass_supported() like we do for the 64-bit DDW window,=
 or
> >      maybe in some init function.
> =

> Hmm... i not sure how to accomplish (2).   we need use some DDW window
> to setup the mappings. right?  If disable_ddw is set, there wont be any
> ddw.  What am i missing?

We have 2 windows, the default 32-bit window that normally covers DMA addre=
sses
0..1GB, and an additional DDW window that's created on demand for 64-bit
devices (since they can address a full linear mapping of all guest
memory at DMA address 1<<59). Your current patch uses the latter, but we
could potentially use the 32-bit window since we only need to map the
SWIOTLB pages.

Not saying that's necessarily better, but one upside is it only requires
devices to support 32-bit DMA addressing, which is a larger class of
devices than those that support 64-bit (since 64-bit device drivers
generally have a 32-bit fallback). Required changes are a bit more
pervasive though.

It might make sense to get both scenarios working at some point, but
maybe it's okay to handle 64-bit first. 64-bit does give us more legroom
if we anticipate changes in where the SWIOTLB memory is allocated from,
or expect it to become larger than 1GB.

> =

> > =

> > That also has the benefit of not requiring devices to support 64-bit DM=
A.
> > =

> > Alternatively, we could continue to rely on the 64-bit DDW window, but
> > modify call to enable_ddw() to only map the io_tlb_start/end range in
> > the case of is_secure_guest(). This is a little cleaner implementation-=
wise
> > since we can rely on the existing dma_iommu_{alloc,map}_bypass() hooks.
> =

> I have been experimenting with this.  Trying to map only the memory
> range from io_tlb_start/io_tlb_end though the 64-bit ddw window.  But
> due to some reason, it wants the io_tlb_start to be aligned to some
> boundary. It looks like a 2^28 boundary. Not sure what dictates that
> boundary.

Not sure, but that might be related to 256MB LMB size. Could also be the pa=
ge
size of the DDW window, but seems large for that. In any case I think it wo=
uld
be okay if we needed to truncate io_tlb_start to a lower 256MB-boundary and=
 the
subsequent range. We have a few more mappings than strictly necessary, but =
it's
still better than all guest memory.

>    =

> =

> > , but
> > devices that don't support 64-bit will fail back to not using dma_direc=
t_* ops
> > and fail miserably. We'd probably want to handle that more gracefully.
> =

> Yes i will put a warning message to indicate the failure.
> =

> > =

> > Or we handle both cases gracefully. To me it makes more sense to enable
> > non-DDW case, then consider adding DDW case later if there's some reason
> > why 64-bit DMA is needed. But would be good to hear if there are other
> > opinions.
> =

> educate me a bit here. What is a non-DDW case?  is it possible for a
> device to acccess memory, in the presence of a IOMMU, without a window-ma=
pping?

It's not indeed, but we have the default 32-bit window for the non-DDW
case. See above.

> =

> > =

> > > =

> > > Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> > > ---
> > >  arch/powerpc/platforms/pseries/iommu.c | 11 +----------
> > >  1 file changed, 1 insertion(+), 10 deletions(-)
> > > =

> > > diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/pl=
atforms/pseries/iommu.c
> > > index 67b5009..4e27d66 100644
> > > --- a/arch/powerpc/platforms/pseries/iommu.c
> > > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > > @@ -36,7 +36,6 @@
> > >  #include <asm/udbg.h>
> > >  #include <asm/mmzone.h>
> > >  #include <asm/plpar_wrappers.h>
> > > -#include <asm/svm.h>
> > >  #include <asm/ultravisor.h>
> > > =

> > >  #include "pseries.h"
> > > @@ -1346,15 +1345,7 @@ void iommu_init_early_pSeries(void)
> > >         of_reconfig_notifier_register(&iommu_reconfig_nb);
> > >         register_memory_notifier(&iommu_mem_nb);
> > > =

> > > -       /*
> > > -        * Secure guest memory is inacessible to devices so regular D=
MA isn't
> > > -        * possible.
> > > -        *
> > > -        * In that case keep devices' dma_map_ops as NULL so that the=
 generic
> > > -        * DMA code path will use SWIOTLB to bounce buffers for DMA.
> > > -        */
> > > -       if (!is_secure_guest())
> > > -               set_pci_dma_ops(&dma_iommu_ops);
> > > +       set_pci_dma_ops(&dma_iommu_ops);
> > >  }
> > > =

> > >  static int __init disable_multitce(char *str)
> > > -- =

> > > 1.8.3.1
> > > =

> =

> -- =

> Ram Pai
