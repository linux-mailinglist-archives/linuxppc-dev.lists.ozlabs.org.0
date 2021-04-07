Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8900E356F9A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 17:01:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFnf83t5dz3bwK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 01:01:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V6o+p5Vy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=V6o+p5Vy; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFndc35vZz2yym
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 01:00:51 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137EYnBW175694; Wed, 7 Apr 2021 11:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Gxygs5tSf3/pSAvdRsUUxKwpp0MllRpDq0ykY3tMwSc=;
 b=V6o+p5Vy/aWJzpgjUe+k5erKAnWDyKbGwXw+afDu5f44s3DI8ovffmhU63G1fGem2dQA
 z1oKr75drRci134MPya5ImIH0rCaHdSjFMImJD0dF/QVJrTjjE/djHYjjgxCFucea6Sc
 9dfZGFMLxt6oqRGliSyb4LRj0IM0lQ2h4M3S1oPzfNwDpk1lwjDNx+YoBKqjmZyK14yn
 pBSdKYX4VzgK0enwUXGglUq38cxH02x3w2ymd+6eiZ/S0dPoIMLzi1L2Cj0n/KR49F7I
 9pS3Gu607qsLbG6UyQXNjTujS2F3ZjuHsbP8sPpykBglmeS7sHAMuKmBt807AffCU6Xv Pg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37s5xsgv34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 11:00:44 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137EvPvP003582;
 Wed, 7 Apr 2021 15:00:42 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 37rvbqgtq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 15:00:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137F0dIP19530006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 15:00:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A48E7A4040;
 Wed,  7 Apr 2021 15:00:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63534A4053;
 Wed,  7 Apr 2021 15:00:39 +0000 (GMT)
Received: from pomme.local (unknown [9.145.159.151])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  7 Apr 2021 15:00:39 +0000 (GMT)
Subject: Re: [PATCH v3] pseries: prevent free CPU ids to be reused on another
 node
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20210406182554.85197-1-ldufour@linux.ibm.com>
 <87blaqkuty.fsf@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <955e0f2f-bd5b-1610-2dfc-6c0b8e94e295@linux.ibm.com>
Date: Wed, 7 Apr 2021 17:00:38 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <87blaqkuty.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ns26HUKaXzTouJ28fVTHbQyFzINMa2GK
X-Proofpoint-ORIG-GUID: Ns26HUKaXzTouJ28fVTHbQyFzINMa2GK
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_08:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070103
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
Cc: cheloha@linux.ibm.com, linux-kernel@vger.kernel.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 07/04/2021 à 16:55, Nathan Lynch a écrit :
> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> Changes since V2, addressing Nathan's comments:
>>   - Remove the retry feature
>>   - Reduce the number of local variables (removing 'i')
> 
> I was more interested in not having two variables for NUMA nodes in the
> function named 'node' and 'nid', hoping at least one of them could have
> a more descriptive name. See below.
> 
>>   static int pseries_add_processor(struct device_node *np)
>>   {
>> -	unsigned int cpu;
>> +	unsigned int cpu, node;
>>   	cpumask_var_t candidate_mask, tmp;
>> -	int err = -ENOSPC, len, nthreads, i;
>> +	int err = -ENOSPC, len, nthreads, nid;
>>   	const __be32 *intserv;
>>   
>>   	intserv = of_get_property(np, "ibm,ppc-interrupt-server#s", &len);
>> @@ -163,9 +169,17 @@ static int pseries_add_processor(struct device_node *np)
>>   	zalloc_cpumask_var(&candidate_mask, GFP_KERNEL);
>>   	zalloc_cpumask_var(&tmp, GFP_KERNEL);
>>   
>> +	/*
>> +	 * Fetch from the DT nodes read by dlpar_configure_connector() the NUMA
>> +	 * node id the added CPU belongs to.
>> +	 */
>> +	nid = of_node_to_nid(np);
>> +	if (nid < 0 || !node_possible(nid))
>> +		nid = first_online_node;
>> +
>>   	nthreads = len / sizeof(u32);
>> -	for (i = 0; i < nthreads; i++)
>> -		cpumask_set_cpu(i, tmp);
>> +	for (cpu = 0; cpu < nthreads; cpu++)
>> +		cpumask_set_cpu(cpu, tmp);
>>   
>>   	cpu_maps_update_begin();
>>   
>> @@ -173,6 +187,19 @@ static int pseries_add_processor(struct device_node *np)
>>   
>>   	/* Get a bitmap of unoccupied slots. */
>>   	cpumask_xor(candidate_mask, cpu_possible_mask, cpu_present_mask);
>> +
>> +	/*
>> +	 * Remove free ids previously assigned on the other nodes. We can walk
>> +	 * only online nodes because once a node became online it is not turned
>> +	 * offlined back.
>> +	 */
>> +	for_each_online_node(node) {
>> +		if (node == nid) /* Keep our node's recorded ids */
>> +			continue;
>> +		cpumask_andnot(candidate_mask, candidate_mask,
>> +			       node_recorded_ids_map[node]);
>> +	}
>> +
> 
> e.g. change 'nid' to 'assigned_node' or similar, and I think this
> becomes easier to follow.

Fair enough, will send a v4

> Otherwise the patch looks fine to me now.
> 

