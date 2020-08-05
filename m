Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEB723D3FB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 00:39:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMRPw3JnTzDqgx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 08:39:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMRMm1FTkzDqYh
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 08:37:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BMRMl6Z0Cz8sWN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 08:37:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BMRMl6CPxz9sTM; Thu,  6 Aug 2020 08:37:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BMRMk6g5Hz9sPC
 for <linuxppc-dev@ozlabs.org>; Thu,  6 Aug 2020 08:37:38 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 075MW6dV087169
 for <linuxppc-dev@ozlabs.org>; Wed, 5 Aug 2020 18:37:36 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32r383kmsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 05 Aug 2020 18:37:36 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 075MYixm011174
 for <linuxppc-dev@ozlabs.org>; Wed, 5 Aug 2020 22:37:36 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 32n019dkes-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 05 Aug 2020 22:37:35 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 075MbV0023003586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Aug 2020 22:37:31 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F6F86E066;
 Wed,  5 Aug 2020 22:37:34 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 936E16E05E;
 Wed,  5 Aug 2020 22:37:33 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.114.20])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 Aug 2020 22:37:33 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] powerpc/perf: consolidate GPCI hcall structs into
 asm/hvcall.h
To: Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20200727184605.2945095-1-cheloha@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <44fe3f95-5516-05da-8fcb-a3ad60d3127d@linux.ibm.com>
Date: Wed, 5 Aug 2020 15:37:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200727184605.2945095-1-cheloha@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-05_18:2020-08-03,
 2020-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008050162
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/27/20 11:46 AM, Scott Cheloha wrote:
> The H_GetPerformanceCounterInfo (GPCI) hypercall input/output structs are
> useful to modules outside of perf/, so move them into asm/hvcall.h to live
> alongside the other powerpc hypercall structs.
> 
> Leave the perf-specific GPCI stuff in perf/hv-gpci.h.
> 
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/hvcall.h | 36 +++++++++++++++++++++++++++++++
>  arch/powerpc/perf/hv-gpci.c       |  9 --------
>  arch/powerpc/perf/hv-gpci.h       | 27 -----------------------
>  3 files changed, 36 insertions(+), 36 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index e90c073e437e..c338480b4551 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -527,6 +527,42 @@ struct hv_guest_state {
>  /* Latest version of hv_guest_state structure */
>  #define HV_GUEST_STATE_VERSION	1
>  
> +/*
> + * From the document "H_GetPerformanceCounterInfo Interface" v1.07
> + *
> + * H_GET_PERF_COUNTER_INFO argument
> + */
> +struct hv_get_perf_counter_info_params {
> +	__be32 counter_request; /* I */
> +	__be32 starting_index;  /* IO */
> +	__be16 secondary_index; /* IO */
> +	__be16 returned_values; /* O */
> +	__be32 detail_rc; /* O, only needed when called via *_norets() */
> +
> +	/*
> +	 * O, size each of counter_value element in bytes, only set for version
> +	 * >= 0x3
> +	 */
> +	__be16 cv_element_size;
> +
> +	/* I, 0 (zero) for versions < 0x3 */
> +	__u8 counter_info_version_in;
> +
> +	/* O, 0 (zero) if version < 0x3. Must be set to 0 when making hcall */
> +	__u8 counter_info_version_out;
> +	__u8 reserved[0xC];
> +	__u8 counter_value[];
> +} __packed;
> +
> +#define HGPCI_REQ_BUFFER_SIZE	4096
> +#define HGPCI_MAX_DATA_BYTES \
> +	(HGPCI_REQ_BUFFER_SIZE - sizeof(struct hv_get_perf_counter_info_params))
> +
> +struct hv_gpci_request_buffer {
> +	struct hv_get_perf_counter_info_params params;
> +	uint8_t bytes[HGPCI_MAX_DATA_BYTES];
> +} __packed;
> +
>  #endif /* __ASSEMBLY__ */
>  #endif /* __KERNEL__ */
>  #endif /* _ASM_POWERPC_HVCALL_H */
> diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
> index 6884d16ec19b..1667315b82e9 100644
> --- a/arch/powerpc/perf/hv-gpci.c
> +++ b/arch/powerpc/perf/hv-gpci.c
> @@ -123,17 +123,8 @@ static const struct attribute_group *attr_groups[] = {
>  	NULL,
>  };
>  
> -#define HGPCI_REQ_BUFFER_SIZE	4096
> -#define HGPCI_MAX_DATA_BYTES \
> -	(HGPCI_REQ_BUFFER_SIZE - sizeof(struct hv_get_perf_counter_info_params))
> -
>  static DEFINE_PER_CPU(char, hv_gpci_reqb[HGPCI_REQ_BUFFER_SIZE]) __aligned(sizeof(uint64_t));
>  
> -struct hv_gpci_request_buffer {
> -	struct hv_get_perf_counter_info_params params;
> -	uint8_t bytes[HGPCI_MAX_DATA_BYTES];
> -} __packed;
> -
>  static unsigned long single_gpci_request(u32 req, u32 starting_index,
>  		u16 secondary_index, u8 version_in, u32 offset, u8 length,
>  		u64 *value)
> diff --git a/arch/powerpc/perf/hv-gpci.h b/arch/powerpc/perf/hv-gpci.h
> index a3053eda5dcc..4d108262bed7 100644
> --- a/arch/powerpc/perf/hv-gpci.h
> +++ b/arch/powerpc/perf/hv-gpci.h
> @@ -2,33 +2,6 @@
>  #ifndef LINUX_POWERPC_PERF_HV_GPCI_H_
>  #define LINUX_POWERPC_PERF_HV_GPCI_H_
>  
> -#include <linux/types.h>
> -
> -/* From the document "H_GetPerformanceCounterInfo Interface" v1.07 */
> -
> -/* H_GET_PERF_COUNTER_INFO argument */
> -struct hv_get_perf_counter_info_params {
> -	__be32 counter_request; /* I */
> -	__be32 starting_index;  /* IO */
> -	__be16 secondary_index; /* IO */
> -	__be16 returned_values; /* O */
> -	__be32 detail_rc; /* O, only needed when called via *_norets() */
> -
> -	/*
> -	 * O, size each of counter_value element in bytes, only set for version
> -	 * >= 0x3
> -	 */
> -	__be16 cv_element_size;
> -
> -	/* I, 0 (zero) for versions < 0x3 */
> -	__u8 counter_info_version_in;
> -
> -	/* O, 0 (zero) if version < 0x3. Must be set to 0 when making hcall */
> -	__u8 counter_info_version_out;
> -	__u8 reserved[0xC];
> -	__u8 counter_value[];
> -} __packed;
> -

Hmm, this pretty much guts this header which normally I'd be inclined to suggest
moving the whole thing. The remainder of that header for context:

>  /*
>   * counter info version => fw version/reference (spec version)
>   *
>
 * 8 => power8 (1.07)
 * [7 is skipped by spec 1.07]
 * 6 => TLBIE (1.07)
 * 5 => v7r7m0.phyp (1.05)
 * [4 skipped]
 * 3 => v7r6m0.phyp (?)
 * [1,2 skipped]
 * 0 => v7r{2,3,4}m0.phyp (?)
 */
#define COUNTER_INFO_VERSION_CURRENT 0x8

/* capability mask masks. */
enum {
        HV_GPCI_CM_GA = (1 << 7),
        HV_GPCI_CM_EXPANDED = (1 << 6),
        HV_GPCI_CM_LAB = (1 << 5)
};

#define REQUEST_FILE "../hv-gpci-requests.h"
#define NAME_LOWER hv_gpci
#define NAME_UPPER HV_GPCI
#include "req-gen/perf.h"
#undef REQUEST_FILE
#undef NAME_LOWER
#undef NAME_UPPER

The side effect of moving seems that we would have to drag "hv-gpci-requests.h"
along as well. So, maybe its best just moving the struct as you've done so it
can be used by code outside of perf.

-Tyrel
