Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6142DFA39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 10:03:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cztmd5gkxzDqPT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 20:03:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rsQxQ+33; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cztl83DQjzDqJt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 20:02:11 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BL8X7oF013580; Mon, 21 Dec 2020 04:02:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rE0vPDPkWMF5dacpB7v3/fJI0JGj3NNRua9+vuUVgKs=;
 b=rsQxQ+33PnC7ikF4jGZ1zSTi2730GP3omz5eNMT/sk1ClD7v51KUAm6TDLIgFWmz3Dwi
 k+gycEPGUmxzira4t3eSGGdqv4PZ2X/hs6oi3yk/wDndofcQ3At/VuYbuBIo4a9SCafe
 3O2sXvWyI2NpakKqsfrmSwE7a1S0eM3dqhkMXgGV2wnX1xVcjkZsLMsmSt2Bh0FELGhO
 wna+f8U8hWIfcaZ8D+Zq1wLCY2FgGTcNJarzlmaG/FU00f8QD5Uzfaw7NOTkIlSOxnGq
 Bf99IXYz1rdepBdW3vnVxVl2rcQYjRVyOfCMnoZ87mnVAa6WvCafk3qp6hxKQPRtMw0+ Aw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35jr888rn5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 04:02:05 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BL8wfWN010772;
 Mon, 21 Dec 2020 09:02:04 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 35h9591nac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 09:02:04 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BL923E522151550
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Dec 2020 09:02:03 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8973112062;
 Mon, 21 Dec 2020 09:02:03 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E71D3112065;
 Mon, 21 Dec 2020 09:02:01 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.112.191])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 21 Dec 2020 09:02:01 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/perf/hv-24x7: Dont create sysfs event files
 for dummy events
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20201218100100.1166111-1-kjain@linux.ibm.com>
 <87im8vyawb.fsf@mpe.ellerman.id.au>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <ab67fde4-7908-d046-390a-3181e80bdf0a@linux.ibm.com>
Date: Mon, 21 Dec 2020 14:32:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87im8vyawb.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-21_02:2020-12-19,
 2020-12-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012210061
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



On 12/21/20 11:10 AM, Michael Ellerman wrote:
> Kajol Jain <kjain@linux.ibm.com> writes:
>> hv_24x7 performance monitoring unit creates list of supported events
>> from the event catalog obtained via HCALL. hv_24x7 catalog could also
>> contain invalid or dummy events (with names like FREE_* or CPM_FREE_*
>> and RESERVED*). These events do not have any hardware counters
>> backing them. So patch adds a check to string compare the event names
>> to filter out them.
>>
>> Result in power9 machine:
>>
>> Before this patch:
>> .....
>>   hv_24x7/PM_XLINK2_OUT_ODD_CYC,chip=?/              [Kernel PMU event]
>>   hv_24x7/PM_XLINK2_OUT_ODD_DATA_COUNT,chip=?/       [Kernel PMU event]
>>   hv_24x7/PM_XLINK2_OUT_ODD_TOTAL_UTIL,chip=?/       [Kernel PMU event]
>>   hv_24x7/PM_XTS_ATR_DEMAND_CHECKOUT,chip=?/         [Kernel PMU event]
>>   hv_24x7/PM_XTS_ATR_DEMAND_CHECKOUT_MISS,chip=?/    [Kernel PMU event]
>>   hv_24x7/PM_XTS_ATSD_SENT,chip=?/                   [Kernel PMU event]
>>   hv_24x7/PM_XTS_ATSD_TLBI_RCV,chip=?/               [Kernel PMU event]
>>   hv_24x7/RESERVED_NEST1,chip=?/                     [Kernel PMU event]
>>   hv_24x7/RESERVED_NEST10,chip=?/                    [Kernel PMU event]
>>   hv_24x7/RESERVED_NEST11,chip=?/                    [Kernel PMU event]
>>   hv_24x7/RESERVED_NEST12,chip=?/                    [Kernel PMU event]
>>   hv_24x7/RESERVED_NEST13,chip=?/                    [Kernel PMU event]
>> ......
>>
>> Dmesg:
>> [    0.000362] printk: console [hvc0] enabled
>> [    0.815452] hv-24x7: read 1530 catalog entries, created 537 event attrs
>> (0 failures), 275 descs
>>
>> After this patch:
>> ......
>>   hv_24x7/PM_XLINK2_OUT_ODD_AVLBL_CYC,chip=?/        [Kernel PMU event]
>>   hv_24x7/PM_XLINK2_OUT_ODD_CYC,chip=?/              [Kernel PMU event]
>>   hv_24x7/PM_XLINK2_OUT_ODD_DATA_COUNT,chip=?/       [Kernel PMU event]
>>   hv_24x7/PM_XLINK2_OUT_ODD_TOTAL_UTIL,chip=?/       [Kernel PMU event]
>>   hv_24x7/PM_XTS_ATR_DEMAND_CHECKOUT,chip=?/         [Kernel PMU event]
>>   hv_24x7/PM_XTS_ATR_DEMAND_CHECKOUT_MISS,chip=?/    [Kernel PMU event]
>>   hv_24x7/PM_XTS_ATSD_SENT,chip=?/                   [Kernel PMU event]
>>   hv_24x7/PM_XTS_ATSD_TLBI_RCV,chip=?/               [Kernel PMU event]
>>   hv_24x7/TOD,chip=?/                                [Kernel PMU event]
>> ......
>>
>> Demsg:
>> [    0.000357] printk: console [hvc0] enabled
>> [    0.808592] hv-24x7: read 1530 catalog entries, created 509 event attrs
>> (0 failures), 275 descs
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  arch/powerpc/perf/hv-24x7.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> ---
>> Changelog
>> v1 -> v2
>> - Include "RESERVED*" as part of the invalid event check as
>>   suggested by Madhavan Srinivasan
>> - Add new helper function "ignore_event" to check invalid/dummy
>>   events as suggested by Michael Ellerman
>> - Remove pr_info to print each invalid event as suggested by
>>   Michael Ellerman
>> ---
>> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
>> index 6e7e820508df..1a6004d88f98 100644
>> --- a/arch/powerpc/perf/hv-24x7.c
>> +++ b/arch/powerpc/perf/hv-24x7.c
>> @@ -764,6 +764,16 @@ static ssize_t catalog_event_len_validate(struct hv_24x7_event_data *event,
>>  	return ev_len;
>>  }
>>  
>> +/*
>> + * Return true incase of invalid or dummy events with names like FREE_* or CPM_FREE_*
>> + * and RESERVED*
>> + */
>> +static bool ignore_event(const char *name)
>> +{
>> +	return (strstr(name, "FREE_") || !strncmp(name, "RESERVED", 8)) ?
>> +			true : false;
> 
> That's FREE_ anywhere in the string, which seems a bit loose.
> 
> Do we have any documentation or anything that tells us that any event
> with "FREE_" in the name will always be invalid?

Hi Michael,
      We don't have any such document which says any event with "FREE_"
in the name will be invalid. So I will replace strstr check with strcmp
to look for events with names have "FREE" or "CPM_FREE" at start.

Thanks,
Kajol Jain

> 
> cheers
> 
