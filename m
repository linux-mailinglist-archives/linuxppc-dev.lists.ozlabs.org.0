Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE402206BD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 10:06:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B692j6hbLzDqkZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 18:06:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B68zz6lGdzDqgb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 18:04:31 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06F83P4p004844; Wed, 15 Jul 2020 04:04:23 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 327u1jck5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 04:04:23 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06F7u1RB029025;
 Wed, 15 Jul 2020 08:04:03 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 329nmygcwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 08:04:03 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06F840pm58654852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 08:04:00 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94BECAE058;
 Wed, 15 Jul 2020 08:04:00 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F018AE055;
 Wed, 15 Jul 2020 08:03:58 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.50.82])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 15 Jul 2020 08:03:58 +0000 (GMT)
Date: Wed, 15 Jul 2020 13:33:56 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [v3 3/5] KVM: PPC: Book3S HV: migrate remaining normal-GFNs to
 secure-GFNs in H_SVM_INIT_DONE
Message-ID: <20200715080356.GK7902@in.ibm.com>
References: <1594458827-31866-1-git-send-email-linuxram@us.ibm.com>
 <1594458827-31866-4-git-send-email-linuxram@us.ibm.com>
 <20200713094506.GG7902@in.ibm.com>
 <20200715050541.GC7339@oc0525413822.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715050541.GC7339@oc0525413822.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_05:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 suspectscore=1 phishscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007150068
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
Cc: ldufour@linux.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 sathnaga@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 10:05:41PM -0700, Ram Pai wrote:
> On Mon, Jul 13, 2020 at 03:15:06PM +0530, Bharata B Rao wrote:
> > On Sat, Jul 11, 2020 at 02:13:45AM -0700, Ram Pai wrote:
> > > The Ultravisor is expected to explicitly call H_SVM_PAGE_IN for all the pages
> > >  
> > >  	if (!(*mig.src & MIGRATE_PFN_MIGRATE)) {
> > > -		ret = -1;
> > > +		ret = -2;
> > 
> > migrate_vma_setup() has marked that this pfn can't be migrated. What
> > transient errors are you observing which will disappear within 10
> > retries?
> > 
> > Also till now when UV used to pull in all the pages, we never seemed to
> > have hit these transient errors. But now when HV is pushing the same
> > pages, we see these errors which are disappearing after 10 retries.
> > Can you explain this more please? What sort of pages are these?
> 
> We did see them even before this patch. The retry alleviates the
> problem, but does not entirely eliminate it. If the chance of seeing
> the issue without the patch is 1%,  the chance of seeing this issue
> with this patch becomes 0.25%.

Okay, but may be we should investigate the problem a bit more to
understand why the page migrations are failing before taking this
route?

> 
> > 
> > >  		goto out_finalize;
> > >  	}
> > > +	bool retry = 0;
> ...snip...
> > > +
> > > +	*ret = 0;
> > > +	while (kvmppc_next_nontransitioned_gfn(memslot, kvm, &gfn)) {
> > > +
> > > +		down_write(&kvm->mm->mmap_sem);
> > 
> > Acquiring and releasing mmap_sem in a loop? Any reason?
> > 
> > Now that you have moved ksm_madvise() calls to init time, any specific
> > reason to take write mmap_sem here?
> 
> The semaphore protects the vma. right?

We took write lock just for ksm_madvise() and then downgraded to
read. Now that you are moving that to init time, read is sufficient here.

Regards,
Bharata.
