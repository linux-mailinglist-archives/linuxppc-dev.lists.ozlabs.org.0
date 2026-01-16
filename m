Return-Path: <linuxppc-dev+bounces-15876-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD61D2B9DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 05:51:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsnWX3v4Qz2xSN;
	Fri, 16 Jan 2026 15:51:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768539112;
	cv=none; b=ZwUMydWXlldXXpfbh47QB2jEyfb7GHhVfxDzC1WZDGctTGpbHDS2aXxrAOrx/p8TyJ7rOFT1R+pH7BppZNQwfynX6Xk0BsAM7STo0WKVsWp9nI7nLbx90YE3cRaUHlJJogbjctONGfMb8VwTYHxBgKgYeCI6iyp+X8C8eScPGvs4q9HfBgpWReXvvpqckki/600ZBo5ZZ6p0/4vH+z7MKTZ0hMrZtLJSzNWfAlTiJW7mLXZHB07EDg53ZIm5emsSWagWdxRqOZQBQYbcY7Ki0ysOnCafCBV6YhOEdLMnnORNc/nKve4wj/Jkde24mIgQSAajRwoOP105mZHLZH/LgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768539112; c=relaxed/relaxed;
	bh=0uK4L3bV6NbtcBfGaSQys6UAirTXMSjVohFC5GErS84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i+fsdBRMlPRkd18jQyDMozsHPye3YD7Y+X1YEhrUfRz8QgeMPJ5fpXRbZxEAHZgcZpWHzw4JuBgoYuI1FcJSFCN4GmxPVccNtOZVZOSQFNwEMu327otjPkAHxExcliphdH/FFCK9N6sB0PBsDuh/0TtkaqCz2uewxldzEkCWYxNWYaYCCzR14XWBipiQ9plBqPTnEjpaEc6fZlrb1m89OjuaCh3gqPtKs+xpYg8HAmla95LGecIhPbHZj7/NH8hHA/A0IH2mWeIwLNHyGbzsLsZbkXJUyjPeVUAGzY7aDZJ7Tsl3nOVOUaigsRL0Dz5XC8Rki7Ft99U7iXH4yzz+5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yfu6VLrh; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yfu6VLrh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsnWW0jHDz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 15:51:50 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60FMsdK0012338;
	Fri, 16 Jan 2026 04:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0uK4L3
	bV6NbtcBfGaSQys6UAirTXMSjVohFC5GErS84=; b=Yfu6VLrhfHMwF0crq8e2Pi
	19D3X3bWRrr5qgSp6b7tqVtRwZIX2r/ntPIiEsQ5VWAhXX/HUQK30uzKCXCzGCpp
	gSitqRWhD1yHUd1xzdsWVJOGUK8B8JKZpdNsQgzfmrTVLH3si/itCyIdqMRVAe4w
	FY7sV6UHWwSN+bW1ggpO46JooJO1D8GDbo7nrNqPNhN1bYVIUQoSRqG/OgP0Dxer
	ftx64ruHxG4T6+TVsEJlZ6aya7JVj6EGEcwffICu19lKd9LacN5se9kfomFXSQ5B
	kDTk2KCdCKDv+xdcXEyOL9RGuz/wRouHuHP5nf8//XIVJ/GanXCc8lfRn77lxRww
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bq9emrwbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 04:50:15 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60G4oFoA004242;
	Fri, 16 Jan 2026 04:50:15 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bq9emrwbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 04:50:15 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60G4mcAj025848;
	Fri, 16 Jan 2026 04:50:14 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bm2kkv5s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 04:50:14 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60G4o90615335774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jan 2026 04:50:09 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA7C020049;
	Fri, 16 Jan 2026 04:50:09 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1756E2004B;
	Fri, 16 Jan 2026 04:50:04 +0000 (GMT)
Received: from [9.43.87.191] (unknown [9.43.87.191])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jan 2026 04:50:03 +0000 (GMT)
Message-ID: <78536979-e924-4be3-b847-332802ad82e2@linux.ibm.com>
Date: Fri, 16 Jan 2026 10:20:03 +0530
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
Subject: Re: [PATCH v2 2/6] powerpc64/bpf: Support tailcalls with subprogs
To: adubey <adubey@imap.linux.ibm.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: adubey@linux.ibm.com, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        sachinpb@linux.ibm.com, venkat88@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        naveen@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, memxor@gmail.com, iii@linux.ibm.com,
        shuah@kernel.org
References: <20260114114450.30405-1-adubey@linux.ibm.com>
 <20260114114450.30405-3-adubey@linux.ibm.com>
 <42d41a0d-9d26-4eeb-af46-200083261c09@kernel.org>
 <2d242f4476b61373da236d24272b0ec3@imap.linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <2d242f4476b61373da236d24272b0ec3@imap.linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=KvJAGGWN c=1 sm=1 tr=0 ts=6969c387 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=eFhwI4I6t5nqxJZgoi0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAzNiBTYWx0ZWRfXyNdY8OH3qwUa
 Wmk7O8yMAMG8zqZGrEAud86lfcmCIdlTWHPORgz1UlWreq1+B8ky/C6AtG2ilL5jsb512ceChDu
 oNPllOX8c5Io11WvNlBhe6wJ3ltMKlFDCXw8BIoapfnThaX4RNlgaao+y9I/tKDmfPAUcd3zSPY
 qsYyw40OcDk4ElXF/jZNlDqtm4ISWJIXCfKtNljSCIh0k+9zMCq6XuzkSh2aj/90jIjAgwkaWx8
 52gtXrJ0JczAouJRR+aYyjZeNIV3DKlTfMxbKBqRMjGb8POPv2s2JY4oGJEh2+Rl9v55MbD3IXb
 k5KiQ+8uM0pPuceWQ66TEpZ/+vlZXOUWF+kOWS4pdrGmVH5RbnpSc61VAmntQ42P59lk5JFgPIO
 URI25/COZB38Y0bOf3rSCsl/7cgAIoCv4jEQVjUUyThNR6IeDtleIDAHLuADcDNjq4BanT2wFHW
 /UbwKOc6tm19zJDQe8Q==
X-Proofpoint-GUID: AQXGaDG4Cy44T-ozuMiMUs-pFjS042QU
X-Proofpoint-ORIG-GUID: MBurlCyVuJKrV5vthp7Xdb_Z1jqQF_L8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1011 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601160036
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 14/01/26 6:33 pm, adubey wrote:
> On 2026-01-14 17:57, Christophe Leroy (CS GROUP) wrote:
>> Le 14/01/2026 à 12:44, adubey@linux.ibm.com a écrit :
>>> From: Abhishek Dubey <adubey@linux.ibm.com>
>>>
>>> Enabling tailcalls with subprog combinations by referencing
>>> method. The actual tailcall count is always maintained in the
>>> tail_call_info variable present in the frame of main function
>>> (also called entry function). The tail_call_info variables in
>>> the frames of all other subprog contains reference to the
>>> tail_call_info present in frame of main function.
>>>
>>> Dynamic resolution interprets the tail_call_info either as
>>> value or reference depending on the context of active frame
>>> while tailcall is invoked.
>>>
>>> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
>>> ---
>>>   arch/powerpc/net/bpf_jit.h        | 12 +++++-
>>>   arch/powerpc/net/bpf_jit_comp.c   | 10 ++++-
>>>   arch/powerpc/net/bpf_jit_comp64.c | 68 +++++++++++++++++++++++--------
>>>   3 files changed, 70 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
>>> index 45d419c0ee73..5d735bc5e6bd 100644
>>> --- a/arch/powerpc/net/bpf_jit.h
>>> +++ b/arch/powerpc/net/bpf_jit.h
>>> @@ -51,6 +51,12 @@
>>>           EMIT(PPC_INST_BRANCH_COND | (((cond) & 0x3ff) << 16) | 
>>> (offset & 0xfffc));                    \
>>>       } while (0)
>>>   +/* Same as PPC_BCC_SHORT, except valid dest is known prior to 
>>> call. */
>>> +#define PPC_COND_BRANCH(cond, dest)         \
>>> +    do {                                      \
>>> +        long offset = (long)(dest) - CTX_NIA(ctx);              \
>>> +        EMIT(PPC_INST_BRANCH_COND | (((cond) & 0x3ff) << 16) | 
>>> (offset & 0xfffc));    \
>>> +    } while (0)
>>
>> I don't like the idea of duplicating PPC_BCC_SHORT() to just kick the
>> verification out. Now we will have two macros doing the exact same
>> thing with one handling failure case and one ignoring failure case.
>> There is a big risk that one day or another someone will use the wrong
>> macro.
>>
>> Could you change bpf_jit_build_prologue() to return an int add use
>> PPC_BCC_SHORT() instead of that new PPC_COND_BRANCH() ?
> I implemented exactly same change in bpf_jit_build_prologue(). But, 
> during internal review, @HariBathini suggested
> to have separate macro with a caution note.
> 
> @Hari please suggest here!

Not just about the change of return type but the check seems like an
overkill for cases where the offset is known and within branch range.
How about using BUILD_BUG_ON() to avoid unecessary checks and
return type change for places where the branch offset is known
and is a constant?

>>
>>>   /*
>>>    * Sign-extended 32-bit immediate load
>>>    *
>>> @@ -75,6 +81,8 @@
>>>     /* for tailcall counter */
>>>   #define BPF_PPC_TAILCALL        8
>>> +/* for gpr non volatile registers BPG_REG_6 to 10 */
>>> +#define BPF_PPC_STACK_SAVE      (6*8)
>>
>> Add spaces before and after the *
>>
>>>     /* If dummy pass (!image), account for maximum possible 
>>> instructions */
>>>   #define PPC_LI64(d, i)        do {                          \
>>> @@ -170,6 +178,7 @@ struct codegen_context {
>>>       unsigned int alt_exit_addr;
>>>       u64 arena_vm_start;
>>>       u64 user_vm_start;
>>> +    bool is_subprog;
>>>   };
>>>     #define bpf_to_ppc(r)    (ctx->b2p[r])
>>> @@ -204,11 +213,10 @@ void bpf_jit_build_epilogue(u32 *image, struct 
>>> codegen_context *ctx);
>>>   void bpf_jit_build_fentry_stubs(u32 *image, struct codegen_context 
>>> *ctx);
>>>   void bpf_jit_realloc_regs(struct codegen_context *ctx);
>>>   int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, 
>>> int tmp_reg, long exit_addr);
>>> -
>>>   int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 
>>> *fimage, int pass,
>>>                 struct codegen_context *ctx, int insn_idx,
>>>                 int jmp_off, int dst_reg, u32 code);
>>> -
>>
>> Not sure why this patch needs to remove those blank lines here and above.
>>
>>> +int bpf_jit_stack_tailcallinfo_offset(struct codegen_context *ctx);
>>>   #endif
>>>     #endif
>>> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/ 
>>> bpf_jit_comp.c
>>> index 5e976730b2f5..069a8822c30d 100644
>>> --- a/arch/powerpc/net/bpf_jit_comp.c
>>> +++ b/arch/powerpc/net/bpf_jit_comp.c
>>> @@ -206,6 +206,7 @@ struct bpf_prog *bpf_int_jit_compile(struct 
>>> bpf_prog *fp)
>>>       cgctx.stack_size = round_up(fp->aux->stack_depth, 16);
>>>       cgctx.arena_vm_start = bpf_arena_get_kern_vm_start(fp->aux- 
>>> >arena);
>>>       cgctx.user_vm_start = bpf_arena_get_user_vm_start(fp->aux->arena);
>>> +    cgctx.is_subprog = bpf_is_subprog(fp);
>>>         /* Scouting faux-generate pass 0 */
>>>       if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
>>> @@ -435,6 +436,11 @@ void bpf_jit_free(struct bpf_prog *fp)
>>>       bpf_prog_unlock_free(fp);
>>>   }
>>>   +bool bpf_jit_supports_subprog_tailcalls(void)
>>> +{
>>> +    return IS_ENABLED(CONFIG_PPC64);
>>> +}
>>> +
>>>   bool bpf_jit_supports_kfunc_call(void)
>>>   {
>>>       return true;
>>> @@ -604,7 +610,7 @@ static void 
>>> bpf_trampoline_setup_tail_call_cnt(u32 *image, struct codegen_contex
>>>                              int func_frame_offset, int r4_off)
>>>   {
>>>       if (IS_ENABLED(CONFIG_PPC64)) {
>>> -        /* See bpf_jit_stack_tailcallcnt() */
>>> +        /* See bpf_jit_stack_tailcallinfo_offset() */
>>>           int tailcallcnt_offset = 7 * 8;
>>>             EMIT(PPC_RAW_LL(_R3, _R1, func_frame_offset - 
>>> tailcallcnt_offset));
>>> @@ -619,7 +625,7 @@ static void 
>>> bpf_trampoline_restore_tail_call_cnt(u32 *image, struct codegen_cont
>>>                            int func_frame_offset, int r4_off)
>>>   {
>>>       if (IS_ENABLED(CONFIG_PPC64)) {
>>> -        /* See bpf_jit_stack_tailcallcnt() */
>>> +        /* See bpf_jit_stack_tailcallinfo_offset() */
>>>           int tailcallcnt_offset = 7 * 8;
>>>             EMIT(PPC_RAW_LL(_R3, _R1, -tailcallcnt_offset));
>>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/ 
>>> bpf_jit_comp64.c
>>> index 39061cd742c1..cebf81fbd59f 100644
>>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
>>> @@ -26,8 +26,12 @@
>>>    * Ensure the top half (upto local_tmp_var) stays consistent
>>>    * with our redzone usage.
>>>    *
>>> + * tail_call_info - stores tailcall count value in main program's
>>> + *                  frame, stores reference to tail_call_info of
>>> + *                  main's frame in sub-prog's frame.
>>> + *
>>>    *        [    prev sp        ] <-------------
>>> - *        [    tail_call_cnt    ] 8        |
>>> + *        [    tail_call_info    ] 8        |
>>>    *        [   nv gpr save area    ] 6*8        |
>>>    *        [    local_tmp_var    ] 24        |
>>>    * fp (r31) -->    [   ebpf stack space    ] upto 512    |
>>> @@ -35,8 +39,6 @@
>>>    * sp (r1) --->    [    stack pointer    ] --------------
>>>    */
>>>   -/* for gpr non volatile registers BPG_REG_6 to 10 */
>>> -#define BPF_PPC_STACK_SAVE    (6*8)
>>>   /* for bpf JIT code internal usage */
>>>   #define BPF_PPC_STACK_LOCALS    24
>>>   /* stack frame excluding BPF stack, ensure this is quadword aligned */
>>> @@ -98,7 +100,7 @@ static inline bool bpf_has_stack_frame(struct 
>>> codegen_context *ctx)
>>>    *        [    prev sp        ] <-------------
>>>    *        [      ...           ]         |
>>>    * sp (r1) --->    [    stack pointer    ] --------------
>>> - *        [    tail_call_cnt    ] 8
>>> + *        [    tail_call_info    ] 8
>>>    *        [   nv gpr save area    ] 6*8
>>>    *        [    local_tmp_var    ] 24
>>>    *        [   unused red zone    ] 224
>>> @@ -114,7 +116,7 @@ static int bpf_jit_stack_local(struct 
>>> codegen_context *ctx)
>>>       }
>>>   }
>>>   -static int bpf_jit_stack_tailcallcnt(struct codegen_context *ctx)
>>> +int bpf_jit_stack_tailcallinfo_offset(struct codegen_context *ctx)
>>>   {
>>>       return bpf_jit_stack_local(ctx) + BPF_PPC_STACK_LOCALS + 
>>> BPF_PPC_STACK_SAVE;
>>>   }
>>> @@ -147,17 +149,32 @@ void bpf_jit_build_prologue(u32 *image, struct 
>>> codegen_context *ctx)
>>>   #endif
>>>         /*
>>> -     * Initialize tail_call_cnt if we do tail calls.
>>> -     * Otherwise, put in NOPs so that it can be skipped when we are
>>> -     * invoked through a tail call.
>>> +     * Tail call count(tcc) is saved & updated only in main
>>> +     * program's frame and the address of tcc in main program's
>>> +     * frame (tcc_ptr) is saved in subprogs frame.
>>> +     *
>>> +     * Offset of tail_call_info on any frame will be interpreted
>>> +     * as either tcc_ptr or tcc value depending on whether it is
>>> +     * greater than MAX_TAIL_CALL_CNT or not.
>>>        */
>>> -    if (ctx->seen & SEEN_TAILCALL) {
>>> +    if (!ctx->is_subprog) {
>>>           EMIT(PPC_RAW_LI(bpf_to_ppc(TMP_REG_1), 0));
>>>           /* this goes in the redzone */
>>>           EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, - 
>>> (BPF_PPC_TAILCALL)));
>>>       } else {
>>> -        EMIT(PPC_RAW_NOP());
>>> -        EMIT(PPC_RAW_NOP());
>>> +        /*
>>> +         * if tail_call_info < MAX_TAIL_CALL_CNT
>>> +         *     main prog calling first subprog -> copy reference
>>> +         * else
>>> +         *     subsequent subprog calling another subprog -> 
>>> directly copy content
>>> +         */
>>> +        EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_2), _R1, 0));
>>> +        EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), 
>>> bpf_to_ppc(TMP_REG_2), -(BPF_PPC_TAILCALL)));
>>> +        EMIT(PPC_RAW_CMPLWI(bpf_to_ppc(TMP_REG_1), MAX_TAIL_CALL_CNT));
>>> +        PPC_COND_BRANCH(COND_GT, CTX_NIA(ctx) + 8);
>>> +        EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_2),
>>> +                            -(BPF_PPC_TAILCALL)));
>>> +        EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, - 
>>> (BPF_PPC_TAILCALL)));
>>>       }
>>>         if (bpf_has_stack_frame(ctx)) {
>>> @@ -352,19 +369,38 @@ static int bpf_jit_emit_tail_call(u32 *image, 
>>> struct codegen_context *ctx, u32 o
>>>       EMIT(PPC_RAW_CMPLW(b2p_index, bpf_to_ppc(TMP_REG_1)));
>>>       PPC_BCC_SHORT(COND_GE, out);
>>>   +    EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R1, 
>>> bpf_jit_stack_tailcallinfo_offset(ctx)));
>>> +    EMIT(PPC_RAW_CMPLWI(bpf_to_ppc(TMP_REG_1), MAX_TAIL_CALL_CNT));
>>> +    PPC_COND_BRANCH(COND_LE, CTX_NIA(ctx) + 8);
>>> +
>>> +    /* dereference TMP_REG_1 */
>>> +    EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), 0));
>>> +
>>>       /*
>>> -     * if (tail_call_cnt >= MAX_TAIL_CALL_CNT)
>>> +     * if (tail_call_info == MAX_TAIL_CALL_CNT)
>>>        *   goto out;
>>>        */
>>> -    EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R1, 
>>> bpf_jit_stack_tailcallcnt(ctx)));
>>>       EMIT(PPC_RAW_CMPLWI(bpf_to_ppc(TMP_REG_1), MAX_TAIL_CALL_CNT));
>>> -    PPC_BCC_SHORT(COND_GE, out);
>>> +    PPC_COND_BRANCH(COND_EQ, out);
>>>         /*
>>> -     * tail_call_cnt++;
>>> +     * tail_call_info++; <- Actual value of tcc here
>>>        */
>>>       EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), 
>>> 1));
>>> -    EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, 
>>> bpf_jit_stack_tailcallcnt(ctx)));
>>> +
>>> +    /*
>>> +     * Before writing updated tail_call_info, distinguish if current 
>>> frame
>>> +     * is storing a reference to tail_call_info or actual tcc value in
>>> +     * tail_call_info.
>>> +     */
>>> +    EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_2), _R1, 
>>> bpf_jit_stack_tailcallinfo_offset(ctx)));
>>> +    EMIT(PPC_RAW_CMPLWI(bpf_to_ppc(TMP_REG_2), MAX_TAIL_CALL_CNT));
>>> +    PPC_COND_BRANCH(COND_GT, CTX_NIA(ctx) + 8);
>>> +
>>> +    /* First get address of tail_call_info */
>>> +    EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_2), _R1, 
>>> bpf_jit_stack_tailcallinfo_offset(ctx)));
>>> +    /* Writeback updated value to tail_call_info */
>>> +    EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_2), 0));
>>>         /* prog = array->ptrs[index]; */
>>>       EMIT(PPC_RAW_MULI(bpf_to_ppc(TMP_REG_1), b2p_index, 8));
> -Abhishek


