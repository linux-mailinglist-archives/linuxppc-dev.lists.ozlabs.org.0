Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FA99579D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 08:47:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CLtp1rN5zDr22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 16:46:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CLrL2DYMzDqxj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 16:44:49 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7K6hGPY060846
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 02:44:47 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ugbufg20p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 02:44:47 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Tue, 20 Aug 2019 07:44:45 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 07:44:41 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7K6iJ0B24052144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 06:44:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43A364C046;
 Tue, 20 Aug 2019 06:44:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 687304C040;
 Tue, 20 Aug 2019 06:44:38 +0000 (GMT)
Received: from in.ibm.com (unknown [9.124.35.129])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 20 Aug 2019 06:44:38 +0000 (GMT)
Date: Tue, 20 Aug 2019 12:14:36 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Subject: Re: [PATCH v6 1/7] kvmppc: Driver to manage pages of secure guest
References: <20190809084108.30343-1-bharata@linux.ibm.com>
 <20190809084108.30343-2-bharata@linux.ibm.com>
 <1566282135.2166.6.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566282135.2166.6.camel@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-TM-AS-GCONF: 00
x-cbid: 19082006-4275-0000-0000-0000035AFA9A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082006-4276-0000-0000-0000386D1951
Message-Id: <20190820064436.GE8784@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=967 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200070
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
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, aneesh.kumar@linux.vnet.ibm.com,
 paulus@au1.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 20, 2019 at 04:22:15PM +1000, Suraj Jitindar Singh wrote:
> On Fri, 2019-08-09 at 14:11 +0530, Bharata B Rao wrote:
> > KVMPPC driver to manage page transitions of secure guest
> > via H_SVM_PAGE_IN and H_SVM_PAGE_OUT hcalls.
> > 
> > H_SVM_PAGE_IN: Move the content of a normal page to secure page
> > H_SVM_PAGE_OUT: Move the content of a secure page to normal page
> > 
> > Private ZONE_DEVICE memory equal to the amount of secure memory
> > available in the platform for running secure guests is created
> > via a char device. Whenever a page belonging to the guest becomes
> > secure, a page from this private device memory is used to
> > represent and track that secure page on the HV side. The movement
> > of pages between normal and secure memory is done via
> > migrate_vma_pages() using UV_PAGE_IN and UV_PAGE_OUT ucalls.
> 
> Hi Bharata,
> 
> please see my patch where I define the bits which define the type of
> the rmap entry:
> https://patchwork.ozlabs.org/patch/1149791/
> 
> Please add an entry for the devm pfn type like:
> #define KVMPPC_RMAP_PFN_DEVM 0x0200000000000000 /* secure guest devm
> pfn */
> 
> And the following in the appropriate header file
> 
> static inline bool kvmppc_rmap_is_pfn_demv(unsigned long *rmapp)
> {
> 	return !!((*rmapp & KVMPPC_RMAP_TYPE_MASK) ==
> KVMPPC_RMAP_PFN_DEVM));
> }
> 

Sure, I have the equivalents defined locally, will move to appropriate
headers.

> Also see comment below.
> 
> > +static struct page *kvmppc_devm_get_page(unsigned long *rmap,
> > +					unsigned long gpa, unsigned
> > int lpid)
> > +{
> > +	struct page *dpage = NULL;
> > +	unsigned long bit, devm_pfn;
> > +	unsigned long nr_pfns = kvmppc_devm.pfn_last -
> > +				kvmppc_devm.pfn_first;
> > +	unsigned long flags;
> > +	struct kvmppc_devm_page_pvt *pvt;
> > +
> > +	if (kvmppc_is_devm_pfn(*rmap))
> > +		return NULL;
> > +
> > +	spin_lock_irqsave(&kvmppc_devm_lock, flags);
> > +	bit = find_first_zero_bit(kvmppc_devm.pfn_bitmap, nr_pfns);
> > +	if (bit >= nr_pfns)
> > +		goto out;
> > +
> > +	bitmap_set(kvmppc_devm.pfn_bitmap, bit, 1);
> > +	devm_pfn = bit + kvmppc_devm.pfn_first;
> > +	dpage = pfn_to_page(devm_pfn);
> > +
> > +	if (!trylock_page(dpage))
> > +		goto out_clear;
> > +
> > +	*rmap = devm_pfn | KVMPPC_PFN_DEVM;
> > +	pvt = kzalloc(sizeof(*pvt), GFP_ATOMIC);
> > +	if (!pvt)
> > +		goto out_unlock;
> > +	pvt->rmap = rmap;
> 
> Am I missing something, why does the rmap need to be stored in pvt?
> Given the gpa is already stored and this is enough to get back to the
> rmap entry, right?

I use rmap entry to note that this guest page is secure and is being
represented by device memory page on the HV side. When the page becomes
normal again, I need to undo that from dev_pagemap_ops.page_free()
where I don't have gpa.

Regards,
Bharata.

