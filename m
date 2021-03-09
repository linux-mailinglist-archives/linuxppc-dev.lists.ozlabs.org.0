Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA063323ED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 12:27:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvtGW5WTJz3cTZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 22:27:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZKF6D0/2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZKF6D0/2; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvtG52lgzz30QS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 22:26:52 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129B3wOp043667; Tue, 9 Mar 2021 06:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=HgSQIWSEU/WlQR1r8uNcM4cWyEnQbIa7diDvK+Kr6zk=;
 b=ZKF6D0/2D88/kCjHpgivCgXMGiXSA6FHwwqfjoXGiR1VesmyUs91SxZ+ZnhUzgqzripN
 8u5OjrnYAlqGLiKL1wz3Zn56vNjoJrJ04bsfJDMiIqWUYtUk2ercB11UBxTq20sIuiUQ
 5wX6a0+Hg94hsFf5zO2gt7FYjdjRg9m9fwBVRD/FJ3lrmlZGFXWa9Rly8wZs6TF4wZoz
 KKyjHXMtbD8UrKsfDZsHyk3fkH8NGi3Lxi63ZS47f15hL33eKCHiQIwVL9In66etg6Uw
 hD/RSyU2zm9Oq88DnVozxPmgq16L5WCEQTlRnGMxuwoqHLI4GFwGNZQaK5YsP0hVE/Nx hA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375wcm7pj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 06:26:46 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 129AwV3U003805;
 Tue, 9 Mar 2021 11:26:44 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3741c89dne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 11:26:44 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 129BQR0J34931174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Mar 2021 11:26:27 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EBF8AE055;
 Tue,  9 Mar 2021 11:26:42 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 309F9AE045;
 Tue,  9 Mar 2021 11:26:41 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.80.199.175])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  9 Mar 2021 11:26:40 +0000 (GMT)
Subject: Re: [PATCH] powerpc/perf: Fix sampled instruction type for larx/stcx
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <1614858937-1485-1-git-send-email-atrajeev@linux.vnet.ibm.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <1600e1a1-1610-e081-a5b7-46dc7762bad9@linux.ibm.com>
Date: Tue, 9 Mar 2021 16:56:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1614858937-1485-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_09:2021-03-08,
 2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103090053
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 3/4/21 5:25 PM, Athira Rajeev wrote:
> Sampled Instruction Event Register (SIER) field [46:48]
> identifies the sampled instruction type. ISA v3.1 says value
> of 0b111 for this field as reserved, but in POWER10 it denotes
> LARX/STCX type which will hopefully be fixed in ISA v3.1 update.
>
> Patch fixes the functions to handle type value 7 for
> CPU_FTR_ARCH_31.


Changes looks fine to me.

Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>


> Fixes: a64e697cef23 ("powerpc/perf: power10 Performance Monitoring support")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>   arch/powerpc/perf/isa207-common.c | 30 +++++++++++++++++++++++++++---
>   arch/powerpc/perf/isa207-common.h |  1 +
>   2 files changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
> index e4f577da33d8..754f904d8d69 100644
> --- a/arch/powerpc/perf/isa207-common.c
> +++ b/arch/powerpc/perf/isa207-common.c
> @@ -266,6 +266,8 @@ void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
>   	u32 sub_idx;
>   	u64 sier;
>   	u64 val;
> +	u64 mmcra = mfspr(SPRN_MMCRA);
> +	u32 op_type;
>   
>   	/* Skip if no SIER support */
>   	if (!(flags & PPMU_HAS_SIER)) {
> @@ -275,12 +277,34 @@ void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
>   
>   	sier = mfspr(SPRN_SIER);
>   	val = (sier & ISA207_SIER_TYPE_MASK) >> ISA207_SIER_TYPE_SHIFT;
> -	if (val == 1 || val == 2) {
> +	if (val == 1 || val == 2 || (val == 7 && cpu_has_feature(CPU_FTR_ARCH_31))) {
>   		idx = (sier & ISA207_SIER_LDST_MASK) >> ISA207_SIER_LDST_SHIFT;
>   		sub_idx = (sier & ISA207_SIER_DATA_SRC_MASK) >> ISA207_SIER_DATA_SRC_SHIFT;
>   
>   		dsrc->val = isa207_find_source(idx, sub_idx);
> -		dsrc->val |= (val == 1) ? P(OP, LOAD) : P(OP, STORE);
> +		if (val == 7) {
> +			/*
> +			 * Type 0b111 denotes either larx or stcx instruction. Use the
> +			 * MMCRA sampling bits [57:59] along with the type value
> +			 * to determine the exact instruction type. If the sampling
> +			 * criteria is neither load or store, set the type as default
> +			 * to NA.
> +			 */
> +			op_type = (mmcra >> MMCRA_SAMP_ELIG_SHIFT) & MMCRA_SAMP_ELIG_MASK;
> +			switch (op_type) {
> +			case 5:
> +				dsrc->val |= P(OP, LOAD);
> +				break;
> +			case 7:
> +				dsrc->val |= P(OP, STORE);
> +				break;
> +			default:
> +				dsrc->val |= P(OP, NA);
> +				break;
> +			}
> +		} else {
> +			dsrc->val |= (val == 1) ? P(OP, LOAD) : P(OP, STORE);
> +		}
>   	}
>   }
>   
> @@ -295,7 +319,7 @@ void isa207_get_mem_weight(u64 *weight)
>   	if (cpu_has_feature(CPU_FTR_ARCH_31))
>   		mantissa = P10_MMCRA_THR_CTR_MANT(mmcra);
>   
> -	if (val == 0 || val == 7)
> +	if (val == 0 || (val == 7 && !cpu_has_feature(CPU_FTR_ARCH_31)))
>   		*weight = 0;
>   	else
>   		*weight = mantissa << (2 * exp);
> diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
> index 1af0e8c97ac7..7b0242efe4b9 100644
> --- a/arch/powerpc/perf/isa207-common.h
> +++ b/arch/powerpc/perf/isa207-common.h
> @@ -220,6 +220,7 @@
>   /* Bits in MMCRA for PowerISA v2.07 */
>   #define MMCRA_SAMP_MODE_SHIFT		1
>   #define MMCRA_SAMP_ELIG_SHIFT		4
> +#define MMCRA_SAMP_ELIG_MASK		7
>   #define MMCRA_THR_CTL_SHIFT		8
>   #define MMCRA_THR_SEL_SHIFT		16
>   #define MMCRA_THR_CMP_SHIFT		32
