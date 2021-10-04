Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B59142143F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:38:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNRGc17Hzz3fj0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:38:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dhTcbDEY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQtm4x43z3cVb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:20:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dhTcbDEY; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4HNQtl4ZCWz4xbV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:20:47 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HNQtl4Ws8z4xb9; Tue,  5 Oct 2021 03:20:47 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dhTcbDEY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4HNQtk6HSWz4xLs;
 Tue,  5 Oct 2021 03:20:46 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194G1hPr019235; 
 Mon, 4 Oct 2021 12:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8mEx5a8kxg3IoTWi18BowCAvWWuK7NgNGuxSUB31DL4=;
 b=dhTcbDEYYhXVs/Zf/JRoOWEZmnJ2AOIPALxDIc/FXxPUyfqRJi6caxEdFcOx2ynUOBBC
 9uBJ3xpzfE5xgNl8LI7DyUlCsisUjNC4Wb8puj2KxOtBLbSj2a2xmlKF62v8CHxQfP2T
 B2fxOXtAjZtnmJp+ssgKjj5K1gmtLA5idiIiU7KrDpqlOX6I/SB/4CZMm0/b2ko2n8EV
 Hje6PsiRR86DS21DFC8c0fvx4fkl2T0ub/ehzKUwIJfniLn/+RgN7p0W53+4iXO58i9/
 YTydb8tZOg9D4MsZoTcbt/8fyM1rb7lsv8c2O6ix7tz1nfPYI7XfnYgmpAQ8AKtx05Iq Lg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bg4s98fwq-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 12:20:43 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 194G2VqS027596;
 Mon, 4 Oct 2021 16:06:47 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3bef29fwe4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 16:06:47 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 194G6hal5243392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Oct 2021 16:06:44 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E27DEAE073;
 Mon,  4 Oct 2021 16:06:43 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8CFEAE06A;
 Mon,  4 Oct 2021 16:06:40 +0000 (GMT)
Received: from [9.43.47.122] (unknown [9.43.47.122])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Oct 2021 16:06:40 +0000 (GMT)
Message-ID: <f13e218e-4e38-4076-672f-d555d7abfc02@linux.ibm.com>
Date: Mon, 4 Oct 2021 21:36:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/3] powerpc: Set crashkernel offset to mid of RMA region
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, mpe@ellerman.id.au
References: <20211004151142.256251-1-sourabhjain@linux.ibm.com>
 <20211004151142.256251-4-sourabhjain@linux.ibm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20211004151142.256251-4-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 61JBjjd8jZRKX-tCbnGeSiqOHzgJ8QbI
X-Proofpoint-ORIG-GUID: 61JBjjd8jZRKX-tCbnGeSiqOHzgJ8QbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040110
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
Cc: Abdul haleem <abdhalee@linux.vnet.ibm.com>, mahesh@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, hbathini@linux.ibm.com, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/4/21 20:41, Sourabh Jain wrote:
> On large config LPARs (having 192 and more cores), Linux fails to boot
> due to insufficient memory in the first memory block. It is due to the
> reserve crashkernel area starts at 128MB offset by default and which
> doesn't leave enough space in the first memory block to accommodate
> memory for other essential system resources.
> 
> Given that the RMA region size can be 512MB or more, setting the
> crashkernel offset to mid of RMA size will leave enough space to
> kernel to allocate memory for other system resources in the first
> memory block.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Reported-and-tested-by: Abdul haleem <abdhalee@linux.vnet.ibm.com>
> ---
>   arch/powerpc/kernel/rtas.c |  3 +++
>   arch/powerpc/kexec/core.c  | 13 +++++++++----
>   2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index ff80bbad22a5..ce5e62bb4d8e 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -1235,6 +1235,9 @@ int __init early_init_dt_scan_rtas(unsigned long node,
>   	entryp = of_get_flat_dt_prop(node, "linux,rtas-entry", NULL);
>   	sizep  = of_get_flat_dt_prop(node, "rtas-size", NULL);
>   
> +	if (of_get_flat_dt_prop(node, "ibm,hypertas-functions", NULL))
> +		powerpc_firmware_features |= FW_FEATURE_LPAR;
> +

The equivalent check that we currently do more than checking 
ibm,hypertas-functions.

	if (!strcmp(uname, "rtas") || !strcmp(uname, "rtas@0")) {
		prop = of_get_flat_dt_prop(node, "ibm,hypertas-functions",
					   &len);
		if (prop) {
			powerpc_firmware_features |= FW_FEATURE_LPAR;
			fw_hypertas_feature_init(prop, len);
		}


also do we expect other firmware features to be set along with 
FW_FEATURE_LPAR?

>   	if (basep && entryp && sizep) {
>   		rtas.base = *basep;
>   		rtas.entry = *entryp;
> diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
> index 48525e8b5730..f69cf3e370ec 100644
> --- a/arch/powerpc/kexec/core.c
> +++ b/arch/powerpc/kexec/core.c
> @@ -147,11 +147,16 @@ void __init reserve_crashkernel(void)
>   	if (!crashk_res.start) {
>   #ifdef CONFIG_PPC64
>   		/*
> -		 * On 64bit we split the RMO in half but cap it at half of
> -		 * a small SLB (128MB) since the crash kernel needs to place
> -		 * itself and some stacks to be in the first segment.
> +		 * crash kernel needs to placed in the first segment. On LPAR
> +		 * setting crash kernel start to mid of RMA size (512MB or more)
> +		 * would help primary kernel to boot properly on large config
> +		 * LPAR (with core count 192 or more) and for the reset keep
> +		 * cap the crash kernel start at 128MB offse.
>   		 */
> -		crashk_res.start = min(0x8000000ULL, (ppc64_rma_size / 2));
> +		if (firmware_has_feature(FW_FEATURE_LPAR))
> +			crashk_res.start = ppc64_rma_size / 2;
> +		else
> +			crashk_res.start = min(0x8000000ULL, (ppc64_rma_size / 2));
>   #else
>   		crashk_res.start = KDUMP_KERNELBASE;
>   #endif
> 

