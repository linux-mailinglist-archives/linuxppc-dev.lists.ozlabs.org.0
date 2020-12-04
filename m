Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 108322CF268
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 17:54:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cnf2P3HV7zDrMT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 03:54:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FWWHT4f8; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cnf0H6JJnzDrKq
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 03:53:00 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4FL8No032566; Fri, 4 Dec 2020 11:52:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=ql4mDmfKOvXy3satDXHjYSHs7JK3+enwlw6GFQ7C//c=;
 b=FWWHT4f8mgVP2alh6I3HNzwri+wE1lc2cnDnJhKaDr2ocH5ZaJlHBE+/o2tZ6mHjj2Qm
 jRVSzYM3l3nVBokiVYTlslrr2urTot2y6/ElSzjDaHj/VKOf/dRbww9MEXZkSm5lYmFw
 TOClkuXR3DghfHDoh+yOLHBYFMrcIPaoRPHIsT6JzQFaveOX+W7q3XpR0fXWwIYECA7g
 FS+TdXzZGoLP4A5NVgwxCO7r4+WgmJ6ML4HbvJkwm/iwnAYwiE8IV9zaKyFlGcm8d0MA
 ofEeTDxdUrjzpfYaNg5xQwTrMj4Oh2W7BDOHeTP+pLc+rw+p1YLnV10lIllkBanxA5YG Qw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357m8gshvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 11:52:52 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4GS6E5009780;
 Fri, 4 Dec 2020 16:52:51 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3573v9ryyb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 16:52:51 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4GqnGC2884290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 16:52:49 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA3DBAE04D;
 Fri,  4 Dec 2020 16:52:48 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 499B0AE051;
 Fri,  4 Dec 2020 16:52:47 +0000 (GMT)
Received: from ram-ibm-com.ibm.com (unknown [9.80.218.6])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  4 Dec 2020 16:52:47 +0000 (GMT)
Date: Fri, 4 Dec 2020 08:52:44 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH] powerpc/book3s_hv_uvmem: Check for failed page migration
Message-ID: <20201204165244.GA3390@ram-ibm-com.ibm.com>
References: <20201203050812.5234-1-alistair@popple.id.au>
 <20201204101841.GA621541@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204101841.GA621541@in.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_05:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040088
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 04, 2020 at 03:48:41PM +0530, Bharata B Rao wrote:
> On Thu, Dec 03, 2020 at 04:08:12PM +1100, Alistair Popple wrote:
> > migrate_vma_pages() may still clear MIGRATE_PFN_MIGRATE on pages which
> > are not able to be migrated. Drivers may safely copy data prior to
> > calling migrate_vma_pages() however a remote mapping must not be
> > established until after migrate_vma_pages() has returned as the
> > migration could still fail.
> > 
> > UV_PAGE_IN_in both copies and maps the data page, therefore it should
> > only be called after checking the results of migrate_vma_pages().
> > 
> > Signed-off-by: Alistair Popple <alistair@popple.id.au>
> > ---
> >  arch/powerpc/kvm/book3s_hv_uvmem.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > index 84e5a2dc8be5..08aa6a90c525 100644
> > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > @@ -762,7 +762,10 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
> >  		goto out_finalize;
> >  	}
> >  
> > -	if (pagein) {
> > +	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> > +	migrate_vma_pages(&mig);
> > +
> > +	if ((*mig.src & MIGRATE_PFN_MIGRATE) && pagein) {
> >  		pfn = *mig.src >> MIGRATE_PFN_SHIFT;
> >  		spage = migrate_pfn_to_page(*mig.src);
> >  		if (spage) {
> > @@ -773,8 +776,6 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
> >  		}
> >  	}
> >  
> > -	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> > -	migrate_vma_pages(&mig);
> >  out_finalize:
> >  	migrate_vma_finalize(&mig);
> >  	return ret;

This patch certainly looks like the problem, that has been hurting
us for a while.  Let me run this patch through my SVM tests.  Looks very
promising.

BTW: The code does a similar thing while paging out.  It pages out from the
UV, and then does the migration. Is there a bug there aswell?

RP
