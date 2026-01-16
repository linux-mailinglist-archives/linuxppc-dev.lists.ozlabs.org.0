Return-Path: <linuxppc-dev+bounces-15880-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 251A2D2D75E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 08:49:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dssS05MyXz2xSN;
	Fri, 16 Jan 2026 18:49:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768549744;
	cv=none; b=n0s0TLFN0zDFb3aKit+NG+opgsh+Aw3JhbbpJ/otzkek59r/gxtV8tayWZiLN3539M1Hc9ZzZz9C/gD60GyREmTYil4MNM5OAcjiKYztmXZr7JsDyozpCNENcmP2aFMsuiKKd13Z5drPD6rYXWQD71OSImiWoRloacu0G4kj81hMqM0laO9W5xoEcMKCx3Elfj57mxPRx6tWAmSG+SMA1V1cfiMRzdiO4xduRxNsxCe+b3YKSsupZAEfKlzzPnbhNsdd89LzxBE7fI59ch8sG0fQ94EJIgC/4gW5PGzDWDxvzwHjXBrAr+ZkZ4FHTsA3BvWx4TLz7/aMLQ0vVzx6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768549744; c=relaxed/relaxed;
	bh=qeMS7wF/8+L/ImLqFPZRpd4gSsr4wBBTyBXOKDC+1+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7EIQQCvjDl5BJiuC7SAfmkNkGzf/NH2dUR3fgRDeAZnfpFWZhEbJ22G6E2ee3LO+atIwCmsC/gwFCkyvXyZoqikqlp1S9eoLrzpSfoGDnmDCDHWzJ5amCuAQMa6abHtv1Llm8kb/Abn9YIchNmnE01RLVZvcv+PPJydfnyE42Arw5WWBlyH4hn1rfKc5Ik7+RykEpZ6TvCCHXWebHsZ3qViqt0O6atyr7UB4xyKuj/uL3L05mb9i7q94FToqPD171ytdg6FnzMRStMqg8KNxLkWfux63LllWFyIcXLo8KehO2oIpC2WbwPwQ2vYmTrxA3HCww/4No72o31rc1GlaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=maITxhbR; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=maITxhbR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dssRz2rKlz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 18:49:02 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60FMm1V8032354;
	Fri, 16 Jan 2026 07:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=qeMS7w
	F/8+L/ImLqFPZRpd4gSsr4wBBTyBXOKDC+1+0=; b=maITxhbRDA+KJuWkZHK8hE
	ythr5Kvz1unIc+r5NByQNf2yyBA6tco+E44QvS9CMfunSG81JRqG8ZlX9V2Rv+u7
	0IGs4iRuX5uGIb0aN7jniB6Otq5DvkQuqiAtibYs4MrS5EshZebjMv9g0mexfRr2
	V5kKH6HJKYGgloDYmVTT69yVQfJpeV/ZWzzKZBPos+afqpcMK4S/mztb/JX8Tbt2
	Fey/YDwg+X+OPUd7HL2RL+y23mYCyVUjCUwzdnBg5/WlekRT736JQ8B7HB8OVpqc
	aRtJ8/B4JLrrsvKrSGnXp8fEL1J2fGm6kcPeX+GevehL2MvmWRIKN+hUeNWJhz2A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bq9bmhhda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 07:48:19 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60G7imAq015536;
	Fri, 16 Jan 2026 07:48:19 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bq9bmhhd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 07:48:18 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60G7glgs002565;
	Fri, 16 Jan 2026 07:48:17 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm13t50mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 07:48:17 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60G7mDgD54984998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jan 2026 07:48:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7C2720040;
	Fri, 16 Jan 2026 07:48:13 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30AB02004E;
	Fri, 16 Jan 2026 07:48:08 +0000 (GMT)
Received: from [9.43.69.239] (unknown [9.43.69.239])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jan 2026 07:48:07 +0000 (GMT)
Message-ID: <493cebef-4df6-4cf8-898b-483a10889359@linux.ibm.com>
Date: Fri, 16 Jan 2026 13:18:07 +0530
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
Subject: Re: [PATCH v2 5/6] powerpc64/bpf: Support exceptions
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
References: <20260114114450.30405-1-adubey@linux.ibm.com>
 <20260114114450.30405-6-adubey@linux.ibm.com>
 <70242dc7-0f3e-4b8d-ad11-e24d9e4dfbb3@linux.ibm.com>
 <77a6a07add66189fbc9b68a410911e3c@imap.linux.ibm.com>
 <cf1aea1601d03d42b3afde367c29d26b@imap.linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <cf1aea1601d03d42b3afde367c29d26b@imap.linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _NWV7wnYPza___l0_N_W2Hd5blTmq7Z_
X-Proofpoint-ORIG-GUID: a0U7x-XwLWlSywnPqZwgCeS1SC5znx4Y
X-Authority-Analysis: v=2.4 cv=TrvrRTXh c=1 sm=1 tr=0 ts=6969ed43 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=DU0EyFXtAAAA:8 a=VnNF1IyMAAAA:8 a=Hr_YKmzSsgGm0unBTDUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UCR5be5CC-YrbG9FbbB0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1OCBTYWx0ZWRfX0YDoeL/wfm0W
 De/cThvMzBGYaBEFi74xGca9imp+dSsXxq92Ugh5m0xmpDuPmbZGMrICHrsmHsbJlzfhW6Q9DGz
 hf0gQzEpig5/bAZjr57hDzqre24Cj6FHQ0DMkZYAQ/Aqn//KbTK/HMbDUwpkws9gC3oZUPo9tFn
 0l41SGo1z+I3Ef8bdqH6o0azTnvc3KGXiX+TZEpbCm6ctvIdE04wedAIteMvFc+S/qU00Gb5sMV
 W0K+KmZBuuqtb2BFLA90gw6FY0I5vgVwCd+w+4cpo6KM9MDKHhRbSm99CfuuRpHh1nfPngJXvSt
 kFBhlEfHgMcdapmbfiZQo65/9Yo4MtCqmgbADXdx6T0thHZNum3LZKdQmA49anCpDEIx7ZT/JJ8
 G/GpaEMU/RM1nrYr4an1L7gktpMTVspHI7kqt8IUpEwwfuilwOzfk4/wZJHcH/KaWUxi+vjoyVp
 8zQY7RWaXfy6oFkAnMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601160058
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 16/01/26 12:17 pm, adubey wrote:
> On 2026-01-16 12:14, adubey wrote:
>> On 2026-01-16 11:57, Hari Bathini wrote:
>>> On 14/01/26 5:14 pm, adubey@linux.ibm.com wrote:
>>>> From: Abhishek Dubey <adubey@linux.ibm.com>
>>>>
>>>> The modified prologue/epilogue generation code now
>>>> enables exception-callback to use the stack frame of
>>>> the program marked as exception boundary, where callee
>>>> saved registers are stored.
>>>>
>>>> As per ppc64 ABIv2 documentation[1], r14-r31 are callee
>>>> saved registers. BPF programs on ppc64 already saves
>>>> r26-r31 registers. Saving the remaining set of callee
>>>> saved registers(r14-r25) is handled in the next patch.
>>>>
>>>> [1] https://ftp.rtems.org/pub/rtems/people/sebh/ 
>>>> ABI64BitOpenPOWERv1.1_16July2015_pub.pdf
>>>>
>>>> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
>>>> ---
>>>>   arch/powerpc/net/bpf_jit.h        |  2 ++
>>>>   arch/powerpc/net/bpf_jit_comp.c   |  7 ++++
>>>>   arch/powerpc/net/bpf_jit_comp64.c | 53 ++++++++++++++++++++ 
>>>> +----------
>>>>   3 files changed, 45 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
>>>> index 5d735bc5e6bd..fb548ae5d143 100644
>>>> --- a/arch/powerpc/net/bpf_jit.h
>>>> +++ b/arch/powerpc/net/bpf_jit.h
>>>> @@ -179,6 +179,8 @@ struct codegen_context {
>>>>       u64 arena_vm_start;
>>>>       u64 user_vm_start;
>>>>       bool is_subprog;
>>>> +    bool exception_boundary;
>>>> +    bool exception_cb;
>>>>   };
>>>>     #define bpf_to_ppc(r)    (ctx->b2p[r])
>>>> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/ 
>>>> bpf_jit_comp.c
>>>> index e3088cf089d1..26991940d36e 100644
>>>> --- a/arch/powerpc/net/bpf_jit_comp.c
>>>> +++ b/arch/powerpc/net/bpf_jit_comp.c
>>>> @@ -207,6 +207,8 @@ struct bpf_prog *bpf_int_jit_compile(struct 
>>>> bpf_prog *fp)
>>>>       cgctx.arena_vm_start = bpf_arena_get_kern_vm_start(fp->aux- 
>>>> >arena);
>>>>       cgctx.user_vm_start = bpf_arena_get_user_vm_start(fp->aux- 
>>>> >arena);
>>>>       cgctx.is_subprog = bpf_is_subprog(fp);
>>>> +    cgctx.exception_boundary = fp->aux->exception_boundary;
>>>> +    cgctx.exception_cb = fp->aux->exception_cb;
>>>>         /* Scouting faux-generate pass 0 */
>>>>       if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, 
>>>> false)) {
>>>> @@ -436,6 +438,11 @@ void bpf_jit_free(struct bpf_prog *fp)
>>>>       bpf_prog_unlock_free(fp);
>>>>   }
>>>>   +bool bpf_jit_supports_exceptions(void)
>>>> +{
>>>> +    return IS_ENABLED(CONFIG_PPC64);
>>>> +}
>>>> +
>>>>   bool bpf_jit_supports_subprog_tailcalls(void)
>>>>   {
>>>>       return IS_ENABLED(CONFIG_PPC64);
>>>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/ 
>>>> bpf_jit_comp64.c
>>>> index ec58395f74f7..a6083dd9786c 100644
>>>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>>>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
>>>> @@ -89,7 +89,9 @@ static inline bool bpf_has_stack_frame(struct 
>>>> codegen_context *ctx)
>>>>        * - the bpf program uses its stack area
>>>>        * The latter condition is deduced from the usage of BPF_REG_FP
>>>>        */
>>>> -    return ctx->seen & SEEN_FUNC || bpf_is_seen_register(ctx, 
>>>> bpf_to_ppc(BPF_REG_FP));
>>>> +    return ctx->seen & SEEN_FUNC ||
>>>> +           bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)) ||
>>>> +           ctx->exception_cb;
>>>>   }
>>>>     /*
>>>> @@ -190,23 +192,32 @@ void bpf_jit_build_prologue(u32 *image, struct 
>>>> codegen_context *ctx)
>>>>           EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_STACKFRAME + ctx- 
>>>> >stack_size)));
>>>>       }
>>>>   -    /*
>>>> -     * Back up non-volatile regs -- BPF registers 6-10
>>>> -     * If we haven't created our own stack frame, we save these
>>>> -     * in the protected zone below the previous stack frame
>>>> -     */
>>>> -    for (i = BPF_REG_6; i <= BPF_REG_10; i++)
>>>> -        if (bpf_is_seen_register(ctx, bpf_to_ppc(i)))
>>>> -            EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1, 
>>>> bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
>>>> +    if (!ctx->exception_cb) {
>>>> +        /*
>>>> +         * Back up non-volatile regs -- BPF registers 6-10
>>>> +         * If we haven't created our own stack frame, we save these
>>>> +         * in the protected zone below the previous stack frame
>>>> +         */
>>>> +        for (i = BPF_REG_6; i <= BPF_REG_10; i++)
>>>> +            if (ctx->exception_boundary || 
>>>> bpf_is_seen_register(ctx, bpf_to_ppc(i)))
>>>> +                EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1,
>>>> +                    bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
>>>>   -    if (ctx->arena_vm_start)
>>>> -        EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
>>>> +        if (ctx->exception_boundary || ctx->arena_vm_start)
>>>> +            EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
>>>>                    bpf_jit_stack_offsetof(ctx, 
>>>> bpf_to_ppc(ARENA_VM_START))));
>>>>   -    /* Setup frame pointer to point to the bpf stack area */
>>>> -    if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
>>>> -        EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
>>>> +        /* Setup frame pointer to point to the bpf stack area */
>>>> +        if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
>>>> +            EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
>>>>                   STACK_FRAME_MIN_SIZE + ctx->stack_size));
>>>> +    } else {
>>>> +        /*
>>>> +         * Exception callback receives Frame Pointer of main
>>>> +         * program as third arg
>>>> +         */
>>>> +        EMIT(PPC_RAW_MR(_R1, _R5));
>>>> +    }
>>>>         if (ctx->arena_vm_start)
>>>>           PPC_LI64(bpf_to_ppc(ARENA_VM_START), ctx->arena_vm_start);
>>>> @@ -218,17 +229,25 @@ static void bpf_jit_emit_common_epilogue(u32 
>>>> *image, struct codegen_context *ctx
>>>>         /* Restore NVRs */
>>>>       for (i = BPF_REG_6; i <= BPF_REG_10; i++)
>>>> -        if (bpf_is_seen_register(ctx, bpf_to_ppc(i)))
>>>> +        if (ctx->exception_cb || bpf_is_seen_register(ctx, 
>>>> bpf_to_ppc(i)))
>>>>               EMIT(PPC_RAW_LD(bpf_to_ppc(i), _R1, 
>>>> bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
>>>>   -    if (ctx->arena_vm_start)
>>>> +    if (ctx->exception_cb || ctx->arena_vm_start)
>>>>           EMIT(PPC_RAW_LD(bpf_to_ppc(ARENA_VM_START), _R1,
>>>>                   bpf_jit_stack_offsetof(ctx, 
>>>> bpf_to_ppc(ARENA_VM_START))));
>>>>
>>>
>>>> +    if (ctx->exception_cb) {
>>>> +        /*
>>>> +         * LR value from boundary-frame is received as second 
>>>> parameter
>>>> +         * in exception callback.
>>>> +         */
>>>> +        EMIT(PPC_RAW_MTLR(_R4));
>>>> +    }
>>>> +
>>>
>>> No. Both second and third parameter of exception_cb() are stack pointer
>>> (or frame pointer, if you prefer that) and not LR.
>>> The above hunk is wrong. It still worked because of mtlr
>>> instruction below that restored LR from PPC_LR_STKOFF offset
>>> on the stack. Please drop the above hunk.
>> Okay, but from patch 3/6:
> My mistake, its patch 4/6.

Please note the consume_fn() is not exception_cb(). It is
bpf_stack_walker() that helps with the stack walk to be precise.
You can find the exception_cb() call in bpf_throw() kfunc as:

   ctx.aux->bpf_exception_cb(cookie, ctx.sp, ctx.bp, 0, 0);

>>
>> ip = frame[STACK_FRAME_LR_SAVE];
>> ...
>> if (ip && !consume_fn(cookie, ip, fp, fp))
>> we send cookie as first, LR as second parameter and fp as third & 
>> fourth both.
>> Default callback expects 4 parameter, so we copy fp in both.
>>
>>>
>>>>       /* Tear down our stack frame */
>>>>       if (bpf_has_stack_frame(ctx)) {
>>>>           EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_PPC_STACKFRAME + ctx- 
>>>> >stack_size));
>>>> -        if (ctx->seen & SEEN_FUNC) {
>>>> +        if (ctx->seen & SEEN_FUNC || ctx->exception_cb) {
>>>>               EMIT(PPC_RAW_LD(_R0, _R1, PPC_LR_STKOFF));
>>>>               EMIT(PPC_RAW_MTLR(_R0));
>>>>           }
>>>
- Hari

