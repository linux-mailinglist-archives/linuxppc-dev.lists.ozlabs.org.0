Return-Path: <linuxppc-dev+bounces-16249-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCN1GMnTc2kCywAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16249-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 21:02:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D987A728
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 21:02:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyTNj5W2Mz2xdY;
	Sat, 24 Jan 2026 07:02:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769198533;
	cv=none; b=f4u6KfLo22uUhB09KIAGmhYGD+I4F/mW2d86Q5xLf79O5u+ha4cTx87+b6CXXyn/XDeowWqt6BE5ChXFUQ4jgPiTAtF59rIUn6LU+AlbdX1FpId9++JSnpSmzoyXgjxujF578apwM0stHDQWhYaDvrc7k3LQnGIasvCQTQAiU1MNMwq3/RuQXO3GEJePW46Kzut1S/UFtOev/euVis/IesnN30Dv/UtGohJD3SXngeRX8uFnWARQFsHLpqOwwyVBcCd7bKDtcm5LHXBpCBPYs2d7XIidBgpacB145v5Cw4qaWTBy6KvtGiW3zweH8F5b5p3owfD4KvQO8S02F/IzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769198533; c=relaxed/relaxed;
	bh=fOIOBLg4MYGWqHiBMPJ4Clc4Tb1gOD4SbOr28RKnm/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z1P8DMK3CqV0q8igkWi98j/u5cWjZmoNGiXZCHo0IRzsrjcOzuxjEIUc/+Ed01hpx7N3N87JVT1+/oeeHmIHydlrZzWjqOTihUF//sIf65ri2rl8HouSYgHT3wHvoS1ocNGeOdpLujoskvGnARV0fcJoQJlZbBGmXoifjpzFWupzBoKQM0x7SGyDISaYTOp1NSZSlmrI3SVKXWxoBvJdN5y5Fyw1nFYZp/eOak5AvTu33aBurcn3bEMD8O24H0knKRR8TeqZycyzrN0rQBHCCOP0Xyoqls9hqXA5Tb91EdrhW46IjBpeCy5T0E35/30Wb8RE9zkPGYqj0pLOeWHKew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EranB1qt; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EranB1qt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyTNh2JKhz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 07:02:11 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60NDE5ZY006262;
	Fri, 23 Jan 2026 18:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fOIOBL
	g4MYGWqHiBMPJ4Clc4Tb1gOD4SbOr28RKnm/I=; b=EranB1qtErwu+/xtayJwI7
	mCQ2ALYPdXTGbvfP8tJM2oLw2dI66/iYLU69tmS/2c+WLEmDzfGdVf3XXClZ5Mm8
	6mbsf03ezvcsz1vmKpTONV0VjULQiHBf+HY6pTjhjC+VkwJOznUY3RcJ73uaNOM2
	HqO17wSpLlJuwKnQNVnUxa5KSJsS8LKZmxjgfTnDMKUjFJ99RWeF/kniNIGWPNS5
	n6JzFyqwfL6gZSWJny1o9JnRpFQ25c9LmbjPaX2tsW/3WBtJNfdahumsPf0sORIc
	Dm2NmsFCpaA1EN1EybXzCHm51kjDR+4gErVA0YOU5ofSKkAijL/57Fiw3hjNSSlQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br23shq49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 18:13:47 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60NI4uGf001299;
	Fri, 23 Jan 2026 18:13:47 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br23shq45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 18:13:47 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60NI1NPL001162;
	Fri, 23 Jan 2026 18:13:46 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brpykadux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 18:13:46 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60NIDgV243712846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jan 2026 18:13:42 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 108F620043;
	Fri, 23 Jan 2026 18:13:42 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78B9020040;
	Fri, 23 Jan 2026 18:13:36 +0000 (GMT)
Received: from [9.43.50.125] (unknown [9.43.50.125])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Jan 2026 18:13:36 +0000 (GMT)
Message-ID: <ef0c9d64-1742-4ae9-af4e-868287328c06@linux.ibm.com>
Date: Fri, 23 Jan 2026 23:43:35 +0530
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
Subject: Re: [PATCH v4 5/6] powerpc64/bpf: Support exceptions
To: adubey <adubey@imap.linux.ibm.com>
Cc: adubey@linux.ibm.com, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        sachinpb@linux.ibm.com, venkat88@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org
References: <20260122211854.5508-1-adubey@linux.ibm.com>
 <20260122211854.5508-6-adubey@linux.ibm.com>
 <b805a1c1-58fc-4d76-b26c-542c1285ba4a@linux.ibm.com>
 <9f35f6799b0b27866259582a2eefecb3@imap.linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <9f35f6799b0b27866259582a2eefecb3@imap.linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IvIBoCe_iNsiTEEfrBenIHWgFPPUYPRM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEzNSBTYWx0ZWRfX2B9SmrLNKkDT
 5fsdYMV08tEiboG+/KQB9io9BuVI1B55a5y62fbSPFc23HxnKmfNLs1x9JW4Utt8x0ZOAX4eoxP
 9jRUblPl6MP98QwJ/qXaCGoWhvNF0TpQY2p4hBe4/I/Y2h4NfctYov1egqaZO47n0SI8bU5bnJR
 G+CHVqVbbIFgnjaR0lwouoS4dBqju46ybRHqs6tF6JESrQb80KsrFhfDAK5XfdyOEiLGV0HPG5U
 d21+t9aAMn4Jp7lm/flvYiuHepZkbZzaIqpxNfW8fjJwLS8WLFIBK2nulE9EwFv0z9DiaL0uSYa
 wSQiQcRKOQk8bARWsSwR1cm4RfvTPWEVtNgskDY4+xmsr17x+GtEqKKPw42EGH9u+1hBvFXMVGQ
 fQJWRWE1Y2B0M8l1ceJ6v+16J5mB0JMPoT+qtVu4xSjBuvQ0fTyIjeyIS3RHxFplBzCkSXBDcd+
 97j3/tXkbSveOGI2xMQ==
X-Authority-Analysis: v=2.4 cv=J9SnLQnS c=1 sm=1 tr=0 ts=6973ba5b cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=DU0EyFXtAAAA:8 a=VnNF1IyMAAAA:8 a=lR2fIWztgbcTg5UndXMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UCR5be5CC-YrbG9FbbB0:22
X-Proofpoint-ORIG-GUID: dtidgtl6CeJ3wLKyS6s7l0VwpT0jTY6s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601230135
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16249-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:adubey@imap.linux.ibm.com,m:adubey@linux.ibm.com,m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.ibm.com,vger.kernel.org,lists.ozlabs.org,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-0.030];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 61D987A728
X-Rspamd-Action: no action



On 23/01/26 7:23 pm, adubey wrote:
> On 2026-01-23 18:24, Hari Bathini wrote:
>> On 23/01/26 2:48 am, adubey@linux.ibm.com wrote:
>>> From: Abhishek Dubey <adubey@linux.ibm.com>
>>>
>>> The modified prologue/epilogue generation code now
>>> enables exception-callback to use the stack frame of
>>> the program marked as exception boundary, where callee
>>> saved registers are stored.
>>>
>>> As per ppc64 ABIv2 documentation[1], r14-r31 are callee
>>> saved registers. BPF programs on ppc64 already saves
>>> r26-r31 registers. Saving the remaining set of callee
>>> saved registers(r14-r25) is handled in the next patch.
>>>
>>> [1] https://ftp.rtems.org/pub/rtems/people/sebh/ 
>>> ABI64BitOpenPOWERv1.1_16July2015_pub.pdf
>>>
>>> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
>>> ---
>>>   arch/powerpc/net/bpf_jit.h        |  2 ++
>>>   arch/powerpc/net/bpf_jit_comp.c   |  7 ++++
>>>   arch/powerpc/net/bpf_jit_comp64.c | 58 +++++++++++++++++++++----------
>>>   3 files changed, 48 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
>>> index 56f56fdd4969..82bbf63f0e57 100644
>>> --- a/arch/powerpc/net/bpf_jit.h
>>> +++ b/arch/powerpc/net/bpf_jit.h
>>> @@ -179,6 +179,8 @@ struct codegen_context {
>>>       u64 arena_vm_start;
>>>       u64 user_vm_start;
>>>       bool is_subprog;
>>> +    bool exception_boundary;
>>> +    bool exception_cb;
>>>   };
>>>     #define bpf_to_ppc(r)    (ctx->b2p[r])
>>> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/ 
>>> bpf_jit_comp.c
>>> index 1a305f0fed27..2607ea0bedef 100644
>>> --- a/arch/powerpc/net/bpf_jit_comp.c
>>> +++ b/arch/powerpc/net/bpf_jit_comp.c
>>> @@ -207,6 +207,8 @@ struct bpf_prog *bpf_int_jit_compile(struct 
>>> bpf_prog *fp)
>>>       cgctx.arena_vm_start = bpf_arena_get_kern_vm_start(fp->aux- 
>>> >arena);
>>>       cgctx.user_vm_start = bpf_arena_get_user_vm_start(fp->aux->arena);
>>>       cgctx.is_subprog = bpf_is_subprog(fp);
>>> +    cgctx.exception_boundary = fp->aux->exception_boundary;
>>> +    cgctx.exception_cb = fp->aux->exception_cb;
>>>         /* Scouting faux-generate pass 0 */
>>>       if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
>>> @@ -436,6 +438,11 @@ void bpf_jit_free(struct bpf_prog *fp)
>>>       bpf_prog_unlock_free(fp);
>>>   }
>>>   +bool bpf_jit_supports_exceptions(void)
>>> +{
>>> +    return IS_ENABLED(CONFIG_PPC64);
>>> +}
>>> +
>>>   bool bpf_jit_supports_subprog_tailcalls(void)
>>>   {
>>>       return IS_ENABLED(CONFIG_PPC64);
>>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/ 
>>> bpf_jit_comp64.c
>>> index c25ba1ad587a..d7cd8ab6559c 100644
>>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
>>> @@ -89,7 +89,9 @@ static inline bool bpf_has_stack_frame(struct 
>>> codegen_context *ctx)
>>>        * - the bpf program uses its stack area
>>>        * The latter condition is deduced from the usage of BPF_REG_FP
>>>        */
>>> -    return ctx->seen & SEEN_FUNC || bpf_is_seen_register(ctx, 
>>> bpf_to_ppc(BPF_REG_FP));
>>> +    return ctx->seen & SEEN_FUNC ||
>>> +           bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)) ||
>>> +           ctx->exception_cb;
>>>   }
>>>     /*
>>
>>
>>> @@ -161,8 +163,13 @@ void bpf_jit_build_prologue(u32 *image, struct 
>>> codegen_context *ctx)
>>
>>
>>
>>>           EMIT(PPC_RAW_LI(bpf_to_ppc(TMP_REG_1), 0));
>>>           /* this goes in the redzone */
>>>           EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, - 
>>> (BPF_PPC_TAILCALL)));
>>> -    } else {
>>> +    } else if (!ctx->exception_cb) {
>>>           /*
>>> +         * Tailcall jitting for non exception_cb progs only.
>>> +         * exception_cb won't require tail_call_info to be setup.
>>> +         *
>>> +         * tail_call_info interpretation logic:
>>> +         *
>>>            * if tail_call_info < MAX_TAIL_CALL_CNT
>>>            *      main prog calling first subprog -> copy reference
>>>            * else
>>> @@ -177,8 +184,12 @@ void bpf_jit_build_prologue(u32 *image, struct 
>>> codegen_context *ctx)
>>>           EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, - 
>>> (BPF_PPC_TAILCALL)));
>>>       }
>>>   -    if (bpf_has_stack_frame(ctx)) {
>>> +    if (bpf_has_stack_frame(ctx) && !ctx->exception_cb) {
>>>           /*
>>> +         * exception_cb uses boundary frame after stack walk.
>>> +         * It can simply use redzone, this optimization reduces
>>> +         * stack walk loop by one level.
>>> +         *
>>>            * We need a stack frame, but we don't necessarily need to
>>>            * save/restore LR unless we call other functions
>>>            */
>>> @@ -190,23 +201,32 @@ void bpf_jit_build_prologue(u32 *image, struct 
>>> codegen_context *ctx)
>>>           EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_STACKFRAME + ctx- 
>>> >stack_size)));
>>>       }
>>>   -    /*
>>> -     * Back up non-volatile regs -- BPF registers 6-10
>>> -     * If we haven't created our own stack frame, we save these
>>> -     * in the protected zone below the previous stack frame
>>> -     */
>>> -    for (i = BPF_REG_6; i <= BPF_REG_10; i++)
>>> -        if (bpf_is_seen_register(ctx, bpf_to_ppc(i)))
>>> -            EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1, 
>>> bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
>>> +    if (!ctx->exception_cb) {
>>> +        /*
>>> +         * Back up non-volatile regs -- BPF registers 6-10
>>> +         * If we haven't created our own stack frame, we save these
>>> +         * in the protected zone below the previous stack frame
>>> +         */
>>> +        for (i = BPF_REG_6; i <= BPF_REG_10; i++)
>>> +            if (ctx->exception_boundary || bpf_is_seen_register(ctx, 
>>> bpf_to_ppc(i)))
>>> +                EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1,
>>> +                    bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
>>>   -    if (ctx->arena_vm_start)
>>> -        EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
>>> +        if (ctx->exception_boundary || ctx->arena_vm_start)
>>> +            EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
>>>                    bpf_jit_stack_offsetof(ctx, 
>>> bpf_to_ppc(ARENA_VM_START))));
>>>   -    /* Setup frame pointer to point to the bpf stack area */
>>> -    if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
>>> -        EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
>>> +        /* Setup frame pointer to point to the bpf stack area */
>>> +        if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
>>> +            EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
>>>                   STACK_FRAME_MIN_SIZE + ctx->stack_size));
>>> +    } else {
>>> +        /*
>>> +         * Exception callback receives Frame Pointer of main
>>> +         * program as third arg
>>> +         */
>>> +        EMIT(PPC_RAW_MR(_R1, _R5));
>>> +    }
>>>         if (ctx->arena_vm_start)
>>>           PPC_LI64(bpf_to_ppc(ARENA_VM_START), ctx->arena_vm_start);
>>
>> For all practical purposes, the only thing that matters for the prologue
>> of execption_cb subprog seems to be, to set r1 and move on. The below
>> snippet before tailcall setup in the prologue should live the rest of
>> the prologue code unchanged?
>>
>> if (ctx->exception_cb) {
>>     /*
>>      * Exception callback receives Frame Pointer of main
>>
>>      * program as third arg
>>
>>      */
>>     EMIT(PPC_RAW_MR(_R1, _R5));
>>     return;
>> }
> This approach could work, but it may be fragile. If future changes to the
> callback logic start accessing fields from the active boundary frame, this
> could lead to incorrect memory access or corruption. Other archs have 
> kept it.
> Shall we keep it?

True. In fact, exception_cb isn't seem to be restricted from using
the BPF stack or arena...

So, the "Setup frame pointer to point to the bpf stack area" part
may also have to come out of that !exception_cb condition..

- Hari

