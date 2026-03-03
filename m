Return-Path: <linuxppc-dev+bounces-17579-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOVnF1b3pmmgawAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17579-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 15:59:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2841F1EB5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 15:59:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQJqQ27brz3bnr;
	Wed, 04 Mar 2026 01:59:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772549970;
	cv=none; b=ONQKpGssHXRZFYZP96jqZUETeVrwcf2KZA8LAJvzDtEgAbxnsLNh4HLNwkqUnbgzaEf1yqmb7o6sClCJJSs4wPR8f8RqoXNpcGfbJ80P3uXtYJzo39erqcSDPyw4cZMxmWxTfCcG1NjTTq+BFzfb3kejUZoDv8zRghcpqAChjOeW8kd1hjfe5A4o5Z4bIUGLod7GNA/nhIL+Tj+DZ4FZzgMr1W0ZuB4lJ/DQAk+0qVQujfbqaFZmm8HhR1Fyc2O2U5goKM1H6syCfemnVcHr77dsVMJCdnZKLRUlrFHZDKrUy07Q5t5VGis7ZBrUPlxU8PGFRlEoZUKPcAkpifMHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772549970; c=relaxed/relaxed;
	bh=L3ODhxKhXKAZO7Qt/XBU+6JDWqfCEUC3cU3LlDcofqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEE7wMWreJZpLmqU1sBf5iyO1RM0m55oaBgTugOoS1+dDpNT8i5qdBxdjdzeRcx9XlJRF32vLpWmTPNvCopBFYoumUZ1hURjsQb5l/JYE9W8KLx40BZIt7qly/26XjYm0pdWnpmqt657s7i8Nfj+lWaFZKHRAcTqGeY/2Nj/ojWW+VNIbzp/a/kI1OL+l/+qWEjx/8V9whNwuBXxc8pf9mBceXaeV1pRenhumKKJvqWPbghh7fg1BXGbkdrTn+LkpasovoTPq2bwc0h5IiYz2RDByFVTZv7MQPei141EbSdiQsuQpbRGbP+ZDsOk6GCPxeRQQ32hb2Ohnbp7PSvDzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GVyV580I; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GVyV580I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQJqN6sHNz30Lw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 01:59:28 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62318Jtl1528090;
	Tue, 3 Mar 2026 14:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=L3ODhxKhXKAZO7Qt/XBU+6JDWqfCEU
	C3cU3LlDcofqQ=; b=GVyV580IL1plO6OVvHgFBibi2SYBUYbLHRKt/PW6RAKIX8
	ZNxSHFUAPTjcGor8439GSbAcRWABCzrCl4KWVYgeidJiqhTKKRLYmrlxZ/lC112r
	BhE7GClvSJqH1EwCTMxKxAjiDt0HT//j7di0r2UsuUYk9yYkWYKNyyY+NVKq3iGs
	WnkSNQ5k0FGQw5D7PKikzwzZneAwwbpxQgshIz15CJKYT3yyOQIcE9hVGcPVqABv
	TqZQfevDM4KizvZ1IuJ93bbdUYIdWo7VJtyQV0wFNB9akdl1wFLorEfFm6mp6qMk
	SJd1PI85FGQmFATC/AgjpzE0b5y33gtB25fVeGdg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckssmk87x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 14:58:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 623DdaQK003266;
	Tue, 3 Mar 2026 14:58:35 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmb2y2wmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 14:58:35 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 623EwUwZ10420604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 14:58:31 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E206720043;
	Tue,  3 Mar 2026 14:58:30 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8EED20040;
	Tue,  3 Mar 2026 14:58:27 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.39.17.34])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  3 Mar 2026 14:58:27 +0000 (GMT)
Date: Tue, 3 Mar 2026 20:28:25 +0530
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: Viktor Malik <vmalik@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Joe Perches <joe@perches.com>, Paul Mackerras <paulus@ozlabs.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        atrajeev@linux.ibm.com, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH] powerpc, perf: Check that current->mm is alive before
 getting user callchain
Message-ID: <aab3EW1LfDcjSzzy@linux.ibm.com>
References: <20260227082502.1882395-1-vmalik@redhat.com>
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
In-Reply-To: <20260227082502.1882395-1-vmalik@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDExNiBTYWx0ZWRfX7Dd5Z/y41l1k
 /SANOxAC4+lXSdqZ/hRQjt/rCdE0vlzSV9k5GEwsQytQqj9Xb3FfO1ozUNbIevCPZIYOCzZx9r9
 SXg5H1so7/1H/rVedql1FhxwaWehZlodp2DZDdLSYLzJnpR12H3+k7sHSB4va77oCbzQcWyjjrz
 yGmu+19DwOhl8hvpyehjq5rqvi46pn9S2OiMQsIRCxrQF2boFqTyiuS0crXgniwwEFsHBjzCMtl
 dcBmaV+nQrgBslGy8lWfs+21Gu6ZIpeTLL2lACDe1cK75+7oG3W/5bIlFUuCXmf5yyfc3sgg4C/
 b3WG/OGZ7IUVtUtkWw1f59K6maaROmy6t2pcCUi62O2UfNVy73v+8KTHykxcHoIp2qeL2kx6M+m
 INmC7RiOl73qOqZc5mf16/VK3SAwyJ4RWc+bj4BezxVf8+8FE5jOLLJyTlPkwUHRgux+FMpr6TX
 uSC+upSrXyOdQ63nSDg==
X-Proofpoint-ORIG-GUID: UxO3AEXIgiJCB3nAkpq02ep1r8COpOQz
X-Proofpoint-GUID: fEH3ii7yaMN7S0fzhhWOkdXCFhxb0nm0
X-Authority-Analysis: v=2.4 cv=AobjHe9P c=1 sm=1 tr=0 ts=69a6f71c cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=e-EAHXkKvpEb-08ajsIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1011 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030116
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: DC2841F1EB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,perches.com,ozlabs.org,kernel.crashing.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-17579-lists,linuxppc-dev=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	FORGED_SENDER(0.00)[skb99@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:vmalik@redhat.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:joe@perches.com,m:paulus@ozlabs.org,m:benh@kernel.crashing.org,m:atrajeev@linux.ibm.com,m:linux-perf-users@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bpf@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[skb99@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 09:25:02AM +0100, Viktor Malik wrote:
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
> Fixes: 20002ded4d93 ("perf_counter: powerpc: Add callchain support")
> Signed-off-by: Viktor Malik <vmalik@redhat.com>
> ---
>  arch/powerpc/perf/callchain_32.c | 3 +++
>  arch/powerpc/perf/callchain_64.c | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
> index ddcc2d8aa64a..b46e21679566 100644
> --- a/arch/powerpc/perf/callchain_32.c
> +++ b/arch/powerpc/perf/callchain_32.c
> @@ -144,6 +144,9 @@ void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
>  	sp = regs->gpr[1];
>  	perf_callchain_store(entry, next_ip);
>  
> +	if (!current->mm)
> +		return;
> +
>  	while (entry->nr < entry->max_stack) {
>  		fp = (unsigned int __user *) (unsigned long) sp;
>  		if (invalid_user_sp(sp) || read_user_stack_32(fp, &next_sp))
> diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
> index 115d1c105e8a..eaaadd6fa81b 100644
> --- a/arch/powerpc/perf/callchain_64.c
> +++ b/arch/powerpc/perf/callchain_64.c
> @@ -79,6 +79,9 @@ void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
>  	sp = regs->gpr[1];
>  	perf_callchain_store(entry, next_ip);
>  
> +	if (!current->mm)
> +		return;
> +
>  	while (entry->nr < entry->max_stack) {
>  		fp = (unsigned long __user *) sp;
>  		if (invalid_user_sp(sp) || read_user_stack_64(fp, &next_sp))
> -- 
> 2.53.0
> 
Sorry, I missed adding cc list for the last conversation so adding this for reference:

> Wouldn't be good if we check this in perf_callchain_user() as it will
> cover both cases.

to which Viktor replied:
I considered it but in that case, we'd also miss the top-level stack
frame (the perf_callchain_store call above). Other arches include it so
I followed the behavior for powerpc.

Viktor, agreed with your first point. I have another concern:

I was hitting this issue with stacktrace_build_id_nmi in bpf and
applied this patch https://lore.kernel.org/bpf/20260126074331.815684-1-chen.dylane@linux.dev/T/#mf901967ebe77506f1bd6e3d876c2a85824d9519d

Wondering if the above generic fix is working do we need to add this
check in powerpc specific code?

Thanks,
Saket

