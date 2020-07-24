Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C5722C022
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 09:46:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCh906pQhzDrHj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 17:46:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCh5j1FCxzDsNT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 17:43:36 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06O7Vixb061404; Fri, 24 Jul 2020 03:43:27 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32faj7a8mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 03:43:27 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06O7eR5r006512;
 Fri, 24 Jul 2020 07:43:25 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 32brq83v9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 07:43:25 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06O7hMgA7209304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jul 2020 07:43:22 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CDB8AE055;
 Fri, 24 Jul 2020 07:43:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5578AE057;
 Fri, 24 Jul 2020 07:43:21 +0000 (GMT)
Received: from pomme.local (unknown [9.145.182.168])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Jul 2020 07:43:21 +0000 (GMT)
Subject: Re: [PATCH v5 7/7] KVM: PPC: Book3S HV: rework secure mem slot
 dropping
To: bharata@linux.ibm.com, Ram Pai <linuxram@us.ibm.com>
References: <1595534844-16188-1-git-send-email-linuxram@us.ibm.com>
 <1595534844-16188-8-git-send-email-linuxram@us.ibm.com>
 <20200724030337.GC1082478@in.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <68508568-25dd-ab57-b56c-9ce0dd7ae54d@linux.ibm.com>
Date: Fri, 24 Jul 2020 09:43:21 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724030337.GC1082478@in.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_01:2020-07-24,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 suspectscore=2 bulkscore=0 adultscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007240052
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
Cc: cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 sathnaga@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 24/07/2020 à 05:03, Bharata B Rao a écrit :
> On Thu, Jul 23, 2020 at 01:07:24PM -0700, Ram Pai wrote:
>> From: Laurent Dufour <ldufour@linux.ibm.com>
>>
>> When a secure memslot is dropped, all the pages backed in the secure
>> device (aka really backed by secure memory by the Ultravisor)
>> should be paged out to a normal page. Previously, this was
>> achieved by triggering the page fault mechanism which is calling
>> kvmppc_svm_page_out() on each pages.
>>
>> This can't work when hot unplugging a memory slot because the memory
>> slot is flagged as invalid and gfn_to_pfn() is then not trying to access
>> the page, so the page fault mechanism is not triggered.
>>
>> Since the final goal is to make a call to kvmppc_svm_page_out() it seems
>> simpler to call directly instead of triggering such a mechanism. This
>> way kvmppc_uvmem_drop_pages() can be called even when hot unplugging a
>> memslot.
>>
>> Since kvmppc_uvmem_drop_pages() is already holding kvm->arch.uvmem_lock,
>> the call to __kvmppc_svm_page_out() is made.  As
>> __kvmppc_svm_page_out needs the vma pointer to migrate the pages,
>> the VMA is fetched in a lazy way, to not trigger find_vma() all
>> the time. In addition, the mmap_sem is held in read mode during
>> that time, not in write mode since the virual memory layout is not
>> impacted, and kvm->arch.uvmem_lock prevents concurrent operation
>> on the secure device.
>>
>> Cc: Ram Pai <linuxram@us.ibm.com>
>> Cc: Bharata B Rao <bharata@linux.ibm.com>
>> Cc: Paul Mackerras <paulus@ozlabs.org>
>> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
>> 	[modified the changelog description]
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>>   arch/powerpc/kvm/book3s_hv_uvmem.c | 54 ++++++++++++++++++++++++++------------
>>   1 file changed, 37 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> index c772e92..daffa6e 100644
>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> @@ -632,35 +632,55 @@ static inline int kvmppc_svm_page_out(struct vm_area_struct *vma,
>>    * fault on them, do fault time migration to replace the device PTEs in
>>    * QEMU page table with normal PTEs from newly allocated pages.
>>    */
>> -void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *free,
>> +void kvmppc_uvmem_drop_pages(const struct kvm_memory_slot *slot,
>>   			     struct kvm *kvm, bool skip_page_out)
>>   {
>>   	int i;
>>   	struct kvmppc_uvmem_page_pvt *pvt;
>> -	unsigned long pfn, uvmem_pfn;
>> -	unsigned long gfn = free->base_gfn;
>> +	struct page *uvmem_page;
>> +	struct vm_area_struct *vma = NULL;
>> +	unsigned long uvmem_pfn, gfn;
>> +	unsigned long addr, end;
>> +
>> +	mmap_read_lock(kvm->mm);
>> +
>> +	addr = slot->userspace_addr;
>> +	end = addr + (slot->npages * PAGE_SIZE);
>>   
>> -	for (i = free->npages; i; --i, ++gfn) {
>> -		struct page *uvmem_page;
>> +	gfn = slot->base_gfn;
>> +	for (i = slot->npages; i; --i, ++gfn, addr += PAGE_SIZE) {
>> +
>> +		/* Fetch the VMA if addr is not in the latest fetched one */
>> +		if (!vma || (addr < vma->vm_start || addr >= vma->vm_end)) {
>> +			vma = find_vma_intersection(kvm->mm, addr, end);
>> +			if (!vma ||
>> +			    vma->vm_start > addr || vma->vm_end < end) {
>> +				pr_err("Can't find VMA for gfn:0x%lx\n", gfn);
>> +				break;
>> +			}
> 
> There is a potential issue with the boundary condition check here
> which I discussed with Laurent yesterday. Guess he hasn't gotten around
> to look at it yet.

Right, I'm working on that..


