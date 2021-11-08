Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BC5449EED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 00:07:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hp6Fr5P7Qz2yp1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 10:07:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ti9UYS+V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ti9UYS+V; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hp6F35XDNz2yHb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 10:06:47 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8Lgcac000948; 
 Mon, 8 Nov 2021 23:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=28AbmendAYXeR6fUC1ho2Pcq7kIkNtSNfAqDBFRoSYM=;
 b=ti9UYS+Vdl1S/ERkvxbM+YFYzB1aM1wti+c2uGLPZELBx6hYuquMKzVwZq2Egjdg0hCa
 H6D/U95+fz6uJdo72E/pM1Y0fdPWuM9a+T2/gaulH3UvRItj1CtTrjYf4flHt61Vfpew
 mik75L+e1wpY//nGSsZYg/5LybtY8X4bDN+5QE0TdeCb+09IchWongQ37gsZvQ2/vl42
 eA2k2xKqIXEVnvVW1nd6gXcposOOePymNAkLytPU/VGgpGctYdvd7HOOemWW0f2Ee9bI
 WSZCGjXQiJCvAnZGclYoxfrzOXdg7eMdu5QQeemG395PaUJGsBJnV34HpeJoPEH0uRwK 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c6b56swg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 23:06:33 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A8MqIUG022582;
 Mon, 8 Nov 2021 23:06:32 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c6b56swfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 23:06:32 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A8N4ZYh009156;
 Mon, 8 Nov 2021 23:06:31 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 3c5hbafxwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 23:06:31 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A8N6UKU48824622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Nov 2021 23:06:30 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E7F612406C;
 Mon,  8 Nov 2021 23:06:30 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2A97124071;
 Mon,  8 Nov 2021 23:06:29 +0000 (GMT)
Received: from localhost (unknown [9.211.44.202])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  8 Nov 2021 23:06:29 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] powerpc/pseries/cpuhp: Use alloc_cpumask_var() in
 pseries_cpu_hotplug_init()
In-Reply-To: <20211108164751.65565-1-longman@redhat.com>
References: <20211108164751.65565-1-longman@redhat.com>
Date: Mon, 08 Nov 2021 17:06:29 -0600
Message-ID: <875yt2jlhm.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5re5_lpigEsEtzDBO9-wec1rzPVHyoUI
X-Proofpoint-ORIG-GUID: l9S51cv-Z_dhRyukzX6A7ppojbFW96Ql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_06,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111080137
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Waiman Long <longman@redhat.com> writes:

> It was found that the following warning message could be printed out when
> booting the kernel on PowerPC systems that support LPAR:
>
> [    0.129584] WARNING: CPU: 0 PID: 1 at mm/memblock.c:1451 memblock_alloc_internal+0x5c/0x104
> [    0.129593] Modules linked in:
> [    0.129598] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-11.el9.ppc64le+debug #1
> [    0.129605] NIP:  c000000002040134 LR: c00000000204011c CTR: c0000000020241a8
> [    0.129610] REGS: c000000005637760 TRAP: 0700   Not tainted  (5.14.0-11.el9.ppc64le+debug)
> [    0.129616] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 48000222  XER: 00000002
> [    0.129635] CFAR: c0000000004d1cf4 IRQMASK: 0
> [    0.129635] GPR00: c00000000204011c c000000005637a00 c000000002c94d00 0000000000000001
> [    0.129635] GPR04: 0000000000000080 0000000000000000 0000000000000000 ffffffffffffffff
> [    0.129635] GPR08: 0000000000000000 0000000000000003 c00000000205ac64 0000000000080000
> [    0.129635] GPR12: 0000000000000000 c0000000049d0000 c000000000013078 0000000000000000
> [    0.129635] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    0.129635] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    0.129635] GPR24: c000000002003808 c00000000146f7b8 0000000000000000 0000000000000100
> [    0.129635] GPR28: c000000002d7cf80 0000000000000000 0000000000000008 0000000000000000
> [    0.129710] NIP [c000000002040134] memblock_alloc_internal+0x5c/0x104
> [    0.129717] LR [c00000000204011c] memblock_alloc_internal+0x44/0x104
> [    0.129723] Call Trace:
> [    0.129726] [c000000005637a00] [c000000005637a40] 0xc000000005637a40 (unreliable)
> [    0.129735] [c000000005637a60] [c0000000020404d8] memblock_alloc_try_nid+0x94/0xcc
> [    0.129743] [c000000005637af0] [c00000000205ac64] alloc_bootmem_cpumask_var+0x4c/0x9c
> [    0.129751] [c000000005637b60] [c0000000020242e0] __machine_initcall_pseries_pseries_cpu_hotplug_init+0x138/0x1d8
> [    0.129760] [c000000005637bf0] [c000000000012404] do_one_initcall+0xa4/0x4f0
> [    0.129768] [c000000005637cd0] [c000000002005358] do_initcalls+0x140/0x18c
> [    0.129776] [c000000005637d80] [c0000000020055b8] kernel_init_freeable+0x178/0x1d0
> [    0.129783] [c000000005637db0] [c0000000000130a0] kernel_init+0x30/0x190
> [    0.129790] [c000000005637e10] [c00000000000cef4] ret_from_kernel_thread+0x5c/0x64
>
> The warning is printed in memblock_alloc_internal() because the slab
> has been initialized when the initcalls are being processed.

Looks like CONFIG_CPUMASK_OFFSTACK=y is necessary for the warning to
trigger... guess that explains how it's escaped notice.

> To
> avoid the warning, change alloc_bootmem_cpumask_var() call in
> pseries_cpu_hotplug_init() to alloc_cpumask_var() instead. Also
> change cpumask_or() to cpumask_copy() or we will have to use
> zalloc_cpumask_var().

Makes sense.


> Fixes: bd1dd4c5f528 ("powerpc/pseries: Prevent free CPU ids being reused on another node")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  arch/powerpc/platforms/pseries/hotplug-cpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index 5ab44600c8d3..e8e08d916b16 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -864,12 +864,12 @@ static int __init pseries_cpu_hotplug_init(void)
>  	/* Processors can be added/removed only on LPAR */
>  	if (firmware_has_feature(FW_FEATURE_LPAR)) {
>  		for_each_node(node) {
> -			alloc_bootmem_cpumask_var(&node_recorded_ids_map[node]);
> +			alloc_cpumask_var(&node_recorded_ids_map[node],
> +					  GFP_KERNEL|GFP_NOWAIT);

This isn't atomic context, so GFP_KERNEL alone should be used.

Otherwise this change looks right to me.

>  
>  			/* Record ids of CPU added at boot time */
> -			cpumask_or(node_recorded_ids_map[node],
> -				   node_recorded_ids_map[node],
> -				   cpumask_of_node(node));
> +			cpumask_copy(node_recorded_ids_map[node],
> +				     cpumask_of_node(node));
>  		}
>  
>  		of_reconfig_notifier_register(&pseries_smp_nb);
> -- 
> 2.27.0
