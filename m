Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D45A0798601
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 12:42:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=So+mk+LM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rht3R5LM1z3cP3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 20:42:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=So+mk+LM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rht2V55zyz3c5m
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 20:41:38 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 388AcW3B003708;
	Fri, 8 Sep 2023 10:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ApeifBjZ6trTdTXU9tOM0OHO7yO9Xbqy7gA/uBE61YE=;
 b=So+mk+LM12KHbT1Yn36oWL55l1piULO9NubWySr4u8uo00CKi4NCkqRim/52xNiGRVaq
 vtnzWkLEpYu5xmT/8OlSUxNRgjJsQ452QXrm4XdKU83JONZIzHWAstvXFmyP6ukfFAjG
 kOsejxVNp9/bg4RM67JY/Qbep3Xt0UmSOXYf8ltflgxVmUO99QPrEEPbtE3/Ugc92M4u
 H6HCPEMS8Vv7lOg8ewQ9JWctJTwpnkmRnZrtMJ2UNbCqYnqdJQw7GpGTqBUAd7WFSjxp
 AzmYxhsqWz/2aSB9ElfRyjBV3qFGSheMKugaeeeQOMBApzz4hGLdz+3FlS0KUZ3/ppwJ qg== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t00w59vfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 10:41:30 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3889LioP001667;
	Fri, 8 Sep 2023 10:41:29 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svfctbbs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 10:41:28 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 388AfPMx39322048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Sep 2023 10:41:25 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7BF252004B;
	Fri,  8 Sep 2023 10:41:25 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D6F620043;
	Fri,  8 Sep 2023 10:41:23 +0000 (GMT)
Received: from [9.43.39.200] (unknown [9.43.39.200])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  8 Sep 2023 10:41:22 +0000 (GMT)
Message-ID: <d069be7b-f53f-51bc-dd46-0388c3191bd3@linux.ibm.com>
Date: Fri, 8 Sep 2023 16:11:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/3] perf vendor events: Update JSON/events for power10
 platform
Content-Language: en-US
To: Arnaldo Carvalho de Melo <acme@kernel.org>
References: <20230905114039.176645-1-kjain@linux.ibm.com>
 <ZPiMEES/oAFVXYnH@kernel.org>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <ZPiMEES/oAFVXYnH@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nEcFDNxEkAu67j2BchWgElj-UvQm9c7v
X-Proofpoint-ORIG-GUID: nEcFDNxEkAu67j2BchWgElj-UvQm9c7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_07,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309080097
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
Cc: atrajeev@linux.vnet.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/6/23 19:56, Arnaldo Carvalho de Melo wrote:
> Em Tue, Sep 05, 2023 at 05:10:37PM +0530, Kajol Jain escreveu:
>> Update JSON/Events list with data-source events for power10 platform.
> 
> Thanks, applied the series.
> 
> - Arnaldo

Hi Arnaldo,
Thanks for pulling the patchset.

Thanks,
Kajol Jain

> 
>  
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  .../arch/powerpc/power10/datasource.json      | 1282 +++++++++++++++++
>>  .../arch/powerpc/power10/others.json          |   10 -
>>  .../arch/powerpc/power10/translation.json     |    5 -
>>  3 files changed, 1282 insertions(+), 15 deletions(-)
>>  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/datasource.json
>>
>> ---
>> Changelog:
>> v1->v2
>> - Split first patch as its bounce from
>>   linux-perf-users@vger.kernel.org mailing list because of 
>>   'Message too long (>100000 chars)' error.
>> ---
>> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
>> new file mode 100644
>> index 000000000000..12cfb9785433
>> --- /dev/null
>> +++ b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
>> @@ -0,0 +1,1282 @@
>> +[
>> +  {
>> +    "EventCode": "0x200FE",
>> +    "EventName": "PM_DATA_FROM_L2MISS",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x300FE",
>> +    "EventName": "PM_DATA_FROM_L3MISS",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x400FE",
>> +    "EventName": "PM_DATA_FROM_MEMORY",
>> +    "BriefDescription": "The processor's data cache was reloaded from local, remote, or distant memory due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x000300000000C040",
>> +    "EventName": "PM_INST_FROM_L2",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from the local core's L2 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x000340000000C040",
>> +    "EventName": "PM_DATA_FROM_L2",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L2 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x000300000010C040",
>> +    "EventName": "PM_INST_FROM_L2_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from the local core's L2 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x000340000020C040",
>> +    "EventName": "PM_DATA_FROM_L2_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L2 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x003F00000000C040",
>> +    "EventName": "PM_INST_FROM_L1MISS",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L1 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x003F40000000C040",
>> +    "EventName": "PM_DATA_FROM_L1MISS",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L1 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x003F00000010C040",
>> +    "EventName": "PM_INST_FROM_L1MISS_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L1 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x003F40000020C040",
>> +    "EventName": "PM_DATA_FROM_L1MISS_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L1 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x000040000000C040",
>> +    "EventName": "PM_DATA_FROM_L2_NO_CONFLICT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded without dispatch conflicts with data NOT in the MEPF state from the local core's L2 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x000040000020C040",
>> +    "EventName": "PM_DATA_FROM_L2_NO_CONFLICT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded without dispatch conflicts with data NOT in the MEPF state from the local core's L2 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x004040000000C040",
>> +    "EventName": "PM_DATA_FROM_L2_MEPF",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with data in the MEPF state without dispatch conflicts from the local core's L2 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x004040000020C040",
>> +    "EventName": "PM_DATA_FROM_L2_MEPF_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with data in the MEPF state without dispatch conflicts from the local core's L2 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x008040000000C040",
>> +    "EventName": "PM_DATA_FROM_L2_LDHITST_CONFLICT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with data that had a dispatch conflict on ld-hit-store from the local core's L2 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x008040000020C040",
>> +    "EventName": "PM_DATA_FROM_L2_LDHITST_CONFLICT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with data that had a dispatch conflict on ld-hit-store from the local core's L2 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x00C040000000C040",
>> +    "EventName": "PM_DATA_FROM_L2_OTHER_CONFLICT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with data that had a dispatch conflict other than ld-hit-store from the local core's L2 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x00C040000020C040",
>> +    "EventName": "PM_DATA_FROM_L2_OTHER_CONFLICT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with data that had a dispatch conflict other than ld-hit-store from the local core's L2 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x000380000000C040",
>> +    "EventName": "PM_INST_FROM_L2MISS",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L2 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x000380000010C040",
>> +    "EventName": "PM_INST_FROM_L2MISS_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L2 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0003C0000020C040",
>> +    "EventName": "PM_DATA_FROM_L2MISS_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x010300000000C040",
>> +    "EventName": "PM_INST_FROM_L3",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from the local core's L3 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x010340000000C040",
>> +    "EventName": "PM_DATA_FROM_L3",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L3 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x010300000010C040",
>> +    "EventName": "PM_INST_FROM_L3_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from the local core's L3 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x010340000020C040",
>> +    "EventName": "PM_DATA_FROM_L3_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L3 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x010040000000C040",
>> +    "EventName": "PM_DATA_FROM_L3_NO_CONFLICT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded without dispatch conflicts with data NOT in the MEPF state from the local core's L3 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x010040000020C040",
>> +    "EventName": "PM_DATA_FROM_L3_NO_CONFLICT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded without dispatch conflicts with data NOT in the MEPF state from the local core's L3 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x014040000000C040",
>> +    "EventName": "PM_DATA_FROM_L3_MEPF",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with data in the MEPF state without dispatch conflicts from the local core's L3 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x014040000020C040",
>> +    "EventName": "PM_DATA_FROM_L3_MEPF_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with data in the MEPF state without dispatch conflicts from the local core's L3 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x01C040000000C040",
>> +    "EventName": "PM_DATA_FROM_L3_CONFLICT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L3 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x01C040000020C040",
>> +    "EventName": "PM_DATA_FROM_L3_CONFLICT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L3 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x000780000000C040",
>> +    "EventName": "PM_INST_FROM_L3MISS",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x000780000010C040",
>> +    "EventName": "PM_INST_FROM_L3MISS_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0007C0000020C040",
>> +    "EventName": "PM_DATA_FROM_L3MISS_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x080040000000C040",
>> +    "EventName": "PM_DATA_FROM_L21_REGENT_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 on the same chip in the same regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x080040000020C040",
>> +    "EventName": "PM_DATA_FROM_L21_REGENT_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 on the same chip in the same regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x084040000000C040",
>> +    "EventName": "PM_DATA_FROM_L21_REGENT_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 on the same chip in the same regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x084040000020C040",
>> +    "EventName": "PM_DATA_FROM_L21_REGENT_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 on the same chip in the same regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x080100000000C040",
>> +    "EventName": "PM_INST_FROM_L21_REGENT",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 on the same chip in the same regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x080140000000C040",
>> +    "EventName": "PM_DATA_FROM_L21_REGENT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 on the same chip in the same regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x080100000010C040",
>> +    "EventName": "PM_INST_FROM_L21_REGENT_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 on the same chip in the same regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x080140000020C040",
>> +    "EventName": "PM_DATA_FROM_L21_REGENT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 on the same chip in the same regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x088040000000C040",
>> +    "EventName": "PM_DATA_FROM_L31_REGENT_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 on the same chip in the same regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x088040000020C040",
>> +    "EventName": "PM_DATA_FROM_L31_REGENT_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 on the same chip in the same regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x08C040000000C040",
>> +    "EventName": "PM_DATA_FROM_L31_REGENT_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 on the same chip in the same regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x08C040000020C040",
>> +    "EventName": "PM_DATA_FROM_L31_REGENT_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 on the same chip in the same regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x088100000000C040",
>> +    "EventName": "PM_INST_FROM_L31_REGENT",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 on the same chip in the same regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x088140000000C040",
>> +    "EventName": "PM_DATA_FROM_L31_REGENT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 on the same chip in the same regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x088100000010C040",
>> +    "EventName": "PM_INST_FROM_L31_REGENT_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 on the same chip in the same regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x088140000020C040",
>> +    "EventName": "PM_DATA_FROM_L31_REGENT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 on the same chip in the same regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x080240000000C040",
>> +    "EventName": "PM_DATA_FROM_REGENT_L2L3_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 on the same chip in the same regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x080240000020C040",
>> +    "EventName": "PM_DATA_FROM_REGENT_L2L3_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 on the same chip in the same regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x084240000000C040",
>> +    "EventName": "PM_DATA_FROM_REGENT_L2L3_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in the same regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x084240000020C040",
>> +    "EventName": "PM_DATA_FROM_REGENT_L2L3_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in the same regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x080300000000C040",
>> +    "EventName": "PM_INST_FROM_REGENT_L2L3",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 on the same chip in the same regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x080340000000C040",
>> +    "EventName": "PM_DATA_FROM_REGENT_L2L3",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 on the same chip in the same regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x080300000010C040",
>> +    "EventName": "PM_INST_FROM_REGENT_L2L3_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 on the same chip in the same regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x080340000020C040",
>> +    "EventName": "PM_DATA_FROM_REGENT_L2L3_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 on the same chip in the same regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0040000000C040",
>> +    "EventName": "PM_DATA_FROM_L21_NON_REGENT_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 on the same chip in a different regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0040000020C040",
>> +    "EventName": "PM_DATA_FROM_L21_NON_REGENT_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 on the same chip in a different regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0A4040000000C040",
>> +    "EventName": "PM_DATA_FROM_L21_NON_REGENT_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 on the same chip in a different regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0A4040000020C040",
>> +    "EventName": "PM_DATA_FROM_L21_NON_REGENT_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 on the same chip in a different regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0100000000C040",
>> +    "EventName": "PM_INST_FROM_L21_NON_REGENT",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 on the same chip in a different regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0140000000C040",
>> +    "EventName": "PM_DATA_FROM_L21_NON_REGENT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 on the same chip in a different regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0100000010C040",
>> +    "EventName": "PM_INST_FROM_L21_NON_REGENT_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 on the same chip in a different regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0140000020C040",
>> +    "EventName": "PM_DATA_FROM_L21_NON_REGENT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 on the same chip in a different regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0A8040000000C040",
>> +    "EventName": "PM_DATA_FROM_L31_NON_REGENT_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 on the same chip in a different regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0A8040000020C040",
>> +    "EventName": "PM_DATA_FROM_L31_NON_REGENT_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 on the same chip in a different regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0AC040000000C040",
>> +    "EventName": "PM_DATA_FROM_L31_NON_REGENT_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 on the same chip in a different regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0AC040000020C040",
>> +    "EventName": "PM_DATA_FROM_L31_NON_REGENT_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 on the same chip in a different regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0A8100000000C040",
>> +    "EventName": "PM_INST_FROM_L31_NON_REGENT",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 on the same chip in a different regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0A8140000000C040",
>> +    "EventName": "PM_DATA_FROM_L31_NON_REGENT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 on the same chip in a different regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0A8100000010C040",
>> +    "EventName": "PM_INST_FROM_L31_NON_REGENT_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 on the same chip in a different regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0A8140000020C040",
>> +    "EventName": "PM_DATA_FROM_L31_NON_REGENT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 on the same chip in a different regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0240000000C040",
>> +    "EventName": "PM_DATA_FROM_NON_REGENT_L2L3_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0240000020C040",
>> +    "EventName": "PM_DATA_FROM_NON_REGENT_L2L3_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0A4240000000C040",
>> +    "EventName": "PM_DATA_FROM_NON_REGENT_L2L3_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0A4240000020C040",
>> +    "EventName": "PM_DATA_FROM_NON_REGENT_L2L3_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0300000000C040",
>> +    "EventName": "PM_INST_FROM_NON_REGENT_L2L3",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 on the same chip in a different regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0340000000C040",
>> +    "EventName": "PM_DATA_FROM_NON_REGENT_L2L3",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 on the same chip in a different regent due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0300000010C040",
>> +    "EventName": "PM_INST_FROM_NON_REGENT_L2L3_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 on the same chip in a different regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0340000020C040",
>> +    "EventName": "PM_DATA_FROM_NON_REGENT_L2L3_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 on the same chip in a different regent due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x094100000000C040",
>> +    "EventName": "PM_INST_FROM_LMEM",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from the local chip's memory due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x094040000000C040",
>> +    "EventName": "PM_DATA_FROM_LMEM",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's memory due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x094100000010C040",
>> +    "EventName": "PM_INST_FROM_LMEM_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from the local chip's memory due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x094040000020C040",
>> +    "EventName": "PM_DATA_FROM_LMEM_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's memory due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x098040000000C040",
>> +    "EventName": "PM_DATA_FROM_L_OC_CACHE",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI cache due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x098040000020C040",
>> +    "EventName": "PM_DATA_FROM_L_OC_CACHE_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI cache due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x09C040000000C040",
>> +    "EventName": "PM_DATA_FROM_L_OC_MEM",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI memory due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x09C040000020C040",
>> +    "EventName": "PM_DATA_FROM_L_OC_MEM_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI memory due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x098100000000C040",
>> +    "EventName": "PM_INST_FROM_L_OC_ANY",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from the local chip's OpenCAPI cache or memory due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x098140000000C040",
>> +    "EventName": "PM_DATA_FROM_L_OC_ANY",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI cache or memory due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x098100000010C040",
>> +    "EventName": "PM_INST_FROM_L_OC_ANY_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from the local chip's OpenCAPI cache or memory due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x098140000020C040",
>> +    "EventName": "PM_DATA_FROM_L_OC_ANY_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI cache or memory due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0C0040000000C040",
>> +    "EventName": "PM_DATA_FROM_RL2_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 from a remote chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0C0040000020C040",
>> +    "EventName": "PM_DATA_FROM_RL2_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 from a remote chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0C4040000000C040",
>> +    "EventName": "PM_DATA_FROM_RL2_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 from a remote chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0C4040000020C040",
>> +    "EventName": "PM_DATA_FROM_RL2_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 from a remote chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0C0100000000C040",
>> +    "EventName": "PM_INST_FROM_RL2",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 from a remote chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0C0140000000C040",
>> +    "EventName": "PM_DATA_FROM_RL2",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 from a remote chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0C0100000010C040",
>> +    "EventName": "PM_INST_FROM_RL2_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 from a remote chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0C0140000020C040",
>> +    "EventName": "PM_DATA_FROM_RL2_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 from a remote chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0C8040000000C040",
>> +    "EventName": "PM_DATA_FROM_RL3_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 from a remote chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0C8040000020C040",
>> +    "EventName": "PM_DATA_FROM_RL3_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 from a remote chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0CC040000000C040",
>> +    "EventName": "PM_DATA_FROM_RL3_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 from a remote chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0CC040000020C040",
>> +    "EventName": "PM_DATA_FROM_RL3_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 from a remote chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0C8100000000C040",
>> +    "EventName": "PM_INST_FROM_RL3",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 from a remote chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0C8140000000C040",
>> +    "EventName": "PM_DATA_FROM_RL3",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 from a remote chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0C8100000010C040",
>> +    "EventName": "PM_INST_FROM_RL3_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 from a remote chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0C8140000020C040",
>> +    "EventName": "PM_DATA_FROM_RL3_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 from a remote chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0C0240000000C040",
>> +    "EventName": "PM_DATA_FROM_RL2L3_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 from a remote chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0C0240000020C040",
>> +    "EventName": "PM_DATA_FROM_RL2L3_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 from a remote chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0C4240000000C040",
>> +    "EventName": "PM_DATA_FROM_RL2L3_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 from a remote chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0C4240000020C040",
>> +    "EventName": "PM_DATA_FROM_RL2L3_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 from a remote chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0C0300000000C040",
>> +    "EventName": "PM_INST_FROM_RL2L3",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a remote chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0C0340000000C040",
>> +    "EventName": "PM_DATA_FROM_RL2L3",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a remote chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0C0300000010C040",
>> +    "EventName": "PM_INST_FROM_RL2L3_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a remote chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0C0340000020C040",
>> +    "EventName": "PM_DATA_FROM_RL2L3_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a remote chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0D4100000000C040",
>> +    "EventName": "PM_INST_FROM_RMEM",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from remote memory (MC slow) due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0D4040000000C040",
>> +    "EventName": "PM_DATA_FROM_RMEM",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from remote memory (MC slow) due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0D4100000010C040",
>> +    "EventName": "PM_INST_FROM_RMEM_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from remote memory (MC slow) due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0D4040000020C040",
>> +    "EventName": "PM_DATA_FROM_RMEM_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from remote memory (MC slow) due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0D8040000000C040",
>> +    "EventName": "PM_DATA_FROM_R_OC_CACHE",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI cache due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0D8040000020C040",
>> +    "EventName": "PM_DATA_FROM_R_OC_CACHE_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI cache due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0DC040000000C040",
>> +    "EventName": "PM_DATA_FROM_R_OC_MEM",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI memory due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0DC040000020C040",
>> +    "EventName": "PM_DATA_FROM_R_OC_MEM_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI memory due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0D8100000000C040",
>> +    "EventName": "PM_INST_FROM_R_OC_ANY",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from a remote chip's OpenCAPI cache or memory due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0D8140000000C040",
>> +    "EventName": "PM_DATA_FROM_R_OC_ANY",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI cache or memory due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0D8100000010C040",
>> +    "EventName": "PM_INST_FROM_R_OC_ANY_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from a remote chip's OpenCAPI cache or memory due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0D8140000020C040",
>> +    "EventName": "PM_DATA_FROM_R_OC_ANY_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI cache or memory due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0E0040000000C040",
>> +    "EventName": "PM_DATA_FROM_DL2_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 from a distant chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0E0040000020C040",
>> +    "EventName": "PM_DATA_FROM_DL2_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 from a distant chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0E4040000000C040",
>> +    "EventName": "PM_DATA_FROM_DL2_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 from a distant chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0E4040000020C040",
>> +    "EventName": "PM_DATA_FROM_DL2_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 from a distant chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0E0100000000C040",
>> +    "EventName": "PM_INST_FROM_DL2",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 from a distant chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0E0140000000C040",
>> +    "EventName": "PM_DATA_FROM_DL2",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 from a distant chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0E0100000010C040",
>> +    "EventName": "PM_INST_FROM_DL2_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 from a distant chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0E0140000020C040",
>> +    "EventName": "PM_DATA_FROM_DL2_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 from a distant chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0E8040000000C040",
>> +    "EventName": "PM_DATA_FROM_DL3_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 from a distant chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0E8040000020C040",
>> +    "EventName": "PM_DATA_FROM_DL3_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 from a distant chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0EC040000000C040",
>> +    "EventName": "PM_DATA_FROM_DL3_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 from a distant chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0EC040000020C040",
>> +    "EventName": "PM_DATA_FROM_DL3_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 from a distant chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0E8100000000C040",
>> +    "EventName": "PM_INST_FROM_DL3",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 from a distant chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0E8140000000C040",
>> +    "EventName": "PM_DATA_FROM_DL3",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 from a distant chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0E8100000010C040",
>> +    "EventName": "PM_INST_FROM_DL3_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 from a distant chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0E8140000020C040",
>> +    "EventName": "PM_DATA_FROM_DL3_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 from a distant chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0E0240000000C040",
>> +    "EventName": "PM_DATA_FROM_DL2L3_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 from a distant chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0E0240000020C040",
>> +    "EventName": "PM_DATA_FROM_DL2L3_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 from a distant chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0E4240000000C040",
>> +    "EventName": "PM_DATA_FROM_DL2L3_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 from a distant chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0E4240000020C040",
>> +    "EventName": "PM_DATA_FROM_DL2L3_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 from a distant chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0E0300000000C040",
>> +    "EventName": "PM_INST_FROM_DL2L3",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a distant chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0E0340000000C040",
>> +    "EventName": "PM_DATA_FROM_DL2L3",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a distant chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0E0300000010C040",
>> +    "EventName": "PM_INST_FROM_DL2L3_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a distant chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0E0340000020C040",
>> +    "EventName": "PM_DATA_FROM_DL2L3_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a distant chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0F4100000000C040",
>> +    "EventName": "PM_INST_FROM_DMEM",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from distant memory (MC slow) due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0F4040000000C040",
>> +    "EventName": "PM_DATA_FROM_DMEM",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from distant memory (MC slow) due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0F4100000010C040",
>> +    "EventName": "PM_INST_FROM_DMEM_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from distant memory (MC slow) due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0F4040000020C040",
>> +    "EventName": "PM_DATA_FROM_DMEM_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from distant memory (MC slow) due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0F8040000000C040",
>> +    "EventName": "PM_DATA_FROM_D_OC_CACHE",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI cache due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0F8040000020C040",
>> +    "EventName": "PM_DATA_FROM_D_OC_CACHE_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI cache due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0FC040000000C040",
>> +    "EventName": "PM_DATA_FROM_D_OC_MEM",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI memory due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0FC040000020C040",
>> +    "EventName": "PM_DATA_FROM_D_OC_MEM_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI memory due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0F8100000000C040",
>> +    "EventName": "PM_INST_FROM_D_OC_ANY",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from a distant chip's OpenCAPI cache or memory due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0F8140000000C040",
>> +    "EventName": "PM_DATA_FROM_D_OC_ANY",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI cache or memory due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0F8100000010C040",
>> +    "EventName": "PM_INST_FROM_D_OC_ANY_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from a distant chip's OpenCAPI cache or memory due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0F8140000020C040",
>> +    "EventName": "PM_DATA_FROM_D_OC_ANY_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI cache or memory due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x080B00000000C040",
>> +    "EventName": "PM_INST_FROM_ONCHIP_CACHE",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from the same chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x080B40000000C040",
>> +    "EventName": "PM_DATA_FROM_ONCHIP_CACHE",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from the same chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x080B00000010C040",
>> +    "EventName": "PM_INST_FROM_ONCHIP_CACHE_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from the same chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x080B40000020C040",
>> +    "EventName": "PM_DATA_FROM_ONCHIP_CACHE_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from the same chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0C0B00000000C040",
>> +    "EventName": "PM_INST_FROM_OFFCHIP_CACHE",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a different chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0C0B40000000C040",
>> +    "EventName": "PM_DATA_FROM_OFFCHIP_CACHE",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a different chip due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x0C0B00000010C040",
>> +    "EventName": "PM_INST_FROM_OFFCHIP_CACHE_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a different chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x0C0B40000020C040",
>> +    "EventName": "PM_DATA_FROM_OFFCHIP_CACHE_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a different chip due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x095900000000C040",
>> +    "EventName": "PM_INST_FROM_ANY_MEMORY",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from any chip's memory (MC slow) due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x095840000000C040",
>> +    "EventName": "PM_DATA_FROM_ANY_MEMORY",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from any chip's memory (MC slow) due to a demand miss."
>> +  },
>> +  {
>> +    "EventCode": "0x095900000010C040",
>> +    "EventName": "PM_INST_FROM_ANY_MEMORY_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from any chip's memory (MC slow) due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x095840000020C040",
>> +    "EventName": "PM_DATA_FROM_ANY_MEMORY_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from any chip's memory (MC slow) due to a demand miss or prefetch reload."
>> +  },
>> +  {
>> +    "EventCode": "0x000300000000C142",
>> +    "EventName": "PM_MRK_INST_FROM_L2",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from the local core's L2 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x000340000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L2",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L2 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x000300000010C142",
>> +    "EventName": "PM_MRK_INST_FROM_L2_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from the local core's L2 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x000340000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L2_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L2 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x003F00000000C142",
>> +    "EventName": "PM_MRK_INST_FROM_L1MISS",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L1 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x003F40000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L1MISS",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L1 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x003F00000010C142",
>> +    "EventName": "PM_MRK_INST_FROM_L1MISS_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L1 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x003F40000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L1MISS_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L1 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x000040000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L2_NO_CONFLICT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded without dispatch conflicts with data NOT in the MEPF state from the local core's L2 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x000040000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L2_NO_CONFLICT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded without dispatch conflicts with data NOT in the MEPF state from the local core's L2 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x004040000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L2_MEPF",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with data in the MEPF state without dispatch conflicts from the local core's L2 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x004040000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L2_MEPF_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with data in the MEPF state without dispatch conflicts from the local core's L2 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x008040000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L2_LDHITST_CONFLICT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with data that had a dispatch conflict on ld-hit-store from the local core's L2 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x008040000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L2_LDHITST_CONFLICT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with data that had a dispatch conflict on ld-hit-store from the local core's L2 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x00C040000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L2_OTHER_CONFLICT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with data that had a dispatch conflict other than ld-hit-store from the local core's L2 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x00C040000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L2_OTHER_CONFLICT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with data that had a dispatch conflict other than ld-hit-store from the local core's L2 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x000380000000C142",
>> +    "EventName": "PM_MRK_INST_FROM_L2MISS",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L2 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0003C0000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L2MISS",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x000380000010C142",
>> +    "EventName": "PM_MRK_INST_FROM_L2MISS_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from a source beyond the local core's L2 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0003C0000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L2MISS_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x010300000000C142",
>> +    "EventName": "PM_MRK_INST_FROM_L3",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from the local core's L3 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x010340000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L3",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L3 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x010300000010C142",
>> +    "EventName": "PM_MRK_INST_FROM_L3_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from the local core's L3 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x010340000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L3_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L3 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x010040000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L3_NO_CONFLICT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded without dispatch conflicts with data NOT in the MEPF state from the local core's L3 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x010040000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L3_NO_CONFLICT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded without dispatch conflicts with data NOT in the MEPF state from the local core's L3 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x014040000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L3_MEPF",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with data in the MEPF state without dispatch conflicts from the local core's L3 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x014040000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L3_MEPF_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with data in the MEPF state without dispatch conflicts from the local core's L3 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x01C040000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L3_CONFLICT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L3 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x01C040000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L3_CONFLICT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local core's L3 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x000780000000C142",
>> +    "EventName": "PM_MRK_INST_FROM_L3MISS",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0007C0000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L3MISS",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x000780000010C142",
>> +    "EventName": "PM_MRK_INST_FROM_L3MISS_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from beyond the local core's L3 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0007C0000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L3MISS_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from beyond the local core's L3 due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x080040000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L21_REGENT_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 on the same chip in the same regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x080040000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L21_REGENT_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x084040000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L21_REGENT_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 on the same chip in the same regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x084040000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L21_REGENT_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x080100000000C142",
>> +    "EventName": "PM_MRK_INST_FROM_L21_REGENT",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 on the same chip in the same regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x080140000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L21_REGENT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 on the same chip in the same regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x080100000010C142",
>> +    "EventName": "PM_MRK_INST_FROM_L21_REGENT_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x080140000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L21_REGENT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x088040000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L31_REGENT_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 on the same chip in the same regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x088040000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L31_REGENT_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x08C040000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L31_REGENT_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 on the same chip in the same regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x08C040000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L31_REGENT_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x088100000000C142",
>> +    "EventName": "PM_MRK_INST_FROM_L31_REGENT",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 on the same chip in the same regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x088140000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L31_REGENT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 on the same chip in the same regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x088100000010C142",
>> +    "EventName": "PM_MRK_INST_FROM_L31_REGENT_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x088140000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L31_REGENT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x080240000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_REGENT_L2L3_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 on the same chip in the same regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x080240000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_REGENT_L2L3_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x084240000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_REGENT_L2L3_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in the same regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x084240000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_REGENT_L2L3_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x080300000000C142",
>> +    "EventName": "PM_MRK_INST_FROM_REGENT_L2L3",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 on the same chip in the same regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x080340000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_REGENT_L2L3",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 on the same chip in the same regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x080300000010C142",
>> +    "EventName": "PM_MRK_INST_FROM_REGENT_L2L3_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x080340000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_REGENT_L2L3_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 on the same chip in the same regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0040000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L21_NON_REGENT_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 on the same chip in a different regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0040000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L21_NON_REGENT_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A4040000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L21_NON_REGENT_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 on the same chip in a different regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A4040000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L21_NON_REGENT_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0100000000C142",
>> +    "EventName": "PM_MRK_INST_FROM_L21_NON_REGENT",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 on the same chip in a different regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0140000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L21_NON_REGENT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 on the same chip in a different regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0100000010C142",
>> +    "EventName": "PM_MRK_INST_FROM_L21_NON_REGENT_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0140000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L21_NON_REGENT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A8040000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L31_NON_REGENT_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 on the same chip in a different regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A8040000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L31_NON_REGENT_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0AC040000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L31_NON_REGENT_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 on the same chip in a different regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0AC040000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L31_NON_REGENT_MOD_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A8100000000C142",
>> +    "EventName": "PM_MRK_INST_FROM_L31_NON_REGENT",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 on the same chip in a different regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A8140000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L31_NON_REGENT",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 on the same chip in a different regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A8100000010C142",
>> +    "EventName": "PM_MRK_INST_FROM_L31_NON_REGENT_ALL",
>> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A8140000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_L31_NON_REGENT_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0240000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_NON_REGENT_L2L3_SHR",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A0240000020C142",
>> +    "EventName": "PM_MRK_DATA_FROM_NON_REGENT_L2L3_SHR_ALL",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
>> +  },
>> +  {
>> +    "EventCode": "0x0A4240000000C142",
>> +    "EventName": "PM_MRK_DATA_FROM_NON_REGENT_L2L3_MOD",
>> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss for a marked instruction."
>> +  }
>> +]
>> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/others.json b/tools/perf/pmu-events/arch/powerpc/power10/others.json
>> index 0e21e7ba1959..fcf8a8ebe7bd 100644
>> --- a/tools/perf/pmu-events/arch/powerpc/power10/others.json
>> +++ b/tools/perf/pmu-events/arch/powerpc/power10/others.json
>> @@ -89,11 +89,6 @@
>>      "EventName": "PM_LD_DEMAND_MISS_L1",
>>      "BriefDescription": "The L1 cache was reloaded with a line that fulfills a demand miss request. Counted at reload time, before finish."
>>    },
>> -  {
>> -    "EventCode": "0x300FE",
>> -    "EventName": "PM_DATA_FROM_L3MISS",
>> -    "BriefDescription": "The processor's data cache was reloaded from a source other than the local core's L1, L2, or L3 due to a demand miss."
>> -  },
>>    {
>>      "EventCode": "0x40012",
>>      "EventName": "PM_L1_ICACHE_RELOADED_ALL",
>> @@ -113,10 +108,5 @@
>>      "EventCode": "0x400F0",
>>      "EventName": "PM_LD_DEMAND_MISS_L1_FIN",
>>      "BriefDescription": "Load missed L1, counted at finish time."
>> -  },
>> -  {
>> -    "EventCode": "0x400FE",
>> -    "EventName": "PM_DATA_FROM_MEMORY",
>> -    "BriefDescription": "The processor's data cache was reloaded from local, remote, or distant memory due to a demand miss."
>>    }
>>  ]
>> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/translation.json b/tools/perf/pmu-events/arch/powerpc/power10/translation.json
>> index ea73900d248a..a96f76797da0 100644
>> --- a/tools/perf/pmu-events/arch/powerpc/power10/translation.json
>> +++ b/tools/perf/pmu-events/arch/powerpc/power10/translation.json
>> @@ -9,11 +9,6 @@
>>      "EventName": "PM_ST_CMPL",
>>      "BriefDescription": "Stores completed from S2Q (2nd-level store queue). This event includes regular stores, stcx and cache inhibited stores. The following operations are excluded (pteupdate, snoop tlbie complete, store atomics, miso, load atomic payloads, tlbie, tlbsync, slbieg, isync, msgsnd, slbiag, cpabort, copy, tcheck, tend, stsync, dcbst, icbi, dcbf, hwsync, lwsync, ptesync, eieio, msgsync)."
>>    },
>> -  {
>> -    "EventCode": "0x200FE",
>> -    "EventName": "PM_DATA_FROM_L2MISS",
>> -    "BriefDescription": "The processor's L1 data cache was reloaded from a source beyond the local core's L2 due to a demand miss."
>> -  },
>>    {
>>      "EventCode": "0x300F0",
>>      "EventName": "PM_ST_MISS_L1",
>> -- 
>> 2.39.3
>>
> 
