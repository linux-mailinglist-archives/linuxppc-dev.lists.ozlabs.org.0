Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9AA11DB2C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 01:34:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YsBS1bKYzDrBk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 11:34:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=r.bolshakov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="cY7PeKyR"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ys8Z0JTdzDr7Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 11:33:14 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C0FA341207;
 Fri, 13 Dec 2019 00:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1576197187;
 x=1578011588; bh=Muef90s1yVPYLj6SS/ZYvhw2zH07wwsunekBFXoC0vs=; b=
 cY7PeKyRM0MCOghOFCKH4mP1kkIZM0xQZzUYAj62eVBEOv+jfp6B2/573Ackgxll
 gEMNQsSovkLoJM1O+l8iQaXK8qXBkSkfw9Tip+7YqQHZWuaSUUwpK0Q5aVEogVeY
 HCdFKohcqKn77R9+oCC45PNT3lsWckTgKlHrxF1SOko=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1QWthcU-ow15; Fri, 13 Dec 2019 03:33:07 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 27AF841203;
 Fri, 13 Dec 2019 03:33:06 +0300 (MSK)
Received: from localhost (172.17.128.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 13
 Dec 2019 03:33:06 +0300
Date: Fri, 13 Dec 2019 03:33:05 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: HPT allocation failures on POWER8 KVM hosts
Message-ID: <20191213003305.ipi4rnpuyojlk2r4@SPB-NB-133.local>
References: <20191115152826.hvcu3borgx4hp275@SPB-NB-133.local>
 <874kz2gcx3.fsf@dja-thinkpad.axtens.net>
 <20191118114242.mgv2t6mwc3llepjj@SPB-NB-133.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191118114242.mgv2t6mwc3llepjj@SPB-NB-133.local>
X-Originating-IP: [172.17.128.60]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, qemu-ppc@nongnu.org,
 linuxppc-dev@lists.ozlabs.org, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 18, 2019 at 02:42:42PM +0300, Roman Bolshakov wrote:
> On Mon, Nov 18, 2019 at 01:02:00PM +1100, Daniel Axtens wrote:
> > Hi Roman,
> > 
> > > We're running a lot of KVM virtual machines on POWER8 hosts and
> > > sometimes new VMs can't be started because there are no contiguous
> > > regions for HPT because of CMA region fragmentation.
> > >
> > > The issue is covered in the LWN article: https://lwn.net/Articles/684611/
> > > The article points that you raised the problem on LSFMM 2016. However I
> > > couldn't find a follow up article on the issue.
> > >
> > > Looking at the kernel commit log I've identified a few commits that
> > > might reduce CMA fragmentaiton and overcome HPT allocation failure:
> > >   - bd2e75633c801 ("dma-contiguous: use fallback alloc_pages for single pages")
> > >   - 678e174c4c16a ("powerpc/mm/iommu: allow migration of cma allocated
> > >     pages during mm_iommu_do_alloc")
> > >   - 9a4e9f3b2d739 ("mm: update get_user_pages_longterm to migrate pages allocated from
> > >     CMA region")
> > >   - d7fefcc8de914 ("mm/cma: add PF flag to force non cma alloc")
> > >
> > > Are there any other commits that address the issue? What is the first
> > > kernel version that shouldn't have the HPT allocation problem due to CMA
> > > fragmentation?
> > 
> > I've had some success increasing the CMA allocation with the
> > kvm_cma_resv_ratio boot parameter - see
> > arch/powerpc/kvm/book3s_hv_builtin.c
> > 
> > The default is 5%. In a support case in a former job we had a customer
> > who increased this to I think 7 or 8% and saw the symptoms subside
> > dramatically.
> > 
> 
> Hi Daniel,
> 
> Thank you, I'll try to increase kvm_cma_resv_ratio for now, but even 5%
> CMA reserve should be more than enough, given the size of HPT as 1/128th
> of VM max memory.
> 
> For a 16GB RAM VM without balloon device, only 128MB is going to be
> reserved for HPT using CMA. So, 5% CMA reserve should allow to provision
> VMs with over 1.5TB of RAM on 256GB RAM host. In other words the default
> CMA reserve allows to overprovision 6 times more memory for VMs than
> presented on a host.
> 
> We rarely add balloon device and sometimes don't add it at all. Therefore
> I'm still looking for commits that would help to avoid the issue with
> the default CMA reserve.
> 

FWIW, I have noticed the following. My host has 4 NUMA nodes with 4 CPUs
per node, only one of the nodes have CMA pages and only two of the nodes
have memory according to /proc/zoneinfo. The error can be reliably
reproduced if I attempt to place vCPUs on the node with CMA pages.

Roman
