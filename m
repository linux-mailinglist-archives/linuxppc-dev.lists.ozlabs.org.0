Return-Path: <linuxppc-dev+bounces-16744-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDXFCCzriWmdDwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16744-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 15:11:56 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6851101C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 15:11:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8mpc4ygVz2yGx;
	Tue, 10 Feb 2026 01:11:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770646312;
	cv=none; b=kiXP9+8LRMz6ud8lZLozVyG76ONHa+XrKudLzIVLY5nPZp5/2uJiHJLWEEurrWkh7Xg9GSZQgyfMjv1mKPD8Q2URrtZP6rvc6a9DxyYby1aGe7JqwJu1PRjNvkAc+Ckzq76bRohGHsUez985oMy8hzYRFgI1DxzKK+BXoBDhxc7rB93GHdUmXY9PJphbHUHpEsCK/B1kEaUuRKLMBVwytJCvjUH9Vouc+pZPWo/iBRFgajQtrEG+wQSBedEMz978900YrTYjgTit+MzI2TnwyvYFrxXoNjNt/itVDeH7hx61Psccdf9X9aYxzfuGPEn0hV+I3FRbbMdBEfRnnkOdxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770646312; c=relaxed/relaxed;
	bh=aH91xLSmg33pp2gJzXKqb559lxedqqea4mhjrttOweE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B0kkX/1/vrcblBt7sGhbnPoNpiFsw2zsZUTGJpwcVHhKdJShM1FZwcmQxkrvLkwJ6/xqsXOu5xZuVFQ2KMExV+nVbcbGfMnxW+MyGssbtkhlDtPvfONhR24uL1+Qqz0HW2CdOE7RL9i7OEqVVZzUFXfaqfTOBc3R/HOmDqrKkGOMiLkOs7Lo8vBZpSGxOzt5D72389wa7PcNOIOgEYyzcIvkfjcn6xerxAk4hF5lTRpfvqYH+YlVJHZ8+QujFsh+zu0y1cagytJTGMFxXrmTJsH4ELwZGWSSp9xUgwyA0f/s5helVNY4KXNAtn9dZE0c+Y8g9jNki6W/exgZkCbwmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=lzxZT3+u; dkim-atps=neutral; spf=pass (client-ip=113.46.200.218; helo=canpmsgout03.his.huawei.com; envelope-from=xieyuanbin1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=lzxZT3+u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=113.46.200.218; helo=canpmsgout03.his.huawei.com; envelope-from=xieyuanbin1@huawei.com; receiver=lists.ozlabs.org)
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8mpY5S4Rz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 01:11:49 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aH91xLSmg33pp2gJzXKqb559lxedqqea4mhjrttOweE=;
	b=lzxZT3+uZNiQBf7G4BOKZ2HoE7l7gGXGZPFa+xNFivz2fjzxt3yDElwtYbNnTSb1Y+E6x0Tit
	MZaBgJVxsT+Dem3M2UQiq76YdppN6DLeqMcHwW0naVZU1g4+Wb2LStxzkh2Cauetgq2x0dkfiNV
	oDkAaHGUOcbQjKxZhIsP6EA=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4f8mjJ02dGzpSv1;
	Mon,  9 Feb 2026 22:07:16 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id C71E840567;
	Mon,  9 Feb 2026 22:11:35 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 9 Feb 2026 22:11:35 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <chleroy@kernel.org>, <andriy.shevchenko@intel.com>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<kees@kernel.org>, <andy@kernel.org>
CC: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-hardening@vger.kernel.org>, <lilinjie8@huawei.com>,
	<liaohua4@huawei.com>, <xieyuanbin1@huawei.com>
Subject: Re: [PATCH 2/2] powerpc/text-patching: Fix possible stringop-overread compilation error
Date: Mon, 9 Feb 2026 22:11:25 +0800
Message-ID: <20260209141131.7041-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <5cfae419-427a-471b-8bbe-645f56442e2c@kernel.org>
References: <5cfae419-427a-471b-8bbe-645f56442e2c@kernel.org>
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
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-Spam-Status: No, score=0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,linux.ibm.com,ellerman.id.au,gmail.com];
	TAGGED_FROM(0.00)[bounces-16744-lists,linuxppc-dev=lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:andriy.shevchenko@intel.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:kees@kernel.org,m:andy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lilinjie8@huawei.com,m:liaohua4@huawei.com,m:xieyuanbin1@huawei.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[xieyuanbin1@huawei.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xieyuanbin1@huawei.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,huawei.com:mid,huawei.com:dkim]
X-Rspamd-Queue-Id: 3B6851101C2
X-Rspamd-Action: no action

On Mon, 9 Feb 2026 14:41:51 +0100, Christophe Leroy (CS GROUP) wrote:
> Le 09/02/2026 à 14:25, Xie Yuanbin a écrit :
>> On Fri, 6 Feb 2026 20:53:55 +0100, Christophe Leroy (CS GROUP) wrote:
>>> ppc_kallsyms_lookup_name() only has two callers and they call it with a
>>> built-in string. I think we can do something a lot simpler, something
>>> like (untested):
>>>
>>> static inline unsigned long __ppc_kallsyms_lookup_name(const char *name)
>>> {
>>> 	unsigned long addr = kallsyms_lookup_name(name);
>>>
>>> 	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && addr)
>>> 		addr = ppc_function_entry((void *)addr);
>>>
>>> 	return addr;
>>> }
>>>
>>> #ifdef CONFIG_PPC64_ELF_ABI_V1
>>> #define ppc_kallsyms_lookup_name(x)	__ppc_kallsyms_lookup_name("." ## x);
>>> #else
>>> #define ppc_kallsyms_lookup_name(x)	__ppc_kallsyms_lookup_name(x)
>>> #endif
>>>
>>> Christophe
>>
>> When CONFIG_PPC64_ELF_ABI_V1=y, it seems that the try of lookupinp
>> the original non-dot symbol is missing.
>>
>> What about this (Only the compilation test is performed):
>> ```c
>> static inline unsigned long __ppc_kallsyms_lookup_name(const char *name)
>> {
>> 	unsigned long addr = kallsyms_lookup_name(name);
>>
>> 	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && addr)
>> 		addr = ppc_function_entry((void *)addr);
>>
>> 	return addr;
>> }
>>
>> #define ppc_kallsyms_lookup_name(x) ({					\
>> 		unsigned long addr = 0;					\
>> 		if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V1))		\
>> 			addr = __ppc_kallsyms_lookup_name("." x);	\
>> 		if (!addr)						\
>> 			addr = __ppc_kallsyms_lookup_name(x);		\
>> 		addr;							\
>> 	})
>> ```
>
> Good point.
>
> To avoid duplicating the string I'd suggest:
>
> static inline unsigned long __ppc_kallsyms_lookup_name(const char *name)
> {
> 	unsigned long addr = kallsyms_lookup_name(name);
>
> 	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V1) && !addr)
> 		addr = kallsyms_lookup_name(name + 1);
> 	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && addr)
> 		addr = ppc_function_entry((void *)addr);
>
> 	return addr;
> }
>
> #ifdef CONFIG_PPC64_ELF_ABI_V1
> #define ppc_kallsyms_lookup_name(x)	__ppc_kallsyms_lookup_name("." x);
> #else
> #define ppc_kallsyms_lookup_name(x)	__ppc_kallsyms_lookup_name(x)
> #endif

This seems good, but there seems to be an extra ';' after
'__ppc_kallsyms_lookup_name("." x)' ?

After removing the extra ';', I performed a compilation test,
no warnings.

