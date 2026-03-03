Return-Path: <linuxppc-dev+bounces-17559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB7iL7WnpmkNSgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 10:19:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 534001EBBBD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 10:19:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQ9HP1xNdz3bnr;
	Tue, 03 Mar 2026 20:19:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772529585;
	cv=none; b=aOnBix1m0htU4Ttvs72T9Be2F1+9iSvwPzdDreduBXN+k3dkEDfjvU5sOKfSfT2fdEim2rT1pJuXe/LtYW7Qjqvh5uJrNKRKAniwrskydCECaweOD36LRfP7pCMEzns1bNKlbMPB8mOfn8h/mle5GC7Fc0qNAvkayL/mzafQkdX9alKLSrLL7/vJnbuu+VvBmsut5m0KKHa2V2r5Sv4Rq4W1I2ieB/fuVBtK784HbaC4QfVSBzr1DmqU/QOicb89HBXDMZ9O7ybjk8ePk2jUl2akWrLegcLBUMMGNha64FxF/baAnxpmfkKvcUr8BGveHXHkyfw2VABMZsB6N+suyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772529585; c=relaxed/relaxed;
	bh=d5AoPviil4cvtZroBgv9pS8+NbSF2NPtpjRwuaWUI34=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=Q3/RFZXW7rAKqZDN7Aw3PVUM3io7LYvEkWwUy3DW5G0fitiKHjnOj52z22MHrGQCinB0s7aZ7J0rd0mjskQ4rK55bevIEuqmlKpZOpiyDJ24/cCjlYT4Cwq5v61lC0QwjRHFQmfci8MSQPxukVYXtIlouTJnzLQBy9WUZls547mSo+7d1NhElV6EnysGt6GGK+qs9fyKMQzX+FR9xUxbhqgcLw5OEiyAV24CxOMwPa/3NtQMQsozn0UjRoyn3LHGISteuYL96+Kb/juSEm5s+nc8PvjeKtTOjixxGPVZ3MgJe9vRPLfzL7MJ4EAEA8jC6/mCA6xxW4jXoRiJynhtwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p5lNAxfL; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p5lNAxfL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQ9HL2qmgz30Lw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 20:19:41 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62343HUB2056039;
	Tue, 3 Mar 2026 09:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=d5AoPviil4cvtZroBgv9pS8+NbSF2N
	PtpjRwuaWUI34=; b=p5lNAxfLf3V16grExpr3ahUrW9nhnZ+NT8d0SV3PCGwv8G
	ln7Ge6DxV1VDWTsmvNEyvZCEdeVnkQtiiXhZ8kWOHWFgmj/b2z4Woa/aIL1Frkrd
	1wngMWrRc3VDcBrhirp0T1J2Fn09sDMYDdyyjJMx60u+lA8LWqictct3FpteFr6H
	SjFQSxmZZrHPPENgoqIt2QXxrpLRjhLRxwI83aXEa60hR11sUjbAELT2Dl29T5ur
	9eJADnsROXOpwt2Nomz1qohylLDs6mwmDecX2U7G0z/pg+56gU1wcYuxjDUuVZZI
	nP6AB6x68W1ZYatewbm70Te9mX7s08UlOFoA7vUQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckskct9s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 09:19:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 623463JH003201;
	Tue, 3 Mar 2026 09:19:34 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmb2y1qeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 09:19:33 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6239JWBe30474944
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 09:19:32 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E2F758059;
	Tue,  3 Mar 2026 09:19:32 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA37B58055;
	Tue,  3 Mar 2026 09:19:28 +0000 (GMT)
Received: from [9.124.212.86] (unknown [9.124.212.86])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Mar 2026 09:19:28 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------GDsHtgWSI6I2E99s0XQlnoG1"
Message-ID: <c5138d29-e192-4a6f-b5d2-40d3a29d5bd4@linux.ibm.com>
Date: Tue, 3 Mar 2026 14:49:27 +0530
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
Subject: Re: [PATCH v2 1/2] powerpc: fix KUAP warning in VMX usercopy path
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Cc: aboorvad@linux.ibm.com, sshegde@linux.ibm.com, riteshh@linux.ibm.com,
        hbathini@linux.ibm.com, ming.lei@redhat.com, csander@purestorage.com,
        czhong@redhat.com, venkat88@linux.ibm.com
References: <20260228135319.238985-1-sayalip@linux.ibm.com>
 <d90efa16-932e-4c29-b8e1-1a4ef08db403@kernel.org>
Content-Language: en-IN
From: Sayali Patil <sayalip@linux.ibm.com>
In-Reply-To: <d90efa16-932e-4c29-b8e1-1a4ef08db403@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yYDpn2zqAleu5aIx17rT0fB-oWnKItp9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA2OCBTYWx0ZWRfX08KayWLG4HZQ
 jTyH/mlCR2nrZRQfW39HwqTWoLO/Cv0wU1lyoS5juyMVC92NJkYkJhg7l7Vp6TvbDQQMtJTVeEQ
 wDmVU3iRKUQMJvYLi7PddcC593d3sty4hVQShJJ6y6o+DDjYjWMV/tukTjUN96ZLcCQyHosPCwE
 BRcI82o1zQc9Ffg+7gKV3sT4BQWW6cR6NmfwWjunPk7yElvMjD5XF1xH07CfTCi3OqMq2gA6l99
 MrRZrGCLVxYVqi8Dqr3F9XBL8OIjrGxFsZJnlxUDhKVh5U2ZfoJkOqQP874+Jz/T4S8IeGbOonO
 D3aOft/3Dtc1fuVqr/dNXr1YWT1AiiisoUAG2kzV6vt12ObLG5Ae7V4Rh9CVwBtqNImdm1PAXDl
 /0CmvWbLYkyEX2DVTW9VJyTOcdKOOb6Y8HPRb/p2rygEmRuMTNe2KVjbrrUimJgm+aef8Qzbm/N
 yL/KgKTtuR9nsBMKLzg==
X-Authority-Analysis: v=2.4 cv=H7DWAuYi c=1 sm=1 tr=0 ts=69a6a7a7 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=r77TgQKjGQsHNAKrUKIA:9 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=S_vwxrWDNdRTO_4ZBHMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pONHcXzaWnGdmSyld1oA:9 a=j1XAc8zQcIUnlMU7:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10
X-Proofpoint-ORIG-GUID: yYDpn2zqAleu5aIx17rT0fB-oWnKItp9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030068
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 534001EBBBD
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
	TAGGED_FROM(0.00)[bounces-17559-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This is a multi-part message in MIME format.
--------------GDsHtgWSI6I2E99s0XQlnoG1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 02/03/26 16:42, Christophe Leroy (CS GROUP) wrote:
> Hi Sayali,
>
> Le 28/02/2026 à 14:53, Sayali Patil a écrit :
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
>> Introduce a usercopy_mode enum to describe the copy direction
>> (IN, FROM, TO) and use it to derive the required KUAP permissions.
>> Userspace access is now enabled and disabled through common helpers
>> based on the selected mode, ensuring that the correct read/write
>> permissions are applied consistently.
>>
>>   The new flow is:
>>
>>    - raw_copy_{to,from,in}_user() calls raw_copy_tofrom_user()
>>    - raw_copy_tofrom_user() decides whether to use the VMX path
>>      based on size and CPU capability
>>    - Call enter_vmx_usercopy() before enabling userspace access
>>    - Enable userspace access as per the usercopy mode
>>      and perform the VMX copy
>>    - Disable userspace access as per the usercopy mode
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
>> ---
>>
>> v1->v2
>>    - Updated as per the review comments.
>>    - Centralized VMX usercopy handling in __copy_tofrom_user_vmx() in
>>      arch/powerpc/lib/vmx-helper.c.
>>    - Introduced a usercopy_mode enum to describe the copy direction
>>      (IN, FROM, TO) and derive the required KUAP permissions, avoiding
>>      duplication across the different usercopy paths.
>
> I like the reduction of duplication you propose but I can't see the 
> added value of that enum, what about:
>
> diff --git a/arch/powerpc/include/asm/uaccess.h 
> b/arch/powerpc/include/asm/uaccess.h
> index 63d6eb8b004e..14a3219db838 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -329,12 +329,6 @@ do {                                \
>  extern unsigned long __copy_tofrom_user(void __user *to,
>          const void __user *from, unsigned long size);
>
> -enum usercopy_mode {
> -    USERCOPY_IN,
> -    USERCOPY_FROM,
> -    USERCOPY_TO,
> -};
> -
>  unsigned long __copy_tofrom_user_vmx(void __user *to, const void 
> __user *from,
>                  unsigned long size, enum usercopy_mode mode);
>
> @@ -352,48 +346,18 @@ static inline bool will_use_vmx(unsigned long n)
>          n > VMX_COPY_THRESHOLD;
>  }
>
> -static inline void raw_copy_allow(void __user *to, enum usercopy_mode 
> mode)
> -{
> -    switch (mode) {
> -    case USERCOPY_IN:
> -        allow_user_access(to, KUAP_READ_WRITE);
> -        break;
> -    case USERCOPY_FROM:
> -        allow_user_access(NULL, KUAP_READ);
> -        break;
> -    case USERCOPY_TO:
> -        allow_user_access(to, KUAP_WRITE);
> -        break;
> -    }
> -}
> -
> -static inline void raw_copy_prevent(enum usercopy_mode mode)
> -{
> -    switch (mode) {
> -    case USERCOPY_IN:
> -        prevent_user_access(KUAP_READ_WRITE);
> -        break;
> -    case USERCOPY_FROM:
> -        prevent_user_access(KUAP_READ);
> -        break;
> -    case USERCOPY_TO:
> -        prevent_user_access(KUAP_WRITE);
> -        break;
> -    }
> -}
> -
>  static inline unsigned long raw_copy_tofrom_user(void __user *to,
>          const void __user *from, unsigned long n,
> -        enum usercopy_mode mode)
> +        unsigned long dir)
>  {
>      unsigned long ret;
>
>      if (will_use_vmx(n))
>          return __copy_tofrom_user_vmx(to, from,    n, mode);
>
> -    raw_copy_allow(to, mode);
> +    allow_user_access(to, dir);
>      ret = __copy_tofrom_user(to, from, n);
> -    raw_copy_prevent(mode);
> +    prevent_user_access(dir);
>      return ret;
>
>  }
> @@ -403,22 +367,20 @@ static inline unsigned long
>  raw_copy_in_user(void __user *to, const void __user *from, unsigned 
> long n)
>  {
>      barrier_nospec();
> -    return raw_copy_tofrom_user(to, from, n, USERCOPY_IN);
> +    return raw_copy_tofrom_user(to, from, n, KUAP_READ_WRITE);
>  }
>  #endif /* __powerpc64__ */
>
>  static inline unsigned long raw_copy_from_user(void *to,
>          const void __user *from, unsigned long n)
>  {
> -    return raw_copy_tofrom_user((__force void __user *)to, from,
> -                    n, USERCOPY_FROM);
> +    return raw_copy_tofrom_user((__force void __user *)to, from, n, 
> KUAP_READ);
>  }
>
>  static inline unsigned long
>  raw_copy_to_user(void __user *to, const void *from, unsigned long n)
>  {
> -    return raw_copy_tofrom_user(to, (__force const void __user *)from,
> -                    n, USERCOPY_TO);
> +    return raw_copy_tofrom_user(to, (__force const void __user 
> *)from, n, KUAP_WRITE);
>  }
>
>  unsigned long __arch_clear_user(void __user *addr, unsigned long size);
> diff --git a/arch/powerpc/lib/vmx-helper.c 
> b/arch/powerpc/lib/vmx-helper.c
> index 35080885204b..4610f7153fd9 100644
> --- a/arch/powerpc/lib/vmx-helper.c
> +++ b/arch/powerpc/lib/vmx-helper.c
> @@ -11,25 +11,25 @@
>  #include <asm/switch_to.h>
>
>  unsigned long __copy_tofrom_user_vmx(void __user *to, const void 
> __user *from,
> -            unsigned long size, enum usercopy_mode mode)
> +            unsigned long size, unsigned long dir)
>  {
>      unsigned long ret;
>
>      if (!enter_vmx_usercopy()) {
> -        raw_copy_allow(to, mode);
> +        allow_user_access(to, dir);
>          ret = __copy_tofrom_user(to, from, size);
> -        raw_copy_prevent(mode);
> +        prevent_user_access(dir);
>          return ret;
>      }
>
> -    raw_copy_allow(to, mode);
> +    allow_user_access(to, dir);
>      ret = __copy_tofrom_user_power7_vmx(to, from, size);
> -    raw_copy_prevent(mode);
> +    prevent_user_access(dir);
>      exit_vmx_usercopy();
>      if (unlikely(ret)) {
> -        raw_copy_allow(to, mode);
> +        allow_user_access(to, dir);
>          ret = __copy_tofrom_user_base(to, from, size);
> -        raw_copy_prevent(mode);
> +        prevent_user_access(dir);
>      }
>
>      return ret;
>
>
>
> Christophe
>
>
Hi Christophe,
Thanks for the review.
With the suggested change, we are hitting a compilation error.

The issue is related to how KUAP enforces the access direction.
allow_user_access() contains:

BUILD_BUG_ON(!__builtin_constant_p(dir));

which requires that the access direction is a compile-time constant.
If we pass a runtime value (for example, an unsigned long), the
__builtin_constant_p() check fails and triggers the following build error.

Error:
In function 'allow_user_access', inlined from '__copy_tofrom_user_vmx' 
at arch/powerpc/lib/vmx-helper.c:19:3:
BUILD_BUG_ON failed: !__builtin_constant_p(dir) 706


The previous implementation worked because allow_user_access() was 
invoked with enum
constants (READ, WRITE, READ_WRITE), which satisfied the 
__builtin_constant_p() requirement.
So in this case, the function must be called with a compile-time 
constant to satisfy KUAP.

Please let me know if you would prefer a different approach.

Regards,
Sayali


>>
>> v1: 
>> https://lore.kernel.org/all/20260217124457.89219-1-sayalip@linux.ibm.com/
>>
>> ---
>>   arch/powerpc/include/asm/uaccess.h | 95 ++++++++++++++++++++++++------
>>   arch/powerpc/lib/copyuser_64.S     |  1 +
>>   arch/powerpc/lib/copyuser_power7.S | 45 +++++---------
>>   arch/powerpc/lib/vmx-helper.c      | 26 ++++++++
>>   4 files changed, 119 insertions(+), 48 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/uaccess.h 
>> b/arch/powerpc/include/asm/uaccess.h
>> index ba1d878c3f40..63d6eb8b004e 100644
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
>> @@ -326,40 +329,96 @@ do {                                \
>>   extern unsigned long __copy_tofrom_user(void __user *to,
>>           const void __user *from, unsigned long size);
>>   -#ifdef __powerpc64__
>> -static inline unsigned long
>> -raw_copy_in_user(void __user *to, const void __user *from, unsigned 
>> long n)
>> +enum usercopy_mode {
>> +    USERCOPY_IN,
>> +    USERCOPY_FROM,
>> +    USERCOPY_TO,
>> +};
>> +
>> +unsigned long __copy_tofrom_user_vmx(void __user *to, const void 
>> __user *from,
>> +                unsigned long size, enum usercopy_mode mode);
>> +
>> +unsigned long __copy_tofrom_user_base(void __user *to,
>> +        const void __user *from, unsigned long size);
>> +
>> +unsigned long __copy_tofrom_user_power7_vmx(void __user *to,
>> +        const void __user *from, unsigned long size);
>> +
>> +
>> +static inline bool will_use_vmx(unsigned long n)
>> +{
>> +    return IS_ENABLED(CONFIG_ALTIVEC) &&
>> +        cpu_has_feature(CPU_FTR_VMX_COPY) &&
>> +        n > VMX_COPY_THRESHOLD;
>> +}
>> +
>> +static inline void raw_copy_allow(void __user *to, enum 
>> usercopy_mode mode)
>> +{
>> +    switch (mode) {
>> +    case USERCOPY_IN:
>> +        allow_user_access(to, KUAP_READ_WRITE);
>> +        break;
>> +    case USERCOPY_FROM:
>> +        allow_user_access(NULL, KUAP_READ);
>> +        break;
>> +    case USERCOPY_TO:
>> +        allow_user_access(to, KUAP_WRITE);
>> +        break;
>> +    }
>> +}
>> +
>> +static inline void raw_copy_prevent(enum usercopy_mode mode)
>> +{
>> +    switch (mode) {
>> +    case USERCOPY_IN:
>> +        prevent_user_access(KUAP_READ_WRITE);
>> +        break;
>> +    case USERCOPY_FROM:
>> +        prevent_user_access(KUAP_READ);
>> +        break;
>> +    case USERCOPY_TO:
>> +        prevent_user_access(KUAP_WRITE);
>> +        break;
>> +    }
>> +}
>> +
>> +static inline unsigned long raw_copy_tofrom_user(void __user *to,
>> +        const void __user *from, unsigned long n,
>> +        enum usercopy_mode mode)
>>   {
>>       unsigned long ret;
>>   -    barrier_nospec();
>> -    allow_user_access(to, KUAP_READ_WRITE);
>> +    if (will_use_vmx(n))
>> +        return __copy_tofrom_user_vmx(to, from,    n, mode);
>> +
>> +    raw_copy_allow(to, mode);
>>       ret = __copy_tofrom_user(to, from, n);
>> -    prevent_user_access(KUAP_READ_WRITE);
>> +    raw_copy_prevent(mode);
>>       return ret;
>> +
>> +}
>> +
>> +#ifdef __powerpc64__
>> +static inline unsigned long
>> +raw_copy_in_user(void __user *to, const void __user *from, unsigned 
>> long n)
>> +{
>> +    barrier_nospec();
>> +    return raw_copy_tofrom_user(to, from, n, USERCOPY_IN);
>>   }
>>   #endif /* __powerpc64__ */
>>     static inline unsigned long raw_copy_from_user(void *to,
>>           const void __user *from, unsigned long n)
>>   {
>> -    unsigned long ret;
>> -
>> -    allow_user_access(NULL, KUAP_READ);
>> -    ret = __copy_tofrom_user((__force void __user *)to, from, n);
>> -    prevent_user_access(KUAP_READ);
>> -    return ret;
>> +    return raw_copy_tofrom_user((__force void __user *)to, from,
>> +                    n, USERCOPY_FROM);
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
>> +                    n, USERCOPY_TO);
>>   }
>>     unsigned long __arch_clear_user(void __user *addr, unsigned long 
>> size);
>> diff --git a/arch/powerpc/lib/copyuser_64.S 
>> b/arch/powerpc/lib/copyuser_64.S
>> index 9af969d2cc0c..25a99108caff 100644
>> --- a/arch/powerpc/lib/copyuser_64.S
>> +++ b/arch/powerpc/lib/copyuser_64.S
>> @@ -562,3 +562,4 @@ exc;    std    r10,32(3)
>>       li    r5,4096
>>       b    .Ldst_aligned
>>   EXPORT_SYMBOL(__copy_tofrom_user)
>> +EXPORT_SYMBOL(__copy_tofrom_user_base)
>> diff --git a/arch/powerpc/lib/copyuser_power7.S 
>> b/arch/powerpc/lib/copyuser_power7.S
>> index 8474c682a178..17dbcfbae25f 100644
>> --- a/arch/powerpc/lib/copyuser_power7.S
>> +++ b/arch/powerpc/lib/copyuser_power7.S
>> @@ -5,13 +5,9 @@
>>    *
>>    * Author: Anton Blanchard <anton@au.ibm.com>
>>    */
>> +#include <linux/export.h>
>>   #include <asm/ppc_asm.h>
>>   -#ifndef SELFTEST_CASE
>> -/* 0 == don't use VMX, 1 == use VMX */
>> -#define SELFTEST_CASE    0
>> -#endif
>> -
>>   #ifdef __BIG_ENDIAN__
>>   #define LVS(VRT,RA,RB)        lvsl    VRT,RA,RB
>>   #define VPERM(VRT,VRA,VRB,VRC)    vperm    VRT,VRA,VRB,VRC
>> @@ -47,10 +43,14 @@
>>       ld    r15,STK_REG(R15)(r1)
>>       ld    r14,STK_REG(R14)(r1)
>>   .Ldo_err3:
>> -    bl    CFUNC(exit_vmx_usercopy)
>> +    ld      r6,STK_REG(R31)(r1)    /* original destination pointer */
>> +    ld      r5,STK_REG(R29)(r1)    /* original number of bytes */
>> +    subf    r7,r6,r3        /* #bytes copied */
>> +    subf    r3,r7,r5        /* #bytes not copied in r3 */
>>       ld    r0,STACKFRAMESIZE+16(r1)
>>       mtlr    r0
>> -    b    .Lexit
>> +    addi    r1,r1,STACKFRAMESIZE
>> +    blr
>>   #endif /* CONFIG_ALTIVEC */
>>     .Ldo_err2:
>> @@ -74,7 +74,6 @@
>>     _GLOBAL(__copy_tofrom_user_power7)
>>       cmpldi    r5,16
>> -    cmpldi    cr1,r5,3328
>>         std    r3,-STACKFRAMESIZE+STK_REG(R31)(r1)
>>       std    r4,-STACKFRAMESIZE+STK_REG(R30)(r1)
>> @@ -82,12 +81,6 @@ _GLOBAL(__copy_tofrom_user_power7)
>>         blt    .Lshort_copy
>>   -#ifdef CONFIG_ALTIVEC
>> -test_feature = SELFTEST_CASE
>> -BEGIN_FTR_SECTION
>> -    bgt    cr1,.Lvmx_copy
>> -END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
>> -#endif
>>     .Lnonvmx_copy:
>>       /* Get the source 8B aligned */
>> @@ -263,23 +256,14 @@ err1;    stb    r0,0(r3)
>>   15:    li    r3,0
>>       blr
>>   -.Lunwind_stack_nonvmx_copy:
>> -    addi    r1,r1,STACKFRAMESIZE
>> -    b    .Lnonvmx_copy
>> -
>> -.Lvmx_copy:
>>   #ifdef CONFIG_ALTIVEC
>> +_GLOBAL(__copy_tofrom_user_power7_vmx)
>>       mflr    r0
>>       std    r0,16(r1)
>>       stdu    r1,-STACKFRAMESIZE(r1)
>> -    bl    CFUNC(enter_vmx_usercopy)
>> -    cmpwi    cr1,r3,0
>> -    ld    r0,STACKFRAMESIZE+16(r1)
>> -    ld    r3,STK_REG(R31)(r1)
>> -    ld    r4,STK_REG(R30)(r1)
>> -    ld    r5,STK_REG(R29)(r1)
>> -    mtlr    r0
>>   +    std     r3,STK_REG(R31)(r1)
>> +    std     r5,STK_REG(R29)(r1)
>>       /*
>>        * We prefetch both the source and destination using enhanced 
>> touch
>>        * instructions. We use a stream ID of 0 for the load side and
>> @@ -300,8 +284,6 @@ err1;    stb    r0,0(r3)
>>         DCBT_SETUP_STREAMS(r6, r7, r9, r10, r8)
>>   -    beq    cr1,.Lunwind_stack_nonvmx_copy
>> -
>>       /*
>>        * If source and destination are not relatively aligned we use a
>>        * slower permute loop.
>> @@ -478,7 +460,8 @@ err3;    lbz    r0,0(r4)
>>   err3;    stb    r0,0(r3)
>>     15:    addi    r1,r1,STACKFRAMESIZE
>> -    b    CFUNC(exit_vmx_usercopy)    /* tail call optimise */
>> +    li r3,0
>> +    blr
>>     .Lvmx_unaligned_copy:
>>       /* Get the destination 16B aligned */
>> @@ -681,5 +664,7 @@ err3;    lbz    r0,0(r4)
>>   err3;    stb    r0,0(r3)
>>     15:    addi    r1,r1,STACKFRAMESIZE
>> -    b    CFUNC(exit_vmx_usercopy)    /* tail call optimise */
>> +    li r3,0
>> +    blr
>> +EXPORT_SYMBOL(__copy_tofrom_user_power7_vmx)
>>   #endif /* CONFIG_ALTIVEC */
>> diff --git a/arch/powerpc/lib/vmx-helper.c 
>> b/arch/powerpc/lib/vmx-helper.c
>> index 54340912398f..35080885204b 100644
>> --- a/arch/powerpc/lib/vmx-helper.c
>> +++ b/arch/powerpc/lib/vmx-helper.c
>> @@ -10,6 +10,32 @@
>>   #include <linux/hardirq.h>
>>   #include <asm/switch_to.h>
>>   +unsigned long __copy_tofrom_user_vmx(void __user *to, const void 
>> __user *from,
>> +            unsigned long size, enum usercopy_mode mode)
>> +{
>> +    unsigned long ret;
>> +
>> +    if (!enter_vmx_usercopy()) {
>> +        raw_copy_allow(to, mode);
>> +        ret = __copy_tofrom_user(to, from, size);
>> +        raw_copy_prevent(mode);
>> +        return ret;
>> +    }
>> +
>> +    raw_copy_allow(to, mode);
>> +    ret = __copy_tofrom_user_power7_vmx(to, from, size);
>> +    raw_copy_prevent(mode);
>> +    exit_vmx_usercopy();
>> +    if (unlikely(ret)) {
>> +        raw_copy_allow(to, mode);
>> +        ret = __copy_tofrom_user_base(to, from, size);
>> +        raw_copy_prevent(mode);
>> +    }
>> +
>> +    return ret;
>> +}
>> +EXPORT_SYMBOL(__copy_tofrom_user_vmx);
>> +
>>   int enter_vmx_usercopy(void)
>>   {
>>       if (in_interrupt())
>
--------------GDsHtgWSI6I2E99s0XQlnoG1
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
    <div class="moz-cite-prefix">On 02/03/26 16:42, Christophe Leroy (CS
      GROUP) wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d90efa16-932e-4c29-b8e1-1a4ef08db403@kernel.org">Hi
      Sayali,
      <br>
      <br>
      Le 28/02/2026 à 14:53, Sayali Patil a écrit :
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
        Introduce a usercopy_mode enum to describe the copy direction
        <br>
        (IN, FROM, TO) and use it to derive the required KUAP
        permissions.
        <br>
        Userspace access is now enabled and disabled through common
        helpers
        <br>
        based on the selected mode, ensuring that the correct read/write
        <br>
        permissions are applied consistently.
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
           - Enable userspace access as per the usercopy mode
        <br>
             and perform the VMX copy
        <br>
           - Disable userspace access as per the usercopy mode
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
        ---
        <br>
        <br>
        v1-&gt;v2
        <br>
           - Updated as per the review comments.
        <br>
           - Centralized VMX usercopy handling in
        __copy_tofrom_user_vmx() in
        <br>
             arch/powerpc/lib/vmx-helper.c.
        <br>
           - Introduced a usercopy_mode enum to describe the copy
        direction
        <br>
             (IN, FROM, TO) and derive the required KUAP permissions,
        avoiding
        <br>
             duplication across the different usercopy paths.
        <br>
      </blockquote>
      <br>
      I like the reduction of duplication you propose but I can't see
      the added value of that enum, what about:
      <br>
      <br>
      diff --git a/arch/powerpc/include/asm/uaccess.h
      b/arch/powerpc/include/asm/uaccess.h
      <br>
      index 63d6eb8b004e..14a3219db838 100644
      <br>
      --- a/arch/powerpc/include/asm/uaccess.h
      <br>
      +++ b/arch/powerpc/include/asm/uaccess.h
      <br>
      @@ -329,12 +329,6 @@ do {                                \
      <br>
       extern unsigned long __copy_tofrom_user(void __user *to,
      <br>
               const void __user *from, unsigned long size);
      <br>
      <br>
      -enum usercopy_mode {
      <br>
      -    USERCOPY_IN,
      <br>
      -    USERCOPY_FROM,
      <br>
      -    USERCOPY_TO,
      <br>
      -};
      <br>
      -
      <br>
       unsigned long __copy_tofrom_user_vmx(void __user *to, const void
      __user *from,
      <br>
                       unsigned long size, enum usercopy_mode mode);
      <br>
      <br>
      @@ -352,48 +346,18 @@ static inline bool will_use_vmx(unsigned
      long n)
      <br>
               n &gt; VMX_COPY_THRESHOLD;
      <br>
       }
      <br>
      <br>
      -static inline void raw_copy_allow(void __user *to, enum
      usercopy_mode mode)
      <br>
      -{
      <br>
      -    switch (mode) {
      <br>
      -    case USERCOPY_IN:
      <br>
      -        allow_user_access(to, KUAP_READ_WRITE);
      <br>
      -        break;
      <br>
      -    case USERCOPY_FROM:
      <br>
      -        allow_user_access(NULL, KUAP_READ);
      <br>
      -        break;
      <br>
      -    case USERCOPY_TO:
      <br>
      -        allow_user_access(to, KUAP_WRITE);
      <br>
      -        break;
      <br>
      -    }
      <br>
      -}
      <br>
      -
      <br>
      -static inline void raw_copy_prevent(enum usercopy_mode mode)
      <br>
      -{
      <br>
      -    switch (mode) {
      <br>
      -    case USERCOPY_IN:
      <br>
      -        prevent_user_access(KUAP_READ_WRITE);
      <br>
      -        break;
      <br>
      -    case USERCOPY_FROM:
      <br>
      -        prevent_user_access(KUAP_READ);
      <br>
      -        break;
      <br>
      -    case USERCOPY_TO:
      <br>
      -        prevent_user_access(KUAP_WRITE);
      <br>
      -        break;
      <br>
      -    }
      <br>
      -}
      <br>
      -
      <br>
       static inline unsigned long raw_copy_tofrom_user(void __user *to,
      <br>
               const void __user *from, unsigned long n,
      <br>
      -        enum usercopy_mode mode)
      <br>
      +        unsigned long dir)
      <br>
       {
      <br>
           unsigned long ret;
      <br>
      <br>
           if (will_use_vmx(n))
      <br>
               return __copy_tofrom_user_vmx(to, from,    n, mode);
      <br>
      <br>
      -    raw_copy_allow(to, mode);
      <br>
      +    allow_user_access(to, dir);
      <br>
           ret = __copy_tofrom_user(to, from, n);
      <br>
      -    raw_copy_prevent(mode);
      <br>
      +    prevent_user_access(dir);
      <br>
           return ret;
      <br>
      <br>
       }
      <br>
      @@ -403,22 +367,20 @@ static inline unsigned long
      <br>
       raw_copy_in_user(void __user *to, const void __user *from,
      unsigned long n)
      <br>
       {
      <br>
           barrier_nospec();
      <br>
      -    return raw_copy_tofrom_user(to, from, n, USERCOPY_IN);
      <br>
      +    return raw_copy_tofrom_user(to, from, n, KUAP_READ_WRITE);
      <br>
       }
      <br>
       #endif /* __powerpc64__ */
      <br>
      <br>
       static inline unsigned long raw_copy_from_user(void *to,
      <br>
               const void __user *from, unsigned long n)
      <br>
       {
      <br>
      -    return raw_copy_tofrom_user((__force void __user *)to, from,
      <br>
      -                    n, USERCOPY_FROM);
      <br>
      +    return raw_copy_tofrom_user((__force void __user *)to, from,
      n, KUAP_READ);
      <br>
       }
      <br>
      <br>
       static inline unsigned long
      <br>
       raw_copy_to_user(void __user *to, const void *from, unsigned long
      n)
      <br>
       {
      <br>
      -    return raw_copy_tofrom_user(to, (__force const void __user
      *)from,
      <br>
      -                    n, USERCOPY_TO);
      <br>
      +    return raw_copy_tofrom_user(to, (__force const void __user
      *)from, n, KUAP_WRITE);
      <br>
       }
      <br>
      <br>
       unsigned long __arch_clear_user(void __user *addr, unsigned long
      size);
      <br>
      diff --git a/arch/powerpc/lib/vmx-helper.c
      b/arch/powerpc/lib/vmx-helper.c
      <br>
      index 35080885204b..4610f7153fd9 100644
      <br>
      --- a/arch/powerpc/lib/vmx-helper.c
      <br>
      +++ b/arch/powerpc/lib/vmx-helper.c
      <br>
      @@ -11,25 +11,25 @@
      <br>
       #include &lt;asm/switch_to.h&gt;
      <br>
      <br>
       unsigned long __copy_tofrom_user_vmx(void __user *to, const void
      __user *from,
      <br>
      -            unsigned long size, enum usercopy_mode mode)
      <br>
      +            unsigned long size, unsigned long dir)
      <br>
       {
      <br>
           unsigned long ret;
      <br>
      <br>
           if (!enter_vmx_usercopy()) {
      <br>
      -        raw_copy_allow(to, mode);
      <br>
      +        allow_user_access(to, dir);
      <br>
               ret = __copy_tofrom_user(to, from, size);
      <br>
      -        raw_copy_prevent(mode);
      <br>
      +        prevent_user_access(dir);
      <br>
               return ret;
      <br>
           }
      <br>
      <br>
      -    raw_copy_allow(to, mode);
      <br>
      +    allow_user_access(to, dir);
      <br>
           ret = __copy_tofrom_user_power7_vmx(to, from, size);
      <br>
      -    raw_copy_prevent(mode);
      <br>
      +    prevent_user_access(dir);
      <br>
           exit_vmx_usercopy();
      <br>
           if (unlikely(ret)) {
      <br>
      -        raw_copy_allow(to, mode);
      <br>
      +        allow_user_access(to, dir);
      <br>
               ret = __copy_tofrom_user_base(to, from, size);
      <br>
      -        raw_copy_prevent(mode);
      <br>
      +        prevent_user_access(dir);
      <br>
           }
      <br>
      <br>
           return ret;
      <br>
      <br>
      <br>
      <br>
      Christophe <br>
      <br>
      <font face="monospace" size="4"><br>
      </font></blockquote>
    <font face="monospace" size="4">Hi Christophe,<br>
      Thanks for the review.<br>
      With the suggested change, we are hitting a compilation error.<br>
      <br>
      The issue is related to how KUAP enforces the access direction.<br>
      allow_user_access() contains:<br>
      <br>
      BUILD_BUG_ON(!__builtin_constant_p(dir));<br>
      <br>
      which requires that the access direction is a compile-time
      constant.<br>
      If we pass a runtime value (for example, an unsigned long), the<br>
      __builtin_constant_p() check fails and triggers the following
      build error.<br>
      <br>
      Error:<br>
      In function 'allow_user_access', inlined from
      '__copy_tofrom_user_vmx' at arch/powerpc/lib/vmx-helper.c:19:3:<br>
      BUILD_BUG_ON failed: !__builtin_constant_p(dir) 706<br>
      <br>
      <br>
      The previous implementation worked because allow_user_access() was
      invoked with enum <br>
      constants (READ, WRITE, READ_WRITE), which satisfied the
      __builtin_constant_p() requirement.<br>
      So in this case, the function must be called with a compile-time
      constant to satisfy KUAP.<br>
      <br>
      Please let me know if you would prefer a different approach.<br>
      <br>
      Regards,<br>
      Sayali</font><br>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:d90efa16-932e-4c29-b8e1-1a4ef08db403@kernel.org">
      <blockquote type="cite">
        <br>
        v1:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20260217124457.89219-1-sayalip@linux.ibm.com/">https://lore.kernel.org/all/20260217124457.89219-1-sayalip@linux.ibm.com/</a><br>
        <br>
        ---
        <br>
          arch/powerpc/include/asm/uaccess.h | 95
        ++++++++++++++++++++++++------
        <br>
          arch/powerpc/lib/copyuser_64.S     |  1 +
        <br>
          arch/powerpc/lib/copyuser_power7.S | 45 +++++---------
        <br>
          arch/powerpc/lib/vmx-helper.c      | 26 ++++++++
        <br>
          4 files changed, 119 insertions(+), 48 deletions(-)
        <br>
        <br>
        diff --git a/arch/powerpc/include/asm/uaccess.h
        b/arch/powerpc/include/asm/uaccess.h
        <br>
        index ba1d878c3f40..63d6eb8b004e 100644
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
        @@ -326,40 +329,96 @@ do {                                \
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
        +enum usercopy_mode {
        <br>
        +    USERCOPY_IN,
        <br>
        +    USERCOPY_FROM,
        <br>
        +    USERCOPY_TO,
        <br>
        +};
        <br>
        +
        <br>
        +unsigned long __copy_tofrom_user_vmx(void __user *to, const
        void __user *from,
        <br>
        +                unsigned long size, enum usercopy_mode mode);
        <br>
        +
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
        +static inline bool will_use_vmx(unsigned long n)
        <br>
        +{
        <br>
        +    return IS_ENABLED(CONFIG_ALTIVEC) &amp;&amp;
        <br>
        +        cpu_has_feature(CPU_FTR_VMX_COPY) &amp;&amp;
        <br>
        +        n &gt; VMX_COPY_THRESHOLD;
        <br>
        +}
        <br>
        +
        <br>
        +static inline void raw_copy_allow(void __user *to, enum
        usercopy_mode mode)
        <br>
        +{
        <br>
        +    switch (mode) {
        <br>
        +    case USERCOPY_IN:
        <br>
        +        allow_user_access(to, KUAP_READ_WRITE);
        <br>
        +        break;
        <br>
        +    case USERCOPY_FROM:
        <br>
        +        allow_user_access(NULL, KUAP_READ);
        <br>
        +        break;
        <br>
        +    case USERCOPY_TO:
        <br>
        +        allow_user_access(to, KUAP_WRITE);
        <br>
        +        break;
        <br>
        +    }
        <br>
        +}
        <br>
        +
        <br>
        +static inline void raw_copy_prevent(enum usercopy_mode mode)
        <br>
        +{
        <br>
        +    switch (mode) {
        <br>
        +    case USERCOPY_IN:
        <br>
        +        prevent_user_access(KUAP_READ_WRITE);
        <br>
        +        break;
        <br>
        +    case USERCOPY_FROM:
        <br>
        +        prevent_user_access(KUAP_READ);
        <br>
        +        break;
        <br>
        +    case USERCOPY_TO:
        <br>
        +        prevent_user_access(KUAP_WRITE);
        <br>
        +        break;
        <br>
        +    }
        <br>
        +}
        <br>
        +
        <br>
        +static inline unsigned long raw_copy_tofrom_user(void __user
        *to,
        <br>
        +        const void __user *from, unsigned long n,
        <br>
        +        enum usercopy_mode mode)
        <br>
          {
        <br>
              unsigned long ret;
        <br>
          -    barrier_nospec();
        <br>
        -    allow_user_access(to, KUAP_READ_WRITE);
        <br>
        +    if (will_use_vmx(n))
        <br>
        +        return __copy_tofrom_user_vmx(to, from,    n, mode);
        <br>
        +
        <br>
        +    raw_copy_allow(to, mode);
        <br>
              ret = __copy_tofrom_user(to, from, n);
        <br>
        -    prevent_user_access(KUAP_READ_WRITE);
        <br>
        +    raw_copy_prevent(mode);
        <br>
              return ret;
        <br>
        +
        <br>
        +}
        <br>
        +
        <br>
        +#ifdef __powerpc64__
        <br>
        +static inline unsigned long
        <br>
        +raw_copy_in_user(void __user *to, const void __user *from,
        unsigned long n)
        <br>
        +{
        <br>
        +    barrier_nospec();
        <br>
        +    return raw_copy_tofrom_user(to, from, n, USERCOPY_IN);
        <br>
          }
        <br>
          #endif /* __powerpc64__ */
        <br>
            static inline unsigned long raw_copy_from_user(void *to,
        <br>
                  const void __user *from, unsigned long n)
        <br>
          {
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
        +                    n, USERCOPY_FROM);
        <br>
          }
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
        +                    n, USERCOPY_TO);
        <br>
          }
        <br>
            unsigned long __arch_clear_user(void __user *addr, unsigned
        long size);
        <br>
        diff --git a/arch/powerpc/lib/copyuser_64.S
        b/arch/powerpc/lib/copyuser_64.S
        <br>
        index 9af969d2cc0c..25a99108caff 100644
        <br>
        --- a/arch/powerpc/lib/copyuser_64.S
        <br>
        +++ b/arch/powerpc/lib/copyuser_64.S
        <br>
        @@ -562,3 +562,4 @@ exc;    std    r10,32(3)
        <br>
              li    r5,4096
        <br>
              b    .Ldst_aligned
        <br>
          EXPORT_SYMBOL(__copy_tofrom_user)
        <br>
        +EXPORT_SYMBOL(__copy_tofrom_user_base)
        <br>
        diff --git a/arch/powerpc/lib/copyuser_power7.S
        b/arch/powerpc/lib/copyuser_power7.S
        <br>
        index 8474c682a178..17dbcfbae25f 100644
        <br>
        --- a/arch/powerpc/lib/copyuser_power7.S
        <br>
        +++ b/arch/powerpc/lib/copyuser_power7.S
        <br>
        @@ -5,13 +5,9 @@
        <br>
           *
        <br>
           * Author: Anton Blanchard <a class="moz-txt-link-rfc2396E" href="mailto:anton@au.ibm.com">&lt;anton@au.ibm.com&gt;</a>
        <br>
           */
        <br>
        +#include &lt;linux/export.h&gt;
        <br>
          #include &lt;asm/ppc_asm.h&gt;
        <br>
          -#ifndef SELFTEST_CASE
        <br>
        -/* 0 == don't use VMX, 1 == use VMX */
        <br>
        -#define SELFTEST_CASE    0
        <br>
        -#endif
        <br>
        -
        <br>
          #ifdef __BIG_ENDIAN__
        <br>
          #define LVS(VRT,RA,RB)        lvsl    VRT,RA,RB
        <br>
          #define VPERM(VRT,VRA,VRB,VRC)    vperm    VRT,VRA,VRB,VRC
        <br>
        @@ -47,10 +43,14 @@
        <br>
              ld    r15,STK_REG(R15)(r1)
        <br>
              ld    r14,STK_REG(R14)(r1)
        <br>
          .Ldo_err3:
        <br>
        -    bl    CFUNC(exit_vmx_usercopy)
        <br>
        +    ld      r6,STK_REG(R31)(r1)    /* original destination
        pointer */
        <br>
        +    ld      r5,STK_REG(R29)(r1)    /* original number of bytes
        */
        <br>
        +    subf    r7,r6,r3        /* #bytes copied */
        <br>
        +    subf    r3,r7,r5        /* #bytes not copied in r3 */
        <br>
              ld    r0,STACKFRAMESIZE+16(r1)
        <br>
              mtlr    r0
        <br>
        -    b    .Lexit
        <br>
        +    addi    r1,r1,STACKFRAMESIZE
        <br>
        +    blr
        <br>
          #endif /* CONFIG_ALTIVEC */
        <br>
            .Ldo_err2:
        <br>
        @@ -74,7 +74,6 @@
        <br>
            _GLOBAL(__copy_tofrom_user_power7)
        <br>
              cmpldi    r5,16
        <br>
        -    cmpldi    cr1,r5,3328
        <br>
                std    r3,-STACKFRAMESIZE+STK_REG(R31)(r1)
        <br>
              std    r4,-STACKFRAMESIZE+STK_REG(R30)(r1)
        <br>
        @@ -82,12 +81,6 @@ _GLOBAL(__copy_tofrom_user_power7)
        <br>
                blt    .Lshort_copy
        <br>
          -#ifdef CONFIG_ALTIVEC
        <br>
        -test_feature = SELFTEST_CASE
        <br>
        -BEGIN_FTR_SECTION
        <br>
        -    bgt    cr1,.Lvmx_copy
        <br>
        -END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
        <br>
        -#endif
        <br>
            .Lnonvmx_copy:
        <br>
              /* Get the source 8B aligned */
        <br>
        @@ -263,23 +256,14 @@ err1;    stb    r0,0(r3)
        <br>
          15:    li    r3,0
        <br>
              blr
        <br>
          -.Lunwind_stack_nonvmx_copy:
        <br>
        -    addi    r1,r1,STACKFRAMESIZE
        <br>
        -    b    .Lnonvmx_copy
        <br>
        -
        <br>
        -.Lvmx_copy:
        <br>
          #ifdef CONFIG_ALTIVEC
        <br>
        +_GLOBAL(__copy_tofrom_user_power7_vmx)
        <br>
              mflr    r0
        <br>
              std    r0,16(r1)
        <br>
              stdu    r1,-STACKFRAMESIZE(r1)
        <br>
        -    bl    CFUNC(enter_vmx_usercopy)
        <br>
        -    cmpwi    cr1,r3,0
        <br>
        -    ld    r0,STACKFRAMESIZE+16(r1)
        <br>
        -    ld    r3,STK_REG(R31)(r1)
        <br>
        -    ld    r4,STK_REG(R30)(r1)
        <br>
        -    ld    r5,STK_REG(R29)(r1)
        <br>
        -    mtlr    r0
        <br>
          +    std     r3,STK_REG(R31)(r1)
        <br>
        +    std     r5,STK_REG(R29)(r1)
        <br>
              /*
        <br>
               * We prefetch both the source and destination using
        enhanced touch
        <br>
               * instructions. We use a stream ID of 0 for the load side
        and
        <br>
        @@ -300,8 +284,6 @@ err1;    stb    r0,0(r3)
        <br>
                DCBT_SETUP_STREAMS(r6, r7, r9, r10, r8)
        <br>
          -    beq    cr1,.Lunwind_stack_nonvmx_copy
        <br>
        -
        <br>
              /*
        <br>
               * If source and destination are not relatively aligned we
        use a
        <br>
               * slower permute loop.
        <br>
        @@ -478,7 +460,8 @@ err3;    lbz    r0,0(r4)
        <br>
          err3;    stb    r0,0(r3)
        <br>
            15:    addi    r1,r1,STACKFRAMESIZE
        <br>
        -    b    CFUNC(exit_vmx_usercopy)    /* tail call optimise */
        <br>
        +    li r3,0
        <br>
        +    blr
        <br>
            .Lvmx_unaligned_copy:
        <br>
              /* Get the destination 16B aligned */
        <br>
        @@ -681,5 +664,7 @@ err3;    lbz    r0,0(r4)
        <br>
          err3;    stb    r0,0(r3)
        <br>
            15:    addi    r1,r1,STACKFRAMESIZE
        <br>
        -    b    CFUNC(exit_vmx_usercopy)    /* tail call optimise */
        <br>
        +    li r3,0
        <br>
        +    blr
        <br>
        +EXPORT_SYMBOL(__copy_tofrom_user_power7_vmx)
        <br>
          #endif /* CONFIG_ALTIVEC */
        <br>
        diff --git a/arch/powerpc/lib/vmx-helper.c
        b/arch/powerpc/lib/vmx-helper.c
        <br>
        index 54340912398f..35080885204b 100644
        <br>
        --- a/arch/powerpc/lib/vmx-helper.c
        <br>
        +++ b/arch/powerpc/lib/vmx-helper.c
        <br>
        @@ -10,6 +10,32 @@
        <br>
          #include &lt;linux/hardirq.h&gt;
        <br>
          #include &lt;asm/switch_to.h&gt;
        <br>
          +unsigned long __copy_tofrom_user_vmx(void __user *to, const
        void __user *from,
        <br>
        +            unsigned long size, enum usercopy_mode mode)
        <br>
        +{
        <br>
        +    unsigned long ret;
        <br>
        +
        <br>
        +    if (!enter_vmx_usercopy()) {
        <br>
        +        raw_copy_allow(to, mode);
        <br>
        +        ret = __copy_tofrom_user(to, from, size);
        <br>
        +        raw_copy_prevent(mode);
        <br>
        +        return ret;
        <br>
        +    }
        <br>
        +
        <br>
        +    raw_copy_allow(to, mode);
        <br>
        +    ret = __copy_tofrom_user_power7_vmx(to, from, size);
        <br>
        +    raw_copy_prevent(mode);
        <br>
        +    exit_vmx_usercopy();
        <br>
        +    if (unlikely(ret)) {
        <br>
        +        raw_copy_allow(to, mode);
        <br>
        +        ret = __copy_tofrom_user_base(to, from, size);
        <br>
        +        raw_copy_prevent(mode);
        <br>
        +    }
        <br>
        +
        <br>
        +    return ret;
        <br>
        +}
        <br>
        +EXPORT_SYMBOL(__copy_tofrom_user_vmx);
        <br>
        +
        <br>
          int enter_vmx_usercopy(void)
        <br>
          {
        <br>
              if (in_interrupt())
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------GDsHtgWSI6I2E99s0XQlnoG1--


