Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D175B7203
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 05:51:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YjYv01cQzF4ly
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 13:50:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YjWS6M3QzF259
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 13:48:52 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8J3luVH104543
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 23:48:49 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v41tn0cwm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 23:48:49 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Thu, 19 Sep 2019 04:48:47 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 19 Sep 2019 04:48:41 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8J3mehk25428044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Sep 2019 03:48:40 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD12211C050;
 Thu, 19 Sep 2019 03:48:40 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3152911C054;
 Thu, 19 Sep 2019 03:48:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 Sep 2019 03:48:40 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 98DF7A01EB;
 Thu, 19 Sep 2019 13:48:38 +1000 (AEST)
Subject: Re: [PATCH v3 1/5] powerpc: Allow flush_icache_range to work across
 ranges >4GB
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 19 Sep 2019 13:48:38 +1000
In-Reply-To: <87imppuf0w.fsf@mpe.ellerman.id.au>
References: <20190918052106.14113-1-alastair@au1.ibm.com>
 <20190918052106.14113-2-alastair@au1.ibm.com>
 <87imppuf0w.fsf@mpe.ellerman.id.au>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091903-4275-0000-0000-00000368563D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091903-4276-0000-0000-0000387AC0BA
Message-Id: <cdc29892276ea4c8a83739b79fb6d8b286f319ba.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-19_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909190032
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
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Qian Cai <cai@lca.pw>,
 Nicholas Piggin <npiggin@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-09-19 at 13:43 +1000, Michael Ellerman wrote:
> "Alastair D'Silva" <alastair@au1.ibm.com> writes:
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > When calling flush_icache_range with a size >4GB, we were masking
> > off the upper 32 bits, so we would incorrectly flush a range
> > smaller
> > than intended.
> > 
> > __kernel_sync_dicache in the 64 bit VDSO has the same bug.
> 
> Please fix that in a separate patch.
> 
> Your subject doesn't mention __kernel_sync_dicache(), and also the
> two
> changes backport differently, so it's better if they're done as
> separate
> patches.
> 

Ok.

> cheers
> 
> > This patch replaces the 32 bit shifts with 64 bit ones, so that
> > the full size is accounted for.
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > Cc: stable@vger.kernel.org
> > ---
> >  arch/powerpc/kernel/misc_64.S           | 4 ++--
> >  arch/powerpc/kernel/vdso64/cacheflush.S | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/powerpc/kernel/misc_64.S
> > b/arch/powerpc/kernel/misc_64.S
> > index b55a7b4cb543..9bc0aa9aeb65 100644
> > --- a/arch/powerpc/kernel/misc_64.S
> > +++ b/arch/powerpc/kernel/misc_64.S
> > @@ -82,7 +82,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
> >  	subf	r8,r6,r4		/* compute length */
> >  	add	r8,r8,r5		/* ensure we get enough */
> >  	lwz	r9,DCACHEL1LOGBLOCKSIZE(r10)	/* Get log-2 of cache block
> > size */
> > -	srw.	r8,r8,r9		/* compute line count */
> > +	srd.	r8,r8,r9		/* compute line count */
> >  	beqlr				/* nothing to do? */
> >  	mtctr	r8
> >  1:	dcbst	0,r6
> > @@ -98,7 +98,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
> >  	subf	r8,r6,r4		/* compute length */
> >  	add	r8,r8,r5
> >  	lwz	r9,ICACHEL1LOGBLOCKSIZE(r10)	/* Get log-2 of Icache
> > block size */
> > -	srw.	r8,r8,r9		/* compute line count */
> > +	srd.	r8,r8,r9		/* compute line count */
> >  	beqlr				/* nothing to do? */
> >  	mtctr	r8
> >  2:	icbi	0,r6
> > diff --git a/arch/powerpc/kernel/vdso64/cacheflush.S
> > b/arch/powerpc/kernel/vdso64/cacheflush.S
> > index 3f92561a64c4..526f5ba2593e 100644
> > --- a/arch/powerpc/kernel/vdso64/cacheflush.S
> > +++ b/arch/powerpc/kernel/vdso64/cacheflush.S
> > @@ -35,7 +35,7 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
> >  	subf	r8,r6,r4		/* compute length */
> >  	add	r8,r8,r5		/* ensure we get enough */
> >  	lwz	r9,CFG_DCACHE_LOGBLOCKSZ(r10)
> > -	srw.	r8,r8,r9		/* compute line count */
> > +	srd.	r8,r8,r9		/* compute line count */
> >  	crclr	cr0*4+so
> >  	beqlr				/* nothing to do? */
> >  	mtctr	r8
> > @@ -52,7 +52,7 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
> >  	subf	r8,r6,r4		/* compute length */
> >  	add	r8,r8,r5
> >  	lwz	r9,CFG_ICACHE_LOGBLOCKSZ(r10)
> > -	srw.	r8,r8,r9		/* compute line count */
> > +	srd.	r8,r8,r9		/* compute line count */
> >  	crclr	cr0*4+so
> >  	beqlr				/* nothing to do? */
> >  	mtctr	r8
> > -- 
> > 2.21.0
-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

