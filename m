Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8953130B1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 12:24:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ3Zn330QzDqd1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 22:24:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AOJraINU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZ3Hn247BzDr0C
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Feb 2021 22:11:31 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 118B3T9o020361; Mon, 8 Feb 2021 06:11:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pakubhC/bKDxrxp1q59W2jEv0vufHIDblQmhSmH/KZg=;
 b=AOJraINU24Tt5c5XPMjGhsParnW90G5gOnOTKuOT2M7YgFnO/kHpZOya0TFO38i2HRib
 bZRvnRGWjSIIpYALdqozJ8EUD8unaZ0dp5rrFC/SVxZqt9h97FInspcSkooACbHRqffV
 Y0xDaQDN5ZIfkPOUG9plsctQ5T9drTdTpaTUiQ4SrDX+tXSHMc6pUyTaIOezT1QCC23g
 Gm1ysFH8qPptkgcbA+CoxTKqkAYGECxGiCtM4DaS9A6swr6+i6g+Fhtcl5Ert6HKW+dR
 dz5pWUYNtaGaIRlzBTbh+pBZQKqknrN8e9Iydp+NjWcqSSExwUp6jS297PztyR/b+ke2 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36k43a0ckd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 06:11:08 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 118B4DAN025188;
 Mon, 8 Feb 2021 06:11:07 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36k43a0ch9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 06:11:07 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 118B36Ki015504;
 Mon, 8 Feb 2021 11:11:05 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 36hjr890ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 11:11:04 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 118BB1iU39518476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Feb 2021 11:11:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF62A4203F;
 Mon,  8 Feb 2021 11:11:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B17A742049;
 Mon,  8 Feb 2021 11:10:59 +0000 (GMT)
Received: from [9.199.47.177] (unknown [9.199.47.177])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Feb 2021 11:10:59 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/uprobes: Validation for prefixed instruction
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
References: <20210204104703.273429-1-ravi.bangoria@linux.ibm.com>
 <20210204130821.GK210@DESKTOP-TDPLP67.localdomain>
 <20210204161211.GM210@DESKTOP-TDPLP67.localdomain>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <a685dcd5-4e2a-dcdc-ae10-eeaf826db362@linux.ibm.com>
Date: Mon, 8 Feb 2021 16:40:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204161211.GM210@DESKTOP-TDPLP67.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-08_03:2021-02-08,
 2021-02-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 mlxscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080074
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, oleg@redhat.com,
 rostedt@goodmis.org, linux-kernel@vger.kernel.org, paulus@samba.org,
 sandipan@linux.ibm.com, jniethe5@gmail.com, naveen.n.rao@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/4/21 9:42 PM, Naveen N. Rao wrote:
> On 2021/02/04 06:38PM, Naveen N. Rao wrote:
>> On 2021/02/04 04:17PM, Ravi Bangoria wrote:
>>> Don't allow Uprobe on 2nd word of a prefixed instruction. As per
>>> ISA 3.1, prefixed instruction should not cross 64-byte boundary.
>>> So don't allow Uprobe on such prefixed instruction as well.
>>>
>>> There are two ways probed instruction is changed in mapped pages.
>>> First, when Uprobe is activated, it searches for all the relevant
>>> pages and replace instruction in them. In this case, if we notice
>>> that probe is on the 2nd word of prefixed instruction, error out
>>> directly. Second, when Uprobe is already active and user maps a
>>> relevant page via mmap(), instruction is replaced via mmap() code
>>> path. But because Uprobe is invalid, entire mmap() operation can
>>> not be stopped. In this case just print an error and continue.
>>>
>>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>>> ---
>>> v1: http://lore.kernel.org/r/20210119091234.76317-1-ravi.bangoria@linux.ibm.com
>>> v1->v2:
>>>    - Instead of introducing new arch hook from verify_opcode(), use
>>>      existing hook arch_uprobe_analyze_insn().
>>>    - Add explicit check for prefixed instruction crossing 64-byte
>>>      boundary. If probe is on such instruction, throw an error.
>>>
>>>   arch/powerpc/kernel/uprobes.c | 66 ++++++++++++++++++++++++++++++++++-
>>>   1 file changed, 65 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
>>> index e8a63713e655..485d19a2a31f 100644
>>> --- a/arch/powerpc/kernel/uprobes.c
>>> +++ b/arch/powerpc/kernel/uprobes.c
>>> @@ -7,6 +7,7 @@
>>>    * Adapted from the x86 port by Ananth N Mavinakayanahalli <ananth@in.ibm.com>
>>>    */
>>>   #include <linux/kernel.h>
>>> +#include <linux/highmem.h>
>>>   #include <linux/sched.h>
>>>   #include <linux/ptrace.h>
>>>   #include <linux/uprobes.h>
>>> @@ -28,6 +29,69 @@ bool is_trap_insn(uprobe_opcode_t *insn)
>>>   	return (is_trap(*insn));
>>>   }
>>>   
>>> +#ifdef CONFIG_PPC64
>>> +static int get_instr(struct mm_struct *mm, unsigned long addr, u32 *instr)
>>> +{
>>> +	struct page *page;
>>> +	struct vm_area_struct *vma;
>>> +	void *kaddr;
>>> +	unsigned int gup_flags = FOLL_FORCE | FOLL_SPLIT_PMD;
>>> +
>>> +	if (get_user_pages_remote(mm, addr, 1, gup_flags, &page, &vma, NULL) <= 0)
>>> +		return -EINVAL;
>>> +
>>> +	kaddr = kmap_atomic(page);
>>> +	*instr = *((u32 *)(kaddr + (addr & ~PAGE_MASK)));
>>> +	kunmap_atomic(kaddr);
>>> +	put_page(page);
>>> +	return 0;
>>> +}
>>> +
>>> +static int validate_prefixed_instr(struct mm_struct *mm, unsigned long addr)
>>> +{
>>> +	struct ppc_inst inst;
>>> +	u32 prefix, suffix;
>>> +
>>> +	/*
>>> +	 * No need to check if addr is pointing to beginning of the
>>> +	 * page. Even if probe is on a suffix of page-unaligned
>>> +	 * prefixed instruction, hw will raise exception and kernel
>>> +	 * will send SIGBUS.
>>> +	 */
>>> +	if (!(addr & ~PAGE_MASK))
>>> +		return 0;
>>> +
>>> +	if (get_instr(mm, addr, &prefix) < 0)
>>> +		return -EINVAL;
>>> +	if (get_instr(mm, addr + 4, &suffix) < 0)
>>> +		return -EINVAL;
>>> +
>>> +	inst = ppc_inst_prefix(prefix, suffix);
>>> +	if (ppc_inst_prefixed(inst) && (addr & 0x3F) == 0x3C) {
>>> +		printk_ratelimited("Cannot register a uprobe on 64 byte "
>> 		^^^^^^^^^^^^^^^^^^ pr_info_ratelimited()
>>
>> It should be sufficient to check the primary opcode to determine if it
>> is a prefixed instruction. You don't have to read the suffix. I see that
>> we don't have a helper to do this currently, so you could do:
>>
>> 	if (ppc_inst_primary_opcode(ppc_inst(prefix)) == 1)
> 
> Seeing the kprobes code, I realized that we have to check for another
> scenario (Thanks, Jordan!). If this is the suffix of a prefix
> instruction for which a uprobe has already been installed, then the
> previous word will be a 'trap' instruction. You need to check if there
> is a uprobe at the previous word, and if the original instruction there
> was a prefix instruction.

Yes, this patch will fail to detect such scenario. I think I should
read the instruction directly from file, like what copy_insn() does.
With that, I'll get original instruction rather that 'trap'.

I'll think more along this line.

Ravi
