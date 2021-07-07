Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE74C3BE9DB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 16:36:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKhnX5Z4gz3bht
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 00:36:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p7R7RCZh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p7R7RCZh; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKhn52MXHz306C
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jul 2021 00:36:09 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAFD661C60;
 Wed,  7 Jul 2021 14:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625668567;
 bh=EQsNabBMoo2k2ahg/QNiKZmpAvyb9rvIwghYcImCqfI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p7R7RCZhlaQAnoPNrclT+r96DK+Ior2oHG5Efo+AkBJA/NvVriAQ1TTR9On1bexq2
 4/2EhxZhLkW8TJcVngW2Bv85TlfC4KYYYOAn1eVaS4jO8uzQ97NFoOifANwR+575fc
 PgSawDaJu2WOlQb3K4Bik/4hFc6PUllV7BE0riT9ziaxm7HzVXTyU4K/hVtaSPLPyC
 sUXE55yAGhqJy8TXS3fExUplkJvug5Iw5l9bsebEWLx+Njfqi94EHCQjCu2L6BSGZr
 3VuV4u9mSSlQT7WjInzPnGBp2EQzV9CJLw7PPLKYNu/tINmfHklce0ck3iwUWalrQJ
 vXCVNd2cGwA5A==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 148B340B1A; Wed,  7 Jul 2021 11:36:04 -0300 (-03)
Date: Wed, 7 Jul 2021 11:36:04 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v2] perf vendor events power10: Adds 24x7 nest metric
 events for power10 platform
Message-ID: <YOW71D28ADTwUgMI@kernel.org>
References: <20210628064935.163465-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628064935.163465-1-kjain@linux.ibm.com>
X-Url: http://acmel.wordpress.com
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
 rnsastry@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 maddy@linux.vnet.ibm.com, pc@us.ibm.com, jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Jun 28, 2021 at 12:19:35PM +0530, Kajol Jain escreveu:
> Patch adds 24x7 nest metric events for POWER10.

Thanks, applied.

- Arnaldo

 
> Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  .../arch/powerpc/power10/nest_metrics.json    | 424 ++++++++++++++++++
>  1 file changed, 424 insertions(+)
>  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json
> 
> ---
> Changelog:
> v1 -> v2
> - Removed "BriefDescription" field as its value was same as "MetricName"
>   field as suggested by Paul A. Clarke
> - Added Tested-by tag.
> ---
> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json b/tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json
> new file mode 100644
> index 000000000000..8ba3e81c9808
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/powerpc/power10/nest_metrics.json
> @@ -0,0 +1,424 @@
> +[
> +    {
> +      "MetricName": "VEC_GROUP_PUMP_RETRY_RATIO_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_VG_PUMP01\\,chip\\=?@ / hv_24x7@PM_PB_VG_PUMP01\\,chip\\=?@) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "VEC_GROUP_PUMP_RETRY_RATIO_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_VG_PUMP23\\,chip\\=?@ / hv_24x7@PM_PB_VG_PUMP23\\,chip\\=?@) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "LOCAL_NODE_PUMP_RETRY_RATIO_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_LNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PB_LNS_PUMP01\\,chip\\=?@) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "LOCAL_NODE_PUMP_RETRY_RATIO_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_LNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PB_LNS_PUMP23\\,chip\\=?@) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "GROUP_PUMP_RETRY_RATIO_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_GROUP_PUMP01\\,chip\\=?@ / hv_24x7@PM_PB_GROUP_PUMP01\\,chip\\=?@) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "GROUP_PUMP_RETRY_RATIO_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_GROUP_PUMP23\\,chip\\=?@ / hv_24x7@PM_PB_GROUP_PUMP23\\,chip\\=?@) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_GROUP_PUMPS_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_GROUP_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_GROUP_PUMPS_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_GROUP_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_GROUP_PUMPS_RETRIES_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_GROUP_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_GROUP_PUMPS_RETRIES_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_GROUP_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "REMOTE_NODE_PUMPS_RETRIES_RATIO_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_RNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PB_RNS_PUMP01\\,chip\\=?@) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "REMOTE_NODE_PUMPS_RETRIES_RATIO_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_RNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PB_RNS_PUMP23\\,chip\\=?@) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_VECTOR_GROUP_PUMPS_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_VG_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_VECTOR_GROUP_PUMPS_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_VG_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_LOCAL_NODE_PUMPS_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_LNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_LOCAL_NODE_PUMPS_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_LNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_VECTOR_GROUP_PUMPS_RETRIES_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_VG_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_VECTOR_GROUP_PUMPS_RETRIES_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_VG_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_LNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_LOCAL_NODE_PUMPS_RETRIES_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_RTY_LNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_REMOTE_NODE_PUMPS_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_RNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_REMOTE_NODE_PUMPS_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_RNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_NEAR_NODE_PUMPS_P01",
> +      "MetricExpr": "(hv_24x7@PM_PB_NNS_PUMP01\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_NEAR_NODE_PUMPS_P23",
> +      "MetricExpr": "(hv_24x7@PM_PB_NNS_PUMP23\\,chip\\=?@ / hv_24x7@PM_PAU_CYC\\,chip\\=?@)",
> +      "ScaleUnit": "4",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_INT_PB_BW",
> +      "MetricExpr": "(hv_24x7@PM_PB_INT_DATA_XFER\\,chip\\=?@)",
> +      "ScaleUnit": "2.09MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK0_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK0_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK1_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK1_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK2_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK2_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK3_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK3_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK4_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK4_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK5_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK5_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK6_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK6_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK7_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK7_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_XLINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK0_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK0_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK1_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK1_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK2_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK2_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK3_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK3_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK4_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK4_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK5_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK5_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK6_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK6_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "XLINK7_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_XLINK7_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_XLINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_XLINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK0_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK0_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK1_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK1_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK2_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK2_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK3_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK3_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK4_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK4_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK5_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK5_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK6_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK6_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK7_OUT_TOTAL_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK7_OUT_ODD_TOTAL_UTIL\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_TOTAL_UTIL\\,chip\\=?@) / (hv_24x7@PM_ALINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK0_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK0_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK0_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK0_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK1_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK1_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK1_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK1_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK2_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK2_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK2_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK2_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK3_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK3_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK3_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK3_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK4_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK4_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK4_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK4_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK5_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK5_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK5_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK5_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK6_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK6_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK6_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK6_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "ALINK7_OUT_DATA_UTILIZATION",
> +      "MetricExpr": "((hv_24x7@PM_ALINK7_OUT_ODD_DATA\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_DATA\\,chip\\=?@) / (hv_24x7@PM_ALINK7_OUT_ODD_AVLBL_CYCLES\\,chip\\=?@ + hv_24x7@PM_ALINK7_OUT_EVEN_AVLBL_CYCLES\\,chip\\=?@)) * 100",
> +      "ScaleUnit": "1.063%",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_DATA_BANDWIDTH_TRANSFERRED_OVER_PB_PCI1",
> +      "MetricExpr": "(hv_24x7@PM_PCI1_32B_INOUT\\,chip\\=?@)",
> +      "ScaleUnit": "3.28e-2MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_DATA_BANDWIDTH_TRANSFERRED_OVER_PB_PCI0",
> +      "MetricExpr": "(hv_24x7@PM_PCI0_32B_INOUT\\,chip\\=?@)",
> +      "ScaleUnit": "3.28e-2MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_MCS_READ_BW_MC0_CHAN01",
> +      "MetricExpr": "(hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC0_CHAN01\\,chip\\=?@)",
> +      "ScaleUnit": "5.24e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_MCS_READ_BW_MC1_CHAN01",
> +      "MetricExpr": "(hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC1_CHAN01\\,chip\\=?@)",
> +      "ScaleUnit": "5.24e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_MCS_READ_BW_MC2_CHAN01",
> +      "MetricExpr": "(hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC2_CHAN01\\,chip\\=?@)",
> +      "ScaleUnit": "5.24e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_MCS_READ_BW_MC3_CHAN01",
> +      "MetricExpr": "(hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC3_CHAN01\\,chip\\=?@)",
> +      "ScaleUnit": "5.24e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_MCS_WRITE_BW_MC0_CHAN01",
> +      "MetricExpr": "(hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC0_CHAN01\\,chip\\=?@)",
> +      "ScaleUnit": "2.6e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_MCS_WRITE_BW_MC1_CHAN01",
> +      "MetricExpr": "(hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC1_CHAN01\\,chip\\=?@)",
> +      "ScaleUnit": "2.6e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_MCS_WRITE_BW_MC2_CHAN01",
> +      "MetricExpr": "(hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC2_CHAN01\\,chip\\=?@)",
> +      "ScaleUnit": "2.6e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "TOTAL_MCS_WRITE_BW_MC3_CHAN01",
> +      "MetricExpr": "(hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC3_CHAN01\\,chip\\=?@)",
> +      "ScaleUnit": "2.6e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "Memory_RD_BW_Chip",
> +      "MetricExpr": "(hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC0_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC1_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC2_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_128B_RD_DATA_BLOCKS_MC3_CHAN01\\,chip\\=?@)",
> +      "MetricGroup": "Memory_BW",
> +      "ScaleUnit": "5.24e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "Memory_WR_BW_Chip",
> +      "MetricExpr": "(hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC0_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC1_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC2_CHAN01\\,chip\\=?@ + hv_24x7@PM_MCS_64B_WR_DATA_BLOCKS_MC3_CHAN01\\,chip\\=?@ )",
> +      "MetricGroup": "Memory_BW",
> +      "ScaleUnit": "2.6e-1MB",
> +      "AggregationMode": "PerChip"
> +    },
> +    {
> +      "MetricName": "PowerBUS_Frequency",
> +      "MetricExpr": "(hv_24x7@PM_PAU_CYC\\,chip\\=?@ )",
> +      "ScaleUnit": "2.56e-7GHz",
> +      "AggregationMode": "PerChip"
> +    }
> +]
> -- 
> 2.31.1
> 

-- 

- Arnaldo
