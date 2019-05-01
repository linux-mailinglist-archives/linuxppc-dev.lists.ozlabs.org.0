Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA5E10569
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 08:11:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44v7Lc317GzDqVw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 16:11:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=popple.id.au
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alistair@popple.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44v7K95V4nzDqSC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 16:09:49 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4166pAC050234
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 May 2019 02:09:47 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s74dsk7d0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 May 2019 02:09:46 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alistair@popple.id.au>;
 Wed, 1 May 2019 07:09:44 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 May 2019 07:09:41 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4169e7Y38404102
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 May 2019 06:09:40 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE71F4204F;
 Wed,  1 May 2019 06:09:39 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 952FE42042;
 Wed,  1 May 2019 06:09:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 May 2019 06:09:39 +0000 (GMT)
Received: from townsend.localnet (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4828DA0129;
 Wed,  1 May 2019 16:09:38 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2 0/2] powerpc/ioda2: Another attempt to allow DMA
 masks between 32 and 59
Date: Wed, 01 May 2019 16:09:38 +1000
User-Agent: KMail/5.2.3 (Linux/4.18.0-0.bpo.1-amd64; KDE/5.28.0; x86_64; ; )
In-Reply-To: <20190501052822.64667-1-aik@ozlabs.ru>
References: <20190501052822.64667-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TM-AS-GCONF: 00
x-cbid: 19050106-0016-0000-0000-000002772749
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050106-0017-0000-0000-000032D3B527
Message-Id: <2637621.o3tU8Khc0e@townsend>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-01_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=52 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=818 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905010042
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alexey,

Do we need a seperate patch to allow this to be used? Last time I tried 
calling dma_set_mask(52) on powernv it returned an error and there doesn't 
seem to be anything obvious to me in this series to change that behaviour, but 
perhaps I missed something.

- Alistair

On Wednesday, 1 May 2019 3:28:20 PM AEST Alexey Kardashevskiy wrote:
> This is an attempt to allow DMA masks between 32..59 which are not large
> enough to use either a PHB3 bypass mode or a sketchy bypass. Depending
> on the max order, up to 40 is usually available.
> 
> 
> This is based on sha1
> 37624b58542f Linus Torvalds "Linux 5.1-rc7".
> 
> Please comment. Thanks.
> 
> 
> 
> Alexey Kardashevskiy (2):
>   powerpc/powernv/ioda2: Allocate TCE table levels on demand for default
>     DMA window
>   powerpc/powernv/ioda2: Create bigger default window with 64k IOMMU
>     pages
> 
>  arch/powerpc/include/asm/iommu.h              |  8 ++-
>  arch/powerpc/platforms/powernv/pci.h          |  2 +-
>  arch/powerpc/kernel/iommu.c                   | 58 +++++++++++++------
>  arch/powerpc/platforms/powernv/pci-ioda-tce.c | 20 +++----
>  arch/powerpc/platforms/powernv/pci-ioda.c     | 40 +++++++++++--
>  5 files changed, 90 insertions(+), 38 deletions(-)


