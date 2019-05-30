Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB502EA74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 04:01:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DrRj6RQJzDqGG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 12:01:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DrQF40D8zDq72
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 12:00:36 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4U1qAxO038822
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 22:00:34 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2st5h691cs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 22:00:33 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Thu, 30 May 2019 03:00:32 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 30 May 2019 03:00:30 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4U20TON35127536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 May 2019 02:00:29 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1F114C05C;
 Thu, 30 May 2019 02:00:29 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EC4E4C050;
 Thu, 30 May 2019 02:00:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 May 2019 02:00:29 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C1DB4A01F5;
 Thu, 30 May 2019 12:00:27 +1000 (AEST)
Subject: Re: [PATCH] powerpc/powernv: Show checkstop reason for NPU2 HMIs
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 arbab@linux.ibm.com, aik@ozlabs.ru
References: <20190523122804.4801-1-fbarrat@linux.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Thu, 30 May 2019 12:00:27 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190523122804.4801-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19053002-0008-0000-0000-000002EBC775
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19053002-0009-0000-0000-000022589A54
Message-Id: <06f08cb3-4b4c-46a9-6925-9465e8cbe697@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905300013
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
Cc: clombard@linux.ibm.com, groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/5/19 10:28 pm, Frederic Barrat wrote:
> If the kernel is notified of an HMI caused by the NPU2, it's currently
> not being recognized and it logs the default message:
> 
>      Unknown Malfunction Alert of type 3
> 
> The NPU on Power 9 has 3 Fault Isolation Registers, so that's a lot of
> possible causes, but we should at least log that it's an NPU problem
> and report which FIR and which bit were raised if opal gave us the
> information.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
> 
> Could be merged independently from (the opal-api.h change is already
> in the skiboot tree), but works better with, the matching skiboot
> change:
> http://patchwork.ozlabs.org/patch/1104076/

Still always safest to hold off until merged into skiboot :)

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> 
> 
>   arch/powerpc/include/asm/opal-api.h       |  1 +
>   arch/powerpc/platforms/powernv/opal-hmi.c | 40 +++++++++++++++++++++++
>   2 files changed, 41 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
> index e1577cfa7186..2492fe248e1e 100644
> --- a/arch/powerpc/include/asm/opal-api.h
> +++ b/arch/powerpc/include/asm/opal-api.h
> @@ -568,6 +568,7 @@ enum OpalHMI_XstopType {
>   	CHECKSTOP_TYPE_UNKNOWN	=	0,
>   	CHECKSTOP_TYPE_CORE	=	1,
>   	CHECKSTOP_TYPE_NX	=	2,
> +	CHECKSTOP_TYPE_NPU	=	3
>   };
>   
>   enum OpalHMI_CoreXstopReason {
> diff --git a/arch/powerpc/platforms/powernv/opal-hmi.c b/arch/powerpc/platforms/powernv/opal-hmi.c
> index 586ec71a4e17..de12a240b477 100644
> --- a/arch/powerpc/platforms/powernv/opal-hmi.c
> +++ b/arch/powerpc/platforms/powernv/opal-hmi.c
> @@ -149,6 +149,43 @@ static void print_nx_checkstop_reason(const char *level,
>   					xstop_reason[i].description);
>   }
>   
> +static void print_npu_checkstop_reason(const char *level,
> +					struct OpalHMIEvent *hmi_evt)
> +{
> +	uint8_t reason, reason_count, i;
> +
> +	/*
> +	 * We may not have a checkstop reason on some combination of
> +	 * hardware and/or skiboot version
> +	 */
> +	if (!hmi_evt->u.xstop_error.xstop_reason) {
> +		printk("%s	NPU checkstop on chip %x\n", level,
> +			be32_to_cpu(hmi_evt->u.xstop_error.u.chip_id));
> +		return;
> +	}
> +
> +	/*
> +	 * NPU2 has 3 FIRs. Reason encoded on a byte as:
> +	 *   2 bits for the FIR number
> +	 *   6 bits for the bit number
> +	 * It may be possible to find several reasons.
> +	 *
> +	 * We don't display a specific message per FIR bit as there
> +	 * are too many and most are meaningless without the workbook
> +	 * and/or hw team help anyway.
> +	 */
> +	reason_count = sizeof(hmi_evt->u.xstop_error.xstop_reason) /
> +		sizeof(reason);
> +	for (i = 0; i < reason_count; i++) {
> +		reason = (hmi_evt->u.xstop_error.xstop_reason >> (8 * i)) & 0xFF;

very nitpicky: should we call be32_to_cpu() so that the bits appear in 
order?

> +		if (reason)
> +			printk("%s	NPU checkstop on chip %x: FIR%d bit %d is set\n",
> +				level,
> +				be32_to_cpu(hmi_evt->u.xstop_error.u.chip_id),
> +				reason >> 6, reason & 0x3F);
> +	}
> +}
> +
>   static void print_checkstop_reason(const char *level,
>   					struct OpalHMIEvent *hmi_evt)
>   {
> @@ -160,6 +197,9 @@ static void print_checkstop_reason(const char *level,
>   	case CHECKSTOP_TYPE_NX:
>   		print_nx_checkstop_reason(level, hmi_evt);
>   		break;
> +	case CHECKSTOP_TYPE_NPU:
> +		print_npu_checkstop_reason(level, hmi_evt);
> +		break;
>   	default:
>   		printk("%s	Unknown Malfunction Alert of type %d\n",
>   		       level, type);
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

