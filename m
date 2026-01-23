Return-Path: <linuxppc-dev+bounces-16236-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lf8gMVVvc2kwvwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16236-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 13:53:41 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8286D76058
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 13:53:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyHt831BSz2xdY;
	Fri, 23 Jan 2026 23:53:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769172816;
	cv=none; b=XepwPS6mSb5OqEa8M4Ed/Irlb9Pxl1AMIUscUoQosXbjTyWx+pPEF86RqN+xwcukTQ6UV+0s2M7zffQgE/00M5Jj0+xB1DLq9GaatZFoN19zMheJHhWihhCrVob53SzPv0b0UvB94TQ3EXmPxxWmZGWqqQzsD6X6gIef6829M/zZQQTGruYCPxSi0j5oRuRME1s6y8t1uxPMxNQRQOAdRDQEMoehhhxfrOJWLYXpstUlkffeFhafqmp5DsciRmORTmk6YIwO0JcNV/8y0N+G9kdWg9it9X3clL0x5an/Ep0/pykGHnXjpnLrqGEIjjC7VC24ouUoHNFkCN2Uy4B7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769172816; c=relaxed/relaxed;
	bh=2FyZ0yq64l8xxgmx4MCJj5LlQFBuun7q58aTor9k8eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDkm6EapwKI/VzIJFGS5hzEoQB5bpW4xA1AwaoeRpVmlR4CGG9qJ8YwmsFuRC+1UPdu5ndcc4bjku4RcAQwum8lkrjV1dJlXAEmRID/zn3IoUA2UNSToKgqgEI/wYc1I1bBv3sVbqF1Omb/JFmqyZ2ZOBw62MUx1A3K7nRN+O/jmTyg7Tha8vCrspEKdXTNzJYer0JPMA1C0jMOLYx+rv9e61RMHxg+qQWFsqST2iJEe2Df5q4xqX29BaV6jgWIK3M6j00pJJina7RLWIZWxG8RK4c9QshuR/+fs5Euf6Ktn1gGw99ooZM7IVm5w7Ba8D0NKcPARH9Qzs+Avza70SA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h6D78Jlx; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h6D78Jlx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyHt74sQdz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 23:53:35 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60N2bxS5019542;
	Fri, 23 Jan 2026 12:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2FyZ0y
	q64l8xxgmx4MCJj5LlQFBuun7q58aTor9k8eo=; b=h6D78Jlx6it9ZMvyEkZ3LA
	z4HhC0RVFNMhxynIsrxjrRXNWb0+ay1nGbpiBenDWCUUJBUQQ6FJHLXLrKC6OGRX
	W+trJ1AeXB4+GiIVNpQ+LSqHO00GaXgkrrKK2E8WW1gRc96oa3AyzjWUXFhvkn9N
	P6Rcp6aUw+a/hC7SfDxNFnfBKvEBB4PsvQ7xY0aQLL39nkEUW6+deomwTTCEenLJ
	utx55zM+72NedM+4THhwZ901BB6IxkVh0mRQltIex8ojNVdriAM/SjSz1zaa3UIF
	zcy+Rdsf5s9DlSWLteX8qJL4bOFw3r1xd/Xmjh0+njDBINeIED0MNk+U05eBpvcw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br256fy6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 12:51:58 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60NCklSD014942;
	Fri, 23 Jan 2026 12:51:57 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br256fy66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 12:51:57 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60N9fSBh024583;
	Fri, 23 Jan 2026 12:51:56 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brxas7d8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 12:51:56 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60NCpqDL41091434
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jan 2026 12:51:52 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 620CE20043;
	Fri, 23 Jan 2026 12:51:52 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3677E20040;
	Fri, 23 Jan 2026 12:51:47 +0000 (GMT)
Received: from [9.78.106.105] (unknown [9.78.106.105])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Jan 2026 12:51:47 +0000 (GMT)
Message-ID: <7a5c0997-a5d1-4a2d-8d6a-f2697f575b65@linux.ibm.com>
Date: Fri, 23 Jan 2026 18:21:46 +0530
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
Subject: Re: [PATCH v4 4/6] powerpc64/bpf: Add arch_bpf_stack_walk() for BPF
 JIT
To: adubey@linux.ibm.com, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sachinpb@linux.ibm.com, venkat88@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org
References: <20260122211854.5508-1-adubey@linux.ibm.com>
 <20260122211854.5508-5-adubey@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20260122211854.5508-5-adubey@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEwNSBTYWx0ZWRfX60X9yPmpZv+o
 D6AbgOMbFXnlqHhvVml2SVJY1AhRdIbp5U6y55CtLM5svVigjFEdWA/7FSvgJEZDRJjhemsQXbc
 vFsfs4IM40rHkhT9spuT1QyhqnmRdu3SHA4fud4obttvgrwHayLQISLwtHHzxKzrmVmGXHV/oPz
 0n/MpNq4ynrP/3WEE/VYZRh6rfXoORCWt99nhZNDc+lL9ojxKLEjP8qzg1ukKhOuKLd3NVMaKVS
 vRsJf4cjh54tT40orB9zDLKOOgZwxIy0zFlw40Fohrewg9sD4Ka8aojWBS5GpR7zDKRBWRCg+13
 H1Jv0DKNa8rW6bFeU5YdacBfVbhLK/f8nOOXBLJc16s/dhBiG6U6GUjAdy+T1tIfyvsLDsfs5IZ
 kQifRURL37YLzyHpUkZIW0t9mhYNk/bAWktqWccQ/bZmYbERnHEvCZV7sgdQYq0XeXmpH60+vqo
 PV4OQFcRE1kZjUtCQmw==
X-Authority-Analysis: v=2.4 cv=BpSQAIX5 c=1 sm=1 tr=0 ts=69736eee cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=DG0_Qwyj5ITTcQcW4q8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: eGZ4HzSdcozE9GHkEshG_CPU23K_dgTB
X-Proofpoint-ORIG-GUID: YWWtRqAs31Iq652K2nCfH24MOxC874Mn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601230105
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16236-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:adubey@linux.ibm.com,m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_TWELVE(0.00)[28];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.376];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 8286D76058
X-Rspamd-Action: no action



On 23/01/26 2:48 am, adubey@linux.ibm.com wrote:
> From: Abhishek Dubey <adubey@linux.ibm.com>
> 
> This function is used by bpf_throw() to unwind the stack
> until frame of exception-boundary during BPF exception
> handling.
> 
> This function is necessary to support BPF exceptions on
> PowerPC.
> 
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit_comp64.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 18da5a866447..c25ba1ad587a 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -247,6 +247,34 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
>   	bpf_jit_build_fentry_stubs(image, ctx);
>   }
>   
> +void arch_bpf_stack_walk(bool (*consume_fn)(void *, u64, u64, u64), void *cookie)
> +{
> +	// callback processing always in current context
> +	unsigned long fp = current_stack_frame();
> +
> +	for (;;) {
> +		unsigned long *frame = (unsigned long *) fp;
> +		unsigned long ip;
> +
> +		if (!validate_sp(fp, current))
> +			return;
> +
> +		ip = frame[STACK_FRAME_LR_SAVE];
> +		if (!ip)
> +			break;
> +
> +		/*
> +		 * consume_fn common code expects stack pointer(sp) in third
> +		 * argument. There is no sp in ppc64, rather pass frame
> +		 * pointer.
> +		 */
> +		if (ip && !consume_fn(cookie, ip, fp, fp))
> +			break;
> +
> +		fp = frame[0];
> +	}
> +}
> +
>   int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func)
>   {
>   	unsigned long func_addr = func ? ppc_function_entry((void *)func) : 0;

Ok. Refactoring of arch_stack_walk() & arch_bpf_stack_walk() can be done
as a follow-up, but keep the code as identical as possible. Use 'sp'
instead of 'fp' and 'stack' instead of 'frame' to make it easy to
spot the similarities. Also, a "TODO:" comment on refactoring would
be good..

- Hari

