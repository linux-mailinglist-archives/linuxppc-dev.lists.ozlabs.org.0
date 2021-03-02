Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A59D3295DF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 05:22:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqP9D0mcwz3cl3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 15:22:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ONRauz6E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ONRauz6E; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqP8l47GPz30Ly
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 15:21:42 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12243QFt018908; Mon, 1 Mar 2021 23:21:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=XSqYZNSxHPNMHpR3bJubiX7J92+R4nHnrdlmbJwTc9A=;
 b=ONRauz6E1tuPv76NjPWi3hQFQr9udGIOeb7wpkaTWtPy/JoXh1bwrglK1zRaLhugL0mf
 tMvoCOU82dEl/u07bUUYaxZYonc/DazWqaAKw3aXHsB8XJ8JvMVMnEm6AfA1mQSkE++6
 Kx7YBhBSbsF+STdLJFBrTupl/7S18qjQt6mtGA6y2xc2gVv+UwYT7Wlj9l90NpJ8aOEu
 tVdlDFn7j/m0S8l7h6BZi8vjWCEUdyntQNsUvCdPGE9hGWPPeOm8PP5BHAbF4AsI7hQ5
 2ldF22mNVeieGsnUuXaw1LP9UTjiJ8R9bR1QRfn641ct8MMlXqUVzVr3uGIdrRQOFDAW 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371bppug1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 23:21:37 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12243U08019319;
 Mon, 1 Mar 2021 23:21:37 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371bppug0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 23:21:37 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1224EC0h017740;
 Tue, 2 Mar 2021 04:21:35 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 37150cr65s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 04:21:34 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1224LVE738273312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 04:21:32 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E291C11C054;
 Tue,  2 Mar 2021 04:21:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6971411C052;
 Tue,  2 Mar 2021 04:21:30 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.51.221])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  2 Mar 2021 04:21:30 +0000 (GMT)
Date: Tue, 2 Mar 2021 09:51:28 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v5 1/3] powerpc/book3s64/radix: Add H_RPT_INVALIDATE
 pgsize encodings to mmu_psize_def
Message-ID: <20210302042128.GB188607@in.ibm.com>
References: <20210224082510.3962423-1-bharata@linux.ibm.com>
 <20210224082510.3962423-2-bharata@linux.ibm.com>
 <YD2UwhaweIpImZDv@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YD2UwhaweIpImZDv@yekko.fritz.box>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_01:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103020029
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

On Tue, Mar 02, 2021 at 12:28:34PM +1100, David Gibson wrote:
> On Wed, Feb 24, 2021 at 01:55:08PM +0530, Bharata B Rao wrote:
> > Add a field to mmu_psize_def to store the page size encodings
> > of H_RPT_INVALIDATE hcall. Initialize this while scanning the radix
> > AP encodings. This will be used when invalidating with required
> > page size encoding in the hcall.
> > 
> > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/book3s/64/mmu.h | 1 +
> >  arch/powerpc/mm/book3s64/radix_pgtable.c | 5 +++++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
> > index eace8c3f7b0a..c02f42d1031e 100644
> > --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> > +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> > @@ -19,6 +19,7 @@ struct mmu_psize_def {
> >  	int		penc[MMU_PAGE_COUNT];	/* HPTE encoding */
> >  	unsigned int	tlbiel;	/* tlbiel supported for that page size */
> >  	unsigned long	avpnm;	/* bits to mask out in AVPN in the HPTE */
> > +	unsigned long   h_rpt_pgsize; /* H_RPT_INVALIDATE page size encoding */
> >  	union {
> >  		unsigned long	sllp;	/* SLB L||LP (exact mask to use in slbmte) */
> >  		unsigned long ap;	/* Ap encoding used by PowerISA 3.0 */
> > diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> > index 98f0b243c1ab..1b749899016b 100644
> > --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> > +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> > @@ -486,6 +486,7 @@ static int __init radix_dt_scan_page_sizes(unsigned long node,
> >  		def = &mmu_psize_defs[idx];
> >  		def->shift = shift;
> >  		def->ap  = ap;
> > +		def->h_rpt_pgsize = psize_to_rpti_pgsize(idx);
> >  	}
> >  
> >  	/* needed ? */
> > @@ -560,9 +561,13 @@ void __init radix__early_init_devtree(void)
> >  		 */
> >  		mmu_psize_defs[MMU_PAGE_4K].shift = 12;
> >  		mmu_psize_defs[MMU_PAGE_4K].ap = 0x0;
> > +		mmu_psize_defs[MMU_PAGE_4K].h_rpt_pgsize =
> > +			psize_to_rpti_pgsize(MMU_PAGE_4K);
> 
> Hm.  TBH, I was thinking of this as replacing psize_to_rpti_pgsize() -
> that is, you directly put the correct codes in there, then just have
> psize_to_rpti_pgsize() look them up in the table.
> 
> I guess that could be a followup change, though.
> 
> >  
> >  		mmu_psize_defs[MMU_PAGE_64K].shift = 16;
> >  		mmu_psize_defs[MMU_PAGE_64K].ap = 0x5;
> > +		mmu_psize_defs[MMU_PAGE_64K].h_rpt_pgsize =
> > +			psize_to_rpti_pgsize(MMU_PAGE_64K);

Hmm if you see I got rid of rpti_pgsize_to_psize() by having the
defines directly in mmu_psize_def[].

There are two cases in the above code (radix__early_init_devtree)

1. If radix pagesize encodings are present in the DT, we walk
the page sizes in the loop and populate the enconding for
H_RPT_INVALIDATE. I am not sure if we can use the direct codes
in this case.

2. If DT doesn't have the radix pagesize encodings, 4K and 64K
sizes are assumed as fallback sizes where we can use direct
encodings.

Regards,
Bharata.
