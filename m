Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E857311BDFE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 21:34:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y7v31mlHzDqwJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 07:34:07 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y7rg2BZZzDqwC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 07:31:59 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBBKGg5F041258; Wed, 11 Dec 2019 15:31:41 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wtcd27wv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 15:31:40 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBBKH57A042745;
 Wed, 11 Dec 2019 15:31:40 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wtcd27wur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 15:31:40 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBBKUwWM031040;
 Wed, 11 Dec 2019 20:31:39 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 2wr3q724u0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 20:31:39 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBBKVbKh41943518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Dec 2019 20:31:37 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70C5A13605D;
 Wed, 11 Dec 2019 20:31:37 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B510136053;
 Wed, 11 Dec 2019 20:31:37 +0000 (GMT)
Received: from localhost (unknown [9.53.179.218])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Dec 2019 20:31:37 +0000 (GMT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Ram Pai <linuxram@us.ibm.com>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <90f6019b-d756-7f33-21b0-bb49c1c842da@ozlabs.ru>
References: <1575681159-30356-1-git-send-email-linuxram@us.ibm.com>
 <1575681159-30356-2-git-send-email-linuxram@us.ibm.com>
 <ed0f048c-bb40-c6c6-887c-ef68c9e411a2@ozlabs.ru>
 <20191210051244.GB5702@oc0525413822.ibm.com>
 <c4b48f55-e4e3-222a-0aa0-9b4783e19584@ozlabs.ru>
 <20191210153542.GB5709@oc0525413822.ibm.com>
 <90f6019b-d756-7f33-21b0-bb49c1c842da@ozlabs.ru>
Message-ID: <157609629270.3810.9676234389583169255@sif>
User-Agent: alot/0.7
Subject: Re: [PATCH v5 1/2] powerpc/pseries/iommu: Share the per-cpu TCE page
 with the hypervisor.
Date: Wed, 11 Dec 2019 14:31:32 -0600
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_06:2019-12-11,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=8 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912110168
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
 leonardo@linux.ibm.com, ram.n.pai@gmail.com, cai@lca.pw, tglx@linutronix.de,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Alexey Kardashevskiy (2019-12-11 02:15:44)
> =

> =

> On 11/12/2019 02:35, Ram Pai wrote:
> > On Tue, Dec 10, 2019 at 04:32:10PM +1100, Alexey Kardashevskiy wrote:
> >>
> >>
> >> On 10/12/2019 16:12, Ram Pai wrote:
> >>> On Tue, Dec 10, 2019 at 02:07:36PM +1100, Alexey Kardashevskiy wrote:
> >>>>
> >>>>
> >>>> On 07/12/2019 12:12, Ram Pai wrote:
> >>>>> H_PUT_TCE_INDIRECT hcall uses a page filled with TCE entries, as on=
e of
> >>>>> its parameters.  On secure VMs, hypervisor cannot access the conten=
ts of
> >>>>> this page since it gets encrypted.  Hence share the page with the
> >>>>> hypervisor, and unshare when done.
> >>>>
> >>>>
> >>>> I thought the idea was to use H_PUT_TCE and avoid sharing any extra
> >>>> pages. There is small problem that when DDW is enabled,
> >>>> FW_FEATURE_MULTITCE is ignored (easy to fix); I also noticed complai=
ns
> >>>> about the performance on slack but this is caused by initial cleanup=
 of
> >>>> the default TCE window (which we do not use anyway) and to battle th=
is
> >>>> we can simply reduce its size by adding
> >>>
> >>> something that takes hardly any time with H_PUT_TCE_INDIRECT,  takes
> >>> 13secs per device for H_PUT_TCE approach, during boot. This is with a
> >>> 30GB guest. With larger guest, the time will further detoriate.
> >>
> >>
> >> No it will not, I checked. The time is the same for 2GB and 32GB guest=
s-
> >> the delay is caused by clearing the small DMA window which is small by
> >> the space mapped (1GB) but quite huge in TCEs as it uses 4K pages; and
> >> for DDW window + emulated devices the IOMMU page size will be 2M/16M/1G
> >> (depends on the system) so the number of TCEs is much smaller.
> > =

> > I cant get your results.  What changes did you make to get it?
> =

> =

> Get what? I passed "-m 2G" and "-m 32G", got the same time - 13s spent
> in clearing the default window and the huge window took a fraction of a
> second to create and map.

Is this if we disable FW_FEATURE_MULTITCE in the guest and force the use
of H_PUT_TCE everywhere?

In theory couldn't we leave FW_FEATURE_MULTITCE in place so that
iommu_table_clear() can still use H_STUFF_TCE (which I guess is basically
instant), and then force H_PUT_TCE for new mappings via something like:

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platform=
s/pseries/iommu.c
index 6ba081dd61c9..85d092baf17d 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -194,6 +194,7 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table =
*tbl, long tcenum,
        unsigned long flags;
 =

        if ((npages =3D=3D 1) || !firmware_has_feature(FW_FEATURE_MULTITCE)=
) {
+       if ((npages =3D=3D 1) || !firmware_has_feature(FW_FEATURE_MULTITCE)=
 || is_secure_guest()) {
                return tce_build_pSeriesLP(tbl, tcenum, npages, uaddr,
                                           direction, attrs);
        }

That seems like it would avoid the extra 13s.

If we take the additional step of only mapping SWIOTLB range in
enable_ddw() for is_secure_guest() that might further improve things
(though the bigger motivation with that is the extra isolation it would
grant us for stuff behind the IOMMU, since it apparently doesn't affect
boot-time all that much)

> =

> =

> >>>>
> >>>> -global
> >>>> spapr-pci-host-bridge.dma_win_size=3D0x4000000
> >>>
> >>> This option, speeds it up tremendously.  But than should this option =
be
> >>> enabled in qemu by default?  only for secure VMs? for both VMs?
> >>
> >>
> >> As discussed in slack, by default we do not need to clear the entire T=
CE
> >> table and we only have to map swiotlb buffer using the small window. It
> >> is a guest kernel change only. Thanks,
> > =

> > Can you tell me what code you are talking about here.  Where is the TCE
> > table getting cleared? What code needs to be changed to not clear it?
> =

> =

> pci_dma_bus_setup_pSeriesLP()
>         iommu_init_table()
>                 iommu_table_clear()
>                         for () tbl->it_ops->get()
> =

> We do not really need to clear it there, we only need it for VFIO with
> IOMMU SPAPR TCE v1 which reuses these tables but there are
> iommu_take_ownership/iommu_release_ownership to clear these tables. I'll
> send a patch for this.


> =

> =

> > Is the code in tce_buildmulti_pSeriesLP(), the one that does the clear
> > aswell?
> =

> =

> This one does not need to clear TCEs as this creates a window of known
> size and maps it all.
> =

> Well, actually, it only maps actual guest RAM, if there are gaps in RAM,
> then TCEs for the gaps will have what hypervisor had there (which is
> zeroes, qemu/kvm clears it anyway).
> =

> =

> > But before I close, you have not told me clearly, what is the problem
> > with;  'share the page, make the H_PUT_INDIRECT_TCE hcall, unshare the =
page'.
> =

> Between share and unshare you have a (tiny) window of opportunity to
> attack the guest. No, I do not know how exactly.
> =

> For example, the hypervisor does a lot of PHB+PCI hotplug-unplug with
> 64bit devices - each time this will create a huge window which will
> share/unshare the same page.  No, I do not know how exactly how this can
> be exploited either, we cannot rely of what you or myself know today. My
> point is that we should not be sharing pages at all unless we really
> really have to, and this does not seem to be the case.
> =

> But since this seems to an acceptable compromise anyway,
> =

> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> =

> =

> =

> =

> =

> > Remember this is the same page that is earmarked for doing
> > H_PUT_INDIRECT_TCE, not by my patch, but its already earmarked by the
> > existing code. So it not some random buffer that is picked. Second =

> > this page is temporarily shared and unshared, it does not stay shared
> > for life.  It does not slow the boot. it does not need any
> > special command line options on the qemu.
> >> Shared pages technology was put in place, exactly for the purpose of
> > sharing data with the hypervisor.  We are using this technology exactly
> > for that purpose.  And finally I agreed with your concern of having
> > shared pages staying around.  Hence i addressed that concern, by
> > unsharing the page.  At this point, I fail to understand your concern.
> =

> =

> =

> =

> -- =

> Alexey
