Return-Path: <linuxppc-dev+bounces-16994-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEmpLVgpmWkuRQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16994-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Feb 2026 04:41:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A2116C0AB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Feb 2026 04:41:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHtFB2jyYz2yrn;
	Sat, 21 Feb 2026 14:41:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771645262;
	cv=none; b=an+BfkNCdz+BFHiZ/c+G5Bs48WIpdHu3d+n0ZgqQ7u9L3y6hqmuP18aeoZbHx4fo3YMKC2hmLqwW67u1Pe3cVOlUEuubSy0tVrokojt2Klq15m3ur+9CunGsI8A7GnDh6Cfr3nnxkt2gY6eRUCnN3Ln9myZxS6FwOPuj8u9foXZ7jD0cKDo9tJkMf/0lhsohC09FkE6QSw9KTHa7nsvexaE6rULcGGMijEGUg6sADT/TuHadwgi/YdJuxxBUYK89WlJCgjwknqe84FDRp3l4BeSBRmxUweXf4/K7gkz74VTHqoajyOsBVLgecaIqN74noRh85hplna9zK88c1QZRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771645262; c=relaxed/relaxed;
	bh=7YEdIorcSclRf2uO+viXOh2ARWoPpyG/p/Rdh98ljeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/QVe1dJojRB0egqmXTvno1z1yCc5PmvFWr1XcC1QqKO17z2WVy19b8W9kBBPdH3CzwMJPuDNOfQpdObPG55zwmKFq5/HJSVBhtsu3hfoCtWFwQvoWfehTFxB20yTjg97P4CDiwyklYPjRSPQh1NLqM8MKgoRNvY2EzN5ANN05asvjrBurMwkLreFALJ5D5vFpH7OdKS+jcQYU5/9elAW5lBEGbWIZ3N5GfNliJP4c2ptcm2LFR+Ll9OCH8abbyfvuAURwbK7YK+XUJqisVCBIYo9Lt+JB20a/EnHt+HSndoFc9/y/y9ooIssqgeZFEvsE7rQ6WkglbjVpbeTwkygg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yq0eTwaj; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yq0eTwaj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHtF85MdXz2xlr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Feb 2026 14:41:00 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61L2vonU2154671;
	Sat, 21 Feb 2026 03:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7YEdIo
	rcSclRf2uO+viXOh2ARWoPpyG/p/Rdh98ljeI=; b=Yq0eTwajpbJ7a5YjNHqd6f
	zY2tuZHs6ZI779NkNNNt+7gIoZ4SxISqVJa8jL85IKVrMwJmESlQ9YSvCh5Nfiic
	/6vhoJgHVvQs5cFE2i9OKjvYpcrkva2tvDPJouuDdY2KB/14y1eN4Y4umBcekzOV
	wMEa50oWjzFQ+Yv734oNs6v5Yt8NhRu37+rNj+GvifWwlE6O6Fu2IDXhFYylSdnE
	g6sM/PdPjvB5KfY5H01N84PDNITsfEgjh71dHqAgdUIN8Mk1pAXSSxF4ARjVkM82
	rg4WQCV5L41AdIYFOZlQwhy+anj5BveLoxObXLXQO75GsYkUjZdSNZktba7nasVQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4brg2gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Feb 2026 03:40:43 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61L0gq2h030208;
	Sat, 21 Feb 2026 03:40:43 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ccb45jwxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Feb 2026 03:40:43 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61L3efEj31392294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Feb 2026 03:40:42 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C38445804E;
	Sat, 21 Feb 2026 03:40:41 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 418115803F;
	Sat, 21 Feb 2026 03:40:38 +0000 (GMT)
Received: from [9.61.251.42] (unknown [9.61.251.42])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 21 Feb 2026 03:40:37 +0000 (GMT)
Message-ID: <b53acfaf-9f56-48f0-9e0d-d7af272c6683@linux.ibm.com>
Date: Sat, 21 Feb 2026 09:10:36 +0530
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
Subject: Re: [PATCH v2 1/5] powerpc64/bpf: do not increment tailcall count
 when prog is NULL
Content-Language: en-GB
To: Hari Bathini <hbathini@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: bpf@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Abhishek Dubey <adubey@linux.ibm.com>, stable@vger.kernel.org
References: <20260220063933.196141-1-hbathini@linux.ibm.com>
 <20260220063933.196141-2-hbathini@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20260220063933.196141-2-hbathini@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: d_G8T0EP50HMIWmbO1rg1NhBEuAzHD-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIxMDAzNiBTYWx0ZWRfX6Z07WmDh1H2U
 dSTJ8JNX441rqfArophoM/Lbmp2IDhGlXcfiyFLs0by4pdD546vg2B8I3JLWFjAVXtlAm+9hbFB
 lIEc0kSanyQUrjsvpUlrQMPzMPDF7rFju/p7huHCzGmIWpOrJBfAjKrnc3F7r2sTzlVUz24CPEv
 y9B1M8g8kUcsMOZ0dN4Rx963ArThB/a8JFu8+ghG6PZMJ1PksgvsiEy8jN+jG8dSzsaYOCpAnYF
 3bX88cYsH03oMbZAeX6ogsgdtrjMvk1CXFk263Cs0gvByN3uOmU/fds4wv9zpLOzKBu/iCeXj8P
 TiEHBaqQ9BwgARmbyD1giYVfWoqzLsqSmBQ6wWw+0rhm+SZG5/Do3yOOJ7aap10V4LoC7rqNAQE
 imDRXKJPCAZ/vmSk4q9Jqsgo420IyXFJi2d7X2EH7ydxZRzBinw5q15YXlGgTBMjuYuGEDsXT7b
 3nV1LOEdsvwC0ptPuYA==
X-Authority-Analysis: v=2.4 cv=eNceTXp1 c=1 sm=1 tr=0 ts=6999293b cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=YpS5cAcgm0N0_-8T5d8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: d_G8T0EP50HMIWmbO1rg1NhBEuAzHD-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-21_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602210036
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16994-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:bpf@vger.kernel.org,m:maddy@linux.ibm.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:skb99@linux.ibm.com,m:adubey@linux.ibm.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 22A2116C0AB
X-Rspamd-Action: no action


On 20/02/26 12:09 pm, Hari Bathini wrote:
> Do not increment tailcall count, if tailcall did not succeed due to
> missing BPF program.
>
> Fixes: ce0761419fae ("powerpc/bpf: Implement support for tail calls")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>
> * No changes since v1.
>
>
>   arch/powerpc/net/bpf_jit_comp64.c | 39 +++++++++++++++++--------------
>   1 file changed, 21 insertions(+), 18 deletions(-)
>
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index b1a3945ccc9f..44ce8a8783f9 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -522,9 +522,30 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
>   
>   	/*
>   	 * tail_call_info++; <- Actual value of tcc here
> +	 * Writeback this updated value only if tailcall succeeds.
>   	 */
>   	EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), 1));
>   
> +	/* prog = array->ptrs[index]; */
> +	EMIT(PPC_RAW_MULI(bpf_to_ppc(TMP_REG_2), b2p_index, 8));
> +	EMIT(PPC_RAW_ADD(bpf_to_ppc(TMP_REG_2), bpf_to_ppc(TMP_REG_2), b2p_bpf_array));
> +	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_2), bpf_to_ppc(TMP_REG_2),
> +			offsetof(struct bpf_array, ptrs)));
> +
> +	/*
> +	 * if (prog == NULL)
> +	 *   goto out;
> +	 */
> +	EMIT(PPC_RAW_CMPLDI(bpf_to_ppc(TMP_REG_2), 0));
> +	PPC_BCC_SHORT(COND_EQ, out);
> +
> +	/* goto *(prog->bpf_func + prologue_size); */
> +	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_2), bpf_to_ppc(TMP_REG_2),
> +			offsetof(struct bpf_prog, bpf_func)));
> +	EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_2), bpf_to_ppc(TMP_REG_2),
> +			  FUNCTION_DESCR_SIZE + bpf_tailcall_prologue_size));
> +	EMIT(PPC_RAW_MTCTR(bpf_to_ppc(TMP_REG_2)));
> +
>   	/*
>   	 * Before writing updated tail_call_info, distinguish if current frame
>   	 * is storing a reference to tail_call_info or actual tcc value in
> @@ -539,24 +560,6 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
>   	/* Writeback updated value to tail_call_info */
>   	EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_2), 0));
>   
> -	/* prog = array->ptrs[index]; */
> -	EMIT(PPC_RAW_MULI(bpf_to_ppc(TMP_REG_1), b2p_index, 8));
> -	EMIT(PPC_RAW_ADD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), b2p_bpf_array));
> -	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), offsetof(struct bpf_array, ptrs)));
> -
> -	/*
> -	 * if (prog == NULL)
> -	 *   goto out;
> -	 */
> -	EMIT(PPC_RAW_CMPLDI(bpf_to_ppc(TMP_REG_1), 0));
> -	PPC_BCC_SHORT(COND_EQ, out);
> -
> -	/* goto *(prog->bpf_func + prologue_size); */
> -	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), offsetof(struct bpf_prog, bpf_func)));
> -	EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1),
> -			FUNCTION_DESCR_SIZE + bpf_tailcall_prologue_size));
> -	EMIT(PPC_RAW_MTCTR(bpf_to_ppc(TMP_REG_1)));
> -
>   	/* tear down stack, restore NVRs, ... */
>   	bpf_jit_emit_common_epilogue(image, ctx);
>   

Tested this by patch, Please add below tag.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.



