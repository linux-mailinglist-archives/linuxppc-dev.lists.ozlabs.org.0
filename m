Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 308D379FE3C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 10:25:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pgxOY/HB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmVkF0dKYz3cGY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 18:25:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pgxOY/HB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmVjL3HMtz3cDS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 18:24:21 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38E8HA6G018520;
	Thu, 14 Sep 2023 08:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ypPE/0di+WH51UcfsJKW3qZaQ5nXjzd0VxPJ6ppYm+0=;
 b=pgxOY/HBbkfndYVSArGWnMvxE335RHltt8lygsC8HRFRbUvji8IX6yNF3nGF/+aBw3PX
 ztubmKv1MwatmG5iKE8xqXPqhpUGP0fNT9UjboNYG3oFMCsjALt617hH+Jh9vXaphEHy
 m4jS8Fztm607WGxd9x0dNUY5kFdz4nakyPGnwU7m6+3+xg7P2x9C1NEn1PXikhPgMSZZ
 L71YeKNhnp8Kem9xZg4oIdzcsede9ZZeYrgG4Gg1JUvFK/32mNSvorA4+eQiDxf5N5JV
 ppfk/QoKOkwujeiKyGZ/9VsTtGfMQbB8KqT834e1WsopLouGMs5X8+hf+C/ut65s8Bcx bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t3ws7schb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 08:23:57 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38E8KEjv030734;
	Thu, 14 Sep 2023 08:23:56 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t3ws7scgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 08:23:56 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38E8Jbm8002724;
	Thu, 14 Sep 2023 08:23:56 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t14hm9c4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 08:23:55 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38E8NsGs8389168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Sep 2023 08:23:54 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E227C20043;
	Thu, 14 Sep 2023 08:23:53 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D540C20040;
	Thu, 14 Sep 2023 08:23:50 +0000 (GMT)
Received: from [9.43.25.10] (unknown [9.43.25.10])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Sep 2023 08:23:50 +0000 (GMT)
Message-ID: <80621ac1-6ca4-55a6-108d-f3a205961c4d@linux.ibm.com>
Date: Thu, 14 Sep 2023 13:53:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 8/8] bpf ppc32: Access only if addr is kernel address
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "ast@kernel.org"
 <ast@kernel.org>,
        "daniel@iogearbox.net" <daniel@iogearbox.net>
References: <20210929111855.50254-1-hbathini@linux.ibm.com>
 <20210929111855.50254-9-hbathini@linux.ibm.com>
 <aa3db398-5d44-c68c-6f74-027e31521177@csgroup.eu>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <aa3db398-5d44-c68c-6f74-027e31521177@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YPYP8T5CWpScKMH-oPpanrND1B9oYv8M
X-Proofpoint-ORIG-GUID: qm07fJxQYzhjeBjCKgbVHNrfxH4Vh9oM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_06,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 clxscore=1011 spamscore=0
 impostorscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309140070
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
Cc: "songliubraving@fb.com" <songliubraving@fb.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "andrii@kernel.org" <andrii@kernel.org>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "paulus@samba.org" <paulus@samba.org>, "yhs@fb.com" <yhs@fb.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "kafai@fb.com" <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 14/09/23 11:48 am, Christophe Leroy wrote:
> Hi,
> 

Hi Christophe,

> Le 29/09/2021 à 13:18, Hari Bathini a écrit :
>> With KUAP enabled, any kernel code which wants to access userspace
>> needs to be surrounded by disable-enable KUAP. But that is not
>> happening for BPF_PROBE_MEM load instruction. Though PPC32 does not
>> support read protection, considering the fact that PTR_TO_BTF_ID
>> (which uses BPF_PROBE_MEM mode) could either be a valid kernel pointer
>> or NULL but should never be a pointer to userspace address, execute
>> BPF_PROBE_MEM load only if addr is kernel address, otherwise set
>> dst_reg=0 and move on.
> 
> While looking at the series "bpf: verifier: stop emitting zext for LDX"
> from Puranjay I got a question on this old commit, see below.
> 
>>
>> This will catch NULL, valid or invalid userspace pointers. Only bad
>> kernel pointer will be handled by BPF exception table.
>>
>> [Alexei suggested for x86]
>> Suggested-by: Alexei Starovoitov <ast@kernel.org>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>
>> Changes in v4:
>> * Adjusted the emit code to avoid using temporary reg.
>>
>>
>>    arch/powerpc/net/bpf_jit_comp32.c | 34 +++++++++++++++++++++++++++++++
>>    1 file changed, 34 insertions(+)
>>
>> diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
>> index 6ee13a09c70d..2ac81563c78d 100644
>> --- a/arch/powerpc/net/bpf_jit_comp32.c
>> +++ b/arch/powerpc/net/bpf_jit_comp32.c
>> @@ -818,6 +818,40 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>>    		case BPF_LDX | BPF_PROBE_MEM | BPF_W:
>>    		case BPF_LDX | BPF_MEM | BPF_DW: /* dst = *(u64 *)(ul) (src + off) */
>>    		case BPF_LDX | BPF_PROBE_MEM | BPF_DW:
>> +			/*
>> +			 * As PTR_TO_BTF_ID that uses BPF_PROBE_MEM mode could either be a valid
>> +			 * kernel pointer or NULL but not a userspace address, execute BPF_PROBE_MEM
>> +			 * load only if addr is kernel address (see is_kernel_addr()), otherwise
>> +			 * set dst_reg=0 and move on.
>> +			 */
>> +			if (BPF_MODE(code) == BPF_PROBE_MEM) {
>> +				PPC_LI32(_R0, TASK_SIZE - off);
>> +				EMIT(PPC_RAW_CMPLW(src_reg, _R0));
>> +				PPC_BCC(COND_GT, (ctx->idx + 5) * 4);
>> +				EMIT(PPC_RAW_LI(dst_reg, 0));
>> +				/*
>> +				 * For BPF_DW case, "li reg_h,0" would be needed when
>> +				 * !fp->aux->verifier_zext. Emit NOP otherwise.
>> +				 *
>> +				 * Note that "li reg_h,0" is emitted for BPF_B/H/W case,
>> +				 * if necessary. So, jump there insted of emitting an
>> +				 * additional "li reg_h,0" instruction.
>> +				 */
>> +				if (size == BPF_DW && !fp->aux->verifier_zext)
>> +					EMIT(PPC_RAW_LI(dst_reg_h, 0));
>> +				else
>> +					EMIT(PPC_RAW_NOP());
> 
> While do you need a NOP in the else case ? Can't we just emit no
> instruction in that case ?

Yeah but used the same offset for all cases in the conditional branch
above. To drop the NOP, the conditional branch offset can be calculated
based on the above if condition, I guess..

Thanks,
Hari
