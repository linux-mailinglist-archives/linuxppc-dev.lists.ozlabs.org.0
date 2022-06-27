Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D5F55B7C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 07:28:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWbpl1DJLz3cmx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 15:27:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WYrnBG5c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WYrnBG5c;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWbp16kbhz2yZc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 15:27:21 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25R4raeq020883;
	Mon, 27 Jun 2022 05:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=hfsE2EO57D+SeucS6DwvKqgpspcNxrTMzOB5pSrUBOI=;
 b=WYrnBG5cYckPvKrsCIOa+VaQ+yVeANQdfNXHcP6XIiYFW69wm2hV2DIC16BYM9oaddNF
 ELi00TNtTgLftZ2yAMMCs5n2omgsxSCOtE/sjioNgQh1Y0rR9LZvmYonFGlv3XB/KXmm
 tcnKrfspyjmw1Kg9ZfwkG4uQy9sAFQeYYFgPxq2QKlfKT6cm+M5rIQJFA26bQnM8ThcK
 6q+4Af5fXOKQVC/5tntChlCvwULFwhF6gy7DtsehAYSXf0drcm4ThwmRd8AGEEgQhlK2
 eFs93hWq6f3BddPQITKn1P5wKEQfUCad2zUgLosZd74yzFTMhagIo4JhTDuy0SPN6lHw og== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gy5wp8uyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 05:27:14 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25R56CO2019191;
	Mon, 27 Jun 2022 05:27:14 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma02dal.us.ibm.com with ESMTP id 3gwt09j9a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jun 2022 05:27:13 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25R5RD6G10551904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jun 2022 05:27:13 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 375DA28060;
	Mon, 27 Jun 2022 05:27:13 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2ED328058;
	Mon, 27 Jun 2022 05:27:11 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.47.235])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
	Mon, 27 Jun 2022 05:27:11 +0000 (GMT)
X-Mailer: emacs 29.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/numa: Return the first online node if
 device tree mapping returns a not online node
In-Reply-To: <20220624085047.GB145013@linux.vnet.ibm.com>
References: <20220623125442.645240-1-aneesh.kumar@linux.ibm.com>
 <20220623125442.645240-2-aneesh.kumar@linux.ibm.com>
 <20220624085047.GB145013@linux.vnet.ibm.com>
Date: Mon, 27 Jun 2022 10:57:08 +0530
Message-ID: <871qvaznf7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gB1H_WFluWcjQEg7nbvcuWo_vG5EGCfm
X-Proofpoint-GUID: gB1H_WFluWcjQEg7nbvcuWo_vG5EGCfm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_02,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 impostorscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206270022
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:

> * Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2022-06-23 18:24:42]:
>
>> While building the cpu_to_node map make sure we always use the online node
>> to build the mapping table. In general this should not be an issue
>> because the kernel use similar lookup mechanism (vphn_get_nid()) to mark
>> nodes online (setup_node_data()). Hence NUMA nodes we find during
>> lookup in numa_setup_cpu() will always be found online.
>> 
>> To keep logic simpler/correct, make sure that if the hypervisor
>> or device tree returned a not online node, don't use that to build
>> the map table. Instead, use the first_online_node.
>
> Why should the returned nid be already online. Are we facing any problem
> with the current code?

There is no issue with the current upstream code. The problem was
detected in a distro kernel where we had partial backport. We didn't
initialize NUMA node details correctly. So only a subset of actual
NUMA nodes got marked online. This resulted in a crash at completely
independent part of the kernel because the kernel try to derefer NODE_DATA()
which was not initialized. 

>
> Since general idea is to keep cpu_to_node constant, By assigining it the
> first_online_node, we may be ending up assigning a wrong node, resulting a
> performance penalty later on. i.e CPU may actually belong to node 4 but we
> assigned it to node 1. Also the coregroup id is derived from associavity
> array. If there is a mismatch between the coregroup id and nid,
> scheduler will crib.

The changed code will never be executed unless something broke between
the NUMA node init (setup_node_data() and numa_setup_cpu()). The reason
the code change was made was to keep it consistent with the fact that we
only initialize NODE_DATA for online NUMA nodes and hence don't return
a possible NUMA node value in numa_setup_cpu(). 

>
>> 
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  arch/powerpc/mm/numa.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>> index 0801b2ce9b7d..f387b9eb9dc9 100644
>> --- a/arch/powerpc/mm/numa.c
>> +++ b/arch/powerpc/mm/numa.c
>> @@ -741,7 +741,7 @@ static int numa_setup_cpu(unsigned long lcpu)
>>  	of_node_put(cpu);
>> 
>>  out_present:
>> -	if (nid < 0 || !node_possible(nid))
>> +	if (nid < 0 || !node_online(nid))
>>  		nid = first_online_node;
>> 
>>  	/*
>> -- 
>> 2.36.1
>> 
>
> -- 
> Thanks and Regards
> Srikar Dronamraju
