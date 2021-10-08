Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5E5426566
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 09:49:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQgLs6YYBz305g
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 18:49:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H2OLHzbr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=H2OLHzbr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQgL04tXCz2yMV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Oct 2021 18:48:39 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1985g0MN008910; 
 Fri, 8 Oct 2021 03:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=84qQAtRZ3PR5NGWIjzGBJipe8qaZCszdSBZtEx35//0=;
 b=H2OLHzbr7QU5t1LzEhrY1wjVa/NL+pZVZZZ7s11RrA/5Ox3d/doaIXp9726x6M8HZIrs
 GNsk3fNs/d6vTvO6Bbi2G/5ZeNCCGbeG+dYtwFJ/qs50IuPKd1iefy1Gwj9eSzOiKcK0
 dZVEmkR8t7snriYWI2OfK7on6GjfqHRcR7PKHa0axd/Rq1+uPMilER+prrhKRVgLc/KW
 IfE12xbJToxIhEl9V8FvDj6vQ7T3drvTRLjK3+rVQqhqe9tXXjSHxkj5wkt+eIG3ZSmX
 rhvytC+Cdge5y6j5M5FPcJN0FHFz7VyeOIEoxcSCJYPwC9obNtH97nHCm9dSQV9+n59R BA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bjg2njf0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 03:48:25 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1987FvAo022982;
 Fri, 8 Oct 2021 03:48:25 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bjg2njeyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 03:48:24 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1987lsf1018315;
 Fri, 8 Oct 2021 07:48:22 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3bef2ayymg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 07:48:22 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1987mJom36897098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Oct 2021 07:48:19 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77786A4064;
 Fri,  8 Oct 2021 07:48:19 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F2BAA405B;
 Fri,  8 Oct 2021 07:48:16 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com (unknown
 [9.43.64.167])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  8 Oct 2021 07:48:15 +0000 (GMT)
Subject: Re: [PATCH] perf vendor events power10: Add metric events json file
 for power10 platform
To: "Paul A. Clarke" <pc@us.ibm.com>
References: <20211006073119.276340-1-kjain@linux.ibm.com>
 <20211006173248.GA7389@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <8d708000-c30d-12a2-d1e8-f916329ee238@linux.ibm.com>
Date: Fri, 8 Oct 2021 13:18:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211006173248.GA7389@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GA6wMFMYgP_AgSMpmR9j_D8dsA0-a_rV
X-Proofpoint-GUID: Hzuyd6If2DUrHra9s2mK-L2T1n42HBzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_02,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110080044
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, jolsa@redhat.com,
 linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/6/21 11:02 PM, Paul A. Clarke wrote:
> Kajol,
> 
> On Wed, Oct 06, 2021 at 01:01:19PM +0530, Kajol Jain wrote:
>> Add pmu metric json file for power10 platform.
> 
> Thanks for producing this!  A few minor corrections, plus a number of
> stylistic comments below...

Hi Paul,
   I will make mentioned nit changes and send a v2.

Thanks,
Kajol Jain

> 
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  .../arch/powerpc/power10/metrics.json         | 772 ++++++++++++++++++
>>  1 file changed, 772 insertions(+)
>>  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/metrics.json
>>
>> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
>> new file mode 100644
>> index 000000000000..028c9777a516
>> --- /dev/null
>> +++ b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
>> @@ -0,0 +1,772 @@
>> +[
>> +    {
>> +        "BriefDescription": "Percentage of cycles that are run cycles",
>> +        "MetricExpr": "PM_RUN_CYC / PM_CYC * 100",
>> +        "MetricGroup": "General",
>> +        "MetricName": "RUN_CYCLES_RATE",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per completed instruction",
>> +        "MetricExpr": "PM_CYC / PM_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "CYCLES_PER_INSTRUCTION"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled for any reason",
>> +        "MetricExpr": "PM_DISP_STALL_CYC / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled because there was a flush",
>> +        "MetricExpr": "PM_DISP_STALL_FLUSH / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_FLUSH_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled because the MMU was handling a translation miss",
>> +        "MetricExpr": "PM_DISP_STALL_TRANSLATION / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_TRANSLATION_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled waiting to resolve an instruction ERAT miss",
>> +        "MetricExpr": "PM_DISP_STALL_IERAT_ONLY_MISS / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_IERAT_ONLY_MISS_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled waiting to resolve an instruction TLB miss",
>> +        "MetricExpr": "PM_DISP_STALL_ITLB_MISS / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_ITLB_MISS_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled due to an icache miss",
>> +        "MetricExpr": "PM_DISP_STALL_IC_MISS / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_IC_MISS_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while the instruction was fetched form the local L2",
> 
> s/form/from/
> 
>> +        "MetricExpr": "PM_DISP_STALL_IC_L2 / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_IC_L2_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while the instruction was fetched form the local L3",
> 
> s/form/from/
> 
>> +        "MetricExpr": "PM_DISP_STALL_IC_L3 / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_IC_L3_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while the instruction was fetched from any source beyond the local L3",
>> +        "MetricExpr": "PM_DISP_STALL_IC_L3MISS / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_IC_L3MISS_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled due to an icache miss after a branch mispredict",
>> +        "MetricExpr": "PM_DISP_STALL_BR_MPRED_ICMISS / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_BR_MPRED_ICMISS_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while instruction was fetched from the local L2 after suffering a branch mispredict",
>> +        "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L2 / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_BR_MPRED_IC_L2_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while instruction was fetched from the local L3 after suffering a branch mispredict",
>> +        "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L3 / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_BR_MPRED_IC_L3_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while instruction was fetched from any source beyond  the local L3 after suffering a branch mispredict",
> 
> extra space after "beyond"
> 
>> +        "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L3MISS / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_BR_MPRED_IC_L3MISS_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled due to a branch mispredict",
>> +        "MetricExpr": "PM_DISP_STALL_BR_MPRED / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_BR_MPRED_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction was held at dispatch for any reason",
> 
> s/ntc/NTC/  or "next-to-complete"
> I do see uses of "NTC" below.
> Same comment for other instances of "ntc", below...
> 
>> +        "MetricExpr": "PM_DISP_STALL_HELD_CYC / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_HELD_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction was held at dispatch because of a synchronizing instruction that requires the ICT to be empty before dispatch",
>> +        "MetricExpr": "PM_DISP_STALL_HELD_SYNC_CYC / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISP_HELD_STALL_SYNC_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction was held at dispatch while waiting on the scoreboard",
>> +        "MetricExpr": "PM_DISP_STALL_HELD_SCOREBOARD_CYC / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISP_HELD_STALL_SCOREBOARD_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction was held at dispatch due to issue q full",
> 
> s/q/queue/
> 
>> +        "MetricExpr": "PM_DISP_STALL_HELD_ISSQ_FULL_CYC / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISP_HELD_STALL_ISSQ_FULL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction was held at dispatch because the mapper/SRB was full",
>> +        "MetricExpr": "PM_DISP_STALL_HELD_RENAME_CYC / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_HELD_RENAME_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction was held at dispatch because the STF mapper/SRB was full",
>> +        "MetricExpr": "PM_DISP_STALL_HELD_STF_MAPPER_CYC / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_HELD_STF_MAPPER_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction was held at dispatch because the XVFC mapper/SRB was full",
>> +        "MetricExpr": "PM_DISP_STALL_HELD_XVFC_MAPPER_CYC / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_HELD_XVFC_MAPPER_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction was held at dispatch for any other reason",
>> +        "MetricExpr": "PM_DISP_STALL_HELD_OTHER_CYC / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_HELD_OTHER_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction has been dispatched but not issued for any reason",
>> +        "MetricExpr": "PM_ISSUE_STALL / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "ISSUE_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is waiting to be finished in one of the execution units",
>> +        "MetricExpr": "PM_EXEC_STALL / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "EXECUTION_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction spent executing an NTC instruction that gets flushed some time after dispatch",
>> +        "MetricExpr": "PM_EXEC_STALL_NTC_FLUSH / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "NTC_FLUSH_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the instruction finishes at dispatch",
> 
> I'm not sure what that means.
> 
>> +        "MetricExpr": "PM_EXEC_STALL_FIN_AT_DISP / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "FIN_AT_DISP_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is executing in the branch unit",
>> +        "MetricExpr": "PM_EXEC_STALL_BRU / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "BRU_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is a simple fixed point instr that is executing in the lsu unit",
> 
> s/instr/instruction/
> s/lsu unit/LSU/
> 
>> +        "MetricExpr": "PM_EXEC_STALL_SIMPLE_FX / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "SIMPLE_FX_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is executing in the vsu unit",
> 
> s/vsu unit/VSU/
> 
>> +        "MetricExpr": "PM_EXEC_STALL_VSU / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "VSU_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is waiting to be finished in one of the execution units",
>> +        "MetricExpr": "PM_EXEC_STALL_TRANSLATION / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "TRANSLATION_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is a load or store that suffered a translation miss",
>> +        "MetricExpr": "PM_EXEC_STALL_DERAT_ONLY_MISS / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DERAT_ONLY_MISS_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is recovering from a TLB miss",
>> +        "MetricExpr": "PM_EXEC_STALL_DERAT_DTLB_MISS / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DERAT_DTLB_MISS_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is executing in the lsu unit",
> 
> s/lsu unit/LSU/
> 
>> +        "MetricExpr": "PM_EXEC_STALL_LSU / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "LSU_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is a load that is executing in the lsu unit",
> 
> s/lsu unit/LSU/
> 
>> +        "MetricExpr": "PM_EXEC_STALL_LOAD / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "LOAD_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is waiting for a load miss to resolve from either the local L2 or local L3",
>> +        "MetricExpr": "PM_EXEC_STALL_DMISS_L2L3 / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DMISS_L2L3_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is waiting for a load miss to resolve from either the local L2 or local L3, with an RC dispatch conflict",
>> +        "MetricExpr": "PM_EXEC_STALL_DMISS_L2L3_CONFLICT / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DMISS_L2L3_CONFLICT_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is waiting for a load miss to resolve from either the local L2 or local L3, without an RC dispatch conflict",
>> +        "MetricExpr": "PM_EXEC_STALL_DMISS_L2L3_NOCONFLICT / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DMISS_L2L3_NOCONFLICT_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is waiting for a load miss to resolve from a source beyond the local L2 and local L3",
>> +        "MetricExpr": "PM_EXEC_STALL_DMISS_L3MISS / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DMISS_L3MISS_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is waiting for a load miss to resolve from a neighbor chiplet's L2 or L3 in the same chip",
>> +        "MetricExpr": "PM_EXEC_STALL_DMISS_L21_L31 / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DMISS_L21_L31_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is waiting for a load miss to resolve from local memory, L4 or OpenCapp chip",
> 
> Most descriptions put L4 before memory.
> (My preference is to use an "Oxford comma", as in "memory, L4, or ..."
> (comma after "L4"), but acknowledge there are those who prefer otherwise.)
> 
>> +        "MetricExpr": "PM_EXEC_STALL_DMISS_LMEM / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DMISS_LMEM_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is waiting for a load miss to resolve from a remote chip (cache, L4, memory or CAPP) in the same group",
> 
> Is there a distinction between "OpenCapp" and "CAPP"?  If not, pick one throughout.
> Is this supposed to be "OpenCAPI"?
> 
>> +        "MetricExpr": "PM_EXEC_STALL_DMISS_OFF_CHIP / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DMISS_OFF_CHIP_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is waiting for a load miss to resolve from a distant chip (cache, L4, memory or CAPP chip)",
>> +        "MetricExpr": "PM_EXEC_STALL_DMISS_OFF_NODE / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DMISS_OFF_NODE_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is executing a TLBIEL instruction",
>> +        "MetricExpr": "PM_EXEC_STALL_TLBIEL / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "TLBIEL_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is finishing a load after its data has been reloaded from a data source beyond the local L1, OR when the LSU is processing an L1-hit, OR when the NTF instruction merged with another load in the LMQ",
>> +        "MetricExpr": "PM_EXEC_STALL_LOAD_FINISH / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "LOAD_FINISH_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is a store that is executing in the lsu unit",
> 
> s/lsu unit/LSU/
> 
>> +        "MetricExpr": "PM_EXEC_STALL_STORE / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "STORE_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is in the store unit outside of handling store misses or other special store operations",
> 
> s/store unit/LSU/ ?
> 
>> +        "MetricExpr": "PM_EXEC_STALL_STORE_PIPE / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "STORE_PIPE_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is a store whose cache line was not resident in the L1 and had to wait for allocation of the missing line into the L1",
>> +        "MetricExpr": "PM_EXEC_STALL_STORE_MISS / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "STORE_MISS_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is a TLBIE instruction waiting for a response from the L2",
>> +        "MetricExpr": "PM_EXEC_STALL_TLBIE / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "TLBIE_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is executing a PTESYNC instruction",
>> +        "MetricExpr": "PM_EXEC_STALL_PTESYNC / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "PTESYNC_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction cannot complete because the thread was blocked",
>> +        "MetricExpr": "PM_CMPL_STALL / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "COMPLETION_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction cannot complete because it was interrupted by ANY exception",
>> +        "MetricExpr": "PM_CMPL_STALL_EXCEPTION / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "EXCEPTION_COMPLETION_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is stuck at finish waiting for the non-speculative finish of either a stcx waiting for its result or a load waiting for non-critical sectors of data and ECC",
>> +        "MetricExpr": "PM_CMPL_STALL_MEM_ECC / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "MEM_ECC_COMPLETION_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction cannot complete the instruction is a stcx waiting for resolution from the nest",
>> +        "MetricExpr": "PM_CMPL_STALL_STCX / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "STCX_COMPLETION_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is a LWSYNC instruction waiting to complete",
> 
> Sometimes instruction mnemonics are ALL CAPS, like here, and sometimes not,
> like "stcx", above. Pick one style. Also pick whether the mnemonic is
> followed by "instruction" or not.  I prefer including "instruction" for
> clarity.
> 
>> +        "MetricExpr": "PM_CMPL_STALL_LWSYNC / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "LWSYNC_COMPLETION_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction is a HWSYNC instruction stuck at finish waiting for a response from the L2",
>> +        "MetricExpr": "PM_CMPL_STALL_HWSYNC / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "HWSYNC_COMPLETION_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction required special handling before completion",
>> +        "MetricExpr": "PM_CMPL_STALL_SPECIAL / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "SPECIAL_COMPLETION_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Should equal 0. If not, disp_stall_translation or children are miscounting",
> 
> Are these "Should equal 0" metrics generally useful?
> 
>> +        "MetricExpr": "DISPATCHED_TRANSLATION_CPI - (DISPATCHED_IERAT_ONLY_MISS_CPI + DISPATCHED_ITLB_MISS_CPI)",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "OTHER_DISPATCHED_TRANSLATION_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Should equal 0. If not, disp_stall_ic_miss or children are miscounting",
>> +        "MetricExpr": "DISPATCHED_IC_MISS_CPI - (DISPATCHED_IC_L2_CPI + DISPATCHED_IC_L3_CPI + DISPATCHED_IC_L3MISS_CPI)",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "OTHER_DISPATCHED_IC_MISS_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Should equal 0. If not, disp_stall_br_mpred_icmiss or children are miscounting",
>> +        "MetricExpr": "DISPATCHED_BR_MPRED_ICMISS_CPI - (DISPATCHED_BR_MPRED_IC_L2_CPI + DISPATCHED_BR_MPRED_IC_L3_CPI + DISPATCHED_BR_MPRED_IC_L3MISS_CPI)",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "OTHER_DISPATCHED_BR_MPRED_ICMISS_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Should equal 0. If not, disp_stall_held_rename or children are miscounting",
>> +        "MetricExpr": "DISPATCHED_HELD_RENAME_CPI - (DISPATCHED_HELD_STF_MAPPER_CPI + DISPATCHED_HELD_XVFC_MAPPER_CPI)",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "OTHER_DISPATCHED_HELD_RENAME_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Should equal 0. If not, disp_stall_held or children are miscounting",
>> +        "MetricExpr": "DISPATCHED_HELD_CPI - (DISP_HELD_STALL_SYNC_CPI + DISP_HELD_STALL_SCOREBOARD_CPI + DISP_HELD_STALL_ISSQ_FULL_CPI + DISPATCHED_HELD_RENAME_CPI + DISPATCHED_HELD_OTHER_CPI + DISPATCHED_HELD_HALT_CPI)",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "OTHER_DISPATCHED_HELD_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Should equal 0. If not, disp_stall or children are miscounting",
>> +        "MetricExpr": "DISPATCHED_CPI - (DISPATCHED_FLUSH_CPI + DISPATCHED_TRANSLATION_CPI + DISPATCHED_IC_MISS_CPI + DISPATCHED_BR_MPRED_ICMISS_CPI + DISPATCHED_BR_MPRED_CPI + DISPATCHED_HELD_CPI)",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "OTHER_DISPATCHED_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Should equal 0. If not, exec_stall_translation or children are miscounting",
>> +        "MetricExpr": "TRANSLATION_STALL_CPI - (DERAT_ONLY_MISS_STALL_CPI + DERAT_DTLB_MISS_STALL_CPI)",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "OTHER_TRANSLATION_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Should equal 0. If not, exec_stall_dmiss_l2l3 or children are miscounting",
>> +        "MetricExpr": "DMISS_L2L3_STALL_CPI - (DMISS_L2L3_CONFLICT_STALL_CPI + DMISS_L2L3_NOCONFLICT_STALL_CPI)",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "OTHER_DMISS_L2L3_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Should equal 0. If not, exec_stall_dmiss_l3miss or children are miscounting",
>> +        "MetricExpr": "DMISS_L3MISS_STALL_CPI - (DMISS_L21_L31_STALL_CPI + DMISS_LMEM_STALL_CPI + DMISS_OFF_CHIP_STALL_CPI + DMISS_OFF_NODE_STALL_CPI)",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "OTHER_DMISS_L3MISS_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Should equal 0. If not, exec_stall_load or children are miscounting",
>> +        "MetricExpr": "LOAD_STALL_CPI - (DMISS_L2L3_STALL_CPI + DMISS_L3MISS_STALL_CPI + TLBIEL_STALL_CPI + LOAD_FINISH_STALL_CPI)",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "OTHER_LOAD_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Should equal 0. If not, exec_stall_store or children are miscounting",
>> +        "MetricExpr": "STORE_STALL_CPI - (STORE_PIPE_STALL_CPI + STORE_MISS_STALL_CPI + TLBIE_STALL_CPI + PTESYNC_STALL_CPI)",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "OTHER_STORE_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Should equal 0. If not, exec_stall_lsu or children are miscounting",
>> +        "MetricExpr": "LSU_STALL_CPI - (LOAD_STALL_CPI + STORE_STALL_CPI)",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "OTHER_LSU_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Should equal 0. If not, cmpl_stall or children are miscounting",
>> +        "MetricExpr": "COMPLETION_STALL_CPI - (EXCEPTION_COMPLETION_STALL_CPI + MEM_ECC_COMPLETION_STALL_CPI + STCX_COMPLETION_STALL_CPI + LWSYNC_COMPLETION_STALL_CPI + HWSYNC_COMPLETION_STALL_CPI + SPECIAL_COMPLETION_STALL_CPI)",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "OTHER_COMPLETION_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Should equal 0. If not, exec_stall or children are miscounting",
>> +        "MetricExpr": "EXECUTION_STALL_CPI - (NTC_FLUSH_STALL_CPI + FIN_AT_DISP_STALL_CPI + BRU_STALL_CPI + SIMPLE_FX_STALL_CPI + VSU_STALL_CPI + TRANSLATION_STALL_CPI + LSU_STALL_CPI)",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "OTHER_STALL_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Should equal 0. If not, pm_cyc or children are miscounting",
>> +        "MetricExpr": "CYCLES_PER_INSTRUCTION - (DISPATCHED_CPI + ISSUE_STALL_CPI + EXECUTION_STALL_CPI + COMPLETION_STALL_CPI)",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "OTHER_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled because Fetch was being held,  so there was nothing in the pipeline for this thread",
> 
> s/Fetch/fetch/
> extra space after "held,"
> 
>> +        "MetricExpr": "PM_DISP_STALL_FETCH / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_FETCH_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntc instruction was held at dispatch because of power management",
>> +        "MetricExpr": "PM_DISP_STALL_HELD_HALT_CYC / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "CPI",
>> +        "MetricName": "DISPATCHED_HELD_HALT_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of flushes per completed instruction",
>> +        "MetricExpr": "PM_FLUSH / PM_RUN_INST_CMPL * 100",
>> +        "MetricGroup": "Others",
>> +        "MetricName": "FLUSH_RATE",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of flushes due to a branch mispredict per instruction",
>> +        "MetricExpr": "PM_FLUSH_MPRED / PM_RUN_INST_CMPL * 100",
>> +        "MetricGroup": "Others",
>> +        "MetricName": "BR_MPRED_FLUSH_RATE",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of branch mispredictions per completed instruction",
>> +        "MetricExpr": "PM_BR_MPRED_CMPL / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "Others",
>> +        "MetricName": "BRANCH_MISPREDICTION_RATE"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of finished loads that missed in the L1",
>> +        "MetricExpr": "PM_LD_MISS_L1 / PM_LD_REF_L1 * 100",
>> +        "MetricGroup": "Others",
>> +        "MetricName": "L1_LD_MISS_RATIO",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of completed instructions that were loads that missed the L1",
>> +        "MetricExpr": "PM_LD_MISS_L1 / PM_RUN_INST_CMPL * 100",
>> +        "MetricGroup": "Others",
>> +        "MetricName": "L1_LD_MISS_RATE",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of instructions when the DPTEG required for the load/store instruction in execution was missing from the TLB",
>> +        "MetricExpr": "PM_DTLB_MISS / PM_RUN_INST_CMPL * 100",
>> +        "MetricGroup": "Others",
>> +        "MetricName": "DTLB_MISS_RATE",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Average number of instruction dispatched per instruction completed",
> 
> s/instruction/instrucions/
> 
>> +        "MetricExpr": "PM_INST_DISP / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "General",
>> +        "MetricName": "DISPATCH_PER_INST_CMPL"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of completed instructions that were a demand load that did not hit in the L1 or L2",
>> +        "MetricExpr": "PM_DATA_FROM_L2MISS / PM_RUN_INST_CMPL * 100",
>> +        "MetricGroup": "General",
>> +        "MetricName": "L2_LD_MISS_RATE",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of completed instructions that were demand fetches that missed the L1 instruction cache",
>> +        "MetricExpr": "PM_L1_ICACHE_MISS / PM_RUN_INST_CMPL * 100",
>> +        "MetricGroup": "Instruction_Misses",
>> +        "MetricName": "L1_INST_MISS_RATE",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of completed instructions that were demand fetches that reloaded from beyond the L3 instruction cache",
>> +        "MetricExpr": "PM_INST_FROM_L3MISS / PM_RUN_INST_CMPL * 100",
>> +        "MetricGroup": "General",
>> +        "MetricName": "L3_INST_MISS_RATE",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Average number of completed instructions per cycle",
>> +        "MetricExpr": "PM_INST_CMPL / PM_CYC",
>> +        "MetricGroup": "General",
>> +        "MetricName": "IPC"
>> +    },
>> +    {
>> +        "BriefDescription": "Average number of cycles per completed instruction group",
>> +        "MetricExpr": "PM_CYC / PM_1PLUS_PPC_CMPL",
>> +        "MetricGroup": "General",
>> +        "MetricName": "CYCLES_PER_COMPLETED_INSTRUCTIONS_SET"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of cycles when at least 1 instruction dispatched",
>> +        "MetricExpr": "PM_1PLUS_PPC_DISP / PM_RUN_CYC * 100",
>> +        "MetricGroup": "General",
>> +        "MetricName": "CYCLES_ATLEAST_ONE_INST_DISPATCHED",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Rate of finished loads per completed instruction",
> 
> Most similar "rate" metrics are using the phrase "average number of".
> Do we want to use that here as well?  (Applies to all "rate" metrics.)
> 
>> +        "MetricExpr": "PM_LD_REF_L1 / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "General",
>> +        "MetricName": "LOADS_PER_INST"
>> +    },
>> +    {
>> +        "BriefDescription": "Rate of finished stores per completed instruction",
>> +        "MetricExpr": "PM_ST_FIN / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "General",
>> +        "MetricName": "STORES_PER_INST"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of demand loads that reloaded from beyond the L2 per completed instruction",
>> +        "MetricExpr": "PM_DATA_FROM_L2MISS / PM_RUN_INST_CMPL * 100",
>> +        "MetricGroup": "dL1_Reloads",
>> +        "MetricName": "DL1_RELOAD_FROM_L2_MISS_RATE",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of demand loads that reloaded from beyond the L3 per completed instruction",
>> +        "MetricExpr": "PM_DATA_FROM_L3MISS / PM_RUN_INST_CMPL * 100",
>> +        "MetricGroup": "dL1_Reloads",
>> +        "MetricName": "DL1_RELOAD_FROM_L3_MISS_RATE",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of DERAT misses with 4k page size per completed run instruction",
> 
> When PM_RUN_INST_CMPL is used, sometimes we say "run instruction",
> and sometimes we say "completed instruction".  Let's pick one.
> 
>> +        "MetricExpr": "PM_DERAT_MISS_4K / PM_RUN_INST_CMPL * 100",
>> +        "MetricGroup": "Translation",
>> +        "MetricName": "DERAT_4K_MISS_RATE",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of DERAT misses with 64k page size per completed run instruction",
>> +        "MetricExpr": "PM_DERAT_MISS_64K / PM_RUN_INST_CMPL * 100",
>> +        "MetricGroup": "Translation",
>> +        "MetricName": "DERAT_64K_MISS_RATE",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Average number of run cycles per completed run instruction",
> 
> Here we cover our bases and say "completed run instruction". ;-)
> Let's convert this one to whichever phrase is chosen for PM_RUN_INST_CMPL.
> Seen below, too.
> 
>> +        "MetricExpr": "PM_RUN_CYC / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "General",
>> +        "MetricName": "RUN_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Total number of run cycles",
>> +        "MetricExpr": "PM_RUN_CYC",
> 
> Isn't this more an event than a metric?
> Does it need to be included here?
> 
>> +        "MetricGroup": "General",
>> +        "MetricName": "TOTAL_RUN_CYCLES"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of DERAT misses per completed run instruction",
>> +        "MetricExpr": "PM_DERAT_MISS / PM_RUN_INST_CMPL * 100",
>> +        "MetricGroup": "Translation",
>> +        "MetricName": "DERAT_MISS_RATE",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Average number of completed run instructions per run cycle",
>> +        "MetricExpr": "PM_RUN_INST_CMPL / PM_RUN_CYC",
>> +        "MetricGroup": "General",
>> +        "MetricName": "RUN_IPC"
>> +    },
>> +    {
>> +        "BriefDescription": "Average number of instruction completed per instruction group",
> 
> s/instruction/instructions/
> 
>> +        "MetricExpr": "PM_RUN_INST_CMPL / PM_1PLUS_PPC_CMPL",
>> +        "MetricGroup": "General",
>> +        "MetricName": "AVERAGE_COMPLETED_INSTRUCTION_SET_SIZE"
>> +    },
>> +    {
>> +        "BriefDescription": "Rate of finished instructions per completed instructions",
> 
> 
>> +        "MetricExpr": "PM_INST_FIN / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "General",
>> +        "MetricName": "INST_FIN_PER_CMPL"
>> +    },
>> +    {
>> +        "BriefDescription": "Average cycles per instruction when the ntf instruction is completing and the finish was overlooked",
> 
> s/ntf/NTF/
> "overlooked" seems like an odd term.
> 
>> +        "MetricExpr": "PM_EXEC_STALL_UNKNOWN / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "General",
>> +        "MetricName": "EXEC_STALL_UNKOWN_CPI"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of finished branches that were taken",
>> +        "MetricExpr": "PM_BR_TAKEN_CMPL / PM_BR_FIN * 100",
>> +        "MetricGroup": "General",
>> +        "MetricName": "TAKEN_BRANCHES",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of completed instructions that were a demand load that did not hit in the L1, L2, or the L3",
>> +        "MetricExpr": "PM_DATA_FROM_L3MISS / PM_RUN_INST_CMPL * 100",
>> +        "MetricGroup": "General",
>> +        "MetricName": "L3_LD_MISS_RATE",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Rate of finished branches per completed instruction",
>> +        "MetricExpr": "PM_BR_FIN / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "General",
>> +        "MetricName": "BRANCHES_PER_INST"
>> +    },
>> +    {
>> +        "BriefDescription": "Rate of instructions finished in the LSU per completed instruction",
>> +        "MetricExpr": "PM_LSU_FIN / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "General",
>> +        "MetricName": "LSU_PER_INST"
>> +    },
>> +    {
>> +        "BriefDescription": "Rate of instructions finished in the VSU per completed instruction",
>> +        "MetricExpr": "PM_VSU_FIN / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "General",
>> +        "MetricName": "VSU_PER_INST"
>> +    },
>> +    {
>> +        "BriefDescription": "Rate of TLBIE instructions finished in the LSU per completed instruction",
>> +        "MetricExpr": "PM_TLBIE_FIN / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "General",
>> +        "MetricName": "TLBIE_PER_INST"
>> +    },
>> +    {
>> +        "BriefDescription": "Rate of STCX instructions finshed per completed instruction",
>> +        "MetricExpr": "PM_STCX_FIN / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "General",
>> +        "MetricName": "STXC_PER_INST"
>> +    },
>> +    {
>> +        "BriefDescription": "Rate of LARX instructions finshed per completed instruction",
>> +        "MetricExpr": "PM_LARX_FIN / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "General",
>> +        "MetricName": "LARX_PER_INST"
>> +    },
>> +    {
>> +        "BriefDescription": "Rate of ptesync instructions finshed per completed instruction",
>> +        "MetricExpr": "PM_PTESYNC_FIN / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "General",
>> +        "MetricName": "PTESYNC_PER_INST"
>> +    },
>> +    {
>> +        "BriefDescription": "Rate of simple fixed-point instructions finshed in the store unit per completed instruction",
> 
> s/store unit/LSU/ ?
> 
>> +        "MetricExpr": "PM_FX_LSU_FIN / PM_RUN_INST_CMPL",
>> +        "MetricGroup": "General",
>> +        "MetricName": "FX_PER_INST"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of demand load misses that reloaded the L1 cache",
>> +        "MetricExpr": "PM_LD_DEMAND_MISS_L1 / PM_LD_MISS_L1 * 100",
>> +        "MetricGroup": "General",
>> +        "MetricName": "DL1_MISS_RELOADS",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of demand load misses that reloaded from beyond the local L2",
>> +        "MetricExpr": "PM_DATA_FROM_L2MISS / PM_LD_DEMAND_MISS_L1 * 100",
>> +        "MetricGroup": "dL1_Reloads",
>> +        "MetricName": "DL1_RELOAD_FROM_L2_MISS",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of demand load misses that reloaded from beyond the local L3",
>> +        "MetricExpr": "PM_DATA_FROM_L3MISS / PM_LD_DEMAND_MISS_L1 * 100",
>> +        "MetricGroup": "dL1_Reloads",
>> +        "MetricName": "DL1_RELOAD_FROM_L3_MISS",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of cycles stalled due to the ntc instruction waiting for a load miss to resolve from a source beyond the local L2 and local L3",
>> +        "MetricExpr": "DMISS_L3MISS_STALL_CPI / RUN_CPI * 100",
>> +        "MetricGroup": "General",
>> +        "MetricName": "DCACHE_MISS_CPI",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of DERAT misses with 2M page size per completed run instruction",
>> +        "MetricExpr": "PM_DERAT_MISS_2M / PM_RUN_INST_CMPL * 100",
>> +        "MetricGroup": "Translation",
>> +        "MetricName": "DERAT_2M_MISS_RATE",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of DERAT misses with 16M page size per completed run instruction",
>> +        "MetricExpr": "PM_DERAT_MISS_16M / PM_RUN_INST_CMPL * 100",
>> +        "MetricGroup": "Translation",
>> +        "MetricName": "DERAT_16M_MISS_RATE",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "DERAT miss ratio for 4K page size",
>> +        "MetricExpr": "PM_DERAT_MISS_4K / PM_DERAT_MISS",
>> +        "MetricGroup": "Translation",
>> +        "MetricName": "DERAT_4K_MISS_RATIO"
>> +    },
>> +    {
>> +        "BriefDescription": "DERAT miss ratio for 2M page size",
>> +        "MetricExpr": "PM_DERAT_MISS_2M / PM_DERAT_MISS",
>> +        "MetricGroup": "Translation",
>> +        "MetricName": "DERAT_2M_MISS_RATIO"
>> +    },
>> +    {
>> +        "BriefDescription": "DERAT miss ratio for 16M page size",
>> +        "MetricExpr": "PM_DERAT_MISS_16M / PM_DERAT_MISS",
>> +        "MetricGroup": "Translation",
>> +        "MetricName": "DERAT_16M_MISS_RATIO"
>> +    },
>> +    {
>> +        "BriefDescription": "DERAT miss ratio for 64K page size",
>> +        "MetricExpr": "PM_DERAT_MISS_64K / PM_DERAT_MISS",
>> +        "MetricGroup": "Translation",
>> +        "MetricName": "DERAT_64K_MISS_RATIO"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of DERAT misses that resulted in TLB reloads",
>> +        "MetricExpr": "PM_DTLB_MISS / PM_DERAT_MISS * 100",
>> +        "MetricGroup": "Translation",
>> +        "MetricName": "DERAT_MISS_RELOAD",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of ICache misses that were reloaded from beyond the local L3",
> 
> Sometimes we use "ICache" and sometimes "icache".  Pick one.
> 
>> +        "MetricExpr": "PM_INST_FROM_L3MISS / PM_L1_ICACHE_MISS * 100",
>> +        "MetricGroup": "Instruction_Misses",
>> +        "MetricName": "INST_FROM_L3_MISS",
>> +        "ScaleUnit": "1%"
>> +    },
>> +    {
>> +        "BriefDescription": "Percentage of ICache reloads from the beyond the L3 per completed run instruction",
>> +        "MetricExpr": "PM_INST_FROM_L3MISS / PM_RUN_INST_CMPL * 100",
>> +        "MetricGroup": "Instruction_Misses",
>> +        "MetricName": "INST_FROM_L3_MISS_RATE",
>> +        "ScaleUnit": "1%"
>> +    }
>> +]
> 
> PC
> 
