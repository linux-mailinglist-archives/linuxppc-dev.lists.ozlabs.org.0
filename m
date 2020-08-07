Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E659523E6F3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 07:03:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNCtn6V0GzDqwT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 15:03:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Z5A+B9LL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNCsG38hpzDqsb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 15:02:26 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07751ea3069454; Fri, 7 Aug 2020 01:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OkzSOxUimUpmNx03BTZcXPWsCGScWf1qncyFTTGF/yY=;
 b=Z5A+B9LLRhc3mB6TnJD8rhH5D5QdHMY/Z43Jy9zPeRU2R0IAIKCktc9RuDbDT+sOyiAL
 YY+8CInV4IBm6zlXeWd8JKsaZ9Hdj705oioec0oIG7vNPU2l/zNhVMoQOFTzEektJJqe
 BmkoQcv8BuY7nT9nl2T4nGXQb5YjjHWVSMq9DIRO3IsbKRq9LpFBMpy2oKlUYyVKFiRu
 N/t+0BQLBsAUGzaOt4eeJ7/D2Acj8Y5y5vT23dg2839I8Mje5l+1Co1m38z+3zhLY4r0
 ejMVH4VQHAYbLyB27oMhtySqR5kuGdVMmFVorHDGjTWmLTu4Lwx3qRYOuxwXkyO9Alaz qg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32rg3p16ea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 01:02:20 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07750PJV017785;
 Fri, 7 Aug 2020 05:02:17 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 32n01868sa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 05:02:17 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07752FJM40698174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Aug 2020 05:02:15 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6C8411C04A;
 Fri,  7 Aug 2020 05:02:14 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5AAE11C05B;
 Fri,  7 Aug 2020 05:02:13 +0000 (GMT)
Received: from [9.102.21.222] (unknown [9.102.21.222])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Aug 2020 05:02:13 +0000 (GMT)
Subject: Re: [RFC PATCH 1/2] powerpc/numa: Introduce logical numa id
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20200731111916.243569-1-aneesh.kumar@linux.ibm.com>
 <87pn83ytet.fsf@linux.ibm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <324611f7-fdaf-f83c-7159-977488aa7ce7@linux.ibm.com>
Date: Fri, 7 Aug 2020 10:32:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87pn83ytet.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-07_01:2020-08-06,
 2020-08-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008070032
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
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/7/20 9:54 AM, Nathan Lynch wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>> index e437a9ac4956..6c659aada55b 100644
>> --- a/arch/powerpc/mm/numa.c
>> +++ b/arch/powerpc/mm/numa.c
>> @@ -221,25 +221,51 @@ static void initialize_distance_lookup_table(int nid,
>>   	}
>>   }
>>   
>> +static u32 nid_map[MAX_NUMNODES] = {[0 ... MAX_NUMNODES - 1] =  NUMA_NO_NODE};
> 
> It's odd to me to use MAX_NUMNODES for this array when it's going to be
> indexed not by Linux's logical node IDs but by the platform-provided
> domain number, which has no relation to MAX_NUMNODES.


I didn't want to dynamically allocate this. We could fetch 
"ibm,max-associativity-domains" to find the size for that. The current 
code do assume  firmware group id to not exceed MAX_NUMNODES. Hence kept 
the array size to be MAX_NUMNODEs. I do agree that it is confusing. May 
be we can do #define MAX_AFFINITY_DOMAIN MAX_NUMNODES?



> 
>> +
>> +int firmware_group_id_to_nid(int firmware_gid)
>> +{
>> +	static int last_nid = 0;
>> +
>> +	/*
>> +	 * For PowerNV we don't change the node id. This helps to avoid
>> +	 * confusion w.r.t the expected node ids. On pseries, node numbers
>> +	 * are virtualized. Hence do logical node id for pseries.
>> +	 */
>> +	if (!firmware_has_feature(FW_FEATURE_LPAR))
>> +		return firmware_gid;
>> +
>> +	if (firmware_gid ==  -1)
>> +		return NUMA_NO_NODE;
>> +
>> +	if (nid_map[firmware_gid] == NUMA_NO_NODE)
>> +		nid_map[firmware_gid] = last_nid++;
> 
> This should at least be bounds-checked in case of domain numbering in
> excess of MAX_NUMNODES. Or a different data structure should be used?
> Not sure.
> 
> I'd prefer Linux's logical node type not be easily interchangeable with
> the firmware node/group id type. The firmware type could be something
> like:
> 
> struct affinity_domain {
> 	u32 val;
> };
> typedef struct affinity_domain affinity_domain_t;
> 
> with appropriate accessors/APIs.
> 

That is a good idea. Will use this.

-aneesh

