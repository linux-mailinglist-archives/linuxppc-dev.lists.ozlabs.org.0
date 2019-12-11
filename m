Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C62311BC14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 19:45:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y5Tb5289zDqm6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 05:45:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mdroth@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y4fG5tPLzDqHP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 05:07:50 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBBI3ic3057577; Wed, 11 Dec 2019 13:07:25 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wtdp4pndd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 13:07:24 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBBI3fqM057210;
 Wed, 11 Dec 2019 13:07:24 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wtdp4pncj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 13:07:23 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBBI6iCN029621;
 Wed, 11 Dec 2019 18:07:22 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 2wr3q7rj70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 18:07:22 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBBI7LHV31850982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Dec 2019 18:07:21 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63283124052;
 Wed, 11 Dec 2019 18:07:21 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38D2E12405C;
 Wed, 11 Dec 2019 18:07:21 +0000 (GMT)
Received: from localhost (unknown [9.53.179.218])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 11 Dec 2019 18:07:21 +0000 (GMT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Ram Pai <linuxram@us.ibm.com>,
 mpe@ellerman.id.au
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <be36117d-204e-bf59-287a-371103186e16@ozlabs.ru>
References: <1575681159-30356-1-git-send-email-linuxram@us.ibm.com>
 <1575681159-30356-2-git-send-email-linuxram@us.ibm.com>
 <1575681159-30356-3-git-send-email-linuxram@us.ibm.com>
 <157602860458.3810.8599908751067047456@sif>
 <be36117d-204e-bf59-287a-371103186e16@ozlabs.ru>
Message-ID: <157608763756.3810.12346253559039287143@sif>
User-Agent: alot/0.7
Subject: Re: [PATCH v5 2/2] powerpc/pseries/iommu: Use dma_iommu_ops for
 Secure VM.
Date: Wed, 11 Dec 2019 12:07:17 -0600
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_05:2019-12-11,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=8
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912110150
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
Cc: andmike@us.ibm.com, mst@redhat.com, linux-kernel@vger.kernel.org,
 ram.n.pai@gmail.com, leonardo@linux.ibm.com, cai@lca.pw, tglx@linutronix.de,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Alexey Kardashevskiy (2019-12-11 02:36:29)
> =

> =

> On 11/12/2019 12:43, Michael Roth wrote:
> > Quoting Ram Pai (2019-12-06 19:12:39)
> >> Commit edea902c1c1e ("powerpc/pseries/iommu: Don't use dma_iommu_ops on
> >>                 secure guests")
> >> disabled dma_iommu_ops path, for secure VMs. Disabling dma_iommu_ops
> >> path for secure VMs, helped enable dma_direct path.  This enabled
> >> support for bounce-buffering through SWIOTLB.  However it fails to
> >> operate when IOMMU is enabled, since I/O pages are not TCE mapped.
> >>
> >> Renable dma_iommu_ops path for pseries Secure VMs.  It handles all
> >> cases including, TCE mapping I/O pages, in the presence of a
> >> IOMMU.
> > =

> > Wasn't clear to me at first, but I guess the main gist of this series is
> > that we want to continue to use SWIOTLB, but also need to create mappin=
gs
> > of it's bounce buffers in the IOMMU, so we revert to using dma_iommu_ops
> > and rely on the various dma_iommu_{map,alloc}_bypass() hooks throughout
> > to call into dma_direct_* ops rather than relying on the dma_is_direct(=
ops)
> > checks in DMA API functions to do the same.
> =

> =

> Correct. Took me a bit of time to realize what we got here :) We only
> rely on  dma_iommu_ops::.dma_supported to write the DMA offset to a
> device (when creating a huge window), and after that we know it is
> mapped directly and swiotlb gets this 1<<59 offset via __phys_to_dma().
> =

> =

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

> =

> io_tlb_start/io_tlb_end are only guaranteed to stay within 4GB and our
> default DMA window is 1GB (KVM) or 2GB (PowerVM), ok, we can define
> ARCH_LOW_ADDRESS_LIMIT as 1GB.

True, and limiting allocations to under 1GB might be brittle (also saw a
patching floating around that increased IO_TLB_DEFAULT_SIZE size to 1GB,
which obviously wouldn't work out with this approach, but not sure if
that's still needed or not: "powerpc/svm: Increase SWIOTLB buffer size")

However that's only an issue if we insist on using an identity mapping
in the IOMMU, which would be nice because non-IOMMU virtio would
magically work, but since that's not a goal of this series I think we do
have the option of mapping io_tlb_start at DMA address 0 (or
thereabouts).

We'd probably need to modify __phys_to_dma to treat archdata.dma_offset
as a negative offset in this case, but it seems like it would work about
the same as with DDW offset.

But yah, it does make things a bit less appealing than what I was initially
thinking with that approach...

> =

> But it has also been mentioned that we are likely to be having swiotlb
> buffers outside of the first 4GB as they are not just for crippled
> devices any more. So we are likely to have 64bit window, I'd just ditch
> the default window then, I have patches for this but every time I
> thought I have a use case, turned out that I did not.

Not sure I've seen this discussion, maybe it was on slack? By crippled
devices do you mean virtio with IOMMU off? Isn't swiotlb buffer limited
to under ARCH_LOW_ADDRESS_LIMIT in any case? Just trying to understand
what changes we're anticipating there.

> =

> =

> > That also has the benefit of not requiring devices to support 64-bit DM=
A.
> > =

> > Alternatively, we could continue to rely on the 64-bit DDW window, but
> > modify call to enable_ddw() to only map the io_tlb_start/end range in
> > the case of is_secure_guest(). This is a little cleaner implementation-=
wise
> > since we can rely on the existing dma_iommu_{alloc,map}_bypass() hooks,=
 but
> > devices that don't support 64-bit will fail back to not using dma_direc=
t_* ops
> > and fail miserably. We'd probably want to handle that more gracefully.
> > =

> > Or we handle both cases gracefully. To me it makes more sense to enable
> > non-DDW case, then consider adding DDW case later if there's some reason
> > why 64-bit DMA is needed. But would be good to hear if there are other
> > opinions.
> =

> =

> For now we need to do something with the H_PUT_TCE_INDIRECT's page -
> either disable multitce (but boot time increases) or share the page. The
> patch does the latter. Thanks,

I was sort of hoping the option of only mapping the bounce buffer (or
avoiding DDW completely) would help here, but looks like the issue has
more to do with clearing the default TCE table. Fair enough.

Reverting to dma_iommu_ops does re-introduce some new failure paths for
non 64-bit devices though, so I think it would be good to address that
as part of this series. I think it would be sufficient to have
dma_set_mask/dma_set_coherent_mask/dma_set_mask_and_coherent fail for
non 64-bit masks. I think something like the following in
dma_iommu_dma_supported() might do it:

  /*
   * Secure guests currently rely on 64-bit DMA window, which is only
   * utilized for devices that support 64-bit DMA masks
   */
  if (is_secure_guest() && mask < DMA_BIT_MASK(64)) {
    dev_err(dev, "Warning: 64-bit DMA required when PEF enabled: mask 0x%08=
llx", mask);
    return 0;
  }
    =

That should let most drivers fail gracefully and make it clear what devices
are broken (rather than silently misbehaving). It also makes things a bit
clearer WRT what we expect to work with this applied. =


> =

> =

> > =

> >>
> >> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> >> ---
> >>  arch/powerpc/platforms/pseries/iommu.c | 11 +----------
> >>  1 file changed, 1 insertion(+), 10 deletions(-)
> >>
> >> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/pla=
tforms/pseries/iommu.c
> >> index 67b5009..4e27d66 100644
> >> --- a/arch/powerpc/platforms/pseries/iommu.c
> >> +++ b/arch/powerpc/platforms/pseries/iommu.c
> >> @@ -36,7 +36,6 @@
> >>  #include <asm/udbg.h>
> >>  #include <asm/mmzone.h>
> >>  #include <asm/plpar_wrappers.h>
> >> -#include <asm/svm.h>
> >>  #include <asm/ultravisor.h>
> >>
> >>  #include "pseries.h"
> >> @@ -1346,15 +1345,7 @@ void iommu_init_early_pSeries(void)
> >>         of_reconfig_notifier_register(&iommu_reconfig_nb);
> >>         register_memory_notifier(&iommu_mem_nb);
> >>
> >> -       /*
> >> -        * Secure guest memory is inacessible to devices so regular DM=
A isn't
> >> -        * possible.
> >> -        *
> >> -        * In that case keep devices' dma_map_ops as NULL so that the =
generic
> >> -        * DMA code path will use SWIOTLB to bounce buffers for DMA.
> >> -        */
> >> -       if (!is_secure_guest())
> >> -               set_pci_dma_ops(&dma_iommu_ops);
> >> +       set_pci_dma_ops(&dma_iommu_ops);
> >>  }
> >>
> >>  static int __init disable_multitce(char *str)
> >> -- =

> >> 1.8.3.1
> >>
> =

> -- =

> Alexey
