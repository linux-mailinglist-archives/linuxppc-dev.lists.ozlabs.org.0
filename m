Return-Path: <linuxppc-dev+bounces-16856-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHLdD4lpjmmdCAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16856-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Feb 2026 01:00:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D43131DD4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Feb 2026 01:00:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBsjx5958z2xnl;
	Fri, 13 Feb 2026 11:00:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::aa"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770940805;
	cv=none; b=cL2ieCQK+Tus8fsG8jdtCDfIsO524JfI2Jn4WvZk7Fzef/BsWEMfadVFj0KL639C8HCs+9IgKsslwMUEwZbLwBn+EIzIQmiTBr8uLPzKh2o+wrAThMTp5zU7oDHLY7o1G4in0fgDMQNE5Z8kyqvsDT4ZT9Xlcbus7+wGPeqtlf8cttj43f+qUN0pgPKE+ImaYSBADVa79hAKj6qYBZSnWwHDsB+ky6yJto8OEDQFPKEAfkQcy5Y4/33z69fR8Qc6XDYiUP8bBWTm4PLV/vhsR4ShTsEpaG1Ye3VIrXIi206cw+ajHSXVtHJ2y1JkyAx2szgd7XxDOiTikfdOagCY0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770940805; c=relaxed/relaxed;
	bh=ECZ3Gr3aPzDdLph7XL37lAMGWK6WSXx8uq0q0FNltrM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NcPJoAC29mSKJ1qqGRARVjxmIjvSyKvBiFvSBI64b2U7upTCZm8tCDfGWdXbx3ex2QIgcK5SYaUjZqM2kDIhanzV92zxZhKNPx5fu8h/kP/y5/WTnTu425qVN4jr779xN4SsruDqHdsXQy3w5fAC93RaQYrmllAIHPB6pb09CZhVb9mnxBoslKqIRfSXKJpOtwGl0rCiTqegdk8+vf/2LehLdmrXCYQCjOtAD9+2UzHpSuV7j8t4pqA5dQszgVWPNZ4GRdnKDD5O25OCKWTW2/6xGLQlGeI0TUeSz41fHuST6VQetun6zXMDbwPeGtGRC45inLsiZgLzFgefgG9WAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZlwWRC4t; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::aa; helo=out-170.mta1.migadu.com; envelope-from=yonghong.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZlwWRC4t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::aa; helo=out-170.mta1.migadu.com; envelope-from=yonghong.song@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 341 seconds by postgrey-1.37 at boromir; Fri, 13 Feb 2026 11:00:04 AEDT
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [IPv6:2001:41d0:203:375::aa])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBsjw6Yqtz2xlx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Feb 2026 11:00:04 +1100 (AEDT)
Message-ID: <2e8a8754-5b4e-45c4-a54a-488f0a7b1633@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770940439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ECZ3Gr3aPzDdLph7XL37lAMGWK6WSXx8uq0q0FNltrM=;
	b=ZlwWRC4t9UIkaxR129QlAsVOcFIufN3uopaEVE6kKLVKI4UQseHqGC6gXhLlEOaUZWjnY8
	K7oLkZiG0VfXrf8shahIoskBgaEYOXuHK+ZerzqWmuUPb8sgGo2Piah/RXxJYAw1+B5ETy
	tlmP/xiJ+Ls/LJu24WrA0Gp9gZuUDrA=
Date: Thu, 12 Feb 2026 15:53:49 -0800
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
Subject: Re: [PATCH v2] selftests/bpf: Add powerpc support for
 get_preempt_count() in selftest
Content-Language: en-GB
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
 andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 martin.lau@linux.dev, song@kernel.org, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
 christophe.leroy@csgroup.eu, maddy@linux.ibm.com, mpe@ellerman.id.au
References: <20260212092558.370623-1-skb99@linux.ibm.com>
 <a3dfdbc2-bd72-412d-83b4-f17d68949c6b@linux.dev>
In-Reply-To: <a3dfdbc2-bd72-412d-83b4-f17d68949c6b@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16856-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[yonghong.song@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:skb99@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[yonghong.song@linux.dev,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: 62D43131DD4
X-Rspamd-Action: no action


On 2/12/26 3:52 PM, Yonghong Song wrote:
>
>
> On 2/12/26 1:25 AM, Saket Kumar Bhaskar wrote:
>> get_preempt_count() is enabled to return preempt_count for powerpc,
>> so that bpf_in_interrupt()/bpf_in_nmi()/bpf_in_serving_softirq()/
>> bpf_in_task()/bpf_in_hardirq()/get_preempt_count() works for
>> powerpc as well.
>>
>> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
>> ---
>> Changes since v1:
>> * Updated the comments to include powerpc for the APIs.
>>
>> v1: 
>> https://lore.kernel.org/bpf/20260129054035.168078-1-skb99@linux.ibm.com/
>> ---
>>   tools/testing/selftests/bpf/bpf_experimental.h | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/tools/testing/selftests/bpf/bpf_experimental.h 
>> b/tools/testing/selftests/bpf/bpf_experimental.h
>> index 4b7210c318dd..9df77e59d4f5 100644
>> --- a/tools/testing/selftests/bpf/bpf_experimental.h
>> +++ b/tools/testing/selftests/bpf/bpf_experimental.h
>> @@ -645,6 +645,8 @@ static inline int get_preempt_count(void)
>> bpf_this_cpu_ptr(&pcpu_hot))->preempt_count;
>>   #elif defined(bpf_target_arm64)
>>       return bpf_get_current_task_btf()->thread_info.preempt.count;
>> +#elif defined(bpf_target_powerpc)
>> +    return bpf_get_current_task_btf()->thread_info.preempt_count;
>>   #endif
>
> Maybe do
>   #elif defined(bpf_target_arm64) || defined(bpf_target_powerpc)
> ?

Sorry, my bad. Please ignore as missing preempt.count vs. preempt_count.

>
>>       return 0;
>>   }
>> @@ -653,6 +655,7 @@ static inline int get_preempt_count(void)
>>    *    Report whether it is in interrupt context. Only works on the 
>> following archs:
>>    *    * x86
>>    *    * arm64
>> + *    * powerpc64
>>    */
>>   static inline int bpf_in_interrupt(void)
>>   {
>> @@ -672,6 +675,7 @@ static inline int bpf_in_interrupt(void)
>>    *    Report whether it is in NMI context. Only works on the 
>> following archs:
>>    *    * x86
>>    *    * arm64
>> + *    * powerpc64
>>    */
>>   static inline int bpf_in_nmi(void)
>>   {
>> @@ -682,6 +686,7 @@ static inline int bpf_in_nmi(void)
>>    *    Report whether it is in hard IRQ context. Only works on the 
>> following archs:
>>    *    * x86
>>    *    * arm64
>> + *    * powerpc64
>>    */
>>   static inline int bpf_in_hardirq(void)
>>   {
>> @@ -692,6 +697,7 @@ static inline int bpf_in_hardirq(void)
>>    *    Report whether it is in softirq context. Only works on the 
>> following archs:
>>    *    * x86
>>    *    * arm64
>> + *    * powerpc64
>>    */
>>   static inline int bpf_in_serving_softirq(void)
>>   {
>> @@ -710,6 +716,7 @@ static inline int bpf_in_serving_softirq(void)
>>    *    Report whether it is in task context. Only works on the 
>> following archs:
>>    *    * x86
>>    *    * arm64
>> + *    * powerpc64
>>    */
>>   static inline int bpf_in_task(void)
>>   {
>
>


