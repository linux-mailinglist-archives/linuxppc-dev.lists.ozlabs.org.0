Return-Path: <linuxppc-dev+bounces-17765-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDYHBuYIqWlc0gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17765-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 05:39:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F9C20ADBD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 05:39:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRGyT0S7Zz3c1T;
	Thu, 05 Mar 2026 15:38:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772685536;
	cv=none; b=KGc383kwgOgzZDEzYpOZ0w/6VFGITPD1L7p5IvhVMNKxiy/vP4qZewEuPnnre0LROJEFFsSCU4VfYRTHr11sGr9bnsuWPxzqmWuVxvP8BUNiPsHQ2h33pzcWN/fG3MZr3QvExEymLkIzPshcK7TpBBy7XzkXJVkenW4iEpbde47TSHSRRoAmPszk2sGIzNPV9zt//PkzywR9ovdjCXOLvoPdUuMLMCdaX2LgDYZP27pHO/xMFk+PxfIvkghWp8Mw3wnSGceh2hFvhnYlgCMBTFuBZaEyWDErqa+9QjkzGzivERY5xFZAoolLvVuWm1YcsNqIJ7f+IecBHsa1GYiCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772685536; c=relaxed/relaxed;
	bh=7DKCi0CEZ4kOlHss64569CeW7Pl6xyCkAjw18r6eN7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CdjOYEnVBkVPvzTJ/lhsJZtctzZW5CZtmNMgqa8RaYB3PUXyUs0kM27/6byOT4o0EcMeY7S4dUKZ+xNse94MzbclXvZZI/DByMCJHBA8/A+CF+O8KhOqWLN2xLtXGbbREDldWD4tNBKHNY1H7BxNM+mki9+7PrmBvNkEJJd6yaraFRTIdhGlIz6UfPmKVaq/aAyEdMLp+YFWQiByBdNXrmZq4PCse6w71l6BXRO7bHxO/adDVJPvAKKdxNVCdP7wrHKGtUhhKxskg7xKYMTAWxm9vLGXeCNWwsJoldIIzqVYiENfKP+HjJfHjhwFTXYfmtH2KfRnmiPPvnRT68k6Ug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZmbtqWUQ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZmbtqWUQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRGyS07Btz3bhG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 15:38:55 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62512PmS2060996;
	Thu, 5 Mar 2026 04:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7DKCi0
	CEZ4kOlHss64569CeW7Pl6xyCkAjw18r6eN7o=; b=ZmbtqWUQYgedcK2lOV6dwD
	GbGQO42SwgW5k+PgCa37CT9ErBfyiCGtYFurQvSvGczV0X6rq6OqW4RyJrl5VwX7
	pvYhk5pdtT+8EdJj6HoJ6BT0KfLGgIAj7Rmqa9QALDAV4DcbR8YfY0yVdnSGiwD7
	pPX3MITOnnHQW1xpTHsJMhFgg+l3MXz4NhoocB4JZ3o9yHlI6G76oz9Fi/FdNRwB
	0VD/gbH2rEvp+v+YM34bEjA82OVzgXoYXDpta8wmlT4XvU+K10XmbvseGxQvCjbn
	/smr7tvmyBiocsAhRLgo7GCwDbdskaAdszlyTeKLZ81syDRh6P/kizFJ/1u9ORTg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksrja7bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 04:38:50 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6254DI7n028908;
	Thu, 5 Mar 2026 04:38:50 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmaps9rsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Mar 2026 04:38:50 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6254cmFg40698520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Mar 2026 04:38:48 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0924D5805F;
	Thu,  5 Mar 2026 04:38:48 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CACD758043;
	Thu,  5 Mar 2026 04:38:44 +0000 (GMT)
Received: from [9.61.242.165] (unknown [9.61.242.165])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  5 Mar 2026 04:38:44 +0000 (GMT)
Message-ID: <54abb4c8-56e5-46fa-93cf-f34c42b42720@linux.ibm.com>
Date: Thu, 5 Mar 2026 10:08:43 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] powerpc: fix KUAP warning in VMX usercopy path
To: Sayali Patil <sayalip@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com
Cc: aboorvad@linux.ibm.com, sshegde@linux.ibm.com, chleroy@kernel.org,
        riteshh@linux.ibm.com, hbathini@linux.ibm.com, ming.lei@redhat.com,
        csander@purestorage.com, czhong@redhat.com
References: <20260304122201.153049-1-sayalip@linux.ibm.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20260304122201.153049-1-sayalip@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Rp/I7SmK c=1 sm=1 tr=0 ts=69a908da cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=_xPUD3OQOQiS13dPZGkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAzMyBTYWx0ZWRfXzrD1WMbq4abf
 9IMF5H30Fl7kvxjtmwbAagMWbm4Gpl1oZ96N0AuY7qH9WAAwV5vGRIkujxqx0WUnH2Fnfh4JEyE
 cvjysHVmycL3LBr+DfCknOaRnqLJYnxQV6Vi29sJ990pAU7T123oA+ELwm5G/piCI/EMEvglCwH
 swVEDcCKC0Op5Nr9ioPjgXRjbFLsaq5UiHS9SJKw3Z9ggrFoX8y/CYdHnwkVo07J3Ex4tCFR4Kj
 FQGCIUbvB2mSNoa37adZyGIYjMpfvyTPLyyU62qQHYRZL7KHPYSFotjwoYgsFk3prhUl4fkPLjX
 7tGFewtaPWbFlJ7+iHn0zkkoDrmNpWPNVc7hun/LMYsEO8avhN/qvHaqLU6gd/5o57vWWrD/UPB
 Um3+b46Nb2Qk84ogcZsuoLQ1AdoNaEhn2OE8IbhTu5xCqyUu7aKKmSaKj/5UyFBsC48Hpj5CuSi
 ILn2dHrQRMoAA/KV+Lw==
X-Proofpoint-GUID: 5ETEwn3Ru8pMiAeHGhhS3l5eglMn0M34
X-Proofpoint-ORIG-GUID: 5ETEwn3Ru8pMiAeHGhhS3l5eglMn0M34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050033
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 81F9C20ADBD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-17765-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sayalip@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:aboorvad@linux.ibm.com,m:sshegde@linux.ibm.com,m:chleroy@kernel.org,m:riteshh@linux.ibm.com,m:hbathini@linux.ibm.com,m:ming.lei@redhat.com,m:csander@purestorage.com,m:czhong@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action


On 04/03/26 5:52 pm, Sayali Patil wrote:
> On powerpc with PREEMPT_FULL or PREEMPT_LAZY and function tracing enabled,
> KUAP warnings can be triggered from the VMX usercopy path under memory
> stress workloads.
>
> KUAP requires that no subfunctions are called once userspace access has
> been enabled. The existing VMX copy implementation violates this
> requirement by invoking enter_vmx_usercopy() from the assembly path after
> userspace access has already been enabled. If preemption occurs
> in this window, the AMR state may not be preserved correctly,
> leading to unexpected userspace access state and resulting in
> KUAP warnings.
>
> Fix this by restructuring the VMX usercopy flow so that VMX selection
> and VMX state management are centralized in raw_copy_tofrom_user(),
> which is invoked by the raw_copy_{to,from,in}_user() wrappers.
>
> The new flow is:
>
>    - raw_copy_{to,from,in}_user() calls raw_copy_tofrom_user()
>    - raw_copy_tofrom_user() decides whether to use the VMX path
>      based on size and CPU capability
>    - Call enter_vmx_usercopy() before enabling userspace access
>    - Enable userspace access as per the copy direction
>      and perform the VMX copy
>    - Disable userspace access as per the copy direction
>    - Call exit_vmx_usercopy()
>    - Fall back to the base copy routine if the VMX copy faults
>
> With this change, the VMX assembly routines no longer perform VMX state
> management or call helper functions; they only implement the
> copy operations.
> The previous feature-section based VMX selection inside
> __copy_tofrom_user_power7() is removed, and a dedicated
> __copy_tofrom_user_power7_vmx() entry point is introduced.
>
> This ensures correct KUAP ordering, avoids subfunction calls
> while KUAP is unlocked, and eliminates the warnings while preserving
> the VMX fast path.
>
> Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel Userspace Access Protection")
> Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Closes: https://lore.kernel.org/all/20260109064917.777587-2-sshegde@linux.ibm.com/
> Suggested-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Co-developed-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
> ---


This patch fixes, reported issue.


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.


>
> v3->v4
>    - Addressd as per review feedback for some editorial comments.
>
> v3: https://lore.kernel.org/all/20260304053506.118632-1-sayalip@linux.ibm.com/
>
> ---
>   arch/powerpc/include/asm/uaccess.h | 65 +++++++++++++++++++++---------
>   arch/powerpc/lib/copyuser_64.S     |  1 +
>   arch/powerpc/lib/copyuser_power7.S | 45 +++++++--------------
>   arch/powerpc/lib/vmx-helper.c      |  2 +
>   4 files changed, 63 insertions(+), 50 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index ba1d878c3f40..8b25be472cf0 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -15,6 +15,9 @@
>   #define TASK_SIZE_MAX		TASK_SIZE_USER64
>   #endif
>   
> +/* Threshold above which VMX copy path is used */
> +#define VMX_COPY_THRESHOLD 3328
> +
>   #include <asm-generic/access_ok.h>
>   
>   /*
> @@ -326,40 +329,62 @@ do {								\
>   extern unsigned long __copy_tofrom_user(void __user *to,
>   		const void __user *from, unsigned long size);
>   
> -#ifdef __powerpc64__
> -static inline unsigned long
> -raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
> +unsigned long __copy_tofrom_user_base(void __user *to,
> +				      const void __user *from, unsigned long size);
> +
> +unsigned long __copy_tofrom_user_power7_vmx(void __user *to,
> +					    const void __user *from, unsigned long size);
> +
> +static __always_inline bool will_use_vmx(unsigned long n)
> +{
> +	return IS_ENABLED(CONFIG_ALTIVEC) && cpu_has_feature(CPU_FTR_VMX_COPY) &&
> +	       n > VMX_COPY_THRESHOLD;
> +}
> +
> +static __always_inline unsigned long
> +raw_copy_tofrom_user(void __user *to, const void __user *from,
> +		     unsigned long n, unsigned long dir)
>   {
>   	unsigned long ret;
>   
> -	barrier_nospec();
> -	allow_user_access(to, KUAP_READ_WRITE);
> +	if (will_use_vmx(n) && enter_vmx_usercopy()) {
> +		allow_user_access(to, dir);
> +		ret = __copy_tofrom_user_power7_vmx(to, from, n);
> +		prevent_user_access(dir);
> +		exit_vmx_usercopy();
> +
> +		if (unlikely(ret)) {
> +			allow_user_access(to, dir);
> +			ret = __copy_tofrom_user_base(to, from, n);
> +			prevent_user_access(dir);
> +		}
> +		return ret;
> +	}
> +
> +	allow_user_access(to, dir);
>   	ret = __copy_tofrom_user(to, from, n);
> -	prevent_user_access(KUAP_READ_WRITE);
> +	prevent_user_access(dir);
>   	return ret;
>   }
> -#endif /* __powerpc64__ */
>   
> -static inline unsigned long raw_copy_from_user(void *to,
> -		const void __user *from, unsigned long n)
> +#ifdef CONFIG_PPC64
> +static inline unsigned long
> +raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
>   {
> -	unsigned long ret;
> +	barrier_nospec();
> +	return raw_copy_tofrom_user(to, from, n, KUAP_READ_WRITE);
> +}
> +#endif /* CONFIG_PPC64 */
>   
> -	allow_user_access(NULL, KUAP_READ);
> -	ret = __copy_tofrom_user((__force void __user *)to, from, n);
> -	prevent_user_access(KUAP_READ);
> -	return ret;
> +static inline unsigned long raw_copy_from_user(void *to, const void __user *from, unsigned long n)
> +{
> +	return raw_copy_tofrom_user((__force void __user *)to, from, n, KUAP_READ);
>   }
>   
>   static inline unsigned long
>   raw_copy_to_user(void __user *to, const void *from, unsigned long n)
>   {
> -	unsigned long ret;
> -
> -	allow_user_access(to, KUAP_WRITE);
> -	ret = __copy_tofrom_user(to, (__force const void __user *)from, n);
> -	prevent_user_access(KUAP_WRITE);
> -	return ret;
> +	return raw_copy_tofrom_user(to, (__force const void __user *)from, n, KUAP_WRITE);
>   }
>   
>   unsigned long __arch_clear_user(void __user *addr, unsigned long size);
> diff --git a/arch/powerpc/lib/copyuser_64.S b/arch/powerpc/lib/copyuser_64.S
> index 9af969d2cc0c..25a99108caff 100644
> --- a/arch/powerpc/lib/copyuser_64.S
> +++ b/arch/powerpc/lib/copyuser_64.S
> @@ -562,3 +562,4 @@ exc;	std	r10,32(3)
>   	li	r5,4096
>   	b	.Ldst_aligned
>   EXPORT_SYMBOL(__copy_tofrom_user)
> +EXPORT_SYMBOL(__copy_tofrom_user_base)
> diff --git a/arch/powerpc/lib/copyuser_power7.S b/arch/powerpc/lib/copyuser_power7.S
> index 8474c682a178..17dbcfbae25f 100644
> --- a/arch/powerpc/lib/copyuser_power7.S
> +++ b/arch/powerpc/lib/copyuser_power7.S
> @@ -5,13 +5,9 @@
>    *
>    * Author: Anton Blanchard <anton@au.ibm.com>
>    */
> +#include <linux/export.h>
>   #include <asm/ppc_asm.h>
>   
> -#ifndef SELFTEST_CASE
> -/* 0 == don't use VMX, 1 == use VMX */
> -#define SELFTEST_CASE	0
> -#endif
> -
>   #ifdef __BIG_ENDIAN__
>   #define LVS(VRT,RA,RB)		lvsl	VRT,RA,RB
>   #define VPERM(VRT,VRA,VRB,VRC)	vperm	VRT,VRA,VRB,VRC
> @@ -47,10 +43,14 @@
>   	ld	r15,STK_REG(R15)(r1)
>   	ld	r14,STK_REG(R14)(r1)
>   .Ldo_err3:
> -	bl	CFUNC(exit_vmx_usercopy)
> +	ld      r6,STK_REG(R31)(r1)	/* original destination pointer */
> +	ld      r5,STK_REG(R29)(r1)	/* original number of bytes */
> +	subf    r7,r6,r3		/* #bytes copied */
> +	subf    r3,r7,r5		/* #bytes not copied in r3 */
>   	ld	r0,STACKFRAMESIZE+16(r1)
>   	mtlr	r0
> -	b	.Lexit
> +	addi    r1,r1,STACKFRAMESIZE
> +	blr
>   #endif /* CONFIG_ALTIVEC */
>   
>   .Ldo_err2:
> @@ -74,7 +74,6 @@
>   
>   _GLOBAL(__copy_tofrom_user_power7)
>   	cmpldi	r5,16
> -	cmpldi	cr1,r5,3328
>   
>   	std	r3,-STACKFRAMESIZE+STK_REG(R31)(r1)
>   	std	r4,-STACKFRAMESIZE+STK_REG(R30)(r1)
> @@ -82,12 +81,6 @@ _GLOBAL(__copy_tofrom_user_power7)
>   
>   	blt	.Lshort_copy
>   
> -#ifdef CONFIG_ALTIVEC
> -test_feature = SELFTEST_CASE
> -BEGIN_FTR_SECTION
> -	bgt	cr1,.Lvmx_copy
> -END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
> -#endif
>   
>   .Lnonvmx_copy:
>   	/* Get the source 8B aligned */
> @@ -263,23 +256,14 @@ err1;	stb	r0,0(r3)
>   15:	li	r3,0
>   	blr
>   
> -.Lunwind_stack_nonvmx_copy:
> -	addi	r1,r1,STACKFRAMESIZE
> -	b	.Lnonvmx_copy
> -
> -.Lvmx_copy:
>   #ifdef CONFIG_ALTIVEC
> +_GLOBAL(__copy_tofrom_user_power7_vmx)
>   	mflr	r0
>   	std	r0,16(r1)
>   	stdu	r1,-STACKFRAMESIZE(r1)
> -	bl	CFUNC(enter_vmx_usercopy)
> -	cmpwi	cr1,r3,0
> -	ld	r0,STACKFRAMESIZE+16(r1)
> -	ld	r3,STK_REG(R31)(r1)
> -	ld	r4,STK_REG(R30)(r1)
> -	ld	r5,STK_REG(R29)(r1)
> -	mtlr	r0
>   
> +	std     r3,STK_REG(R31)(r1)
> +	std     r5,STK_REG(R29)(r1)
>   	/*
>   	 * We prefetch both the source and destination using enhanced touch
>   	 * instructions. We use a stream ID of 0 for the load side and
> @@ -300,8 +284,6 @@ err1;	stb	r0,0(r3)
>   
>   	DCBT_SETUP_STREAMS(r6, r7, r9, r10, r8)
>   
> -	beq	cr1,.Lunwind_stack_nonvmx_copy
> -
>   	/*
>   	 * If source and destination are not relatively aligned we use a
>   	 * slower permute loop.
> @@ -478,7 +460,8 @@ err3;	lbz	r0,0(r4)
>   err3;	stb	r0,0(r3)
>   
>   15:	addi	r1,r1,STACKFRAMESIZE
> -	b	CFUNC(exit_vmx_usercopy)	/* tail call optimise */
> +	li r3,0
> +	blr
>   
>   .Lvmx_unaligned_copy:
>   	/* Get the destination 16B aligned */
> @@ -681,5 +664,7 @@ err3;	lbz	r0,0(r4)
>   err3;	stb	r0,0(r3)
>   
>   15:	addi	r1,r1,STACKFRAMESIZE
> -	b	CFUNC(exit_vmx_usercopy)	/* tail call optimise */
> +	li r3,0
> +	blr
> +EXPORT_SYMBOL(__copy_tofrom_user_power7_vmx)
>   #endif /* CONFIG_ALTIVEC */
> diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
> index 54340912398f..554b248002b4 100644
> --- a/arch/powerpc/lib/vmx-helper.c
> +++ b/arch/powerpc/lib/vmx-helper.c
> @@ -27,6 +27,7 @@ int enter_vmx_usercopy(void)
>   
>   	return 1;
>   }
> +EXPORT_SYMBOL(enter_vmx_usercopy);
>   
>   /*
>    * This function must return 0 because we tail call optimise when calling
> @@ -49,6 +50,7 @@ int exit_vmx_usercopy(void)
>   		set_dec(1);
>   	return 0;
>   }
> +EXPORT_SYMBOL(exit_vmx_usercopy);
>   
>   int enter_vmx_ops(void)
>   {

