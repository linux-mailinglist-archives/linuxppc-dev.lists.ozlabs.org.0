Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65615118CB9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 16:38:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XPN60yMZzDqWG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 02:38:13 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XPKf0j1mzDqYC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 02:36:05 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBAFZxeH117460
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 10:36:01 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wtdp31nxu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 10:36:01 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Tue, 10 Dec 2019 15:35:54 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Dec 2019 15:35:50 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBAFZmlZ32571458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Dec 2019 15:35:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61FBCA405F;
 Tue, 10 Dec 2019 15:35:48 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D778A4054;
 Tue, 10 Dec 2019 15:35:45 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.204.137])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 10 Dec 2019 15:35:44 +0000 (GMT)
Date: Tue, 10 Dec 2019 07:35:42 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1575681159-30356-1-git-send-email-linuxram@us.ibm.com>
 <1575681159-30356-2-git-send-email-linuxram@us.ibm.com>
 <ed0f048c-bb40-c6c6-887c-ef68c9e411a2@ozlabs.ru>
 <20191210051244.GB5702@oc0525413822.ibm.com>
 <c4b48f55-e4e3-222a-0aa0-9b4783e19584@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4b48f55-e4e3-222a-0aa0-9b4783e19584@ozlabs.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19121015-0020-0000-0000-000003963F28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121015-0021-0000-0000-000021ED80FB
Message-Id: <20191210153542.GB5709@oc0525413822.ibm.com>
Subject: RE: [PATCH v5 1/2] powerpc/pseries/iommu: Share the per-cpu TCE page
 with the hypervisor.
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_03:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=18
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100133
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
 leonardo@linux.ibm.com, linux-kernel@vger.kernel.org, ram.n.pai@gmail.com,
 cai@lca.pw, tglx@linutronix.de, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 10, 2019 at 04:32:10PM +1100, Alexey Kardashevskiy wrote:
> 
> 
> On 10/12/2019 16:12, Ram Pai wrote:
> > On Tue, Dec 10, 2019 at 02:07:36PM +1100, Alexey Kardashevskiy wrote:
> >>
> >>
> >> On 07/12/2019 12:12, Ram Pai wrote:
> >>> H_PUT_TCE_INDIRECT hcall uses a page filled with TCE entries, as one of
> >>> its parameters.  On secure VMs, hypervisor cannot access the contents of
> >>> this page since it gets encrypted.  Hence share the page with the
> >>> hypervisor, and unshare when done.
> >>
> >>
> >> I thought the idea was to use H_PUT_TCE and avoid sharing any extra
> >> pages. There is small problem that when DDW is enabled,
> >> FW_FEATURE_MULTITCE is ignored (easy to fix); I also noticed complains
> >> about the performance on slack but this is caused by initial cleanup of
> >> the default TCE window (which we do not use anyway) and to battle this
> >> we can simply reduce its size by adding
> > 
> > something that takes hardly any time with H_PUT_TCE_INDIRECT,  takes
> > 13secs per device for H_PUT_TCE approach, during boot. This is with a
> > 30GB guest. With larger guest, the time will further detoriate.
> 
> 
> No it will not, I checked. The time is the same for 2GB and 32GB guests-
> the delay is caused by clearing the small DMA window which is small by
> the space mapped (1GB) but quite huge in TCEs as it uses 4K pages; and
> for DDW window + emulated devices the IOMMU page size will be 2M/16M/1G
> (depends on the system) so the number of TCEs is much smaller.

I cant get your results.  What changes did you make to get it?

> 
> 
> > 
> >>
> >> -global
> >> spapr-pci-host-bridge.dma_win_size=0x4000000
> > 
> > This option, speeds it up tremendously.  But than should this option be
> > enabled in qemu by default?  only for secure VMs? for both VMs?
> 
> 
> As discussed in slack, by default we do not need to clear the entire TCE
> table and we only have to map swiotlb buffer using the small window. It
> is a guest kernel change only. Thanks,

Can you tell me what code you are talking about here.  Where is the TCE
table getting cleared? What code needs to be changed to not clear it?

Is the code in tce_buildmulti_pSeriesLP(), the one that does the clear
aswell?

>
>

But before I close, you have not told me clearly, what is the problem
with;  'share the page, make the H_PUT_INDIRECT_TCE hcall, unshare the page'.


Remember this is the same page that is earmarked for doing
H_PUT_INDIRECT_TCE, not by my patch, but its already earmarked by the
existing code. So it not some random buffer that is picked. Second 
this page is temporarily shared and unshared, it does not stay shared
for life.  It does not slow the boot. it does not need any
special command line options on the qemu.

Shared pages technology was put in place, exactly for the purpose of
sharing data with the hypervisor.  We are using this technology exactly
for that purpose.  And finally I agreed with your concern of having
shared pages staying around.  Hence i addressed that concern, by
unsharing the page.  At this point, I fail to understand your concern.


RP

