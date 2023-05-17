Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E1E7062D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 10:29:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLmVL5xM8z3f7Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 18:29:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k/16QzAq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k/16QzAq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLmTT5Svlz3cNF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 18:28:29 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34H8RVAU030912;
	Wed, 17 May 2023 08:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5KQPeLmIpYphB2nxWSuQHICoK7UYpXRIVghCMin7svE=;
 b=k/16QzAq3tSLdUnRXim6Od/wCTbK6ZF2Ch2iBL4ldAa2WEb3Zo+lWxvfZw/W4wfIKicG
 MOSBhNef0P+fftB2lFHUnBu9KwP/e1jd7XmrSZyFZm0GJ/ozJGOnvM3CBa00qEGdjR7X
 xINh6OCkk3uPANESks+FLCh7xSnaX06Y6OdiRsCrYVmYliq0oBRmfaDW3OgCdmszkq+3
 ofkx+8IMvmt2G5n4uUNo7NUtB5ExQtkd/fubj5SX2WugABoWBDFW2K9m14NUVmOT+ivD
 vXLFGzuKkyZP0Igli9kPhDR58HXD/JnJYwjV8T9MoRS8p2I2JXuV3wU/TG7193cVCGdU vw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qmtep24gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 08:28:21 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34H3JNFE025570;
	Wed, 17 May 2023 08:28:18 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3qj264t2mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 08:28:18 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34H8SG9642205906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 May 2023 08:28:16 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 604E320040;
	Wed, 17 May 2023 08:28:16 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5EA120043;
	Wed, 17 May 2023 08:28:15 +0000 (GMT)
Received: from [9.199.156.35] (unknown [9.199.156.35])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 17 May 2023 08:28:15 +0000 (GMT)
Message-ID: <e2f0fd0a-f51e-e509-8827-72f1f05bbb5a@linux.ibm.com>
Date: Wed, 17 May 2023 13:58:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] powerpc/security: Fix Speculation_Store_Bypass reporting
 on Power10
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20230517074945.53188-1-mpe@ellerman.id.au>
From: R Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <20230517074945.53188-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4OWNyFNmrsaqRbC_z7VEVGf4XlAF94Tb
X-Proofpoint-GUID: 4OWNyFNmrsaqRbC_z7VEVGf4XlAF94Tb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_14,2023-05-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170065
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
Cc: ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 17/05/23 1:19 pm, Michael Ellerman wrote:
> Nageswara reported that /proc/self/status was showing "vulnerable" for
> the Speculation_Store_Bypass feature on Power10, eg:
> 
>    $ grep Speculation_Store_Bypass: /proc/self/status
>    Speculation_Store_Bypass:       vulnerable
> 
> But at the same time the sysfs files, and lscpu, were showing "Not
> affected".
> 
> This turns out to simply be a bug in the reporting of the
> Speculation_Store_Bypass, aka. PR_SPEC_STORE_BYPASS, case.
> 
> When SEC_FTR_STF_BARRIER was added, so that firmware could communicate
> the vulnerability was not present, the code in ssb_prctl_get() was not
> updated to check the new flag.
> 
> So add the check for SEC_FTR_STF_BARRIER being disabled. Rather than
> adding the new check to the existing if block and expanding the comment
> to cover both cases, rewrite the three cases to be separate so they can
> be commented separately for clarity.
> 
> Fixes: 84ed26fd00c5 ("powerpc/security: Add a security feature for STF barrier")
> Cc: stable@vger.kernel.org # v5.14+
> Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks for the patch. Adding tested-by tag along with test results.

With out patch:
# grep Speculation_Store_Bypass: /proc/self/status
Speculation_Store_Bypass:	vulnerable
# uname -r
6.4.0-rc2

With patch:
# grep Speculation_Store_Bypass: /proc/self/status
Speculation_Store_Bypass:	not vulnerable
# uname -r
6.4.0-rc2

Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>


> ---
>   arch/powerpc/kernel/security.c | 37 +++++++++++++++++-----------------
>   1 file changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
> index 206475e3e0b4..4856e1a5161c 100644
> --- a/arch/powerpc/kernel/security.c
> +++ b/arch/powerpc/kernel/security.c
> @@ -364,26 +364,27 @@ ssize_t cpu_show_spec_store_bypass(struct device *dev, struct device_attribute *
>   
>   static int ssb_prctl_get(struct task_struct *task)
>   {
> +	/*
> +	 * The STF_BARRIER feature is on by default, so if it's off that means
> +	 * firmware has explicitly said the CPU is not vulnerable via either
> +	 * the hypercall or device tree.
> +	 */
> +	if (!security_ftr_enabled(SEC_FTR_STF_BARRIER))
> +		return PR_SPEC_NOT_AFFECTED;
> +
> +	/*
> +	 * If the system's CPU has no known barrier (see setup_stf_barrier())
> +	 * then assume that the CPU is not vulnerable.
> +	 */
>   	if (stf_enabled_flush_types == STF_BARRIER_NONE)
> -		/*
> -		 * We don't have an explicit signal from firmware that we're
> -		 * vulnerable or not, we only have certain CPU revisions that
> -		 * are known to be vulnerable.
> -		 *
> -		 * We assume that if we're on another CPU, where the barrier is
> -		 * NONE, then we are not vulnerable.
> -		 */
>   		return PR_SPEC_NOT_AFFECTED;
> -	else
> -		/*
> -		 * If we do have a barrier type then we are vulnerable. The
> -		 * barrier is not a global or per-process mitigation, so the
> -		 * only value we can report here is PR_SPEC_ENABLE, which
> -		 * appears as "vulnerable" in /proc.
> -		 */
> -		return PR_SPEC_ENABLE;
> -
> -	return -EINVAL;
> +
> +	/*
> +	 * Otherwise the CPU is vulnerable. The barrier is not a global or
> +	 * per-process mitigation, so the only value that can be reported here
> +	 * is PR_SPEC_ENABLE, which appears as "vulnerable" in /proc.
> +	 */
> +	return PR_SPEC_ENABLE;
>   }
>   
>   int arch_prctl_spec_ctrl_get(struct task_struct *task, unsigned long which)

-- 
Thanks and Regards
R.Nageswara Sastry
