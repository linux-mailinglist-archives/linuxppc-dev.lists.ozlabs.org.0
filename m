Return-Path: <linuxppc-dev+bounces-16743-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM5yBTDkiWnGCwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16743-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 14:42:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CDA10FD77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 14:42:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8m8B30Qhz2yGx;
	Tue, 10 Feb 2026 00:42:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770644522;
	cv=none; b=WtHSgrQ2HOPI/sJOGot+UuA5ezY/biWfb5st0jxM2Z/Q/wDsoqhyrWMG6Eox6YHGxkvH5IAplR40eCrtyy/0k7bTC5A8FthjEcjAYm+45H9LEavJj3qmuR/UTfsKWVZvYnhU2ZZtNi0SjFZyhkMSciPc5sXh3VencPLxvnTaBJa5NUOL57lEnZJRnLZ2L6vy6u87o3PKukcF5eNHbuIX4+MGoWrT9pZPuJcZm8HCUPv7DbnA2uf+NYvgRtbc/OWJ9OZe/MW6U39L+s6nxWWR2AMXuXkfhLVFG8BCBOYiJtt8snhgg453xSQaZjPJuNB9d358nOu1pRPcHVhfTEmXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770644522; c=relaxed/relaxed;
	bh=YzpX1B5ku41qSone6O/eoJnqCNCKjg2qWiOK+OBuAgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dcdp+BaY4iEVVxDvhmJmA6rM0+9el3IhM2KPJ1weE6d/7knAe5i4NgEVKOTodcJHeivzoFqC45rCfXnMW3HXRRer4fLlH7oXfhePEPFj3UMCYKW9HIvVSWm0wMWRfIKshD7KNshqf6l7xpcwCVIBIs9un1LucM+TX4vMmU5Cf4jPlRdhBy9fCm9p2s8/xOJTqO4X6qCW69lMxgdREJOIAmV7x2k8EGdYWNxgI8avjYm0ZwUmB5MbjulygPEq0MZo+BF4HB2RXe4kLWKpPsvvFymQhg5+3RDuSaXhxKo9I86fyywQFTEcppWAkPdFiNEOT6kwPr10oGBoFIKm8YXuzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QbS3j8to; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QbS3j8to;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8m890HLfz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 00:42:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0CF060132;
	Mon,  9 Feb 2026 13:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA55C116C6;
	Mon,  9 Feb 2026 13:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770644516;
	bh=Ew7kN46rhGDM4dEiPsUsVqK/GgQOgN3YtDNu7vHLVtw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QbS3j8toBchCyyOG4nENlUg2D4KmlTtxqT2G/uTWdMpPr6141acVfjkqkreoHBAFz
	 tZ3XpuiHA46IJzEPNsxDfIELspw/dngnfh3WvCNPL9OBeXIhPUEL68qFNJeMxO2RE2
	 nGY9lRw5pGAIdBHtfvAJATm0kYt93zY9vveYVKJed6Yh7MgjtCuPswtdzNPnPU3soi
	 yDWTIW5YEeFR2X/k5UGoyRCsgWfhMErov5XltYJmXTXD4gzzheqW1w8tXuDlCJX94e
	 le+kDh3zM8NsqQXfHdWTOlTfufJQfcU5wJVwFywPVnAyj3x1OJ7Jdf3h/nABIqdtL3
	 qi20Z4MC/uYPg==
Message-ID: <5cfae419-427a-471b-8bbe-645f56442e2c@kernel.org>
Date: Mon, 9 Feb 2026 14:41:51 +0100
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
Subject: Re: [PATCH 2/2] powerpc/text-patching: Fix possible stringop-overread
 compilation error
To: Xie Yuanbin <xieyuanbin1@huawei.com>, andriy.shevchenko@intel.com,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, kees@kernel.org,
 andy@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, lilinjie8@huawei.com, liaohua4@huawei.com
References: <bca0abe3-5b8d-4493-a338-b41322e9e85d@kernel.org>
 <20260209132510.84205-1-xieyuanbin1@huawei.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260209132510.84205-1-xieyuanbin1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:xieyuanbin1@huawei.com,m:andriy.shevchenko@intel.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:kees@kernel.org,m:andy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lilinjie8@huawei.com,m:liaohua4@huawei.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[huawei.com,intel.com,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16743-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 26CDA10FD77
X-Rspamd-Action: no action



Le 09/02/2026 à 14:25, Xie Yuanbin a écrit :
> On Fri, 6 Feb 2026 20:53:55 +0100, Christophe Leroy (CS GROUP) wrote:
>> Le 06/02/2026 à 19:26, Kees Cook a écrit :
>>>
>>> Isn't it possible to do this and not need __compiletime_strlen at all?
>>>
>>> 	n_len = strnlen(name, min(__member_size(name), KSYM_NAME_LEN));
>>
>> ppc_kallsyms_lookup_name() only has two callers and they call it with a
>> built-in string. I think we can do something a lot simpler, something
>> like (untested):
>>
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
>> #ifdef CONFIG_PPC64_ELF_ABI_V1
>> #define ppc_kallsyms_lookup_name(x)	__ppc_kallsyms_lookup_name("." ## x);
>> #else
>> #define ppc_kallsyms_lookup_name(x)	__ppc_kallsyms_lookup_name(x)
>> #endif
>>
>> Christophe
> 
> When CONFIG_PPC64_ELF_ABI_V1=y, it seems that the try of lookupinp
> the original non-dot symbol is missing.
> 
> What about this (Only the compilation test is performed):
> ```c
> static inline unsigned long __ppc_kallsyms_lookup_name(const char *name)
> {
> 	unsigned long addr = kallsyms_lookup_name(name);
> 
> 	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && addr)
> 		addr = ppc_function_entry((void *)addr);
> 
> 	return addr;
> }
> 
> #define ppc_kallsyms_lookup_name(x) ({					\
> 		unsigned long addr = 0;					\
> 		if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V1))		\
> 			addr = __ppc_kallsyms_lookup_name("." x);	\
> 		if (!addr)						\
> 			addr = __ppc_kallsyms_lookup_name(x);		\
> 		addr;							\
> 	})
> ```

Good point.

To avoid duplicating the string I'd suggest:

static inline unsigned long __ppc_kallsyms_lookup_name(const char *name)
{
	unsigned long addr = kallsyms_lookup_name(name);

	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V1) && !addr)
		addr = kallsyms_lookup_name(name + 1);
	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && addr)
		addr = ppc_function_entry((void *)addr);

	return addr;
}

#ifdef CONFIG_PPC64_ELF_ABI_V1
#define ppc_kallsyms_lookup_name(x)	__ppc_kallsyms_lookup_name("." x);
#else
#define ppc_kallsyms_lookup_name(x)	__ppc_kallsyms_lookup_name(x)
#endif

