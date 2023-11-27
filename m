Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3317F9F37
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 13:03:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ep4482iO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sf43g1plyz3ckk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 23:03:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ep4482iO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sf42l3dMGz3cJN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 23:02:22 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ARBk3o2013180;
	Mon, 27 Nov 2023 12:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qUzFEhPn70J4CgXFRu3istZbtk83B+/MorkvH5PO9iE=;
 b=ep4482iOSu/wW8Yc8PUQNwqTBXyX6VopuoCBS+/QmYMS03zYUZCFYdgVvEdxZZ6yaLkC
 wn8LTN7CohQQX8pPIyqee90rODi0JA7s5tvrcoTOKa7e2AU5wRLT39QlrJRLAaIAZNb5
 W2eqrpF4rgOFLkBdosrMF5GUp+KmvkpFdN7nlYEVfyXPBZ6Rfu4jlPaDTRk8usPKc3Kt
 0gs4Hr30YTmI6aVcG1VLJL60yuEjMqRfsIe8Opg98S3eM2hc+gvhxnv5htFzhw6K4/RZ
 STtK2j1Bw63PPgGWFotawimkzAoAMwz18GrTPGoCeUbz7faaKmuQzGMUcr3xGdPChO2l Pw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ukrbbb0p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 12:02:09 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ARBkDBP013994;
	Mon, 27 Nov 2023 12:02:08 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ukrbbb0nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 12:02:08 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3ARBYZ6m011082;
	Mon, 27 Nov 2023 12:02:07 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ukwy1fy4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 12:02:07 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3ARC24Fg11207240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Nov 2023 12:02:04 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACFAC20040;
	Mon, 27 Nov 2023 12:02:04 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB2BC2004E;
	Mon, 27 Nov 2023 12:02:01 +0000 (GMT)
Received: from [9.43.15.114] (unknown [9.43.15.114])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Nov 2023 12:02:01 +0000 (GMT)
Message-ID: <92bbba90-c7e4-43de-98dc-497ca323eacc@linux.ibm.com>
Date: Mon, 27 Nov 2023 17:32:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf vendor events: Update datasource event name to fix
 duplicate events
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
        james.clark@arm.com, namhyung@kernel.org
References: <20231123160110.94090-1-atrajeev@linux.vnet.ibm.com>
Content-Language: en-GB
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <20231123160110.94090-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YHE9b4sl5yw4eRmBBROA7V3jaGLBxAeP
X-Proofpoint-GUID: 5oIl70ZNfC0Xf7RIKW0POau_wkqXS47f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_09,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1011 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311270082
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
Cc: linux-perf-users@vger.kernel.org, kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/11/23 9:31 pm, Athira Rajeev wrote:

> Running "perf list" on powerpc fails with segfault
> as below:
>
>     ./perf list
>     Segmentation fault (core dumped)
>
> This happens because of duplicate events in the json list.
> The powerpc Json event list contains some event with same
> event name, but different event code. They are:
> - PM_INST_FROM_L3MISS (Present in datasource and frontend)
> - PM_MRK_DATA_FROM_L2MISS (Present in datasource and marked)
> - PM_MRK_INST_FROM_L3MISS (Present in datasource and marked)
> - PM_MRK_DATA_FROM_L3MISS (Present in datasource and marked)
>
> pmu_events_table__num_events uses the value from
> table_pmu->num_entries which includes duplicate events as
> well. This causes issue during "perf list" and results in
> segmentation fault.
>
> Since both event codes are valid, append _DSRC to the Data
> Source events (datasource.json), so that they would have a
> unique name. Also add PM_DATA_FROM_L2MISS_DSRC and
> PM_DATA_FROM_L3MISS_DSRC events. With the fix, perf list
> works as expected.
>
> Fixes: fc1435807533 ("perf vendor events power10: Update JSON/events")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

I have tested the patch on Power10 machine. Perf list works correctly without any segfault now.

	# ./perf list

	List of pre-defined events (to be used in -e or -M):

	  branch-instructions OR branches                    [Hardware event]
	  branch-misses                                      [Hardware event]

Tested-by: Disha Goel <disgoel@linux.ibm.com>

> ---
>   .../arch/powerpc/power10/datasource.json       | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
> index 6b0356f2d301..0eeaaf1a95b8 100644
> --- a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
> +++ b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
> @@ -99,6 +99,11 @@
>       "EventName": "PM_INST_FROM_L2MISS",
>       "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L2 due to a demand miss."
>     },
> +  {
> +    "EventCode": "0x0003C0000000C040",
> +    "EventName": "PM_DATA_FROM_L2MISS_DSRC",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss."
> +  },
>     {
>       "EventCode": "0x000380000010C040",
>       "EventName": "PM_INST_FROM_L2MISS_ALL",
> @@ -161,9 +166,14 @@
>     },
>     {
>       "EventCode": "0x000780000000C040",
> -    "EventName": "PM_INST_FROM_L3MISS",
> +    "EventName": "PM_INST_FROM_L3MISS_DSRC",
>       "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss."
>     },
> +  {
> +    "EventCode": "0x0007C0000000C040",
> +    "EventName": "PM_DATA_FROM_L3MISS_DSRC",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss."
> +  },
>     {
>       "EventCode": "0x000780000010C040",
>       "EventName": "PM_INST_FROM_L3MISS_ALL",
> @@ -981,7 +991,7 @@
>     },
>     {
>       "EventCode": "0x0003C0000000C142",
> -    "EventName": "PM_MRK_DATA_FROM_L2MISS",
> +    "EventName": "PM_MRK_DATA_FROM_L2MISS_DSRC",
>       "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss for a marked instruction."
>     },
>     {
> @@ -1046,12 +1056,12 @@
>     },
>     {
>       "EventCode": "0x000780000000C142",
> -    "EventName": "PM_MRK_INST_FROM_L3MISS",
> +    "EventName": "PM_MRK_INST_FROM_L3MISS_DSRC",
>       "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss for a marked instruction."
>     },
>     {
>       "EventCode": "0x0007C0000000C142",
> -    "EventName": "PM_MRK_DATA_FROM_L3MISS",
> +    "EventName": "PM_MRK_DATA_FROM_L3MISS_DSRC",
>       "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss for a marked instruction."
>     },
>     {
