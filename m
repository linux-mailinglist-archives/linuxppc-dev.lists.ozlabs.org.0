Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA9B44AB7A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 11:28:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpPMh48SJz2yPq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 21:28:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d+yZQWo0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=d+yZQWo0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpPLw0kNKz2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 21:27:51 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A99jlf3030803
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 9 Nov 2021 10:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=30k9F9XF+vAZBXR8R/UJgLYFepBFMffrlRhIhA3wD8c=;
 b=d+yZQWo0S2G0VUpxIOsVCGzMjK0otds2LYAZf3vjc48TBLh/U6qliUa1xbn08+cU2kCj
 8yUpOhF92tgz3YnU4Rc3ztIbhoZ/OPMYO9eFu/ZQpuoq6km8ARwhij81rwS4+2pnuJIl
 oQV/3wIzSr945XANSRYyGAzJZTMdpFrXHm6PdAEfXjBl2zUdG9fpeDJPjXnmdbTX4uFh
 YxiRf2+Mk+DO1BKfhLhU1J1B5jwb0MvhKiKRyBD9LfAJWYrIdyXFU7MkxX/jMVl7xxh1
 kgyo5BN06G1p3hn0N56XE0Oziy5Fr63pe7ebppSkcfyNrWR8RtwFNzacw3xCMlu2u4EF lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c7m1p4gqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 10:27:48 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A99eIZl013299
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 9 Nov 2021 10:27:47 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c7m1p4gq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 10:27:47 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A9ARBlZ011718;
 Tue, 9 Nov 2021 10:27:45 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3c5hb9mq2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 10:27:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1A9AL6pJ61866248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Nov 2021 10:21:06 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9A0AA4062;
 Tue,  9 Nov 2021 10:27:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF6D1A4054;
 Tue,  9 Nov 2021 10:27:42 +0000 (GMT)
Received: from [9.144.158.191] (unknown [9.144.158.191])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  9 Nov 2021 10:27:42 +0000 (GMT)
Message-ID: <ab4b5c42-02ea-2a54-4491-530fa54b120e@linux.ibm.com>
Date: Tue, 9 Nov 2021 11:27:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH] powerpc/pseries: use slab context cpumask allocation in
 CPU hotplug init
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211105132923.1582514-1-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20211105132923.1582514-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G55h4QIRuFvSHrkZjMysCa00zVvVX5F-
X-Proofpoint-ORIG-GUID: 6qx-KQX2yPrW893JehYNJrY6WvwM4KWm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_03,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111090057
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 05/11/2021 à 14:29, Nicholas Piggin a écrit :
> Slab is up at this point, using the bootmem allocator triggers a
> warning. Switch to using the regular cpumask allocator.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> 
> This only matters when CONFIG_CPUMASK_OFFNODE=y, which has not been
> possible before on powerpc.

Thanks Nick,

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>


> Thanks,
> Nick
> 
>   arch/powerpc/platforms/pseries/hotplug-cpu.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index d646c22e94ab..78a70ba60d24 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -1016,12 +1016,13 @@ static int __init pseries_cpu_hotplug_init(void)
>   	/* Processors can be added/removed only on LPAR */
>   	if (firmware_has_feature(FW_FEATURE_LPAR)) {
>   		for_each_node(node) {
> -			alloc_bootmem_cpumask_var(&node_recorded_ids_map[node]);
> +			if (!alloc_cpumask_var_node(&node_recorded_ids_map[node],
> +						    GFP_KERNEL, node))
> +				return -ENOMEM;
>   
>   			/* Record ids of CPU added at boot time */
> -			cpumask_or(node_recorded_ids_map[node],
> -				   node_recorded_ids_map[node],
> -				   cpumask_of_node(node));
> +			cpumask_copy(node_recorded_ids_map[node],
> +				     cpumask_of_node(node));
>   		}
>   
>   		of_reconfig_notifier_register(&pseries_smp_nb);
> 

