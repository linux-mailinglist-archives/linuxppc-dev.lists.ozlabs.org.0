Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E49A2DDF41
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 08:53:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cy1M16pSzzDqWy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 18:53:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qahQlHkJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cy1KQ4lFtzDqWt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 18:51:54 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BI7VhPr193626; Fri, 18 Dec 2020 02:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KfF9Unjnv7wYxVnd65HkfntXnDg0A15oGsKwxlu1lxE=;
 b=qahQlHkJwQ8QmlSbBHmZnX4iaX6Z2S44H7gODkVovVyQThMt/38nRixflgDeindpQOpl
 M55nnrDUuPwNxZING98bYgp1W4w1G0GMYt/QuQBVFQtWQrp9j+UlmXThJG/t6qyb1xst
 LGefZioWzrWm5AeQImKZoKWlc7ssCljWhDLgLfmol15sngh7kmSZ401ilyGD7n3FLfGH
 f9avw87n7MpfYpPVm6/JGxwXSs2Gl8KZcRv2jbUuWEciLZfb9FYkiT2JrteRLG37RgE0
 nMtIp5wt5c63gJqdzEtzsMYNdHgTvRrq05p4gaZHbA2QHnuS+KryEeTCgAZrEHhCuUby /w== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35gk3y70ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 02:51:45 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BI7h0Y4029048;
 Fri, 18 Dec 2020 07:51:44 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 35d526kcd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 07:51:44 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BI7ph0311534774
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 07:51:43 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30B247805F;
 Fri, 18 Dec 2020 07:51:43 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05F6E78060;
 Fri, 18 Dec 2020 07:51:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.77.198.66])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 18 Dec 2020 07:51:39 +0000 (GMT)
Subject: Re: [PATCH] powerpc/perf/hv-24x7: Dont create sysfs event files for
 dummy events
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20201217113230.1069882-1-kjain@linux.ibm.com>
 <87o8isx77u.fsf@mpe.ellerman.id.au>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <4f5e6642-3c0b-94e4-d213-e98368e03445@linux.ibm.com>
Date: Fri, 18 Dec 2020 13:21:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87o8isx77u.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-18_04:2020-12-17,
 2020-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012180050
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
Cc: suka@us.ibm.com, maddy@linux.vnet.ibm.com, atrajeev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/18/20 6:26 AM, Michael Ellerman wrote:
> Kajol Jain <kjain@linux.ibm.com> writes:
>> hv_24x7 performance monitoring unit creates list of supported events
>> from the event catalog obtained via HCALL. hv_24x7 catalog could also
>> contain invalid or dummy events (with names like FREE_  or CPM_FREE_ so
>> on). These events does not have any hardware counters backing them.
>> So patch adds a check to string compare the event names to filter
>> out them.
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  arch/powerpc/perf/hv-24x7.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
>> index 6e7e820508df..c3252d8a7818 100644
>> --- a/arch/powerpc/perf/hv-24x7.c
>> +++ b/arch/powerpc/perf/hv-24x7.c
>> @@ -894,6 +894,11 @@ static int create_events_from_catalog(struct attribute ***events_,
>>  
>>  		name = event_name(event, &nl);
>>  
>> +		if (strstr(name, "FREE_")) {
>> +			pr_info("invalid event %zu (%.*s)\n", event_idx, nl, name);
>> +			junk_events++;
>> +			continue;
> 
> I don't think we want a print for each event, just one at the end saying
> "Dropped %d invalid events" would be preferable I think.

Hi Michael,
  Sure I will remove prints for each event. Having one print for number of dropped
events may not be useful. So I will drop that too.

> 
> 
>> +		}
>>  		if (event->event_group_record_len == 0) {
>>  			pr_devel("invalid event %zu (%.*s): group_record_len == 0, skipping\n",
>>  					event_idx, nl, name);
>> @@ -955,6 +960,9 @@ static int create_events_from_catalog(struct attribute ***events_,
>>  			continue;
>>  
>>  		name  = event_name(event, &nl);
>> +		if (strstr(name, "FREE_"))
>> +			continue;
> 
> Would be nice if the string comparison was in a single place, ie. in a
> helper function.

Sure I will make that change.

Thanks,
Kajol Jain
> 
> cheers
> 
