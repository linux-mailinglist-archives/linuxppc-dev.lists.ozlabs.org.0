Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 880941C33C2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 09:38:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Fvpr61n2zDqf2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 17:38:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Fvmy1pWZzDqdD
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 17:36:33 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0447VJmP024887
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 4 May 2020 03:36:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s316jt0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 May 2020 03:36:30 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0447Vwf5026803
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 4 May 2020 03:36:30 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s316jt05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 May 2020 03:36:30 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0447UnVa029984;
 Mon, 4 May 2020 07:36:30 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 30s0g5xu8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 May 2020 07:36:30 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0447aTR450856250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 May 2020 07:36:29 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 958E0AE05F;
 Mon,  4 May 2020 07:36:29 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75DADAE060;
 Mon,  4 May 2020 07:36:28 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.98.100])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  4 May 2020 07:36:28 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/64s/hash: add torture_hpt kernel boot
 option to increase hash faults
In-Reply-To: <20200503082236.17991-2-npiggin@gmail.com>
References: <20200503082236.17991-1-npiggin@gmail.com>
 <20200503082236.17991-2-npiggin@gmail.com>
Date: Mon, 04 May 2020 13:06:25 +0530
Message-ID: <874kswm9s6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-04_04:2020-05-01,
 2020-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005040059
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> This option increases the number of hash misses by limiting the number of
> kernel HPT entries. This helps stress test difficult to hit paths in the
> kernel.
>

It would nice if we can explain in commit message how we are limiting
the number of HPT entries.

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  9 +++
>  arch/powerpc/include/asm/book3s/64/mmu-hash.h | 10 +++
>  arch/powerpc/mm/book3s64/hash_4k.c            |  3 +
>  arch/powerpc/mm/book3s64/hash_64k.c           |  8 +++
>  arch/powerpc/mm/book3s64/hash_utils.c         | 66 ++++++++++++++++++-
>  5 files changed, 95 insertions(+), 1 deletion(-)

....

  
> +void hpt_do_torture(unsigned long ea, unsigned long access,
> +		    unsigned long rflags, unsigned long hpte_group)
> +{
> +	unsigned long last_group;
> +	int cpu = raw_smp_processor_id();
> +
> +	last_group = torture_hpt_last_group[cpu];
> +	if (last_group != -1UL) {
> +		while (mmu_hash_ops.hpte_remove(last_group) != -1)
> +			;
> +		torture_hpt_last_group[cpu] = -1UL;
> +	}
> +
> +#define QEMU_WORKAROUND	0
> +
> +	if (ea >= PAGE_OFFSET) {
> +		if (!QEMU_WORKAROUND && (access & (_PAGE_READ|_PAGE_WRITE)) &&
> +		    !(rflags & (HPTE_R_I|HPTE_R_G))) {
> +			/* prefetch / prefetchw does not seem to set up a TLB
> +			 * entry with the powerpc systemsim (mambo) emulator,
> +			 * though it works with real hardware. An alternative
> +			 * approach that would work more reliably on quirky
> +			 * emulators like QEMU may be to remember the last
> +			 * insertion and remove that, rather than removing the
> +			 * current insertion. Then no prefetch is required.
> +			 */
> +			if ((access & _PAGE_WRITE) && (access & _PAGE_READ))
> +				atomic_add(0, (atomic_t *)(ea & ~0x3));
> +			else if (access & _PAGE_READ)
> +				*(volatile char *)ea;
> +
> +			mb();
> +
> +			while (mmu_hash_ops.hpte_remove(hpte_group) != -1)
> +				;

Do we get similar hpte faults rate, if we remove everything except the
current inserted entry?. If so that would largely simplify the code.

> +		} else {
> +			/* Can't prefetch cache-inhibited so clear next time. */
> +			torture_hpt_last_group[cpu] = hpte_group;
> +		}
> +	}
> +}
> +
> +
>  #ifdef CONFIG_DEBUG_PAGEALLOC
>  static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
>  {
> -- 
> 2.23.0

-aneesh
