Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 749996D0AFD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 18:26:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnTMS22BWz3fGT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 03:26:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T3nQN+mU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T3nQN+mU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnTLZ1VCwz3bh0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 03:25:57 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32UFEQL1019431;
	Thu, 30 Mar 2023 16:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=XdWnTvDtTo7LhXCdnV2v3He3CuM9RJZvqgmWc1ncHwo=;
 b=T3nQN+mUQhz2OkgLc0nTfp/Z0ERcNrv/uJbQ5F6mhtHcOuVXl5LVAQXUCU3GJTcNdEA1
 X1dOQkR+k4+zU9xT64lm3ih20hWEqPVy+Vp197vNdJiuJpG/uQ4JYpH6iqXWlIJkWbUC
 I6LKEn6xjz6RytFQYfC7hHC/Dc6NY1RU0JNeqJWVk7qFwTua0TAu/hl4ODkMsnGEpLST
 yEG2drRtapaO+UeIvJ7pKFsSRUpbrN3ODc/qyDJYRjKA9c8hxue+oTdSXbHOX0b9EzKM
 S8MLp+QZdK/wys98KsjM9HivbgzS2JwtkGNHxDcrbw2j0UhShT3s+jzqVPoPhR32eS7V Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnb4qdt0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 16:25:49 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32UFrlKG020763;
	Thu, 30 Mar 2023 16:25:49 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnb4qdt04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 16:25:49 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32UE7e1i019763;
	Thu, 30 Mar 2023 16:25:48 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3phrk83v6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 16:25:48 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32UGPlba26411726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Mar 2023 16:25:47 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFF2258059;
	Thu, 30 Mar 2023 16:25:46 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 300CD58058;
	Thu, 30 Mar 2023 16:25:45 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.103.32])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Mar 2023 16:25:44 +0000 (GMT)
X-Mailer: emacs 29.0.60 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: Re: [PATCH] powerpc/papr_scm: Update the NUMA distance table for
 the target node
In-Reply-To: <20230330123502.1524429-1-aneesh.kumar@linux.ibm.com>
References: <20230330123502.1524429-1-aneesh.kumar@linux.ibm.com>
Date: Thu, 30 Mar 2023 21:55:42 +0530
Message-ID: <87r0t6dx4p.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NsHSbmk3lkM__io5ywctUm9DIoQ_Bme1
X-Proofpoint-ORIG-GUID: 0awJeey-jYybcpsdXioeAh2sGUJqf4ig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_09,2023-03-30_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=918 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303300127
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> platform device helper routines won't update the NUMA distance table
> while creating a platform device, even if the device is present on
> a NUMA node that doesn't have memory or CPU. This is especially true
> for pmem devices. If the target node of the pmem device is not online, we
> find the nearest online node to the device and associate the pmem
> device with that online node. To find the nearest online node, we should
> have the numa distance table updated correctly. Update the distance
> information during the device probe.
>
> distance_lookup_table value for distance_ref_points_depth = 2 before and after
> fix is below
> node 3 distance depth 0  - 0
> node 3 distance depth 1  - 0
> node 4 distance depth 0  - 4
> node 4 distance depth 1  - 2
> node 5 distance depth 0  - 5
> node 5 distance depth 1  - 1
>
> after fix
> node 3 distance depth 0  - 3
> node 3 distance depth 1  - 1
> node 4 distance depth 0  - 4
> node 4 distance depth 1  - 2
> node 5 distance depth 0  - 5
> node 5 distance depth 1  - 1
>
> Without the fix, the nearest numa node to the pmem device will be picked as 4.
> After the fix, we get the correct numa node which is 5.
>
> Fixes: da1115fdbd6e ("powerpc/nvdimm: Pick nearby online node if the device node is not online")
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 2f8385523a13..5bef75714bd5 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -1428,6 +1428,10 @@ static int papr_scm_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	/*
> +	 * of platform device create won't update the numa distance table
> +	 */
> +	update_numa_distance(dn);
>  
>  	p = kzalloc(sizeof(*p), GFP_KERNEL);
>  	if (!p)
> -- 
> 2.39.2

This also requires export of update_numa_distance()

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index b44ce71917d7..16cfe56be05b 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -366,6 +366,7 @@ void update_numa_distance(struct device_node *node)
 	WARN(numa_distance_table[nid][nid] == -1,
 	     "NUMA distance details for node %d not provided\n", nid);
 }
+EXPORT_SYMBOL_GPL(update_numa_distance);
 
 /*
  * ibm,numa-lookup-index-table= {N, domainid1, domainid2, ..... domainidN}
