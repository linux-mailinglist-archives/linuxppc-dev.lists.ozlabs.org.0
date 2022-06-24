Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 919615595CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 10:51:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTrT139GYz3cf9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 18:51:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rKzMkQ+u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rKzMkQ+u;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTrSL2HwVz3bcZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 18:50:58 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25O8LqK3028681;
	Fri, 24 Jun 2022 08:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=rngDtFENuGkx0GYDUV7i3vYrJGUSJwBrV1rhM4c78Wo=;
 b=rKzMkQ+umLwuQozRQCt57urFM17FedEfNGSHtYS0wgyvMw1/zP+8eblkw4W0Mp6Qwpm5
 E9FvlB6nhmd7rFp7oSCCZnpvM6d6PzFMfazXkYQf+ve0UEBIXv2EBDDgYPJDBbsGdKYp
 2VLqQQ/tBalib8s5kQdEf04YeIaM02N5prNsKTAWkfES8y3wDARzSj8ZBOGgp59+mQA+
 pWtB2SrueuhbSJL3zDInnxXkRpiGmQ+2zuvixRJM3gVQqjlQI6fH7mNNYfihkOwL1vaQ
 +Gx8AxRCENBbwrrH8QfgHqriE3MzmudIZtdNJ1qjBszzwa5U7UVByWSc6+56tutEIUdF KQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gw9perkj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 08:50:53 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25O8M8sN026680;
	Fri, 24 Jun 2022 08:50:51 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3gs6b98pmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 08:50:51 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25O8nwDp16646508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jun 2022 08:49:58 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBFE352050;
	Fri, 24 Jun 2022 08:50:48 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id E963D5204F;
	Fri, 24 Jun 2022 08:50:47 +0000 (GMT)
Date: Fri, 24 Jun 2022 14:20:47 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/numa: Return the first online node if device
 tree mapping returns a not online node
Message-ID: <20220624085047.GB145013@linux.vnet.ibm.com>
References: <20220623125442.645240-1-aneesh.kumar@linux.ibm.com>
 <20220623125442.645240-2-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20220623125442.645240-2-aneesh.kumar@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n5AYZ0aL210nc82cr2OGEP4nPrOt0gDq
X-Proofpoint-ORIG-GUID: n5AYZ0aL210nc82cr2OGEP4nPrOt0gDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_05,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206240032
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2022-06-23 18:24:42]:

> While building the cpu_to_node map make sure we always use the online node
> to build the mapping table. In general this should not be an issue
> because the kernel use similar lookup mechanism (vphn_get_nid()) to mark
> nodes online (setup_node_data()). Hence NUMA nodes we find during
> lookup in numa_setup_cpu() will always be found online.
> 
> To keep logic simpler/correct, make sure that if the hypervisor
> or device tree returned a not online node, don't use that to build
> the map table. Instead, use the first_online_node.

Why should the returned nid be already online. Are we facing any problem
with the current code?

Since general idea is to keep cpu_to_node constant, By assigining it the
first_online_node, we may be ending up assigning a wrong node, resulting a
performance penalty later on. i.e CPU may actually belong to node 4 but we
assigned it to node 1. Also the coregroup id is derived from associavity
array. If there is a mismatch between the coregroup id and nid,
scheduler will crib.

> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/numa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 0801b2ce9b7d..f387b9eb9dc9 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -741,7 +741,7 @@ static int numa_setup_cpu(unsigned long lcpu)
>  	of_node_put(cpu);
> 
>  out_present:
> -	if (nid < 0 || !node_possible(nid))
> +	if (nid < 0 || !node_online(nid))
>  		nid = first_online_node;
> 
>  	/*
> -- 
> 2.36.1
> 

-- 
Thanks and Regards
Srikar Dronamraju
