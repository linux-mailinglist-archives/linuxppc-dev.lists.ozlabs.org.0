Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D74374F66
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 08:33:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbP0k5lSsz30GN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 16:33:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XYwi4BBm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XYwi4BBm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbP0F0fGLz2yQq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 16:33:00 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14663X5c158955; Thu, 6 May 2021 02:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=/lqywWXU1QOtDH96Pd9RQfLDomVZ3ekD3975awYwYiM=;
 b=XYwi4BBmMnt77fBuhWqJpnwPvb6Z7Oee4V5i1K7gY8eftREp4KoWqujJBQDQohPWDbZu
 kehm82jGn99rKWU5wd3RuU8Rrq72+vgTldyAzc6z31wtDwxz2SEe3giVpeFlwLm5iAW8
 yDgQpRDWKUs2FeYCQb05PwTbfDezpMaafFkK8mEPXEoz36CzAiLlBE6LmKPjm6U2haZ3
 A1uQp1GfOM3AQIEUismpGLx3ITGMionmC5dqgyGmPNY00VM5RLIGtlEzqpwvFoJtFyRV
 +e/f2RK01PK11odkphHCyD674320P51BLVANHgKGRdvjUvlpQ6dvnVqjhOWN16gWZG1d CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38c78adbud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 02:32:54 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14663rGl162378;
 Thu, 6 May 2021 02:32:54 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38c78adbtk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 02:32:53 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1466SFDh027800;
 Thu, 6 May 2021 06:32:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 38beeegntk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 06:32:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1466Wmsc29491628
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 May 2021 06:32:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7024CA4069;
 Thu,  6 May 2021 06:32:48 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BC14A407A;
 Thu,  6 May 2021 06:31:31 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.39.47])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  6 May 2021 06:31:31 +0000 (GMT)
Date: Thu, 6 May 2021 12:01:28 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 3/6] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE
Message-ID: <20210506063128.GA185649@in.ibm.com>
References: <20210505154642.178702-1-bharata@linux.ibm.com>
 <20210505154642.178702-4-bharata@linux.ibm.com>
 <1620279244.mpmwjm8qjk.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620279244.mpmwjm8qjk.astroid@bobo.none>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mRzw4a-KMVj4GlV6TW9lfUAjsOR4Yjqp
X-Proofpoint-ORIG-GUID: rZMGu99A1R8gblI9xJQ79oamojS1wvCj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_05:2021-05-05,
 2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060041
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
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 06, 2021 at 03:45:21PM +1000, Nicholas Piggin wrote:
> Excerpts from Bharata B Rao's message of May 6, 2021 1:46 am:
> >  
> > +static long kvmppc_h_rpt_invalidate(struct kvm_vcpu *vcpu,
> > +				    unsigned long id, unsigned long target,
> > +				    unsigned long type, unsigned long pg_sizes,
> > +				    unsigned long start, unsigned long end)
> > +{
> > +	unsigned long psize;
> > +	struct mmu_psize_def *def;
> > +
> > +	if (!kvm_is_radix(vcpu->kvm))
> > +		return H_UNSUPPORTED;
> > +
> > +	if (end < start)
> > +		return H_P5;
> > +
> > +	/*
> > +	 * Partition-scoped invalidation for nested guests.
> > +	 * Not yet supported
> > +	 */
> > +	if (type & H_RPTI_TYPE_NESTED)
> > +		return H_P3;
> > +
> > +	/*
> > +	 * Process-scoped invalidation for L1 guests.
> > +	 */
> > +	for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
> > +		def = &mmu_psize_defs[psize];
> > +		if (!(pg_sizes & def->h_rpt_pgsize))
> > +			continue;
> 
> Not that it really matters but why did you go this approach rather than
> use a bitmask iteration over h_rpt_pgsize?

If you are asking why I am not just looping over the hcall argument
@pg_sizes bitmask then, I was doing that in my earlier version. But
David suggested that it would be good to have page size encodings
of H_RPT_INVALIDATE within mmu_pgsize_defs[]. Based on this, I am
populating mmu_pgsize_defs[] during radix page size initialization
and using that here to check for those page sizes that have been set
in @pg_sizes.

> 
> I would actually prefer to put this loop into the TLB invalidation code
> itself.

Yes, I could easily move it there.

> 
> The reason is that not all flush types are based on page size. You only
> need to do IS=1/2/3 flushes once and it takes out all page sizes.

I see. So we have to do explicit flushing for different page sizes
only if we are doing range based invalidation (IS=0). For rest of
the cases (IS=1/2/3), that's not necessary.

> 
> You don't need to do all these optimisations right now, but it would
> be good to make them possible to implement.

Sure.

> > +void do_h_rpt_invalidate_prt(unsigned long pid, unsigned long lpid,
> > +			     unsigned long type, unsigned long page_size,
> > +			     unsigned long psize, unsigned long start,
> > +			     unsigned long end)
> > +{
> > +	/*
> > +	 * A H_RPTI_TYPE_ALL request implies RIC=3, hence
> > +	 * do a single IS=1 based flush.
> > +	 */
> > +	if ((type & H_RPTI_TYPE_ALL) == H_RPTI_TYPE_ALL) {
> > +		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_ALL);
> > +		return;
> > +	}
> > +
> > +	if (type & H_RPTI_TYPE_PWC)
> > +		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_PWC);
> > +
> > +	if (start == 0 && end == -1) /* PID */
> > +		_tlbie_pid_lpid(pid, lpid, RIC_FLUSH_TLB);
> > +	else /* EA */
> > +		_tlbie_va_range_lpid(start, end, pid, lpid, page_size,
> > +				     psize, false);
> 
> At least one thing that is probably needed is to use the 
> single_page_flush_ceiling to flip the va range flush over to a pid 
> flush, so the guest can't cause problems in the hypervisor with an 
> enormous range.

Yes, makes sense. I shall do this and the above as later optimizations.

Regards,
Bharata.
