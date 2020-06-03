Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E40D1ED32E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 17:19:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cXcz5NLczDqGl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 01:19:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sathnaga@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cWxD1rNBzDqLG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 00:48:09 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 053EWOBx017053; Wed, 3 Jun 2020 10:47:36 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ec64m5h5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 10:47:35 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 053EhHxG016719;
 Wed, 3 Jun 2020 14:47:34 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 31bf47uc8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 14:47:33 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 053ElVWG55968044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jun 2020 14:47:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 827CEA405C;
 Wed,  3 Jun 2020 14:47:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D76CA4054;
 Wed,  3 Jun 2020 14:47:28 +0000 (GMT)
Received: from sathnaga86 (unknown [9.85.87.122])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  3 Jun 2020 14:47:27 +0000 (GMT)
Date: Wed, 3 Jun 2020 20:17:25 +0530
From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: [mainline][Oops][bisected 2ba3e6 ] 5.7.0 boot fails with kernel
 panic on powerpc
Message-ID: <20200603144725.GA221279@sathnaga86>
References: <1591181457.9020.13.camel@abdul>
 <20200603133257.GL6857@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603133257.GL6857@suse.de>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_12:2020-06-02,
 2020-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1011
 suspectscore=1 adultscore=0 malwarescore=0 cotscore=-2147483648
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006030112
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
Cc: sachinp <sachinp@linux.vnet.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-next <linux-next@vger.kernel.org>,
 "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>, akpm@linux-foundation.org,
 manvanth <manvanth@linux.vnet.ibm.com>, hch <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 03, 2020 at 03:32:57PM +0200, Joerg Roedel wrote:
> On Wed, Jun 03, 2020 at 04:20:57PM +0530, Abdul Haleem wrote:
> > @Joerg, Could you please have a look?
> 
> Can you please try the attached patch?

Hi Joerg,

I did hit the similar boot failue on a Power9 baremetal box(mentioned in Note) and 
your below patch helped solving that for my environment and 
am able to boot the system fine.

...
Fedora 31 (Thirty One)
Kernel 5.7.0-gd6f9469a0-dirty on an ppc64le (hvc0)

 login:


Tested-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>

Note: for the record, here is the boot failure call trace.

[    0.023555] mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
[    0.023582] pid_max: default: 163840 minimum: 1280
[    0.035014] BUG: Unable to handle kernel data access on read at 0xc000006000000000
[    0.035058] Faulting instruction address: 0xc000000000382304
[    0.035074] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.035097] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
[    0.035113] Modules linked in:
[    0.035136] CPU: 24 PID: 0 Comm: swapper/24 Not tainted 5.7.0-gd6f9469a0 #1
[    0.035161] NIP:  c000000000382304 LR: c00000000038407c CTR: 0000000000000000
[    0.035197] REGS: c00000000167f930 TRAP: 0300   Not tainted  (5.7.0-gd6f9469a0)
[    0.035241] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 42022422  XER: 00000000
[    0.035294] CFAR: c0000000003822fc DAR: c000006000000000 DSISR: 40000000 IRQMASK: 0 
[    0.035294] GPR00: c00000000038407c c00000000167fbc0 c00000000168090[  150.252645597,5] OPAL: Reboot request...
[  150.252928266,5] RESET: Initiating fast reboot 1...
0 c008000000000000 
[    0.035294] GPR04: ffffffffffffffff 00000000000001ff c0080000001fffff 0000000000000060 
[    0.035294] GPR08: 0000000060000000 0000000000000005 c000006000000000 c008000000200000 
[    0.035294] GPR12: 0000000022022422 c000000001870000 c000000000000000 c008000000000000 
[    0.035294] GPR16: c008000007ffffff c008000000200000 0000000000000000 c000006000000000 
[    0.035294] GPR20: c008000008000000 c008000008000000 c008000007ffffff c008000007ffffff 
[    0.035294] GPR24: c00000000163f7c8 c00000000172d0c0 0000000000000001 0000000000000001 
[    0.035294] GPR28: c000000001708000 c00000000172d0c8 0000000000000000 c008000008000000 
[    0.035622] NIP [c000000000382304] map_kernel_range_noflush+0x274/0x510
[    0.035657] LR [c00000000038407c] __vmalloc_node_range+0x2ec/0x3a0
[    0.035690] Call Trace:
[    0.035709] [c00000000167fbc0] [c00000000038d848] __alloc_pages_nodemask+0x158/0x3f0 (unreliable)
[    0.035750] [c00000000167fc90] [c00000000038407c] __vmalloc_node_range+0x2ec/0x3a0
[    0.035787] [c00000000167fd40] [c000000000384268] __vmalloc+0x58/0x70
[    0.035823] [c00000000167fdb0] [c000000001056db8] alloc_large_system_hash+0x204/0x304
[    0.035870] [c00000000167fe60] [c00000000105c1f0] vfs_caches_init+0xd8/0x138
[    0.035916] [c00000000167fee0] [c0000000010242a0] start_kernel+0x644/0x6ec
[    0.035960] [c00000000167ff90] [c00000000000ca9c] start_here_common+0x1c/0x400
[    0.036004] Instruction dump:
[    0.036016] 3af4ffff 60000000 60000000 38c90010 7f663036 7d667a14 7cc600d0 7d713038 
[    0.036038] 38d1ffff 7c373040 41810008 7e91a378 <e8b30000> 2c250000 418201b4 7f464830 
[    0.036083] ---[ end trace c7e72029dfacc217 ]---
[    0.036114] 
[    1.036223] Kernel panic - not syncing: Attempted to kill the idle task!
[    1.036858] Rebooting in 10 seconds..


Regards,
-Satheesh.

> 
> diff --git a/include/asm-generic/5level-fixup.h b/include/asm-generic/5level-fixup.h
> index 58046ddc08d0..afbab31fbd7e 100644
> --- a/include/asm-generic/5level-fixup.h
> +++ b/include/asm-generic/5level-fixup.h
> @@ -17,6 +17,11 @@
>  	((unlikely(pgd_none(*(p4d))) && __pud_alloc(mm, p4d, address)) ? \
>  		NULL : pud_offset(p4d, address))
> 
> +#define pud_alloc_track(mm, p4d, address, mask)					\
> +	((unlikely(pgd_none(*(p4d))) &&						\
> +	  (__pud_alloc(mm, p4d, address) || ({*(mask)|=PGTBL_P4D_MODIFIED;0;})))?	\
> +	  NULL : pud_offset(p4d, address))
> +
>  #define p4d_alloc(mm, pgd, address)		(pgd)
>  #define p4d_alloc_track(mm, pgd, address, mask)	(pgd)
>  #define p4d_offset(pgd, start)			(pgd)
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 7e07f4f490cb..d46bf03b804f 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2088,35 +2088,35 @@ static inline pud_t *pud_alloc(struct mm_struct *mm, p4d_t *p4d,
>  		NULL : pud_offset(p4d, address);
>  }
> 
> -static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
> +static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
>  				     unsigned long address,
>  				     pgtbl_mod_mask *mod_mask)
> -
>  {
> -	if (unlikely(pgd_none(*pgd))) {
> -		if (__p4d_alloc(mm, pgd, address))
> +	if (unlikely(p4d_none(*p4d))) {
> +		if (__pud_alloc(mm, p4d, address))
>  			return NULL;
> -		*mod_mask |= PGTBL_PGD_MODIFIED;
> +		*mod_mask |= PGTBL_P4D_MODIFIED;
>  	}
> 
> -	return p4d_offset(pgd, address);
> +	return pud_offset(p4d, address);
>  }
> 
> -#endif /* !__ARCH_HAS_5LEVEL_HACK */
> -
> -static inline pud_t *pud_alloc_track(struct mm_struct *mm, p4d_t *p4d,
> +static inline p4d_t *p4d_alloc_track(struct mm_struct *mm, pgd_t *pgd,
>  				     unsigned long address,
>  				     pgtbl_mod_mask *mod_mask)
> +
>  {
> -	if (unlikely(p4d_none(*p4d))) {
> -		if (__pud_alloc(mm, p4d, address))
> +	if (unlikely(pgd_none(*pgd))) {
> +		if (__p4d_alloc(mm, pgd, address))
>  			return NULL;
> -		*mod_mask |= PGTBL_P4D_MODIFIED;
> +		*mod_mask |= PGTBL_PGD_MODIFIED;
>  	}
> 
> -	return pud_offset(p4d, address);
> +	return p4d_offset(pgd, address);
>  }
> 
> +#endif /* !__ARCH_HAS_5LEVEL_HACK */
> +
>  static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long address)
>  {
>  	return (unlikely(pud_none(*pud)) && __pmd_alloc(mm, pud, address))?
