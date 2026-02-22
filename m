Return-Path: <linuxppc-dev+bounces-17009-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJ9eIKz/mmlKpQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17009-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 14:07:56 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9924C16F1F3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 14:07:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fJkmm68yRz30T8;
	Mon, 23 Feb 2026 00:07:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771765672;
	cv=none; b=e9n7hDMMAOn+ezwQ+p+Crr/UFQXcyST4NalQCBQd3uAdOBBYzq5JNn0VQHIYrtlFcTfXHzQtmL0rs0jsVddXCC8brKhur1Df6BtL8UIV152XZrG/dCAc/szbKGCIoXLdiGOoF0yCsWZYz+rKaxiAfsxv792bjdV+3P1rt++sgtFcUiWbRK8YQ9Obid+GUiCUK55UTZd+JNoaKlImJEGWYQuH0N4EmxSL4JXhaRxLfz86g+VDqLt8GikPY0R7iJIGtxGoHystcX5st1vMY21aUc9atqEPI/gStp5aJBOUtIOigOBI4PWriDPYair8w5uhGWu0MpD5TT6W6mTHPznJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771765672; c=relaxed/relaxed;
	bh=WmJ4JuXeOZ1GuAGOjZblCGapDVUhPAA+kvkexcJSHVA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=mwSRaDV41nVgxNmIxsICgnM10QhvEZ8R/GNEoMJeXI0W2YxU34s4Jsryb+zucuQucmHVOxxSRbGBjnyZmtKSxF7KfEr6crFNgRq9fqgPh2OtZgowZyI6WFVVQuxyvrV/b4JXi2RdjcGIeG0uB7/FaeqjUhHDl8X/fbNy6Tlub/3teaUJ0VWoQwv8EYvxqPIZlQGvgc+UcAeD9nNWyAUs6iUwxVNB3PqMUgJmSPYOvJefFv7aeoedxUX8fJ38/FcTNoZjs5oKhYVaofEBnN9GPFwgfwWvzCYGBOwwI3lNg+p1Nt8DorlQyCa5XsxG78K6wXemyiomwUrj/W6/KRgRlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AZZQDAld; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AZZQDAld;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fJkmm06rPz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 00:07:51 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61M9oWBb1234657;
	Sun, 22 Feb 2026 13:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WmJ4Ju
	XeOZ1GuAGOjZblCGapDVUhPAA+kvkexcJSHVA=; b=AZZQDAldm4b4vDiuk49t8a
	5w9tVynXET+YrPbW4WIqvWS2eOyf9CVM1dsC6cbVw14IvIKnOr4Gx2ZtsQg/p6bC
	ttJXttwF+fxRoQbZorLdgtbm9ZOANJrKCnA/t60VYNxIQMVWqwbOBhwWMxiSgalB
	CiE6fQR4qOiHgaOjk+S+TkuheYhTr5lRlcRXmQUs4ScQt0ORjsgQFpGGrSDjssch
	2ARmrrAkzGrokZ+cM04Nr1ppO1w9k4Nw+/2V+7Qjr/msVnoQPAnj3kEV7Eflp1fT
	AzZ8yUkMuXNgBXQcrmrpBbfW4WcQn9Pox7xIVX9JdKg844X0qEsJLr5QrYlWqRTw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4cqm04g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Feb 2026 13:07:36 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61MA35d1003413;
	Sun, 22 Feb 2026 13:07:35 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfs8jh8as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Feb 2026 13:07:35 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61MD7XoZ50135522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Feb 2026 13:07:33 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63A3058052;
	Sun, 22 Feb 2026 13:07:33 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF84158056;
	Sun, 22 Feb 2026 13:07:32 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 22 Feb 2026 13:07:32 +0000 (GMT)
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
Date: Sun, 22 Feb 2026 18:37:32 +0530
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
 Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH v2 3/5] powerpc64/bpf: use consistent tailcall offset in
 trampoline
In-Reply-To: <20260220063933.196141-4-hbathini@linux.ibm.com>
References: <20260220063933.196141-1-hbathini@linux.ibm.com>
 <20260220063933.196141-4-hbathini@linux.ibm.com>
Message-ID: <2f33ecbbe8272184111c5406d167b6b0@linux.ibm.com>
X-Sender: adubey@linux.ibm.com
Organization: IBM
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zimw1UcenesGq_9vDw0hsCmB7TgGwsmh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDEyMiBTYWx0ZWRfX6hPz8RpSoNj4
 xaHI7LmAV2lfvUUPTG/ShJ9Hs4j34gqqwg2mvVmDscwNa3iFUgJ8FAJIvJyOVGzEITXVRr88/hs
 xlXCWZV4irjIUrZ2qRj9pYmDqYcDA5PnIS26u54azCun2JN7aSU0BT5Z3UmAGXWbs2TpcAmzang
 tVDZH2JBOofgCV5yK2+bWtk4WpLcjaxg+m1nMxp2bPrHpcTdwf0iL7EbKbLZDcyYXpUB9Dpnf4F
 0XZXexeBfPtGL9QHVSHSWa6lblyT2sSYEHUqF3vMLP3maDSzROrf5OLRVBue8qCi1HuLMA8qA4H
 MCPgGs/B/mlysyZuBSNvfT8TnuBsmc+GaEq5nnYwfmU29wB4KBMbe+hJ6FPp6EO/UhYFRl7ydxf
 DRPOXc+AA/irXFyu8AwPeXe6SOKE9yKJwsJP4KQZtSqmoC+pekQtC52Fh7pA7NaPNSH3+vNdVPV
 b7eXedZf0qsQ6MWyNpA==
X-Proofpoint-GUID: zimw1UcenesGq_9vDw0hsCmB7TgGwsmh
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=699aff98 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8
 a=i829aTDIuGoFdt9u9B4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602220122
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17009-lists,linuxppc-dev=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	FORGED_SENDER(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:bpf@vger.kernel.org,m:maddy@linux.ibm.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:skb99@linux.ibm.com,m:venkat88@linux.ibm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9924C16F1F3
X-Rspamd-Action: no action

On 2026-02-20 12:09, Hari Bathini wrote:
> Ideally, the offset used to load the tail call info field and to find
> the pass by reference address for tail call field should be the same.
> But while setting up the tail call info in the trampoline, this was
> not followed. This can be misleading and can lead to unpredictable
> results if and when bpf_has_stack_frame() ends up returning true
> for trampoline frame. Since commit 15513beeb673 ("powerpc64/bpf:
> Moving tail_call_cnt to bottom of frame") and commit 2ed2d8f6fb38
> ("powerpc64/bpf: Support tailcalls with subprogs") ensured tail call
> field is at the bottom of the stack frame for BPF programs as well as
> BPF trampoline, avoid relying on bpf_jit_stack_tailcallinfo_offset()
> and bpf_has_stack_frame() for trampoline frame and always calculate
> tail call field offset with reference to older frame.

It's good to add comment about padding field placed after tailcall_info
in the trampoline stack layout. Visibly padding is following 
tailcall_info
but tailcall_info is bottom-most field. Clear comment around this
will be really helpful.

> 
> Fixes: 2ed2d8f6fb38 ("powerpc64/bpf: Support tailcalls with subprogs")
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
> 
> Changes since v1:
> * Fixed spelling error in changelog.
> * Fixed a comment in bpf_trampoline_setup_tail_call_info().
> 
> 
>  arch/powerpc/net/bpf_jit.h        |  5 -----
>  arch/powerpc/net/bpf_jit_comp.c   | 12 +++++-------
>  arch/powerpc/net/bpf_jit_comp64.c |  5 ++++-
>  3 files changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 82bbf63f0e57..7354e1d72f79 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -81,9 +81,6 @@
> 
>  #ifdef CONFIG_PPC64
> 
> -/* for gpr non volatile registers BPG_REG_6 to 10 */
> -#define BPF_PPC_STACK_SAVE	(6 * 8)
> -
>  /* If dummy pass (!image), account for maximum possible instructions 
> */
>  #define PPC_LI64(d, i)		do {					      \
>  	if (!image)							      \
> @@ -219,8 +216,6 @@ int bpf_jit_emit_exit_insn(u32 *image, struct
> codegen_context *ctx, int tmp_reg,
>  int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32
> *fimage, int pass,
>  			  struct codegen_context *ctx, int insn_idx,
>  			  int jmp_off, int dst_reg, u32 code);
> -
> -int bpf_jit_stack_tailcallinfo_offset(struct codegen_context *ctx);
>  #endif
> 
>  #endif
> diff --git a/arch/powerpc/net/bpf_jit_comp.c 
> b/arch/powerpc/net/bpf_jit_comp.c
> index fb6cc1f832a8..860b118391ed 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -642,15 +642,13 @@ static void
> bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_conte
>  						int bpf_dummy_frame_size, int r4_off)
>  {
>  	if (IS_ENABLED(CONFIG_PPC64)) {
> -		/* See Generated stack layout */
> -		int tailcallinfo_offset = BPF_PPC_TAILCALL;
> -
>  		/*
>  		 * func_frame_offset =                                   ...(1)
>  		 *      bpf_dummy_frame_size + trampoline_frame_size
>  		 */
>  		EMIT(PPC_RAW_LD(_R4, _R1, func_frame_offset));
> -		EMIT(PPC_RAW_LD(_R3, _R4, -tailcallinfo_offset));
> +		/* Refer to trampoline's Generated stack layout */
> +		EMIT(PPC_RAW_LD(_R3, _R4, -BPF_PPC_TAILCALL));
> 
>  		/*
>  		 * Setting the tail_call_info in trampoline's frame
> @@ -658,7 +656,7 @@ static void
> bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_conte
>  		 */
>  		EMIT(PPC_RAW_CMPLWI(_R3, MAX_TAIL_CALL_CNT));
>  		PPC_BCC_CONST_SHORT(COND_GT, 8);
> -		EMIT(PPC_RAW_ADDI(_R3, _R4, 
> bpf_jit_stack_tailcallinfo_offset(ctx)));
> +		EMIT(PPC_RAW_ADDI(_R3, _R4, -BPF_PPC_TAILCALL));
>  		/*
>  		 * From ...(1) above:
>  		 * trampoline_frame_bottom =                            ...(2)
> @@ -666,14 +664,14 @@ static void
> bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_conte
>  		 *
>  		 * Using ...(2) derived above:
>  		 * trampoline_tail_call_info_offset =                  ...(3)
> -		 *      trampoline_frame_bottom - tailcallinfo_offset
> +		 *      trampoline_frame_bottom - BPF_PPC_TAILCALL
>  		 *
>  		 * From ...(3):
>  		 * Use trampoline_tail_call_info_offset to write reference of main's
>  		 * tail_call_info in trampoline frame.
>  		 */
>  		EMIT(PPC_RAW_STL(_R3, _R1, (func_frame_offset - 
> bpf_dummy_frame_size)
> -								- tailcallinfo_offset));
> +								- BPF_PPC_TAILCALL));
>  	} else {
>  		/* See bpf_jit_stack_offsetof() and BPF_PPC_TC */
>  		EMIT(PPC_RAW_LL(_R4, _R1, r4_off));
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c
> b/arch/powerpc/net/bpf_jit_comp64.c
> index 44ce8a8783f9..5d4d2bb23cef 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -42,6 +42,9 @@
>   * exception boundary.
>   */
> 
> +/* BPF non-volatile registers save area size */
> +#define BPF_PPC_STACK_SAVE	(6*8)
Please maintain space beside *, suggested by Christophe in tailcall 
reviews
> +
>  /* for bpf JIT code internal usage */
>  #define BPF_PPC_STACK_LOCALS	24
>  /*
> @@ -148,7 +151,7 @@ static int bpf_jit_stack_local(struct 
> codegen_context *ctx)
>  	}
>  }
> 
> -int bpf_jit_stack_tailcallinfo_offset(struct codegen_context *ctx)
> +static int bpf_jit_stack_tailcallinfo_offset(struct codegen_context 
> *ctx)
>  {
>  	return bpf_jit_stack_local(ctx) + BPF_PPC_STACK_LOCALS + 
> BPF_PPC_STACK_SAVE;
>  }
-Abhishek

