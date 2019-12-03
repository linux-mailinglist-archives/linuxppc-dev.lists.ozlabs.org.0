Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D497210F66D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 05:56:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RqT30G4SzDq9K
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 15:56:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RpL04Ck0zDqQf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 15:05:28 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB341sUU005535
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Dec 2019 23:05:25 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wm6rr135t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2019 23:05:25 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Tue, 3 Dec 2019 04:05:23 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Dec 2019 04:05:18 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB345HpG37355640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Dec 2019 04:05:17 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 891994C05C;
 Tue,  3 Dec 2019 04:05:17 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9B844C046;
 Tue,  3 Dec 2019 04:05:13 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.173.229])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  3 Dec 2019 04:05:13 +0000 (GMT)
Date: Mon, 2 Dec 2019 20:05:09 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1575269124-17885-1-git-send-email-linuxram@us.ibm.com>
 <1575269124-17885-2-git-send-email-linuxram@us.ibm.com>
 <f08ace25-fa94-990b-1b6d-a1c0f30d6348@ozlabs.ru>
 <20191203020850.GA12354@oc0525413822.ibm.com>
 <0b56ce3e-6c32-5f3b-e7cc-0d419a61d71d@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b56ce3e-6c32-5f3b-e7cc-0d419a61d71d@ozlabs.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19120304-4275-0000-0000-0000038A335C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120304-4276-0000-0000-0000389DCF51
Message-Id: <20191203040509.GB12354@oc0525413822.ibm.com>
Subject: RE: [PATCH v4 1/2] powerpc/pseries/iommu: Share the per-cpu TCE page
 with the hypervisor.
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-02_06:2019-11-29,2019-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=18 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912030034
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

On Tue, Dec 03, 2019 at 01:15:04PM +1100, Alexey Kardashevskiy wrote:
> 
> 
> On 03/12/2019 13:08, Ram Pai wrote:
> > On Tue, Dec 03, 2019 at 11:56:43AM +1100, Alexey Kardashevskiy wrote:
> >>
> >>
> >> On 02/12/2019 17:45, Ram Pai wrote:
> >>> H_PUT_TCE_INDIRECT hcall uses a page filled with TCE entries, as one of
> >>> its parameters. One page is dedicated per cpu, for the lifetime of the
> >>> kernel for this purpose. On secure VMs, contents of this page, when
> >>> accessed by the hypervisor, retrieves encrypted TCE entries.  Hypervisor
> >>> needs to know the unencrypted entries, to update the TCE table
> >>> accordingly.  There is nothing secret or sensitive about these entries.
> >>> Hence share the page with the hypervisor.
> >>
> >> This unsecures a page in the guest in a random place which creates an
> >> additional attack surface which is hard to exploit indeed but
> >> nevertheless it is there.
> >> A safer option would be not to use the
> >> hcall-multi-tce hyperrtas option (which translates FW_FEATURE_MULTITCE
> >> in the guest).
> > 
> > 
> > Hmm... How do we not use it?  AFAICT hcall-multi-tce option gets invoked
> > automatically when IOMMU option is enabled.
> 
> It is advertised by QEMU but the guest does not have to use it.

Are you suggesting that even normal-guest, not use hcall-multi-tce?
or just secure-guest?  

> 
> > This happens even
> > on a normal VM when IOMMU is enabled.
> > 
> > 
> >>
> >> Also what is this for anyway? 
> > 
> > This is for sending indirect-TCE entries to the hypervisor.
> > The hypervisor must be able to read those TCE entries, so that it can 
> > use those entires to populate the TCE table with the correct mappings.
> > 
> >> if I understand things right, you cannot
> >> map any random guest memory, you should only be mapping that 64MB-ish
> >> bounce buffer array but 1) I do not see that happening (I may have
> >> missed it) 2) it should be done once and it takes a little time for
> >> whatever memory size we allow for bounce buffers anyway. Thanks,
> > 
> > Any random guest memory can be shared by the guest. 
> 
> Yes but we do not want this to be this random. 

It is not sharing some random page. It is sharing a page that is
ear-marked for communicating TCE entries. Yes the address of the page
can be random, depending on where the allocator decides to allocate it.
The purpose of the page is not random.

That page is used for one specific purpose; to communicate the TCE
entries to the hypervisor.  

> I thought the whole idea
> of swiotlb was to restrict the amount of shared memory to bare minimum,
> what do I miss?

I think, you are making a incorrect connection between this patch and
SWIOTLB.  This patch has nothing to do with SWIOTLB.

> 
> > Maybe you are confusing this with the SWIOTLB bounce buffers used by
> > PCI devices, to transfer data to the hypervisor?
> 
> Is not this for pci+swiotlb? 


No. This patch is NOT for PCI+SWIOTLB.  The SWIOTLB pages are a
different set of pages allocated and earmarked for bounce buffering.

This patch is purely to help the hypervisor setup the TCE table, in the
presence of a IOMMU.

>The cover letter suggests it is for
> virtio-scsi-_pci_ with 	iommu_platform=on which makes it a
> normal pci device just like emulated XHCI. Thanks,

Well, I guess, the cover letter is probably confusing. There are two
patches, which togather enable virtio on secure guests, in the presence
of IOMMU.

The second patch enables virtio in the presence of a IOMMU, to use
DMA_ops+SWIOTLB infrastructure, to correctly navigate the I/O to virtio
devices.

However that by itself wont work if the TCE entires are not correctly
setup in the TCE tables.  The first patch; i.e this patch, helps
accomplish that.

Hope this clears up the confusion.
RP

