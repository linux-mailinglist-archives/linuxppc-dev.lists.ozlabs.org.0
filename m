Return-Path: <linuxppc-dev+bounces-17036-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOWsExYYnGmq/gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17036-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:04:22 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5858A173790
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:04:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKFKH08pnz3bW7;
	Mon, 23 Feb 2026 20:04:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771837458;
	cv=none; b=PMC1fXTF0o7NIWhUOg+1gNFhdbnSyBenTa2UULFNxFUj4CZGXaeBNS5MHYm+J+dOsSYPcpi7XYzC1wYZR1AlHzLt3XD0pn2WOakAyD+eZrL8hVdEIuHWyOyPNE97E/UPIM0aDrbuI2ArTWKneHhhtdpV15wy1xJca7OPkk7yV7xPgIyUYxhIVp2PAHQIwadJYhpJ9GW4KDzy5hebhwNIsnDDXMmiXY052g7PfcRj9VnInZ1QzKKgg7TEc1AzKzaXqnEXWtODdjwmQdDwRH5mi/RIcukGWkFwAgmuRpp4DhtCMEtEi0IT0QNuE28Q3vy4ewjQEsu/EgHQFpFlf0awCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771837458; c=relaxed/relaxed;
	bh=JTzeo56ofnO4Sb1kOjQ4dmeNRcTLOOQ9A1ufQTFU4vg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=fUvl1FeEmgmUAFYuGVG47ItYF4k411LiGpc3O7/Xep/r26PiOu6+CwYDylmpuEuwr0fF14SZSptxdc5V9twWQVgztHuYwfho4F6kOCpVSkoLva8Hg4naiwT1fjnBwPLNAHLR7K1frqh0gnP3GljzuQ2wRfLOnayO+ISQd97Mc/126zT+NiKs6y1srzyNgjS7kLGDAUWnNtdzrtzlXdP9IrKhRaGpB502W/NVDxQQ3PkFBjkECMILis2gxlEO521u9qhrAb/aq20pGJj9zzYZXcNlo+IO7YtrIcJJAoUcyumYaYDJXLuOW6TpjQrr2BEUCBgy/ZETnldXoyYBoqdj1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DuRwU3RI; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DuRwU3RI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKFKG06X3z30hq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:04:17 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N2F4xg3039399;
	Mon, 23 Feb 2026 09:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JTzeo5
	6ofnO4Sb1kOjQ4dmeNRcTLOOQ9A1ufQTFU4vg=; b=DuRwU3RIdrfjqTFzV2tGNm
	1Qye3LionD+dISppZJo7EjQQJqiuQ4ltBezN4gXQhkqw/t+cJhMDQg3xHrk6PEDX
	ZopMolBlr9Ehy8kRQydOKCcxKpnOXNsMAhSfXrQpbJiF4H1Nmh2G3thYr+M5VdK4
	4JYinsAdYSuOF65EPiYC55xCWU+wqQAk/gk2Pzg85FscJMRLZSpjHC2M6fFv9AD2
	c/yBbT5XBUsKJUMR/REnzdPsocygMPhEjKGpY8H6+fZyHAFFypmIaKLdCLBU7Q0P
	NlpEFEouZ8kGL69dvl309DrfKwPPuxmFM1X8wvNgxkgXCKPFbzTC4gohxk+oCupg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4cqpds2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 09:04:03 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61N4kjxi013431;
	Mon, 23 Feb 2026 09:04:02 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfqdxv6eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 09:04:02 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61N940Rp59965784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Feb 2026 09:04:00 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72AE258056;
	Mon, 23 Feb 2026 09:04:00 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D95BE5803F;
	Mon, 23 Feb 2026 09:03:59 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Feb 2026 09:03:59 +0000 (GMT)
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
Date: Mon, 23 Feb 2026 14:33:59 +0530
From: adubey <adubey@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexei Starovoitov
 <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko
 <andrii@kernel.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Venkat Rao
 Bagalkote <venkat88@linux.ibm.com>, bot+bpf-ci@kernel.org
Subject: Re: [PATCH v2 5/5] powerpc64/bpf: fix handling of BPF stack in
 exception callback
In-Reply-To: <20260220063933.196141-6-hbathini@linux.ibm.com>
References: <20260220063933.196141-1-hbathini@linux.ibm.com>
 <20260220063933.196141-6-hbathini@linux.ibm.com>
Message-ID: <7be71e61b6e9c522b03f96b1c4158b53@linux.ibm.com>
X-Sender: adubey@linux.ibm.com
Organization: IBM
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: J6pr6XHSEEjow3S1ar9JVaGzmPK67XBI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA3NiBTYWx0ZWRfX/hVaKrtSBBs2
 oYHPok+3uxtYFmWZ7XvL4G9zJTcnQ0KGYa7NPVInOp/wd2Ets1Z6npqgMeBM7oyzLXuCzlKpaOl
 zxLzp0HdV+5vc6MDaV7Rdh12ms2Qd9/LKtKKjK5Kt2JkIJuRPoBRQ4Cw8NR4CVaXbmnw9v5Zdca
 XtVf91VBRZdKsRY9nJjRGgMxc9cNgcceqg3XDnTRutJdhCVq0ydcIf+1NHcCMxdfc/bXsp1+ed7
 B0X4dZExdYJrNDAqlLyzvP6gmStV3vp+tpnPNQ/mGo1JZT6pjxjQTPJbBORSDrq32VMsXiHf7lw
 vq7eY93A9l5MZ6nGku2YxwR9mRsEhwocwqnPXgncgCXSGhRlz/LQ2A5juB+pPJAA/IGZwdlWlvN
 5A6QVQtqZ7gC2n38Jt4j4axQtJ2vkzJEwwlztXSVYGItKua+g2eUZK0LrKJ49zc/2FiZ+OTR9T2
 tQrslq5hRs8kvJd+GJg==
X-Proofpoint-GUID: J6pr6XHSEEjow3S1ar9JVaGzmPK67XBI
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=699c1803 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=fyT9QdyRjCnhUi2qYUoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602230076
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17036-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:bpf@vger.kernel.org,m:maddy@linux.ibm.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:skb99@linux.ibm.com,m:venkat88@linux.ibm.com,m:bot+bpf-ci@kernel.org,m:bot@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,bpf-ci];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5858A173790
X-Rspamd-Action: no action

On 2026-02-20 12:09, Hari Bathini wrote:
> Exception callback reuses the stack frame of exception boundary. When
> exception boundary and exception callback programs have different BPF
> stack depth, the current stack unwind in exception callback will fail.
> Adjust the stack frame size of exception callback, in its prologue,
> if its BPF stack depth is different from that of exception boundary.
> 
> Reported-by: bot+bpf-ci@kernel.org
> Closes:
> https://lore.kernel.org/bpf/2a310e86a59eb4c44c3ac9e5647814469d9c955580c9c0f1b3d9ca4a44717a34@mail.kernel.org/
> Fixes: 11d45eee9f42 ("powerpc64/bpf: Additional NVR handling for 
> bpf_throw")
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
> 
> Changes since v1:
> * Fixed incorrect use of PPC_RAW_SUB() as pointed out by
>   bot+bpf-ci@kernel.org.
> 
> 
>  arch/powerpc/net/bpf_jit_comp64.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c
> b/arch/powerpc/net/bpf_jit_comp64.c
> index 5d4d2bb23cef..33b2a7fd9067 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -32,14 +32,15 @@
>   *
>   *		[	prev sp		] <-------------
>   *		[    tail_call_info	] 8		|
> - *		[   nv gpr save area	] 6*8 + (12*8)	|
> + *		[   nv gpr save area	] 6*8		|
> + *		[ addl. nv gpr save area] (12*8)	| <--- exception 
> boundary/callback program
>   *		[    local_tmp_var	] 24		|
>   * fp (r31) -->	[   ebpf stack space	] upto 512	|
>   *		[     frame header	] 32/112	|
>   * sp (r1) --->	[    stack pointer	] --------------
>   *
>   * Additional (12*8) in 'nv gpr save area' only in case of
> - * exception boundary.
> + * exception boundary/callback.
>   */
> 
>  /* BPF non-volatile registers save area size */
> @@ -128,12 +129,13 @@ static inline bool bpf_has_stack_frame(struct
> codegen_context *ctx)
>   *		[	  ...       	] 		|
>   * sp (r1) --->	[    stack pointer	] --------------
>   *		[    tail_call_info	] 8
> - *		[   nv gpr save area	] 6*8 + (12*8)
> + *		[   nv gpr save area	] 6*8
> + *		[ addl. nv gpr save area] (12*8) <--- exception boundary/callback 
> program
>   *		[    local_tmp_var	] 24
>   *		[   unused red zone	] 224
>   *
>   * Additional (12*8) in 'nv gpr save area' only in case of
> - * exception boundary.
> + * exception boundary/callback.
>   */
>  static int bpf_jit_stack_local(struct codegen_context *ctx)
>  {
> @@ -240,10 +242,6 @@ void bpf_jit_build_prologue(u32 *image, struct
> codegen_context *ctx)
> 
>  	if (bpf_has_stack_frame(ctx) && !ctx->exception_cb) {
>  		/*
> -		 * exception_cb uses boundary frame after stack walk.
> -		 * It can simply use redzone, this optimization reduces
> -		 * stack walk loop by one level.
> -		 *
>  		 * We need a stack frame, but we don't necessarily need to
>  		 * save/restore LR unless we call other functions
>  		 */
> @@ -287,6 +285,22 @@ void bpf_jit_build_prologue(u32 *image, struct
> codegen_context *ctx)
>  		 * program(main prog) as third arg
>  		 */
>  		EMIT(PPC_RAW_MR(_R1, _R5));
> +		/*
> +		 * Exception callback reuses the stack frame of exception boundary.
> +		 * But BPF stack depth of exception callback and exception boundary
> +		 * don't have to be same. If BPF stack depth is different, adjust 
> the
> +		 * stack frame size considering BPF stack depth of exception 
> callback.
> +		 * The non-volatile register save area remains unchanged. These non-
> +		 * volatile registers are restored in exception callback's epilogue.
> +		 */
> +		EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R5, 0));
> +		EMIT(PPC_RAW_SUB(bpf_to_ppc(TMP_REG_2), bpf_to_ppc(TMP_REG_1), 
> _R1));
> +		EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_2), bpf_to_ppc(TMP_REG_2),
> +			-BPF_PPC_EXC_STACKFRAME));
> +		EMIT(PPC_RAW_CMPLDI(bpf_to_ppc(TMP_REG_2), ctx->stack_size));
> +		PPC_BCC_CONST_SHORT(COND_EQ, 12);
Can we avoid resizing when boundary_stack is greater? I think it's safe, 
NVR will be intact anyway and any reference within bounds of larger 
size.
Any corner case possible?
> +		EMIT(PPC_RAW_MR(_R1, bpf_to_ppc(TMP_REG_1)));
> +		EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_EXC_STACKFRAME + 
> ctx->stack_size)));
Do we need to setup FP again? If I get it right, still the FP is 
pointing to older frame, any reference in
callback will resolve to old frame.
>  	}
> 
>  	/*
-Abhishek

