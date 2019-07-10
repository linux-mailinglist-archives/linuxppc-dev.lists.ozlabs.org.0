Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB6A642F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 09:33:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45k9ss1t03zDqLp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 17:33:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sathnaga@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45k9r44w8jzDqbw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 17:32:19 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6A7VU25054102
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 03:32:16 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tnb4nhg05-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 03:32:15 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sathnaga@linux.vnet.ibm.com>;
 Wed, 10 Jul 2019 08:32:14 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 10 Jul 2019 08:32:12 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6A7WBhK58261716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jul 2019 07:32:11 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45D4EA4060;
 Wed, 10 Jul 2019 07:32:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9343A405F;
 Wed, 10 Jul 2019 07:32:09 +0000 (GMT)
Received: from sathnaga86.in.ibm.com (unknown [9.193.110.61])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 10 Jul 2019 07:32:09 +0000 (GMT)
Date: Wed, 10 Jul 2019 13:02:07 +0530
From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Subject: Re: [PATCH] powerpc: mm: Limit rma_size to 1TB when running without
 HV mode
References: <20190710052018.14628-1-sjitindarsingh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190710052018.14628-1-sjitindarsingh@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-TM-AS-GCONF: 00
x-cbid: 19071007-0012-0000-0000-00000330E3AD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071007-0013-0000-0000-0000216A4B47
Message-Id: <20190710073207.GA29386@sathnaga86.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-10_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907100093
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
Reply-To: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 10, 2019 at 03:20:18PM +1000, Suraj Jitindar Singh wrote:
> The virtual real mode addressing (VRMA) mechanism is used when a
> partition is using HPT (Hash Page Table) translation and performs
> real mode accesses (MSR[IR|DR] = 0) in non-hypervisor mode. In this
> mode effective address bits 0:23 are treated as zero (i.e. the access
> is aliased to 0) and the access is performed using an implicit 1TB SLB
> entry.
> 
> The size of the RMA (Real Memory Area) is communicated to the guest as
> the size of the first memory region in the device tree. And because of
> the mechanism described above can be expected to not exceed 1TB. In the
> event that the host erroneously represents the RMA as being larger than
> 1TB, guest accesses in real mode to memory addresses above 1TB will be
> aliased down to below 1TB. This means that a memory access performed in
> real mode may differ to one performed in virtual mode for the same memory
> address, which would likely have unintended consequences.
> 
> To avoid this outcome have the guest explicitly limit the size of the
> RMA to the current maximum, which is 1TB. This means that even if the
> first memory block is larger than 1TB, only the first 1TB should be
> accessed in real mode.
> 
> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
> ---
>  arch/powerpc/mm/book3s64/hash_utils.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Hi,

Tested this patch and now Power8 compat guest boots fine with mem >1024G on 
Power9 host.

Tested-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>

Host: P9; kernel: 5.2.0-00915-g5ad18b2e60b7

Before this patch:
Guest crashes..
[0.000000] BUG: Kernel NULL pointer dereference at 0x00000028
[0.000000] Faulting instruction address: 0xc00000000102caa0
[0.000000] Oops: Kernel access of bad area, sig: 11 [#1]
[0.000000] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
[0.000000] Modules linked in:
[0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.2.0-03135-ge9a83bd23220 #24
[0.000000] NIP:  c00000000102caa0 LR: c00000000102ca84 CTR: 0000000000000000
[0.000000] REGS: c000000001603ba0 TRAP: 0380   Not tainted  (5.2.0-03135-ge9a83bd23220)
[0.000000] MSR:  8000000000001033 <SF,ME,IR,DR,RI,LE>  CR: 24000428  XER: 20000000
[0.000000] CFAR: c00000000102c1d8 IRQMASK: 1 
[0.000000] GPR00: c00000000102ca84 c000000001603e30 c000000001605300 0000010000000000 
[0.000000] GPR04: 0000000000000000 0000000000000000 c00000ffffff8000 c000000001863dc8 
[0.000000] GPR08: 0000000000002028 0000000000000000 c00000ffffff8000 0000000000000009 
[0.000000] GPR12: 0000000000000000 c0000000018f0000 000000007dc5fef0 00000000012e1220 
[0.000000] GPR16: 00000000012e10a0 fffffffffffffffd 000000007dc5fef0 000000000130fcc0 
[0.000000] GPR20: 0000000000000014 0000000001a80000 000000002fff0000 fffffffffffffffd 
[0.000000] GPR24: 0000000001d0000c c000000000000000 c000000001641ed8 c000000001641b78 
[0.000000] GPR28: 0000000000000000 0000000000000000 0000010000000000 0000000000000000 
[0.000000] NIP [c00000000102caa0] emergency_stack_init+0xb8/0x118
[0.000000] LR [c00000000102ca84] emergency_stack_init+0x9c/0x118
[0.000000] Call Trace:
[0.000000] [c000000001603e30] [c00000000102ca84] emergency_stack_init+0x9c/0x118 (unreliable)
[0.000000] [c000000001603e80] [c00000000102bd54] setup_arch+0x2fc/0x388
[0.000000] [c000000001603ef0] [c000000001023ccc] start_kernel+0xa4/0x660
[0.000000] [c000000001603f90] [c00000000000b774] start_here_common+0x1c/0x528
[0.000000] Instruction dump:
[0.000000] 7ffc07b4 7fc3f378 7bfd1f24 7f84e378 4bfff6e9 3f620004 3b7bc878 7f84e378 
[0.000000] 39434000 7fc3f378 e93b0000 7d29e82a <f9490028> 4bfff6c5 e93b0000 7f84e378 
[0.000000] random: get_random_bytes called from print_oops_end_marker+0x6c/0xa0 with crng_init=0
[0.000000] ---[ end trace 0000000000000000 ]---
[0.000000] 
[0.000000] Kernel panic - not syncing: Attempted to kill the idle task!

-------------------------
With this patch:
# virsh start --console p8
Domain p8 started
Connected to domain p8
..
..
Fedora 27 (Twenty Seven)
Kernel 5.2.0-03136-gf709b0494ad9 on an ppc64le (hvc0)

atest-guest login: 
# free -g
              total        used        free      shared  buff/cache   available
Mem:           1028       0        1027           0           0        1025
Swap:         0           0     

Regards,
-Satheesh.

> 
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 28ced26f2a00..4d0e2cce9cd5 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1901,11 +1901,19 @@ void hash__setup_initial_memory_limit(phys_addr_t first_memblock_base,
>  	 *
>  	 * For guests on platforms before POWER9, we clamp the it limit to 1G
>  	 * to avoid some funky things such as RTAS bugs etc...
> +	 * On POWER9 we limit to 1TB in case the host erroneously told us that
> +	 * the RMA was >1TB. Effective address bits 0:23 are treated as zero
> +	 * (meaning the access is aliased to zero i.e. addr = addr % 1TB)
> +	 * for virtual real mode addressing and so it doesn't make sense to
> +	 * have an area larger than 1TB as it can't be addressed.
>  	 */
>  	if (!early_cpu_has_feature(CPU_FTR_HVMODE)) {
>  		ppc64_rma_size = first_memblock_size;
>  		if (!early_cpu_has_feature(CPU_FTR_ARCH_300))
>  			ppc64_rma_size = min_t(u64, ppc64_rma_size, 0x40000000);
> +		else
> +			ppc64_rma_size = min_t(u64, ppc64_rma_size,
> +					       1UL << SID_SHIFT_1T);
> 
>  		/* Finally limit subsequent allocations */
>  		memblock_set_current_limit(ppc64_rma_size);
> -- 
> 2.13.6
> 

