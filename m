Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C89F64E73B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 07:16:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYJlq0WCjz3bgr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 17:16:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NBtqNzjb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYJkn5zDhz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 17:16:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NBtqNzjb;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4NYJkm030Pz4xMy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 17:16:00 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4NYJkm0001z4xGT; Fri, 16 Dec 2022 17:16:00 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NBtqNzjb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4NYJkk6j4wz4xGH;
	Fri, 16 Dec 2022 17:15:58 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BG6CPGx002923;
	Fri, 16 Dec 2022 06:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DUl280DRTik2SCEULc68eXkdtZHRRuX9MyRk3eCWkQY=;
 b=NBtqNzjb1eBiCrGxDv8QhoyI73bSuQd88bs/MbSv9/Ubzw8rgiasORitDYpPS6xijdZp
 Qf05zwLpsBE1+uDEEvAHPN6LZ7lfHBzgCj023+3W+ofVKIopU7ikgXWUwfdoAZwTM3AO
 eVqCka6I2/IrR+szy8dduvci/svAo734yden2eBdt/EoGgteCaHib0LrHylLVA1jUFE9
 Bd1vM41P2HwGDDSoWjqlTQVNiUAd5TFNFICaZ6aPXW1/cw+Arr15xpTqw2lITIubr9Fl
 gCC3wpt/2FN6ORXd/OAeYb51m7V+UlCtaMvlyCRB3/L9uVJZkSDs5F82ImRj8PV3JPhf Yw== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mgk6qr26g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Dec 2022 06:15:55 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BG3CDJC031920;
	Fri, 16 Dec 2022 06:15:53 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3meyqxtxqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Dec 2022 06:15:53 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BG6FnoU34996510
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Dec 2022 06:15:49 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A2E920040;
	Fri, 16 Dec 2022 06:15:49 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8C5020049;
	Fri, 16 Dec 2022 06:15:47 +0000 (GMT)
Received: from [9.43.10.49] (unknown [9.43.10.49])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Dec 2022 06:15:47 +0000 (GMT)
Message-ID: <8253623b-bf9b-4407-999f-506aa8c7e38f@linux.ibm.com>
Date: Fri, 16 Dec 2022 11:45:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] powerpc/kexec_file: account hot-pluggable memory while
 estimating FDT size
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20221215083801.301741-1-sourabhjain@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20221215083801.301741-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ytEX4ScNYghwYoPg08HJ0lbC6BGfyj6H
X-Proofpoint-ORIG-GUID: ytEX4ScNYghwYoPg08HJ0lbC6BGfyj6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_02,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160051
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
Cc: mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 15/12/22 2:08 pm, Sourabh Jain wrote:
> On Systems where online memory is lesser compared to max memory, the
> kexec_file_load system call may fail to load the kdump kernel with the
> below errors:
> 
>      "Failed to update fdt with linux,drconf-usable-memory property"
>      "Error setting up usable-memory property for kdump kernel"
> 
> This happens because the size estimation for usable memory properties
> for the kdump kernel's FDT is based on the online memory whereas the
> usable memory properties include max memory. In short, the hot-pluggable
> memory is not accounted for while estimating the size of the usable
> memory properties.
> 
> The issue is addressed by calculating usable memory property size using
> max hotplug address instead of the last online memory address.
> 
> Fixes: 2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kdump kernel")
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>

Thanks for the fix, Sourabh. Looks good to me.

Acked-by: Hari Bathini <hbathini@linux.ibm.com>

> ---
>   arch/powerpc/kexec/file_load_64.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index 349a781cea0b3..2c3fd6fe6bc94 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -947,7 +947,7 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
>   	 * linux,drconf-usable-memory properties. Get an approximate on the
>   	 * number of usable memory entries and use for FDT size estimation.
>   	 */
> -	usm_entries = ((memblock_end_of_DRAM() / drmem_lmb_size()) +
> +	usm_entries = ((memory_hotplug_max() / drmem_lmb_size()) +
>   		       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
>   	return (unsigned int)(usm_entries * sizeof(u64));
>   }
