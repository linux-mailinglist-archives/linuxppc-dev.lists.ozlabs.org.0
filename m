Return-Path: <linuxppc-dev+bounces-17916-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJheMbr1rmnZKgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17916-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 17:30:50 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8BA23CB96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 17:30:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV2Yr6ww4z3cB0;
	Tue, 10 Mar 2026 03:30:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773073840;
	cv=none; b=OSab8OsK+sZD5OJjDcTpDtVIMnnqi82/AiDjTx12yF93qN+Mdj2tZbmfI1jW9BgJr/XqZAtSXHfXxw6P6kw1ViA4zK5/a27nh2XYnyT4G/i/yjEfG+s5+XSLDOMzTtoj30bnOoYnyl6CdbDFAg6LgJ/pt69R4gINP1Fizqky/1CNWainDqprgMw4nIXU93zI1Nz6h5zXWB1EGWITNFo0yvxkbTVVzeIQGWyYge3NsfTK0Ou/f92zXCfkrOrrwg1bZDFHNdI+YEcvm0qehO6BhcJCTtrxQdIc5yJdRUXdZp5ir3vVUb7Iz2lClSPNhZoY6In1c8u9wv7d8tqB9Ugwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773073840; c=relaxed/relaxed;
	bh=u9Jv1xiXDQhoRB+qsZiT314gW/jnX6o87tkiSY3Qjbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nM4LgRw/wJ0dabZ+QLkCkVacMWDD25NzwzR1xEIi5LMdXs0xjtQTD7rgb3KCJqlCdjhKyJVQBXL4CY1NYYdB7yLXJ6A+RtP2gFlf9q/bCsFVR2CdeaetLOi7nNPwKiwgzebHQjfKC/t/dyHfZYvX27nZSQ+nFIyI9sDucBDr1h40+m7Sods5MNoRKtzHDKvzAcCaBDKSc1k7uQTrckxbBpx/5r/FSCkIJI9hX9/Qlk1YdU6WPElFrgVGR5KFt+YJ1wQ5cN0iKxz9syPWev9eyG7dwbzOSZ3gBqalmoibEbrz5dl9Hu+ykFI0KMR+TY9tA8f0oIWIhMyAsFaIuoMdjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MuKabqMb; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MuKabqMb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV2Yq4wyPz3c9l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 03:30:38 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629F7tiO1275175;
	Mon, 9 Mar 2026 16:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=u9Jv1xiXDQhoRB+qsZiT314gW/jnX6
	o87tkiSY3Qjbw=; b=MuKabqMb+xg6/RZCHxRCXFEhM9L9ve9Xxh4PMw3nBl3eG0
	F9ctw5HrR8mjlBWQYjxv6HhHolpryanLaJteXF35v/6fSu0bCIGpvNyFJOmaVrxx
	ZmOCRYP4sZemqEYFRE0rulWPTV/DbxcY4EA2JGJdp3rmljszBf3GW4gAN4Zt/Q5z
	K+z3U32Inmwo4q0ZMUXhIaP1BBEgWUUFpzaO7gLt2T/JCfIAn94mFwy9Iyo1Tad0
	Cg3FQPMrqzBmvC2YgqjRylLfjYZdptzWavm/uuss9NEdgBRqixSNWLjYmLbiOcWP
	VPfxlMBoJcwv2Sg/DPeDUA1+qF9eEvtJpxrYqKCQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcvr78cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 16:29:56 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 629DNmZo021181;
	Mon, 9 Mar 2026 16:29:55 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4crxbsnukt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 16:29:55 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 629GTsri56885708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Mar 2026 16:29:54 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 03D7520043;
	Mon,  9 Mar 2026 16:29:54 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 44A8E20040;
	Mon,  9 Mar 2026 16:29:51 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.124.216.7])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  9 Mar 2026 16:29:51 +0000 (GMT)
Date: Mon, 9 Mar 2026 21:59:48 +0530
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: Viktor Malik <vmalik@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@ozlabs.org>, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2] powerpc, perf: Check that current->mm is alive before
 getting user callchain
Message-ID: <aa71fOBjQwvCFFNq@linux.ibm.com>
References: <20260309144045.169427-1-vmalik@redhat.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309144045.169427-1-vmalik@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE0NSBTYWx0ZWRfX+rjeGaeASbO2
 DRRCfL+CMorHO5ng1qGUas6J8JvgX5kk/akDTzG+WtfiXrtQPT337K5va/I6ATguS1jUcTGEzH+
 1qUEdOzZBCz8pZoFVqPQE09RWTe9C2CD2iBQySe1f/IjXU2FOEs+WMIyxZ5I/CNi7OUokx7MGRr
 ftoeP5tRJ1019lbSHRewSQ4jQXpPBJ9y2fZTZMqX2q8ZAZGqYrg4vWJjO9nMmDe884OBye9//WK
 o7c46o3MbT2VP1NjQ6u82nEMXLKlug+vWoX2qsrw4QH5vXXLzL++Z4Yh0Gor5EnSb0cyyuR3kEK
 iID65YQcNw8QuqYtIheYBhSBj9GOXivDtq5XhN/2nJ+L2GmR/zX0j49Hz9JiTrOVXdcQpH9L+sn
 ylSAOQIfC+dyoUZxr2omBDe1CasazDS71d3fBzHIg1hgGZk03AG6po7boYLsp+IK1VRK5fu5VsS
 u/bMuNFLnc+gZ6v7+Lg==
X-Proofpoint-GUID: AykpcraF3vgF-W4mHKIkLrlGlLQPY39P
X-Proofpoint-ORIG-GUID: 7ljpo1MiTfY3ZH2wBCg09610OOHkGqxF
X-Authority-Analysis: v=2.4 cv=QoFTHFyd c=1 sm=1 tr=0 ts=69aef585 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=20KFwNOVAAAA:8
 a=VnNF1IyMAAAA:8 a=e-EAHXkKvpEb-08ajsIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090145
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 9C8BA23CB96
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	TAGGED_FROM(0.00)[bounces-17916-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,kernel.crashing.org,ozlabs.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vmalik@redhat.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:benh@kernel.crashing.org,m:paulus@ozlabs.org,m:linux-perf-users@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bpf@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[skb99@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[skb99@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 03:40:45PM +0100, Viktor Malik wrote:
> It may happen that mm is already released, which leads to kernel panic.
> This adds the NULL check for current->mm, similarly to 20afc60f892d
> ("x86, perf: Check that current->mm is alive before getting user
> callchain").
> 
> I was getting this panic when running a profiling BPF program
> (profile.py from bcc-tools):
> 
>     [26215.051935] Kernel attempted to read user page (588) - exploit attempt? (uid: 0)
>     [26215.051950] BUG: Kernel NULL pointer dereference on read at 0x00000588
>     [26215.051952] Faulting instruction address: 0xc00000000020fac0
>     [26215.051957] Oops: Kernel access of bad area, sig: 11 [#1]
>     [...]
>     [26215.052049] Call Trace:
>     [26215.052050] [c000000061da6d30] [c00000000020fc10] perf_callchain_user_64+0x2d0/0x490 (unreliable)
>     [26215.052054] [c000000061da6dc0] [c00000000020f92c] perf_callchain_user+0x1c/0x30
>     [26215.052057] [c000000061da6de0] [c0000000005ab2a0] get_perf_callchain+0x100/0x360
>     [26215.052063] [c000000061da6e70] [c000000000573bc8] bpf_get_stackid+0x88/0xf0
>     [26215.052067] [c000000061da6ea0] [c008000000042258] bpf_prog_16d4ab9ab662f669_do_perf_event+0xf8/0x274
>     [...]
> 
> In addition, move storing the top-level stack entry to generic
> perf_callchain_user to make sure the top-evel entry is always captured,
> even if current->mm is NULL.
> 
> Fixes: 20002ded4d93 ("perf_counter: powerpc: Add callchain support")
> Signed-off-by: Viktor Malik <vmalik@redhat.com>
> ---
> Changes in v2:
> - Move call to perf_callchain_store() for the top-level stack entry to
>   common perf_callchain_user (Saket)
> 
>  arch/powerpc/perf/callchain.c    | 5 +++++
>  arch/powerpc/perf/callchain_32.c | 1 -
>  arch/powerpc/perf/callchain_64.c | 1 -
>  3 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
> index 26aa26482c9a..992cc5c98214 100644
> --- a/arch/powerpc/perf/callchain.c
> +++ b/arch/powerpc/perf/callchain.c
> @@ -103,6 +103,11 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
>  void
>  perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
>  {
> +	perf_callchain_store(entry, perf_arch_instruction_pointer(regs));
> +
> +	if (!current->mm)
> +		return;
> +
>  	if (!is_32bit_task())
>  		perf_callchain_user_64(entry, regs);
>  	else
> diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
> index ddcc2d8aa64a..0de21c5d272c 100644
> --- a/arch/powerpc/perf/callchain_32.c
> +++ b/arch/powerpc/perf/callchain_32.c
> @@ -142,7 +142,6 @@ void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
>  	next_ip = perf_arch_instruction_pointer(regs);
>  	lr = regs->link;
>  	sp = regs->gpr[1];
> -	perf_callchain_store(entry, next_ip);
>  
>  	while (entry->nr < entry->max_stack) {
>  		fp = (unsigned int __user *) (unsigned long) sp;
> diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
> index 115d1c105e8a..30fb61c5f0cb 100644
> --- a/arch/powerpc/perf/callchain_64.c
> +++ b/arch/powerpc/perf/callchain_64.c
> @@ -77,7 +77,6 @@ void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
>  	next_ip = perf_arch_instruction_pointer(regs);
>  	lr = regs->link;
>  	sp = regs->gpr[1];
> -	perf_callchain_store(entry, next_ip);
>  
>  	while (entry->nr < entry->max_stack) {
>  		fp = (unsigned long __user *) sp;
> -- 
> 2.53.0
LGTM, feel free to add below tag:
Reviewed-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
> 

