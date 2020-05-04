Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A76C71C33A3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 09:30:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FvdK4cXZzDqXK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 17:29:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FvZG3ft7zDqCZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 17:27:17 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04478ONH011856
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 4 May 2020 03:27:14 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30sp8hc3f7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 May 2020 03:27:14 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04478dfe012932
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 4 May 2020 03:27:13 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30sp8hc3eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 May 2020 03:27:13 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0447PPAv030955;
 Mon, 4 May 2020 07:27:11 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 30s0g66taf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 May 2020 07:27:11 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0447RBsq53412202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 May 2020 07:27:11 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60CA8112061;
 Mon,  4 May 2020 07:27:11 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D7FF112062;
 Mon,  4 May 2020 07:27:10 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.98.100])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  4 May 2020 07:27:09 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] powerpc/64s/hash: add torture_slb kernel boot
 option to increase SLB faults
In-Reply-To: <20200503082236.17991-1-npiggin@gmail.com>
References: <20200503082236.17991-1-npiggin@gmail.com>
Date: Mon, 04 May 2020 12:57:06 +0530
Message-ID: <877dxsma7p.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-04_03:2020-05-01,
 2020-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005040055
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

> This option increases the number of SLB misses by limiting the number of
> kernel SLB entries, and increased flushing of cached lookaside information.
> This helps stress test difficult to hit paths in the kernel.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

....

> +{
> +	unsigned long slbie_data = get_paca()->slb_cache[index];
> +	unsigned long ksp = get_paca()->kstack;
> +
> +	slbie_data <<= SID_SHIFT;
> +	slbie_data |= 0xc000000000000000ULL;
> +	if ((ksp & slb_esid_mask(mmu_kernel_ssize)) == slbie_data)
> +		return;
> +	slbie_data |= mmu_kernel_ssize << SLBIE_SSIZE_SHIFT;
> +
> +	asm volatile("slbie %0" : : "r" (slbie_data));
> +}
> +
> +static void slb_cache_slbie(unsigned int index)

May be slb_cache_slbie_user()? Similar to _kernel above?

> +{
> +	unsigned long slbie_data = get_paca()->slb_cache[index];
> +
> +	slbie_data <<= SID_SHIFT;
> +	slbie_data |= user_segment_size(slbie_data) << SLBIE_SSIZE_SHIFT;
> +	slbie_data |= SLBIE_C; /* user slbs have C=1 */
> +
> +	asm volatile("slbie %0" : : "r" (slbie_data));
> +}
>  
>  /* Flush all user entries from the segment table of the current processor. */
>  void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
> @@ -414,8 +449,14 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
>  	 * which would update the slb_cache/slb_cache_ptr fields in the PACA.
>  	 */
>  	hard_irq_disable();
> -	asm volatile("isync" : : : "memory");
> -	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
> +	isync();
> +	if (torture_slb()) {
> +		__slb_flush_and_restore_bolted(0);

s/0/SLIBA_IH_ALL or something like that? 


> +		isync();
> +		get_paca()->slb_cache_ptr = 0;
> +		get_paca()->slb_kern_bitmap = (1U << SLB_NUM_BOLTED) - 1;
> +
> +	} else if (cpu_has_feature(CPU_FTR_ARCH_300)) {
>  		/*
>  		 * SLBIA IH=3 invalidates all Class=1 SLBEs and their
>  		 * associated lookaside structures, which matches what
> @@ -423,47 +464,36 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
>  		 * cache.
>  		 */
>  		asm volatile(PPC_SLBIA(3));


-aneesh
