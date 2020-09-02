Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 337EB25A7AF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 10:21:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhH2N24M8zDqbD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 18:21:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MUAq85PR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhGtC6SMvzDqkc
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 18:13:55 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0828390p133343; Wed, 2 Sep 2020 04:13:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=a3eXUdWb9RaaXm+62pNlv1dQyk3xkRZiWvAIB6OZmnA=;
 b=MUAq85PRK89Wm8cYXUeziaM3qczOQB6DXwm7XfAyjRA8UKx+paii7V7YMn8j5XDDomV1
 kr0ybB6VitA71nayULAWiSUVcQ6WLFGmA6psCpl6F2RFQ6vKUlFOZ97UwAtW8ca4Pq2W
 cf8pynKWfdqYvthy6Up5CbC/EWPJ7+Q0t7KqvFCipUhYn8eWlOZMLFi9DRQK4cqOnbqw
 QrLvfIROHcqf/RLL0ccXA0H+YFwb060+5PNPAHWAf1XaCv693bWErsVknr7kJRjso7zn
 5x8vXhc7nljLFOM6oDreF+oF5syUKxovYNLfSpkD11x1Ll+rKtmVQgw+LvQJ4kCntgED aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33a7hwra2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 04:13:20 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08283IGY133724;
 Wed, 2 Sep 2020 04:13:19 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33a7hwra1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 04:13:19 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0828DCBO002494;
 Wed, 2 Sep 2020 08:13:17 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 337en8ce7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 08:13:17 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0828DEhL29819180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 08:13:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A4C3A4051;
 Wed,  2 Sep 2020 08:13:14 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B6ABA405D;
 Wed,  2 Sep 2020 08:13:12 +0000 (GMT)
Received: from oc5500677777.ibm.com (unknown [9.145.78.43])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 08:13:12 +0000 (GMT)
Subject: Re: [PATCH 0/2] dma-mapping: update default segment_boundary_mask
To: Nicolin Chen <nicoleotsuka@gmail.com>, hch@lst.de
References: <20200901221646.26491-1-nicoleotsuka@gmail.com>
From: Niklas Schnelle <schnelle@linux.ibm.com>
Message-ID: <2c8db0aa-e8b5-e577-b971-1de10ecc6747@linux.ibm.com>
Date: Wed, 2 Sep 2020 10:13:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901221646.26491-1-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_03:2020-09-02,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009020074
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
Cc: linux-ia64@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org,
 sfr@canb.auug.org.au, deller@gmx.de, x86@kernel.org, borntraeger@de.ibm.com,
 mingo@redhat.com, mattst88@gmail.com, fenghua.yu@intel.com, gor@linux.ibm.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com, ink@jurassic.park.msu.ru,
 tglx@linutronix.de, gerald.schaefer@linux.ibm.com, rth@twiddle.net,
 tony.luck@intel.com, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/2/20 12:16 AM, Nicolin Chen wrote:
> These two patches are to update default segment_boundary_mask.
> 
> PATCH-1 fixes overflow issues in callers of dma_get_seg_boundary.
> Previous version was a series: https://lkml.org/lkml/2020/8/31/1026
> 
> Then PATCH-2 sets default segment_boundary_mask to ULONG_MAX.
> 
> Nicolin Chen (2):
>   dma-mapping: introduce dma_get_seg_boundary_nr_pages()
>   dma-mapping: set default segment_boundary_mask to ULONG_MAX

I gave both of your patches a quick test ride on a couple of dev mainframes,
both NVMe, ConnectX and virtio-pci devices all seems to work fine.
I already commented on Christoph's mail that I like the helper approach,
so as for s390 you can add my

Acked-by: Niklas Schnelle <schnelle@linux.ibm.com>

> 
>  arch/alpha/kernel/pci_iommu.c    |  7 +------
>  arch/ia64/hp/common/sba_iommu.c  |  3 +--
>  arch/powerpc/kernel/iommu.c      |  9 ++-------
>  arch/s390/pci/pci_dma.c          |  6 ++----
>  arch/sparc/kernel/iommu-common.c | 10 +++-------
>  arch/sparc/kernel/iommu.c        |  3 +--
>  arch/sparc/kernel/pci_sun4v.c    |  3 +--
>  arch/x86/kernel/amd_gart_64.c    |  3 +--
>  drivers/parisc/ccio-dma.c        |  3 +--
>  drivers/parisc/sba_iommu.c       |  3 +--
>  include/linux/dma-mapping.h      | 21 ++++++++++++++++++++-
>  11 files changed, 34 insertions(+), 37 deletions(-)
> 
