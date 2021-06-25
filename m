Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C993B46CF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 17:43:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBLr349Pgz3byp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 01:43:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VM6fPR32;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VM6fPR32; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBLqT2g9Sz306P
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 01:42:44 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15PFY5Uf084958; Fri, 25 Jun 2021 11:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wdMPc13LG1nQ5x4ldpPhP+BjcpqhcjPX6vhPYW5n1To=;
 b=VM6fPR32TsLVi+QqLtCarLgk/enefL8TSgoRdLBr4UbCTb2MFfJXcrP7/EO2+9HqQ010
 GUnEUvhIBrIYicllVSAZqa/wntatD7GrWsjAQKbd6W46H8Qd1EYMLEtgARJMdCoesG6z
 yPFLeqSrRMTTth/ykNSu3kgM/YIg85GqXtratado404Nnpurgz4NETBbV5r8yAckKplV
 VDPzpErSqHobJ3P3SnJUGhbQvtgLUBMNBfaray12ckE9qpWWB/Om4u8gbAgsXkxWjwEv
 Nf7R2L38UDaTVil4rJZwqdYywlJoYSxHqs9+hqUtp3JcwWsvxYkugww1utP/2owzCno+ yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39dgt03ahq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jun 2021 11:42:39 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15PFY6Kj085078;
 Fri, 25 Jun 2021 11:42:39 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39dgt03ag6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jun 2021 11:42:39 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15PFg6N2022875;
 Fri, 25 Jun 2021 15:42:36 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 399878b4f6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jun 2021 15:42:36 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15PFgXsU30671246
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 15:42:33 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 701614C058;
 Fri, 25 Jun 2021 15:42:33 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE67A4C052;
 Fri, 25 Jun 2021 15:42:30 +0000 (GMT)
Received: from Nageswaras-MacBook-Pro-2.local (unknown [9.85.92.6])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 25 Jun 2021 15:42:30 +0000 (GMT)
Subject: Re: [PATCH] perf vendor events power10: Adds 24x7 nest metric events
 for power10 platform
To: Kajol Jain <kjain@linux.ibm.com>, acme@kernel.org
References: <20210625115948.99579-1-kjain@linux.ibm.com>
From: Nageswara Sastry <rnsastry@linux.ibm.com>
Message-ID: <9044a3c3-c4ce-c516-9da7-95dce6b31e1f@linux.ibm.com>
Date: Fri, 25 Jun 2021 21:12:29 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625115948.99579-1-kjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vlXPL2k9V0z9Cujn5A89dB5djCliX0Jk
X-Proofpoint-ORIG-GUID: Ph4UK3fXSDgN8oIaJwAe-YAdiOLY7zh_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-25_05:2021-06-25,
 2021-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106250090
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
Cc: ravi.bangoria@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, pc@us.ibm.com,
 jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Test scenarios:
1. With 'perf list metric' and 'perf list metricgroup'  - can see metrics
2. Run all the metrics with perf stat with -M option and --metric-only 
-M option

The above test scenarios automated with avocado framework, pull request 
title: perf_metric.py: Add perf metric test case

Output from automated test script run:
  (1/2) perf_metric.py:perf_metric.test_all_metric_events_with_M: PASS 
(89.83 s)
  (2/2) perf_metric.py:perf_metric.test_all_metric_events_with_metric: 
PASS (89.34 s)

Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>



On 25/06/21 5:29 pm, Kajol Jain wrote:
> Patch adds 24x7 nest metric events for POWER10.
> 
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>   .../arch/powerpc/power10/nest_metrics.json    | 491 ++++++++++++++++++
>   1 file changed, 491 insertions(+)
>   create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json
> 
> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json
> new file mode 100644
> index 000000000000..b79046cd8b09
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json
> @@ -0,0 +1,491 @@
> +[
> +    {
> +      "MetricName": "VEC_GROUP_PUMP_RETRY_RATIO_P01",
> +      "BriefDescription": "VEC_GROUP_PUMP_RETRY_RATIO_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_VG_PUMP01\\,chip\\=?@ / hv_24x7@PM_PB_VG_PUMP01\\,chip\\=?@) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "VEC_GROUP_PUMP_RETRY_RATIO_P23",
> +      "BriefDescription": "VEC_GROUP_PUMP_RETRY_RATIO_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_VG_PUMP23\\,chip\\=?@ / hv_24x7@PM_PB_VG_PUMP23\\,chip\\=?@) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "LOCAL_NODE_PUMP_RETRY_RATIO_P01",
> +      "BriefDescription": "LOCAL_NODE_PUMP_RETRY_RATIO_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_LNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PB_LNS_PUMP01\\,chip\\=?@) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "LOCAL_NODE_PUMP_RETRY_RATIO_P23",
> +      "BriefDescription": "LOCAL_NODE_PUMP_RETRY_RATIO_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_LNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PB_LNS_PUMP23\\,chip\\=?@) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "GROUP_PUMP_RETRY_RATIO_P01",
> +      "BriefDescription": "GROUP_PUMP_RETRY_RATIO_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_GROUP_PUMP01\\,chip\\=?@ / hv_24x7@PM_PB_GROUP_PUMP01\\,chip\\=?@) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "GROUP_PUMP_RETRY_RATIO_P23",
> +      "BriefDescription": "GROUP_PUMP_RETRY_RATIO_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_GROUP_PUMP23\\,chip\\=?@ / hv_24x7@PM_PB_GROUP_PUMP23\\,chip\\=?@) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_GROUP_PUMPS_P01",
> +      "BriefDescription": "TOTAL_GROUP_PUMPS_P01(PER-CYC)",
> +      "MetricExpr": "(hv_24x7@PM_PB_GROUP_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_GROUP_PUMPS_P23",
> +      "BriefDescription": "TOTAL_GROUP_PUMPS_P23(PER-CYC)",
> +      "MetricExpr": "(hv_24x7@PM_PB_GROUP_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_GROUP_PUMPS_RETRIES_P01",
> +      "BriefDescription": "TOTAL_GROUP_PUMPS_RETRIES_P01(PER-CYC)",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_GROUP_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_GROUP_PUMPS_RETRIES_P23",
> +      "BriefDescription": "TOTAL_GROUP_PUMPS_RETRIES_P23(PER-CYC)",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_GROUP_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "REMOTE_NODE_PUMPS_RETRIES_RATIO_P01",
> +      "BriefDescription": "REMOTE_NODE_PUMPS_RETRIES_RATIO_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_RNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PB_RNS_PUMP01\\,chip\\=?@) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "REMOTE_NODE_PUMPS_RETRIES_RATIO_P23",
> +      "BriefDescription": "REMOTE_NODE_PUMPS_RETRIES_RATIO_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_RNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PB_RNS_PUMP23\\,chip\\=?@) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_VECTOR_GROUP_PUMPS_P01",
> +      "BriefDescription": "TOTAL_VECTOR_GROUP_PUMPS_P01(PER-CYC)",
> +      "MetricExpr": "(hv_24x7@PM_PB_VG_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_VECTOR_GROUP_PUMPS_P23",
> +      "BriefDescription": "TOTAL_VECTOR_GROUP_PUMPS_P23(PER-CYC)",
> +      "MetricExpr": "(hv_24x7@PM_PB_VG_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_LOCAL_NODE_PUMPS_P01",
> +      "BriefDescription": "TOTAL_LOCAL_NODE_PUMPS_P01(PER-CYC)",
> +      "MetricExpr": "(hv_24x7@PM_PB_LNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_LOCAL_NODE_PUMPS_P23",
> +      "BriefDescription": "TOTAL_LOCAL_NODE_PUMPS_P23(PER-CYC)",
> +      "MetricExpr": "(hv_24x7@PM_PB_LNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_VECTOR_GROUP_PUMPS_RETRIES_P01",
> +      "BriefDescription": "TOTAL_VECTOR_GROUP_PUMPS_RETRIES_P01(PER-CYC)",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_VG_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_VECTOR_GROUP_PUMPS_RETRIES_P23",
> +      "BriefDescription": "TOTAL_VECTOR_GROUP_PUMPS_RETRIES_P23(PER-CYC)",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_VG_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01",
> +      "BriefDescription": "TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01(PER-CYC)",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_LNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_LOCAL_NODE_PUMPS_RETRIES_P23",
> +      "BriefDescription": "TOTAL_LOCAL_NODE_PUMPS_RETRIES_P23(PER-CYC)",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_LNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_REMOTE_NODE_PUMPS_P01",
> +      "BriefDescription": "TOTAL_REMOTE_NODE_PUMPS_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_RNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_REMOTE_NODE_PUMPS_P23",
> +      "BriefDescription": "TOTAL_REMOTE_NODE_PUMPS_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_RNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_NEAR_NODE_PUMPS_P01",
> +      "BriefDescription": "TOTAL_NEAR_NODE_PUMPS_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_NNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_NEAR_NODE_PUMPS_P23",
> +      "BriefDescription": "TOTAL_NEAR_NODE_PUMPS_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_NNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_INT_PB_BW",
> +      "BriefDescription": "TOTAL_INT_PB_BW",
> +      "MetricExpr": "(hv_24x7@PM_PB_INT_DATA_XFER\\,chip\\=?@)",
> +      "ScaleUnit": "2.09MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK0_OUT_TOTAL_UTILIZATION",
> +      "BriefDescription": "XLINK0_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK0_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK1_OUT_TOTAL_UTILIZATION",
> +      "BriefDescription": "XLINK1_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK1_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK2_OUT_TOTAL_UTILIZATION",
> +      "BriefDescription": "XLINK2_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK2_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK3_OUT_TOTAL_UTILIZATION",
> +      "BriefDescription": "XLINK3_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK3_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK4_OUT_TOTAL_UTILIZATION",
> +      "BriefDescription": "XLINK4_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK4_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK5_OUT_TOTAL_UTILIZATION",
> +      "BriefDescription": "XLINK5_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK5_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK6_OUT_TOTAL_UTILIZATION",
> +      "BriefDescription": "XLINK6_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK6_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK7_OUT_TOTAL_UTILIZATION",
> +      "BriefDescription": "XLINK7_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK7_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK0_OUT_DATA_UTILIZATION",
> +      "BriefDescription": "XLINK0_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK0_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK1_OUT_DATA_UTILIZATION",
> +      "BriefDescription": "XLINK1_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK1_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK2_OUT_DATA_UTILIZATION",
> +      "BriefDescription": "XLINK2_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK2_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK3_OUT_DATA_UTILIZATION",
> +      "BriefDescription": "XLINK3_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK3_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK4_OUT_DATA_UTILIZATION",
> +      "BriefDescription": "XLINK4_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK4_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK5_OUT_DATA_UTILIZATION",
> +      "BriefDescription": "XLINK5_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK5_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK6_OUT_DATA_UTILIZATION",
> +      "BriefDescription": "XLINK6_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK6_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK7_OUT_DATA_UTILIZATION",
> +      "BriefDescription": "XLINK7_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK7_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK0_OUT_TOTAL_UTILIZATION",
> +      "BriefDescription": "ALINK0_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK0_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK1_OUT_TOTAL_UTILIZATION",
> +      "BriefDescription": "ALINK1_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK1_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK2_OUT_TOTAL_UTILIZATION",
> +      "BriefDescription": "ALINK2_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK2_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK3_OUT_TOTAL_UTILIZATION",
> +      "BriefDescription": "ALINK3_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK3_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK4_OUT_TOTAL_UTILIZATION",
> +      "BriefDescription": "ALINK4_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK4_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK5_OUT_TOTAL_UTILIZATION",
> +      "BriefDescription": "ALINK5_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK5_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK6_OUT_TOTAL_UTILIZATION",
> +      "BriefDescription": "ALINK6_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK6_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK7_OUT_TOTAL_UTILIZATION",
> +      "BriefDescription": "ALINK7_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK7_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK0_OUT_DATA_UTILIZATION",
> +      "BriefDescription": "ALINK0_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK0_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK1_OUT_DATA_UTILIZATION",
> +      "BriefDescription": "ALINK1_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK1_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK2_OUT_DATA_UTILIZATION",
> +      "BriefDescription": "ALINK2_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK2_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK3_OUT_DATA_UTILIZATION",
> +      "BriefDescription": "ALINK3_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK3_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK4_OUT_DATA_UTILIZATION",
> +      "BriefDescription": "ALINK4_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK4_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK5_OUT_DATA_UTILIZATION",
> +      "BriefDescription": "ALINK5_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK5_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK6_OUT_DATA_UTILIZATION",
> +      "BriefDescription": "ALINK6_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK6_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK7_OUT_DATA_UTILIZATION",
> +      "BriefDescription": "ALINK7_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK7_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_DATA_BANDWIDTH_TRANSFERRED_OVER_PB_PCI1",
> +      "BriefDescription": "TOTAL_DATA_BANDWIDTH_TRANSFERRED_OVER_PB_PCI1",
> +      "MetricExpr": "(hv_24x7@PM_PCI1_32B_INOUT\\,chip\\=?@)",
> +      "ScaleUnit": "3.28e-2MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_DATA_BANDWIDTH_TRANSFERRED_OVER_PB_PCI0",
> +      "BriefDescription": "TOTAL_DATA_BANDWIDTH_TRANSFERRED_OVER_PB_PCI0",
> +      "MetricExpr": "(hv_24x7@PM_PCI0_32B_INOUT\\,chip\\=?@)",
> +      "ScaleUnit": "3.28e-2MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_MCS_READ_BW_MC0_CHAN01",
> +      "BriefDescription": "TOTAL_MCS_READ_BW_MC0_CHAN01",
> +      "MetricExpr": "(hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC0_CHAN01\\,chip\\=?@)",
> +      "ScaleUnit": "5.24e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_MCS_READ_BW_MC1_CHAN01",
> +      "BriefDescription": "TOTAL_MCS_READ_BW_MC1_CHAN01",
> +      "MetricExpr": "(hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC1_CHAN01\\,chip\\=?@)",
> +      "ScaleUnit": "5.24e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_MCS_READ_BW_MC2_CHAN01",
> +      "BriefDescription": "TOTAL_MCS_READ_BW_MC2_CHAN01",
> +      "MetricExpr": "(hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC2_CHAN01\\,chip\\=?@)",
> +      "ScaleUnit": "5.24e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_MCS_READ_BW_MC3_CHAN01",
> +      "BriefDescription": "TOTAL_MCS_READ_BW_MC3_CHAN01",
> +      "MetricExpr": "(hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC3_CHAN01\\,chip\\=?@)",
> +      "ScaleUnit": "5.24e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_MCS_WRITE_BW_MC0_CHAN01",
> +      "BriefDescription": "TOTAL_MCS_WRITE_BW_MC0_CHAN01",
> +      "MetricExpr": "(hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC0_CHAN01\\,chip\\=?@)",
> +      "ScaleUnit": "2.6e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_MCS_WRITE_BW_MC1_CHAN01",
> +      "BriefDescription": "TOTAL_MCS_WRITE_BW_MC1_CHAN01",
> +      "MetricExpr": "(hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC1_CHAN01\\,chip\\=?@)",
> +      "ScaleUnit": "2.6e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_MCS_WRITE_BW_MC2_CHAN01",
> +      "BriefDescription": "TOTAL_MCS_WRITE_BW_MC2_CHAN01",
> +      "MetricExpr": "(hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC2_CHAN01\\,chip\\=?@)",
> +      "ScaleUnit": "2.6e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_MCS_WRITE_BW_MC3_CHAN01",
> +      "BriefDescription": "TOTAL_MCS_WRITE_BW_MC3_CHAN01",
> +      "MetricExpr": "(hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC3_CHAN01\\,chip\\=?@)",
> +      "ScaleUnit": "2.6e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricExpr": "(hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC0_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC1_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC2_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC3_CHAN01\\,chip\\=?@)",
> +      "MetricName": "Memory_RD_BW_Chip",
> +      "MetricGroup": "Memory_BW",
> +      "ScaleUnit": "5.24e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricExpr": "(hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC0_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC1_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC2_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC3_CHAN01\\,chip\\=?@ )",
> +      "MetricName": "Memory_WR_BW_Chip",
> +      "MetricGroup": "Memory_BW",
> +      "ScaleUnit": "2.6e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricExpr": "(hv_24x7@PM_PAU_CYC\\,chip\\=?@ )",
> +      "MetricName": "PowerBUS_Frequency",
> +      "ScaleUnit": "2.56e-7GHz",
> +      "AggregationMode": "PerChip"
> +    }
> +]
> 

-- 
Thanks and Regards
R.Nageswara Sastry
