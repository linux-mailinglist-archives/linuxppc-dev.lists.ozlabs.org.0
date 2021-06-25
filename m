Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 222FF3B4456
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 15:22:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBHjd6v8gz3bxN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 23:22:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ds7cr7Vl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=pc@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ds7cr7Vl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBHj46XSLz309y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 23:22:00 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15PD45cE044073; Fri, 25 Jun 2021 09:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=hTuN637OKQdNPrG2LjC61M4p+FjuUSVbwCzdo9xfbvc=;
 b=ds7cr7Vl1uPKoW7/40cUNccGs05Aj1lxijesMYG/yreKN7TAzp/fiM0XVklk0eHr5qpP
 jPV8+4xyP80++cpIQP1zE9yDqreFfJAuOWfk1/FeK1YuxX+QCSVcU8cblu8313irhJh/
 53dNXZdT7/4q9L5YB1umFQ/WKGxnVCPJeHvWC2ALONRI6sy8rxlikxoPjZFE5D8uJkh6
 6fHlPl/MQO4J6pOr4vrh9CEZaJuUFwBSH+p5yW02OLe2rK7IonyXt2fJNi4ROQ3WBZvl
 ipMOrxZBQnJvTxa5fasinyb2S7A896n6DpA9TZ0d7oBPLeeSTBrYhLPXv1l11OX7rj9c KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39dehtkmtw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jun 2021 09:21:56 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15PD4epm046564;
 Fri, 25 Jun 2021 09:21:55 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39dehtkmst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jun 2021 09:21:55 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15PDIBmR011881;
 Fri, 25 Jun 2021 13:21:54 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 399879j4xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jun 2021 13:21:54 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15PDLrBj19005920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 13:21:53 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5AA9AC065;
 Fri, 25 Jun 2021 13:21:53 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5252AC05F;
 Fri, 25 Jun 2021 13:21:52 +0000 (GMT)
Received: from li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com (unknown
 [9.85.163.191]) by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 25 Jun 2021 13:21:52 +0000 (GMT)
Date: Fri, 25 Jun 2021 08:21:51 -0500
From: "Paul A. Clarke" <pc@us.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH] perf vendor events power10: Adds 24x7 nest metric events
 for power10 platform
Message-ID: <20210625132151.GC142768@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
References: <20210625115948.99579-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625115948.99579-1-kjain@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TPSyoPX5q7sP0C3RQfBbgiHN6_uS2HBv
X-Proofpoint-ORIG-GUID: EFWBvjVfq1DqiZ8QFHoPGt8QInG3Yy5c
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-25_04:2021-06-25,
 2021-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106250075
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
 rnsastry@linux.ibm.com, jolsa@redhat.com, linux-kernel@vger.kernel.org,
 acme@kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 25, 2021 at 05:29:48PM +0530, Kajol Jain wrote:
> Patch adds 24x7 nest metric events for POWER10.
> 
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  .../arch/powerpc/power10/nest_metrics.json    | 491 ++++++++++++++++++
>  1 file changed, 491 insertions(+)
>  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json
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

Is it possible to get better descriptions than just a restatement of the
name, or no description at all?

This comment obviously applies to almost all of the metrics herein.

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

The pattern up until this point was "MetricName", then "BriefDescription",
then "MetricExpr".  I think it would be helpful to continue that here,
and for the next two as well.  That should include _having_ a description,
obviously.  :-)

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
> -- 

PC
