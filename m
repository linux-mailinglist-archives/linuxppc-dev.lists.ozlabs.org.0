Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B1E415D8C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 14:02:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFYgQ3ZJ5z30MC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 22:02:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZCv5VVg5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rppt@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZCv5VVg5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFYfh1HzPz2yJh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 22:01:31 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NAdUcU003364; 
 Thu, 23 Sep 2021 08:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=pXzEf65A4Oe5+XzfRr8terVnfyIyuO6PQs0+F8aXgGc=;
 b=ZCv5VVg5Axl96NC4/j5oW2leA+TyRu7PTszC85LX7OnyuvdR/QPrxFJvHee6+ph9/1Ah
 rUd/1Dr4tZ5yXYAiKoNA4l0g4riJzCer09eV4KmKCsnovao7Ujg6/MQzQ6IVb2C5LRSL
 6WitPRreJzNPlii4WW55mXNNAxhzlImWjS7TBI5y3E9CuYqxTL+hR1eRpZFENX5WHVgo
 3bzeScRRqqA6eAdFzB/5aWdZYhNxC/HkliRolmuo1Xv4pKsUbXkIzU8GEpyYBQunYUKJ
 0M08Qqduz9x2e5o+taGQrQG0ce7A7g963Zzijz3wHvEhl/y43e2FXQI9OwpYg11CHmgU 9g== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b8p4dcmbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 08:01:14 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18NBvwov029624;
 Thu, 23 Sep 2021 12:01:11 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3b7q6ps42c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 12:01:11 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18NC18Jk56885734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Sep 2021 12:01:08 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 810B04C08B;
 Thu, 23 Sep 2021 12:01:08 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64DD54C089;
 Thu, 23 Sep 2021 12:01:06 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.159.121])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Sep 2021 12:01:06 +0000 (GMT)
Date: Thu, 23 Sep 2021 15:01:04 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 3/3] memblock: cleanup memblock_free interface
Message-ID: <YUxsgN/uolhn1Ok+@linux.ibm.com>
References: <20210923074335.12583-1-rppt@kernel.org>
 <20210923074335.12583-4-rppt@kernel.org>
 <1101e3c7-fcb7-a632-8e22-47f4a01ea02e@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1101e3c7-fcb7-a632-8e22-47f4a01ea02e@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fe2SFaLdoxw706nrVmE8bleSLkHdGrzC
X-Proofpoint-ORIG-GUID: fe2SFaLdoxw706nrVmE8bleSLkHdGrzC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_04,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 bulkscore=0 spamscore=0
 mlxlogscore=613 impostorscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109230076
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
Cc: linux-efi@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kasan-dev@googlegroups.com, xen-devel@lists.xenproject.org,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 23, 2021 at 11:47:48AM +0200, Christophe Leroy wrote:
> 
> 
> Le 23/09/2021 à 09:43, Mike Rapoport a écrit :
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > For ages memblock_free() interface dealt with physical addresses even
> > despite the existence of memblock_alloc_xx() functions that return a
> > virtual pointer.
> > 
> > Introduce memblock_phys_free() for freeing physical ranges and repurpose
> > memblock_free() to free virtual pointers to make the following pairing
> > abundantly clear:
> > 
> > 	int memblock_phys_free(phys_addr_t base, phys_addr_t size);
> > 	phys_addr_t memblock_phys_alloc(phys_addr_t base, phys_addr_t size);
> > 
> > 	void *memblock_alloc(phys_addr_t size, phys_addr_t align);
> > 	void memblock_free(void *ptr, size_t size);
> > 
> > Replace intermediate memblock_free_ptr() with memblock_free() and drop
> > unnecessary aliases memblock_free_early() and memblock_free_early_nid().
> > 
> > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> 
> > diff --git a/arch/s390/kernel/smp.c b/arch/s390/kernel/smp.c
> > index 1a04e5bdf655..37826d8c4f74 100644
> > --- a/arch/s390/kernel/smp.c
> > +++ b/arch/s390/kernel/smp.c
> > @@ -723,7 +723,7 @@ void __init smp_save_dump_cpus(void)
> >   			/* Get the CPU registers */
> >   			smp_save_cpu_regs(sa, addr, is_boot_cpu, page);
> >   	}
> > -	memblock_free(page, PAGE_SIZE);
> > +	memblock_phys_free(page, PAGE_SIZE);
> >   	diag_amode31_ops.diag308_reset();
> >   	pcpu_set_smt(0);
> >   }
> > @@ -880,7 +880,7 @@ void __init smp_detect_cpus(void)
> >   	/* Add CPUs present at boot */
> >   	__smp_rescan_cpus(info, true);
> > -	memblock_free_early((unsigned long)info, sizeof(*info));
> > +	memblock_free(info, sizeof(*info));
> >   }
> >   /*
> 
> I'm a bit lost. IIUC memblock_free_early() and memblock_free() where
> identical.

Yes, they were, but all calls to memblock_free_early() were using
__pa(vaddr) because they had a virtual address at hand.

> In the first hunk memblock_free() gets replaced by memblock_phys_free()
> In the second hunk memblock_free_early() gets replaced by memblock_free()

In the first hunk the memory is allocated with memblock_phys_alloc() and we
have a physical range to free. In the second hunk the memory is allocated
with memblock_alloc() and we are freeing a virtual pointer.
 
> I think it would be easier to follow if you could split it in several
> patches:

It was an explicit request from Linus to make it a single commit:

  but the actual commit can and should be just a single commit that just
  fixes 'memblock_free()' to have sane interfaces.

I don't feel strongly about splitting it (except my laziness really
objects), but I don't think doing the conversion in several steps worth the
churn.

> - First patch: Create memblock_phys_free() and change all relevant
> memblock_free() to memblock_phys_free() - Or change memblock_free() to
> memblock_phys_free() and make memblock_free() an alias of it.
> - Second patch: Make memblock_free_ptr() become memblock_free() and change
> all remaining callers to the new semantics (IIUC memblock_free(__pa(ptr))
> becomes memblock_free(ptr) and make memblock_free_ptr() an alias of
> memblock_free()
> - Fourth patch: Replace and drop memblock_free_ptr()
> - Fifth patch: Drop memblock_free_early() and memblock_free_early_nid() (All
> users should have been upgraded to memblock_free_phys() in patch 1 or
> memblock_free() in patch 2)
> 
> Christophe

-- 
Sincerely yours,
Mike.
