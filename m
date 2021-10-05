Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6A5421E76
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 07:55:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNmyC1V4Zz2ypB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 16:54:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sF932pDS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNmxV5KxSz2xXP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 16:54:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sF932pDS; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4HNmxV4xdpz4xbX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 16:54:22 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HNmxV4vWGz4xbV; Tue,  5 Oct 2021 16:54:22 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sF932pDS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4HNmxV0v4tz4xbT;
 Tue,  5 Oct 2021 16:54:21 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1955BUTi020200; 
 Tue, 5 Oct 2021 01:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=zL9jjSWewjRs17S5msFtSiMv6zE6VPs9IRLqdj9vZvU=;
 b=sF932pDS/QMXkkMgZqXRkF8sBDPT6eHtB0DEMt2AGpZWEU3IV1jpZtCxyUcYixTbFG+A
 CXHy7O7MhKv6DQueFrMyKyJX6sKmXV1Lz3OuHLIfv5LijxAfqSg5n9o5fh6Yds3fKIHf
 OjXlCH4MmjEZIHXho0Ss2n8SbxTTmSJMNAp0FgvKuIEIiGHoBZjLgfNZAh+mlJRg9Tr/
 e1y2iodZCoBsO0TPAIbkd8zNJUXZ7V+2KSsTjgjVEYuX8kJja0viZjmuTQ7lfqwkaMXZ
 N9DTKYBrUL5WjchKOfuE8BjAyhsKF+r6q/rx0CT7kW71rmde7tNr+404Ss/dimOEJQBj LA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bggbd8n2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 01:54:19 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1955cjwI002779;
 Tue, 5 Oct 2021 05:54:17 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3bef29chg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 05:54:17 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1955sD2C5374696
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 05:54:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B4A34C046;
 Tue,  5 Oct 2021 05:54:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FC3C4C050;
 Tue,  5 Oct 2021 05:54:11 +0000 (GMT)
Received: from in.ibm.com (unknown [9.43.121.93])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  5 Oct 2021 05:54:11 +0000 (GMT)
Date: Tue, 5 Oct 2021 11:24:08 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH 1/3] fixup mmu_features immediately after getting cpu pa
 features.
Message-ID: <20211005055408.flthbpp2nfwkygmm@in.ibm.com>
References: <20211004151142.256251-1-sourabhjain@linux.ibm.com>
 <20211004151142.256251-2-sourabhjain@linux.ibm.com>
 <e67acb9b-dd8e-767a-b57b-f12b3b0fd44d@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e67acb9b-dd8e-767a-b57b-f12b3b0fd44d@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: I9WnqRAN5NRq7AxwnNlQqXYK-fbZ5vYy
X-Proofpoint-GUID: I9WnqRAN5NRq7AxwnNlQqXYK-fbZ5vYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050030
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
Reply-To: mahesh@linux.ibm.com
Cc: linuxppc-dev@ozlabs.org, mahesh@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, Sourabh Jain <sourabhjain@linux.ibm.com>,
 Abdul haleem <abdhalee@linux.vnet.ibm.com>, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-10-04 21:02:21 Mon, Aneesh Kumar K.V wrote:
> On 10/4/21 20:41, Sourabh Jain wrote:
> > From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> > 
> > On system with radix support available, early_radix_enabled() starts
> > returning true for a small window (until mmu_early_init_devtree() is
> > called) even when radix mode disabled on kernel command line. This causes
> > ppc64_bolted_size() to return ULONG_MAX in HPT mode instead of supported
> > segment size, during boot cpu paca allocation.
> > 
> > With kernel command line = "... disable_radix":
> > 
> > early_init_devtree:			  <- early_radix_enabled() = false
> >    early_init_dt_scan_cpus:		  <- early_radix_enabled() = false
> >        ...
> >        check_cpu_pa_features:		  <- early_radix_enabled() = false
> >        ...				^ <- early_radix_enabled() = TRUE
> >        allocate_paca:			| <- early_radix_enabled() = TRUE
> >            ...                           |
> >            ppc64_bolted_size:		| <- early_radix_enabled() = TRUE
> >                if (early_radix_enabled())| <- early_radix_enabled() = TRUE
> >                    return ULONG_MAX;     |
> >        ...                               |
> >    ...					| <- early_radix_enabled() = TRUE
> >    ...					| <- early_radix_enabled() = TRUE
> >    mmu_early_init_devtree()              V
> >    ...					  <- early_radix_enabled() = false
> > 
> > So far we have not seen any issue because allocate_paca() takes minimum of
> > ppc64_bolted_size and rma_size while allocating paca. However it is better
> > to close this window by fixing up the mmu features as early as possible.
> > This fixes early_radix_enabled() and ppc64_bolted_size() to return valid
> > values in radix disable mode. This patch will help subsequent patch to
> > depend on early_radix_enabled() check while detecting supported segment
> > size in HPT mode.
> > 
> > Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> > Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> > Reported-and-tested-by: Abdul haleem <abdhalee@linux.vnet.ibm.com>
> > ---
> >   arch/powerpc/include/asm/book3s/64/mmu.h | 1 +
> >   arch/powerpc/include/asm/mmu.h           | 1 +
> >   arch/powerpc/kernel/prom.c               | 1 +
> >   arch/powerpc/mm/init_64.c                | 5 ++++-
> >   4 files changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> > index c02f42d1031e..69a89fa1330d 100644
> > --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> > +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> > @@ -197,6 +197,7 @@ extern int mmu_vmemmap_psize;
> >   extern int mmu_io_psize;
> >   /* MMU initialization */
> > +void mmu_cpu_feature_fixup(void);
> >   void mmu_early_init_devtree(void);
> >   void hash__early_init_devtree(void);
> >   void radix__early_init_devtree(void);
> > diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> > index 8abe8e42e045..c8eafd401fe9 100644
> > --- a/arch/powerpc/include/asm/mmu.h
> > +++ b/arch/powerpc/include/asm/mmu.h
> > @@ -401,6 +401,7 @@ extern void early_init_mmu(void);
> >   extern void early_init_mmu_secondary(void);
> >   extern void setup_initial_memory_limit(phys_addr_t first_memblock_base,
> >   				       phys_addr_t first_memblock_size);
> > +static inline void mmu_cpu_feature_fixup(void) { }
> >   static inline void mmu_early_init_devtree(void) { }
> >   static inline void pkey_early_init_devtree(void) {}
> > diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> > index 2e67588f6f6e..1727a3abe6c1 100644
> > --- a/arch/powerpc/kernel/prom.c
> > +++ b/arch/powerpc/kernel/prom.c
> > @@ -380,6 +380,7 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
> >   		check_cpu_pa_features(node);
> >   	}
> > +	mmu_cpu_feature_fixup();
> 
> can you do that call inside check_cpu_pa_features? or is it because we have
> the same issue with baremetal platforms?

Yup same issue exist on baremetal as well in case of dt_cpu_ftrs_in_use
is true. Hence calling it after the if (!dt_cpu_ftrs_in_use) code block
takes care of both pseries and baremetal platforms.

> 
> Can we also rename this to indicate we are sanitizing the feature flag based
> on kernel command line.  Something like
> 
> /* Update cpu features based on kernel command line */
> update_cpu_features();

Sure will do.

Thanks for your review.
-Mahesh.
