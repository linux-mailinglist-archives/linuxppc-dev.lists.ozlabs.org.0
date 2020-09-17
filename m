Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D553026D2AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 06:32:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsPFq1JnHzDqWR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 14:32:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsPD76jF8zDqCb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 14:31:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JB5Q2r48; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BsPD74Bpmz8xj7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 14:31:03 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BsPD73XP8z9sTQ; Thu, 17 Sep 2020 14:31:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JB5Q2r48; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BsPD66ztxz9sSn;
 Thu, 17 Sep 2020 14:31:02 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08H42Ej9032738; Thu, 17 Sep 2020 00:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=t7IHFZWds6hqb1RhGVojLsQ2Q1hnJtMB5crG+GYsS9U=;
 b=JB5Q2r48CrrSXBfFo7+kVIKzYI755zx3JlR/CcTViXLb8hd3lBGmmQhn3nCIOvLykerG
 LY72GAvjfymuncmORsRPfrIxaByRxXDrG0Om9hRRSnaSra02exvGiZQohL3HfBfKXgyU
 ah+nb1McSTphbId+hSMWwcJsCXzopM91zCOj8DaKE8rbUnZnCGxLGj+3zPMpbl3oxbbR
 o+YYmkVRY7EtiUiLT7f3bSd8YAhJCzrgBPcoxDIP394kpDePyKGbERuySp5eNAXVZIbD
 NKDtRiMaqPYrTF1ieADgyE7PspKmyjSyzRBv++/A+6aXBa9aukk2b5PonvbUfgu4fvjD vg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33kwph4576-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 00:30:59 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08H4S3S8028256;
 Thu, 17 Sep 2020 04:30:57 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 33k64s8tqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 04:30:57 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08H4UtCY13238680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Sep 2020 04:30:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D1BE4C044;
 Thu, 17 Sep 2020 04:30:55 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 544DE4C050;
 Thu, 17 Sep 2020 04:30:54 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.89.36])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Sep 2020 04:30:54 +0000 (GMT)
Subject: Re: [PATCH 2/2] powerpc/perf: Add declarations to fix sparse warnings
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20200916115637.3100484-1-mpe@ellerman.id.au>
 <20200916115637.3100484-2-mpe@ellerman.id.au>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <5b9dac60-bb02-991f-7f97-3d529f078744@linux.ibm.com>
Date: Thu, 17 Sep 2020 10:00:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200916115637.3100484-2-mpe@ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_02:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170023
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



On 9/16/20 5:26 PM, Michael Ellerman wrote:
> Sparse warns about all the init functions:
>    symbol init_ppc970_pmu was not declared. Should it be static?
>    symbol init_power5p_pmu was not declared. Should it be static?
>    symbol init_power5_pmu was not declared. Should it be static?
>    symbol init_power6_pmu was not declared. Should it be static?
>    symbol init_power7_pmu was not declared. Should it be static?
>    symbol init_power9_pmu was not declared. Should it be static?
>    symbol init_power8_pmu was not declared. Should it be static?
>    symbol init_generic_compat_pmu was not declared. Should it be static?
>
> They're already declared in internal.h, so just make sure all the C
> files include that directly or indirectly.

Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>

> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   arch/powerpc/perf/isa207-common.h | 2 ++
>   arch/powerpc/perf/power10-pmu.c   | 1 -
>   arch/powerpc/perf/power5+-pmu.c   | 2 ++
>   arch/powerpc/perf/power5-pmu.c    | 2 ++
>   arch/powerpc/perf/power6-pmu.c    | 2 ++
>   arch/powerpc/perf/power7-pmu.c    | 2 ++
>   arch/powerpc/perf/ppc970-pmu.c    | 2 ++
>   7 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
> index 044de65e96b9..7025de5e60e7 100644
> --- a/arch/powerpc/perf/isa207-common.h
> +++ b/arch/powerpc/perf/isa207-common.h
> @@ -13,6 +13,8 @@
>   #include <asm/firmware.h>
>   #include <asm/cputable.h>
>
> +#include "internal.h"
> +
>   #define EVENT_EBB_MASK		1ull
>   #define EVENT_EBB_SHIFT		PERF_EVENT_CONFIG_EBB_SHIFT
>   #define EVENT_BHRB_MASK		1ull
> diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
> index 83148656b524..9dbe8f9b89b4 100644
> --- a/arch/powerpc/perf/power10-pmu.c
> +++ b/arch/powerpc/perf/power10-pmu.c
> @@ -9,7 +9,6 @@
>   #define pr_fmt(fmt)	"power10-pmu: " fmt
>
>   #include "isa207-common.h"
> -#include "internal.h"
>
>   /*
>    * Raw event encoding for Power10:
> diff --git a/arch/powerpc/perf/power5+-pmu.c b/arch/powerpc/perf/power5+-pmu.c
> index a62b2cd7914f..3e64b4a1511f 100644
> --- a/arch/powerpc/perf/power5+-pmu.c
> +++ b/arch/powerpc/perf/power5+-pmu.c
> @@ -10,6 +10,8 @@
>   #include <asm/reg.h>
>   #include <asm/cputable.h>
>
> +#include "internal.h"
> +
>   /*
>    * Bits in event code for POWER5+ (POWER5 GS) and POWER5++ (POWER5 GS DD3)
>    */
> diff --git a/arch/powerpc/perf/power5-pmu.c b/arch/powerpc/perf/power5-pmu.c
> index 8732b587cf71..017bb19b73fb 100644
> --- a/arch/powerpc/perf/power5-pmu.c
> +++ b/arch/powerpc/perf/power5-pmu.c
> @@ -10,6 +10,8 @@
>   #include <asm/reg.h>
>   #include <asm/cputable.h>
>
> +#include "internal.h"
> +
>   /*
>    * Bits in event code for POWER5 (not POWER5++)
>    */
> diff --git a/arch/powerpc/perf/power6-pmu.c b/arch/powerpc/perf/power6-pmu.c
> index 0e318cf87129..189974478e9f 100644
> --- a/arch/powerpc/perf/power6-pmu.c
> +++ b/arch/powerpc/perf/power6-pmu.c
> @@ -10,6 +10,8 @@
>   #include <asm/reg.h>
>   #include <asm/cputable.h>
>
> +#include "internal.h"
> +
>   /*
>    * Bits in event code for POWER6
>    */
> diff --git a/arch/powerpc/perf/power7-pmu.c b/arch/powerpc/perf/power7-pmu.c
> index 5e0bf09cf077..bacfab104a1a 100644
> --- a/arch/powerpc/perf/power7-pmu.c
> +++ b/arch/powerpc/perf/power7-pmu.c
> @@ -10,6 +10,8 @@
>   #include <asm/reg.h>
>   #include <asm/cputable.h>
>
> +#include "internal.h"
> +
>   /*
>    * Bits in event code for POWER7
>    */
> diff --git a/arch/powerpc/perf/ppc970-pmu.c b/arch/powerpc/perf/ppc970-pmu.c
> index d35223fb112c..7d78df97f272 100644
> --- a/arch/powerpc/perf/ppc970-pmu.c
> +++ b/arch/powerpc/perf/ppc970-pmu.c
> @@ -9,6 +9,8 @@
>   #include <asm/reg.h>
>   #include <asm/cputable.h>
>
> +#include "internal.h"
> +
>   /*
>    * Bits in event code for PPC970
>    */

