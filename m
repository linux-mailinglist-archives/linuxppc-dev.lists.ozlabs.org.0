Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3353C429A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 06:05:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNVYb0tgkz3bPN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 14:05:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VDlRo/8+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VDlRo/8+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNVY46Y9Bz2yMK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 14:05:28 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16C43B3x121459; Mon, 12 Jul 2021 00:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=zinRinVuTUiBZnH7AFZqjnZ/S27J3jqY3/bWCYhd2ek=;
 b=VDlRo/8+De+gXchoHJ7dbxPdt1y3vvaT/MT1S48sWdE3BquyeqgcSOCw7E4qM1ymzTxR
 vpwkc93t+hfKhM20lEO/P3hvEa2z/eK3rA2muvsH1h0B7ODHB9MaV0c0Oh51ZUEzD1IT
 Q6eYNy55Vm/QokE0M8vuwaOhF5aySAHfxprVXKClMXEPsHfNphqxX2jZzxCXcUFPkBXm
 oupdgfGLzalMf0bIM8d8ErxKZfNKzyNcRnMoCruMafkoJNEIW/kaNpLFTES6zMKniMwI
 kU+6LOOOVbndT0RVmDRMawtrGba2G/Oscmv9sQW/csptHfqVs0YcWTaG+7wTr2mNnbKD PA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrr3cbuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 00:05:22 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16C43iYj127557;
 Mon, 12 Jul 2021 00:05:22 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrr3cbu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 00:05:22 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16C43PAi017722;
 Mon, 12 Jul 2021 04:05:20 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 39q36889kq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 04:05:20 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16C43Fgp29229362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 04:03:15 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D39D611C04A;
 Mon, 12 Jul 2021 04:05:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8B1011C05B;
 Mon, 12 Jul 2021 04:05:16 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.81.21])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 12 Jul 2021 04:05:16 +0000 (GMT)
Date: Mon, 12 Jul 2021 09:35:14 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v0 1/1] powerpc/percpu: Use 2MB atom_size in percpu
 allocator on radix
Message-ID: <YOu/eptoPmKP1yNR@in.ibm.com>
References: <20210708052946.1497495-1-bharata@linux.ibm.com>
 <1626058374.3xlvhrcly8.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626058374.3xlvhrcly8.astroid@bobo.none>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ub_AXQynXfPpRSp9A8sR9aqHIRmgK3UN
X-Proofpoint-ORIG-GUID: sBpNOc2rJcyOVfjWVbBJZPO-zg1mYINS
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_02:2021-07-09,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120031
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 12, 2021 at 01:00:10PM +1000, Nicholas Piggin wrote:
> Excerpts from Bharata B Rao's message of July 8, 2021 3:29 pm:
> > The atom_size used by percpu allocator on powerpc is currently
> > determined by mmu_linear_psize which is initialized to 4K and
> > mmu_linear_psize is modified only by hash. Till now for radix
> > the atom_size was defaulting to PAGE_SIZE(64K).
> 
> Looks like it was 1MB to me?

Was it hash? Because atom_size will get set to 1MB on hash.
And both on baremetal and KVM radix, I see 64K atom_size.

> 
> > Go for 2MB
> > atom_size on radix if support for 2MB pages exist.
> > 
> > 2MB atom_size on radix will allow using PMD mappings in the
> > vmalloc area if and when support for higher sized vmalloc
> > mappings is enabled for the pecpu allocator. However right now
> 
> That would be nice.
> 
> > this change will result in more number of units to be allocated
> > within one allocation due to increased upa(units per allocation).
> 
> In that case is there any reason to do it until then?

Not strictly. I observed a similar setting on x86 which has
been there for long, so was just checking if it makes sense
here too.

> 
> > 
> > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> > ---
> >  arch/powerpc/kernel/setup_64.c | 34 +++++++++++++++++++++++++---------
> >  1 file changed, 25 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> > index 1ff258f6c76c..45ce2d6e8112 100644
> > --- a/arch/powerpc/kernel/setup_64.c
> > +++ b/arch/powerpc/kernel/setup_64.c
> > @@ -871,6 +871,30 @@ static void __init pcpu_populate_pte(unsigned long addr)
> >  	      __func__, PAGE_SIZE, PAGE_SIZE, PAGE_SIZE);
> >  }
> >  
> > +static size_t pcpu_atom_size(void)
> > +{
> > +	size_t atom_size = PAGE_SIZE;
> > +
> > +	/*
> > +	 * Radix: Use PAGE_SIZE by default or 2M if available.
> > +	 */
> > +	if (radix_enabled()) {
> > +		if (mmu_psize_defs[MMU_PAGE_2M].shift)
> > +			atom_size = 1 << mmu_psize_defs[MMU_PAGE_2M].shift;
> 
> Looks like this changes behaviour for radix.

Yes, it does as it increases the atom_size which results in higher
upa as noted. Did you mean some other behaviour change?

> 
> Also mmu_psize_defs is a pretty horrible interface you only need it in 
> some low level instruction encodings. You already explicitly know it's
> 2MB there, so you can just PMD_SHIFT.

Ok.

> 
> If you want to know whether huge PMD is supported and enabled in vmalloc
> memory, you would have to add some check which also accounts for
> vmap_allow_huge, so that would be another patch.

Yes makes sense if we want to tie the setting of higher atom_size
to actual availability of PMD mappings in vmalloc.

Regards,
Bharata.
