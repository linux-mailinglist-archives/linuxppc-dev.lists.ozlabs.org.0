Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A56D433CD18
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 06:24:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F01tY4yNRz30GS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 16:24:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N5Vr5fcf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=N5Vr5fcf; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F01t52n06z2y89
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 16:23:56 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12G52xei175245; Tue, 16 Mar 2021 01:23:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : content-transfer-encoding : in-reply-to; s=pp1;
 bh=gj3xgLgx98FSEfuNmymrC0uNSNTsFITBbOt9W87oykw=;
 b=N5Vr5fcf9jKNPwo+odcGANzf85Q+PHHF6ZSj62ITDY7X0L3OKBIyEg10dc1vWPqq77Es
 c3zowNp871CL8qm6c60as10YqxfzJFxeL+kkm7eIBY6UQa+WHJ7ZTsfl+WJpfv1258zO
 xpxjC5nuulN1aZvbRVlblGvFt8d7ClwLoe5wNWlxxt1bp2H20t4wNiYQh2EqzvEpMCbq
 pF4LylJ8XVa8bcSNKyeLW8vq8XU7ZNLgSJWQ1gfgPFp/q7GzGX08v2yXE9lCrLQb3sxQ
 ntDNSplHfbbmZ1R7x5AKWPEIR547OZTy/lnnlPxjo5dsy9casuOsrQ41TkYcoW0TjK8b Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 379yjdb7nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 01:23:47 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12G53Q44176326;
 Tue, 16 Mar 2021 01:23:46 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 379yjdb7n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 01:23:46 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12G5NBPA024484;
 Tue, 16 Mar 2021 05:23:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 378n18jg3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 05:23:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12G5NgEo39780678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Mar 2021 05:23:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA5544C040;
 Tue, 16 Mar 2021 05:23:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 260334C044;
 Tue, 16 Mar 2021 05:23:41 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Mar 2021 05:23:40 +0000 (GMT)
Date: Tue, 16 Mar 2021 10:53:40 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: G@linux.vnet.ibm.com
Subject: Re: [PATCH] powerpc/numa: Fix topology_physical_package_id() on
 pSeries
Message-ID: <20210316052340.GA2337468@linux.vnet.ibm.com>
References: <20210312143154.3181109-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312143154.3181109-1-clg@kaod.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_15:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103160033
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* C?dric Le Goater <clg@kaod.org> [2021-03-12 15:31:54]:

> Initial commit 15863ff3b8da ("powerpc: Make chip-id information
> available to userspace") introduce a cpu_to_chip_id() routine for the
> PowerNV platform using the "ibm,chip-id" property to query the chip id
> of a CPU. But PAPR does not specify such a property and the node id
> query is broken.
> 
> Use cpu_to_node() instead which guarantees to have a correct value on
> all platforms, PowerNV an pSeries.
> 

While this looks good to me, @mpe had reservations on using nid as chip-id.
https://lore.kernel.org/linuxppc-dev/87lfwhypv0.fsf@concordia.ellerman.id.au/t/#u
He may be okay with using nid as a "virtual" package id in a pseries
environment.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/include/asm/topology.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 3beeb030cd78..887c42a4e43d 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -123,7 +123,7 @@ static inline int cpu_to_coregroup_id(int cpu)
>  #ifdef CONFIG_PPC64
>  #include <asm/smp.h>
>  
> -#define topology_physical_package_id(cpu)	(cpu_to_chip_id(cpu))
> +#define topology_physical_package_id(cpu)	(cpu_to_node(cpu))
>  
>  #define topology_sibling_cpumask(cpu)	(per_cpu(cpu_sibling_map, cpu))
>  #define topology_core_cpumask(cpu)	(cpu_cpu_mask(cpu))
> -- 
> 2.26.2
> 

-- 
Thanks and Regards
Srikar Dronamraju
