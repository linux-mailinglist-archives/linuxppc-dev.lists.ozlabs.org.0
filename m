Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C9B43DD66
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 11:05:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg05q1RvWz2yb5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 20:05:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tDD2C5fx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tDD2C5fx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg0506QK9z2yMN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 20:05:07 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19S8leaL011007; 
 Thu, 28 Oct 2021 09:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=a3c4YN4et8yYFbgc2IE2NajpFWoLg5ygdpnGnHAQyqs=;
 b=tDD2C5fx95/JCmBRRWMwToZTONlxMPhG0jPvliZ6xqVi8j78Q64pLBjvpQVUQPdrI7b5
 YI10VdxEc46HxqVw8oZEDcWWOBpXfCJBgDCEwGi3VTIlgJHYKkbR3UKN4+DZo53BzZug
 +WQG3FiT1jAgFNa5VFFC6jlCkJnRX7tX3kxCDph7FvkukqSrIdgKrKizGYBAtwtVVEga
 24vYMpqHfPMgb2lWmUKlksjoS5MeSQl1oXHCC/OSQi2nb0gHtvqKaSsYwO6Fo7k/fIo7
 DnQjcXg59LAWeGhu1zsdnDK98Ap7V31pL81OzxZ1zw+xkdhtJ7hRD19d4MydckPRfnTR eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3byrnt0bgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 09:05:02 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19S8nOiV015826;
 Thu, 28 Oct 2021 09:05:02 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3byrnt0bg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 09:05:01 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19S8x8Z8004594;
 Thu, 28 Oct 2021 09:05:00 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3bx4f2nvd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 09:04:59 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19S94vre51380708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 09:04:57 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B67B42042;
 Thu, 28 Oct 2021 09:04:57 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BC3D42049;
 Thu, 28 Oct 2021 09:04:53 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com (unknown
 [9.43.1.109]) by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Oct 2021 09:04:53 +0000 (GMT)
Subject: Re: [PATCH v2] perf vendor events power10: Add metric events json
 file for power10 platform
From: kajoljain <kjain@linux.ibm.com>
To: "Paul A. Clarke" <pc@us.ibm.com>
References: <20211022062505.78767-1-kjain@linux.ibm.com>
 <20211022144910.GC104437@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
 <31576d89-583a-dd56-056f-58784184c8b7@linux.ibm.com>
Message-ID: <0c0a7202-0c0f-dc80-f21c-354cb31ca43f@linux.ibm.com>
Date: Thu, 28 Oct 2021 14:34:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <31576d89-583a-dd56-056f-58784184c8b7@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kNvdHYzOG_IvwnleVcuz81M4Fo1vahc_
X-Proofpoint-ORIG-GUID: sg-FpGRPkpQeNkF1dtxD8wOL5lfLv2j5
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_01,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280048
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com,
 jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/26/21 3:28 PM, kajoljain wrote:
> 
> 
> On 10/22/21 8:19 PM, Paul A. Clarke wrote:
>> Thanks for the changes!
>> More nits below (many left over from prior review)...
>>
>> On Fri, Oct 22, 2021 at 11:55:05AM +0530, Kajol Jain wrote:
>>> Add pmu metric json file for power10 platform.
>>>
>>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>>> ---
>>> Changelog v1 -> v2:
>>> - Did some nit changes in BriefDescription field
>>>   as suggested by Paul A. Clarke
>>>
>>> - Link to the v1 patch: https://lkml.org/lkml/2021/10/6/131
>>>
>>>  .../arch/powerpc/power10/metrics.json         | 676 ++++++++++++++++++
>>>  1 file changed, 676 insertions(+)
>>>  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/metrics.json
>>>
>>> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
>>> new file mode 100644
>>> index 000000000000..8adab5cd9934
>>> --- /dev/null
>>> +++ b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
>>> @@ -0,0 +1,676 @@
>>> +[
>>> +    {
>>> +        "BriefDescription": "Percentage of cycles that are run cycles",
>>> +        "MetricExpr": "PM_RUN_CYC / PM_CYC * 100",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "RUN_CYCLES_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per completed instruction",
>>> +        "MetricExpr": "PM_CYC / PM_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "CYCLES_PER_INSTRUCTION"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled for any reason",
>>> +        "MetricExpr": "PM_DISP_STALL_CYC / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled because there was a flush",
>>> +        "MetricExpr": "PM_DISP_STALL_FLUSH / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_FLUSH_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled because the MMU was handling a translation miss",
>>> +        "MetricExpr": "PM_DISP_STALL_TRANSLATION / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_TRANSLATION_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled waiting to resolve an instruction ERAT miss",
>>> +        "MetricExpr": "PM_DISP_STALL_IERAT_ONLY_MISS / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_IERAT_ONLY_MISS_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled waiting to resolve an instruction TLB miss",
>>> +        "MetricExpr": "PM_DISP_STALL_ITLB_MISS / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_ITLB_MISS_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled due to an icache miss",
>>> +        "MetricExpr": "PM_DISP_STALL_IC_MISS / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_IC_MISS_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while the instruction was fetched from the local L2",
>>> +        "MetricExpr": "PM_DISP_STALL_IC_L2 / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_IC_L2_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while the instruction was fetched from the local L3",
>>> +        "MetricExpr": "PM_DISP_STALL_IC_L3 / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_IC_L3_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while the instruction was fetched from any source beyond the local L3",
>>> +        "MetricExpr": "PM_DISP_STALL_IC_L3MISS / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_IC_L3MISS_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled due to an icache miss after a branch mispredict",
>>> +        "MetricExpr": "PM_DISP_STALL_BR_MPRED_ICMISS / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_BR_MPRED_ICMISS_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while instruction was fetched from the local L2 after suffering a branch mispredict",
>>> +        "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L2 / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_BR_MPRED_IC_L2_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while instruction was fetched from the local L3 after suffering a branch mispredict",
>>> +        "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L3 / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_BR_MPRED_IC_L3_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while instruction was fetched from any source beyond the local L3 after suffering a branch mispredict",
>>> +        "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L3MISS / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_BR_MPRED_IC_L3MISS_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled due to a branch mispredict",
>>> +        "MetricExpr": "PM_DISP_STALL_BR_MPRED / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_BR_MPRED_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch for any reason",
>>> +        "MetricExpr": "PM_DISP_STALL_HELD_CYC / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_HELD_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch because of a synchronizing instruction that requires the ICT to be empty before dispatch",
>>> +        "MetricExpr": "PM_DISP_STALL_HELD_SYNC_CYC / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISP_HELD_STALL_SYNC_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch while waiting on the scoreboard",
>>> +        "MetricExpr": "PM_DISP_STALL_HELD_SCOREBOARD_CYC / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISP_HELD_STALL_SCOREBOARD_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch due to issue queue full",
>>> +        "MetricExpr": "PM_DISP_STALL_HELD_ISSQ_FULL_CYC / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISP_HELD_STALL_ISSQ_FULL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch because the mapper/SRB was full",
>>> +        "MetricExpr": "PM_DISP_STALL_HELD_RENAME_CYC / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_HELD_RENAME_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch because the STF mapper/SRB was full",
>>> +        "MetricExpr": "PM_DISP_STALL_HELD_STF_MAPPER_CYC / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_HELD_STF_MAPPER_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch because the XVFC mapper/SRB was full",
>>> +        "MetricExpr": "PM_DISP_STALL_HELD_XVFC_MAPPER_CYC / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_HELD_XVFC_MAPPER_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch for any other reason",
>>> +        "MetricExpr": "PM_DISP_STALL_HELD_OTHER_CYC / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_HELD_OTHER_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction has been dispatched but not issued for any reason",
>>> +        "MetricExpr": "PM_ISSUE_STALL / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "ISSUE_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting to be finished in one of the execution units",
>>> +        "MetricExpr": "PM_EXEC_STALL / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "EXECUTION_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction spent executing an NTC instruction that gets flushed some time after dispatch",
>>> +        "MetricExpr": "PM_EXEC_STALL_NTC_FLUSH / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "NTC_FLUSH_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTF instruction finishes at dispatch",
>>> +        "MetricExpr": "PM_EXEC_STALL_FIN_AT_DISP / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "FIN_AT_DISP_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is executing in the branch unit",
>>> +        "MetricExpr": "PM_EXEC_STALL_BRU / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "BRU_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is a simple fixed point instruction that is executing in the LSU",
>>> +        "MetricExpr": "PM_EXEC_STALL_SIMPLE_FX / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "SIMPLE_FX_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is executing in the VSU",
>>> +        "MetricExpr": "PM_EXEC_STALL_VSU / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "VSU_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting to be finished in one of the execution units",
>>> +        "MetricExpr": "PM_EXEC_STALL_TRANSLATION / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "TRANSLATION_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is a load or store that suffered a translation miss",
>>> +        "MetricExpr": "PM_EXEC_STALL_DERAT_ONLY_MISS / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DERAT_ONLY_MISS_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is recovering from a TLB miss",
>>> +        "MetricExpr": "PM_EXEC_STALL_DERAT_DTLB_MISS / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DERAT_DTLB_MISS_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is executing in the LSU",
>>> +        "MetricExpr": "PM_EXEC_STALL_LSU / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "LSU_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is a load that is executing in the LSU",
>>> +        "MetricExpr": "PM_EXEC_STALL_LOAD / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "LOAD_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting for a load miss to resolve from either the local L2 or local L3",
>>> +        "MetricExpr": "PM_EXEC_STALL_DMISS_L2L3 / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DMISS_L2L3_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting for a load miss to resolve from either the local L2 or local L3, with an RC dispatch conflict",
>>> +        "MetricExpr": "PM_EXEC_STALL_DMISS_L2L3_CONFLICT / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DMISS_L2L3_CONFLICT_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting for a load miss to resolve from either the local L2 or local L3, without an RC dispatch conflict",
>>> +        "MetricExpr": "PM_EXEC_STALL_DMISS_L2L3_NOCONFLICT / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DMISS_L2L3_NOCONFLICT_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting for a load miss to resolve from a source beyond the local L2 and local L3",
>>> +        "MetricExpr": "PM_EXEC_STALL_DMISS_L3MISS / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DMISS_L3MISS_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting for a load miss to resolve from a neighbor chiplet's L2 or L3 in the same chip",
>>> +        "MetricExpr": "PM_EXEC_STALL_DMISS_L21_L31 / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DMISS_L21_L31_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting for a load miss to resolve from L4, local memory or OpenCapp chip",
>>
>> What is "OpenCapp"?  Is is different from OpenCAPI?
> 
> Hi Paul,
>     Yes, OpenCapp is same as OpenCAPI. But as these descriptions
> are provided by hardware team and same is followed in the PMU workbook.
> We need to use OpenCapp.

Hi Paul,
      I further checked with the team, using OpenCAPI make more sense.
Thanks for pointing it. Will correct it in the next version.

Thanks,
Kajol Jain

> 
>>
>>> +        "MetricExpr": "PM_EXEC_STALL_DMISS_LMEM / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DMISS_LMEM_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting for a load miss to resolve from a remote chip (cache, L4, memory or OpenCapp) in the same group",
>>> +        "MetricExpr": "PM_EXEC_STALL_DMISS_OFF_CHIP / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DMISS_OFF_CHIP_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting for a load miss to resolve from a distant chip (cache, L4, memory or OpenCapp chip)",
>>> +        "MetricExpr": "PM_EXEC_STALL_DMISS_OFF_NODE / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DMISS_OFF_NODE_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is executing a TLBIEL instruction",
>>> +        "MetricExpr": "PM_EXEC_STALL_TLBIEL / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "TLBIEL_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is finishing a load after its data has been reloaded from a data source beyond the local L1, OR when the LSU is processing an L1-hit, OR when the NTF instruction merged with another load in the LMQ",
>>> +        "MetricExpr": "PM_EXEC_STALL_LOAD_FINISH / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "LOAD_FINISH_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is a store that is executing in the LSU",
>>> +        "MetricExpr": "PM_EXEC_STALL_STORE / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "STORE_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is in the store unit outside of handling store misses or other special store operations",
>>
>> Is "store unit" not the same as "LSU" ?  Use "LSU" uniformly if appropriate:
>> s/store unit/LSU/
> 
> Here using store unit is more appropriate as we are counting
> instructions executed in the store unit of LSU.
> 
>>
>>> +        "MetricExpr": "PM_EXEC_STALL_STORE_PIPE / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "STORE_PIPE_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is a store whose cache line was not resident in the L1 and had to wait for allocation of the missing line into the L1",
>>> +        "MetricExpr": "PM_EXEC_STALL_STORE_MISS / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "STORE_MISS_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is a TLBIE instruction waiting for a response from the L2",
>>> +        "MetricExpr": "PM_EXEC_STALL_TLBIE / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "TLBIE_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is executing a PTESYNC instruction",
>>> +        "MetricExpr": "PM_EXEC_STALL_PTESYNC / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "PTESYNC_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction cannot complete because the thread was blocked",
>>> +        "MetricExpr": "PM_CMPL_STALL / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "COMPLETION_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction cannot complete because it was interrupted by ANY exception",
>>> +        "MetricExpr": "PM_CMPL_STALL_EXCEPTION / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "EXCEPTION_COMPLETION_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is stuck at finish waiting for the non-speculative finish of either a STCX instruction waiting for its result or a load waiting for non-critical sectors of data and ECC",
>>> +        "MetricExpr": "PM_CMPL_STALL_MEM_ECC / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "MEM_ECC_COMPLETION_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction cannot complete the instruction is a STCX instruction waiting for resolution from the nest",
>>
>> Need to reword this, I think.  I propose "Average cycles per instruction
>> when the NTC instruction is a STCX instruction waiting for resolution
>> from the nest", which follows the form used by HWSYNC_COMPLETION_STALL_CPI,
>> below.
> 
> Yes make sense. Will update this description.
> 
>>
>>> +        "MetricExpr": "PM_CMPL_STALL_STCX / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "STCX_COMPLETION_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is a LWSYNC instruction waiting to complete",
>>> +        "MetricExpr": "PM_CMPL_STALL_LWSYNC / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "LWSYNC_COMPLETION_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is a HWSYNC instruction stuck at finish waiting for a response from the L2",
>>> +        "MetricExpr": "PM_CMPL_STALL_HWSYNC / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "HWSYNC_COMPLETION_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction required special handling before completion",
>>> +        "MetricExpr": "PM_CMPL_STALL_SPECIAL / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "SPECIAL_COMPLETION_STALL_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled because fetch was being held, so there was nothing in the pipeline for this thread",
>>> +        "MetricExpr": "PM_DISP_STALL_FETCH / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_FETCH_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch because of power management",
>>> +        "MetricExpr": "PM_DISP_STALL_HELD_HALT_CYC / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "CPI",
>>> +        "MetricName": "DISPATCHED_HELD_HALT_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of flushes per completed run instruction",
>>
>> s/per completed run instruction/per instruction/
> 
> As discussed I will update it to completed insruction in all the below
> descriptions.
> 
>>
>>> +        "MetricExpr": "PM_FLUSH / PM_RUN_INST_CMPL * 100",
>>> +        "MetricGroup": "Others",
>>> +        "MetricName": "FLUSH_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of flushes due to a branch mispredict per instruction",
>>> +        "MetricExpr": "PM_FLUSH_MPRED / PM_RUN_INST_CMPL * 100",
>>> +        "MetricGroup": "Others",
>>> +        "MetricName": "BR_MPRED_FLUSH_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of branch mispredictions per completed run instruction",
>>
>> s/per completed run instruction/per instruction/
>>
>>> +        "MetricExpr": "PM_BR_MPRED_CMPL / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "Others",
>>> +        "MetricName": "BRANCH_MISPREDICTION_RATE"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of finished loads that missed in the L1",
>>> +        "MetricExpr": "PM_LD_MISS_L1 / PM_LD_REF_L1 * 100",
>>> +        "MetricGroup": "Others",
>>> +        "MetricName": "L1_LD_MISS_RATIO",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of completed run instructions that were loads that missed the L1",
>>
>> s/completed run instructions/instructions/
>>
>>> +        "MetricExpr": "PM_LD_MISS_L1 / PM_RUN_INST_CMPL * 100",
>>> +        "MetricGroup": "Others",
>>> +        "MetricName": "L1_LD_MISS_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of instructions when the DPTEG required for the load/store instruction in execution was missing from the TLB",
>>> +        "MetricExpr": "PM_DTLB_MISS / PM_RUN_INST_CMPL * 100",
>>> +        "MetricGroup": "Others",
>>> +        "MetricName": "DTLB_MISS_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of instructions dispatched per instruction completed",
>>> +        "MetricExpr": "PM_INST_DISP / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "DISPATCH_PER_INST_CMPL"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of completed run instructions that were a demand load that did not hit in the L1 or L2",
>>
>> s/completed run instructions/instructions/
>>
>>> +        "MetricExpr": "PM_DATA_FROM_L2MISS / PM_RUN_INST_CMPL * 100",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "L2_LD_MISS_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of completed run instructions that were demand fetches that missed the L1 instruction cache",
>>
>> s/completed run instructions/instructions/
>> s/instruction cache/icache/ to be consistent with the rest of the file
>>
>>> +        "MetricExpr": "PM_L1_ICACHE_MISS / PM_RUN_INST_CMPL * 100",
>>> +        "MetricGroup": "Instruction_Misses",
>>> +        "MetricName": "L1_INST_MISS_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of completed run instructions that were demand fetches that reloaded from beyond the L3 instruction cache",
>>
>> s/completed run instructions/instructions/
>> s/instruction cache/icache/ to be consistent with the rest of the file
> 
> Sure, I will make it icache.
> 
> Thanks,
> Kajol Jain
> 
>>
>>> +        "MetricExpr": "PM_INST_FROM_L3MISS / PM_RUN_INST_CMPL * 100",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "L3_INST_MISS_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of completed instructions per cycle",
>>> +        "MetricExpr": "PM_INST_CMPL / PM_CYC",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "IPC"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of cycles per completed instruction group",
>>> +        "MetricExpr": "PM_CYC / PM_1PLUS_PPC_CMPL",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "CYCLES_PER_COMPLETED_INSTRUCTIONS_SET"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of cycles when at least 1 instruction dispatched",
>>> +        "MetricExpr": "PM_1PLUS_PPC_DISP / PM_RUN_CYC * 100",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "CYCLES_ATLEAST_ONE_INST_DISPATCHED",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of finished loads per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_LD_REF_L1 / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "LOADS_PER_INST"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of finished stores per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_ST_FIN / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "STORES_PER_INST"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of demand loads that reloaded from beyond the L2 per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_DATA_FROM_L2MISS / PM_RUN_INST_CMPL * 100",
>>> +        "MetricGroup": "dL1_Reloads",
>>> +        "MetricName": "DL1_RELOAD_FROM_L2_MISS_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of demand loads that reloaded from beyond the L3 per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_DATA_FROM_L3MISS / PM_RUN_INST_CMPL * 100",
>>> +        "MetricGroup": "dL1_Reloads",
>>> +        "MetricName": "DL1_RELOAD_FROM_L3_MISS_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of DERAT misses with 4k page size per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_DERAT_MISS_4K / PM_RUN_INST_CMPL * 100",
>>> +        "MetricGroup": "Translation",
>>> +        "MetricName": "DERAT_4K_MISS_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of DERAT misses with 64k page size per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_DERAT_MISS_64K / PM_RUN_INST_CMPL * 100",
>>> +        "MetricGroup": "Translation",
>>> +        "MetricName": "DERAT_64K_MISS_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of run cycles per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_RUN_CYC / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "RUN_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of DERAT misses per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_DERAT_MISS / PM_RUN_INST_CMPL * 100",
>>> +        "MetricGroup": "Translation",
>>> +        "MetricName": "DERAT_MISS_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of completed run instructions per run cycle",
>>
>> s/completed run instructions/instructions/
>>
>>> +        "MetricExpr": "PM_RUN_INST_CMPL / PM_RUN_CYC",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "RUN_IPC"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of instructions completed per instruction group",
>>
>> s/completed//
>>
>>> +        "MetricExpr": "PM_RUN_INST_CMPL / PM_1PLUS_PPC_CMPL",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "AVERAGE_COMPLETED_INSTRUCTION_SET_SIZE"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of finished instructions per completed run instructions",
>>
>> s/completed run instructions/instruction/
>>
>>> +        "MetricExpr": "PM_INST_FIN / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "INST_FIN_PER_CMPL"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average cycles per instruction when the NTF instruction is completing and the finish was overlooked",
>>> +        "MetricExpr": "PM_EXEC_STALL_UNKNOWN / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "EXEC_STALL_UNKOWN_CPI"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of finished branches that were taken",
>>> +        "MetricExpr": "PM_BR_TAKEN_CMPL / PM_BR_FIN * 100",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "TAKEN_BRANCHES",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of completed run instructions that were a demand load that did not hit in the L1, L2, or the L3",
>>
>> s/completed run instructions/instructions/
>>
>>> +        "MetricExpr": "PM_DATA_FROM_L3MISS / PM_RUN_INST_CMPL * 100",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "L3_LD_MISS_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of finished branches per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_BR_FIN / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "BRANCHES_PER_INST"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of instructions finished in the LSU per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_LSU_FIN / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "LSU_PER_INST"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of instructions finished in the VSU per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_VSU_FIN / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "VSU_PER_INST"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of TLBIE instructions finished in the LSU per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_TLBIE_FIN / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "TLBIE_PER_INST"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of STCX instructions finshed per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_STCX_FIN / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "STXC_PER_INST"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of LARX instructions finshed per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_LARX_FIN / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "LARX_PER_INST"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of PTESYNC instructions finshed per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_PTESYNC_FIN / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "PTESYNC_PER_INST"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Average number of simple fixed-point instructions finshed in the store unit per completed run instruction",
>>
>> s/completed run instruction/instruction/
>> s/store unit/LSU/
>>
>>> +        "MetricExpr": "PM_FX_LSU_FIN / PM_RUN_INST_CMPL",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "FX_PER_INST"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of demand load misses that reloaded the L1 cache",
>>> +        "MetricExpr": "PM_LD_DEMAND_MISS_L1 / PM_LD_MISS_L1 * 100",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "DL1_MISS_RELOADS",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of demand load misses that reloaded from beyond the local L2",
>>> +        "MetricExpr": "PM_DATA_FROM_L2MISS / PM_LD_DEMAND_MISS_L1 * 100",
>>> +        "MetricGroup": "dL1_Reloads",
>>> +        "MetricName": "DL1_RELOAD_FROM_L2_MISS",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of demand load misses that reloaded from beyond the local L3",
>>> +        "MetricExpr": "PM_DATA_FROM_L3MISS / PM_LD_DEMAND_MISS_L1 * 100",
>>> +        "MetricGroup": "dL1_Reloads",
>>> +        "MetricName": "DL1_RELOAD_FROM_L3_MISS",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of cycles stalled due to the NTC instruction waiting for a load miss to resolve from a source beyond the local L2 and local L3",
>>> +        "MetricExpr": "DMISS_L3MISS_STALL_CPI / RUN_CPI * 100",
>>> +        "MetricGroup": "General",
>>> +        "MetricName": "DCACHE_MISS_CPI",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of DERAT misses with 2M page size per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_DERAT_MISS_2M / PM_RUN_INST_CMPL * 100",
>>> +        "MetricGroup": "Translation",
>>> +        "MetricName": "DERAT_2M_MISS_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of DERAT misses with 16M page size per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_DERAT_MISS_16M / PM_RUN_INST_CMPL * 100",
>>> +        "MetricGroup": "Translation",
>>> +        "MetricName": "DERAT_16M_MISS_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "DERAT miss ratio for 4K page size",
>>> +        "MetricExpr": "PM_DERAT_MISS_4K / PM_DERAT_MISS",
>>> +        "MetricGroup": "Translation",
>>> +        "MetricName": "DERAT_4K_MISS_RATIO"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "DERAT miss ratio for 2M page size",
>>> +        "MetricExpr": "PM_DERAT_MISS_2M / PM_DERAT_MISS",
>>> +        "MetricGroup": "Translation",
>>> +        "MetricName": "DERAT_2M_MISS_RATIO"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "DERAT miss ratio for 16M page size",
>>> +        "MetricExpr": "PM_DERAT_MISS_16M / PM_DERAT_MISS",
>>> +        "MetricGroup": "Translation",
>>> +        "MetricName": "DERAT_16M_MISS_RATIO"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "DERAT miss ratio for 64K page size",
>>> +        "MetricExpr": "PM_DERAT_MISS_64K / PM_DERAT_MISS",
>>> +        "MetricGroup": "Translation",
>>> +        "MetricName": "DERAT_64K_MISS_RATIO"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of DERAT misses that resulted in TLB reloads",
>>> +        "MetricExpr": "PM_DTLB_MISS / PM_DERAT_MISS * 100",
>>> +        "MetricGroup": "Translation",
>>> +        "MetricName": "DERAT_MISS_RELOAD",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of icache misses that were reloaded from beyond the local L3",
>>> +        "MetricExpr": "PM_INST_FROM_L3MISS / PM_L1_ICACHE_MISS * 100",
>>> +        "MetricGroup": "Instruction_Misses",
>>> +        "MetricName": "INST_FROM_L3_MISS",
>>> +        "ScaleUnit": "1%"
>>> +    },
>>> +    {
>>> +        "BriefDescription": "Percentage of icache reloads from the beyond the L3 per completed run instruction",
>>
>> s/completed run instruction/instruction/
>>
>>> +        "MetricExpr": "PM_INST_FROM_L3MISS / PM_RUN_INST_CMPL * 100",
>>> +        "MetricGroup": "Instruction_Misses",
>>> +        "MetricName": "INST_FROM_L3_MISS_RATE",
>>> +        "ScaleUnit": "1%"
>>> +    }
>>> +]
>>> -- 
>>
>> PC
>>
