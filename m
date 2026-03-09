Return-Path: <linuxppc-dev+bounces-17908-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMuuMZvcrmm/JQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17908-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 15:43:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC2E23AC72
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 15:43:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV0BH3NXnz3bnm;
	Tue, 10 Mar 2026 01:43:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773067415;
	cv=none; b=MseCmUFun+JJ2Hz3XGH29mKXaDFL92983PMcmGFZ4z1Eo8ew72hl/DxFf5+q1DUgw7aUmo/XwMpc2vU3jBPMwwuZq6ScmMwhXnjOwcLiJ/Uyu1jzKORbgFJVVOy2t0OUySretogA3YEKbhs/YRVrr7sHTNt8MACbfUtsqUnY4e4ooE6oDAVh0VAtfkdW8zaRwznQvOmu4fJKa3gWN6FMmFWcXFyNqHjbC2BFXjo92ioFbxnZCPmOMdoUzWkrMLtFX8E+qtnCyE5zGDIot2SdwhB8DxtP1qOHn80f7oKZMK0FZCNnlPAScRBnKgyQB6fwDQOussay3t4zqE+/sDYBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773067415; c=relaxed/relaxed;
	bh=DaKhYXczwtijwhMhNK50Qi+Imd2B6nrC4erR8UlvNrQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VUEtQyto28xnbQBMyesdangvA0sGpkTiv+fIGjfiefu//b583lsKCxUkr0fkMXjjeys1epFqgXUKAWe30cgyfPcesQpcREDGUMbixZWb3/nuIb71Gvve50bwWcIQhtA0z5sQtql40xjV5PMpC3rQY+LL0K1drPKpE8OD6hme1w5e3ausCEgoByvAkMfqEhDyPV+Lc8QrigPSAwUTx7uzFQMiSINJbKXXKYoDFITgQmGrkLmfT3MgwG+Se8+PBLyrGtf8bWmAkkvNuwcwgwUH2kqtpvRAwZQA29YXLWNUdKj4SazzBcZeL1c5tjD9ef8cNFgW60BLUMdBecF8vYpZyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CivCS4Dz; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L8JU4RsU; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vmalik@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CivCS4Dz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L8JU4RsU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vmalik@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV0BF31lFz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 01:43:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DaKhYXczwtijwhMhNK50Qi+Imd2B6nrC4erR8UlvNrQ=;
	b=CivCS4Dz9jJp2Yi78B7go+mtYkcc7Pzfqa6KCamzDSqerng/gqDVX2cf7w6h9bysIjErla
	cTKtgz4x1rYe44x5kLX6RrZ3HvnFDvKH9mbtQQMQd2LTJ86tuPvWfKGHcO5Cs/SsrxkwBf
	5371gxTBYq1c3y145sM6tmijO0Nta4Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DaKhYXczwtijwhMhNK50Qi+Imd2B6nrC4erR8UlvNrQ=;
	b=L8JU4RsUpi/jLwqBG98rl4va+bVDK9Z/bDPaSBiVFx+SsikXT4VEFmWK5U2HnKGSUbSPXB
	2S3mgrUzFMKCa4AJLsKVum3WzdxFKftapz6sF3IcCKHRx/8wW18JM43wEM31vjG7y/D903
	hJ7bUskdTxXSgAoppy9k/QN0FBRrnOA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-UuBeEZawMjG20ZIcGtUpbA-1; Mon, 09 Mar 2026 10:43:28 -0400
X-MC-Unique: UuBeEZawMjG20ZIcGtUpbA-1
X-Mimecast-MFC-AGG-ID: UuBeEZawMjG20ZIcGtUpbA_1773067407
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b9360e9f43bso1388529866b.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 07:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067407; x=1773672207;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DaKhYXczwtijwhMhNK50Qi+Imd2B6nrC4erR8UlvNrQ=;
        b=D64ybKrT5cfthJ4OkeHe7iNDVId9GfjLpZ5SNj9njU7IBgDoboKls+ZuQlnxlMuQkI
         30pLdDriulsid3HtkqqfDK1oUXMnvoMIbo4iq0h+viUBwcVEGp2x4/yHKetsP3nQFqsC
         KZgUKs1w8cSC/GfVheczIhm6qTpqXy7eCBAT82xtBVcLjvRMxF8JQvH99dMBWLUCITe/
         keQa6TA+CPg3JlS8iuAQIfaJjodQlxl8VMeJ1TsVoAsK5sj6r9aHILKn/eUmS71oAvfr
         JRIBa/vPcLMP9CXQF18rIRsOeHEL5GoisVJC+bx3qG6/Y9ZwhgWPjo8wLL0+rOLT5SCI
         znfg==
X-Gm-Message-State: AOJu0Yw7Sm6tfFb0ZsXGogZpMCzdgkr0eeaHwArfguN779YJowB6ggAo
	Y/+8JphUWNF3kP6IWBG0HEFH0ouzBfuibSf39/PwdHmynkHseHYO5NfkhBTl8zmPCRJhAG+Gyu5
	MNYF/prQQ6RtvCR7+yv3ovd96P4V9f0+LJYWTGh/ntK7gOedB9Uve/gI/kK1+6lu/Og==
X-Gm-Gg: ATEYQzyjKqOeYm2LKC9p07aY67iig+9ef/2O7hWl9/E8MsN6QZ9koeJ3g017uA35ul5
	C52Ev1vQ+o6//8KpzaTwpaP5Umjm7N5IwCa/TIEINZbaXB6sxsnSxzrsW743+4YUGlwvtDatIBV
	Bep4t5p+UgIl2z7IXsFioxo5OwxVRJonpdqaSttc+mG6V2yTPMSd55jxFqKfB8XGhGXVaE8KhVP
	ZBcuv7ZTJgMuAm/ebsQEYDfjL2NWtcHgkfQPjaDBTzg99IWXCHr0lhG5l4uJ8i06TYUpxLMKPdw
	qYpE1fhG6D/bEc3dpDmCs5RWX8kLS6rImNAbirvOc44Tu/zyftziJEDWF8Ktb8nTEgVsjZB+gFb
	j7GUO6rOCMUWUnTGGQj78uw8niZPZGK5oIsMLKWyjaAg4QXxKKQlPH00i
X-Received: by 2002:a17:907:7fa4:b0:b96:eb7e:bc3b with SMTP id a640c23a62f3a-b96eb7ec9a3mr256773566b.49.1773067406721;
        Mon, 09 Mar 2026 07:43:26 -0700 (PDT)
X-Received: by 2002:a17:907:7fa4:b0:b96:eb7e:bc3b with SMTP id a640c23a62f3a-b96eb7ec9a3mr256771866b.49.1773067406195;
        Mon, 09 Mar 2026 07:43:26 -0700 (PDT)
Received: from [192.168.0.135] (185-219-167-205-static.vivo.cz. [185.219.167.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f189de1sm382893266b.63.2026.03.09.07.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 07:43:25 -0700 (PDT)
Message-ID: <100385b1-afd0-4c17-831a-6cd45a02f6f3@redhat.com>
Date: Mon, 9 Mar 2026 15:43:23 +0100
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
From: Viktor Malik <vmalik@redhat.com>
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
 <f40b2ccd-2d71-4089-bd28-3adbc70f0a1d@redhat.com>
In-Reply-To: <f40b2ccd-2d71-4089-bd28-3adbc70f0a1d@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i5TcHZueNq2Mh9HjsL4jbEJmv0eA-jCvPsV8MzQunkw_1773067407
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: CBC2E23AC72
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,perches.com,ozlabs.org,kernel.crashing.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-17908-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vmalik@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:skb99@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:joe@perches.com,m:paulus@ozlabs.org,m:benh@kernel.crashing.org,m:atrajeev@linux.ibm.com,m:linux-perf-users@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bpf@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On 3/9/26 13:17, Viktor Malik wrote:
> On 3/9/26 12:05, Saket Kumar Bhaskar wrote:
>> On Thu, Mar 05, 2026 at 01:45:44PM +0100, Viktor Malik wrote:
>>> On 3/3/26 15:58, Saket Kumar Bhaskar wrote:
>>>> On Fri, Feb 27, 2026 at 09:25:02AM +0100, Viktor Malik wrote:
>>>>> It may happen that mm is already released, which leads to kernel panic.
>>>>> This adds the NULL check for current->mm, similarly to 20afc60f892d
>>>>> ("x86, perf: Check that current->mm is alive before getting user
>>>>> callchain").
>>>>>
>>>>> I was getting this panic when running a profiling BPF program
>>>>> (profile.py from bcc-tools):
>>>>>
>>>>>     [26215.051935] Kernel attempted to read user page (588) - exploit attempt? (uid: 0)
>>>>>     [26215.051950] BUG: Kernel NULL pointer dereference on read at 0x00000588
>>>>>     [26215.051952] Faulting instruction address: 0xc00000000020fac0
>>>>>     [26215.051957] Oops: Kernel access of bad area, sig: 11 [#1]
>>>>>     [...]
>>>>>     [26215.052049] Call Trace:
>>>>>     [26215.052050] [c000000061da6d30] [c00000000020fc10] perf_callchain_user_64+0x2d0/0x490 (unreliable)
>>>>>     [26215.052054] [c000000061da6dc0] [c00000000020f92c] perf_callchain_user+0x1c/0x30
>>>>>     [26215.052057] [c000000061da6de0] [c0000000005ab2a0] get_perf_callchain+0x100/0x360
>>>>>     [26215.052063] [c000000061da6e70] [c000000000573bc8] bpf_get_stackid+0x88/0xf0
>>>>>     [26215.052067] [c000000061da6ea0] [c008000000042258] bpf_prog_16d4ab9ab662f669_do_perf_event+0xf8/0x274
>>>>>     [...]
>>>>>
>>>>> Fixes: 20002ded4d93 ("perf_counter: powerpc: Add callchain support")
>>>>> Signed-off-by: Viktor Malik <vmalik@redhat.com>
>>>>> ---
>>>>>  arch/powerpc/perf/callchain_32.c | 3 +++
>>>>>  arch/powerpc/perf/callchain_64.c | 3 +++
>>>>>  2 files changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
>>>>> index ddcc2d8aa64a..b46e21679566 100644
>>>>> --- a/arch/powerpc/perf/callchain_32.c
>>>>> +++ b/arch/powerpc/perf/callchain_32.c
>>>>> @@ -144,6 +144,9 @@ void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
>>>>>  	sp = regs->gpr[1];
>>>>>  	perf_callchain_store(entry, next_ip);
>>>>>  
>>>>> +	if (!current->mm)
>>>>> +		return;
>>>>> +
>>>>>  	while (entry->nr < entry->max_stack) {
>>>>>  		fp = (unsigned int __user *) (unsigned long) sp;
>>>>>  		if (invalid_user_sp(sp) || read_user_stack_32(fp, &next_sp))
>>>>> diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
>>>>> index 115d1c105e8a..eaaadd6fa81b 100644
>>>>> --- a/arch/powerpc/perf/callchain_64.c
>>>>> +++ b/arch/powerpc/perf/callchain_64.c
>>>>> @@ -79,6 +79,9 @@ void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
>>>>>  	sp = regs->gpr[1];
>>>>>  	perf_callchain_store(entry, next_ip);
>>>>>  
>>>>> +	if (!current->mm)
>>>>> +		return;
>>>>> +
>>>>>  	while (entry->nr < entry->max_stack) {
>>>>>  		fp = (unsigned long __user *) sp;
>>>>>  		if (invalid_user_sp(sp) || read_user_stack_64(fp, &next_sp))
>>>>> -- 
>>>>> 2.53.0
>>>>>
>>>> Sorry, I missed adding cc list for the last conversation so adding this for reference:
>>>>
>>>>> Wouldn't be good if we check this in perf_callchain_user() as it will
>>>>> cover both cases.
>>>>
>>>> to which Viktor replied:
>>>> I considered it but in that case, we'd also miss the top-level stack
>>>> frame (the perf_callchain_store call above). Other arches include it so
>>>> I followed the behavior for powerpc.
>>>>
>>>> Viktor, agreed with your first point. I have another concern:
>>>>
>>>> I was hitting this issue with stacktrace_build_id_nmi in bpf and
>>>> applied this patch https://lore.kernel.org/bpf/20260126074331.815684-1-chen.dylane@linux.dev/T/#mf901967ebe77506f1bd6e3d876c2a85824d9519d
>>>>
>>>> Wondering if the above generic fix is working do we need to add this
>>>> check in powerpc specific code?
>>>
>>> I tried to apply that patch series but, unfortunately, keep getting the
>>> panic when running the BCC profile tool.
>>>
>>> Also, looking at the patch, it seems that it would only solve the issue
>>> when perf_callchain_user is called from a BPF context, however, I assume
>>> that it may be called from other contexts, too.
>>>
>>> Since perf_callchain_user_{32,64} are dereferencing current->mm while
>>> walking the stack, I think that an explicit protection against
>>> current->mm being NULL makes sense here, even in the presence of the
>>> above patch. Especially since other arches have it, too.
>>>
>>> Viktor
>>>
>> Ok that looks convincing then, another thing is that, how about moving perf_callchain_store
>> to perf_callchain_user and checking current->mm == NULL there for both perf_callchain_user_32/64.
>> next_ip, lr and sp can be passed to perf_callchain_user_32/64.
> 
> Yeah, that should be possible. I'll send v2.

v2 sent:

https://lore.kernel.org/linuxppc-dev/20260309144045.169427-1-vmalik@redhat.com/T/#u

Viktor

> 
> Viktor
> 
>>
>> Thanks,
>> Saket
>>
> 


