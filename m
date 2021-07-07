Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3293BE1DC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 06:07:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKQqs6xX3z3bW1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 14:07:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eIto6F8W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=eIto6F8W; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKQqP5DxRz300S
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 14:07:13 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16744259002258; Wed, 7 Jul 2021 00:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=GFeJKiJWa7bQJv3rBT5hH61E7T3/C9ZSWX5cnfGt7fY=;
 b=eIto6F8W2FoYX25iQ0G1IR3ztldnrTJuYRdA7kRRABPUjOEdttC3WGyYAtW3gLElVBNs
 8nWLgsBieM35Ue8VyqwUk4KG3fvr8Rtew65LNYIpIg1PV3zYdAd+d8uwb31h631o3/m9
 6B0r9ivFFUkBSfoUJAoR1FHaBH2FvcwGcnNDB1OIy6Wii7DzZiBoUUsFcC67OHU/lHo5
 wGtRIDX5duZAaab9CElORMZFKHtecTCO2gb3YOsHBtR5AhCbQdeJMzGhf7YWxWSNC78e
 N0oVYtg0LGy/fNcsOUovttemxLjGCpZrNJHZNIDxoObEyGGfOSB7udtTEZJeY7nzhos5 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39mc15n29e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 00:06:46 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 167446qY002647;
 Wed, 7 Jul 2021 00:06:46 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39mc15n28r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 00:06:46 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16742s95009581;
 Wed, 7 Jul 2021 04:06:44 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 39jfh8sh1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 04:06:44 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16746f7V20054332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Jul 2021 04:06:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 177BCAE064;
 Wed,  7 Jul 2021 04:06:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EABD0AE055;
 Wed,  7 Jul 2021 04:06:34 +0000 (GMT)
Received: from [9.199.33.242] (unknown [9.199.33.242])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  7 Jul 2021 04:06:34 +0000 (GMT)
Subject: Re: [PATCH 4/4] bpf powerpc: Add addr > TASK_SIZE_MAX explicit check
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20210706073211.349889-1-ravi.bangoria@linux.ibm.com>
 <20210706073211.349889-5-ravi.bangoria@linux.ibm.com>
 <74f55f12-c7da-a06d-c3a5-6869b907e3f6@csgroup.eu>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <8c4fb89e-626e-fd0d-5703-e3916924785a@linux.ibm.com>
Date: Wed, 7 Jul 2021 09:36:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <74f55f12-c7da-a06d-c3a5-6869b907e3f6@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PwGFivFaXsb3nk0x2dNo-AfGBlnVCkyB
X-Proofpoint-GUID: pEoMI7pagvFrmIKaTZwYxAqfCIUbkP6E
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-07_01:2021-07-06,
 2021-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 mlxscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070020
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, songliubraving@fb.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, ast@kernel.org,
 andrii@kernel.org, paulus@samba.org, sandipan@linux.ibm.com,
 netdev@vger.kernel.org, naveen.n.rao@linux.ibm.com, yhs@fb.com,
 bpf@vger.kernel.org, kpsingh@kernel.org, linuxppc-dev@lists.ozlabs.org,
 kafai@fb.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>> @@ -763,6 +771,14 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>>           /* dst = *(u16 *)(ul) (src + off) */
>>           case BPF_LDX | BPF_MEM | BPF_H:
>>           case BPF_LDX | BPF_PROBE_MEM | BPF_H:
>> +            if (BPF_MODE(code) == BPF_PROBE_MEM) {
>> +                EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], src_reg, off));
>> +                PPC_LI64(b2p[TMP_REG_2], TASK_SIZE_MAX);
>> +                EMIT(PPC_RAW_CMPLD(b2p[TMP_REG_1], b2p[TMP_REG_2]));
>> +                PPC_BCC(COND_GT, (ctx->idx + 4) * 4);
>> +                EMIT(PPC_RAW_XOR(dst_reg, dst_reg, dst_reg));
>> +                PPC_JMP((ctx->idx + 2) * 4);
>> +            }
> 
> That code seems strictly identical to the previous one and the next one.
> Can you refactor in a function ?

I'll check this.

> 
>>               EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
>>               if (insn_is_zext(&insn[i + 1]))
>>                   addrs[++i] = ctx->idx * 4;
>> @@ -773,6 +789,14 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>>           /* dst = *(u32 *)(ul) (src + off) */
>>           case BPF_LDX | BPF_MEM | BPF_W:
>>           case BPF_LDX | BPF_PROBE_MEM | BPF_W:
>> +            if (BPF_MODE(code) == BPF_PROBE_MEM) {
>> +                EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], src_reg, off));
>> +                PPC_LI64(b2p[TMP_REG_2], TASK_SIZE_MAX);
>> +                EMIT(PPC_RAW_CMPLD(b2p[TMP_REG_1], b2p[TMP_REG_2]));
>> +                PPC_BCC(COND_GT, (ctx->idx + 4) * 4);
>> +                EMIT(PPC_RAW_XOR(dst_reg, dst_reg, dst_reg));
>> +                PPC_JMP((ctx->idx + 2) * 4);
>> +            }
>>               EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
>>               if (insn_is_zext(&insn[i + 1]))
>>                   addrs[++i] = ctx->idx * 4;
>> @@ -783,6 +807,20 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>>           /* dst = *(u64 *)(ul) (src + off) */
>>           case BPF_LDX | BPF_MEM | BPF_DW:
>>           case BPF_LDX | BPF_PROBE_MEM | BPF_DW:
>> +            if (BPF_MODE(code) == BPF_PROBE_MEM) {
>> +                EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], src_reg, off));
>> +                PPC_LI64(b2p[TMP_REG_2], TASK_SIZE_MAX);
>> +                EMIT(PPC_RAW_CMPLD(b2p[TMP_REG_1], b2p[TMP_REG_2]));
>> +                if (off % 4)
> 
> That test is worth a comment.

(off % 4) test is based on how PPC_BPF_LL() emits instruction.

> 
> And I'd prefer
> 
>      if (off & 3) {
>          PPC_BCC(COND_GT, (ctx->idx + 5) * 4);
>          EMIT(PPC_RAW_XOR(dst_reg, dst_reg, dst_reg));
>          PPC_JMP((ctx->idx + 3) * 4);
>      } else {
>          PPC_BCC(COND_GT, (ctx->idx + 4) * 4);
>          EMIT(PPC_RAW_XOR(dst_reg, dst_reg, dst_reg));
>          PPC_JMP((ctx->idx + 2) * 4);
>      }

Yes this is neat.

Thanks for the review,
Ravi
