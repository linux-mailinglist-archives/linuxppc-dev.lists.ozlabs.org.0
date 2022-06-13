Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 159F7549D2C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 21:15:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMLqz5yY5z3cd8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 05:15:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N0fBQdPQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N0fBQdPQ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMLqH3BRWz2xKf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 05:14:51 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DIBgdg023961;
	Mon, 13 Jun 2022 19:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ls7hd+XsHv8BUHiz4wFrCEkMIN38kXf7jaQJpopJQjQ=;
 b=N0fBQdPQDhTLXKVt7SQx19ipa+iLl8qKEl8wyEkmIOBGMJYHl8q1kqgeItFHqi+C3Zky
 icG0dvGsbdMnzomVttqhDLG2aZMvxxrJSIe4J+piqTl3mWQvYehYGAJ9MwfmK/keEBtx
 gtpWtxRxzfsEfSKOB7ee3n43UUQl9i8KWCfSl4DyriuZrrI3yq6ysKbogaaQA8larYnn
 UN0cq3lRGXjwJ2b/Mg3Fid5bZtaPoBK3yARfn34WGmmWXPyn1hjJe3fFBrUqDJ1Digz/
 ZFJrAOuoCGdabU39BxovTg305fUJT2lHSPJvzUwuBkTRzZJnwz9CHDsU2OA7h2ZAqTS3 Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gn548f81v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jun 2022 19:14:33 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25DITrx2013267;
	Mon, 13 Jun 2022 19:14:32 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gn548f81j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jun 2022 19:14:32 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25DJ6jS7016448;
	Mon, 13 Jun 2022 19:14:30 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3gmjp93755-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jun 2022 19:14:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25DJE0gr22544838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jun 2022 19:14:00 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50F864203F;
	Mon, 13 Jun 2022 19:14:28 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD91442041;
	Mon, 13 Jun 2022 19:14:21 +0000 (GMT)
Received: from [9.211.149.2] (unknown [9.211.149.2])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jun 2022 19:14:21 +0000 (GMT)
Message-ID: <bb492bb1-e9e4-76fb-4c5f-2a0a2537d544@linux.ibm.com>
Date: Tue, 14 Jun 2022 00:44:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 5/5] bpf ppc32: Add instructions for atomic_[cmp]xchg
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20220610155552.25892-1-hbathini@linux.ibm.com>
 <20220610155552.25892-6-hbathini@linux.ibm.com>
 <f09b59ee-c965-a140-4d03-723830cba66d@csgroup.eu>
 <3d5f05d1-448f-58a6-20b0-3e9f0b13df03@linux.ibm.com>
In-Reply-To: <3d5f05d1-448f-58a6-20b0-3e9f0b13df03@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: y9lQOP89xwxtFv61towgbUmNMLgXmGSX
X-Proofpoint-ORIG-GUID: aXS0-Ueam8uFMPt3nPVeURCJpAjQQoa0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_08,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130080
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Paul Mackerras <paulus@samba.org>, Jordan Niethe <jniethe5@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 14/06/22 12:41 am, Hari Bathini wrote:
> 
> 
> On 11/06/22 11:04 pm, Christophe Leroy wrote:
>>
>>
>> Le 10/06/2022 à 17:55, Hari Bathini a écrit :
>>> This adds two atomic opcodes BPF_XCHG and BPF_CMPXCHG on ppc32, both
>>> of which include the BPF_FETCH flag.  The kernel's atomic_cmpxchg
>>> operation fundamentally has 3 operands, but we only have two register
>>> fields. Therefore the operand we compare against (the kernel's API
>>> calls it 'old') is hard-coded to be BPF_REG_R0. Also, kernel's
>>> atomic_cmpxchg returns the previous value at dst_reg + off. JIT the
>>> same for BPF too with return value put in BPF_REG_0.
>>>
>>>     BPF_REG_R0 = atomic_cmpxchg(dst_reg + off, BPF_REG_R0, src_reg);
>>>
>>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>>> ---
>>>
>>> Changes in v2:
>>> * Moved variable declaration to avoid late declaration error on
>>>     some compilers.
>>> * Tried to make code readable and compact.
>>>
>>>
>>>    arch/powerpc/net/bpf_jit_comp32.c | 25 ++++++++++++++++++++++---
>>>    1 file changed, 22 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/powerpc/net/bpf_jit_comp32.c 
>>> b/arch/powerpc/net/bpf_jit_comp32.c
>>> index 28dc6a1a8f2f..43f1c76d48ce 100644
>>> --- a/arch/powerpc/net/bpf_jit_comp32.c
>>> +++ b/arch/powerpc/net/bpf_jit_comp32.c
>>> @@ -297,6 +297,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 
>>> *image, struct codegen_context *
>>>            u32 ax_reg = bpf_to_ppc(BPF_REG_AX);
>>>            u32 tmp_reg = bpf_to_ppc(TMP_REG);
>>>            u32 size = BPF_SIZE(code);
>>> +        u32 save_reg, ret_reg;
>>>            s16 off = insn[i].off;
>>>            s32 imm = insn[i].imm;
>>>            bool func_addr_fixed;
>>> @@ -799,6 +800,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 
>>> *image, struct codegen_context *
>>>             * BPF_STX ATOMIC (atomic ops)
>>>             */
>>>            case BPF_STX | BPF_ATOMIC | BPF_W:
>>> +            save_reg = _R0;
>>> +            ret_reg = src_reg;
>>> +
>>>                bpf_set_seen_register(ctx, tmp_reg);
>>>                bpf_set_seen_register(ctx, ax_reg);
>>> @@ -829,6 +833,21 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 
>>> *image, struct codegen_context *
>>>                case BPF_XOR | BPF_FETCH:
>>>                    EMIT(PPC_RAW_XOR(_R0, _R0, src_reg));
>>>                    break;
>>> +            case BPF_CMPXCHG:
>>> +                /*
>>> +                 * Return old value in BPF_REG_0 for BPF_CMPXCHG &
>>> +                 * in src_reg for other cases.
>>> +                 */
>>> +                ret_reg = bpf_to_ppc(BPF_REG_0);
>>> +
>>> +                /* Compare with old value in BPF_REG_0 */
>>> +                EMIT(PPC_RAW_CMPW(bpf_to_ppc(BPF_REG_0), _R0));
>>> +                /* Don't set if different from old value */
>>> +                PPC_BCC_SHORT(COND_NE, (ctx->idx + 3) * 4);
>>> +                fallthrough;
>>> +            case BPF_XCHG:
>>> +                save_reg = src_reg;
>>
>> I'm a bit lost, when save_reg is src_reg, don't we expect the upper part
>> (ie src_reg - 1) to be explicitely zeroised ?
>>
> 
> For BPF_FETCH variants, old value is returned in src_reg (ret_reg).
> In all such cases, higher 32-bit is zero'ed. But in case of BPF_CMPXCHG,
> src_reg is untouched as BPF_REG_0 is used instead. So, higher 32-bit
> remains untouched for that case alone..
> 
> 
>>> +                break;
>>>                default:
>>>                    pr_err_ratelimited("eBPF filter atomic op code 
>>> %02x (@%d) unsupported\n",
>>>                               code, i);
>>> @@ -836,15 +855,15 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 
>>> *image, struct codegen_context *
>>>                }
>>>                /* store new value */
>>> -            EMIT(PPC_RAW_STWCX(_R0, tmp_reg, dst_reg));
>>> +            EMIT(PPC_RAW_STWCX(save_reg, tmp_reg, dst_reg));
>>>                /* we're done if this succeeded */
>>>                PPC_BCC_SHORT(COND_NE, tmp_idx);

> 
>>>                /* For the BPF_FETCH variant, get old data into 
>>> src_reg */
> 
> With this commit, this comment is not true for BPF_CMPXCHG. So, this
> comment should not be removed..

Sorry, the above should read:
   "should be removed" instead of "should not be removed"..
