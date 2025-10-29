Return-Path: <linuxppc-dev+bounces-13511-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B3DC1A645
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 13:52:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxRwl2hgrz3bfV;
	Wed, 29 Oct 2025 23:52:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761742359;
	cv=none; b=E+tb26eLHpbnuMQvWOcVZ+ax/ON4u5EXySYlwl6+chL2W7nWfn6lnkFapmnrqorfvC/KuvNvQ4IDS3OZX5uneeQYbaKJzkLbAn5zypJ/QGoBqKtZU1R/TF/+0UzWtJ6EWFOsBCNsC08G48ZvuvahVh3k5zKORUgBlpZ1/C9VgCTn/chjYkWYGj3tXjSkpoJIO7Kqtayr80NsciwD1ejREZjWqf1XQTqvhJLPXXrtnSXZ6u2ICXoXs/1t9QfVnYobetBTK1YLKujDQOC1hWyTAi9MXTXZ94fgVn4ZO6c7bCKtOR5h/dYQRF4z+b8mc2D+ZKYZQWuQ0IZ8ya1zCNH+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761742359; c=relaxed/relaxed;
	bh=Jz3jvQT3sPwasapRz8O3WKQsvHyjhuLCpScHnWlfMtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOWROQYDt/mPJPCxTPMS97qxjQ5y1EW12T8TCZkOX6PI7RzW6EpdyMHADLLeWbNq9vgBaavZBPXPpaSguUVLIerELtmXkdG4cek6lEHZYFTnTseQUlmV09PN6lkt4A4muhpJqJZkhMUox/k0C7pYCBOjMx/yb9L7uMLDTldEbb4VBmrjXP0J5ZzL9KApSWt8XDx4jfmmi1UufWxN7/XQkFFnViUfpjOJN+ZgSlkhlbdtQOAOS1TDK8ZjOvnaVVcC9olHDNprVUZLK37NzarrLZWOe66iG9cL+Ma1jVmDoYhwhjW3JP/eE6VyoOhPCT9ZAYjlR0CpvOzP+m0qMK2q4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ITE3XAKI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ITE3XAKI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxRwj68z0z302l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 23:52:37 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59TBiUKW019857;
	Wed, 29 Oct 2025 12:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Jz3jvQ
	T3sPwasapRz8O3WKQsvHyjhuLCpScHnWlfMtA=; b=ITE3XAKIDl+Tsmj2EXLZmA
	HSFG8BoXtlTPnTQnIicCgEuA1eWxLqcnvn97efeeK9osM5pIsy7uwZpExGCkVjo8
	ScPrYvZ6xWa9spXtOfG6NHPfgiQNYyJ/OLFQhSBvob9wWGCos7xnDK/o0kWD6PWI
	CkS9RgfDl9IETzB5I6t4gRKQfooEipNlUmqIiczOkTJVR13WPo5l/o9M+IS71LzN
	d3exJsZ9Qd4F8N83rtbRqH2n42L2Kw5+2SJB1+HpuJ06FFdWhlGXtZtvEPnZzDHx
	gyVVjuAV+TEFRo5HrVmVAL2whMftfrKH/usA2b7enWcz7Bb0ZJ2pylHK7F0c3uIw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34agk55b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 12:52:26 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59TCDggC013113;
	Wed, 29 Oct 2025 12:52:25 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34agk558-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 12:52:25 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59T9wlLX019170;
	Wed, 29 Oct 2025 12:52:25 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a33xy3aqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 12:52:25 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59TCqLmL61210906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Oct 2025 12:52:21 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A05F20049;
	Wed, 29 Oct 2025 12:52:21 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77A1320040;
	Wed, 29 Oct 2025 12:52:19 +0000 (GMT)
Received: from [9.124.210.68] (unknown [9.124.210.68])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 29 Oct 2025 12:52:19 +0000 (GMT)
Message-ID: <aae00383-0337-4234-9f93-21376e7e474a@linux.ibm.com>
Date: Wed, 29 Oct 2025 18:22:18 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] powerpc: move to 64-bit RTAS
To: linuxppc-dev@lists.ozlabs.org
Cc: Baoquan he <bhe@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
References: <20251027151338.819957-1-sourabhjain@linux.ibm.com>
 <20251027151338.819957-3-sourabhjain@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20251027151338.819957-3-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=K+gv3iWI c=1 sm=1 tr=0 ts=69020e0a cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=20KFwNOVAAAA:8 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=r9RjRO4e7mtdy7f6b0UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: LYCeXKC0vj4so8InnKgW-dbCyIg06qHG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NiBTYWx0ZWRfX1xN8vhqrTOYq
 fySzMXjza+l6ejx1Ag1WBrktuWNwwiwvbAH+iR7HZUJoLVtYIEhiWUD1X4Vtd1gJ9i71E914zYI
 Zv0q6O3kYoOYe4WU7Xw6dyke1VH+tAlGCtJpoJY/Km9xoypsYd3h8Az8+SKBs+MIwKYdvna1jLT
 tjZdBl3/xe70bSoRok8qsY95pQki/pzVndDjuHZFZu6ThgGttXy1aD46BJzx47cj2IGA17RohCU
 sVqrzTt5v3ncToWsoNmq5ORy63f44UXFXmFGNx8MlzpFnm9JC3yPSDc4FkH/UN09URRyqPujEH2
 N8ma0HVd0v+K2u3BLghGFSBcKN7zepu1462/7zvTPgeRL1NWgYHp/WRVdiAVFb2cHuv7mJ1CJsq
 +9Yr4K2durCPRnd45QV8qJpiPxaTBA==
X-Proofpoint-GUID: l2kERYsijTLqeymQZmhWuIsDiZuIcMRv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2510280166
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 27/10/25 20:43, Sourabh Jain wrote:
> Kdump kernels loaded at high addresses (above 4G) could not boot
> because the kernel used 32-bit RTAS.
>
> Until now, the kernel always used 32-bit RTAS, even for 64-bit kernels.
> Before making an RTAS call, it sets the MSR register with the SF bit off
> and sets rtas_return_loc/rtas_entry.s to LR as the return address.
> For kdump kernels loaded above 4G, RTAS cannot jump back to this LR
> correctly and instead jumps to a 32-bit truncated address. This usually
> causes exception which leads to kernel panic.
>
> To fix this, the kernel initializes 64-bit RTAS and sets the SF bit in
> the MSR register before each RTAS call, ensuring that RTAS jumps back
> correctly if the LR address is higher than 4G. This allows kdump kernels
> at high addresses to boot properly.
>
> If 64-bit RTAS initialization fails or is not supported (e.g., in QEMU),
> the kernel falls back to 32-bit RTAS. In this case, high-address kdump
> kernels will not be allowed (handled in upcoming patches), and RTAS
> calls will use SF bit off.
>
> Changes made to achieve this:
>   - Initialize 64-bit RTAS in prom_init and add a new FDT property
>     linux,rtas-64

I just realized that when RTAS is instantiated using 
instantiate-rtas-64, the kernel
must not only set the SF bit in the MSR but also make sure that each cell in
the RTAS Argument Call Buffer is a 64-bit, sign-extended value aligned to an
8-byte boundary. This is currently not handled correctly.

Please review the other patches; I’ll fix this issue in the next version.

>   - Kernel reads linux,rtas-64 and sets a global variable rtas_64 to
>     indicate whether RTAS is 64-bit or 32-bit
>   - Prepare MSR register for RTAS calls based on whether RTAS is 32-bit
>     or 64-bit
>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/rtas.h  |  2 ++
>   arch/powerpc/kernel/prom_init.c  | 26 ++++++++++++++++++++++----
>   arch/powerpc/kernel/rtas.c       |  5 +++++
>   arch/powerpc/kernel/rtas_entry.S | 17 ++++++++++++++++-
>   4 files changed, 45 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
> index d046bbd5017d..aaa4c3bc1d61 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -10,6 +10,8 @@
>   #include <linux/time.h>
>   #include <linux/cpumask.h>
>   
> +extern int rtas_64;
> +
>   /*
>    * Definitions for talking to the RTAS on CHRP machines.
>    *
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index 827c958677f8..ab85b8bb8d4f 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -1841,6 +1841,7 @@ static void __init prom_instantiate_rtas(void)
>   	u32 base, entry = 0;
>   	__be32 val;
>   	u32 size = 0;
> +	u32 rtas_64 = 1;
>   
>   	prom_debug("prom_instantiate_rtas: start...\n");
>   
> @@ -1867,12 +1868,25 @@ static void __init prom_instantiate_rtas(void)
>   
>   	prom_printf("instantiating rtas at 0x%x...", base);
>   
> +	/*
> +	 * First, try to instantiate 64-bit RTAS. If that fails, fall back
> +	 * to 32-bit. Although 64-bit RTAS support has been available on
> +	 * real machines for some time, QEMU still lacks this support.
> +	 */
>   	if (call_prom_ret("call-method", 3, 2, &entry,
> -			  ADDR("instantiate-rtas"),
> +			  ADDR("instantiate-rtas-64"),
>   			  rtas_inst, base) != 0
> -	    || entry == 0) {
> -		prom_printf(" failed\n");
> -		return;
> +		|| entry == 0) {
> +
> +		rtas_64 = 0;
> +		if (call_prom_ret("call-method", 3, 2, &entry,
> +				ADDR("instantiate-rtas"),
> +				rtas_inst, base) != 0
> +			|| entry == 0) {
> +
> +			prom_printf(" failed\n");
> +			return;
> +		}
>   	}
>   	prom_printf(" done\n");
>   
> @@ -1884,6 +1898,9 @@ static void __init prom_instantiate_rtas(void)
>   	val = cpu_to_be32(entry);
>   	prom_setprop(rtas_node, "/rtas", "linux,rtas-entry",
>   		     &val, sizeof(val));
> +	val = cpu_to_be32(rtas_64);
> +	prom_setprop(rtas_node, "/rtas", "linux,rtas-64",
> +		     &val, sizeof(val));
>   
>   	/* Check if it supports "query-cpu-stopped-state" */
>   	if (prom_getprop(rtas_node, "query-cpu-stopped-state",
> @@ -1893,6 +1910,7 @@ static void __init prom_instantiate_rtas(void)
>   	prom_debug("rtas base     = 0x%x\n", base);
>   	prom_debug("rtas entry    = 0x%x\n", entry);
>   	prom_debug("rtas size     = 0x%x\n", size);
> +	prom_debug("rtas 64-bit   = 0x%x\n", rtas_64);
>   
>   	prom_debug("prom_instantiate_rtas: end...\n");
>   }
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 8d81c1e7a8db..723806468984 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -45,6 +45,8 @@
>   #include <asm/trace.h>
>   #include <asm/udbg.h>
>   
> +int rtas_64 = 1;
> +
>   struct rtas_filter {
>   	/* Indexes into the args buffer, -1 if not used */
>   	const int buf_idx1;
> @@ -2087,6 +2089,9 @@ int __init early_init_dt_scan_rtas(unsigned long node,
>   	entryp = of_get_flat_dt_prop(node, "linux,rtas-entry", NULL);
>   	sizep  = of_get_flat_dt_prop(node, "rtas-size", NULL);
>   
> +	if (!of_get_flat_dt_prop(node, "linux,rtas-64", NULL))
> +		rtas_64 = 0;
> +
>   #ifdef CONFIG_PPC64
>   	/* need this feature to decide the crashkernel offset */
>   	if (of_get_flat_dt_prop(node, "ibm,hypertas-functions", NULL))
> diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
> index 6ce95ddadbcd..df776f0103c9 100644
> --- a/arch/powerpc/kernel/rtas_entry.S
> +++ b/arch/powerpc/kernel/rtas_entry.S
> @@ -54,6 +54,10 @@ _ASM_NOKPROBE_SYMBOL(enter_rtas)
>   /*
>    * 32-bit rtas on 64-bit machines has the additional problem that RTAS may
>    * not preserve the upper parts of registers it uses.
> + *
> + * Note: In 64-bit RTAS, the SF bit is set so that RTAS can return
> + * correctly if the return address is above 4 GB. Everything else
> + * works the same as in 32-bit RTAS.
>    */
>   _GLOBAL(enter_rtas)
>   	mflr	r0
> @@ -113,7 +117,18 @@ __enter_rtas:
>   	 * from the saved MSR value and insert into the value RTAS will use.
>   	 */
>   	extrdi	r0, r6, 1, 63 - MSR_HV_LG
> -	LOAD_REG_IMMEDIATE(r6, MSR_ME | MSR_RI)
> +
> +	LOAD_REG_ADDR(r7, rtas_64)	/* Load the address rtas_64 into r7 */
> +	ld      r8, 0(r7)               /* Load the value of rtas_64 from memory into r8 */
> +	cmpdi   r8, 0                   /* Compare r8 with 0 (check if rtas_64 is zero) */
> +	beq     no_sf_bit               /* Branch to no_sf_bit if rtas_64 is zero */
> +	LOAD_REG_IMMEDIATE(r6, MSR_ME | MSR_RI | MSR_SF)	/* r6 = ME|RI|SF */
> +	b       continue
> +
> +no_sf_bit:
> +	LOAD_REG_IMMEDIATE(r6, MSR_ME | MSR_RI)		/* r6 = ME|RI (NO SF bit in MSR) */
> +
> +continue:
>   	insrdi	r6, r0, 1, 63 - MSR_HV_LG
>   
>   	li      r0,0


