Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E52031120C8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 01:52:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SL0x29SKzDqRw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 11:52:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SKyK4nMKzDqHW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 11:50:16 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB40RL1n101809
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 3 Dec 2019 19:50:13 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wnsd4da80-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2019 19:50:13 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Wed, 4 Dec 2019 00:50:11 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 4 Dec 2019 00:50:06 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xB40nPQ949480180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Dec 2019 00:49:25 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FD374204C;
 Wed,  4 Dec 2019 00:50:05 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80C8242041;
 Wed,  4 Dec 2019 00:50:01 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.193.7])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  4 Dec 2019 00:50:01 +0000 (GMT)
Date: Tue, 3 Dec 2019 16:49:58 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1575269124-17885-1-git-send-email-linuxram@us.ibm.com>
 <1575269124-17885-2-git-send-email-linuxram@us.ibm.com>
 <f08ace25-fa94-990b-1b6d-a1c0f30d6348@ozlabs.ru>
 <20191203020850.GA12354@oc0525413822.ibm.com>
 <0b56ce3e-6c32-5f3b-e7cc-0d419a61d71d@ozlabs.ru>
 <20191203040509.GB12354@oc0525413822.ibm.com>
 <a0f19e65-81eb-37bd-928b-7a57a8660e3d@ozlabs.ru>
 <20191203165204.GA5079@oc0525413822.ibm.com>
 <3a17372a-fcee-efbf-0a05-282ffb1adc90@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a17372a-fcee-efbf-0a05-282ffb1adc90@ozlabs.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19120400-4275-0000-0000-0000038AC85F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120400-4276-0000-0000-0000389E6841
Message-Id: <20191204004958.GB5063@oc0525413822.ibm.com>
Subject: RE: [PATCH v4 1/2] powerpc/pseries/iommu: Share the per-cpu TCE page
 with the hypervisor.
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_07:2019-12-02,2019-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=18 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912040002
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

On Wed, Dec 04, 2019 at 11:04:04AM +1100, Alexey Kardashevskiy wrote:
> 
> 
> On 04/12/2019 03:52, Ram Pai wrote:
> > On Tue, Dec 03, 2019 at 03:24:37PM +1100, Alexey Kardashevskiy wrote:
> >>
> >>
> >> On 03/12/2019 15:05, Ram Pai wrote:
> >>> On Tue, Dec 03, 2019 at 01:15:04PM +1100, Alexey Kardashevskiy wrote:
> >>>>
> >>>>
> >>>> On 03/12/2019 13:08, Ram Pai wrote:
> >>>>> On Tue, Dec 03, 2019 at 11:56:43AM +1100, Alexey Kardashevskiy wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 02/12/2019 17:45, Ram Pai wrote:
> >>>>>>> H_PUT_TCE_INDIRECT hcall uses a page filled with TCE entries, as one of
> >>>>>>> its parameters. One page is dedicated per cpu, for the lifetime of the
> >>>>>>> kernel for this purpose. On secure VMs, contents of this page, when
> >>>>>>> accessed by the hypervisor, retrieves encrypted TCE entries.  Hypervisor
> >>>>>>> needs to know the unencrypted entries, to update the TCE table
> >>>>>>> accordingly.  There is nothing secret or sensitive about these entries.
> >>>>>>> Hence share the page with the hypervisor.
> >>>>>>
> >>>>>> This unsecures a page in the guest in a random place which creates an
> >>>>>> additional attack surface which is hard to exploit indeed but
> >>>>>> nevertheless it is there.
> >>>>>> A safer option would be not to use the
> >>>>>> hcall-multi-tce hyperrtas option (which translates FW_FEATURE_MULTITCE
> >>>>>> in the guest).
> >>>>>
> >>>>>
> >>>>> Hmm... How do we not use it?  AFAICT hcall-multi-tce option gets invoked
> >>>>> automatically when IOMMU option is enabled.
> >>>>
> >>>> It is advertised by QEMU but the guest does not have to use it.
> >>>
> >>> Are you suggesting that even normal-guest, not use hcall-multi-tce?
> >>> or just secure-guest?  
> >>
> >>
> >> Just secure.
> > 
> > hmm..  how are the TCE entries communicated to the hypervisor, if
> > hcall-multi-tce is disabled?
> 
> Via H_PUT_TCE which updates 1 entry at once (sets or clears).
> hcall-multi-tce  enables H_PUT_TCE_INDIRECT (512 entries at once) and
> H_STUFF_TCE (clearing, up to 4bln at once? many), these are simply an
> optimization.

Do you still think, secure-VM should use H_PUT_TCE and not
H_PUT_TCE_INDIRECT?  And normal VM should use H_PUT_TCE_INDIRECT?
Is there any advantage of special casing it for secure-VMs.
In fact, we could make use of as much optimization as possible.


> 
> >>>> Is not this for pci+swiotlb? 
..snip..
> >>> This patch is purely to help the hypervisor setup the TCE table, in the
> >>> presence of a IOMMU.
> >>
> >> Then the hypervisor should be able to access the guest pages mapped for
> >> DMA and these pages should be made unsecure for this to work. Where/when
> >> does this happen?
> > 
> > This happens in the SWIOTLB code.  The code to do that is already
> > upstream.  
> >
> > The sharing of the pages containing the SWIOTLB bounce buffers is done
> > in init_svm() which calls swiotlb_update_mem_attributes() which calls
> > set_memory_decrypted().  In the case of pseries, set_memory_decrypted() calls 
> > uv_share_page().
> 
> 
> This does not seem enough as when you enforce iommu_platform=on, QEMU
> starts accessing virtio buffers via IOMMU so bounce buffers have to be
> mapped explicitly, via H_PUT_TCE&co, where does this happen?
> 

I think, it happens at boot time. Every page of the guest memory is TCE
mapped, if iommu is enabled. SWIOTLB pages get implicitly TCE-mapped
as part of that operation.

RP

