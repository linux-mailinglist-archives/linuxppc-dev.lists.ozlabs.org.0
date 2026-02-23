Return-Path: <linuxppc-dev+bounces-17071-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAZXCH2pnGklJwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17071-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 20:24:45 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1DF17C542
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 20:24:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKW552PDgz3bcf;
	Tue, 24 Feb 2026 06:24:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771874681;
	cv=none; b=FHo3IW6WMx7CH+tv0DYtwgB55iLSDbE5QSjXOIAgv7rIvYKxfEHn1NoeM9tYeQEkv45lzbchr7O+U6/utpsMz5ACBdhbQOScE9LmSsICn9pfzviGVjszTvV/aKDGdy9h3AQQhWZ1rWbMLghE2sb5Uok/leqywNlTaZvgZqE/1KUepSE7Z3VAWaowqN4V6/CHSap8LwtImmDG7/izSCkp2hVvL+l7I5HjVZ8SvUmW1aiaoDYEF3+BbK9xXB5t7fjusxjDSwxn0cn72Z3pr+yskqu42YLXKzBVoyatyLm/jiz9wKgvgqf+XwXSI4ZxLSf6+wSiznuT2HQ4D4Tnrk1Y2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771874681; c=relaxed/relaxed;
	bh=UGunXbk4R2K+cnSPKJTGq4bAxVdrCBHxPC1BtWXwRHw=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=JnpH/53pu1GAD66JGUwJi0Zxl31zO77gXN8FVBV0npt5w/vvVmrmKES4+mKcc5tERfHxk1cPxbQBHoKlx6imDJxRMG6+mWcLYaIwkET+B9zvWrhsgTMk1OI3lAa+tLA9R8miU+2D9UnDCY9565jt3OuuRSQGqHG0zjRHUSOJDYohEOauH6JStPcjAav1S8n528SFNQ8pdX0R8aF8x7LFJJP5yHlxI9SZqY0JAxQsOJD4cyGzL9c/4n3h5A+rBI75OSlYvgxOJnueVh5HaJ6gA+D48QR1J2hzvpDZZVv/yABwWee0wjVNjxkZbD37g/QHNkm/djSrU3wn2Qx5ZtXTmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rT5irvzT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rT5irvzT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKW542M4Fz3bW7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 06:24:39 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NI25LL2838435;
	Mon, 23 Feb 2026 19:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=UGunXb
	k4R2K+cnSPKJTGq4bAxVdrCBHxPC1BtWXwRHw=; b=rT5irvzTY79K2pPGHiaCpW
	LqTlQWKldVKRZ5fxzBLaUcF2VwxhraaZxiv5wdrVe6P90xF706G7Rwmp+Ygixg9g
	cc+uNQINl6M92BYwqpbwXDay6RWm39GElURXxTpcaUTbyeurEu5icFnCW6p8CaEP
	QpJpOMxykq1hALIxXmV9qWlGe9EazrqpDQUWT+tT7oeLsjD2L5IfYbMhHrHmVxpf
	+Z7/3eS7RE5hVbKBQEgnGVti8IziHvmJ3TgZ8HZ6C7/8Imn26OaM8QrgMxuT89k8
	CgGgONhIsZJX4SBqa5Sq62Ezx3HdK8jhfc1fopattJ7WtEp3KhBLQqMWYd7Sjw9Q
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4e38h2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 19:24:04 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61NF0Phl015758;
	Mon, 23 Feb 2026 19:24:04 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfq1se3ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 19:24:03 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61NJO3Zw53346624
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Feb 2026 19:24:03 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 378D358054;
	Mon, 23 Feb 2026 19:24:03 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 425525805A;
	Mon, 23 Feb 2026 19:24:02 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Feb 2026 19:24:02 +0000 (GMT)
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
Date: Tue, 24 Feb 2026 00:54:01 +0530
From: adubey <adubey@linux.ibm.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: bpf@vger.kernel.org, hbathini@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
        martin.lau@kernel.org, eddyz87@gmail.com, yonghong.song@linux.dev,
        clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCH 1/2] powerpc64/bpf: Implement JIT support for private
 stack
In-Reply-To: <665838c8-d921-403e-a45c-eefad4902209@kernel.org>
References: <20260216152234.36632-1-adubey@linux.ibm.com>
 <665838c8-d921-403e-a45c-eefad4902209@kernel.org>
Message-ID: <406c7737dea5ee4d7544ad0ba6a62c48@linux.ibm.com>
X-Sender: adubey@linux.ibm.com
Organization: IBM
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=XMs9iAhE c=1 sm=1 tr=0 ts=699ca955 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=DODryGAArwQ_SPwVTs4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: x7CFHJqXU85y4PV0TjoR_Ut91l1I7lBX
X-Proofpoint-ORIG-GUID: CnIWFGmczT-BaXz7ayJhZVPsB_TU_Aft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX+xXf+U6inB8R
 O6IeeIllxd/8cYXZSLLDeLi9vRsL3KEGLNvxjBE4CKws7vMNExb2CkKinSYaQteQPmEMyCfHqt0
 iXe8hSqIIHj9nXBvshOBgYwnSlH28S6MnwD+OGK3i1beWuweDky5bL9M3LUxfrzAU+gKHmb6SXU
 Clon7sdDpbKQpA25jSSYsN67CO94lf6bD0cv5iT4yEh9B0wJjfdAH2TmSbLTS+s7UPV33GC61jM
 NszRB4wkRQiKIJudhVcODG2gr0dTYsDWNYAEuA5TPKbukbxFgBYoSewqVrKljdUI0oE5gAIsdzN
 Rvn4Nt7DCkHVz/vtZbEuG7hcAfAbP6rgKIxC8IW/4pN7Ohns8FlW+cqdu4aLy365E8tfMM4wqoW
 3mE182VEYo1bhpC6dBTW+IQAB7OC1q9rS5U1i1w9fAVfc+utqXWVFE0woQ8X1koouaAVtbIK2Tm
 PGaI8DYYFRvIIcwzFSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602230166
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.ibm.com,lists.ozlabs.org,kernel.org,iogearbox.net,gmail.com,linux.dev,meta.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17071-lists,linuxppc-dev=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:bpf@vger.kernel.org,m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@kernel.org,m:eddyz87@gmail.com,m:yonghong.song@linux.dev,m:clm@meta.com,m:ihor.solodrai@linux.dev,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2F1DF17C542
X-Rspamd-Action: no action

On 2026-02-23 16:40, Christophe Leroy (CS GROUP) wrote:
> Le 16/02/2026 à 16:22, adubey@linux.ibm.com a écrit :
>> From: Abhishek Dubey <adubey@linux.ibm.com>
>> 
>> Provision the private stack as a per-CPU allocation during
>> bpf_int_jit_compile(). Align the stack to 16 bytes and place guard
>> regions at both ends to detect runtime stack overflow and underflow.
>> 
>> Round the private stack size up to the nearest 16-byte boundary.
>> Make each guard region 16 bytes to preserve the required overall
>> 16-byte alignment. When private stack is set, skip bpf stack size
>> accounting in kernel stack.
>> 
>> There is no stack pointer in powerpc. Stack referencing during JIT
>> is done using frame pointer. Frame pointer calculation goes like:
>> 
>> BPF frame pointer = Priv stack allocation start address +
>>                      Overflow guard +
>>                      Actual stack size defined by verifier
>> 
>> Memory layout:
>> 
>> High Addr          
>> +--------------------------------------------------+
>>                     |                                                  
>> |
>>                     | 16 bytes Underflow guard (0xEB9F12345678eb9fULL) 
>> |
>>                     |                                                  
>> |
>>           BPF FP -> 
>> +--------------------------------------------------+
>>                     |                                                  
>> |
>>                     | Private stack - determined by verifier           
>> |
>>                     | 16-bytes aligned                                 
>> |
>>                     |                                                  
>> |
>>                     
>> +--------------------------------------------------+
>>                     |                                                  
>> |
>> Lower Addr         | 16 byte Overflow guard (0xEB9F12345678eb9fULL)   
>> |
>>                     |                                                  
>> |
>> Priv stack alloc 
>> ->+--------------------------------------------------+
>> start
>> 
>> Update BPF_REG_FP to point to the calculated offset within the
>> allocated private stack buffer. Now, BPF stack usage reference
>> in the allocated private stack.
>> 
>> The patch is rebase over fixes by Hari:
>> https://lore.kernel.org/bpf/20260216065639.1750181-1-hbathini@linux.ibm.com/T/#mf02cad9096fa4ad1f05610b1f464da1cddf7445a
>> 
>> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
>> ---
>>   arch/powerpc/net/bpf_jit.h        |  5 +++
>>   arch/powerpc/net/bpf_jit_comp.c   | 74 
>> +++++++++++++++++++++++++++++++
>>   arch/powerpc/net/bpf_jit_comp64.c | 38 +++++++++++++---
>>   3 files changed, 112 insertions(+), 5 deletions(-)
>> 
>> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
>> index 7354e1d72f79..5a115c54e43a 100644
>> --- a/arch/powerpc/net/bpf_jit.h
>> +++ b/arch/powerpc/net/bpf_jit.h
>> @@ -178,8 +178,13 @@ struct codegen_context {
>>   	bool is_subprog;
>>   	bool exception_boundary;
>>   	bool exception_cb;
>> +	u64 priv_sp;
> 
> Are you sure you want a u64, not a long ?
After bot's warning, I was considering void __percpu *priv_sp in 
codegen_context, to keep compiler happy throughout.
If not above, I would prefer long(~= pointer). Thoughts? @Christophe
> 
>>   };
>>   +/* Memory size & magic-value to detect private stack 
>> overflow/underflow */
>> +#define PRIV_STACK_GUARD_SZ    16
>> +#define PRIV_STACK_GUARD_VAL   0xEB9F12345678eb9fULL
>> +
>>   #define bpf_to_ppc(r)	(ctx->b2p[r])
>>     #ifdef CONFIG_PPC32
>> diff --git a/arch/powerpc/net/bpf_jit_comp.c 
>> b/arch/powerpc/net/bpf_jit_comp.c
>> index 278e09b57560..7a78e03d482f 100644
>> --- a/arch/powerpc/net/bpf_jit_comp.c
>> +++ b/arch/powerpc/net/bpf_jit_comp.c
>> @@ -129,6 +129,39 @@ bool bpf_jit_needs_zext(void)
>>   	return true;
>>   }
>>   +static void priv_stack_init_guard(void __percpu *priv_stack_ptr, 
>> int alloc_size)
>> +{
>> +	int cpu, underflow_idx = (alloc_size - PRIV_STACK_GUARD_SZ) >> 3;
>> +	u64 *stack_ptr;
>> +
>> +	for_each_possible_cpu(cpu) {
>> +		stack_ptr = per_cpu_ptr(priv_stack_ptr, cpu);
>> +		stack_ptr[0] = PRIV_STACK_GUARD_VAL;
>> +		stack_ptr[1] = PRIV_STACK_GUARD_VAL;
>> +		stack_ptr[underflow_idx] = PRIV_STACK_GUARD_VAL;
>> +		stack_ptr[underflow_idx + 1] = PRIV_STACK_GUARD_VAL;
>> +	}
>> +}
>> +
>> +static void priv_stack_check_guard(void __percpu *priv_stack_ptr, int 
>> alloc_size,
>> +								struct bpf_prog *fp)
>> +{
>> +	int cpu, underflow_idx = (alloc_size - PRIV_STACK_GUARD_SZ) >> 3;
>> +	u64 *stack_ptr;
>> +
>> +	for_each_possible_cpu(cpu) {
>> +		stack_ptr = per_cpu_ptr(priv_stack_ptr, cpu);
>> +		if (stack_ptr[0] != PRIV_STACK_GUARD_VAL ||
>> +			stack_ptr[1] != PRIV_STACK_GUARD_VAL ||
>> +			stack_ptr[underflow_idx] != PRIV_STACK_GUARD_VAL ||
>> +			stack_ptr[underflow_idx + 1] != PRIV_STACK_GUARD_VAL) {
>> +			pr_err("BPF private stack overflow/underflow detected for prog 
>> %sx\n",
>> +			bpf_jit_get_prog_name(fp));
>> +			break;
>> +		}
>> +	}
>> +}
>> +
>>   struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>>   {
>>   	u32 proglen;
>> @@ -140,6 +173,8 @@ struct bpf_prog *bpf_int_jit_compile(struct 
>> bpf_prog *fp)
>>   	struct codegen_context cgctx;
>>   	int pass;
>>   	int flen;
>> +	int priv_stack_alloc_size;
>> +	void __percpu *priv_stack_ptr = NULL;
>>   	struct bpf_binary_header *fhdr = NULL;
>>   	struct bpf_binary_header *hdr = NULL;
>>   	struct bpf_prog *org_fp = fp;
>> @@ -173,6 +208,25 @@ struct bpf_prog *bpf_int_jit_compile(struct 
>> bpf_prog *fp)
>>   		fp->aux->jit_data = jit_data;
>>   	}
>>   +	if (!priv_stack_ptr && fp->aux->jits_use_priv_stack) {
>> +		/*
>> +		 * Allocate private stack of size equivalent to
>> +		 * verifier-calculated stack size plus two memory
>> +		 * guard regions to detect private stack overflow
>> +		 * and underflow.
>> +		 */
>> +		priv_stack_alloc_size = round_up(fp->aux->stack_depth, 16) +
>> +							2 * PRIV_STACK_GUARD_SZ;
>> +		priv_stack_ptr = __alloc_percpu_gfp(priv_stack_alloc_size, 16, 
>> GFP_KERNEL);
>> +		if (!priv_stack_ptr) {
>> +			fp = org_fp;
>> +			goto out_priv_stack;
>> +		}
>> +
>> +		priv_stack_init_guard(priv_stack_ptr, priv_stack_alloc_size);
>> +		fp->aux->priv_stack_ptr = priv_stack_ptr;
>> +	}
>> +
>>   	flen = fp->len;
>>   	addrs = jit_data->addrs;
>>   	if (addrs) {
>> @@ -209,6 +263,7 @@ struct bpf_prog *bpf_int_jit_compile(struct 
>> bpf_prog *fp)
>>   	cgctx.is_subprog = bpf_is_subprog(fp);
>>   	cgctx.exception_boundary = fp->aux->exception_boundary;
>>   	cgctx.exception_cb = fp->aux->exception_cb;
>> +	cgctx.priv_sp = priv_stack_ptr ? (u64)priv_stack_ptr : 0;
> 
> priv_stack_ptr is a pointer, ie a long.
> priv_sp is a u64, ie a long long.
Ack!
> 
> This will mismatch on powerpc/32
long/void* should work fine everywhere.
> 
>>     	/* Scouting faux-generate pass 0 */
>>   	if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
>> @@ -306,7 +361,12 @@ struct bpf_prog *bpf_int_jit_compile(struct 
>> bpf_prog *fp)
>>   		}
>>   		bpf_prog_fill_jited_linfo(fp, addrs);
>>   out_addrs:
>> +		if (!image && priv_stack_ptr) {
>> +			free_percpu(priv_stack_ptr);
>> +			fp->aux->priv_stack_ptr = NULL;
> 
> Shouldn't those two lines be swapped ?
Good catch! This can lead to use-after-free situation.
> 
>> +		}
>>   		kfree(addrs);
>> +out_priv_stack:
>>   		kfree(jit_data);
>>   		fp->aux->jit_data = NULL;
>>   	} else {
>> @@ -419,6 +479,8 @@ void bpf_jit_free(struct bpf_prog *fp)
>>   	if (fp->jited) {
>>   		struct powerpc_jit_data *jit_data = fp->aux->jit_data;
>>   		struct bpf_binary_header *hdr;
>> +		void __percpu *priv_stack_ptr;
>> +		int priv_stack_alloc_size;
>>     		/*
>>   		 * If we fail the final pass of JIT (from jit_subprogs),
>> @@ -432,6 +494,13 @@ void bpf_jit_free(struct bpf_prog *fp)
>>   		}
>>   		hdr = bpf_jit_binary_pack_hdr(fp);
>>   		bpf_jit_binary_pack_free(hdr, NULL);
>> +		priv_stack_ptr = fp->aux->priv_stack_ptr;
>> +		if (priv_stack_ptr) {
>> +			priv_stack_alloc_size = round_up(fp->aux->stack_depth, 16) +
>> +							2 * PRIV_STACK_GUARD_SZ;
>> +			priv_stack_check_guard(priv_stack_ptr, priv_stack_alloc_size, fp);
>> +			free_percpu(priv_stack_ptr);
>> +		}
>>   		WARN_ON_ONCE(!bpf_prog_kallsyms_verify_off(fp));
>>   	}
>>   @@ -453,6 +522,11 @@ bool bpf_jit_supports_kfunc_call(void)
>>   	return true;
>>   }
>>   +bool bpf_jit_supports_private_stack(void)
>> +{
>> +	return IS_ENABLED(CONFIG_PPC64);
>> +}
>> +
>>   bool bpf_jit_supports_arena(void)
>>   {
>>   	return IS_ENABLED(CONFIG_PPC64);
>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c 
>> b/arch/powerpc/net/bpf_jit_comp64.c
>> index 640b84409687..206ef43b4090 100644
>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
>> @@ -183,6 +183,20 @@ void bpf_jit_realloc_regs(struct codegen_context 
>> *ctx)
>>   {
>>   }
>>   +static void emit_fp_priv_stack(u32 *image, struct codegen_context 
>> *ctx, void __percpu *ptr)
>> +{
>> +	/* Load percpu data offset */
>> +	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R13,
>> +			offsetof(struct paca_struct, data_offset)));
>> +	PPC_LI64(bpf_to_ppc(BPF_REG_FP), (u64)ptr);
>> +	/*
>> +	 * Set frame pointer with percpu allocated
>> +	 * buffer for private stack.
>> +	 */
>> +	EMIT(PPC_RAW_ADD(bpf_to_ppc(BPF_REG_FP),
>> +			bpf_to_ppc(TMP_REG_1), bpf_to_ppc(BPF_REG_FP)));
>> +}
>> +
>>   /*
>>    * For exception boundary & exception_cb progs:
>>    *     return increased size to accommodate additional NVRs.
>> @@ -197,6 +211,12 @@ static int bpf_jit_stack_size(struct 
>> codegen_context *ctx)
>>   void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
>>   {
>>   	int i;
>> +	void __percpu *priv_frame_ptr = NULL;
>> +
>> +	if (ctx->priv_sp) {
>> +		priv_frame_ptr = (void*) ctx->priv_sp + PRIV_STACK_GUARD_SZ +
>> +					round_up(ctx->stack_size, 16);
>> +	}
>>     	/* Instruction for trampoline attach */
>>   	EMIT(PPC_RAW_NOP());
>> @@ -251,7 +271,7 @@ void bpf_jit_build_prologue(u32 *image, struct 
>> codegen_context *ctx)
>>   		}
>>     		EMIT(PPC_RAW_STDU(_R1, _R1,
>> -				-(bpf_jit_stack_size(ctx) + ctx->stack_size)));
>> +			-(bpf_jit_stack_size(ctx) + (ctx->priv_sp ? 0 : 
>> ctx->stack_size))));
>>   	}
>>     	/*
>> @@ -307,9 +327,16 @@ void bpf_jit_build_prologue(u32 *image, struct 
>> codegen_context *ctx)
>>   	 * Exception_cb not restricted from using stack area or arena.
>>   	 * Setup frame pointer to point to the bpf stack area
>>   	 */
>> -	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
>> -		EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
>> -			STACK_FRAME_MIN_SIZE + ctx->stack_size));
>> +	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP))) {
>> +		if (ctx->priv_sp && priv_frame_ptr) {
>> +			/* Set up private stack pointer */
>> +			emit_fp_priv_stack(image, ctx, priv_frame_ptr);
>> +		} else {
>> +			/* Setup frame pointer to point to the bpf stack area */
>> +			EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
>> +				STACK_FRAME_MIN_SIZE + ctx->stack_size));
>> +		}
>> +	}
>>     	if (ctx->arena_vm_start)
>>   		PPC_LI64(bpf_to_ppc(ARENA_VM_START), ctx->arena_vm_start);
>> @@ -339,7 +366,8 @@ static void bpf_jit_emit_common_epilogue(u32 
>> *image, struct codegen_context *ctx
>>     	/* Tear down our stack frame */
>>   	if (bpf_has_stack_frame(ctx)) {
>> -		EMIT(PPC_RAW_ADDI(_R1, _R1, bpf_jit_stack_size(ctx) + 
>> ctx->stack_size));
>> +		EMIT(PPC_RAW_ADDI(_R1, _R1,
>> +			bpf_jit_stack_size(ctx) + (ctx->priv_sp ? 0 : ctx->stack_size)));
>>     		if (ctx->seen & SEEN_FUNC || ctx->exception_cb) {
>>   			EMIT(PPC_RAW_LD(_R0, _R1, PPC_LR_STKOFF));
-Abhishek

