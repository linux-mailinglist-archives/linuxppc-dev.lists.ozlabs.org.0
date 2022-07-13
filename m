Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 001D1572DDC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 08:04:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjRsC5j87z3cBt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 16:04:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ar6oUmN6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ar6oUmN6;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjRrS5GPWz2ywc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jul 2022 16:03:36 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26D4ap9d020596;
	Wed, 13 Jul 2022 06:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=M2J4hNtr6Jsul4mlKamSAWYoWrN7DMI187VyXpVQvsM=;
 b=Ar6oUmN6tQNULLSkOVfIGsp3Bes1WRszjKkt/gPrD/tLNl1htSglptPx2Y1FbYGmJuq4
 HIX7THL5F8M2fb7om9lyqOYdthoDO/W9nSBTb6gUf7KDlKBGCpHo9Odae3NNhU8Kd/90
 9+Lb6vq0Jxxyt++8YfdmqlAhtXxKV1cJbu81B6dgx6BcZ5DVRID+QkodKj3elqSJ5uY1
 QIH23lresDcCi1ocgFrOqqqhEqOy0se3qdbshoxf0Yr7Ob3dr9ecfFWkL2fNFY99yZsQ
 gGbmsoJSAKUmHV1aHRDMx65t/cy8uNsOnt74yEVH7xGwKIreLdGH7jFokAKaHYh1NkP8 yQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9pxs9prj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 06:03:00 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26D5Zj1g014811;
	Wed, 13 Jul 2022 06:02:58 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 3h8rrn23gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 06:02:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26D62sx625297338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Jul 2022 06:02:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3C2FAE04D;
	Wed, 13 Jul 2022 06:02:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3553AAE045;
	Wed, 13 Jul 2022 06:02:52 +0000 (GMT)
Received: from [9.43.78.240] (unknown [9.43.78.240])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 13 Jul 2022 06:02:51 +0000 (GMT)
Message-ID: <4bbad947-89d2-934d-1030-2c1eef064aaa@linux.ibm.com>
Date: Wed, 13 Jul 2022 11:32:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] powerpc/papr_scm: Fix nvdimm event mappings
Content-Language: en-US
To: Vaibhav Jain <vaibhav@linux.ibm.com>, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org
References: <20220711034605.212683-1-kjain@linux.ibm.com>
 <87czeac3no.fsf@vajain21.in.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <87czeac3no.fsf@vajain21.in.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CnrDm1tXiM9liGVWPP3cCKaG5baHQhSI
X-Proofpoint-ORIG-GUID: CnrDm1tXiM9liGVWPP3cCKaG5baHQhSI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_14,2022-07-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207130024
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
Cc: nvdimm@lists.linux.dev, atrajeev@linux.vnet.ibm.com, rnsastry@linux.ibm.com, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, maddy@linux.ibm.com, dan.j.williams@intel.com, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/12/22 10:45, Vaibhav Jain wrote:
> Hi Kajol,
> 
> Thanks for the patch. Minor review comment below:
> 
> Kajol Jain <kjain@linux.ibm.com> writes:
> 
>> Commit 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
>> added performance monitoring support for papr-scm nvdimm devices via
>> perf interface. Commit also added an array in papr_scm_priv
>> structure called "nvdimm_events_map", which got filled based on the
>> result of H_SCM_PERFORMANCE_STATS hcall. 
>>
>> Currently there is an assumption that the order of events in the
>> stats buffer, returned by the hypervisor is same. And that order also
>> matches with the events specified in nvdimm driver code. 
>> But this assumption is not documented anywhere in Power Architecture
>> Platform Requirements (PAPR) document. Although the order
>> of events happens to be same on current systems, but it might
>> not be true in future generation systems. Fix the issue, by
>> adding a static mapping for nvdimm events to corresponding stat-id,
>> and removing the dynamic map from papr_scm_priv structure.
>>
>> Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
>> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> 
> <snip>
>> @@ -460,10 +480,9 @@ static void papr_scm_pmu_del(struct perf_event *event, int flags)
>>  
>>  static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu *nd_pmu)
>>  {
>> -	struct papr_scm_perf_stat *stat;
>>  	struct papr_scm_perf_stats *stats;
>>  	u32 available_events;
>> -	int index, rc = 0;
>> +	int rc;
>>  
>>  	if (!p->stat_buffer_len)
>>  		return -ENOENT;
>> @@ -476,34 +495,12 @@ static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu
>>  	/* Allocate the buffer for phyp where stats are written */
>>  	stats = kzalloc(p->stat_buffer_len, GFP_KERNEL);
>>  	if (!stats) {
>> -		rc = -ENOMEM;
>> -		return rc;
>> +		return -ENOMEM;
>>  	}
>>  
>>  	/* Called to get list of events supported */
>>  	rc = drc_pmem_query_stats(p, stats, 0);
>> -	if (rc)
>> -		goto out;
>> -
>> -	/*
>> -	 * Allocate memory and populate nvdimm_event_map.
>> -	 * Allocate an extra element for NULL entry
>> -	 */
>> -	p->nvdimm_events_map = kcalloc(available_events + 1,
>> -				       sizeof(stat->stat_id),
>> -				       GFP_KERNEL);
>> -	if (!p->nvdimm_events_map) {
>> -		rc = -ENOMEM;
>> -		goto out;
>> -	}
>>  
>> -	/* Copy all stat_ids to event map */
>> -	for (index = 0, stat = stats->scm_statistic;
>> -	     index < available_events; index++, ++stat) {
>> -		memcpy(&p->nvdimm_events_map[index * sizeof(stat->stat_id)],
>> -		       &stat->stat_id, sizeof(stat->stat_id));
>> -	}
>> -out:
>>  	kfree(stats);
>>  	return rc;
>>  }
> 
> Earlier implementation of papr_scm_pmu_check_events() would copy the
> contents of returned stat-ids to struct papr_scm_priv->nvdimm_events_map,
> hence it was needed.
> 
> With static events map you dont really need to call
> drc_pmem_query_stats() as that would have been already being done once
> in papr_scm_probe() before papr_scm_pmu_register() is called:
> 
> 

Hi Vaibhav,
    Thanks for reviewing the patch. Yes it make sense, as mainly we want
to make sure, in case stat buffer is empty we will not register the
nvdimm pmu. I will do the change and send next version of the patch.

Thanks,
Kajol Jain

> papr_scm_probe()
> {
> ...
> 	/* Try retrieving the stat buffer and see if its supported */
> 	stat_size = drc_pmem_query_stats(p, NULL, 0);
> ...
>         papr_scm_pmu_register(p);
> ...
> }
> 
> I would suggest replacing single callsite of papr_scm_pmu_check_events()
> with the check
> 
>      if (!p->stat_buffer_len)
> 		goto pmu_check_events_err;
> 
> <snip>
> 
