Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1494935C87D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 16:17:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJrRf0P2Dz3c1g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 00:17:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cFFXtn+s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cFFXtn+s; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJrRC2DNyz2yYh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 00:17:26 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13CE4OmC077556; Mon, 12 Apr 2021 10:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xYI2ryD7+6+zZPCZSb2a1k0FN7PgIpuHg4iXW30jUmA=;
 b=cFFXtn+sshacxABE5RyC9TXqBm8Slr4gRd+j/p+4BYnP7r7SspzvdumkJNvg7Iq6Yv5V
 ijtvHF+DMowucbKAWEJ0zHcpRShnIZB0wtFgOI5fypiDj+TlMi1b258xNAkQt1jF+B9j
 +aY9nuXccBqHsR6flwSwnwoeLUiCLrKoVQQoNKiTEE8/yFrQt20JT4VIf5MJZUC9EH2s
 rOWZVqX/Mk3ahT+RCRWRkCpn7S9HNCdrqHCCEPXo2ffvrAt1qJyQ28jUhTfyMF/4YZ/H
 0y3GMqXz8KpL7qel07AfDIrdUTsc05vcpGkINb+6lf/47Fgxi2L6dY+lvK0wOr8ire9a ow== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vkdjtgfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 10:17:17 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13CECEhP017254;
 Mon, 12 Apr 2021 14:17:16 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 37u3n9gp1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 14:17:16 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13CEHFC632178478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Apr 2021 14:17:15 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41C7B6A054;
 Mon, 12 Apr 2021 14:17:15 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8404A6A047;
 Mon, 12 Apr 2021 14:17:12 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.37.91])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Apr 2021 14:17:12 +0000 (GMT)
Subject: Re: [PATCH -next] powerpc/perf/hv-24x7: Make some symbols static
To: Bixuan Cui <cuibixuan@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20210409090124.59492-1-cuibixuan@huawei.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <8187bbd0-e626-d113-3449-58eea5b13571@linux.ibm.com>
Date: Mon, 12 Apr 2021 19:47:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210409090124.59492-1-cuibixuan@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ucZArozQ-G-GjPWGdqTxemrzaX2UmuFE
X-Proofpoint-GUID: ucZArozQ-G-GjPWGdqTxemrzaX2UmuFE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-12_10:2021-04-12,
 2021-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104120096
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/9/21 2:31 PM, Bixuan Cui wrote:
> The sparse tool complains as follows:
> 
> arch/powerpc/perf/hv-24x7.c:229:1: warning:
>  symbol '__pcpu_scope_hv_24x7_txn_flags' was not declared. Should it be static?
> arch/powerpc/perf/hv-24x7.c:230:1: warning:
>  symbol '__pcpu_scope_hv_24x7_txn_err' was not declared. Should it be static?
> arch/powerpc/perf/hv-24x7.c:236:1: warning:
>  symbol '__pcpu_scope_hv_24x7_hw' was not declared. Should it be static?
> arch/powerpc/perf/hv-24x7.c:244:1: warning:
>  symbol '__pcpu_scope_hv_24x7_reqb' was not declared. Should it be static?
> arch/powerpc/perf/hv-24x7.c:245:1: warning:
>  symbol '__pcpu_scope_hv_24x7_resb' was not declared. Should it be static?
> 
> This symbol is not used outside of hv-24x7.c, so this
> commit marks it static.

Patch looks good to me.

Reviewed-By: Kajol Jain<kjain@linux.ibm.com>

Thanks,
Kajol jain

> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
> ---
>  arch/powerpc/perf/hv-24x7.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index e5eb33255066..1816f560a465 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -226,14 +226,14 @@ static struct attribute_group event_long_desc_group = {
>  
>  static struct kmem_cache *hv_page_cache;
>  
> -DEFINE_PER_CPU(int, hv_24x7_txn_flags);
> -DEFINE_PER_CPU(int, hv_24x7_txn_err);
> +static DEFINE_PER_CPU(int, hv_24x7_txn_flags);
> +static DEFINE_PER_CPU(int, hv_24x7_txn_err);
>  
>  struct hv_24x7_hw {
>  	struct perf_event *events[255];
>  };
>  
> -DEFINE_PER_CPU(struct hv_24x7_hw, hv_24x7_hw);
> +static DEFINE_PER_CPU(struct hv_24x7_hw, hv_24x7_hw);
>  
>  /*
>   * request_buffer and result_buffer are not required to be 4k aligned,
> @@ -241,8 +241,8 @@ DEFINE_PER_CPU(struct hv_24x7_hw, hv_24x7_hw);
>   * the simplest way to ensure that.
>   */
>  #define H24x7_DATA_BUFFER_SIZE	4096
> -DEFINE_PER_CPU(char, hv_24x7_reqb[H24x7_DATA_BUFFER_SIZE]) __aligned(4096);
> -DEFINE_PER_CPU(char, hv_24x7_resb[H24x7_DATA_BUFFER_SIZE]) __aligned(4096);
> +static DEFINE_PER_CPU(char, hv_24x7_reqb[H24x7_DATA_BUFFER_SIZE]) __aligned(4096);
> +static DEFINE_PER_CPU(char, hv_24x7_resb[H24x7_DATA_BUFFER_SIZE]) __aligned(4096);
>  
>  static unsigned int max_num_requests(int interface_version)
>  {
> 
