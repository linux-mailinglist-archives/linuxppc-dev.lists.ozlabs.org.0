Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2423AFC09
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 06:36:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8DB52Tfwz307m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 14:36:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A+vCFmmp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=A+vCFmmp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8D9Y2sLmz303P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 14:36:00 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15M4Xbuu091720; Tue, 22 Jun 2021 00:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=AGDwcemshvvDa5KaOvazyT5mXvV7X9saUPN6dBSk3bo=;
 b=A+vCFmmp8CSu6CJz/kygdFvKbT6yrhqKE5ktKhm8hNekjIAJ1N1bkpYiAkuivz2UU8/r
 hmqShG1BhlI2KVMHwWBx4f39KF8NCNjTuyfjTwy0ED8XzRLJAW2hvDgS1pzGLbPyneNC
 c7F3Lrrn/lRQ1A81B9FV+7EFSlW3+L6sE4FH/5Wr1TaJLsvyKj7sz0Qa9IqclZF9NWYQ
 5tT3AERgGCUOiGWVF4aNKIj2xBaCnEPUjdSiYB+7GNGAYKYv9BBcaVEqM9bqYqGer0vj
 /HUo7wCwdntlxOrutoNOl1+CMkhtvPNDxPCzh4bnXy3ij+BPTIwEU1v9A5gw8pLsvhE9 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39b7sc9n1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 00:35:51 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15M4XktX092295;
 Tue, 22 Jun 2021 00:35:51 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39b7sc9n0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 00:35:51 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15M4SNK8029662;
 Tue, 22 Jun 2021 04:35:49 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 399878rnp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 04:35:48 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15M4ZkCd35258644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 04:35:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E49FAA4040;
 Tue, 22 Jun 2021 04:35:45 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A3B3A4057;
 Tue, 22 Jun 2021 04:35:44 +0000 (GMT)
Received: from in.ibm.com (unknown [9.77.207.147])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 22 Jun 2021 04:35:44 +0000 (GMT)
Date: Tue, 22 Jun 2021 10:05:39 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v8 4/6] KVM: PPC: Book3S HV: Nested support in
 H_RPT_INVALIDATE
Message-ID: <YNFom3Ojb4TGsKj2@in.ibm.com>
References: <20210621085003.904767-1-bharata@linux.ibm.com>
 <20210621085003.904767-5-bharata@linux.ibm.com>
 <YNDIitJ3Hn1/G8Jw@Ryzen-9-3900X.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNDIitJ3Hn1/G8Jw@Ryzen-9-3900X.localdomain>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tWkJ6r3UX81CDOX_QuvagqvKbKZLPriM
X-Proofpoint-ORIG-GUID: jZ0oli9M1_35iVx1wZN6TunZOD_U2Xry
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_14:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 phishscore=0
 mlxscore=0 clxscore=1011 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220026
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
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 21, 2021 at 10:12:42AM -0700, Nathan Chancellor wrote:
> > +long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
> > +			     unsigned long type, unsigned long pg_sizes,
> > +			     unsigned long start, unsigned long end)
> > +{
> > +	struct kvm_nested_guest *gp;
> > +	long ret;
> > +	unsigned long psize, ap;
> > +
> > +	/*
> > +	 * If L2 lpid isn't valid, we need to return H_PARAMETER.
> > +	 *
> > +	 * However, nested KVM issues a L2 lpid flush call when creating
> > +	 * partition table entries for L2. This happens even before the
> > +	 * corresponding shadow lpid is created in HV which happens in
> > +	 * H_ENTER_NESTED call. Since we can't differentiate this case from
> > +	 * the invalid case, we ignore such flush requests and return success.
> > +	 */
> > +	gp = kvmhv_find_nested(vcpu->kvm, lpid);
> > +	if (!gp)
> > +		return H_SUCCESS;
> > +
> > +	/*
> > +	 * A flush all request can be handled by a full lpid flush only.
> > +	 */
> > +	if ((type & H_RPTI_TYPE_NESTED_ALL) == H_RPTI_TYPE_NESTED_ALL)
> > +		return do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_ALL);
> > +
> > +	/*
> > +	 * We don't need to handle a PWC flush like process table here,
> > +	 * because intermediate partition scoped table in nested guest doesn't
> > +	 * really have PWC. Only level we have PWC is in L0 and for nested
> > +	 * invalidate at L0 we always do kvm_flush_lpid() which does
> > +	 * radix__flush_all_lpid(). For range invalidate at any level, we
> > +	 * are not removing the higher level page tables and hence there is
> > +	 * no PWC invalidate needed.
> > +	 *
> > +	 * if (type & H_RPTI_TYPE_PWC) {
> > +	 *	ret = do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_PWC);
> > +	 *	if (ret)
> > +	 *		return H_P4;
> > +	 * }
> > +	 */
> > +
> > +	if (start == 0 && end == -1)
> > +		return do_tlb_invalidate_nested_all(vcpu, lpid, RIC_FLUSH_TLB);
> > +
> > +	if (type & H_RPTI_TYPE_TLB) {
> > +		struct mmu_psize_def *def;
> > +		bool flush_lpid;
> > +		unsigned long nr_pages;
> > +
> > +		for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
> > +			def = &mmu_psize_defs[psize];
> > +			if (!(pg_sizes & def->h_rpt_pgsize))
> > +				continue;
> > +
> > +			nr_pages = (end - start) >> def->shift;
> > +			flush_lpid = nr_pages > tlb_range_flush_page_ceiling;
> > +			if (flush_lpid)
> > +				return do_tlb_invalidate_nested_all(vcpu, lpid,
> > +								RIC_FLUSH_TLB);
> > +
> > +			ret = do_tlb_invalidate_nested_tlb(vcpu, lpid,
> > +							   (1UL << def->shift),
> > +							   ap, start, end);
> 
> I have not seen this reported yet so apologies if it has and there is a
> fix I am missing:
> 
> arch/powerpc/kvm/book3s_hv_nested.c:1334:11: error: variable 'ap' is uninitialized when used here [-Werror,-Wuninitialized]
>                                                            ap, start, end);
>                                                            ^~
> arch/powerpc/kvm/book3s_hv_nested.c:1276:25: note: initialize the variable 'ap' to silence this warning
>         unsigned long psize, ap;
>                                ^
>                                 = 0

Thanks for catching this, this wasn't caught in my environment.

I will repost the series with proper initialization to ap.

Regards,
Bharata.
