Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 541D21E5731
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 08:02:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XcYj0jNFzDqXD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 16:02:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KyW95O+d; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XcWz1cfFzDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 16:01:18 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04S5WOhR144144; Thu, 28 May 2020 02:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rzxb6hLKueV3GOD6Gt7BwA/qA3KrGCG2hdKJHIyT+yU=;
 b=KyW95O+dKSolfVxODBFDCK7h+jg/mjO3sAYWp1omJ4569GmhmHATXIYYh288HcQMrDOO
 ab1AMQgfLfeKD0QcXqhgj1fMyW/a2WQkkXPmCrgakBG/fC1eyW94mIJDc6RX8gw+kFoS
 Tu1hHGok7kKXgMa4vJEMWQYa2TV/4UnSRki4ZlnUNDNmlcFJJE1wpfxBT7UztD5oijfr
 KU0qprhVrrfmMgcgty6RaR8fX2PYgTMq8SK9vgBiLJCDbCUJp2b7hfJuxypvWjdXnU/f
 ciCW/1S8i6cXgM6JVplKlfFwgg/iJt4YEdpNaJ41UEr7d5cF01xbQCLY4W1FjTNo7KaK 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 319s3c8c7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 May 2020 02:01:11 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04S5WcM8144795;
 Thu, 28 May 2020 02:01:10 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 319s3c8c6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 May 2020 02:01:10 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04S5xxVS014946;
 Thu, 28 May 2020 06:01:08 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 316uf8br2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 May 2020 06:01:08 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04S616t850266166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 May 2020 06:01:06 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 559214C050;
 Thu, 28 May 2020 06:01:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 402F24C05E;
 Thu, 28 May 2020 06:01:05 +0000 (GMT)
Received: from [9.85.101.128] (unknown [9.85.101.128])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 May 2020 06:01:04 +0000 (GMT)
Subject: Re: [PATCH v4 09/22] powerpc/kvm/book3s: Add helper to walk partition
 scoped linux page table.
To: Paul Mackerras <paulus@ozlabs.org>
References: <20200505071729.54912-1-aneesh.kumar@linux.ibm.com>
 <20200505071729.54912-10-aneesh.kumar@linux.ibm.com>
 <20200528014338.GC307798@thinks.paulus.ozlabs.org>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <e732e386-4a8c-2a7d-220c-e22e85b7a6c3@linux.ibm.com>
Date: Thu, 28 May 2020 11:31:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200528014338.GC307798@thinks.paulus.ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-28_02:2020-05-28,
 2020-05-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 mlxlogscore=860 malwarescore=0 spamscore=0 priorityscore=1501
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005280029
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/28/20 7:13 AM, Paul Mackerras wrote:
> On Tue, May 05, 2020 at 12:47:16PM +0530, Aneesh Kumar K.V wrote:
>> The locking rules for walking partition scoped table is different from process
>> scoped table. Hence add a helper for secondary linux page table walk and also
>> add check whether we are holding the right locks.
> 
> This patch is causing new warnings to appear when testing migration,
> like this:
> 
> [  142.090159] ------------[ cut here ]------------
> [  142.090160] find_kvm_secondary_pte called with kvm mmu_lock not held
> [  142.090176] WARNING: CPU: 23 PID: 5341 at arch/powerpc/include/asm/kvm_book3s_64.h:644 kvmppc_hv_get_dirty_log_radix+0x2e4/0x340 [kvm_hv]
> [  142.090177] Modules linked in: xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables bpfilter overlay binfmt_misc input_leds raid_class scsi_transport_sas sch_fq_codel sunrpc kvm_hv kvm
> [  142.090188] CPU: 23 PID: 5341 Comm: qemu-system-ppc Tainted: G        W         5.7.0-rc5-kvm-00211-g9ccf10d6d088 #432
> [  142.090189] NIP:  c008000000fe848c LR: c008000000fe8488 CTR: 0000000000000000
> [  142.090190] REGS: c000001e19f077e0 TRAP: 0700   Tainted: G        W          (5.7.0-rc5-kvm-00211-g9ccf10d6d088)
> [  142.090191] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 42222422  XER: 20040000
> [  142.090196] CFAR: c00000000012f5ac IRQMASK: 0
>                 GPR00: c008000000fe8488 c000001e19f07a70 c008000000ffe200 0000000000000039
>                 GPR04: 0000000000000001 c000001ffc8b4900 0000000000018840 0000000000000007
>                 GPR08: 0000000000000003 0000000000000001 0000000000000007 0000000000000001
>                 GPR12: 0000000000002000 c000001fff6d9400 000000011f884678 00007fff70b70000
>                 GPR16: 00007fff7137cb90 00007fff7dcb4410 0000000000000001 0000000000000000
>                 GPR20: 000000000ffe0000 0000000000000000 0000000000000001 0000000000000000
>                 GPR24: 8000000000000000 0000000000000001 c000001e1f67e600 c000001e1fd82410
>                 GPR28: 0000000000001000 c000001e2e410000 0000000000000fff 0000000000000ffe
> [  142.090217] NIP [c008000000fe848c] kvmppc_hv_get_dirty_log_radix+0x2e4/0x340 [kvm_hv]
> [  142.090223] LR [c008000000fe8488] kvmppc_hv_get_dirty_log_radix+0x2e0/0x340 [kvm_hv]
> [  142.090224] Call Trace:
> [  142.090230] [c000001e19f07a70] [c008000000fe8488] kvmppc_hv_get_dirty_log_radix+0x2e0/0x340 [kvm_hv] (unreliable)
> [  142.090236] [c000001e19f07b50] [c008000000fd42e4] kvm_vm_ioctl_get_dirty_log_hv+0x33c/0x3c0 [kvm_hv]
> [  142.090292] [c000001e19f07be0] [c008000000eea878] kvm_vm_ioctl_get_dirty_log+0x30/0x50 [kvm]
> [  142.090300] [c000001e19f07c00] [c008000000edc818] kvm_vm_ioctl+0x2b0/0xc00 [kvm]
> [  142.090302] [c000001e19f07d50] [c00000000046e148] ksys_ioctl+0xf8/0x150
> [  142.090305] [c000001e19f07da0] [c00000000046e1c8] sys_ioctl+0x28/0x80
> [  142.090307] [c000001e19f07dc0] [c00000000003652c] system_call_exception+0x16c/0x240
> [  142.090309] [c000001e19f07e20] [c00000000000d070] system_call_common+0xf0/0x278
> [  142.090310] Instruction dump:
> [  142.090312] 7d3a512a 4200ffd0 7ffefb78 4bfffdc4 60000000 3c820000 e8848468 3c620000
> [  142.090317] e86384a8 38840010 4800673d e8410018 <0fe00000> 4bfffdd4 60000000 60000000
> [  142.090322] ---[ end trace 619d45057b6919e0 ]---
> 
> Indeed, kvm_radix_test_clear_dirty() tests the PTE dirty bit
> locklessly, and only takes the kvm->mmu_lock once it finds a dirty
> PTE.  I think that is important for performance, since on any given
> scan of the guest real address space we may only find a small
> proportion of the guest pages to be dirty.
> 
> Are you now relying on the kvm->mmu_lock to protect the existence of
> the PTEs, or just their content?
> 

The patch series should not change any rules w.r.t kvm partition scoped 
page table walk. We only added helpers to make it explicit that this is 
different from regular linux page table walk. And kvm->mmu_lock is what 
was used to protect the partition scoped table walk earlier.

In this specific case, what we need probably is an open coded kvm 
partition scoped walk with a comment around explaining why is it ok to 
walk that partition scoped table without taking kvm->mmu_lock.

What happens when a parallel invalidate happens to Qemu address space? 
Since we are not holding kvm->mmu_lock mmu notifier will complete and we 
will go ahead with unmapping partition scoped table.

Do we need a change like below?

@@ -1040,7 +1040,7 @@ static int kvm_radix_test_clear_dirty(struct kvm *kvm,
  {
  	unsigned long gfn = memslot->base_gfn + pagenum;
  	unsigned long gpa = gfn << PAGE_SHIFT;
-	pte_t *ptep;
+	pte_t *ptep, pte;
  	unsigned int shift;
  	int ret = 0;
  	unsigned long old, *rmapp;
@@ -1049,11 +1049,23 @@ static int kvm_radix_test_clear_dirty(struct kvm 
*kvm,
  		return ret;

  	ptep = find_kvm_secondary_pte(kvm, gpa, &shift);
-	if (ptep && pte_present(*ptep) && pte_dirty(*ptep)) {
+	if (!ptep)
+		return 0;
+
+	pte = READ_ONCE(*ptep);
+	if (pte_present(pte) && pte_dirty(pte)) {
  		ret = 1;
  		if (shift)
  			ret = 1 << (shift - PAGE_SHIFT);
  		spin_lock(&kvm->mmu_lock);
+		/*
+		 * Recheck the pte again
+		 */
+		if (pte_val(pte) != pte_val(*ptep)) {
+			spin_unlock(&kvm->mmu_lock);
+			return 0;
+		}
+
  		old = kvmppc_radix_update_pte(kvm, ptep, _PAGE_DIRTY, 0,
  					      gpa, shift);
  		kvmppc_radix_tlbie_page(kvm, gpa, shift, kvm->arch.lpid);

