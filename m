Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B832DD0E5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 12:55:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxVmj4nDYzDqSc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 22:55:17 +1100 (AEDT)
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
 header.s=pp1 header.b=Fmtohgyy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxVhn4W0PzDqSV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 22:51:53 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BHBjQ7l125704; Thu, 17 Dec 2020 06:51:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=cvtm6FX4VHrplF9ir2Wzl32WezE0vM4Caw+obCXJ/uw=;
 b=Fmtohgyy00ch4kvlkdukD2MHRGKrdPTStnbKc3Eu4O36SmKhsCQdtAXl/Y1cGLrLXbiD
 VadnLLsAUGJv+VWXLbwy8ifOwQ1Jci30ywFps4XGU8hr0okv4WaABus63yOxYaOvurNS
 C3s8CZua5AdEouimOw1r2k0iXHcdZZRBvchBN9BlqnYTc4oj5L+A8uivwBHFTn4W4iJm
 DbRpqAV6+tgxOv5nne318LB6YTYNxCvrE9HYxolk0iEvzbt4GVjW0HSUKzkVL5uDDlOv
 5oLDYXMgDkJKya7zwbplJ3NiL31RCX20/D17BKj3rPHuC3T6PtNp9ue+8Z802KOkJgu7 qg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35g6r4r4wy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 06:51:48 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BHBkuwS024190;
 Thu, 17 Dec 2020 11:51:47 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 35d526bams-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 11:51:47 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BHBpkGM10092844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 11:51:46 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FF116E052;
 Thu, 17 Dec 2020 11:51:46 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEB4F6E04E;
 Thu, 17 Dec 2020 11:51:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.39.68])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 17 Dec 2020 11:51:41 +0000 (GMT)
Subject: Re: [PATCH] powerpc/perf/hv-24x7: Dont create sysfs event files for
 dummy events
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
References: <20201217113230.1069882-1-kjain@linux.ibm.com>
 <d61d619b-3557-f4ff-a363-3a8f12b3a9ed@linux.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <53011290-3519-5912-1486-f0accff5244e@linux.ibm.com>
Date: Thu, 17 Dec 2020 17:21:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d61d619b-3557-f4ff-a363-3a8f12b3a9ed@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-17_07:2020-12-15,
 2020-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012170080
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



On 12/17/20 5:10 PM, Madhavan Srinivasan wrote:
> 
> On 12/17/20 5:02 PM, Kajol Jain wrote:
>> hv_24x7 performance monitoring unit creates list of supported events
>> from the event catalog obtained via HCALL. hv_24x7 catalog could also
>> contain invalid or dummy events (with names like FREE_  or CPM_FREE_ so
> 
> 
> Can you also include " RESERVED_NEST*" as part of the check.

Hi Maddy,
   Sure, I will add this check.

Thanks,
Kajol Jain

> 
> # ls /sys/devices/hv_24x7/events | grep RESERVED
> RESERVED_NEST1
> RESERVED_NEST10
> RESERVED_NEST11
> RESERVED_NEST12
> ...
>
> 
> Maddy
> 
> 
>> on). These events does not have any hardware counters backing them.
>> So patch adds a check to string compare the event names to filter
>> out them.
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>   arch/powerpc/perf/hv-24x7.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
>> index 6e7e820508df..c3252d8a7818 100644
>> --- a/arch/powerpc/perf/hv-24x7.c
>> +++ b/arch/powerpc/perf/hv-24x7.c
>> @@ -894,6 +894,11 @@ static int create_events_from_catalog(struct attribute ***events_,
>>
>>           name = event_name(event, &nl);
>>
>> +        if (strstr(name, "FREE_")) {
>> +            pr_info("invalid event %zu (%.*s)\n", event_idx, nl, name);
>> +            junk_events++;
>> +            continue;
>> +        }
>>           if (event->event_group_record_len == 0) {
>>               pr_devel("invalid event %zu (%.*s): group_record_len == 0, skipping\n",
>>                       event_idx, nl, name);
>> @@ -955,6 +960,9 @@ static int create_events_from_catalog(struct attribute ***events_,
>>               continue;
>>
>>           name  = event_name(event, &nl);
>> +        if (strstr(name, "FREE_"))
>> +            continue;
>> +
>>           nonce = event_uniq_add(&ev_uniq, name, nl, event->domain);
>>           ct    = event_data_to_attrs(event_idx, events + event_attr_ct,
>>                           event, nonce);
