Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0A1522D03
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 09:18:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KymTY0gvbz3cJy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 17:18:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HkbTMFAB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HkbTMFAB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KymSr6gqWz3bwQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 17:17:32 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24B6Ipx2025620;
 Wed, 11 May 2022 07:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=IU3EI/xXf5NBSD2wBiMf5LVrVawcJX6mTGUba7Oc0Wg=;
 b=HkbTMFABIA+db4XcMjAnKT+aTRlENV3+QEPEI9pgKNGoQM5QCe/F6dgTc2s1YQ6Nx69j
 YQfvkh+/xd2PjYNvvFCAUvSBMOBplzeaPP82cWlI/akicKFNK/X2RGV6Qi4B0e1tNzQk
 nbVfFzpACSwlxV5H2vp6fNWlU6AcB/HJWal7pg51K88UdjrBQtDRDLAHTQt+Y9DsUvas
 FqP61QbND9PJQ9avgWUGkrJQKUsHnGs90/EYUYK1CtolyiHVMW6ZguoQQDWhLcOLnZgw
 NQ1IVj549ynKP440VqANxo1mrZSBlZeGXHnQna/s1aVHHFtl3xYfnIKnCdshc5xS0fNs lQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g07s1ryqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 07:17:11 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24B781AZ001490;
 Wed, 11 May 2022 07:17:09 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3fwgd8uxuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 07:17:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24B7H6fl47055356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 May 2022 07:17:06 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5780F4C04A;
 Wed, 11 May 2022 07:17:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F40F04C040;
 Wed, 11 May 2022 07:17:02 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.12.38])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 11 May 2022 07:17:02 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Wed, 11 May 2022 12:47:01 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, nvdimm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, Kajol Jain <kjain@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/papr_scm: Fix leaking nvdimm_events_map elements
In-Reply-To: <87k0athokh.fsf@linux.ibm.com>
References: <20220509060629.179282-1-vaibhav@linux.ibm.com>
 <87k0athokh.fsf@linux.ibm.com>
Date: Wed, 11 May 2022 12:47:01 +0530
Message-ID: <87zgjotu6q.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YE-KCorUel361YGtoqTGgsM_7I17GbSS
X-Proofpoint-ORIG-GUID: YE-KCorUel361YGtoqTGgsM_7I17GbSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_02,2022-05-10_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205110031
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
Cc: Dan Williams <dan.j.williams@intel.com>,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Thanks for reviewing this patch Aneesh,

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
>
>> Right now 'char *' elements allocated individual 'stat_id' in
>> 'papr_scm_priv.nvdimm_events_map' during papr_scm_pmu_check_events() leak in
>> papr_scm_remove() and papr_scm_pmu_register(), papr_scm_pmu_check_events() error
>> paths.
>>
>> Also individual 'stat_id' arent NULL terminated 'char *' instead they are fixed
>> 8-byte sized identifiers. However papr_scm_pmu_register() assumes it to be a
>> NULL terminated 'char *' and at other places it assumes it to be a
>> 'papr_scm_perf_stat.stat_id' sized string which is 8-byes in size.
>>
>> Fix this by allocating the memory for papr_scm_priv.nvdimm_events_map to also
>> include space for 'stat_id' entries. This is possible since number of available
>> events/stat_ids are known upfront. This saves some memory and one extra level of
>> indirection from 'nvdimm_events_map' to 'stat_id'. Also rest of the code
>> can continue to call 'kfree(papr_scm_priv.nvdimm_events_map)' without needing to
>> iterate over the array and free up individual elements.
>>
>> Also introduce a new typedef called 'state_id_t' thats a 'u8[8]' and can be used
>> across papr_scm to deal with stat_ids.
>>
>> Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/papr_scm.c | 48 +++++++++++------------
>>  1 file changed, 22 insertions(+), 26 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index 39962c905542..f33a865ad5fb 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -70,8 +70,10 @@
>>  #define PAPR_SCM_PERF_STATS_VERSION 0x1
>>  
>>  /* Struct holding a single performance metric */
>> +typedef u8 stat_id_t[8];
>> +
>>  struct papr_scm_perf_stat {
>> -	u8 stat_id[8];
>> +	stat_id_t stat_id;
>>  	__be64 stat_val;
>>  } __packed;
>
> Can we do this as two patch? One that fix the leak and other that adds
> new type?
>
Yeah, sure that would be a simple change. I will send a v2 across that
only removes the leak and then a subsequent patch that changes the usage
of stat_id within papr_scm to the new typedef

>>  
>> @@ -126,7 +128,7 @@ struct papr_scm_priv {
>>  	u64 health_bitmap_inject_mask;
>>  
>>  	 /* array to have event_code and stat_id mappings */
>> -	char **nvdimm_events_map;
>> +	stat_id_t *nvdimm_events_map;
>>  };
>>  
>>  static int papr_scm_pmem_flush(struct nd_region *nd_region,
>> @@ -462,7 +464,7 @@ static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu
>>  {
>>  	struct papr_scm_perf_stat *stat;
>>  	struct papr_scm_perf_stats *stats;
>> -	int index, rc, count;
>> +	int index, rc = 0;
>>  	u32 available_events;
>>  
>>  	if (!p->stat_buffer_len)
>> @@ -478,35 +480,29 @@ static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu
>>  		return rc;
>>  	}
>>  
>> -	/* Allocate memory to nvdimm_event_map */
>> -	p->nvdimm_events_map = kcalloc(available_events, sizeof(char *), GFP_KERNEL);
>> -	if (!p->nvdimm_events_map) {
>> -		rc = -ENOMEM;
>> -		goto out_stats;
>> -	}
>> -
>>  	/* Called to get list of events supported */
>>  	rc = drc_pmem_query_stats(p, stats, 0);
>>  	if (rc)
>> -		goto out_nvdimm_events_map;
>> -
>> -	for (index = 0, stat = stats->scm_statistic, count = 0;
>> -		     index < available_events; index++, ++stat) {
>> -		p->nvdimm_events_map[count] = kmemdup_nul(stat->stat_id, 8, GFP_KERNEL);
>> -		if (!p->nvdimm_events_map[count]) {
>> -			rc = -ENOMEM;
>> -			goto out_nvdimm_events_map;
>> -		}
>> +		goto out;
>>  
>> -		count++;
>> +	/*
>> +	 * Allocate memory and populate nvdimm_event_map.
>> +	 * Allocate an extra element for NULL entry
>> +	 */
>> +	p->nvdimm_events_map = kcalloc(available_events + 1,
>> +				       sizeof(stat_id_t), GFP_KERNEL);
>> +	if (!p->nvdimm_events_map) {
>> +		rc = -ENOMEM;
>> +		goto out;
>>  	}
>> -	p->nvdimm_events_map[count] = NULL;
>> -	kfree(stats);
>> -	return 0;
>>  
>> -out_nvdimm_events_map:
>> -	kfree(p->nvdimm_events_map);
>> -out_stats:
>> +	/* Copy all stat_ids to event map */
>> +	for (index = 0, stat = stats->scm_statistic;
>> +	     index < available_events; index++, ++stat) {
>> +		memcpy(&p->nvdimm_events_map[index], &stat->stat_id,
>> +		       sizeof(stat_id_t));
>> +	}
>> +out:
>>  	kfree(stats);
>>  	return rc;
>>  }
>>
>> base-commit: 348c71344111d7a48892e3e52264ff11956fc196
>> -- 
>> 2.35.1
>

-- 
Cheers
~ Vaibhav
