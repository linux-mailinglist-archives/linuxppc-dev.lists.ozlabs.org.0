Return-Path: <linuxppc-dev+bounces-4859-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 721FFA062FB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 18:06:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSvSq6PSrz2yLB;
	Thu,  9 Jan 2025 04:06:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736355963;
	cv=none; b=M3X170PBlKwAttjpt+iCzJBklZ2nbSc1Jvk6MSEvTAPgs1uryZv58IRm6ZlNMlywb2rn9SzyLMvR9M0QCul6I3YnQ4zOoo4oAL4ldVjdeMOv4by8lmBnoHxfDxltVf3hiu2x6FAFqIPGkKgVr3qtHDjgyMjowIFiUSTwrgmF152ud9zWc1Q8c2FU+/OoU0r/G40nEcKz6fcJGsV7z0HuB4K6VoTMraCWLYLvx7PuG6KJ9t1weeR1ZzY4ke1tWFRpJWxkc8ecucecriVsjKDJNMa2L5s1dtUh4RBDrjEw7nh1t8CseRbI2n0om7+lZMcRtgFZidi3YeKYJM/5Gn5MNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736355963; c=relaxed/relaxed;
	bh=yyOPD9qcVaUXHHE2IbrdGoE4thHZzJpL1nlCYWWtVlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4qEa7tP+n1ks1pLCRkDuUnq8sZrlpnF4RV5XrjS5K0mVfGF2eMYr3fXzxTCe9zmMtuZ3oa+SzWbsrstGnj1sJpgjaWrCcPjhTsTgkYg4FJP6BpULgWF6PyT6l3qn+PWR4UHxLVIwaYS0n4turcisosNXpTA6nduwmudop/yRJNMTf/AOPV0qubwtaoJq+zmDdQN3ED4wd3xFMpr+y5NpzOaeV/VVQzPy1ZUXhSUyIZ80YScmNXo+kwAlQIP+uEaGfSQDm2xhjRij1KV471xRzAMPxrjsLl8lvb3jsC97ei2RRlh9chZqLa11hA3vQckCyf3LXgnI0/vdPZDrKZbtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UmlA6/a1; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UmlA6/a1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSvSp31Srz2y33
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 04:06:02 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508CHKZf026786;
	Wed, 8 Jan 2025 17:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=yyOPD9qcVaUXHHE2IbrdG
	oE4thHZzJpL1nlCYWWtVlA=; b=UmlA6/a1xq0D4fbVq219CeBj9e2KhZBl7MlPo
	DvrF+zVE5hEjuR0gN8Vn4e00q/7XXIWXfLDa6ZqGFBUtBr4m/mTfXzmEFakjXm0C
	m75+1RmCbLZ2fq9KcfZBMkorRqHD3MY5Casbk54PRWvmC2xL3dX18a8tL565aAwV
	DyF7cTv+BfuTWI511vf0fgTP36GLHBTwtRbLtzx/zCQT1IGgdIK8rWvP9WtXq9mb
	fuLfmdLPj9XUoYMumKZOI5xf4AFMH3XNkUz0tYKJ2do1SwLIYUDeGTOkZa21vsQ9
	dHYkvzaRs2SMRP5JxA3k4oQD60v58ARrup3PTBmVCMicbLIhg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441e3b43xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 17:05:49 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 508GVGNJ008861;
	Wed, 8 Jan 2025 17:05:49 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43yfq00xw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 17:05:49 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 508H5jJl64160230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 17:05:45 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 086B920043;
	Wed,  8 Jan 2025 17:05:45 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A63F520040;
	Wed,  8 Jan 2025 17:05:42 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.39.20.94])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  8 Jan 2025 17:05:42 +0000 (GMT)
Date: Wed, 8 Jan 2025 22:35:36 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
        Baoquan he <bhe@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v1 4/5] powerpc/crash: use generic crashkernel
 reservation
Message-ID: <dgn3qq2q35rjem3lm33k646tl7ucxghwnvttplr4fdk35aftfx@2tzxh6ku5m3d>
Reply-To: mahesh@linux.ibm.com
References: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
 <20250108101458.406806-5-sourabhjain@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108101458.406806-5-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2gBREeBZTiWbtcfDwpoa7ZKrEaVUoORI
X-Proofpoint-GUID: 2gBREeBZTiWbtcfDwpoa7ZKrEaVUoORI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080141
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025-01-08 15:44:57 Wed, Sourabh Jain wrote:
> Commit 0ab97169aa05 ("crash_core: add generic function to do
> reservation") added a generic function to reserve crashkernel memory.
> So let's use the same function on powerpc and remove the
> architecture-specific code that essentially does the same thing.
> 
> The generic crashkernel reservation also provides a way to split the
> crashkernel reservation into high and low memory reservations, which can
> be enabled for powerpc in the future.
> 
> Along with moving to the generic crashkernel reservation, the code
> related to finding the base address for the crashkernel has been
> separated into its own function name get_crash_base() for better
> readability and maintainability.
> 
> To prevent crashkernel memory from being added to iomem_resource, the
> function arch_add_crash_res_to_iomem() has been introduced. For further
> details on why this should not be done for the PowerPC architecture,
> please refer to the previous commit titled "crash: let arch decide crash
> memory export to iomem_resource.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> CC: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: kexec@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/powerpc/Kconfig                     |  3 +
>  arch/powerpc/include/asm/crash_reserve.h | 18 +++++
>  arch/powerpc/include/asm/kexec.h         |  4 +-
>  arch/powerpc/kernel/prom.c               |  2 +-
>  arch/powerpc/kexec/core.c                | 90 ++++++++++--------------
>  5 files changed, 63 insertions(+), 54 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/crash_reserve.h
[...]
> @@ -113,9 +113,9 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt, struct crash_mem
>  
>  #ifdef CONFIG_CRASH_RESERVE
>  int __init overlaps_crashkernel(unsigned long start, unsigned long size);
> -extern void reserve_crashkernel(void);
> +extern void arch_reserve_crashkernel(void);

Do we really need to rename this ? it is still called from powepc arch
and not from the common code.

>  #else
> -static inline void reserve_crashkernel(void) {}
> +static inline void arch_reserve_crashkernel(void) {}
>  static inline int overlaps_crashkernel(unsigned long start, unsigned long size) { return 0; }
>  #endif
>  
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index e0059842a1c6..9ed9dde7d231 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -860,7 +860,7 @@ void __init early_init_devtree(void *params)
>  	 */
>  	if (fadump_reserve_mem() == 0)
>  #endif
> -		reserve_crashkernel();
> +		arch_reserve_crashkernel();
>  	early_reserve_mem();
>  
>  	if (memory_limit > memblock_phys_mem_size())

Rest looks good to me.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.

