Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D2C1DA950
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 06:36:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rg1M0Zj7zDqVQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 14:36:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RfzR2qNxzDqTx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 14:34:20 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04K4Xrgp142865
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 00:34:17 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312cqnwmq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 00:34:17 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04K4YG5Y144673
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 00:34:17 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312cqnwmpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 00:34:16 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04K4UZKW032202;
 Wed, 20 May 2020 04:34:14 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 313xas2vxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 04:34:14 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04K4YCAI50921526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 04:34:12 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F5E342049;
 Wed, 20 May 2020 04:34:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DA6242042;
 Wed, 20 May 2020 04:34:11 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.43.172])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 20 May 2020 04:34:11 +0000 (GMT)
Date: Wed, 20 May 2020 10:04:08 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v0 0/5] powerpc/mm/radix: Memory unplug fixes
Message-ID: <20200520043408.GA4538@in.ibm.com>
References: <20200406034925.22586-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406034925.22586-1-bharata@linux.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-19_11:2020-05-19,
 2020-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=951 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 cotscore=-2147483648
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005200037
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
Reply-To: bharata@linux.ibm.com
Cc: leonardo@linux.ibm.com, aneesh.kumar@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh,

Do these memory unplug fixes on radix look fine? Do you want these
to be rebased on recent kernel? Would you like me to test any specific
scenario with these fixes?

Regards,
Bharata.
 
On Mon, Apr 06, 2020 at 09:19:20AM +0530, Bharata B Rao wrote:
> Memory unplug has a few bugs which I had attempted to fix ealier
> at https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-July/194087.html
> 
> Now with Leonardo's patch for PAPR changes that add a separate flag bit
> to LMB flags for explicitly identifying hot-removable memory
> (https://lore.kernel.org/linuxppc-dev/f55a7b65a43cc9dc7b22385cf9960f8b11d5ce2e.camel@linux.ibm.com/T/#t),
> a few other issues around memory unplug on radix can be fixed. This
> series is a combination of those fixes.
> 
> This series works on top of above mentioned Leonardo's patch.
> 
> Bharata B Rao (5):
>   powerpc/pseries/hotplug-memory: Set DRCONF_MEM_HOTREMOVABLE for
>     hot-plugged mem
>   powerpc/mm/radix: Create separate mappings for hot-plugged memory
>   powerpc/mm/radix: Fix PTE/PMD fragment count for early page table
>     mappings
>   powerpc/mm/radix: Free PUD table when freeing pagetable
>   powerpc/mm/radix: Remove split_kernel_mapping()
> 
>  arch/powerpc/include/asm/book3s/64/pgalloc.h  |  11 +-
>  arch/powerpc/include/asm/book3s/64/radix.h    |   1 +
>  arch/powerpc/include/asm/sparsemem.h          |   1 +
>  arch/powerpc/mm/book3s64/pgtable.c            |  31 ++-
>  arch/powerpc/mm/book3s64/radix_pgtable.c      | 186 +++++++++++-------
>  arch/powerpc/mm/mem.c                         |   5 +
>  arch/powerpc/mm/pgtable-frag.c                |   9 +-
>  .../platforms/pseries/hotplug-memory.c        |   6 +-
>  8 files changed, 167 insertions(+), 83 deletions(-)
> 
> -- 
> 2.21.0
