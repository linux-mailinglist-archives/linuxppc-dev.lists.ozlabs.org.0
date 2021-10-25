Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 603FA43959A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 14:07:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdDHF206Dz2ywF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 23:07:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fsflpo8P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=pc@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Fsflpo8P; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdDGR0Wx0z2xYL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 23:07:10 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PBFxeL001648; 
 Mon, 25 Oct 2021 12:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=lKwuexbCo0YzUpQPh19WwEWipQF6K/BFsyU90xbkzdY=;
 b=Fsflpo8PFlh94c3JurJ+fbujC9PFgO86rqUDdzbflvuZslq3AwWb3XEseCRQPGhpg9eT
 98aIdVI5t9QH50rqUVElg3uvd2cJNsHEogf7b9cpwvqepDhTyTl2TT/uwN6uVTej0Afn
 LiHMC7tZgO/sUtIOuEClAshd4j5PZT0UEY4jthYUa1zmdYODLGUBXHuGtC//XpaAg8iR
 pie4z72RLCrHUH5jvSE0fyHo69EGkCoJ9cMrR5Vk8Cop0LkX7/3CeGdG2kCyigvvKJe9
 GiVX/HHUFJViVasgG+r0EU8qKF5un6DIt27Yil2zr5wmgO5eE8TtNVwHhSQs6ihMZ/wj cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bwt1vuj3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 12:07:06 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19PBNM1W026582;
 Mon, 25 Oct 2021 12:07:05 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bwt1vuj37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 12:07:05 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19PBwjFM023403;
 Mon, 25 Oct 2021 12:07:04 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 3bva1a3fa0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 12:07:04 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19PC72FP52363680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 12:07:03 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B69F06A047;
 Mon, 25 Oct 2021 12:07:02 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E10E6A05D;
 Mon, 25 Oct 2021 12:07:01 +0000 (GMT)
Received: from li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com (unknown
 [9.160.64.204])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 25 Oct 2021 12:07:00 +0000 (GMT)
Date: Mon, 25 Oct 2021 07:06:58 -0500
From: "Paul A. Clarke" <pc@us.ibm.com>
To: Michael Ellerman <michaele@au1.ibm.com>
Subject: Re: [PATCH v2] perf vendor events power10: Add metric events json
 file for power10 platform
Message-ID: <20211025120658.GD104437@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
References: <20211022062505.78767-1-kjain@linux.ibm.com>
 <20211022144910.GC104437@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
 <87wnm1bxek.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wnm1bxek.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GcRuw0Cni0hSEl0jrrY41gjnxF9HIiuJ
X-Proofpoint-GUID: 3GRk1k8MpFHjT4Me36fL2KXRPpSpDCkH
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_04,2021-10-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110250075
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
 Kajol Jain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com,
 jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 25, 2021 at 02:23:15PM +1100, Michael Ellerman wrote:
> "Paul A. Clarke" <pc@us.ibm.com> writes:
> > Thanks for the changes!
> > More nits below (many left over from prior review)...
> >
> > On Fri, Oct 22, 2021 at 11:55:05AM +0530, Kajol Jain wrote:
> >> Add pmu metric json file for power10 platform.
> >> 
> >> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> >> ---
> >> Changelog v1 -> v2:
> >> - Did some nit changes in BriefDescription field
> >>   as suggested by Paul A. Clarke
> >> 
> >> - Link to the v1 patch: https://lkml.org/lkml/2021/10/6/131
> >> 
> >>  .../arch/powerpc/power10/metrics.json         | 676 ++++++++++++++++++
> >>  1 file changed, 676 insertions(+)
> >>  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/metrics.json
> >> 
> >> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
> >> new file mode 100644
> >> index 000000000000..8adab5cd9934
> >> --- /dev/null
> >> +++ b/tools/perf/pmu-events/arch/powerpc/power10/metrics.json
> >> @@ -0,0 +1,676 @@
> >> +[
> >> +    {
> >> +        "BriefDescription": "Percentage of cycles that are run cycles",
> >> +        "MetricExpr": "PM_RUN_CYC / PM_CYC * 100",
> >> +        "MetricGroup": "General",
> >> +        "MetricName": "RUN_CYCLES_RATE",
> >> +        "ScaleUnit": "1%"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per completed instruction",
> >> +        "MetricExpr": "PM_CYC / PM_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "CYCLES_PER_INSTRUCTION"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled for any reason",
> >> +        "MetricExpr": "PM_DISP_STALL_CYC / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled because there was a flush",
> >> +        "MetricExpr": "PM_DISP_STALL_FLUSH / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_FLUSH_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled because the MMU was handling a translation miss",
> >> +        "MetricExpr": "PM_DISP_STALL_TRANSLATION / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_TRANSLATION_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled waiting to resolve an instruction ERAT miss",
> >> +        "MetricExpr": "PM_DISP_STALL_IERAT_ONLY_MISS / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_IERAT_ONLY_MISS_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled waiting to resolve an instruction TLB miss",
> >> +        "MetricExpr": "PM_DISP_STALL_ITLB_MISS / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_ITLB_MISS_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled due to an icache miss",
> >> +        "MetricExpr": "PM_DISP_STALL_IC_MISS / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_IC_MISS_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while the instruction was fetched from the local L2",
> >> +        "MetricExpr": "PM_DISP_STALL_IC_L2 / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_IC_L2_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while the instruction was fetched from the local L3",
> >> +        "MetricExpr": "PM_DISP_STALL_IC_L3 / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_IC_L3_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while the instruction was fetched from any source beyond the local L3",
> >> +        "MetricExpr": "PM_DISP_STALL_IC_L3MISS / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_IC_L3MISS_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled due to an icache miss after a branch mispredict",
> >> +        "MetricExpr": "PM_DISP_STALL_BR_MPRED_ICMISS / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_BR_MPRED_ICMISS_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while instruction was fetched from the local L2 after suffering a branch mispredict",
> >> +        "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L2 / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_BR_MPRED_IC_L2_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while instruction was fetched from the local L3 after suffering a branch mispredict",
> >> +        "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L3 / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_BR_MPRED_IC_L3_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled while instruction was fetched from any source beyond the local L3 after suffering a branch mispredict",
> >> +        "MetricExpr": "PM_DISP_STALL_BR_MPRED_IC_L3MISS / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_BR_MPRED_IC_L3MISS_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled due to a branch mispredict",
> >> +        "MetricExpr": "PM_DISP_STALL_BR_MPRED / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_BR_MPRED_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch for any reason",
> >> +        "MetricExpr": "PM_DISP_STALL_HELD_CYC / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_HELD_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch because of a synchronizing instruction that requires the ICT to be empty before dispatch",
> >> +        "MetricExpr": "PM_DISP_STALL_HELD_SYNC_CYC / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISP_HELD_STALL_SYNC_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch while waiting on the scoreboard",
> >> +        "MetricExpr": "PM_DISP_STALL_HELD_SCOREBOARD_CYC / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISP_HELD_STALL_SCOREBOARD_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch due to issue queue full",
> >> +        "MetricExpr": "PM_DISP_STALL_HELD_ISSQ_FULL_CYC / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISP_HELD_STALL_ISSQ_FULL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch because the mapper/SRB was full",
> >> +        "MetricExpr": "PM_DISP_STALL_HELD_RENAME_CYC / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_HELD_RENAME_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch because the STF mapper/SRB was full",
> >> +        "MetricExpr": "PM_DISP_STALL_HELD_STF_MAPPER_CYC / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_HELD_STF_MAPPER_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch because the XVFC mapper/SRB was full",
> >> +        "MetricExpr": "PM_DISP_STALL_HELD_XVFC_MAPPER_CYC / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_HELD_XVFC_MAPPER_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch for any other reason",
> >> +        "MetricExpr": "PM_DISP_STALL_HELD_OTHER_CYC / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_HELD_OTHER_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction has been dispatched but not issued for any reason",
> >> +        "MetricExpr": "PM_ISSUE_STALL / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "ISSUE_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting to be finished in one of the execution units",
> >> +        "MetricExpr": "PM_EXEC_STALL / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "EXECUTION_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction spent executing an NTC instruction that gets flushed some time after dispatch",
> >> +        "MetricExpr": "PM_EXEC_STALL_NTC_FLUSH / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "NTC_FLUSH_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTF instruction finishes at dispatch",
> >> +        "MetricExpr": "PM_EXEC_STALL_FIN_AT_DISP / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "FIN_AT_DISP_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is executing in the branch unit",
> >> +        "MetricExpr": "PM_EXEC_STALL_BRU / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "BRU_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is a simple fixed point instruction that is executing in the LSU",
> >> +        "MetricExpr": "PM_EXEC_STALL_SIMPLE_FX / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "SIMPLE_FX_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is executing in the VSU",
> >> +        "MetricExpr": "PM_EXEC_STALL_VSU / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "VSU_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting to be finished in one of the execution units",
> >> +        "MetricExpr": "PM_EXEC_STALL_TRANSLATION / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "TRANSLATION_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is a load or store that suffered a translation miss",
> >> +        "MetricExpr": "PM_EXEC_STALL_DERAT_ONLY_MISS / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DERAT_ONLY_MISS_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is recovering from a TLB miss",
> >> +        "MetricExpr": "PM_EXEC_STALL_DERAT_DTLB_MISS / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DERAT_DTLB_MISS_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is executing in the LSU",
> >> +        "MetricExpr": "PM_EXEC_STALL_LSU / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "LSU_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is a load that is executing in the LSU",
> >> +        "MetricExpr": "PM_EXEC_STALL_LOAD / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "LOAD_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting for a load miss to resolve from either the local L2 or local L3",
> >> +        "MetricExpr": "PM_EXEC_STALL_DMISS_L2L3 / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DMISS_L2L3_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting for a load miss to resolve from either the local L2 or local L3, with an RC dispatch conflict",
> >> +        "MetricExpr": "PM_EXEC_STALL_DMISS_L2L3_CONFLICT / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DMISS_L2L3_CONFLICT_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting for a load miss to resolve from either the local L2 or local L3, without an RC dispatch conflict",
> >> +        "MetricExpr": "PM_EXEC_STALL_DMISS_L2L3_NOCONFLICT / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DMISS_L2L3_NOCONFLICT_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting for a load miss to resolve from a source beyond the local L2 and local L3",
> >> +        "MetricExpr": "PM_EXEC_STALL_DMISS_L3MISS / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DMISS_L3MISS_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting for a load miss to resolve from a neighbor chiplet's L2 or L3 in the same chip",
> >> +        "MetricExpr": "PM_EXEC_STALL_DMISS_L21_L31 / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DMISS_L21_L31_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting for a load miss to resolve from L4, local memory or OpenCapp chip",
> >
> > What is "OpenCapp"?  Is is different from OpenCAPI?
> >
> >> +        "MetricExpr": "PM_EXEC_STALL_DMISS_LMEM / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DMISS_LMEM_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting for a load miss to resolve from a remote chip (cache, L4, memory or OpenCapp) in the same group",
> >> +        "MetricExpr": "PM_EXEC_STALL_DMISS_OFF_CHIP / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DMISS_OFF_CHIP_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is waiting for a load miss to resolve from a distant chip (cache, L4, memory or OpenCapp chip)",
> >> +        "MetricExpr": "PM_EXEC_STALL_DMISS_OFF_NODE / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DMISS_OFF_NODE_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is executing a TLBIEL instruction",
> >> +        "MetricExpr": "PM_EXEC_STALL_TLBIEL / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "TLBIEL_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is finishing a load after its data has been reloaded from a data source beyond the local L1, OR when the LSU is processing an L1-hit, OR when the NTF instruction merged with another load in the LMQ",
> >> +        "MetricExpr": "PM_EXEC_STALL_LOAD_FINISH / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "LOAD_FINISH_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is a store that is executing in the LSU",
> >> +        "MetricExpr": "PM_EXEC_STALL_STORE / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "STORE_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is in the store unit outside of handling store misses or other special store operations",
> >
> > Is "store unit" not the same as "LSU" ?  Use "LSU" uniformly if appropriate:
> > s/store unit/LSU/
> >
> >> +        "MetricExpr": "PM_EXEC_STALL_STORE_PIPE / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "STORE_PIPE_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is a store whose cache line was not resident in the L1 and had to wait for allocation of the missing line into the L1",
> >> +        "MetricExpr": "PM_EXEC_STALL_STORE_MISS / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "STORE_MISS_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is a TLBIE instruction waiting for a response from the L2",
> >> +        "MetricExpr": "PM_EXEC_STALL_TLBIE / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "TLBIE_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is executing a PTESYNC instruction",
> >> +        "MetricExpr": "PM_EXEC_STALL_PTESYNC / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "PTESYNC_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction cannot complete because the thread was blocked",
> >> +        "MetricExpr": "PM_CMPL_STALL / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "COMPLETION_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction cannot complete because it was interrupted by ANY exception",
> >> +        "MetricExpr": "PM_CMPL_STALL_EXCEPTION / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "EXCEPTION_COMPLETION_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is stuck at finish waiting for the non-speculative finish of either a STCX instruction waiting for its result or a load waiting for non-critical sectors of data and ECC",
> >> +        "MetricExpr": "PM_CMPL_STALL_MEM_ECC / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "MEM_ECC_COMPLETION_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction cannot complete the instruction is a STCX instruction waiting for resolution from the nest",
> >
> > Need to reword this, I think.  I propose "Average cycles per instruction
> > when the NTC instruction is a STCX instruction waiting for resolution
> > from the nest", which follows the form used by HWSYNC_COMPLETION_STALL_CPI,
> > below.
> >
> >> +        "MetricExpr": "PM_CMPL_STALL_STCX / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "STCX_COMPLETION_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is a LWSYNC instruction waiting to complete",
> >> +        "MetricExpr": "PM_CMPL_STALL_LWSYNC / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "LWSYNC_COMPLETION_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction is a HWSYNC instruction stuck at finish waiting for a response from the L2",
> >> +        "MetricExpr": "PM_CMPL_STALL_HWSYNC / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "HWSYNC_COMPLETION_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction required special handling before completion",
> >> +        "MetricExpr": "PM_CMPL_STALL_SPECIAL / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "SPECIAL_COMPLETION_STALL_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when dispatch was stalled because fetch was being held, so there was nothing in the pipeline for this thread",
> >> +        "MetricExpr": "PM_DISP_STALL_FETCH / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_FETCH_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average cycles per instruction when the NTC instruction was held at dispatch because of power management",
> >> +        "MetricExpr": "PM_DISP_STALL_HELD_HALT_CYC / PM_RUN_INST_CMPL",
> >> +        "MetricGroup": "CPI",
> >> +        "MetricName": "DISPATCHED_HELD_HALT_CPI"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Percentage of flushes per completed run instruction",
> >
> > s/per completed run instruction/per instruction/
> 
> I'm not sure we want to drop "completed" from this and all the following
> descriptions.
> 
> There is a meaningful distinction between completed and dispatched
> instructions, I think it's useful to be explicit about which the event
> is counting.
> 
> I agree dropping "run" is a good idea, most people won't understand that
> "run" means "non-idle", and I think don't expect idle instructions to be
> counted anyway.
> 
> ...
> >
> >> +        "MetricExpr": "PM_RUN_INST_CMPL / PM_RUN_CYC",
> >> +        "MetricGroup": "General",
> >> +        "MetricName": "RUN_IPC"
> >> +    },
> >> +    {
> >> +        "BriefDescription": "Average number of instructions completed per instruction group",
> >
> > s/completed//
> 
> And here the meaning is different if you drop "completed".

All fair comments.  I am looking for consistency, but correctness trumps.

Regarding consistency, though, there are lots of occurences like:
|        "BriefDescription": "Average cycles per instruction when dispatch was stalled for any reason",
|        "MetricExpr": "PM_DISP_STALL_CYC / PM_RUN_INST_CMPL",

Can we pick one phrase for all metrics where PM_RUN_INST_CMPL is used,
perhaps?  "completed instructions" ?

PC
