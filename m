Return-Path: <linuxppc-dev+bounces-16701-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBIeIeJGhmkhLgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16701-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 20:54:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F433102EA6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 20:54:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f74Xs4Pqgz30Lv;
	Sat, 07 Feb 2026 06:54:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770407645;
	cv=none; b=C8kEbEuh15TugacOMezqVvc23qe43mCQ7U4uT/YB2PavpOgmHZllCAlo2xifnvLMVMn4Zm/nPJKRw+Eix+7d6SivDdjJ2+DXBLBdtk6fYO3usdFxYhoQ8COx15/RW/0rFO3DwoThELer5sWa6IlPLNDalwWsjtbm5xzd+gf6E3CLSbp0N02erBD8SYa3MiwInh9rl7381YyEezaWshVONAMnf+dJAH7CPLJC5EFvUHrutTDlP8RbvuZVOHKOxi29ROQMR/al9ym+quSs2vXTevbdNddEotgWRPPGUCXzyjdcyPQxgwwCB0OMd9imWXls9WMixJo7KOzt6GORb6jQqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770407645; c=relaxed/relaxed;
	bh=+I7UAK1IjMD7Bo09lDyMkeUG92zZAlLP2I1S1ovYfGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8cQEX8LIC4P8k0jzPyMWlIik+MKYp2nEn5qScvVTxy50yx0nXHIjOSQATP2npeGmMg+kFacUnbJ0o+CWz66iA/KFFFNUV7wseTJHJAKWVgxaR5D7f+j2/qW/Up8ycjgRln6YSvoDhWvnsg8SDYKg5FffKBEQJQ6mymDvs/DkvGn0szmGGYGSKwjKyHBlCKPMKWm5GAJsXoaIznD6gCFKoSo5DwA39njwYnAg8MGzdEoig07+bhyFnfccItVR04Ks5d5u5qy0bli3J5h2kaqax6X2GNFM89xNaVZ1Az8eOyqpH6aQpe9fyxho8cpy7co//Jw5JQOiNbx34W9/KrHIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HDAa4U/3; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HDAa4U/3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f74Xr0LRBz30FP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 06:54:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BFDF43FA9;
	Fri,  6 Feb 2026 19:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1567C116C6;
	Fri,  6 Feb 2026 19:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770407641;
	bh=zuTx45IAXwCCZxQU6FBP5xFVJffmh2hCgzQapegT9vw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HDAa4U/3FllAHrt8tgmweRCEeXs78x4KO6JSUioK8jcWQVszKIa6U7gxfZvgEYm4h
	 B6/AHZMLBH6lvH1gSkfgLdfNR3y7acJGFCHc2qJKzo/O84tOuaYpq09pVyenUA/tAX
	 zdIHeVSiKlEePQDpV2CXOdWDbc1mK4xz5XPFRe061GFSeBSxlLEJncJPl9FPe1Rc8r
	 axac7GCT2qmxi1Pia/PKTkfZntTavmsr0apQrMS7ZlrL+SwlU69RK+mnWAOjcrHTu+
	 JB+7IPaxEGFziQFuLXjK3bPnIkxrsSEFaylMjKarxFURKBCTtQQ1jF3KVcFZKWN3it
	 Zsc202ZRu+bWg==
Message-ID: <bca0abe3-5b8d-4493-a338-b41322e9e85d@kernel.org>
Date: Fri, 6 Feb 2026 20:53:55 +0100
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
To: Kees Cook <kees@kernel.org>, Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 andy@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 lilinjie8@huawei.com, liaohua4@huawei.com
References: <20260205100517.292858-1-xieyuanbin1@huawei.com>
 <20260205100517.292858-2-xieyuanbin1@huawei.com>
 <202602061024.111ED487@keescook>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <202602061024.111ED487@keescook>
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
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16701-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,lists.ozlabs.org,vger.kernel.org,huawei.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:xieyuanbin1@huawei.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:andy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lilinjie8@huawei.com,m:liaohua4@huawei.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5F433102EA6
X-Rspamd-Action: no action



Le 06/02/2026 à 19:26, Kees Cook a écrit :
> On Thu, Feb 05, 2026 at 06:05:17PM +0800, Xie Yuanbin wrote:
>> For strnlen(), if the compiler detects that the maxlen argument exceeds
>> the valid memory size of the input string object, a compilation error may
>> occur.
>>
>> For lastest linux-next source, changing ppc_kallsyms_lookup_name() to
>> __always_inline, using default ppc64_defconfig, and setting
>> CONFIG_EXPERT=y, CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2=n,
>> CONFIG_CC_OPTIMIZE_FOR_SIZE=y. Then, when using gcc-15 for compilation,
>> the following error will be triggered:
>> ```log
>>    CC      arch/powerpc/kernel/optprobes.o
>> In file included from ./arch/powerpc/include/asm/kprobes.h:24,
>>                   from ./include/linux/kprobes.h:31,
>>                   from arch/powerpc/kernel/optprobes.c:8:
>> In function ‘ppc_kallsyms_lookup_name’,
>>      inlined from ‘arch_prepare_optimized_kprobe’ at arch/powerpc/kernel/optprobes.c:209:21:
>> ./arch/powerpc/include/asm/text-patching.h:232:13: error: ‘strnlen’ specified bound 512 exceeds source size 19 [-Werror=stringop-overread]
>>    232 |         if (strnlen(name, KSYM_NAME_LEN) >= KSYM_NAME_LEN)
>>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> In function ‘ppc_kallsyms_lookup_name’,
>>      inlined from ‘arch_prepare_optimized_kprobe’ at arch/powerpc/kernel/optprobes.c:210:22:
>> ./arch/powerpc/include/asm/text-patching.h:232:13: error: ‘strnlen’ specified bound 512 exceeds source size 13 [-Werror=stringop-overread]
>>    232 |         if (strnlen(name, KSYM_NAME_LEN) >= KSYM_NAME_LEN)
>>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> ```
>>
>> Refer to the implementation of fortify's strnlen(). If the string length
>> is a compile-time constant, do not call the strnlen() function.
>>
>> Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
>> ---
>>   arch/powerpc/include/asm/text-patching.h | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/text-patching.h b/arch/powerpc/include/asm/text-patching.h
>> index e7f14720f630..ce1b2131980a 100644
>> --- a/arch/powerpc/include/asm/text-patching.h
>> +++ b/arch/powerpc/include/asm/text-patching.h
>> @@ -228,8 +228,13 @@ static inline unsigned long ppc_kallsyms_lookup_name(const char *name)
>>   	/* check for dot variant */
>>   	char dot_name[1 + KSYM_NAME_LEN];
>>   	bool dot_appended = false;
>> +	size_t n_len = __compiletime_strlen(name);
>> +	const size_t n_size = __member_size(name);
>>   
>> -	if (strnlen(name, KSYM_NAME_LEN) >= KSYM_NAME_LEN)
>> +	if (n_len == SIZE_MAX || KSYM_NAME_LEN < n_size)
>> +		n_len = strnlen(name, KSYM_NAME_LEN);
>> +	
>> +	if (n_len >= KSYM_NAME_LEN)
>>   		return 0;
> 
> Isn't it possible to do this and not need __compiletime_strlen at all?
> 
> 	n_len = strnlen(name, min(__member_size(name), KSYM_NAME_LEN));

ppc_kallsyms_lookup_name() only has two callers and they call it with a 
built-in string. I think we can do something a lot simpler, something 
like (untested):

static inline unsigned long __ppc_kallsyms_lookup_name(const char *name)
{
	unsigned long addr = kallsyms_lookup_name(name);

	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && addr)
		addr = ppc_function_entry((void *)addr);

	return addr;
}

#ifdef CONFIG_PPC64_ELF_ABI_V1
#define ppc_kallsyms_lookup_name(x)	__ppc_kallsyms_lookup_name("." ## x);
#else
#define ppc_kallsyms_lookup_name(x)	__ppc_kallsyms_lookup_name(x)
#endif

Christophe

