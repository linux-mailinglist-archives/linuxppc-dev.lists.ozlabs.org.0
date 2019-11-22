Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C548106832
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 09:42:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47K90K0RbczDrMh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 19:42:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hari@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47K8yC1MH4zDrJV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 19:40:18 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAM83JPL119849
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 03:03:52 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wdqmhyee2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 03:03:51 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <hari@linux.vnet.ibm.com>;
 Fri, 22 Nov 2019 08:03:49 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 22 Nov 2019 08:03:47 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xAM838h530867914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 08:03:08 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AD484204D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 08:03:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E683A4204B
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 08:03:45 +0000 (GMT)
Received: from [9.109.253.172] (unknown [9.109.253.172])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 08:03:45 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/perf: Disable trace_imc pmu
To: linuxppc-dev@lists.ozlabs.org
References: <20191118034452.9939-1-maddy@linux.vnet.ibm.com>
From: Hariharan T S <hari@linux.vnet.ibm.com>
Date: Fri, 22 Nov 2019 13:33:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191118034452.9939-1-maddy@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19112208-0020-0000-0000-0000038D37DD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112208-0021-0000-0000-000021E37611
Message-Id: <1b71450a-bb1b-3097-1b38-5f113b720d25@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_07:2019-11-21,2019-11-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=1 impostorscore=0 mlxscore=0 clxscore=1011 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911220070
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/18/19 9:14 AM, Madhavan Srinivasan wrote:
> When a root user or a user with CAP_SYS_ADMIN
> privilege use trace_imc performance monitoring
> unit events, to monitor application or KVM threads,
> may result in a checkstop (System crash). Reason
> being frequent switch of the "trace/accumulation"
> mode of In-Memory Collection hardware.
> This patch disables trace_imc pmu unit, but will
> be re-enabled at a later stage with a fix patchset.
> 
> Fixes: 012ae244845f1 ('powerpc/perf: Trace imc PMU functions')
> Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

Tested-by: Hariharan T.S. <hari@linux.ibm.com>
> ---
> Changelog v1:
> - Added fixes and signed-off by.
>   arch/powerpc/platforms/powernv/opal-imc.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
> index e04b20625cb9..5790f078771f 100644
> --- a/arch/powerpc/platforms/powernv/opal-imc.c
> +++ b/arch/powerpc/platforms/powernv/opal-imc.c
> @@ -285,7 +285,12 @@ static int opal_imc_counters_probe(struct platform_device *pdev)
>   			domain = IMC_DOMAIN_THREAD;
>   			break;
>   		case IMC_TYPE_TRACE:
> -			domain = IMC_DOMAIN_TRACE;
> +			/* Using trace_imc events to monitor
> +			 * application or KVM thread performances
> +			 * may result in a checkstop (system crash).
> +			 * So disabling it for now.
> +			 */
> +			domain = -1;
>   			break;
>   		default:
>   			pr_warn("IMC Unknown Device type \n");
> 

