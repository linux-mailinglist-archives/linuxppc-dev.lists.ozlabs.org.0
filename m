Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B0B788DE6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 19:40:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UWaa5e+x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXS006Yhqz3c8L
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 03:40:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UWaa5e+x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXRz44c3fz2yZX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 03:39:28 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37PHWYbt002761;
	Fri, 25 Aug 2023 17:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=g8MhWPKLj0S4lkswJCRMQ2FnmOw9T+RHQlH5BsetzjA=;
 b=UWaa5e+xoiNRHV8SUDEt7RRDAzplk5a4HM07KDUoW9XURLgGejvEt+b3Oq8mgFcRxfvi
 kEu+H4RRfidYioZOpJtu0Q4JXtqgZoVTgDZpwY/9x5gS1cW1xKkGV2oKDQXOo8A4jnBR
 exdkjEmjAiI1vao4QaVdgbAZ21Y8s7QWr5OGS3acJFSDIdzS9uahkHJ71p6XUtbzA8ZI
 hW6locEhANphRF5oF6e/WnyOpmS/MMmXr0GdCRqGRQ7mgRkg3MQ1K8qA6h8RuPq3CCj8
 BbT7lmIluItrEcRRUOiiBJMIUw6By+rb0INE117GhB0AxZjXpEM2/KrQ1YTEfU4jmyLN Nw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sq0smg63j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 17:37:50 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37PHYP3n004093;
	Fri, 25 Aug 2023 17:37:50 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sn21s1akx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 17:37:49 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37PHbmqR59244946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Aug 2023 17:37:48 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 03C3F20040;
	Fri, 25 Aug 2023 17:37:48 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53DA120043;
	Fri, 25 Aug 2023 17:37:46 +0000 (GMT)
Received: from [9.43.126.199] (unknown [9.43.126.199])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Aug 2023 17:37:46 +0000 (GMT)
Message-ID: <7387569d-e4a6-b507-1949-ce835b1d4da5@linux.ibm.com>
Date: Fri, 25 Aug 2023 23:07:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/5] powerpc/bpf: implement bpf_arch_text_invalidate
 for bpf_prog_pack
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>
References: <20230825151810.164418-1-hbathini@linux.ibm.com>
 <20230825151810.164418-3-hbathini@linux.ibm.com>
 <7df92b0b-d260-addf-fc78-27690d72310f@csgroup.eu>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <7df92b0b-d260-addf-fc78-27690d72310f@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kchhzQa1Rj-4RXrYFeHiw7DiIoZ8aAOC
X-Proofpoint-GUID: kchhzQa1Rj-4RXrYFeHiw7DiIoZ8aAOC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_16,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308250157
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 25/08/23 9:03 pm, Christophe Leroy wrote:
> 
> 
> Le 25/08/2023 à 17:18, Hari Bathini a écrit :
>> Implement bpf_arch_text_invalidate and use it to fill unused part of
>> the bpf_prog_pack with trap instructions when a BPF program is freed.
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>    arch/powerpc/net/bpf_jit_comp.c | 22 +++++++++++++++++++---
>>    1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
>> index 170ebf8ac0f2..7cd4cf53d61c 100644
>> --- a/arch/powerpc/net/bpf_jit_comp.c
>> +++ b/arch/powerpc/net/bpf_jit_comp.c
>> @@ -30,7 +30,7 @@ static void bpf_jit_fill_ill_insns(void *area, unsigned int size)
>>     * Patch 'len' bytes of instructions from opcode to addr, one instruction
>>     * at a time. Returns addr on success. ERR_PTR(-EINVAL), otherwise.
>>     */
>> -static void *bpf_patch_instructions(void *addr, void *opcode, size_t len)
>> +static void *bpf_patch_instructions(void *addr, void *opcode, size_t len, bool fill_insn)
> 
> It's a pitty that you have to modify in patch 2 a function you have
> added in patch 1 of the same series. Can't you have it right from the
> begining ?
> 
>>    {
>>    	while (len > 0) {
>>    		ppc_inst_t insn = ppc_inst_read(opcode);
>> @@ -41,7 +41,8 @@ static void *bpf_patch_instructions(void *addr, void *opcode, size_t len)
>>    
>>    		len -= ilen;
>>    		addr = addr + ilen;
>> -		opcode = opcode + ilen;
>> +		if (!fill_insn)
>> +			opcode = opcode + ilen;
>>    	}
>>    
>>    	return addr;
>> @@ -307,7 +308,22 @@ void *bpf_arch_text_copy(void *dst, void *src, size_t len)
>>    		return ERR_PTR(-EINVAL);
>>    
>>    	mutex_lock(&text_mutex);
>> -	ret = bpf_patch_instructions(dst, src, len);
>> +	ret = bpf_patch_instructions(dst, src, len, false);
>> +	mutex_unlock(&text_mutex);
>> +
>> +	return ret;
>> +}
>> +
>> +int bpf_arch_text_invalidate(void *dst, size_t len)
>> +{
>> +	u32 insn = BREAKPOINT_INSTRUCTION;
>> +	int ret;
>> +
>> +	if (WARN_ON_ONCE(core_kernel_text((unsigned long)dst)))
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&text_mutex);
>> +	ret = IS_ERR(bpf_patch_instructions(dst, &insn, len, true));
> 
> Why IS_ERR ?
> 
> As far as I understand from the weak definition in kernel/bpf/core.c,
> this function is supposed to return an error, not a bool.

My bad! Will fix that in the next revision.

- Hari
