Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E1F22ADE9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 13:41:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC9Qs2wPlzDrN4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 21:41:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC9NV2BsJzDrMy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 21:39:37 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NBV5IC006580; Thu, 23 Jul 2020 07:39:30 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32f6wbw4kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 07:39:29 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06NBVUiC007238;
 Thu, 23 Jul 2020 11:39:28 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 32brq7p48v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 11:39:28 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06NBdPM223396722
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 11:39:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FC7DA404D;
 Thu, 23 Jul 2020 11:39:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E04DA4053;
 Thu, 23 Jul 2020 11:39:22 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.211.150.76])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Jul 2020 11:39:21 +0000 (GMT)
Date: Thu, 23 Jul 2020 04:39:18 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [v4 3/5] KVM: PPC: Book3S HV: in H_SVM_INIT_DONE, migrate
 remaining normal-GFNs to secure-GFNs.
Message-ID: <20200723113918.GB5493@oc0525413822.ibm.com>
References: <1594972827-13928-1-git-send-email-linuxram@us.ibm.com>
 <1594972827-13928-4-git-send-email-linuxram@us.ibm.com>
 <20200723061037.GA1082478@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723061037.GA1082478@in.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_03:2020-07-23,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=875 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230083
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

On Thu, Jul 23, 2020 at 11:40:37AM +0530, Bharata B Rao wrote:
> On Fri, Jul 17, 2020 at 01:00:25AM -0700, Ram Pai wrote:
> >  
> > +int kvmppc_uv_migrate_mem_slot(struct kvm *kvm,
> > +		const struct kvm_memory_slot *memslot)
> 
> Don't see any callers for this outside of this file, so why not static?
> 
> > +{
> > +	unsigned long gfn = memslot->base_gfn;
> > +	struct vm_area_struct *vma;
> > +	unsigned long start, end;
> > +	int ret = 0;
> > +
> > +	while (kvmppc_next_nontransitioned_gfn(memslot, kvm, &gfn)) {
> 
> So you checked the state of gfn under uvmem_lock above, but release
> it too.
> 
> > +
> > +		mmap_read_lock(kvm->mm);
> > +		start = gfn_to_hva(kvm, gfn);
> > +		if (kvm_is_error_hva(start)) {
> > +			ret = H_STATE;
> > +			goto next;
> > +		}
> > +
> > +		end = start + (1UL << PAGE_SHIFT);
> > +		vma = find_vma_intersection(kvm->mm, start, end);
> > +		if (!vma || vma->vm_start > start || vma->vm_end < end) {
> > +			ret = H_STATE;
> > +			goto next;
> > +		}
> > +
> > +		mutex_lock(&kvm->arch.uvmem_lock);
> > +		ret = kvmppc_svm_migrate_page(vma, start, end,
> > +				(gfn << PAGE_SHIFT), kvm, PAGE_SHIFT, false);
> 
> What is the guarantee that the gfn is in the same earlier state when you do
> do migration here?

Are you worried about the case, where someother thread will sneak-in and
migrate the GFN, and this migration request will become a duplicate one?

That is theortically possible, though practically improbable. This
transition is attempted only when there is one vcpu active in the VM.

However, may be, we should not bake-in that assumption in this code.
Will remove that assumption.

RP
