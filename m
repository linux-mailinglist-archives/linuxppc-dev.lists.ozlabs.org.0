Return-Path: <linuxppc-dev+bounces-17774-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE6gAQx7qWl77wAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17774-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 13:46:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1943C211FC1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 13:46:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRTmP6N5yz3c5j;
	Thu, 05 Mar 2026 23:45:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772714757;
	cv=none; b=RJ7/uWoIWej+JhCVO2eWPcKP/64UkL5fvEDpSP7Dc2jO+pkaRkSDTl58rGiGxROooiH9d6cCCMtQZnZW8/HCIlmvgYia2gxSxWrqYqJpk5ro+6hjdhGji50f0m+RokaK/Z67DTXwtbMcQHWx9KQOImYT3GqnXE7L52nJ0VR7mGeKe9o5sy+P8O0bH3K/6edKfjGZEV+dF2ixc3l4y2ehxf90D9B3vNagRoDqnPIK7v9rFU4fRDDSfTLmR2IYV9XAZkWdBO9fTxro29c6oe6pzS5ASrEGidUAnsnE7qEEAmq+0+C/yfnkV3z+qf5AcAfk33wUPKMqrlEAKPPj4I0vdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772714757; c=relaxed/relaxed;
	bh=8lkxI+3lOCvkC886PGfDKxPOQ08Kegpy+JUcXJYkgXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EqCJcN6vrxUh/kGagkGKPdADC0D4Y+uMCCEdNoqDgT++5QsapgghneyWWkQ2Vs7PlWIDX0+utfEcLJOstspumk3brpeh8904o6A2sxA/WXDzrAZW3zNys2PXqOQ8mWbWd/hdkM5c83ByL8haPpJHEpj9bExV61NrxmbAODypA+9HnyRIaygLJjRgcvJOYTOf5ei4TjlQsG7dQfLcvTUR4eaCz8xgPsnDgrjkPanwFD0jomPBJ03/SR5Gf2/kJbTzczEcpyLRvw5Ha/4hG6w0KAhPjLk4l6Uq/yKi/74qxz0eM9o4uhadxVyyOOnNaTzGZutB1KzNMOsP9UH8LFv5uA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SOWBUKRc; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SOWBUKRc; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vmalik@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SOWBUKRc;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SOWBUKRc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vmalik@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRTmN3Yzmz30MZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 23:45:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772714749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8lkxI+3lOCvkC886PGfDKxPOQ08Kegpy+JUcXJYkgXA=;
	b=SOWBUKRce6kIWv1MyUgZleDb4nVRyNebl8d3hG5ea+s4k2w4j36aUaAgLYRQJgrFfFUf+4
	JFjeglKehjjD+8ZyOyqMZv3s/tEqsJ4Xs/y7PYgRXFytWXXJ0kZZdknK7BervQD/6k0Es0
	1qPbCHkl0dasRNoWyWITkzRohQUd6Nc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772714749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8lkxI+3lOCvkC886PGfDKxPOQ08Kegpy+JUcXJYkgXA=;
	b=SOWBUKRce6kIWv1MyUgZleDb4nVRyNebl8d3hG5ea+s4k2w4j36aUaAgLYRQJgrFfFUf+4
	JFjeglKehjjD+8ZyOyqMZv3s/tEqsJ4Xs/y7PYgRXFytWXXJ0kZZdknK7BervQD/6k0Es0
	1qPbCHkl0dasRNoWyWITkzRohQUd6Nc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-tW0PjIoBOLuuUxBlgo29QA-1; Thu, 05 Mar 2026 07:45:48 -0500
X-MC-Unique: tW0PjIoBOLuuUxBlgo29QA-1
X-Mimecast-MFC-AGG-ID: tW0PjIoBOLuuUxBlgo29QA_1772714747
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-483786a09b1so79465905e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 04:45:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772714747; x=1773319547;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lkxI+3lOCvkC886PGfDKxPOQ08Kegpy+JUcXJYkgXA=;
        b=BctcQcRUeZ0jhvr+NGWYJ1sxHu5p+ZTGTXs8BkGM/5aWZCAkydzyO5SLjRV810Zbav
         BxJgXd14lNqzLVNbvEqrQHraOTFM82+LiYF6XNpTRFle6l0ymdUgcNfIWf8T0VFp8IHJ
         v9Hba8re0HfJV8bAgy5RMdXjG61C9l30V3Crqv+RccKl8ExC2ATnQZE6b+YYnkXK9Df/
         5H9JePrxWumgyyqygLjPZJaPfXPsD+/fEQJUIHJhLkhaN9GH7HTsCHWR1hK9i+zJrj/T
         RE9WjA8bfJ3MvkYiIuhDTY5EM608/0Ft5BKTINzUSzF5Lrz7hqxFV4Dd9TUcKudtRTEV
         xusA==
X-Gm-Message-State: AOJu0Yxa2SKtfWwZCdN9ny9RF3F7SKgIUo2YuF2HD3E4CqTdKdvdOvLo
	n6ZsoIj+E9I3rNjkO++YI63p4+2/ldnQpYpyjTlyTSmVKRIVFUBFnNZTOBaHk9O29NfoEh8QwjG
	UuWqxm62CsvfWLlNAqDy+/l+cE7V5eT/sJFB7hQ0UMEwRSNRsNUFhzqJ157of8gj9iA==
X-Gm-Gg: ATEYQzyTbRyZ0VyIG7ncfVRFZ7EBmddcuLxkpkQPxfUMZ9Jan9Bj/LZZnCPr0A2Qc+t
	wTZucSWJ/pd27FxWDAfcFx4ccmJ5+sOVlEtDuRz2A5bWno2YTNOegkQhaTb4Gs+rnnzdrTvi0S9
	sChuX0NocQB0zaDTT1UmbIOinUiZd22SOq0qj3r2K94ir9fWoUF2guEBCHdD0PdRwdiggWtSVcQ
	4K2T9XrQCZEWpQiY5Q7UHprksrNL1m3E5jBvEQnd7qDH7v8/daKNU8f+T3mnfshMLbHJZXyuWCo
	oj+lMgBY6VkHW73D+HLdU7OVm0g4jRf8K7mDJBqsVGE9jRiPHvdn+YGShwopKafm5xFXsSotdIc
	pK7gPf+3uI6djRbU4M3Rsd9lCLqE20hh57Bo5fg5+bHSJQc3bTyJYSDfH
X-Received: by 2002:a05:600c:458d:b0:482:eec4:74c with SMTP id 5b1f17b1804b1-4851988a630mr86649785e9.22.1772714746625;
        Thu, 05 Mar 2026 04:45:46 -0800 (PST)
X-Received: by 2002:a05:600c:458d:b0:482:eec4:74c with SMTP id 5b1f17b1804b1-4851988a630mr86649485e9.22.1772714746130;
        Thu, 05 Mar 2026 04:45:46 -0800 (PST)
Received: from [192.168.0.135] (185-219-167-205-static.vivo.cz. [185.219.167.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb33815sm80533045e9.12.2026.03.05.04.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 04:45:45 -0800 (PST)
Message-ID: <80766050-c745-411b-8ee6-8141d2cfe4ff@redhat.com>
Date: Thu, 5 Mar 2026 13:45:44 +0100
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
From: Viktor Malik <vmalik@redhat.com>
In-Reply-To: <aab3EW1LfDcjSzzy@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J3zQWcpqPwi2_qpsV1-MRWYC0NJQ5iRJLVoMvgu8P3o_1772714747
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 1943C211FC1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,perches.com,ozlabs.org,kernel.crashing.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-17774-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:skb99@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:joe@perches.com,m:paulus@ozlabs.org,m:benh@kernel.crashing.org,m:atrajeev@linux.ibm.com,m:linux-perf-users@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bpf@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vmalik@redhat.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vmalik@redhat.com,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 3/3/26 15:58, Saket Kumar Bhaskar wrote:
> On Fri, Feb 27, 2026 at 09:25:02AM +0100, Viktor Malik wrote:
>> It may happen that mm is already released, which leads to kernel panic.
>> This adds the NULL check for current->mm, similarly to 20afc60f892d
>> ("x86, perf: Check that current->mm is alive before getting user
>> callchain").
>>
>> I was getting this panic when running a profiling BPF program
>> (profile.py from bcc-tools):
>>
>>     [26215.051935] Kernel attempted to read user page (588) - exploit attempt? (uid: 0)
>>     [26215.051950] BUG: Kernel NULL pointer dereference on read at 0x00000588
>>     [26215.051952] Faulting instruction address: 0xc00000000020fac0
>>     [26215.051957] Oops: Kernel access of bad area, sig: 11 [#1]
>>     [...]
>>     [26215.052049] Call Trace:
>>     [26215.052050] [c000000061da6d30] [c00000000020fc10] perf_callchain_user_64+0x2d0/0x490 (unreliable)
>>     [26215.052054] [c000000061da6dc0] [c00000000020f92c] perf_callchain_user+0x1c/0x30
>>     [26215.052057] [c000000061da6de0] [c0000000005ab2a0] get_perf_callchain+0x100/0x360
>>     [26215.052063] [c000000061da6e70] [c000000000573bc8] bpf_get_stackid+0x88/0xf0
>>     [26215.052067] [c000000061da6ea0] [c008000000042258] bpf_prog_16d4ab9ab662f669_do_perf_event+0xf8/0x274
>>     [...]
>>
>> Fixes: 20002ded4d93 ("perf_counter: powerpc: Add callchain support")
>> Signed-off-by: Viktor Malik <vmalik@redhat.com>
>> ---
>>  arch/powerpc/perf/callchain_32.c | 3 +++
>>  arch/powerpc/perf/callchain_64.c | 3 +++
>>  2 files changed, 6 insertions(+)
>>
>> diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
>> index ddcc2d8aa64a..b46e21679566 100644
>> --- a/arch/powerpc/perf/callchain_32.c
>> +++ b/arch/powerpc/perf/callchain_32.c
>> @@ -144,6 +144,9 @@ void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
>>  	sp = regs->gpr[1];
>>  	perf_callchain_store(entry, next_ip);
>>  
>> +	if (!current->mm)
>> +		return;
>> +
>>  	while (entry->nr < entry->max_stack) {
>>  		fp = (unsigned int __user *) (unsigned long) sp;
>>  		if (invalid_user_sp(sp) || read_user_stack_32(fp, &next_sp))
>> diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
>> index 115d1c105e8a..eaaadd6fa81b 100644
>> --- a/arch/powerpc/perf/callchain_64.c
>> +++ b/arch/powerpc/perf/callchain_64.c
>> @@ -79,6 +79,9 @@ void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
>>  	sp = regs->gpr[1];
>>  	perf_callchain_store(entry, next_ip);
>>  
>> +	if (!current->mm)
>> +		return;
>> +
>>  	while (entry->nr < entry->max_stack) {
>>  		fp = (unsigned long __user *) sp;
>>  		if (invalid_user_sp(sp) || read_user_stack_64(fp, &next_sp))
>> -- 
>> 2.53.0
>>
> Sorry, I missed adding cc list for the last conversation so adding this for reference:
> 
>> Wouldn't be good if we check this in perf_callchain_user() as it will
>> cover both cases.
> 
> to which Viktor replied:
> I considered it but in that case, we'd also miss the top-level stack
> frame (the perf_callchain_store call above). Other arches include it so
> I followed the behavior for powerpc.
> 
> Viktor, agreed with your first point. I have another concern:
> 
> I was hitting this issue with stacktrace_build_id_nmi in bpf and
> applied this patch https://lore.kernel.org/bpf/20260126074331.815684-1-chen.dylane@linux.dev/T/#mf901967ebe77506f1bd6e3d876c2a85824d9519d
> 
> Wondering if the above generic fix is working do we need to add this
> check in powerpc specific code?

I tried to apply that patch series but, unfortunately, keep getting the
panic when running the BCC profile tool.

Also, looking at the patch, it seems that it would only solve the issue
when perf_callchain_user is called from a BPF context, however, I assume
that it may be called from other contexts, too.

Since perf_callchain_user_{32,64} are dereferencing current->mm while
walking the stack, I think that an explicit protection against
current->mm being NULL makes sense here, even in the presence of the
above patch. Especially since other arches have it, too.

Viktor


