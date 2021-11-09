Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0EE44A47D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 03:14:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpBQ95vd1z3c4x
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 13:14:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S3KjmnIU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=S3KjmnIU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpBPR5H3Gz2xYG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 13:14:19 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A91GXSJ028772
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 9 Nov 2021 02:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=q5TeIWSTRYG3weUupKLv6n2aZWs5fkC9ZgM8PJ+IctQ=;
 b=S3KjmnIU410WTGAbu9HEBF1JIIWdaJyhBpfD3jFE5HFx09Mp5Yindfq46KDGrwgY/dGQ
 UVazRlrxaIs2ZDodzQSmjgrdRSCmxnDHT5KkjoXLaky/lqgeSgfbXfvO73L+EnfhEdeX
 t10oH+miPm2/DG7OsSfjBQTDhaqM2qlXKq3bpBjkMIQbhKEtHM3NRLfNpGiOStS2Ntl7
 XGknmMAbE1xAAn/q3/2sZ5eOkNM62Dyxuxhmp0Z6pamOmDikF7ZJdvjF4bA1uBjeUMwW
 aMDht6hNeoxtd27tpIMkArfaO6FHfdQioelJl4UccqYD3DK/8an1aVQyIrroZberCwi4 PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c7f6as25e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 02:14:17 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A92AM3F022929
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 9 Nov 2021 02:14:16 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c7f6as256-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 02:14:16 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A92CoPr004111;
 Tue, 9 Nov 2021 02:14:15 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 3c5hbatusj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 02:14:15 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A92EEVK42664214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Nov 2021 02:14:14 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B04BAE062;
 Tue,  9 Nov 2021 02:14:14 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3495AAE060;
 Tue,  9 Nov 2021 02:14:14 +0000 (GMT)
Received: from localhost (unknown [9.211.44.202])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  9 Nov 2021 02:14:13 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/pseries: use slab context cpumask allocation in
 CPU hotplug init
In-Reply-To: <20211105132923.1582514-1-npiggin@gmail.com>
References: <20211105132923.1582514-1-npiggin@gmail.com>
Date: Mon, 08 Nov 2021 20:14:13 -0600
Message-ID: <87y25yhy8a.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IOiXSbxs1SNPsz3-hJuZ6lz24ocF7iri
X-Proofpoint-GUID: 905VeKp1zIHa_uYjforMK_zI6nELPf9M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_07,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090007
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
Cc: ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Slab is up at this point, using the bootmem allocator triggers a
> warning. Switch to using the regular cpumask allocator.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>

> ---
>
> This only matters when CONFIG_CPUMASK_OFFNODE=y, which has not been
> possible before on powerpc.
>
> Thanks,
> Nick
>
>  arch/powerpc/platforms/pseries/hotplug-cpu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index d646c22e94ab..78a70ba60d24 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -1016,12 +1016,13 @@ static int __init pseries_cpu_hotplug_init(void)
>  	/* Processors can be added/removed only on LPAR */
>  	if (firmware_has_feature(FW_FEATURE_LPAR)) {
>  		for_each_node(node) {
> -			alloc_bootmem_cpumask_var(&node_recorded_ids_map[node]);
> +			if (!alloc_cpumask_var_node(&node_recorded_ids_map[node],
> +						    GFP_KERNEL, node))
> +				return -ENOMEM;
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


