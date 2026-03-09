Return-Path: <linuxppc-dev+bounces-17893-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEuXBIO6rmmxIQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17893-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 13:18:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 214BD238A86
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 13:18:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTwyR0mfXz3bnm;
	Mon, 09 Mar 2026 23:18:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773058686;
	cv=none; b=gx5ADWmNRkmV/2+rwHeXm0mgZql6VvT8Qy5ogwc0EOxMMB+gUpnkMhr0TMDvjuR8C7J2Uwod8d9DWoX3e+Yy7Mc8G1IJjVWrMh/oFUG+c79RmnEW3kNQ+IqB+xA14ChKj2PB5BWDkryOOcpbytPBL52ZjUBt/Bt81+t2uti1A/FNq9w1JTEBrYgsQhcc0L8UnhdhHFFbn4kMUFaQRf2PXa4PdbFCUO7aSl0eSRVol2v6Nh8737e5li5CXQkFUbQ3my0C/ezT77xi/eMMr9LTWlw4nfE3LcQKwhCLdWjHNuHmuSot8uuopfOfOyIaOO+1VKzuo0q1LVvGNuSVUVHLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773058686; c=relaxed/relaxed;
	bh=HNyyMMOd63VribfqOYS2i0x1XZyTkPZ+RO24bylfwjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofU2UWrdwo4DgqmPxj9nc8Zfbj8jRijDTGz1DFYgngpPFW1L7VXpWet3ez/ERvCAvxKyqTOHdslJJQEKCVV+2gHnpqzUEv3BhLtOs6HQglGCn1f/6Qx+6ijBjTzEH5UZQSRujoY5yd/pKi5ki891rvKeZqmpOSVdiZEiyF+iVY04DRYlobglq2U0b7EcHSYdbEaLK3nsopEahQymqHjYGNmV/1T50ZxkehFcp4Bv1l2rPOFzQMPbitH61ZIlhgvKxKk/KBaJBlsiLy+tLFKT8fouMvk9Vfo0qVITBm7NadNfdYYl2d2zIqJE7OsNPVMFMfgPk1GghKKwb/zyT1Vusg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RRd+KvIP; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RRd+KvIP; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vmalik@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RRd+KvIP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RRd+KvIP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vmalik@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTwyP2cS1z2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 23:18:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773058678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNyyMMOd63VribfqOYS2i0x1XZyTkPZ+RO24bylfwjk=;
	b=RRd+KvIPQ2WsRxPpAp7rW0p5rwsd7cV7yLUInS2NS2fRUHmCm8qUBKSAmkos6cDo1O+i+q
	Q1JV3Pv/9NEdWXjTAb9jlSXBlHQ0KwNfWGNpitIY92LvZ9epVZ2gYMYieo9ozMfbhbRpAc
	4ngjmIISJ0Rs1ihS3GKlyn/ebVDI4Qg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773058678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNyyMMOd63VribfqOYS2i0x1XZyTkPZ+RO24bylfwjk=;
	b=RRd+KvIPQ2WsRxPpAp7rW0p5rwsd7cV7yLUInS2NS2fRUHmCm8qUBKSAmkos6cDo1O+i+q
	Q1JV3Pv/9NEdWXjTAb9jlSXBlHQ0KwNfWGNpitIY92LvZ9epVZ2gYMYieo9ozMfbhbRpAc
	4ngjmIISJ0Rs1ihS3GKlyn/ebVDI4Qg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-53eEMphSPBSkBojYj2J9zQ-1; Mon, 09 Mar 2026 08:17:56 -0400
X-MC-Unique: 53eEMphSPBSkBojYj2J9zQ-1
X-Mimecast-MFC-AGG-ID: 53eEMphSPBSkBojYj2J9zQ_1773058675
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-439af7ba802so7759412f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 05:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058675; x=1773663475;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNyyMMOd63VribfqOYS2i0x1XZyTkPZ+RO24bylfwjk=;
        b=MyQbFjjs21W/Zx/tjQWxpodkRHbo267yoiCPdocJL8c4sd/OP51eBT+Pw7Dj9Ublhs
         gNLAnkNAzGKLsWJ/kwt49Wo7P9FFFF+Tc3ogjUO+oI9kskZCihBLgsfdSh4kHxjjQx9k
         wIR/7fLUU+nPo4WKk17CN873nlGxpmvfN/2dvstqkXIksjenayD66WjPoOFt1j7618Nb
         Xarjh5IVnG1+IUr/l3URozhFDN/eOzpyEOXNH4DMAMWgPMiJ0jJY5JV+TeOq9GbgZC1f
         mOI/vj1ZocWytYpz0d8IY1wjOqviLu/v1lvZVnjlqtzRYjdQE1h5h3VPKD44FOvfiFzd
         b7VQ==
X-Gm-Message-State: AOJu0YwT0WFx5j/L2be0dzww5fIIqRXy9r2qc0+3hA8l3htBykM+r2ow
	4KiktPNx610TdeYnmzEvKyZOQM3LUMuJiIV1mQpPyL46txkCIAz2xdA/klg7ZpcAWSTHmeZ2aZm
	polpTDO/uVuSZ5UskBR7jop6TmKneQ3c1YH6PV3lHl9M5riY1pbGveRSgK80wjgKkCw==
X-Gm-Gg: ATEYQzwfWkdvQmTbB7US5qC2v3FipSQ3/xtrmhIwEf5J2ZV8CiANJoq1c4JRhr3K5XC
	0ezgiKniAcIdmQDJtltOm8QmsYz8ntRsKCH6eH++aVG1cBBExHhvb5ax+FTw157D12Xkcu7teV8
	fq3KdxzEJA2RnbpHq4KcL4NkzYQJeTjhQTRX2K9cVkVNj3qFEAKT32H8/KdFwNGJK1Abp7mPNng
	L/INJAHaNzhznDvpFRV9ut7VEzhv/lf/uBbUD6w5awYbd/lzy+fVWqKBydtF34KPp9GQS+vnXlX
	qfCFAT34YPVyrq732DfocbldMy4mMw6gfA/MAs17+TwyOjpgR+Qcas1aPKjDmVfjA6fVP45m8a+
	S1TSMmW2T8kcZsN6HwCmK/8hhH+eeuThdFKKblNREPJAZ7x+saq7gR1QX
X-Received: by 2002:a05:6000:290c:b0:439:b3d2:376b with SMTP id ffacd0b85a97d-439da66207amr19413540f8f.14.1773058674908;
        Mon, 09 Mar 2026 05:17:54 -0700 (PDT)
X-Received: by 2002:a05:6000:290c:b0:439:b3d2:376b with SMTP id ffacd0b85a97d-439da66207amr19413477f8f.14.1773058674321;
        Mon, 09 Mar 2026 05:17:54 -0700 (PDT)
Received: from [192.168.0.135] (185-219-167-205-static.vivo.cz. [185.219.167.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8da01sm27690413f8f.1.2026.03.09.05.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 05:17:53 -0700 (PDT)
Message-ID: <f40b2ccd-2d71-4089-bd28-3adbc70f0a1d@redhat.com>
Date: Mon, 9 Mar 2026 13:17:52 +0100
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
Subject: Re: [PATCH] powerpc, perf: Check that current->mm is alive before
 getting user callchain
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Joe Perches <joe@perches.com>, Paul Mackerras <paulus@ozlabs.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, atrajeev@linux.ibm.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org
References: <20260227082502.1882395-1-vmalik@redhat.com>
 <aab3EW1LfDcjSzzy@linux.ibm.com>
 <80766050-c745-411b-8ee6-8141d2cfe4ff@redhat.com>
 <aa6pZaDySMl9JGKf@linux.ibm.com>
From: Viktor Malik <vmalik@redhat.com>
In-Reply-To: <aa6pZaDySMl9JGKf@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bBjzs9YujJCAJv7huO_dNnX5hCOC1jIyl24-4UCg6wg_1773058675
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 214BD238A86
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,perches.com,ozlabs.org,kernel.crashing.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-17893-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vmalik@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:skb99@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:joe@perches.com,m:paulus@ozlabs.org,m:benh@kernel.crashing.org,m:atrajeev@linux.ibm.com,m:linux-perf-users@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bpf@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vmalik@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,profile.py:url]
X-Rspamd-Action: no action

On 3/9/26 12:05, Saket Kumar Bhaskar wrote:
> On Thu, Mar 05, 2026 at 01:45:44PM +0100, Viktor Malik wrote:
>> On 3/3/26 15:58, Saket Kumar Bhaskar wrote:
>>> On Fri, Feb 27, 2026 at 09:25:02AM +0100, Viktor Malik wrote:
>>>> It may happen that mm is already released, which leads to kernel panic.
>>>> This adds the NULL check for current->mm, similarly to 20afc60f892d
>>>> ("x86, perf: Check that current->mm is alive before getting user
>>>> callchain").
>>>>
>>>> I was getting this panic when running a profiling BPF program
>>>> (profile.py from bcc-tools):
>>>>
>>>>     [26215.051935] Kernel attempted to read user page (588) - exploit attempt? (uid: 0)
>>>>     [26215.051950] BUG: Kernel NULL pointer dereference on read at 0x00000588
>>>>     [26215.051952] Faulting instruction address: 0xc00000000020fac0
>>>>     [26215.051957] Oops: Kernel access of bad area, sig: 11 [#1]
>>>>     [...]
>>>>     [26215.052049] Call Trace:
>>>>     [26215.052050] [c000000061da6d30] [c00000000020fc10] perf_callchain_user_64+0x2d0/0x490 (unreliable)
>>>>     [26215.052054] [c000000061da6dc0] [c00000000020f92c] perf_callchain_user+0x1c/0x30
>>>>     [26215.052057] [c000000061da6de0] [c0000000005ab2a0] get_perf_callchain+0x100/0x360
>>>>     [26215.052063] [c000000061da6e70] [c000000000573bc8] bpf_get_stackid+0x88/0xf0
>>>>     [26215.052067] [c000000061da6ea0] [c008000000042258] bpf_prog_16d4ab9ab662f669_do_perf_event+0xf8/0x274
>>>>     [...]
>>>>
>>>> Fixes: 20002ded4d93 ("perf_counter: powerpc: Add callchain support")
>>>> Signed-off-by: Viktor Malik <vmalik@redhat.com>
>>>> ---
>>>>  arch/powerpc/perf/callchain_32.c | 3 +++
>>>>  arch/powerpc/perf/callchain_64.c | 3 +++
>>>>  2 files changed, 6 insertions(+)
>>>>
>>>> diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
>>>> index ddcc2d8aa64a..b46e21679566 100644
>>>> --- a/arch/powerpc/perf/callchain_32.c
>>>> +++ b/arch/powerpc/perf/callchain_32.c
>>>> @@ -144,6 +144,9 @@ void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
>>>>  	sp = regs->gpr[1];
>>>>  	perf_callchain_store(entry, next_ip);
>>>>  
>>>> +	if (!current->mm)
>>>> +		return;
>>>> +
>>>>  	while (entry->nr < entry->max_stack) {
>>>>  		fp = (unsigned int __user *) (unsigned long) sp;
>>>>  		if (invalid_user_sp(sp) || read_user_stack_32(fp, &next_sp))
>>>> diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
>>>> index 115d1c105e8a..eaaadd6fa81b 100644
>>>> --- a/arch/powerpc/perf/callchain_64.c
>>>> +++ b/arch/powerpc/perf/callchain_64.c
>>>> @@ -79,6 +79,9 @@ void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
>>>>  	sp = regs->gpr[1];
>>>>  	perf_callchain_store(entry, next_ip);
>>>>  
>>>> +	if (!current->mm)
>>>> +		return;
>>>> +
>>>>  	while (entry->nr < entry->max_stack) {
>>>>  		fp = (unsigned long __user *) sp;
>>>>  		if (invalid_user_sp(sp) || read_user_stack_64(fp, &next_sp))
>>>> -- 
>>>> 2.53.0
>>>>
>>> Sorry, I missed adding cc list for the last conversation so adding this for reference:
>>>
>>>> Wouldn't be good if we check this in perf_callchain_user() as it will
>>>> cover both cases.
>>>
>>> to which Viktor replied:
>>> I considered it but in that case, we'd also miss the top-level stack
>>> frame (the perf_callchain_store call above). Other arches include it so
>>> I followed the behavior for powerpc.
>>>
>>> Viktor, agreed with your first point. I have another concern:
>>>
>>> I was hitting this issue with stacktrace_build_id_nmi in bpf and
>>> applied this patch https://lore.kernel.org/bpf/20260126074331.815684-1-chen.dylane@linux.dev/T/#mf901967ebe77506f1bd6e3d876c2a85824d9519d
>>>
>>> Wondering if the above generic fix is working do we need to add this
>>> check in powerpc specific code?
>>
>> I tried to apply that patch series but, unfortunately, keep getting the
>> panic when running the BCC profile tool.
>>
>> Also, looking at the patch, it seems that it would only solve the issue
>> when perf_callchain_user is called from a BPF context, however, I assume
>> that it may be called from other contexts, too.
>>
>> Since perf_callchain_user_{32,64} are dereferencing current->mm while
>> walking the stack, I think that an explicit protection against
>> current->mm being NULL makes sense here, even in the presence of the
>> above patch. Especially since other arches have it, too.
>>
>> Viktor
>>
> Ok that looks convincing then, another thing is that, how about moving perf_callchain_store
> to perf_callchain_user and checking current->mm == NULL there for both perf_callchain_user_32/64.
> next_ip, lr and sp can be passed to perf_callchain_user_32/64.

Yeah, that should be possible. I'll send v2.

Viktor

> 
> Thanks,
> Saket
> 


