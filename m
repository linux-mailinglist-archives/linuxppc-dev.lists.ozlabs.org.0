Return-Path: <linuxppc-dev+bounces-17889-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNl5B6OprmntHQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17889-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 12:06:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7502378B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 12:06:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTvML4h3Yz3bnm;
	Mon, 09 Mar 2026 22:06:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773054366;
	cv=none; b=Y3nzcwxXnMRatmTh+2cTgxzpRQKLRoDXuQWC/5qlke8lG0QfFH8cEJMdFuMdMOugHzWh4kIFSQb+RDlPhdMo09IHp9yVm6ljzcm2O1H7hk+0s/Pl3ACqcKet3MpsR9SBkEG2tyL7eRvrwDNouUHVaAm7Yy/HRpKCGTFgRXV5UDNiEK7xPrsnHTx53YJBjQqd6sMDiqsdXWSRfS74EHliRRTCSndX1vpknkHOhaVGPcNjVEl8KvlCdk15aahYF37KZ4a6kwoY/An6dl3vtVZRsRhho4CQxnXy3hmHLvUiJUCvqkaSraHxaU0WSEncfxt0VghhXO5WvJnzHtVHkc6lUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773054366; c=relaxed/relaxed;
	bh=rpIXdQ6m8izsaZzFlwX9FzwEH7Tcoia9WGkEgx1Zq74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e33GK8TLzCFvR7OcrScO0dTWwk+GyRV6BhmYjuVUkp7p6nelhp6cch09HPsr7AQlh0E+ALHD/B7aX8/vBTt9kqKqE6QqK6OFytTnBsJAZayJM5VFXdMyi5YU6HFvb/sKSuu9mh1uEarZTab/kbX45GiZ7z5hAkz5tR2puBO9LP8nono6GlvlnNnSh1077Y9aHoDOOgdBH6KG0A59ph4HG6QwdFN+Y3hpkKE/D0/dTi4DodccFSzF0FX9P7ma2N9yHtAalmow0dzEcvHtzfVGJziFXffk2jFX9lrbOZz3PX2cpL+cnoXblysY4wVTzWwRnN80qf06s1j0JctmOhnJxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h3uUuO6P; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h3uUuO6P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTvMJ6wXMz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 22:06:04 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628MsJjq1613004;
	Mon, 9 Mar 2026 11:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=rpIXdQ6m8izsaZzFlwX9FzwEH7Tcoi
	a9WGkEgx1Zq74=; b=h3uUuO6PZc1Lc3NBXDEXwrVDHx50Tu+cMkcIiR+4gBzdVN
	tKcI0EyLTscM1pj9uTMooR4CGrh3IhJPt5YtWcKLcT7mQIZEFkk9uSvFjxkXARqS
	RjbdUEOT3SC+PnEST03T8KGcRjUgbsQYQVox+sVyuqtRaCh5REosiDQ9r1CVGhBo
	WHY0E2URPQB0bFcdAaeI44Sk0ivDO10iZEdmnSfY2N0D5TvnmaTxGmHGryL0KHni
	c7FNwkCPSeVyLNfMmhtxLl6Mur+B6H4Cy7mXfn4WH6LiNmkg1/GJTLyEeYXs6wSf
	655w2P18Zcf2IB6mWfTTHHjwVCBhsFtec9t72BFQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcvr60k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 11:05:18 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 629AhIu7024649;
	Mon, 9 Mar 2026 11:05:18 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cs0jjvfp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 11:05:17 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 629B5ETa31392438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Mar 2026 11:05:14 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29DF42004D;
	Mon,  9 Mar 2026 11:05:14 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0468220040;
	Mon,  9 Mar 2026 11:05:12 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.109.207.131])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  9 Mar 2026 11:05:11 +0000 (GMT)
Date: Mon, 9 Mar 2026 16:35:09 +0530
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
Message-ID: <aa6pZaDySMl9JGKf@linux.ibm.com>
References: <20260227082502.1882395-1-vmalik@redhat.com>
 <aab3EW1LfDcjSzzy@linux.ibm.com>
 <80766050-c745-411b-8ee6-8141d2cfe4ff@redhat.com>
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
In-Reply-To: <80766050-c745-411b-8ee6-8141d2cfe4ff@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMSBTYWx0ZWRfX9HRC0qNVEgfA
 bEUmuSVOi2BbDiiAWkeFZqtOIGjJvAHnAS9W6rAYwvm4QuLtM1zDIloqKxQHJLOBgu/saq1mIGM
 UfimMFy+EUqJ8bbqnX3zqm+hO/ftuXcyGQMHblLzKPSmZ00cFII1AWOVFZ0GgYJS14haQmAJLbN
 Z+T2SA+y4n87dnlBlEfKN1ArGrKavhOEPTkSEVq/FVn3bPkrU2kzplYNl4nTvh3vyOoQ+TzlPCL
 cB7Yol4zrQoUNSdD98rQFyDqP+L1vlucQ00RThHW5W+zGqhFe6Nyc4XtX/6QYNRkdFEMjDyWgGU
 brHURKwbga1dMbGOSQ7cOXtp7/y8ZU2stagjaPIzC32w1Y6qfeNYYlNga9WibYchAbr2ORm5p6Q
 hfuXsRQp/peJxAQFa0XfG6ll3QTnnGDDj8cXL22BJZSFDv3v5MkOAipgTPiLbO2KkpSO3cFtDjL
 Qx5tafzTDiq3w+9yCDg==
X-Proofpoint-GUID: zOXVtuDP8n-88aBUmjAnr0rW02vS92rk
X-Proofpoint-ORIG-GUID: ZHV80IJLcR6lIXaRXdAQ93ARIpmM0gGZ
X-Authority-Analysis: v=2.4 cv=QoFTHFyd c=1 sm=1 tr=0 ts=69aea96f cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=eEc1wmYC7BjqnX_VJ48A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090101
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 7D7502378B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,perches.com,ozlabs.org,kernel.crashing.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-17889-lists,linuxppc-dev=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[profile.py:url,linux.ibm.com:mid];
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
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 01:45:44PM +0100, Viktor Malik wrote:
> On 3/3/26 15:58, Saket Kumar Bhaskar wrote:
> > On Fri, Feb 27, 2026 at 09:25:02AM +0100, Viktor Malik wrote:
> >> It may happen that mm is already released, which leads to kernel panic.
> >> This adds the NULL check for current->mm, similarly to 20afc60f892d
> >> ("x86, perf: Check that current->mm is alive before getting user
> >> callchain").
> >>
> >> I was getting this panic when running a profiling BPF program
> >> (profile.py from bcc-tools):
> >>
> >>     [26215.051935] Kernel attempted to read user page (588) - exploit attempt? (uid: 0)
> >>     [26215.051950] BUG: Kernel NULL pointer dereference on read at 0x00000588
> >>     [26215.051952] Faulting instruction address: 0xc00000000020fac0
> >>     [26215.051957] Oops: Kernel access of bad area, sig: 11 [#1]
> >>     [...]
> >>     [26215.052049] Call Trace:
> >>     [26215.052050] [c000000061da6d30] [c00000000020fc10] perf_callchain_user_64+0x2d0/0x490 (unreliable)
> >>     [26215.052054] [c000000061da6dc0] [c00000000020f92c] perf_callchain_user+0x1c/0x30
> >>     [26215.052057] [c000000061da6de0] [c0000000005ab2a0] get_perf_callchain+0x100/0x360
> >>     [26215.052063] [c000000061da6e70] [c000000000573bc8] bpf_get_stackid+0x88/0xf0
> >>     [26215.052067] [c000000061da6ea0] [c008000000042258] bpf_prog_16d4ab9ab662f669_do_perf_event+0xf8/0x274
> >>     [...]
> >>
> >> Fixes: 20002ded4d93 ("perf_counter: powerpc: Add callchain support")
> >> Signed-off-by: Viktor Malik <vmalik@redhat.com>
> >> ---
> >>  arch/powerpc/perf/callchain_32.c | 3 +++
> >>  arch/powerpc/perf/callchain_64.c | 3 +++
> >>  2 files changed, 6 insertions(+)
> >>
> >> diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
> >> index ddcc2d8aa64a..b46e21679566 100644
> >> --- a/arch/powerpc/perf/callchain_32.c
> >> +++ b/arch/powerpc/perf/callchain_32.c
> >> @@ -144,6 +144,9 @@ void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
> >>  	sp = regs->gpr[1];
> >>  	perf_callchain_store(entry, next_ip);
> >>  
> >> +	if (!current->mm)
> >> +		return;
> >> +
> >>  	while (entry->nr < entry->max_stack) {
> >>  		fp = (unsigned int __user *) (unsigned long) sp;
> >>  		if (invalid_user_sp(sp) || read_user_stack_32(fp, &next_sp))
> >> diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
> >> index 115d1c105e8a..eaaadd6fa81b 100644
> >> --- a/arch/powerpc/perf/callchain_64.c
> >> +++ b/arch/powerpc/perf/callchain_64.c
> >> @@ -79,6 +79,9 @@ void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
> >>  	sp = regs->gpr[1];
> >>  	perf_callchain_store(entry, next_ip);
> >>  
> >> +	if (!current->mm)
> >> +		return;
> >> +
> >>  	while (entry->nr < entry->max_stack) {
> >>  		fp = (unsigned long __user *) sp;
> >>  		if (invalid_user_sp(sp) || read_user_stack_64(fp, &next_sp))
> >> -- 
> >> 2.53.0
> >>
> > Sorry, I missed adding cc list for the last conversation so adding this for reference:
> > 
> >> Wouldn't be good if we check this in perf_callchain_user() as it will
> >> cover both cases.
> > 
> > to which Viktor replied:
> > I considered it but in that case, we'd also miss the top-level stack
> > frame (the perf_callchain_store call above). Other arches include it so
> > I followed the behavior for powerpc.
> > 
> > Viktor, agreed with your first point. I have another concern:
> > 
> > I was hitting this issue with stacktrace_build_id_nmi in bpf and
> > applied this patch https://lore.kernel.org/bpf/20260126074331.815684-1-chen.dylane@linux.dev/T/#mf901967ebe77506f1bd6e3d876c2a85824d9519d
> > 
> > Wondering if the above generic fix is working do we need to add this
> > check in powerpc specific code?
> 
> I tried to apply that patch series but, unfortunately, keep getting the
> panic when running the BCC profile tool.
> 
> Also, looking at the patch, it seems that it would only solve the issue
> when perf_callchain_user is called from a BPF context, however, I assume
> that it may be called from other contexts, too.
> 
> Since perf_callchain_user_{32,64} are dereferencing current->mm while
> walking the stack, I think that an explicit protection against
> current->mm being NULL makes sense here, even in the presence of the
> above patch. Especially since other arches have it, too.
> 
> Viktor
> 
Ok that looks convincing then, another thing is that, how about moving perf_callchain_store
to perf_callchain_user and checking current->mm == NULL there for both perf_callchain_user_32/64.
next_ip, lr and sp can be passed to perf_callchain_user_32/64.

Thanks,
Saket

