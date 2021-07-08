Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEB63BF4C3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 06:30:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GL3HB58hCz3bkN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 14:29:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BxBaxDVd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BxBaxDVd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GL3Gg6t0hz2yN9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jul 2021 14:29:31 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16843aLR087636; Thu, 8 Jul 2021 00:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : content-transfer-encoding : in-reply-to; s=pp1;
 bh=2/2FY0C+H7LwMRHMxKCHMeiU21F33OpFCGw6XAvVc6k=;
 b=BxBaxDVd2Rnisbh0w+ak/ezZvw+Z+C1d8bU+WEfOgb4XXBSYRDAJ6omYPieheMgJVOKs
 PzU3yPAYb9CRdlLnrLZCmofou0KpV8MT01PpM9HtDtFjazAOWTg0JlE9/BYh+KgmS+jd
 r+tVEF8kqoNkZ96svP9PHzKXQPf4KXmxfzX19VMXkHZk3LBbB+z9+AL0kEU0bcJsuAEt
 bCPEjwk/kNXkgxmCUwlDtHSrMcHprP9dnyp0FL+SU5vPVPfsFPbKFFXBwKZnqUdRpH0A
 EhKguUwvF66/TBkkGNWgzrR5eljEHeLHR+ajGkYgDtS3DVrKSvpqiHw3iQGBEnLu4g4r qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39nhcam4t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 00:29:21 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16843arO087650;
 Thu, 8 Jul 2021 00:29:21 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39nhcam4sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 00:29:21 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1684Mu3P029177;
 Thu, 8 Jul 2021 04:29:19 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 39jfh8h2th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 04:29:18 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1684TFFB34079114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Jul 2021 04:29:15 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BB94AE045;
 Thu,  8 Jul 2021 04:29:15 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA199AE053;
 Thu,  8 Jul 2021 04:29:13 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.82.66])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  8 Jul 2021 04:29:13 +0000 (GMT)
Date: Thu, 8 Jul 2021 09:59:08 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v8 3/6] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE
Message-ID: <YOZ/FNW1K/nzaaEe@in.ibm.com>
References: <20210621085003.904767-1-bharata@linux.ibm.com>
 <20210621085003.904767-4-bharata@linux.ibm.com>
 <YOKNub8mS4U4iox0@yekko> <YOPpiLJlsEBtTmgt@in.ibm.com>
 <YOZ3zNsGbSoymVKI@yekko>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YOZ3zNsGbSoymVKI@yekko>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jfhlcWEMcXpg08Afl9ML8v98cU2XhIc6
X-Proofpoint-GUID: g3mkWPg7Qn4mwh2ze_3t5w_1dZ0Y5M0B
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_01:2021-07-06,
 2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080020
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

On Thu, Jul 08, 2021 at 01:58:04PM +1000, David Gibson wrote:
> On Tue, Jul 06, 2021 at 10:56:32AM +0530, Bharata B Rao wrote:
> > On Mon, Jul 05, 2021 at 02:42:33PM +1000, David Gibson wrote:
> > > On Mon, Jun 21, 2021 at 02:20:00PM +0530, Bharata B Rao wrote:
> > > > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
> > > > index 4bc45d3ed8b0..b44f291fc909 100644
> > > > --- a/arch/powerpc/include/asm/mmu_context.h
> > > > +++ b/arch/powerpc/include/asm/mmu_context.h
> > > > @@ -124,8 +124,17 @@ static inline bool need_extra_context(struct mm_struct *mm, unsigned long ea)
> > > >  
> > > >  #if defined(CONFIG_KVM_BOOK3S_HV_POSSIBLE) && defined(CONFIG_PPC_RADIX_MMU)
> > > >  extern void radix_kvm_prefetch_workaround(struct mm_struct *mm);
> > > > +void do_h_rpt_invalidate_prt(unsigned long pid, unsigned long lpid,
> > > > +			     unsigned long type, unsigned long pg_sizes,
> > > > +			     unsigned long start, unsigned long end);
> > > >  #else
> > > >  static inline void radix_kvm_prefetch_workaround(struct mm_struct *mm) { }
> > > > +static inline void do_h_rpt_invalidate_prt(unsigned long pid,
> > > > +					   unsigned long lpid,
> > > > +					   unsigned long type,
> > > > +					   unsigned long pg_sizes,
> > > > +					   unsigned long start,
> > > > +					   unsigned long end) { }
> > > 
> > > Since the only plausible caller is in KVM HV code, why do you need the
> > > #else clause.
> > 
> > The call to the above routine is prevented for non-radix guests
> > in KVM HV code at runtime using kvm_is_radix() check and not by
> > CONFIG_PPC_RADIX_MMU. Hence the #else version would be needed.
> 
> kvm_is_radix() should evaluate to false at compile time if
> !defined(CONFIG_PPC_RADIX_MMU), in which case, no you shouldn't need
> the else version.

At least in the latest mainline, I don't see the definition of
kvm_is_radix() being conditional to CONFIG_PPC_RADIX_MMU.

Anyway this is what I see in practice if the #else version is
removed and CONFIG_PPC_RADIX_MMU is turned off:

arch/powerpc/kvm/book3s_hv.c: In function ‘kvmppc_h_rpt_invalidate’:
arch/powerpc/kvm/book3s_hv.c:983:2: error: implicit declaration of function ‘do_h_rpt_invalidate_prt’; did you mean ‘do_h_rpt_invalidate_pat’? [-Werror=implicit-function-declaration]
  983 |  do_h_rpt_invalidate_prt(id, vcpu->kvm->arch.lpid,
      |  ^~~~~~~~~~~~~~~~~~~~~~~
      |  do_h_rpt_invalidate_pat

Regards,
Bharata.
