Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB4811C4B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 05:14:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YL655bj2zDqwJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 15:14:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YL310FYpzDqXZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 15:11:37 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBC47G1E079094
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 23:11:30 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wsrdqxmht-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 23:11:30 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Thu, 12 Dec 2019 04:11:27 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 12 Dec 2019 04:11:23 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBC4BLZP33882284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Dec 2019 04:11:21 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE8A4A405B;
 Thu, 12 Dec 2019 04:11:21 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F944A405F;
 Thu, 12 Dec 2019 04:11:18 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.213.32])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 12 Dec 2019 04:11:18 +0000 (GMT)
Date: Wed, 11 Dec 2019 20:11:15 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1575681159-30356-1-git-send-email-linuxram@us.ibm.com>
 <1575681159-30356-2-git-send-email-linuxram@us.ibm.com>
 <ed0f048c-bb40-c6c6-887c-ef68c9e411a2@ozlabs.ru>
 <20191210051244.GB5702@oc0525413822.ibm.com>
 <c4b48f55-e4e3-222a-0aa0-9b4783e19584@ozlabs.ru>
 <20191210153542.GB5709@oc0525413822.ibm.com>
 <90f6019b-d756-7f33-21b0-bb49c1c842da@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90f6019b-d756-7f33-21b0-bb49c1c842da@ozlabs.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 19121204-0020-0000-0000-0000039751A9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121204-0021-0000-0000-000021EE583B
Message-Id: <20191212041115.GC5702@oc0525413822.ibm.com>
Subject: RE: [PATCH v5 1/2] powerpc/pseries/iommu: Share the per-cpu TCE page
 with the hypervisor.
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-12_01:2019-12-12,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 suspectscore=48 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912120021
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

On Wed, Dec 11, 2019 at 07:15:44PM +1100, Alexey Kardashevskiy wrote:
> 
> 
> On 11/12/2019 02:35, Ram Pai wrote:
> > On Tue, Dec 10, 2019 at 04:32:10PM +1100, Alexey Kardashevskiy wrote:
> >>
..snip..
> >> As discussed in slack, by default we do not need to clear the entire TCE
> >> table and we only have to map swiotlb buffer using the small window. It
> >> is a guest kernel change only. Thanks,
> > 
> > Can you tell me what code you are talking about here.  Where is the TCE
> > table getting cleared? What code needs to be changed to not clear it?
> 
> 
> pci_dma_bus_setup_pSeriesLP()
> 	iommu_init_table()
> 		iommu_table_clear()
> 			for () tbl->it_ops->get()
> 
> We do not really need to clear it there, we only need it for VFIO with
> IOMMU SPAPR TCE v1 which reuses these tables but there are
> iommu_take_ownership/iommu_release_ownership to clear these tables. I'll
> send a patch for this.

Did some experiments. It spent the first 9s in tce_free_pSeriesLP()
clearing the tce entries.  And the second 13s in 
tce_setrange_multi_pSeriesLP_walk().  BTW: the code in
tce_setrange_multi_pSeriesLP_walk() is modified to use DIRECT_TCE.

So it looks like the amount of time spent in
tce_setrange_multi_pSeriesLP_walk() is a function of the size of the
memory that is mapped in the ddw.


> 
..snip..
> 
> > But before I close, you have not told me clearly, what is the problem
> > with;  'share the page, make the H_PUT_INDIRECT_TCE hcall, unshare the page'.
> 
> Between share and unshare you have a (tiny) window of opportunity to
> attack the guest. No, I do not know how exactly.
> 
> For example, the hypervisor does a lot of PHB+PCI hotplug-unplug with
> 64bit devices - each time this will create a huge window which will
> share/unshare the same page.  No, I do not know how exactly how this can
> be exploited either, we cannot rely of what you or myself know today. My
> point is that we should not be sharing pages at all unless we really
> really have to, and this does not seem to be the case.
> 
> But since this seems to an acceptable compromise anyway,
> 
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> 

Thanks!
RP

