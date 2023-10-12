Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A167C77B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 22:12:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gbwiVRFc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S615M72wqz3dFS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 07:12:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gbwiVRFc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S614W6vBLz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 07:11:39 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39CK8iqS004604;
	Thu, 12 Oct 2023 20:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=aNl2HmeyXlkIPCiIDQNiNFJey0faRYyByW2efEXFHno=;
 b=gbwiVRFczUXiuYjTDT7qUQMwxFwl1+4StSUAmeFaMOFYzeTqmodptaiR4oCZI/iQ/zUG
 AeiDzhqYp6okKdfTCs0PJCbB23viRqr37egx239AbLEvyKPmtNVwiT6dheVfB2J78NYw
 qB2LvQpZLdxiDd5vFjydLDidCrbGkq1SERqkPCsBftJqNHD8n+BWT0GsfG6MyIw/FNfi
 whie2f98smAhXdbmFaCcdz4X9PIITa06dGuxVDPobWOLOB5wF57JZVk+0VeAGfNSui5J
 jeURon7uZu48NRAEfX5MRbuJ9pOtg7hGy2mS5u6v3HI7x/oGIZYBh4tpxII3vmg1WJri Kg== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tpqjyr3ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 20:11:18 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39CIgZGP023064;
	Thu, 12 Oct 2023 20:11:16 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkmc21m5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 20:11:16 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39CKBEwW22479610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Oct 2023 20:11:15 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A97A620040;
	Thu, 12 Oct 2023 20:11:14 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02D5D2004B;
	Thu, 12 Oct 2023 20:11:13 +0000 (GMT)
Received: from [9.43.73.24] (unknown [9.43.73.24])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Oct 2023 20:11:12 +0000 (GMT)
Message-ID: <46e295ce-5531-b09b-2f38-13a0d5179b0a@linux.ibm.com>
Date: Fri, 13 Oct 2023 01:41:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 1/5] powerpc/code-patching: introduce
 patch_instructions()
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>
References: <20230928194818.261163-1-hbathini@linux.ibm.com>
 <20230928194818.261163-2-hbathini@linux.ibm.com>
 <6fe51a4d-9c16-81e0-c592-07331743bedb@csgroup.eu>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <6fe51a4d-9c16-81e0-c592-07331743bedb@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m0rMrHbi7esklEQnUM8jIyT2f5KJDtug
X-Proofpoint-ORIG-GUID: m0rMrHbi7esklEQnUM8jIyT2f5KJDtug
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_12,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=822 lowpriorityscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120168
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for the review, Christophe.

On 10/10/23 11:16 pm, Christophe Leroy wrote:
> 
> 
> Le 28/09/2023 à 21:48, Hari Bathini a écrit :
>> patch_instruction() entails setting up pte, patching the instruction,
>> clearing the pte and flushing the tlb. If multiple instructions need
>> to be patched, every instruction would have to go through the above
>> drill unnecessarily. Instead, introduce function patch_instructions()
>> that sets up the pte, clears the pte and flushes the tlb only once per
>> page range of instructions to be patched. This adds a slight overhead
>> to patch_instruction() call while improving the patching time for
>> scenarios where more than one instruction needs to be patched.
> 
> Not a "slight" but a "significant" overhead on PPC32.
> 
> Thinking about it once more I don't think it is a good idea to try and
> merge that into the existing code_patching logic which is really single
> instruction performance oriented.
> 
> Anyway, comments below.
> 
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>    arch/powerpc/include/asm/code-patching.h |  1 +
>>    arch/powerpc/lib/code-patching.c         | 93 +++++++++++++++++++++---
>>    2 files changed, 85 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
>> index 3f881548fb61..43a4aedfa703 100644
>> --- a/arch/powerpc/include/asm/code-patching.h
>> +++ b/arch/powerpc/include/asm/code-patching.h
>> @@ -74,6 +74,7 @@ int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
>>    int patch_branch(u32 *addr, unsigned long target, int flags);
>>    int patch_instruction(u32 *addr, ppc_inst_t instr);
>>    int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
>> +int patch_instructions(void *addr, void *code, size_t len, bool repeat_instr);
> 
> I don't like void *, you can do to much nasty things with that.
> I think you want u32 *
> 
>>    
>>    static inline unsigned long patch_site_addr(s32 *site)
>>    {
>> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
>> index b00112d7ad46..4ff002bc41f6 100644
>> --- a/arch/powerpc/lib/code-patching.c
>> +++ b/arch/powerpc/lib/code-patching.c
>> @@ -278,7 +278,36 @@ static void unmap_patch_area(unsigned long addr)
>>    	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>    }
>>    
>> -static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
>> +static int __patch_instructions(u32 *patch_addr, void *code, size_t len, bool repeat_instr)
>> +{
>> +	unsigned long start = (unsigned long)patch_addr;
>> +
>> +	/* Repeat instruction */
>> +	if (repeat_instr) {
>> +		ppc_inst_t instr = ppc_inst_read(code);
>> +
>> +		if (ppc_inst_prefixed(instr)) {
>> +			u64 val = ppc_inst_as_ulong(instr);
>> +
>> +			memset64((uint64_t *)patch_addr, val, len / 8);
> 
> Use u64 instead of uint64_t.
> 
>> +		} else {
>> +			u32 val = ppc_inst_val(instr);
>> +
>> +			memset32(patch_addr, val, len / 4);
>> +		}
>> +	} else
>> +		memcpy(patch_addr, code, len);
> 
> Missing braces, see
> https://docs.kernel.org/process/coding-style.html#placing-braces-and-spaces
> 
>> +
>> +	smp_wmb();	/* smp write barrier */
>> +	flush_icache_range(start, start + len);
>> +	return 0;
>> +}
>> +
>> +/*
>> + * A page is mapped and instructions that fit the page are patched.
>> + * Assumes 'len' to be (PAGE_SIZE - offset_in_page(addr)) or below.
>> + */
>> +static int __do_patch_instructions_mm(u32 *addr, void *code, size_t len, bool repeat_instr)
>>    {
>>    	int err;
>>    	u32 *patch_addr;
>> @@ -307,11 +336,15 @@ static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
>>    
>>    	orig_mm = start_using_temp_mm(patching_mm);
>>    
>> -	err = __patch_instruction(addr, instr, patch_addr);
>> +	/* Single instruction case. */
>> +	if (len == 0) {
>> +		err = __patch_instruction(addr, *(ppc_inst_t *)code, patch_addr);
> 
> Take care, you can't convert u32 * to ppc_inst_t that way, you have to
> use ppc_inst_read() otherwise you'll get odd result with prefixed
> instructions depending on endianness.
> 
>>    
>> -	/* hwsync performed by __patch_instruction (sync) if successful */
>> -	if (err)
>> -		mb();  /* sync */
>> +		/* hwsync performed by __patch_instruction (sync) if successful */
>> +		if (err)
>> +			mb();  /* sync */
> 
> Get this away, see my patch at
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/e88b154eaf2efd9ff177d472d3411dcdec8ff4f5.1696675567.git.christophe.leroy@csgroup.eu/
> 
>> +	} else
>> +		err = __patch_instructions(patch_addr, code, len, repeat_instr);
>>    
>>    	/* context synchronisation performed by __patch_instruction (isync or exception) */
>>    	stop_using_temp_mm(patching_mm, orig_mm);
>> @@ -328,7 +361,11 @@ static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
>>    	return err;
>>    }
>>    
>> -static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
>> +/*
>> + * A page is mapped and instructions that fit the page are patched.
>> + * Assumes 'len' to be (PAGE_SIZE - offset_in_page(addr)) or below.
>> + */
>> +static int __do_patch_instructions(u32 *addr, void *code, size_t len, bool repeat_instr)
>>    {
>>    	int err;
>>    	u32 *patch_addr;
>> @@ -345,7 +382,11 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
>>    	if (radix_enabled())
>>    		asm volatile("ptesync": : :"memory");
>>    
>> -	err = __patch_instruction(addr, instr, patch_addr);
>> +	/* Single instruction case. */
>> +	if (len == 0)
>> +		err = __patch_instruction(addr, *(ppc_inst_t *)code, patch_addr);
> 
> Same, use ppc_inst_read() instead of this nasty casting.
> 
>> +	else
>> +		err = __patch_instructions(patch_addr, code, len, repeat_instr);
>>    
>>    	pte_clear(&init_mm, text_poke_addr, pte);
>>    	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
>> @@ -369,15 +410,49 @@ int patch_instruction(u32 *addr, ppc_inst_t instr)
>>    
>>    	local_irq_save(flags);
>>    	if (mm_patch_enabled())
>> -		err = __do_patch_instruction_mm(addr, instr);
>> +		err = __do_patch_instructions_mm(addr, &instr, 0, false);
>>    	else
>> -		err = __do_patch_instruction(addr, instr);
>> +		err = __do_patch_instructions(addr, &instr, 0, false);
>>    	local_irq_restore(flags);
>>    
>>    	return err;
>>    }
>>    NOKPROBE_SYMBOL(patch_instruction);
>>    
>> +/*
>> + * Patch 'addr' with 'len' bytes of instructions from 'code'.
>> + *
>> + * If repeat_instr is true, the same instruction is filled for
>> + * 'len' bytes.
>> + */
>> +int patch_instructions(void *addr, void *code, size_t len, bool repeat_instr)
> 
> I'd like to see code as a u32 *
> 
>> +{
>> +	unsigned long flags;
>> +	size_t plen;
>> +	int err;
> 
> Move those three variables inside the only block in which they are used.
> 
>> +
>> +	while (len > 0) {
>> +		plen = min_t(size_t, PAGE_SIZE - offset_in_page(addr), len);
>> +
>> +		local_irq_save(flags);
>> +		if (mm_patch_enabled())
>> +			err = __do_patch_instructions_mm(addr, code, plen, repeat_instr);
>> +		else
>> +			err = __do_patch_instructions(addr, code, plen, repeat_instr);
>> +		local_irq_restore(flags);
>> +		if (err)
>> +			break;
> 
> replace by 'return err'
> 
>> +
>> +		len -= plen;
>> +		addr = addr + plen;
>> +		if (!repeat_instr)
>> +			code = code + plen;
>> +	}
>> +
>> +	return err;
> 
> If len is 0 err will be undefined. Is that expected ?
> 
> Replace by return 0;

Posted v6 
(https://lore.kernel.org/linuxppc-dev/20231012200310.235137-1-hbathini@linux.ibm.com/)
with code path for patch_instruction() & patch_instriuctions() unmerged
to avoid performance hit reported on ppc32. Also, addressed other review
comments.

Thanks
Hari
