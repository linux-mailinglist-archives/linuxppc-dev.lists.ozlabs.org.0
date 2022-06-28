Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 530B755BE96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 08:06:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXDc42PGsz3cgJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 16:05:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SE7XVZ+b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SE7XVZ+b;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXDbK69Mmz3bmY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 16:05:17 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25S42J4p025426;
	Tue, 28 Jun 2022 06:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=btd8R9oRMPb9pJvSLJyk+oQpLfazHe8IJbIKxcZp1PY=;
 b=SE7XVZ+bKcs1F3bw9mwUKO2I1ZPm1F79vAXNuSKtjmn8iOQvlgH0BKIDx90KgAczbD5U
 7e822Klh3Dpfq/Sm33KyISg59RM8Cz7t+kt70tVNJmHAeo5qgfNBiaSb3Ljy0ZKHbEIZ
 YMYBCzLHicCwAFI1fP/zIVcUS2Tt9HlnYLIKvgNpIh5k24kNmD4RBi+pjkQwk6k4kELY
 4rqZtVNwsShy4Vrxy6ERYxq+KMwd3+Y0OWKJXX/qJlrIVL4peqmxSuF8zyDyM/bIkIV6
 JGAVHmdAxep0wKwJQ6qfuGb5jpgXKLk2Cj+6cdcx01DunAmfKXHFoi3s6OpoYO1y9tUt Fg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gyt92jt1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 06:05:00 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25S5q3au026558;
	Tue, 28 Jun 2022 06:04:58 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma01fra.de.ibm.com with ESMTP id 3gwt08u6r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 06:04:58 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25S652Ma24248824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jun 2022 06:05:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26FFA5204E;
	Tue, 28 Jun 2022 06:04:55 +0000 (GMT)
Received: from [9.43.16.94] (unknown [9.43.16.94])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6F25752051;
	Tue, 28 Jun 2022 06:04:52 +0000 (GMT)
Message-ID: <13aff5a0-fb64-8393-7800-d65cbfbc3125@linux.ibm.com>
Date: Tue, 28 Jun 2022 11:34:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] powerpc/papr_scm: Fix nvdimm event mappings
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
        vaibhav@linux.ibm.com
References: <20220610133431.410514-1-kjain@linux.ibm.com>
 <87ilom4nr6.fsf@mpe.ellerman.id.au>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <87ilom4nr6.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OQS9dtU7tKEi8L7xWLk6Lx6sLHRB076Q
X-Proofpoint-GUID: OQS9dtU7tKEi8L7xWLk6Lx6sLHRB076Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_09,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206280025
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



On 6/27/22 12:05, Michael Ellerman wrote:
> Hi Kajol,
> 
> A few comments below ...

Hi Michael,
   Thanks for reviewing the patch. I will make the changes suggested by
you and send version 2 of this patch.

Thanks,
Kajol Jain
> 
> Kajol Jain <kjain@linux.ibm.com> writes:
>> Commit 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
>> adds performance monitoring support for papr-scm nvdimm devices via
>   ^ 
> We're talking about a commit that's already happened so we should use
> past tense, so "added".
> 
>> perf interface. It also adds one array in papr_scm_priv
>                          "added" 
>> structure called "nvdimm_events_map", to dynamically save the stat_id
>> for events specified in nvdimm driver code "nd_perf.c".
>>
>> Right now the mapping is done based on the result of 
>> H_SCM_PERFORMANCE_STATS hcall, when all the stats are
>> requested. Currently there is an assumption, that a
>> certain stat will always be found at a specific offset
>> in the stat buffer.
>                     ^
>                     "returned by the hypervisor."
> 
> To make it clear where the stat buffer comes from, and that it's out of
> our control.
> 
>> The assumption may not be true or documented as part of PAPR
>> documentation.
> 
> That reads as the assumption "may not be documented as part of PAPR". I
> think what you mean is the assumption *is not* documented by PAPR, and
> although it happens to be true on current systems it may not be true in
> future.
> 
>> Fixing it, by adding a static mapping for nvdimm events to
>   Fix  it
>> corresponding stat-id, and removing the map from
>> papr_scm_priv structure.
>>
>> Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
>> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/papr_scm.c | 59 ++++++++++-------------
>>  1 file changed, 25 insertions(+), 34 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index 181b855b3050..5434c654a797 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -350,6 +347,26 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
>>  #ifdef CONFIG_PERF_EVENTS
>>  #define to_nvdimm_pmu(_pmu)	container_of(_pmu, struct nvdimm_pmu, pmu)
>>
>> +static const char * const nvdimm_events_map[] = {
>> +	"N/A",
>> +	"CtlResCt",
>> +	"CtlResTm",
>> +	"PonSecs ",
>> +	"MemLife ",
>> +	"CritRscU",
>> +	"HostLCnt",
>> +	"HostSCnt",
>> +	"HostSDur",
>> +	"HostLDur",
>> +	"MedRCnt ",
>> +	"MedWCnt ",
>> +	"MedRDur ",
>> +	"MedWDur ",
>> +	"CchRHCnt",
>> +	"CchWHCnt",
>> +	"FastWCnt",
>> +};
>   
> The order of the strings in that array becomes ABI. Because it defines
> the mapping from perf_event.attr.config (perf user ABI) to the actual
> event we request from the hypervisor.
> 
> So I'd like that made more explicit by using designated initialisers, eg:
> 
> static const char * const nvdimm_events_map[] = {
> 	[1] = "CtlResCt",
> 	[2] = "CtlResTm",
>         ...
> 
> That way an accidental reordering of the array won't break anything.

Yes make sense. Will do update it.
> 
> You shouldn't need to specify 0 either as it's not used.
> 
>> @@ -370,7 +387,7 @@ static int papr_scm_pmu_get_value(struct perf_event *event, struct device *dev,
>>  
>>  	stat = &stats->scm_statistic[0];
>>  	memcpy(&stat->stat_id,
>> -	       &p->nvdimm_events_map[event->attr.config * sizeof(stat->stat_id)],
>> +	       nvdimm_events_map[event->attr.config],
>>  		sizeof(stat->stat_id));
> 
> It's not clear that this won't index off the end of the array.
> 
> There is a check in papr_scm_pmu_event_init(), but I'd probably be
> happier if we did an explicit check in here as well, eg:
> 
> 	if (event->attr.config >= ARRAY_SIZE(nvdimm_events_map))
> 		return -EINVAL;
> 
> 
>>  	stat->stat_val = 0;
>>  
>> @@ -460,10 +477,9 @@ static void papr_scm_pmu_del(struct perf_event *event, int flags)
>>  
>>  static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu *nd_pmu)
>>  {
>> -	struct papr_scm_perf_stat *stat;
>>  	struct papr_scm_perf_stats *stats;
>>  	u32 available_events;
>> -	int index, rc = 0;
>> +	int rc = 0;
> 
> You shouldn't need to initialise rc here. It's not used until the call
> to drc_pmem_query_stats() below.

Ok sure.

> 
>>  	available_events = (p->stat_buffer_len  - sizeof(struct papr_scm_perf_stats))
>>  			/ sizeof(struct papr_scm_perf_stat);
>> @@ -473,34 +489,12 @@ static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu
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
>>  
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
>> -
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
> cheers
