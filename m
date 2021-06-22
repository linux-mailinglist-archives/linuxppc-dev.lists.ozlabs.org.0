Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 606EB3B0C9C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 20:11:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8ZGj1JdXz3bv1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 04:11:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LTFHORKV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LTFHORKV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8ZGB3BFqz2xtt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 04:11:13 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MI4CQo015335; Tue, 22 Jun 2021 14:11:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=1Jzec6T7FNSjIG24Whnf1n6RMSj5j+FV/Q+0nTzBQdM=;
 b=LTFHORKVXam7FUPr/5h/zu8Jz6rHOBXEi4DSBuo0NSLAnw9g/lFBAfcKlzWsH2d7AWX2
 47TozWcKo3Deah0LpW990wngmI5NA8DgdekquLDrxFnGrjIV3FMk9kdJviEdvdev7Hj/
 Q5SpF9hbSYQ83XqOoaChxYLXRWp/x1yGMqEXlHMGC58JHS7o/D6+bOFKZPPmtSzMhx2G
 k/Tg8mM14lrF8Zs5p4GFEgQ824RyHc8X2t/GKzEPRMneCGw7a180Pdoc0BKyEc2Hd/JF
 8vncitBNeoTELsTyMTvjrRq7i94FmN+vwHT6ui7s2dahaYslcEVgaxsaoLfB/jJrwjMU yg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bmsyr6q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 14:11:04 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15MI30PT022865;
 Tue, 22 Jun 2021 18:11:03 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 3998799y15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 18:11:03 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15MIB2oD7340852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 18:11:02 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA248B2066;
 Tue, 22 Jun 2021 18:11:02 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5ED43B206B;
 Tue, 22 Jun 2021 18:11:02 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.216.48])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 22 Jun 2021 18:11:02 +0000 (GMT)
Subject: Re: [PATCH 2/2] powerpc/prom_init: Pass linux_banner to firmware via
 option vector 7
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210621064938.2021419-1-mpe@ellerman.id.au>
 <20210621064938.2021419-2-mpe@ellerman.id.au>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <bead9552-1e5c-2485-0463-4d161cce2a1f@linux.ibm.com>
Date: Tue, 22 Jun 2021 11:11:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210621064938.2021419-2-mpe@ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ouX8t6eEkjx8GM5_0YtdkfqdVbX2-nTs
X-Proofpoint-GUID: ouX8t6eEkjx8GM5_0YtdkfqdVbX2-nTs
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_11:2021-06-22,
 2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 suspectscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220111
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

On 6/20/21 11:49 PM, Michael Ellerman wrote:
> Pass the value of linux_banner to firmware via option vector 7.
> 
> Option vector 7 is described in "LoPAR" Linux on Power Architecture
> Reference v2.9, in table B.7 on page 824:
> 
>   An ASCII character formatted null terminated string that describes
>   the client operating system. The string shall be human readable and
>   may be displayed on the console.
> 
> The string can be up to 256 bytes total, including the nul terminator.
> 
> linux_banner contains lots of information, and should make it possible
> to identify the exact kernel version that is running:
> 
>   const char linux_banner[] =
>   "Linux version " UTS_RELEASE " (" LINUX_COMPILE_BY "@"
>   LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION "\n";
> 
> For example:
>   Linux version 4.15.0-144-generic (buildd@bos02-ppc64el-018) (gcc
>   version 7.5.0 (Ubuntu 7.5.0-3ubuntu1~18.04)) #148-Ubuntu SMP Sat May 8
>   02:32:13 UTC 2021 (Ubuntu 4.15.0-144.148-generic 4.15.18)
> 
> It's also printed at boot to the console/dmesg, which should make it
> possible to correlate what firmware receives with the console/dmesg on
> the machine.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
> 
> NB. linux_banner is already allowed by prom_init_check.sh
> 
> LoPAR: https://openpowerfoundation.org/?resource_lib=linux-on-power-architecture-reference-a-papr-linux-subset-review-draft
> ---
>  arch/powerpc/kernel/prom_init.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index c18d55f8b951..7343076b261c 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -27,6 +27,7 @@
>  #include <linux/initrd.h>
>  #include <linux/bitops.h>
>  #include <linux/pgtable.h>
> +#include <linux/printk.h>
>  #include <asm/prom.h>
>  #include <asm/rtas.h>
>  #include <asm/page.h>
> @@ -944,6 +945,10 @@ struct option_vector6 {
>  	u8 os_name;
>  } __packed;
> 
> +struct option_vector7 {
> +	u8 os_id[256];
> +} __packed;
> +
>  struct ibm_arch_vec {
>  	struct { u32 mask, val; } pvrs[14];
> 
> @@ -966,6 +971,9 @@ struct ibm_arch_vec {
> 
>  	u8 vec6_len;
>  	struct option_vector6 vec6;
> +
> +	u8 vec7_len;
> +	struct option_vector7 vec7;
>  } __packed;
> 
>  static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
> @@ -1112,6 +1120,9 @@ static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
>  		.secondary_pteg = 0,
>  		.os_name = OV6_LINUX,
>  	},
> +
> +	/* option vector 7: OS Identification */
> +	.vec7_len = VECTOR_LENGTH(sizeof(struct option_vector7)),
>  };
> 
>  static struct ibm_arch_vec __prombss ibm_architecture_vec  ____cacheline_aligned;
> @@ -1340,6 +1351,10 @@ static void __init prom_check_platform_support(void)
>  	memcpy(&ibm_architecture_vec, &ibm_architecture_vec_template,
>  	       sizeof(ibm_architecture_vec));
> 
> +	prom_strscpy_pad(ibm_architecture_vec.vec7.os_id, linux_banner, 256);
> +	// Ensure nul termination
> +	ibm_architecture_vec.vec7.os_id[255] = '\0';
> +

Doesn't the implementation of prom_strscpy_pad() in patch 1 ensure nul termination?

-Tyrel

>  	if (prop_len > 1) {
>  		int i;
>  		u8 vec[8];
> 

