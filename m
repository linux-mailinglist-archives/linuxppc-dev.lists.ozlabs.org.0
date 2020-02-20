Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE6F165A92
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 10:55:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NVM3050RzDqRK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 20:55:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NVKf4cV8zDqPN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 20:53:58 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01K9nJoQ043951
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 04:53:55 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ucmw4f0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 04:53:55 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <maddy@linux.ibm.com>;
 Thu, 20 Feb 2020 09:53:52 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Feb 2020 09:53:47 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01K9rjAq48758894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 09:53:45 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C260AE056;
 Thu, 20 Feb 2020 09:53:45 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30CACAE051;
 Thu, 20 Feb 2020 09:53:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.35.143])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 09:53:42 +0000 (GMT)
Subject: Re: [PATCH 8/8] perf/tools/pmu-events/powerpc: Add hv_24x7
 socket/chip level metric events
To: Kajol Jain <kjain@linux.ibm.com>, acme@kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20200214110335.31483-1-kjain@linux.ibm.com>
 <20200214110335.31483-9-kjain@linux.ibm.com>
From: maddy <maddy@linux.ibm.com>
Date: Thu, 20 Feb 2020 15:23:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200214110335.31483-9-kjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20022009-0012-0000-0000-000003888D03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022009-0013-0000-0000-000021C5233A
Message-Id: <276f2495-c838-cae4-d654-065e43b0323a@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_02:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002200072
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com, jmario@redhat.com,
 mpetlan@redhat.com, peterz@infradead.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, alexander.shishkin@linux.intel.com,
 linux-perf-users@vger.kernel.org, ak@linux.intel.com, yao.jin@linux.intel.com,
 anju@linux.vnet.ibm.com, jolsa@kernel.org, namhyung@kernel.org,
 mingo@kernel.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/14/20 4:33 PM, Kajol Jain wrote:
> The hv_24×7 feature in IBM® POWER9™ processor-based servers provide the
> facility to continuously collect large numbers of hardware performance
> metrics efficiently and accurately.
> This patch adds hv_24x7 json metric file for different Socket/chip
> resources.
>
> Result:
>
> power9 platform:
>
> command:# ./perf stat --metric-only -M Memory_RD_BW_Chip -C 0
>             -I 1000 sleep 1
>
> time MB       Memory_RD_BW_Chip_0 MB   Memory_RD_BW_Chip_1 MB
> 1.000192635                      0.4                      0.0
> 1.001695883                      0.0                      0.0
>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>   .../arch/powerpc/power9/hv_24x7_metrics.json  | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>   create mode 100644 tools/perf/pmu-events/arch/powerpc/power9/hv_24x7_metrics.json
>
> diff --git a/tools/perf/pmu-events/arch/powerpc/power9/hv_24x7_metrics.json b/tools/perf/pmu-events/arch/powerpc/power9/hv_24x7_metrics.json
> new file mode 100644
> index 000000000000..ac38f5540ac6
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/powerpc/power9/hv_24x7_metrics.json

Better to have it as nest_metrics.json instead.  Rest looks fine

Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>

> @@ -0,0 +1,19 @@
> +[
> +    {
> +        "MetricExpr": "(hv_24x7@PM_MCS01_128B_RD_DISP_PORT01\\,chip\\=?@ + hv_24x7@PM_MCS01_128B_RD_DISP_PORT23\\,chip\\=?@ + hv_24x7@PM_MCS23_128B_RD_DISP_PORT01\\,chip\\=?@ + hv_24x7@PM_MCS23_128B_RD_DISP_PORT23\\,chip\\=?@)",
> +        "MetricName": "Memory_RD_BW_Chip",
> +        "MetricGroup": "Memory_BW",
> +        "ScaleUnit": "1.6e-2MB"
> +    },
> +    {
> +    "MetricExpr": "(hv_24x7@PM_MCS01_128B_WR_DISP_PORT01\\,chip\\=?@ + hv_24x7@PM_MCS01_128B_WR_DISP_PORT23\\,chip\\=?@ + hv_24x7@PM_MCS23_128B_WR_DISP_PORT01\\,chip\\=?@ + hv_24x7@PM_MCS23_128B_WR_DISP_PORT23\\,chip\\=?@ )",
> +        "MetricName": "Memory_WR_BW_Chip",
> +        "MetricGroup": "Memory_BW",
> +        "ScaleUnit": "1.6e-2MB"
> +    },
> +    {
> +    "MetricExpr": "(hv_24x7@PM_PB_CYC\\,chip\\=?@ )",
> +        "MetricName": "PowerBUS_Frequency",
> +        "ScaleUnit": "2.5e-7GHz"
> +    }
> +]

