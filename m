Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0245122AE31
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 13:46:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC9Wv04cqzDrPy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 21:46:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC9Tw5QmLzDq9n
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 21:44:20 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NBWddM118568; Thu, 23 Jul 2020 07:44:13 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32bvqxjv5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 07:44:13 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06NBUZU1004327;
 Thu, 23 Jul 2020 11:44:10 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 32brq839yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 11:44:10 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06NBi7pm47251600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 11:44:07 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99B44AE051;
 Thu, 23 Jul 2020 11:44:07 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BB36AE057;
 Thu, 23 Jul 2020 11:44:04 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.211.150.76])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Jul 2020 11:44:04 +0000 (GMT)
Date: Thu, 23 Jul 2020 04:44:01 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [v4 4/5] KVM: PPC: Book3S HV: retry page migration before
 erroring-out
Message-ID: <20200723114401.GC5493@oc0525413822.ibm.com>
References: <1594972827-13928-1-git-send-email-linuxram@us.ibm.com>
 <1594972827-13928-5-git-send-email-linuxram@us.ibm.com>
 <20200723061344.GB1082478@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723061344.GB1082478@in.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_03:2020-07-23,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=611 spamscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230087
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
Cc: ldufour@linux.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 sathnaga@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I am dropping this patch based on our conversation, where we agreed, we
need to rootcause the migration failure.

On Thu, Jul 23, 2020 at 11:43:44AM +0530, Bharata B Rao wrote:
> On Fri, Jul 17, 2020 at 01:00:26AM -0700, Ram Pai wrote:
> > @@ -812,7 +842,7 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
> >  	struct vm_area_struct *vma;
> >  	int srcu_idx;
> >  	unsigned long gfn = gpa >> page_shift;
> > -	int ret;
> > +	int ret, repeat_count = REPEAT_COUNT;
> >  
> >  	if (!(kvm->arch.secure_guest & KVMPPC_SECURE_INIT_START))
> >  		return H_UNSUPPORTED;
> > @@ -826,34 +856,44 @@ unsigned long kvmppc_h_svm_page_in(struct kvm *kvm, unsigned long gpa,
> >  	if (flags & H_PAGE_IN_SHARED)
> >  		return kvmppc_share_page(kvm, gpa, page_shift);
> >  
> > -	ret = H_PARAMETER;
> >  	srcu_idx = srcu_read_lock(&kvm->srcu);
> > -	mmap_read_lock(kvm->mm);
> >  
> > -	start = gfn_to_hva(kvm, gfn);
> > -	if (kvm_is_error_hva(start))
> > -		goto out;
> > -
> > -	mutex_lock(&kvm->arch.uvmem_lock);
> >  	/* Fail the page-in request of an already paged-in page */
> > -	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, NULL))
> > -		goto out_unlock;
> > +	mutex_lock(&kvm->arch.uvmem_lock);
> > +	ret = kvmppc_gfn_is_uvmem_pfn(gfn, kvm, NULL);
> > +	mutex_unlock(&kvm->arch.uvmem_lock);
> 
> Same comment as for the prev patch. I don't think you can release
> the lock here.
> 
> > +	if (ret) {
> > +		srcu_read_unlock(&kvm->srcu, srcu_idx);
> > +		return H_PARAMETER;
> > +	}
> >  
> > -	end = start + (1UL << page_shift);
> > -	vma = find_vma_intersection(kvm->mm, start, end);
> > -	if (!vma || vma->vm_start > start || vma->vm_end < end)
> > -		goto out_unlock;
> > +	do {
> > +		ret = H_PARAMETER;
> > +		mmap_read_lock(kvm->mm);
> >  
> > -	if (kvmppc_svm_migrate_page(vma, start, end, gpa, kvm, page_shift,
> > -				true))
> > -		goto out_unlock;
> > +		start = gfn_to_hva(kvm, gfn);
> > +		if (kvm_is_error_hva(start)) {
> > +			mmap_read_unlock(kvm->mm);
> > +			break;
> > +		}
> >  
> > -	ret = H_SUCCESS;
> > +		end = start + (1UL << page_shift);
> > +		vma = find_vma_intersection(kvm->mm, start, end);
> > +		if (!vma || vma->vm_start > start || vma->vm_end < end) {
> > +			mmap_read_unlock(kvm->mm);
> > +			break;
> > +		}
> > +
> > +		mutex_lock(&kvm->arch.uvmem_lock);
> > +		ret = kvmppc_svm_migrate_page(vma, start, end, gpa, kvm, page_shift, true);
> > +		mutex_unlock(&kvm->arch.uvmem_lock);
> > +
> > +		mmap_read_unlock(kvm->mm);
> > +	} while (ret == -2 && repeat_count--);
> > +
> > +	if (ret == -2)
> > +		ret = H_BUSY;
> >  
> > -out_unlock:
> > -	mutex_unlock(&kvm->arch.uvmem_lock);
> > -out:
> > -	mmap_read_unlock(kvm->mm);
> >  	srcu_read_unlock(&kvm->srcu, srcu_idx);
> >  	return ret;
> >  }
> > -- 
> > 1.8.3.1

-- 
Ram Pai
