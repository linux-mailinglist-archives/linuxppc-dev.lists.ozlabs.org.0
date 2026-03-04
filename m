Return-Path: <linuxppc-dev+bounces-17719-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOQnOggmqGlhowAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17719-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 13:31:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE921FFB4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 13:31:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQsTd2Rl5z3btw;
	Wed, 04 Mar 2026 23:31:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772627461;
	cv=none; b=SZT8lZy6chfIzstkejpib2ZXpW8q/P1J8i8J23ZH1BXPG5nHdp2+V6Nd3B/LbZFKpwZpc0ETp0Cc5SOholPgwDSWe90YvH/Dx06hSKvDu6mjLTrlmBmBNMsk5D7gInepNEryExF42whDYVd3uN0BHDXnXPjgdeFakxWyCgvHly7Hyoeo9s+99apujaTtlaBSuDqfvbghY7adydt3lJTgiiERzKywV2falwA1cXqjG+9PFJ5ceqYj9JokjNbTqrxWU4GZAqhQLzbVZfATyqOVE5MkpJIjdG2d4je7IhsYlsvhLsT+ioHQQljZheKRX5PkJALqXUe+CDSFIHTR9HcuMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772627461; c=relaxed/relaxed;
	bh=qLxn/OLsHQEkhHIFf5JF+6MzqVqO92Kjj0mzpCvU4jY=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=CPYJFJ4GmcdCFGHw1y5tzZW+7PSOjwhA3QIZCwLcSGZilS6m5hf4RIg+4CMVg2UvnF4+Hiitptm+0BFOlcxN3+xWx8jn30YAKTDDpQSRGh2/r9dKpuFcujsSTfHUgMzUOiLYJ6u0FqZeItZUE1V3FIsgHg1l/QaXFvXVVlI2m/pZtQ4ObcqMK7WPPpUjMnEIPHgmEnX//Irr/6KyIsOZUqkoXZB6yCmcYNGSf1KNCF6YL8a97GvZgRXssfv7DiI/ANKxxyuKYmXwGjKuAhOsrqcYbKSj3wg88+dE3Y3xHDSqOV7WC830kgOQPa02nuOR2ndpeMzgOJ9SnJ9c3l1Log==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n2C7/tVt; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n2C7/tVt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQsTc3QY8z3bt9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 23:31:00 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623K75NN2148025;
	Wed, 4 Mar 2026 12:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=qLxn/OLsHQEkhHIFf5JF+6MzqVqO92
	Kjj0mzpCvU4jY=; b=n2C7/tVt2Q8T2sNxtkzXcMOZrY/fh88q+5lvNFtEKTN+lj
	YrA3ptr/piycDgtwXdR6ykcVhiRlx8pPk6FFNWFh089JNvRKtfgg2VbzBGOuPqd3
	AJIEjtR+Na6j9YCYKT0beecEKPg7dTegeZSW5gkl0JekN/cnTn/yh1spglFznpWU
	pwxKZdRsCBxDamTRpEhSOJj7sS5PaBOxSPJUrRF/o70fcYV5q27WU3t0g3K6OFnf
	dFfRT2l6J+Yl5oWK4o3A5REKxxvAdBeAD09EEliJoOtBZyEFzDkO0QYdOdfDaeXD
	A5dM5s6TF/HPcl5DU5RskElaleNX+9IetcFLDUYQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksjdf9ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 12:30:56 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6249wjoP016408;
	Wed, 4 Mar 2026 12:30:55 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmbpn6kt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 12:30:55 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 624CUrPj6750922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Mar 2026 12:30:53 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BEB1858059;
	Wed,  4 Mar 2026 12:30:53 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2EDE58053;
	Wed,  4 Mar 2026 12:30:49 +0000 (GMT)
Received: from [9.39.16.241] (unknown [9.39.16.241])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Mar 2026 12:30:49 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------CEudjGiKIbpTXS6v03iOnbjp"
Message-ID: <952c0abe-d126-49a7-acf7-91ac2021425b@linux.ibm.com>
Date: Wed, 4 Mar 2026 18:00:48 +0530
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
Subject: Re: [PATCH v3 1/2] powerpc: fix KUAP warning in VMX usercopy path
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Cc: aboorvad@linux.ibm.com, sshegde@linux.ibm.com, riteshh@linux.ibm.com,
        hbathini@linux.ibm.com, ming.lei@redhat.com, csander@purestorage.com,
        czhong@redhat.com, venkat88@linux.ibm.com
References: <20260304053506.118632-1-sayalip@linux.ibm.com>
 <d3aa734c-fed7-4cec-9a39-e1c1d8f8c480@kernel.org>
Content-Language: en-IN
From: Sayali Patil <sayalip@linux.ibm.com>
In-Reply-To: <d3aa734c-fed7-4cec-9a39-e1c1d8f8c480@kernel.org>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=M9BA6iws c=1 sm=1 tr=0 ts=69a82600 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=r77TgQKjGQsHNAKrUKIA:9 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=Je0a8u3kFQpj72er1Y4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zMrQQBovX4HMaXkNdmAA:9 a=4Gpx9Ovjr91xqG4I:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10
X-Proofpoint-ORIG-GUID: gSJRo9Eb7OgJODklY6v53UcxJBi5F4Al
X-Proofpoint-GUID: gSJRo9Eb7OgJODklY6v53UcxJBi5F4Al
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA5NiBTYWx0ZWRfX13u9tYt3OL1G
 ks30V08tYPIvOIbOYAT13rkTWAXvPBn4iHYxv3TFuLishAj6cDmFVV96nEodUs5/F3bL1dVSwJz
 /vm0QagL+f3UG3jw5Dq8lhfoVPQ+uszgKYqLM3aEylTHQOt4fzAvQLmt5ZWXU77eQ/HqxMVrWaF
 rJrvyDgdnTp+ydLXSRLvSXw181RPJqL+3aQNpd/V6Xlc77c3N/usL+eUmNXmTPkmg7vTFc4wj+t
 XiVjdYCGAC4i4FpK3b4jHpN07rPADFqC5PKKH3UyFDTbLMKmiAwy5QJql8ZqqL+hSiMhX51Jl9O
 gM8cRDWLGbvOGRKfTeZ5c43b9CYxYRtPrmBIZnnmnwQEJCflf0cT28yPH+p5EugZB7pmZJLspCQ
 BGBqgGywf32QMd7mAVScnVx1/j8JJyi2UGP/TFbab5w0HyqPK/fit+Qeskf6SDi+FdswQrL3sUx
 kT9Wjv2edHtd7Rf0tHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040096
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: ECE921FFB4F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-17719-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[sayalip@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:aboorvad@linux.ibm.com,m:sshegde@linux.ibm.com,m:riteshh@linux.ibm.com,m:hbathini@linux.ibm.com,m:ming.lei@redhat.com,m:csander@purestorage.com,m:czhong@redhat.com,m:venkat88@linux.ibm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sayalip@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This is a multi-part message in MIME format.
--------------CEudjGiKIbpTXS6v03iOnbjp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 04/03/26 12:19, Christophe Leroy (CS GROUP) wrote:
> Hi Sayali,
>
> Le 04/03/2026 à 06:35, Sayali Patil a écrit :
>> On powerpc with PREEMPT_FULL or PREEMPT_LAZY and function tracing 
>> enabled,
>> KUAP warnings can be triggered from the VMX usercopy path under memory
>> stress workloads.
>>
>> KUAP requires that no subfunctions are called once userspace access has
>> been enabled. The existing VMX copy implementation violates this
>> requirement by invoking enter_vmx_usercopy() from the assembly path 
>> after
>> userspace access has already been enabled. If preemption occurs
>> in this window, the AMR state may not be preserved correctly,
>> leading to unexpected userspace access state and resulting in
>> KUAP warnings.
>>
>> Fix this by restructuring the VMX usercopy flow so that VMX selection
>> and VMX state management are centralized in raw_copy_tofrom_user(),
>> which is invoked by the raw_copy_{to,from,in}_user() wrappers.
>>
>> The new flow is:
>>
>>    - raw_copy_{to,from,in}_user() calls raw_copy_tofrom_user()
>>    - raw_copy_tofrom_user() decides whether to use the VMX path
>>      based on size and CPU capability
>>    - Call enter_vmx_usercopy() before enabling userspace access
>>    - Enable userspace access as per the copy direction
>>      and perform the VMX copy
>>    - Disable userspace access as per the copy direction
>>    - Call exit_vmx_usercopy()
>>    - Fall back to the base copy routine if the VMX copy faults
>>
>> With this change, the VMX assembly routines no longer perform VMX state
>> management or call helper functions; they only implement the
>> copy operations.
>> The previous feature-section based VMX selection inside
>> __copy_tofrom_user_power7() is removed, and a dedicated
>> __copy_tofrom_user_power7_vmx() entry point is introduced.
>>
>> This ensures correct KUAP ordering, avoids subfunction calls
>> while KUAP is unlocked, and eliminates the warnings while preserving
>> the VMX fast path.
>>
>> Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel Userspace 
>> Access Protection")
>> Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> Closes: 
>> https://lore.kernel.org/all/20260109064917.777587-2-sshegde@linux.ibm.com/
>> Suggested-by: Christophe Leroy <chleroy@kernel.org>
>> Co-developed-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
>> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
>> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
>
> That looks almost good, some editorial comments below.
>
> With those fixed, you can add  Reviewed-by: Christophe Leroy (CS 
> GROUP) <chleroy@kernel.org>
>
>> ---
>>
>> v2->v3
>>    - Addressd as per review feedback by removing usercopy_mode enum
>>      and using the copy direction directly for KUAP permission handling.
>>    - Integrated __copy_tofrom_user_vmx() functionality into
>>      raw_copy_tofrom_user() in uaccess.h as a static __always_inline
>>      implementation.
>>    - Exported enter_vmx_usercopy() and exit_vmx_usercopy()
>>      to support VMX usercopy handling from the common path.
>>
>> v2: 
>> https://lore.kernel.org/all/20260228135319.238985-1-sayalip@linux.ibm.com/
>>
>> ---
>>   arch/powerpc/include/asm/uaccess.h | 66 ++++++++++++++++++++++--------
>>   arch/powerpc/lib/copyuser_64.S     |  1 +
>>   arch/powerpc/lib/copyuser_power7.S | 45 +++++++-------------
>>   arch/powerpc/lib/vmx-helper.c      |  2 +
>>   4 files changed, 66 insertions(+), 48 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/uaccess.h 
>> b/arch/powerpc/include/asm/uaccess.h
>> index ba1d878c3f40..8fd412671025 100644
>> --- a/arch/powerpc/include/asm/uaccess.h
>> +++ b/arch/powerpc/include/asm/uaccess.h
>> @@ -15,6 +15,9 @@
>>   #define TASK_SIZE_MAX        TASK_SIZE_USER64
>>   #endif
>>   +/* Threshold above which VMX copy path is used */
>> +#define VMX_COPY_THRESHOLD 3328
>> +
>>   #include <asm-generic/access_ok.h>
>>     /*
>> @@ -326,40 +329,67 @@ do {                                \
>>   extern unsigned long __copy_tofrom_user(void __user *to,
>>           const void __user *from, unsigned long size);
>>   -#ifdef __powerpc64__
>> -static inline unsigned long
>> -raw_copy_in_user(void __user *to, const void __user *from, unsigned 
>> long n)
>> +unsigned long __copy_tofrom_user_base(void __user *to,
>> +        const void __user *from, unsigned long size);
>> +
>> +unsigned long __copy_tofrom_user_power7_vmx(void __user *to,
>> +        const void __user *from, unsigned long size);
>> +
>> +
>
> Remove one line.
>
>> +static __always_inline bool will_use_vmx(unsigned long n)
>> +{
>> +    return IS_ENABLED(CONFIG_ALTIVEC) &&
>> +        cpu_has_feature(CPU_FTR_VMX_COPY) &&
>> +        n > VMX_COPY_THRESHOLD;
>
> Avoid too many line when possible. Nowadays up to 100 chars per line 
> are allowed.
>
> Take care of alignment of second line, the second line should start at 
> same position as IS_ENABLED, meaning you have to insert 7 spaces 
> instead of a tab.
>
>> +}
>> +
>> +static __always_inline unsigned long raw_copy_tofrom_user(void 
>> __user *to,
>> +        const void __user *from, unsigned long n,
>> +        unsigned long dir)
>
> Subsequent lines should start at same position as the ( of the first 
> line, therefore I'd suggest following form instead:
>
> static __always_inline unsigned long
> raw_copy_tofrom_user(void __user *to,const void __user *from, unsigned 
> long n, unsigned long dir)
>
>>   {
>>       unsigned long ret;
>>   -    barrier_nospec();
>> -    allow_user_access(to, KUAP_READ_WRITE);
>> +    if (will_use_vmx(n) && enter_vmx_usercopy()) {
>> +        allow_user_access(to, dir);
>> +        ret = __copy_tofrom_user_power7_vmx(to, from, n);
>> +        prevent_user_access(dir);
>> +        exit_vmx_usercopy();
>> +
>> +        if (unlikely(ret)) {
>> +            allow_user_access(to, dir);
>> +            ret = __copy_tofrom_user_base(to, from, n);
>> +            prevent_user_access(dir);
>> +        }
>> +        return ret;
>> +    }
>> +
>> +    allow_user_access(to, dir);
>>       ret = __copy_tofrom_user(to, from, n);
>> -    prevent_user_access(KUAP_READ_WRITE);
>> +    prevent_user_access(dir);
>>       return ret;
>>   }
>> +
>> +#ifdef __powerpc64__
>
> I know it was already there before, but checkpatch is not happy about 
> __power64__. It should be replaced by CONFIG_PPC64.
>
>> +static inline unsigned long
>> +raw_copy_in_user(void __user *to, const void __user *from, unsigned 
>> long n)
>> +{
>> +    barrier_nospec();
>> +    return raw_copy_tofrom_user(to, from, n, KUAP_READ_WRITE);
>> +}
>>   #endif /* __powerpc64__ */
>>     static inline unsigned long raw_copy_from_user(void *to,
>>           const void __user *from, unsigned long n)
>
> Same problem with alignment of second line. Prefer the form used for 
> raw_copy_in_user() or raw_copy_to_user(), ie:
>
> static inline unsigned long
> raw_copy_from_user(void *to, const void __user *from, unsigned long n)
>
>>   {
>> -    unsigned long ret;
>> -
>> -    allow_user_access(NULL, KUAP_READ);
>> -    ret = __copy_tofrom_user((__force void __user *)to, from, n);
>> -    prevent_user_access(KUAP_READ);
>> -    return ret;
>> +    return raw_copy_tofrom_user((__force void __user *)to, from,
>> +                    n, KUAP_READ);
>
> 100 chars are allowed per line, this should fit on a single line.
>
>>   }
>>     static inline unsigned long
>>   raw_copy_to_user(void __user *to, const void *from, unsigned long n)
>>   {
>> -    unsigned long ret;
>> -
>> -    allow_user_access(to, KUAP_WRITE);
>> -    ret = __copy_tofrom_user(to, (__force const void __user *)from, n);
>> -    prevent_user_access(KUAP_WRITE);
>> -    return ret;
>> +    return raw_copy_tofrom_user(to, (__force const void __user *)from,
>> +                    n, KUAP_WRITE);
>
> 100 chars are allowed per line, this should fit on a single line.
>
>>   }
>>     unsigned long __arch_clear_user(void __user *addr, unsigned long 
>> size);
>
>
> Run checkpatch before submitting patches:
>
> $ ./scripts/checkpatch.pl --strict -g HEAD~
> CHECK: Alignment should match open parenthesis
> #83: FILE: arch/powerpc/include/asm/uaccess.h:333:
> +unsigned long __copy_tofrom_user_base(void __user *to,
> +        const void __user *from, unsigned long size);
>
> CHECK: Alignment should match open parenthesis
> #86: FILE: arch/powerpc/include/asm/uaccess.h:336:
> +unsigned long __copy_tofrom_user_power7_vmx(void __user *to,
> +        const void __user *from, unsigned long size);
>
> CHECK: Please don't use multiple blank lines
> #88: FILE: arch/powerpc/include/asm/uaccess.h:338:
> +
> +
>
> CHECK: Alignment should match open parenthesis
> #97: FILE: arch/powerpc/include/asm/uaccess.h:347:
> +static __always_inline unsigned long raw_copy_tofrom_user(void __user 
> *to,
> +        const void __user *from, unsigned long n,
>
> CHECK: architecture specific defines should be avoided
> #125: FILE: arch/powerpc/include/asm/uaccess.h:372:
> +#ifdef __powerpc64__
>
> total: 0 errors, 0 warnings, 5 checks, 212 lines checked
>
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or 
> --fix-inplace.
>
> Commit 3a44f6614d88 ("powerpc: fix KUAP warning in VMX usercopy path") 
> has style problems, please review.
>
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.
>
Thanks Christophe for the review.
I have addressed the comments and incorporated the changes in v4.

As suggested, I have added:
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

v4: 
https://lore.kernel.org/all/20260304122201.153049-1-sayalip@linux.ibm.com/
--------------CEudjGiKIbpTXS6v03iOnbjp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 04/03/26 12:19, Christophe Leroy (CS
      GROUP) wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d3aa734c-fed7-4cec-9a39-e1c1d8f8c480@kernel.org">Hi
      Sayali,
      <br>
      <br>
      Le 04/03/2026 à 06:35, Sayali Patil a écrit :
      <br>
      <blockquote type="cite">On powerpc with PREEMPT_FULL or
        PREEMPT_LAZY and function tracing enabled,
        <br>
        KUAP warnings can be triggered from the VMX usercopy path under
        memory
        <br>
        stress workloads.
        <br>
        <br>
        KUAP requires that no subfunctions are called once userspace
        access has
        <br>
        been enabled. The existing VMX copy implementation violates this
        <br>
        requirement by invoking enter_vmx_usercopy() from the assembly
        path after
        <br>
        userspace access has already been enabled. If preemption occurs
        <br>
        in this window, the AMR state may not be preserved correctly,
        <br>
        leading to unexpected userspace access state and resulting in
        <br>
        KUAP warnings.
        <br>
        <br>
        Fix this by restructuring the VMX usercopy flow so that VMX
        selection
        <br>
        and VMX state management are centralized in
        raw_copy_tofrom_user(),
        <br>
        which is invoked by the raw_copy_{to,from,in}_user() wrappers.
        <br>
        <br>
        The new flow is:
        <br>
        <br>
           - raw_copy_{to,from,in}_user() calls raw_copy_tofrom_user()
        <br>
           - raw_copy_tofrom_user() decides whether to use the VMX path
        <br>
             based on size and CPU capability
        <br>
           - Call enter_vmx_usercopy() before enabling userspace access
        <br>
           - Enable userspace access as per the copy direction
        <br>
             and perform the VMX copy
        <br>
           - Disable userspace access as per the copy direction
        <br>
           - Call exit_vmx_usercopy()
        <br>
           - Fall back to the base copy routine if the VMX copy faults
        <br>
        <br>
        With this change, the VMX assembly routines no longer perform
        VMX state
        <br>
        management or call helper functions; they only implement the
        <br>
        copy operations.
        <br>
        The previous feature-section based VMX selection inside
        <br>
        __copy_tofrom_user_power7() is removed, and a dedicated
        <br>
        __copy_tofrom_user_power7_vmx() entry point is introduced.
        <br>
        <br>
        This ensures correct KUAP ordering, avoids subfunction calls
        <br>
        while KUAP is unlocked, and eliminates the warnings while
        preserving
        <br>
        the VMX fast path.
        <br>
        <br>
        Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel
        Userspace Access Protection")
        <br>
        Reported-by: Shrikanth Hegde <a class="moz-txt-link-rfc2396E" href="mailto:sshegde@linux.ibm.com">&lt;sshegde@linux.ibm.com&gt;</a>
        <br>
        Closes:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20260109064917.777587-2-sshegde@linux.ibm.com/">https://lore.kernel.org/all/20260109064917.777587-2-sshegde@linux.ibm.com/</a><br>
        Suggested-by: Christophe Leroy <a class="moz-txt-link-rfc2396E" href="mailto:chleroy@kernel.org">&lt;chleroy@kernel.org&gt;</a>
        <br>
        Co-developed-by: Aboorva Devarajan
        <a class="moz-txt-link-rfc2396E" href="mailto:aboorvad@linux.ibm.com">&lt;aboorvad@linux.ibm.com&gt;</a>
        <br>
        Signed-off-by: Aboorva Devarajan <a class="moz-txt-link-rfc2396E" href="mailto:aboorvad@linux.ibm.com">&lt;aboorvad@linux.ibm.com&gt;</a>
        <br>
        Signed-off-by: Sayali Patil <a class="moz-txt-link-rfc2396E" href="mailto:sayalip@linux.ibm.com">&lt;sayalip@linux.ibm.com&gt;</a>
        <br>
      </blockquote>
      <br>
      That looks almost good, some editorial comments below.
      <br>
      <br>
      With those fixed, you can add  Reviewed-by: Christophe Leroy (CS
      GROUP) <a class="moz-txt-link-rfc2396E" href="mailto:chleroy@kernel.org">&lt;chleroy@kernel.org&gt;</a>
      <br>
      <br>
      <blockquote type="cite">---
        <br>
        <br>
        v2-&gt;v3
        <br>
           - Addressd as per review feedback by removing usercopy_mode
        enum
        <br>
             and using the copy direction directly for KUAP permission
        handling.
        <br>
           - Integrated __copy_tofrom_user_vmx() functionality into
        <br>
             raw_copy_tofrom_user() in uaccess.h as a static
        __always_inline
        <br>
             implementation.
        <br>
           - Exported enter_vmx_usercopy() and exit_vmx_usercopy()
        <br>
             to support VMX usercopy handling from the common path.
        <br>
        <br>
        v2:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20260228135319.238985-1-sayalip@linux.ibm.com/">https://lore.kernel.org/all/20260228135319.238985-1-sayalip@linux.ibm.com/</a><br>
        <br>
        ---
        <br>
          arch/powerpc/include/asm/uaccess.h | 66
        ++++++++++++++++++++++--------
        <br>
          arch/powerpc/lib/copyuser_64.S     |  1 +
        <br>
          arch/powerpc/lib/copyuser_power7.S | 45 +++++++-------------
        <br>
          arch/powerpc/lib/vmx-helper.c      |  2 +
        <br>
          4 files changed, 66 insertions(+), 48 deletions(-)
        <br>
        <br>
        diff --git a/arch/powerpc/include/asm/uaccess.h
        b/arch/powerpc/include/asm/uaccess.h
        <br>
        index ba1d878c3f40..8fd412671025 100644
        <br>
        --- a/arch/powerpc/include/asm/uaccess.h
        <br>
        +++ b/arch/powerpc/include/asm/uaccess.h
        <br>
        @@ -15,6 +15,9 @@
        <br>
          #define TASK_SIZE_MAX        TASK_SIZE_USER64
        <br>
          #endif
        <br>
          +/* Threshold above which VMX copy path is used */
        <br>
        +#define VMX_COPY_THRESHOLD 3328
        <br>
        +
        <br>
          #include &lt;asm-generic/access_ok.h&gt;
        <br>
            /*
        <br>
        @@ -326,40 +329,67 @@ do {                                \
        <br>
          extern unsigned long __copy_tofrom_user(void __user *to,
        <br>
                  const void __user *from, unsigned long size);
        <br>
          -#ifdef __powerpc64__
        <br>
        -static inline unsigned long
        <br>
        -raw_copy_in_user(void __user *to, const void __user *from,
        unsigned long n)
        <br>
        +unsigned long __copy_tofrom_user_base(void __user *to,
        <br>
        +        const void __user *from, unsigned long size);
        <br>
        +
        <br>
        +unsigned long __copy_tofrom_user_power7_vmx(void __user *to,
        <br>
        +        const void __user *from, unsigned long size);
        <br>
        +
        <br>
        +
        <br>
      </blockquote>
      <br>
      Remove one line.
      <br>
      <br>
      <blockquote type="cite">+static __always_inline bool
        will_use_vmx(unsigned long n)
        <br>
        +{
        <br>
        +    return IS_ENABLED(CONFIG_ALTIVEC) &amp;&amp;
        <br>
        +        cpu_has_feature(CPU_FTR_VMX_COPY) &amp;&amp;
        <br>
        +        n &gt; VMX_COPY_THRESHOLD;
        <br>
      </blockquote>
      <br>
      Avoid too many line when possible. Nowadays up to 100 chars per
      line are allowed.
      <br>
      <br>
      Take care of alignment of second line, the second line should
      start at same position as IS_ENABLED, meaning you have to insert 7
      spaces instead of a tab.
      <br>
      <br>
      <blockquote type="cite">+}
        <br>
        +
        <br>
        +static __always_inline unsigned long raw_copy_tofrom_user(void
        __user *to,
        <br>
        +        const void __user *from, unsigned long n,
        <br>
        +        unsigned long dir)
        <br>
      </blockquote>
      <br>
      Subsequent lines should start at same position as the ( of the
      first line, therefore I'd suggest following form instead:
      <br>
      <br>
      static __always_inline unsigned long
      <br>
      raw_copy_tofrom_user(void __user *to,const void __user *from,
      unsigned long n, unsigned long dir)
      <br>
      <br>
      <blockquote type="cite">  {
        <br>
              unsigned long ret;
        <br>
          -    barrier_nospec();
        <br>
        -    allow_user_access(to, KUAP_READ_WRITE);
        <br>
        +    if (will_use_vmx(n) &amp;&amp; enter_vmx_usercopy()) {
        <br>
        +        allow_user_access(to, dir);
        <br>
        +        ret = __copy_tofrom_user_power7_vmx(to, from, n);
        <br>
        +        prevent_user_access(dir);
        <br>
        +        exit_vmx_usercopy();
        <br>
        +
        <br>
        +        if (unlikely(ret)) {
        <br>
        +            allow_user_access(to, dir);
        <br>
        +            ret = __copy_tofrom_user_base(to, from, n);
        <br>
        +            prevent_user_access(dir);
        <br>
        +        }
        <br>
        +        return ret;
        <br>
        +    }
        <br>
        +
        <br>
        +    allow_user_access(to, dir);
        <br>
              ret = __copy_tofrom_user(to, from, n);
        <br>
        -    prevent_user_access(KUAP_READ_WRITE);
        <br>
        +    prevent_user_access(dir);
        <br>
              return ret;
        <br>
          }
        <br>
        +
        <br>
        +#ifdef __powerpc64__
        <br>
      </blockquote>
      <br>
      I know it was already there before, but checkpatch is not happy
      about __power64__. It should be replaced by CONFIG_PPC64.
      <br>
      <br>
      <blockquote type="cite">+static inline unsigned long
        <br>
        +raw_copy_in_user(void __user *to, const void __user *from,
        unsigned long n)
        <br>
        +{
        <br>
        +    barrier_nospec();
        <br>
        +    return raw_copy_tofrom_user(to, from, n, KUAP_READ_WRITE);
        <br>
        +}
        <br>
          #endif /* __powerpc64__ */
        <br>
            static inline unsigned long raw_copy_from_user(void *to,
        <br>
                  const void __user *from, unsigned long n)
        <br>
      </blockquote>
      <br>
      Same problem with alignment of second line. Prefer the form used
      for raw_copy_in_user() or raw_copy_to_user(), ie:
      <br>
      <br>
      static inline unsigned long
      <br>
      raw_copy_from_user(void *to, const void __user *from, unsigned
      long n)
      <br>
      <br>
      <blockquote type="cite">  {
        <br>
        -    unsigned long ret;
        <br>
        -
        <br>
        -    allow_user_access(NULL, KUAP_READ);
        <br>
        -    ret = __copy_tofrom_user((__force void __user *)to, from,
        n);
        <br>
        -    prevent_user_access(KUAP_READ);
        <br>
        -    return ret;
        <br>
        +    return raw_copy_tofrom_user((__force void __user *)to,
        from,
        <br>
        +                    n, KUAP_READ);
        <br>
      </blockquote>
      <br>
      100 chars are allowed per line, this should fit on a single line.
      <br>
      <br>
      <blockquote type="cite">  }
        <br>
            static inline unsigned long
        <br>
          raw_copy_to_user(void __user *to, const void *from, unsigned
        long n)
        <br>
          {
        <br>
        -    unsigned long ret;
        <br>
        -
        <br>
        -    allow_user_access(to, KUAP_WRITE);
        <br>
        -    ret = __copy_tofrom_user(to, (__force const void __user
        *)from, n);
        <br>
        -    prevent_user_access(KUAP_WRITE);
        <br>
        -    return ret;
        <br>
        +    return raw_copy_tofrom_user(to, (__force const void __user
        *)from,
        <br>
        +                    n, KUAP_WRITE);
        <br>
      </blockquote>
      <br>
      100 chars are allowed per line, this should fit on a single line.
      <br>
      <br>
      <blockquote type="cite">  }
        <br>
            unsigned long __arch_clear_user(void __user *addr, unsigned
        long size);
        <br>
      </blockquote>
      <br>
      <br>
      Run checkpatch before submitting patches:
      <br>
      <br>
      $ ./scripts/checkpatch.pl --strict -g HEAD~
      <br>
      CHECK: Alignment should match open parenthesis
      <br>
      #83: FILE: arch/powerpc/include/asm/uaccess.h:333:
      <br>
      +unsigned long __copy_tofrom_user_base(void __user *to,
      <br>
      +        const void __user *from, unsigned long size);
      <br>
      <br>
      CHECK: Alignment should match open parenthesis
      <br>
      #86: FILE: arch/powerpc/include/asm/uaccess.h:336:
      <br>
      +unsigned long __copy_tofrom_user_power7_vmx(void __user *to,
      <br>
      +        const void __user *from, unsigned long size);
      <br>
      <br>
      CHECK: Please don't use multiple blank lines
      <br>
      #88: FILE: arch/powerpc/include/asm/uaccess.h:338:
      <br>
      +
      <br>
      +
      <br>
      <br>
      CHECK: Alignment should match open parenthesis
      <br>
      #97: FILE: arch/powerpc/include/asm/uaccess.h:347:
      <br>
      +static __always_inline unsigned long raw_copy_tofrom_user(void
      __user *to,
      <br>
      +        const void __user *from, unsigned long n,
      <br>
      <br>
      CHECK: architecture specific defines should be avoided
      <br>
      #125: FILE: arch/powerpc/include/asm/uaccess.h:372:
      <br>
      +#ifdef __powerpc64__
      <br>
      <br>
      total: 0 errors, 0 warnings, 5 checks, 212 lines checked
      <br>
      <br>
      NOTE: For some of the reported defects, checkpatch may be able to
      <br>
            mechanically convert to the typical style using --fix or
      --fix-inplace.
      <br>
      <br>
      Commit 3a44f6614d88 ("powerpc: fix KUAP warning in VMX usercopy
      path") has style problems, please review.
      <br>
      <br>
      NOTE: If any of the errors are false positives, please report
      <br>
            them to the maintainer, see CHECKPATCH in MAINTAINERS. <br>
      <br>
    </blockquote>
    <font size="4" face="monospace">Thanks Christophe for the review.<br>
      I have addressed the comments and incorporated the changes in v4.<br>
      <br>
      As suggested, I have added:<br>
      Reviewed-by: Christophe Leroy (CS GROUP)
      <a class="moz-txt-link-rfc2396E" href="mailto:chleroy@kernel.org">&lt;chleroy@kernel.org&gt;</a><br>
      <br>
      v4:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20260304122201.153049-1-sayalip@linux.ibm.com/">https://lore.kernel.org/all/20260304122201.153049-1-sayalip@linux.ibm.com/</a></font>
  </body>
</html>

--------------CEudjGiKIbpTXS6v03iOnbjp--


