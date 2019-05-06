Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCBA14353
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 03:34:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44y4zF178pzDqJf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 11:34:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44y4xt3ytRzDqHK
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 11:33:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44y4xt3KQGz8tGc
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 11:33:22 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44y4xt2wh3z9s9G; Mon,  6 May 2019 11:33:22 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44y4xs6d50z9s7T
 for <linuxppc-dev@ozlabs.org>; Mon,  6 May 2019 11:33:21 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x461Wvu1066508
 for <linuxppc-dev@ozlabs.org>; Sun, 5 May 2019 21:33:18 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sa3fhwm7f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Sun, 05 May 2019 21:33:18 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <ajd@linux.ibm.com>;
 Mon, 6 May 2019 02:33:15 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 May 2019 02:33:13 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x461XCuR48038012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 May 2019 01:33:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79DFFAE045;
 Mon,  6 May 2019 01:33:12 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B029AE04D;
 Mon,  6 May 2019 01:33:12 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 May 2019 01:33:12 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4377AA0125;
 Mon,  6 May 2019 11:33:10 +1000 (AEST)
Subject: Re: [PATCH] powerpc/64s: support nospectre_v2 cmdline option
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
References: <20190505221048.28212-1-cmr@informatik.wtf>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Mon, 6 May 2019 11:32:58 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190505221048.28212-1-cmr@informatik.wtf>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19050601-0028-0000-0000-0000036AA67E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050601-0029-0000-0000-0000242A197F
Message-Id: <271ab704-e3d2-f04c-4758-2b08c1b3909c@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905060011
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

On 6/5/19 8:10 am, Christopher M. Riedl wrote:
> Add support for disabling the kernel implemented spectre v2 mitigation
> (count cache flush on context switch) via the nospectre_v2 cmdline
> option.
> 
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> ---
> 
>   arch/powerpc/kernel/security.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
> index b33bafb8fcea..f7c34745cd0f 100644
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
> @@ -106,7 +106,7 @@ static __init int barrier_nospec_debugfs_init(void)
>   device_initcall(barrier_nospec_debugfs_init);
>   #endif /* CONFIG_DEBUG_FS */
>   
> -#ifdef CONFIG_PPC_FSL_BOOK3E
> +#if defined(CONFIG_PPC_FSL_BOOK3E) || defined(CONFIG_PPC_BOOK3S_64)
>   static int __init handle_nospectre_v2(char *p)
>   {
>   	no_spectrev2 = true;
> @@ -114,6 +114,9 @@ static int __init handle_nospectre_v2(char *p)
>   	return 0;
>   }
>   early_param("nospectre_v2", handle_nospectre_v2);
> +#endif /* CONFIG_PPC_FSL_BOOK3E || CONFIG_PPC_BOOK3S_64 */
> +
> +#ifdef CONFIG_PPC_FSL_BOOK3E
>   void setup_spectre_v2(void)
>   {
>   	if (no_spectrev2)
> @@ -391,6 +394,13 @@ static void toggle_count_cache_flush(bool enable)
>   
>   void setup_count_cache_flush(void)
>   {
> +	if (no_spectrev2) {
> +		if (security_ftr_enabled(SEC_FTR_BCCTRL_SERIALISED)
> +		    || security_ftr_enabled(SEC_FTR_COUNT_CACHE_DISABLED))
> +			pr_warn("Spectre v2 mitigations not under software control, can't disable\n");

If one of those ftrs is set, what's the impact of not calling 
toggle_count_cache_flush()?

> +		return;
> +	}
> +
>   	toggle_count_cache_flush(true);
>   }
>   
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

