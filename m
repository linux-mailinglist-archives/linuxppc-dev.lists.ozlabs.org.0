Return-Path: <linuxppc-dev+bounces-17572-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMpHAUfmpmnjZAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17572-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:46:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 135641F0A12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:46:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQHCR24YPz3bnr;
	Wed, 04 Mar 2026 00:46:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772545603;
	cv=none; b=aMPnrhNKyJbJXy6M8yw8geCB6ccL/TD0RiOfib9Ms5SKbmnf/FcLuts65UUrPXnDtqAzhv4bYq8NWEpxHuTVu3dSo+MF+9WSJt0esC2MvrkxRHynuP/3ieqjmgBw1vUNqyKJbCY6Pyj5asVQql0P4jw+Z2cx/U7NzFvJNombCV5MYdEd4Q5ehF9AsoLOULOUrW0K6VwvMgFbABTPhpo/UvehIWscp4czmclxwtAtcPE/Vo1NsLrjOTZXXfphnv5KhI5QLnpi2lWn4du9rCOyQUlmW91+7OXDy4MQNKaRDaiDqm2Zo0xQZTzu9FFWoZTyiq/oZRmzjx2+nDuJK/68qA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772545603; c=relaxed/relaxed;
	bh=asy+thlMkMBwcQz4UGE0S+RGOlnm/ut2DPcQvsToO1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYp0SgXeQT68U5C0xJM3Cf008NJwfPIxRXCIVcwm4qKOpTaqnt6pXyaAXjxVjWrZwR0iW/wh4JIQfg9rX48UrDOiw5Y6xxQrLpuYJg17YzQ0Yd5gk5bmvOwW6wVQXJzy0juJ7QdTT00uqvxYe6T5opfNKqCEJ2OPQtR/+VaWCkgd5DpqaEwr3+kYiEGd1McpVXlEJt/4G/w2V8MZH/Cs3BgbPdHCO4jFmgM5uaBL4Lk4BGfiywBryiGp1dgZGwOPQtvwxHSlte59O4jhootZ3rckpzq4OjTvJ9RB4lgnRrBpXC01iOT/maJfiigEgyxXn6W2jhWNxDCuN0JyFPIRcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JKUv0IT1; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JKUv0IT1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQHCP4PjHz30Lw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 00:46:41 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62363ILB2080896;
	Tue, 3 Mar 2026 13:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=asy+th
	lMkMBwcQz4UGE0S+RGOlnm/ut2DPcQvsToO1Y=; b=JKUv0IT1QAaSv4S3o5fR8E
	FZvIefQMcvMmufl2o5oieEyvhQOiO8MGhlkFDMHEz546ZAeJ4FdaBkxYv1gbzS1Y
	PaN0Nd3Rsrj56dXxRYYfqdrzOAWkrM6eBCd02TxV+BE7zKKkTVLoJo32vplMqzQP
	YpflQprcEMs0bZuegYgDHdP4/BlTy3S0/kTEiYFJaMc1P9CTutOIbMdd8dnkbuOB
	Ah8jtNdnIxByykgRW0kXM2vJNP5gsWM/dj70jFhx1mvJ06vAMq49Z8zpdCbfDOh8
	q1ED54KRrp8PtOh4CoJaNVX5v4gOk49EtuJassq3VgZTwpIahGON+SS92ULvLOZg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckssmjxaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 13:46:26 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 623Aw4O6027704;
	Tue, 3 Mar 2026 13:46:26 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmcwja807-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 13:46:26 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 623DkMix49283430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 13:46:22 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DF532004F;
	Tue,  3 Mar 2026 13:46:22 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0A5420040;
	Tue,  3 Mar 2026 13:46:20 +0000 (GMT)
Received: from [9.78.106.17] (unknown [9.78.106.17])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Mar 2026 13:46:20 +0000 (GMT)
Message-ID: <0183a042-01c1-4d6d-aa6d-9724cef74978@linux.ibm.com>
Date: Tue, 3 Mar 2026 19:16:20 +0530
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
Subject: Re: [PATCH v2 5/5] powerpc64/bpf: fix handling of BPF stack in
 exception callback
To: adubey <adubey@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>, bot+bpf-ci@kernel.org
References: <20260220063933.196141-1-hbathini@linux.ibm.com>
 <20260220063933.196141-6-hbathini@linux.ibm.com>
 <7be71e61b6e9c522b03f96b1c4158b53@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <7be71e61b6e9c522b03f96b1c4158b53@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOCBTYWx0ZWRfX4M3we9Vg0yum
 wyMRObApQkFbZGRFcx7jEnQ1E5a12/R5+Z9B/Pl5mdwVwqD7B8Xolu6BVoqwncQpxwQQ9m6+qqs
 6uEGtWugCiLl0Yh9BmfLkg2OeJTYie2XNZTCwTnQCs4MllihAGEhKWngh1/leGqiIJ+kROkNLMI
 29wG49z/7z8V6a8RuQn0n5m5gtYiOAKjbdrbnwPr6mGQFMsIt7AAtoj69/dUNKfwt09sUKrGve+
 5fV8eFtpVYmlLgpn0/0j4ltX83a2YjIF2Rx6GiVDPPguxsuB8BniKvc5EiMbxkYA1d/8yLu59rz
 mq7PLyYW0yTV03CHDkqYuueP60PmETgxDV8au5imjWzcp6ONk9xlYaAT9C+4XiyJxIEAIw+Qjq4
 MhjWxtHwasD4oc+WIt1U1PMuWb8cfo0Kr9cW6Gg3EjaGXtkauw3JNLs+Wj0X8RFBAHp5qLQGIoC
 FJe09iDl24UD15KPFLw==
X-Proofpoint-ORIG-GUID: AwiqV9rMivse3059pViol0b0l3Up0otx
X-Proofpoint-GUID: AwiqV9rMivse3059pViol0b0l3Up0otx
X-Authority-Analysis: v=2.4 cv=AobjHe9P c=1 sm=1 tr=0 ts=69a6e632 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=FE_IyaicahEbgNOQyFYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030108
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 135641F0A12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17572-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:adubey@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:bpf@vger.kernel.org,m:maddy@linux.ibm.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:skb99@linux.ibm.com,m:venkat88@linux.ibm.com,m:bot+bpf-ci@kernel.org,m:bot@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,bpf-ci];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 23/02/26 2:33 pm, adubey wrote:
> On 2026-02-20 12:09, Hari Bathini wrote:
>> Exception callback reuses the stack frame of exception boundary. When
>> exception boundary and exception callback programs have different BPF
>> stack depth, the current stack unwind in exception callback will fail.
>> Adjust the stack frame size of exception callback, in its prologue,
>> if its BPF stack depth is different from that of exception boundary.
>>
>> Reported-by: bot+bpf-ci@kernel.org
>> Closes:
>> https://lore.kernel.org/ 
>> bpf/2a310e86a59eb4c44c3ac9e5647814469d9c955580c9c0f1b3d9ca4a44717a34@mail.kernel.org/
>> Fixes: 11d45eee9f42 ("powerpc64/bpf: Additional NVR handling for 
>> bpf_throw")
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>
>> Changes since v1:
>> * Fixed incorrect use of PPC_RAW_SUB() as pointed out by
>>   bot+bpf-ci@kernel.org.
>>
>>
>>  arch/powerpc/net/bpf_jit_comp64.c | 30 ++++++++++++++++++++++--------
>>  1 file changed, 22 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c
>> b/arch/powerpc/net/bpf_jit_comp64.c
>> index 5d4d2bb23cef..33b2a7fd9067 100644
>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
>> @@ -32,14 +32,15 @@
>>   *
>>   *        [    prev sp        ] <-------------
>>   *        [    tail_call_info    ] 8        |
>> - *        [   nv gpr save area    ] 6*8 + (12*8)    |
>> + *        [   nv gpr save area    ] 6*8        |
>> + *        [ addl. nv gpr save area] (12*8)    | <--- exception 
>> boundary/callback program
>>   *        [    local_tmp_var    ] 24        |
>>   * fp (r31) -->    [   ebpf stack space    ] upto 512    |
>>   *        [     frame header    ] 32/112    |
>>   * sp (r1) --->    [    stack pointer    ] --------------
>>   *
>>   * Additional (12*8) in 'nv gpr save area' only in case of
>> - * exception boundary.
>> + * exception boundary/callback.
>>   */
>>
>>  /* BPF non-volatile registers save area size */
>> @@ -128,12 +129,13 @@ static inline bool bpf_has_stack_frame(struct
>> codegen_context *ctx)
>>   *        [      ...           ]         |
>>   * sp (r1) --->    [    stack pointer    ] --------------
>>   *        [    tail_call_info    ] 8
>> - *        [   nv gpr save area    ] 6*8 + (12*8)
>> + *        [   nv gpr save area    ] 6*8
>> + *        [ addl. nv gpr save area] (12*8) <--- exception boundary/ 
>> callback program
>>   *        [    local_tmp_var    ] 24
>>   *        [   unused red zone    ] 224
>>   *
>>   * Additional (12*8) in 'nv gpr save area' only in case of
>> - * exception boundary.
>> + * exception boundary/callback.
>>   */
>>  static int bpf_jit_stack_local(struct codegen_context *ctx)
>>  {
>> @@ -240,10 +242,6 @@ void bpf_jit_build_prologue(u32 *image, struct
>> codegen_context *ctx)
>>
>>      if (bpf_has_stack_frame(ctx) && !ctx->exception_cb) {
>>          /*
>> -         * exception_cb uses boundary frame after stack walk.
>> -         * It can simply use redzone, this optimization reduces
>> -         * stack walk loop by one level.
>> -         *
>>           * We need a stack frame, but we don't necessarily need to
>>           * save/restore LR unless we call other functions
>>           */
>> @@ -287,6 +285,22 @@ void bpf_jit_build_prologue(u32 *image, struct
>> codegen_context *ctx)
>>           * program(main prog) as third arg
>>           */
>>          EMIT(PPC_RAW_MR(_R1, _R5));
>> +        /*
>> +         * Exception callback reuses the stack frame of exception 
>> boundary.
>> +         * But BPF stack depth of exception callback and exception 
>> boundary
>> +         * don't have to be same. If BPF stack depth is different, 
>> adjust the
>> +         * stack frame size considering BPF stack depth of exception 
>> callback.
>> +         * The non-volatile register save area remains unchanged. 
>> These non-
>> +         * volatile registers are restored in exception callback's 
>> epilogue.
>> +         */
>> +        EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R5, 0));
>> +        EMIT(PPC_RAW_SUB(bpf_to_ppc(TMP_REG_2), 
>> bpf_to_ppc(TMP_REG_1), _R1));
>> +        EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_2), bpf_to_ppc(TMP_REG_2),
>> +            -BPF_PPC_EXC_STACKFRAME));
>> +        EMIT(PPC_RAW_CMPLDI(bpf_to_ppc(TMP_REG_2), ctx->stack_size));
>> +        PPC_BCC_CONST_SHORT(COND_EQ, 12);
> Can we avoid resizing when boundary_stack is greater? I think it's safe, 
> NVR will be intact anyway and any reference within bounds of larger size.
> Any corner case possible?

Did think about it but went with this approach to keep the tearing down
of the stack consistent for all cases. Addressed the other comments
and posted v3.

- Hari

