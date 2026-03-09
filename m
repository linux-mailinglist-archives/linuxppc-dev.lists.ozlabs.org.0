Return-Path: <linuxppc-dev+bounces-17878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCrcK1harmkMCgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 06:27:52 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC5A233E85
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 06:27:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTls118GLz3c9M;
	Mon, 09 Mar 2026 16:27:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773034069;
	cv=none; b=TJkxbyS8qYZzUWbGgX6PZHizBAOTO+++gEU3i38D4gXb1yjVGEq35CCBEcFW7PaDgze9pN5eEWd89l7Ilw5ORmuXkwT8lJ3Mcsw0p10g78yOlTykAkc4MBPDglNUoQco/V5VEpJ0neEVWwtfn+htDHMKJ0U4AWmyqRAy7JbwhFWoUG3mUR8zCJT3MVE40i0XOaGHc3OyWVeTMiadsg3+KomodOEsxFRSJQFpAbBvjDRsxZiDWWyhzsl8aJaLnS8vTKIwm8XJOdArLNniBGegqSupbPxSqPGhpuUWecbImKKmaA9t1AYcFZiwYUuy5Ph0u5ZbmgMllExQmWIAVTs3vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773034069; c=relaxed/relaxed;
	bh=kueHZBM3CByUomuPjXrBI0nG6M8zP8y7su2qFsVkqbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SPMhz/YN+vLWn2UdQoEG4aJsUx3+WFoWNEwMj2Q6bYpvKjiaPp7RdZdQYXNErlzU/CGl8PIg0YtkM6CkrHf8CCp8AehYgghLXjTTUHi+PDuG/SLwR7wTzZfom2mWQliNP9VOMOOLdISscD2sMlBuL6CdpnywuT2dpL4YIxbZNFMrzAaxLZi83qrJu6AGJhhRNO8Zs/kEZqpYN5hVDI6UkmnzK42o1CE7oywWicEccY1jOkrxIR2jY7duHB9rtl1U8rCHc7CTZSQjom0TwhCqjwH7E/jEUdAjlIN/X8nrkxFuQ0JlQbSPZucmYQ7GPmiR0ilwkcUybmRh5pbEEi2rXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jbwV5Mde; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jbwV5Mde;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTlrz6ZFBz2xdL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 16:27:47 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628Ni7sk1643088;
	Mon, 9 Mar 2026 05:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kueHZB
	M3CByUomuPjXrBI0nG6M8zP8y7su2qFsVkqbg=; b=jbwV5MdeBb1OUyf6EeG3A2
	wig2a+DygRM0S5H2LALhnafvSbUush5fb46WBJsW8aG4ouwvJFykhf82DafWSUIi
	vRRKcWFv0coCXm698NK9myJw3D3be26JJiIPwT72u3PojFXN8D17g2WrlPZDhXnX
	sYVBwRLmHxX/gL5R/YiEMlccjWLhhiQ4ef5zGEFdY84qfoxqlxHH8qI64ceRUwHU
	7vcd+5H+1Ibe0cSxat8+HF1y73uw3FXBYgLXMf0oWS+j3ZJCLLgiVZNh2xr2hHyx
	OycfjbUZEh+Lnpn0OPoZdGoZ5XyBrC4acIUq28nIDUpd84VpGH5qVfqwGHwmwZWQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcyw56at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 05:27:38 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 628NfPlk015725;
	Mon, 9 Mar 2026 05:27:37 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cs121udxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 05:27:37 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6295RXxH54591960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Mar 2026 05:27:33 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C20222004E;
	Mon,  9 Mar 2026 05:27:33 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DBA720040;
	Mon,  9 Mar 2026 05:27:31 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Mar 2026 05:27:31 +0000 (GMT)
Message-ID: <c2cffe49-33d6-4cd3-9413-22c6197c5239@linux.ibm.com>
Date: Mon, 9 Mar 2026 10:57:30 +0530
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
Cc: aboorvad@linux.ibm.com, chleroy@kernel.org, riteshh@linux.ibm.com,
        hbathini@linux.ibm.com, ming.lei@redhat.com, csander@purestorage.com,
        czhong@redhat.com, venkat88@linux.ibm.com
References: <20260304122201.153049-1-sayalip@linux.ibm.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260304122201.153049-1-sayalip@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA0NCBTYWx0ZWRfXyL+u8vbPG2u2
 tnvE+nkZ1dc30rZiZmBb1ZmHBIzwCpYJ+UdoblRrD4eiIpA97Yl+9KmvrV+q45mti8oCDPXxg/H
 QkqNQ5kWcGfgDG4FDdFgcaTScKjLm9zvaMc1pkFMpunhIaXahxS6Fhh+6HgiUd74gAFRRG468wx
 WbiP6BPV01Yk+jKgsEkFnkd8B/aRFknx+nldZJYAl+H5oV8NFmmZOrWjWAxzDLX5ulfqKhZS8J7
 K6wy7F19B3oPSVsi01JpBlkjcUhaVpunlB9eHIRhH8YFBnKI/uWlqajCJeOVzG++3pSiunclLlT
 5QunTp+0z7QopnuO2KFa6l5yBziek/fHUB98/bxjgp/0iDakeU7nFdIU3q5gIYgWWFbWjnGaVSb
 vifEka4+ALhNzK+zBQYH731bxKaT9wRGwDoxRUh07HzcWdvaX3B+KJsgaSHcf8IovXsqBob1ezi
 b4TDmQB9pSTOy55CfwQ==
X-Authority-Analysis: v=2.4 cv=QaVrf8bv c=1 sm=1 tr=0 ts=69ae5a4a cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=iq1I6d-ZmOQmgDjnUR4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: uLvtXBoRSzdGeyKTdjvuPkB-1UU69XLw
X-Proofpoint-ORIG-GUID: uLvtXBoRSzdGeyKTdjvuPkB-1UU69XLw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1011 adultscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090044
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: CFC5A233E85
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-17878-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sayalip@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:aboorvad@linux.ibm.com,m:chleroy@kernel.org,m:riteshh@linux.ibm.com,m:hbathini@linux.ibm.com,m:ming.lei@redhat.com,m:csander@purestorage.com,m:czhong@redhat.com,m:venkat88@linux.ibm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,linux.ibm.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 3/4/26 5:52 PM, Sayali Patil wrote:
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

This does fix the reported problem. Gave this a try on PowerNV box too.

Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>

