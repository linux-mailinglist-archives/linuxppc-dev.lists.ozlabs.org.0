Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA7DF10FA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 09:24:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477KML4q71zF4r7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 19:24:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477KKT0XGCzDqHF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 19:22:52 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA68JB93011230
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 6 Nov 2019 03:22:49 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w3qy4vcax-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 03:22:48 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Wed, 6 Nov 2019 08:22:44 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 6 Nov 2019 08:22:41 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA68MdUC32374798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Nov 2019 08:22:39 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 542FFAE059;
 Wed,  6 Nov 2019 08:22:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79A3BAE055;
 Wed,  6 Nov 2019 08:22:37 +0000 (GMT)
Received: from in.ibm.com (unknown [9.124.35.101])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  6 Nov 2019 08:22:37 +0000 (GMT)
Date: Wed, 6 Nov 2019 13:52:35 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH v10 3/8] KVM: PPC: Shared pages support for secure guests
References: <20191104041800.24527-1-bharata@linux.ibm.com>
 <20191104041800.24527-4-bharata@linux.ibm.com>
 <20191106045238.GD12069@oak.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106045238.GD12069@oak.ozlabs.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 19110608-0012-0000-0000-0000036124CE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110608-0013-0000-0000-0000219C80AB
Message-Id: <20191106082235.GC21634@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-06_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=992 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911060087
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

On Wed, Nov 06, 2019 at 03:52:38PM +1100, Paul Mackerras wrote:
> On Mon, Nov 04, 2019 at 09:47:55AM +0530, Bharata B Rao wrote:
> > A secure guest will share some of its pages with hypervisor (Eg. virtio
> > bounce buffers etc). Support sharing of pages between hypervisor and
> > ultravisor.
> > 
> > Shared page is reachable via both HV and UV side page tables. Once a
> > secure page is converted to shared page, the device page that represents
> > the secure page is unmapped from the HV side page tables.
> 
> I'd like to understand a little better what's going on - see below...
> 
> > +/*
> > + * Shares the page with HV, thus making it a normal page.
> > + *
> > + * - If the page is already secure, then provision a new page and share
> > + * - If the page is a normal page, share the existing page
> > + *
> > + * In the former case, uses dev_pagemap_ops.migrate_to_ram handler
> > + * to unmap the device page from QEMU's page tables.
> > + */
> > +static unsigned long
> > +kvmppc_share_page(struct kvm *kvm, unsigned long gpa, unsigned long page_shift)
> > +{
> > +
> > +	int ret = H_PARAMETER;
> > +	struct page *uvmem_page;
> > +	struct kvmppc_uvmem_page_pvt *pvt;
> > +	unsigned long pfn;
> > +	unsigned long gfn = gpa >> page_shift;
> > +	int srcu_idx;
> > +	unsigned long uvmem_pfn;
> > +
> > +	srcu_idx = srcu_read_lock(&kvm->srcu);
> > +	mutex_lock(&kvm->arch.uvmem_lock);
> > +	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
> > +		uvmem_page = pfn_to_page(uvmem_pfn);
> > +		pvt = uvmem_page->zone_device_data;
> > +		pvt->skip_page_out = true;
> > +	}
> > +
> > +retry:
> > +	mutex_unlock(&kvm->arch.uvmem_lock);
> > +	pfn = gfn_to_pfn(kvm, gfn);
> 
> At this point, pfn is the value obtained from the page table for
> userspace (e.g. QEMU), right?

Yes.

> I would think it should be equal to
> uvmem_pfn in most cases, shouldn't it?

Yes, in most cases (Common case is to share a page that is already secure)

> If not, what is it going to
> be?

It can be a regular pfn if non-secure page is being shared again.

> 
> > +	if (is_error_noslot_pfn(pfn))
> > +		goto out;
> > +
> > +	mutex_lock(&kvm->arch.uvmem_lock);
> > +	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, &uvmem_pfn)) {
> > +		uvmem_page = pfn_to_page(uvmem_pfn);
> > +		pvt = uvmem_page->zone_device_data;
> > +		pvt->skip_page_out = true;
> > +		kvm_release_pfn_clean(pfn);
> 
> This is going to do a put_page(), unless pfn is a reserved pfn.  If it
> does a put_page(), where did we do the corresponding get_page()?

gfn_to_pfn() will come with a reference held.

> However, since kvmppc_gfn_is_uvmem_pfn() returned true, doesn't that
> mean that pfn here should be a device pfn, and in fact should be the
> same as uvmem_pfn (possibly with some extra bit(s) set)?

If secure page is being converted to share, pfn will be uvmem_pfn (device pfn).
If not, it will be regular pfn.

>  What does
> kvm_is_reserved_pfn() return for a device pfn?

From this code patch, we will never call kvm_release_pfn_clean() on a device
pfn. The prior call to gfn_to_pfn() would fault, result in page-out thus
converting the device pfn to regular pfn (page share request for secure page
case).

Regards,
Bharata.

