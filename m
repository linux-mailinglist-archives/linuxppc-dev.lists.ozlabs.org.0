Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4286235806
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 09:48:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Jgrn6L6szDqYb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 17:48:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JgqR1VzvzDqWg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 17:47:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45JgqQ51hcz8tR6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 17:47:14 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45JgqQ4Zvpz9sBb; Wed,  5 Jun 2019 17:47:14 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45JgqP47v2z9s4Y
 for <linuxppc-dev@ozlabs.org>; Wed,  5 Jun 2019 17:47:13 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x557fqYg126091
 for <linuxppc-dev@ozlabs.org>; Wed, 5 Jun 2019 03:47:10 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sx66hq5ek-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 05 Jun 2019 03:47:10 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <ajd@linux.ibm.com>;
 Wed, 5 Jun 2019 08:42:08 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 5 Jun 2019 08:42:06 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x557g53L52166888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jun 2019 07:42:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71FE04C040;
 Wed,  5 Jun 2019 07:42:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22F054C046;
 Wed,  5 Jun 2019 07:42:05 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jun 2019 07:42:05 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C2B1DA00F6;
 Wed,  5 Jun 2019 17:42:03 +1000 (AEST)
Subject: Re: [PATCH v5] powerpc/64s: support nospectre_v2 cmdline option
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
References: <20190524024647.381-1-cmr@informatik.wtf>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Wed, 5 Jun 2019 17:42:03 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190524024647.381-1-cmr@informatik.wtf>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19060507-0020-0000-0000-00000345DE6F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060507-0021-0000-0000-00002198EBB8
Message-Id: <98c47360-c89c-5f4d-1c32-f6ac0ddd7f1e@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-05_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906050050
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

On 24/5/19 12:46 pm, Christopher M. Riedl wrote:
> Add support for disabling the kernel implemented spectre v2 mitigation
> (count cache flush on context switch) via the nospectre_v2 and
> mitigations=off cmdline options.
> 
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

snowpatch is whinging about this breaking the build for some reason... 
https://patchwork.ozlabs.org/patch/1104583/


> ---
> v4->v5:
> 	Fix checkpatch complaint
>   arch/powerpc/kernel/security.c | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
> index e1c9cf079503..7cfcb294b11c 100644
> --- a/arch/powerpc/kernel/security.c
> +++ b/arch/powerpc/kernel/security.c
> @@ -28,7 +28,7 @@ static enum count_cache_flush_type count_cache_flush_type = COUNT_CACHE_FLUSH_NO
>   bool barrier_nospec_enabled;
>   static bool no_nospec;
>   static bool btb_flush_enabled;
> -#ifdef CONFIG_PPC_FSL_BOOK3E
> +#if defined(CONFIG_PPC_FSL_BOOK3E) || defined(CONFIG_PPC_BOOK3S_64)
>   static bool no_spectrev2;
>   #endif
>   
> @@ -114,7 +114,7 @@ static __init int security_feature_debugfs_init(void)
>   device_initcall(security_feature_debugfs_init);
>   #endif /* CONFIG_DEBUG_FS */
>   
> -#ifdef CONFIG_PPC_FSL_BOOK3E
> +#if defined(CONFIG_PPC_FSL_BOOK3E) || defined(CONFIG_PPC_BOOK3S_64)
>   static int __init handle_nospectre_v2(char *p)
>   {
>   	no_spectrev2 = true;
> @@ -122,6 +122,9 @@ static int __init handle_nospectre_v2(char *p)
>   	return 0;
>   }
>   early_param("nospectre_v2", handle_nospectre_v2);
> +#endif /* CONFIG_PPC_FSL_BOOK3E || CONFIG_PPC_BOOK3S_64 */
> +
> +#ifdef CONFIG_PPC_FSL_BOOK3E
>   void setup_spectre_v2(void)
>   {
>   	if (no_spectrev2 || cpu_mitigations_off())
> @@ -399,7 +402,17 @@ static void toggle_count_cache_flush(bool enable)
>   
>   void setup_count_cache_flush(void)
>   {
> -	toggle_count_cache_flush(true);
> +	bool enable = true;
> +
> +	if (no_spectrev2 || cpu_mitigations_off()) {
> +		if (security_ftr_enabled(SEC_FTR_BCCTRL_SERIALISED) ||
> +		    security_ftr_enabled(SEC_FTR_COUNT_CACHE_DISABLED))
> +			pr_warn("Spectre v2 mitigations not under software control, can't disable\n");
> +
> +		enable = false;
> +	}
> +
> +	toggle_count_cache_flush(enable);
>   }
>   
>   #ifdef CONFIG_DEBUG_FS
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

