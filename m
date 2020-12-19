Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A41F2DEE3E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 11:52:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyjGw3FwjzDqWh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 21:52:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=A3x7+KVh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyjFK63D2zDqN7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 21:50:45 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BJAW3aV005996; Sat, 19 Dec 2020 05:50:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=UweZRzUrCdU8YtD9hqCM/LoJx2paCcs8PdwtAXJM6wM=;
 b=A3x7+KVhnIfEchfZ/2qJQ31dtpKsVEUqYPqwTHQD7OqkRZMhIneVliaJTS0IOh9AwqNr
 XKb3y+dqVnna0deM3iN6ZL/ho6abYIv4wBzkCoE3A72AKUHu5nUSyl6LuofJe3pmq9vT
 543TzEA/oa2Ffs3iyiuEMztCA7d2KUxAnz2fhJwxRn4+o5qv2YylmJsj9daUmlPOxxg6
 4LgDRxC4iFJoznYxAJGaLMg1pTliu6Xo0Y7OcWyW3HleVdBux6BNpgEpLoCsTFDEu43f
 Hr+5IYS+XV0IxSLwrQuGqtTYR/AIas244oEyTQdGDB3QyWQ3MBNDYS5kYus8tCd7hnx6 zg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35he32j2mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Dec 2020 05:50:36 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BJAnwQr019794;
 Sat, 19 Dec 2020 10:50:34 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 35h958846a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Dec 2020 10:50:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BJAoWtj26083740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Dec 2020 10:50:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F092DAE051;
 Sat, 19 Dec 2020 10:50:31 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0589AE053;
 Sat, 19 Dec 2020 10:50:29 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.199.44.125])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 19 Dec 2020 10:50:29 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/perf/hv-24x7: Dont create sysfs event files
 for dummy events
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
References: <20201218100100.1166111-1-kjain@linux.ibm.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <8fa7e71e-b392-ab3c-e2db-d14395449553@linux.ibm.com>
Date: Sat, 19 Dec 2020 16:20:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201218100100.1166111-1-kjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-19_03:2020-12-19,
 2020-12-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012190072
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


On 12/18/20 3:31 PM, Kajol Jain wrote:
> hv_24x7 performance monitoring unit creates list of supported events
> from the event catalog obtained via HCALL. hv_24x7 catalog could also
> contain invalid or dummy events (with names like FREE_* or CPM_FREE_*
> and RESERVED*). These events do not have any hardware counters
> backing them. So patch adds a check to string compare the event names
> to filter out them.
>
> Result in power9 machine:
>
> Before this patch:
> .....
>    hv_24x7/PM_XLINK2_OUT_ODD_CYC,chip=?/              [Kernel PMU event]
>    hv_24x7/PM_XLINK2_OUT_ODD_DATA_COUNT,chip=?/       [Kernel PMU event]
>    hv_24x7/PM_XLINK2_OUT_ODD_TOTAL_UTIL,chip=?/       [Kernel PMU event]
>    hv_24x7/PM_XTS_ATR_DEMAND_CHECKOUT,chip=?/         [Kernel PMU event]
>    hv_24x7/PM_XTS_ATR_DEMAND_CHECKOUT_MISS,chip=?/    [Kernel PMU event]
>    hv_24x7/PM_XTS_ATSD_SENT,chip=?/                   [Kernel PMU event]
>    hv_24x7/PM_XTS_ATSD_TLBI_RCV,chip=?/               [Kernel PMU event]
>    hv_24x7/RESERVED_NEST1,chip=?/                     [Kernel PMU event]
>    hv_24x7/RESERVED_NEST10,chip=?/                    [Kernel PMU event]
>    hv_24x7/RESERVED_NEST11,chip=?/                    [Kernel PMU event]
>    hv_24x7/RESERVED_NEST12,chip=?/                    [Kernel PMU event]
>    hv_24x7/RESERVED_NEST13,chip=?/                    [Kernel PMU event]
> ......
>
> Dmesg:
> [    0.000362] printk: console [hvc0] enabled
> [    0.815452] hv-24x7: read 1530 catalog entries, created 537 event attrs
> (0 failures), 275 descs
>
> After this patch:
> ......
>    hv_24x7/PM_XLINK2_OUT_ODD_AVLBL_CYC,chip=?/        [Kernel PMU event]
>    hv_24x7/PM_XLINK2_OUT_ODD_CYC,chip=?/              [Kernel PMU event]
>    hv_24x7/PM_XLINK2_OUT_ODD_DATA_COUNT,chip=?/       [Kernel PMU event]
>    hv_24x7/PM_XLINK2_OUT_ODD_TOTAL_UTIL,chip=?/       [Kernel PMU event]
>    hv_24x7/PM_XTS_ATR_DEMAND_CHECKOUT,chip=?/         [Kernel PMU event]
>    hv_24x7/PM_XTS_ATR_DEMAND_CHECKOUT_MISS,chip=?/    [Kernel PMU event]
>    hv_24x7/PM_XTS_ATSD_SENT,chip=?/                   [Kernel PMU event]
>    hv_24x7/PM_XTS_ATSD_TLBI_RCV,chip=?/               [Kernel PMU event]
>    hv_24x7/TOD,chip=?/                                [Kernel PMU event]
> ......
>
> Demsg:
> [    0.000357] printk: console [hvc0] enabled
> [    0.808592] hv-24x7: read 1530 catalog entries, created 509 event attrs
> (0 failures), 275 descs

Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>


>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>   arch/powerpc/perf/hv-24x7.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> ---
> Changelog
> v1 -> v2
> - Include "RESERVED*" as part of the invalid event check as
>    suggested by Madhavan Srinivasan
> - Add new helper function "ignore_event" to check invalid/dummy
>    events as suggested by Michael Ellerman
> - Remove pr_info to print each invalid event as suggested by
>    Michael Ellerman
> ---
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index 6e7e820508df..1a6004d88f98 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -764,6 +764,16 @@ static ssize_t catalog_event_len_validate(struct hv_24x7_event_data *event,
>   	return ev_len;
>   }
>
> +/*
> + * Return true incase of invalid or dummy events with names like FREE_* or CPM_FREE_*
> + * and RESERVED*
> + */
> +static bool ignore_event(const char *name)
> +{
> +	return (strstr(name, "FREE_") || !strncmp(name, "RESERVED", 8)) ?
> +			true : false;
> +}
> +
>   #define MAX_4K (SIZE_MAX / 4096)
>
>   static int create_events_from_catalog(struct attribute ***events_,
> @@ -894,6 +904,10 @@ static int create_events_from_catalog(struct attribute ***events_,
>
>   		name = event_name(event, &nl);
>
> +		if (ignore_event(name)) {
> +			junk_events++;
> +			continue;
> +		}
>   		if (event->event_group_record_len == 0) {
>   			pr_devel("invalid event %zu (%.*s): group_record_len == 0, skipping\n",
>   					event_idx, nl, name);
> @@ -955,6 +969,9 @@ static int create_events_from_catalog(struct attribute ***events_,
>   			continue;
>
>   		name  = event_name(event, &nl);
> +		if (ignore_event(name))
> +			continue;
> +
>   		nonce = event_uniq_add(&ev_uniq, name, nl, event->domain);
>   		ct    = event_data_to_attrs(event_idx, events + event_attr_ct,
>   					    event, nonce);
