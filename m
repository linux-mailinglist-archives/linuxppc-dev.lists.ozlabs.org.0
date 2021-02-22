Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2363210D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 07:26:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkXJ76L7Lz3cGb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 17:26:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cmJuDmjk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cmJuDmjk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DkXHf3Jycz30MB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 17:25:49 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11M6Ed6h017520; Mon, 22 Feb 2021 01:25:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=FwuNTTcqLG4LZyFlFfSRGTehbGBQdjAVPJODaNMbETQ=;
 b=cmJuDmjkxGBtyzFx2mX9pmFHrQacJVTUhxIkwrH6tLvzvLObRKR64PrIGAEqkhNe33G/
 p3Ig7hKtk3Ck5gpMSVqxbesIj5oTqmSdEqzh38bqCXDkqpsaW0CoYLRCt5Kq0CUDd2tW
 GKRDldV5nGSDZkJ8UOcY/meVdyO9FixXcUSwoDF9OjHZY56FXsLAmgCzIbvEmAWVM4Iy
 nPm66QzJWc2/eBulDjUIJXSENpNLqkLV8Nm4YQj+ReHVr15o+zY2ejlG3b5w2ZUaOEy4
 GrGXUCeo4eAkfJfHE0H1o5NB8xVTHibpT+DSnmMAiDpqqf79yHGg1/fs3oetd9/bHBvA 7w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36v760gatq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 01:25:40 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11M6F2nf020082;
 Mon, 22 Feb 2021 01:25:39 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36v760gass-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 01:25:39 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11M6NOsN030442;
 Mon, 22 Feb 2021 06:25:37 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 36tt288pns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 06:25:37 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11M6PY3429950460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 06:25:34 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FFAFA4057;
 Mon, 22 Feb 2021 06:25:34 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0E3DA4040;
 Mon, 22 Feb 2021 06:25:32 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.69.50])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 22 Feb 2021 06:25:32 +0000 (GMT)
Date: Mon, 22 Feb 2021 11:55:30 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v4 1/3] powerpc/book3s64/radix/tlb: tlbie primitives for
 process-scoped invalidations from guests
Message-ID: <20210222062530.GA3672042@in.ibm.com>
References: <20210215063542.3642366-1-bharata@linux.ibm.com>
 <20210215063542.3642366-2-bharata@linux.ibm.com>
 <YCxiUCm/UCJJGOJD@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCxiUCm/UCJJGOJD@yekko.fritz.box>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-21_14:2021-02-18,
 2021-02-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 mlxlogscore=943 mlxscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220055
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
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 17, 2021 at 11:24:48AM +1100, David Gibson wrote:
> On Mon, Feb 15, 2021 at 12:05:40PM +0530, Bharata B Rao wrote:
> > H_RPT_INVALIDATE hcall needs to perform process scoped tlbie
> > invalidations of L1 and nested guests from L0. This needs RS register
> > for TLBIE instruction to contain both PID and LPID. Introduce
> > primitives that execute tlbie instruction with both PID
> > and LPID set in prepartion for H_RPT_INVALIDATE hcall.
> > 
> > While we are here, move RIC_FLUSH definitions to header file
> > and introduce helper rpti_pgsize_to_psize() that will be needed
> > by the upcoming hcall.
> > 
> > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > ---
> >  .../include/asm/book3s/64/tlbflush-radix.h    |  18 +++
> >  arch/powerpc/mm/book3s64/radix_tlb.c          | 122 +++++++++++++++++-
> >  2 files changed, 136 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> > index 94439e0cefc9..aace7e9b2397 100644
> > --- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> > +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> > @@ -4,6 +4,10 @@
> >  
> >  #include <asm/hvcall.h>
> >  
> > +#define RIC_FLUSH_TLB 0
> > +#define RIC_FLUSH_PWC 1
> > +#define RIC_FLUSH_ALL 2
> > +
> >  struct vm_area_struct;
> >  struct mm_struct;
> >  struct mmu_gather;
> > @@ -21,6 +25,20 @@ static inline u64 psize_to_rpti_pgsize(unsigned long psize)
> >  	return H_RPTI_PAGE_ALL;
> >  }
> >  
> > +static inline int rpti_pgsize_to_psize(unsigned long page_size)
> > +{
> > +	if (page_size == H_RPTI_PAGE_4K)
> > +		return MMU_PAGE_4K;
> > +	if (page_size == H_RPTI_PAGE_64K)
> > +		return MMU_PAGE_64K;
> > +	if (page_size == H_RPTI_PAGE_2M)
> > +		return MMU_PAGE_2M;
> > +	if (page_size == H_RPTI_PAGE_1G)
> > +		return MMU_PAGE_1G;
> > +	else
> > +		return MMU_PAGE_64K; /* Default */
> > +}
> 
> Would it make sense to put the H_RPT_PAGE_ tags into the
> mmu_psize_defs table and scan that here, rather than open coding the
> conversion?

I will give this a try and see how it looks.

Otherwise the changes in the patch which are mainly about
introducing primitives that require to set both PID and LPID
for tlbie instruction - do they look right?

Regards,
Bharata.
