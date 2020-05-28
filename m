Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BCB1E61DE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 15:12:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Xp5M4cxrzDqXg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 23:12:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bm9Aw5pg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Xp1D4WZbzDqXY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 23:08:48 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04SD2jHI194739; Thu, 28 May 2020 09:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DDyT/2iGjdh/+dSX/wXPGaVtZtT2nP5xNp/QI7s5OkI=;
 b=bm9Aw5pgN3s3JQiAej4oL5OvSZ7IVvLZghFRuAFRY7RYhuvoIFtSZd/6XVuv9CrqngcF
 tnGhfjSLbNrfEJAn7EAwda4U/QECVKyvvZ1Yu6L7+6k6PCgNxJWD8kk00c9qANeD0QD6
 JJCqszHIFeFnHObJNgj/qHuraAtOl3b2zCC185W2nBHpf8HYoTprM8aMQzDg2FspLEkW
 B5RcHDY7tycqolN9fHSvHZbnAMgoCy3Wlt/QcKW+41MzoJiiNroXOExfqo3jEqxQtLTg
 Ad8vdqs+T2zNE/5+RoKDxMEQobdR1AnJ09f73rIgvqRpRwKlzpwslNOWCQW2VS1esCt+ Bw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 319qns93da-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 May 2020 09:08:41 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04SD1llr030512;
 Thu, 28 May 2020 13:08:38 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 316uf9203a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 May 2020 13:08:38 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04SD8aki55050374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 May 2020 13:08:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 722934C059;
 Thu, 28 May 2020 13:08:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63A784C040;
 Thu, 28 May 2020 13:08:35 +0000 (GMT)
Received: from [9.85.101.128] (unknown [9.85.101.128])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 May 2020 13:08:35 +0000 (GMT)
Subject: Re: [PATCH] powerpc/book3s64/kvm: Fix secondary page table walk
 warning during migration
To: Michael Ellerman <mpe@ellerman.id.au>, kvm-ppc@vger.kernel.org,
 paulus@ozlabs.org
References: <20200528080456.87797-1-aneesh.kumar@linux.ibm.com>
 <87a71sjk4o.fsf@mpe.ellerman.id.au>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <40a184eb-b6ae-6d74-503e-140f1b2a256c@linux.ibm.com>
Date: Thu, 28 May 2020 18:38:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87a71sjk4o.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-28_03:2020-05-28,
 2020-05-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 cotscore=-2147483648
 spamscore=0 priorityscore=1501 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005280087
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/28/20 6:23 PM, Michael Ellerman wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> This patch fix the below warning reported during migration.
>>
>>   find_kvm_secondary_pte called with kvm mmu_lock not held
>>   CPU: 23 PID: 5341 Comm: qemu-system-ppc Tainted: G        W         5.7.0-rc5-kvm-00211-g9ccf10d6d088 #432
>>   NIP:  c008000000fe848c LR: c008000000fe8488 CTR: 0000000000000000
>>   REGS: c000001e19f077e0 TRAP: 0700   Tainted: G        W          (5.7.0-rc5-kvm-00211-g9ccf10d6d088)
>>   MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 42222422  XER: 20040000
>>   CFAR: c00000000012f5ac IRQMASK: 0
>>   GPR00: c008000000fe8488 c000001e19f07a70 c008000000ffe200 0000000000000039
>>   GPR04: 0000000000000001 c000001ffc8b4900 0000000000018840 0000000000000007
>>   GPR08: 0000000000000003 0000000000000001 0000000000000007 0000000000000001
>>   GPR12: 0000000000002000 c000001fff6d9400 000000011f884678 00007fff70b70000
>>   GPR16: 00007fff7137cb90 00007fff7dcb4410 0000000000000001 0000000000000000
>>   GPR20: 000000000ffe0000 0000000000000000 0000000000000001 0000000000000000
>>   GPR24: 8000000000000000 0000000000000001 c000001e1f67e600 c000001e1fd82410
>>   GPR28: 0000000000001000 c000001e2e410000 0000000000000fff 0000000000000ffe
>>   NIP [c008000000fe848c] kvmppc_hv_get_dirty_log_radix+0x2e4/0x340 [kvm_hv]
>>   LR [c008000000fe8488] kvmppc_hv_get_dirty_log_radix+0x2e0/0x340 [kvm_hv]
>>   Call Trace:
>>   [c000001e19f07a70] [c008000000fe8488] kvmppc_hv_get_dirty_log_radix+0x2e0/0x340 [kvm_hv] (unreliable)
>>   [c000001e19f07b50] [c008000000fd42e4] kvm_vm_ioctl_get_dirty_log_hv+0x33c/0x3c0 [kvm_hv]
>>   [c000001e19f07be0] [c008000000eea878] kvm_vm_ioctl_get_dirty_log+0x30/0x50 [kvm]
>>   [c000001e19f07c00] [c008000000edc818] kvm_vm_ioctl+0x2b0/0xc00 [kvm]
>>   [c000001e19f07d50] [c00000000046e148] ksys_ioctl+0xf8/0x150
>>   [c000001e19f07da0] [c00000000046e1c8] sys_ioctl+0x28/0x80
>>   [c000001e19f07dc0] [c00000000003652c] system_call_exception+0x16c/0x240
>>   [c000001e19f07e20] [c00000000000d070] system_call_common+0xf0/0x278
>>   Instruction dump:
>>   7d3a512a 4200ffd0 7ffefb78 4bfffdc4 60000000 3c820000 e8848468 3c620000
>>   e86384a8 38840010 4800673d e8410018 <0fe00000> 4bfffdd4 60000000 60000000
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/kvm_book3s_64.h |  9 ++++++
>>   arch/powerpc/kvm/book3s_64_mmu_radix.c   | 35 ++++++++++++++++++++----
>>   2 files changed, 38 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
>> index c58e64a0a74f..cd5bad08b8d3 100644
>> --- a/arch/powerpc/include/asm/kvm_book3s_64.h
>> +++ b/arch/powerpc/include/asm/kvm_book3s_64.h
>> @@ -635,6 +635,15 @@ extern void kvmhv_remove_nest_rmap_range(struct kvm *kvm,
>>   				unsigned long gpa, unsigned long hpa,
>>   				unsigned long nbytes);
>>   
>> +static inline pte_t *__find_kvm_secondary_pte(struct kvm *kvm, unsigned long ea,
>> +					      unsigned *hshift)
>> +{
>> +	pte_t *pte;
>> +
>> +	pte = __find_linux_pte(kvm->arch.pgtable, ea, NULL, hshift);
>> +	return pte;
>> +}
> 
> Why not just open code this in the single caller?

We could do that. But I though it is confusing and we want to avoid 
using linux page table walker (__find_linux_pte()) directly from within 
kvm code to walk partition scoped table.

> 
> Leaving it here someone will invariably decide to call it one day.
> 

I was looking at documenting it at the call site.  We can possibly add a 
comment here explaining avoid calling this directly and if used should 
have a  comments around explaining why it is safe.


> If you think it's worth keeping then it should have a comment explaining
> why it doesn't check the lock, and find_kvm_secondary_pte() should call
> it no?
> 

Was trying to avoid that indirection. I guess we should add a comment 
which suggest to avoid using __find_kvm_secondary_pte() and if used we 
should ask for comment at the call site explaining why it is safe?

-aneesh

