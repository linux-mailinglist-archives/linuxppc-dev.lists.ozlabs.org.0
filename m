Return-Path: <linuxppc-dev+bounces-10648-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F6FB1B2FC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 14:00:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxBnx6gLjz3bkT;
	Tue,  5 Aug 2025 22:00:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754395237;
	cv=none; b=aQtvXzGWG/o1qc8+IBXQww4rbbaWTbNH0LsS/iEDS6FiKdvgiVyNEUrCB698GIgf0eFdxA5GCAEkUGqBeRoJ8pvQn4XollB3/EG5EXKUEoTseShbroemLj/5gocPJy3F5ew3HNZYiPwsTHqUIsoafIQimvIG4nUIH6damKEnvp4P4ykHcKLXFb7F6ST3SSPFDiq58p9PWllrBWzHFiSZKgoRVxAmxi3WW4JbH7HPAhwFClgQyKk9xf/hnjhhmtpbsAkU01l0kk2e13/RnzmuB61ExuWOeMuVVviKUTFz1laBIiY1fbdwauOVsrwYswM6OIpefwJhhzv6QFNqozSosQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754395237; c=relaxed/relaxed;
	bh=gDxUPJqKGqjr8rlHOZKNB+EVcQ3fCKRGkCpMd7qiHs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7lwNUIQQcTkWY/LNrwR6nlsC0avOVQDbSQXqnMs995K2rgbgNvxS3JuUzCSdDR3wZxP/VPr5uQb9a1fcgdkDxnwgoMtDyvQkcsIQVb9FBIKo8eA0wR9CERxBgopQBvi2PRwq+hGoLgZ28jei5If+JZkL+v1+mb8dzJbr/Wi7j20hds+ww1T1riTUfDCsYKw0tq6rph4XPivRA2zNuTl540fw3P7DKeX9D/ZJ0nT9pCt8p6i1ABOUS/oL7XajKOEXd3bZSL3zNtN1hzoovMPM6KhvfMICtrUU35HYsn94jz4PfzI6dT4rZc8SDY18JaQpIFSRWBwslAfq3pnAgNYRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MtdzQSM2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MtdzQSM2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxBnw4Jrtz3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 22:00:35 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5757T01F005960;
	Tue, 5 Aug 2025 11:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gDxUPJ
	qKGqjr8rlHOZKNB+EVcQ3fCKRGkCpMd7qiHs4=; b=MtdzQSM2trJ7mAFiZz2Gc3
	OoqUWe1o/kprh3BGhMZ4a43IVzGQEWIOIlSEmA780gfd1YqVQsChmCk2a3LgxxGl
	a4qtTUfTpwOgb7M1XBui7vxg3xW3UpRnnPfcpudaBxzSDoaosrCcxW8q9Ej8jUrN
	e31xy6WfPRJmp2oJ+Wj5LAEgtLHf5YBwMPyFkqescKqxEKDX3YRF+95rQDWQ4VJh
	v9xTaDSH4t3FEnhhynQeM5iX4pDyVDZTZXF41PS02oJvc8/SHZTALCQYVAqAzyIV
	ZIwGQpY5vOTqKqhpPlwYKCWewBT3gep+ukUQP5DkWQ5n4At0UOgcB5c3+HOpJatA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 489ab3p606-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 11:59:59 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 575BoKXX002111;
	Tue, 5 Aug 2025 11:59:58 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 489ab3p603-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 11:59:58 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5758uXBw009971;
	Tue, 5 Aug 2025 11:59:58 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 489x0p27ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Aug 2025 11:59:58 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 575Bxu9U12124836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Aug 2025 11:59:56 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF76558061;
	Tue,  5 Aug 2025 11:59:56 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0274F58057;
	Tue,  5 Aug 2025 11:59:49 +0000 (GMT)
Received: from [9.61.255.245] (unknown [9.61.255.245])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Aug 2025 11:59:48 +0000 (GMT)
Message-ID: <8cfa1cb2-57bf-4984-a64e-53c82440e87f@linux.ibm.com>
Date: Tue, 5 Aug 2025 17:29:47 +0530
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
Subject: Re: [bpf-next 1/6] bpf,powerpc: Introduce
 bpf_jit_emit_probe_mem_store() to emit store instructions
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>, bpf@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        naveen@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, memxor@gmail.com, iii@linux.ibm.com,
        shuah@kernel.org
References: <20250805062747.3479221-1-skb99@linux.ibm.com>
 <20250805062747.3479221-2-skb99@linux.ibm.com>
 <e65548d0-14aa-4b9c-8051-7c91c5dffd1f@csgroup.eu>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <e65548d0-14aa-4b9c-8051-7c91c5dffd1f@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Z+jsHGRA c=1 sm=1 tr=0 ts=6891f23f cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=Oh2cFVv5AAAA:8
 a=VnNF1IyMAAAA:8 a=7K6N0i7FaoFpiFnlUvQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-ORIG-GUID: ou2P2lE5vzwaHKjkyE6NV709Xb4msYv1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA4NiBTYWx0ZWRfX1CnmoYQjwmFj
 zmfX82cU1YVSukbVR2EeOTPfk411IxX96NzsnBsnJG9jUh1nt5uK31dJ4ysc0SKdRhzMO4aunzs
 KYeFfKTQBa1lWi6BGhx6lQlnlemviSAnz39whxxnzeJ5u+RisNyx3uefUekSalD+DDm5LdVd6Eg
 t+VCdkNpxbQJ0JyVwtBaxmqS7b3bbelWxJB3noTrTFWU2PzZMFECXiCWUXHosmI8a4q9MgpVGnZ
 AB/W1u0WfIBV+EpjvKGBLwzZBAZdIEwL6D+bUUtWSeEI2m/Y0bd/JKgAxADq8VvB31couGvWW51
 hJlQZ9YrlRbT3CMYigc7/vPlcGx/HQxjEIzwj+yBkcPyIl01uFEochApb36mjIgNjfmq1rtV67o
 O5HzA7oaNxdonnQlfuUbA3oWT+7qhcrkPAdV8y+FgFzh2Kddy4vpNLBw5ileSLqPFlg8jm/X
X-Proofpoint-GUID: noiSPkXud0KeF4qGBUGl8bOA2EH1cmrK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050086
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 05/08/25 1:04 pm, Christophe Leroy wrote:
>
>
> Le 05/08/2025 à 08:27, Saket Kumar Bhaskar a écrit :
>> bpf_jit_emit_probe_mem_store() is introduced to emit instructions for
>> storing memory values depending on the size (byte, halfword,
>> word, doubleword).
>
> Build break with this patch
>
>   CC      arch/powerpc/net/bpf_jit_comp64.o
> arch/powerpc/net/bpf_jit_comp64.c:395:12: error: 
> 'bpf_jit_emit_probe_mem_store' defined but not used 
> [-Werror=unused-function]
>  static int bpf_jit_emit_probe_mem_store(struct codegen_context *ctx, 
> u32 src_reg, s16 off,
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:287: 
> arch/powerpc/net/bpf_jit_comp64.o] Error 1
>
I tried this on top of bpf-next, and for me build passed.

Note: I applied 
https://lore.kernel.org/bpf/20250717202935.29018-2-puranjay@kernel.org/ 
before applying current patch.

gcc version 14.2.1 20250110

uname -r: 6.16.0-gf2844c7fdb07

bpf-next repo: 
https://kernel.googlesource.com/pub/scm/linux/kernel/git/bpf/bpf-next

HEAD:

commit f3af62b6cee8af9f07012051874af2d2a451f0e5 (origin/master, origin/HEAD)
Author: Tao Chen <chen.dylane@linux.dev>
Date:   Wed Jul 23 22:44:42 2025 +0800

     bpftool: Add bash completion for token argument


Build Success logs:

   TEST-OBJ [test_progs-cpuv4] xdp_vlan.test.o
   TEST-OBJ [test_progs-cpuv4] xdpwall.test.o
   TEST-OBJ [test_progs-cpuv4] xfrm_info.test.o
   BINARY   bench
   BINARY   test_maps
   BINARY   test_progs
   BINARY   test_progs-no_alu32
   BINARY   test_progs-cpuv4


Regards,

Venkat.

>
>>
>> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
>> ---
>>   arch/powerpc/net/bpf_jit_comp64.c | 30 ++++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c 
>> b/arch/powerpc/net/bpf_jit_comp64.c
>> index 025524378443..489de21fe3d6 100644
>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
>> @@ -409,6 +409,36 @@ asm (
>>   "        blr                ;"
>>   );
>>   +static int bpf_jit_emit_probe_mem_store(struct codegen_context 
>> *ctx, u32 src_reg, s16 off,
>> +                    u32 code, u32 *image)
>> +{
>> +    u32 tmp1_reg = bpf_to_ppc(TMP_REG_1);
>> +    u32 tmp2_reg = bpf_to_ppc(TMP_REG_2);
>> +
>> +    switch (BPF_SIZE(code)) {
>> +    case BPF_B:
>> +        EMIT(PPC_RAW_STB(src_reg, tmp1_reg, off));
>> +        break;
>> +    case BPF_H:
>> +        EMIT(PPC_RAW_STH(src_reg, tmp1_reg, off));
>> +        break;
>> +    case BPF_W:
>> +        EMIT(PPC_RAW_STW(src_reg, tmp1_reg, off));
>> +        break;
>> +    case BPF_DW:
>> +        if (off % 4) {
>> +            EMIT(PPC_RAW_LI(tmp2_reg, off));
>> +            EMIT(PPC_RAW_STDX(src_reg, tmp1_reg, tmp2_reg));
>> +        } else {
>> +            EMIT(PPC_RAW_STD(src_reg, tmp1_reg, off));
>> +        }
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +    return 0;
>> +}
>> +
>>   static int emit_atomic_ld_st(const struct bpf_insn insn, struct 
>> codegen_context *ctx, u32 *image)
>>   {
>>       u32 code = insn.code;
>

