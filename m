Return-Path: <linuxppc-dev+bounces-11784-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF575B45631
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 13:20:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJDRZ0B3rz3cbl;
	Fri,  5 Sep 2025 21:20:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757071241;
	cv=none; b=m/B/MsNWOBKVamepaiJmuuLvdo1SWoAvsInmlo9yVOgVtQl0d1LM4Gs/5AO2l2pJ3ZIjBYEyBxdJK8fnaCpgLyIRMt23sB3bhaKHXA01oXvz3aM/IVTSZT/S3hNWqIpP9TbjS5e0dH5P8QiBZLsfF0LeOIjgL7opjM2J46BzGvCTX7/RJO3a2X2z+m9Kw34hisLkUiQlNjeP32Y8OiFemQytL8HDbsZwbGui01oMIybdoPytXTlfBGIMBQ82gmLuD134fby9fLhsibBTyTC2KwW10gqLa/NKluwedLgn/2rSd/ZNNrJpnfaoDkbYC0nSzDD2R0wifChKeh8kN249ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757071241; c=relaxed/relaxed;
	bh=kxTPTBEebYOgkl4yaHoRVIy4duqkDYKSTeNYq61OK+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUh0oUsC8yfAOAM5t6CCw8xkl9EG+Nc/09Uhfg8F+B4sUE/mDSU8Av018QqhIZqPbOsyGHTmnt7OQzvIREgc5PIrJO43SOODm8WrBdSuaopQPTrTRoueU67N6N5CMe0HY8OXldFc1w5F29HSI/FuipSGYWpQmUlsZZ4nvSWcsJZlFgezYuMCLN2fLgHq13qSG+iZyj5GTyyosj/hMvCu4pZa8JsYmO8Rzt4hu7uXDStPEWLL/+Su+AYT8xmlCo3Gi3oIsfAnbnXfGI1Kja3GkFIwsIychWl5MpkqavLHvD1Z3+OzEZI7KFsKjosvgrtysC3oyYldUMAPJaVLPY9L2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJDRY2TlSz3c3K
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 21:20:41 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cJBH56SbMz9sSX;
	Fri,  5 Sep 2025 11:43:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T654Yx4sq1w0; Fri,  5 Sep 2025 11:43:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cJBH55WMMz9sS8;
	Fri,  5 Sep 2025 11:43:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A568B8B774;
	Fri,  5 Sep 2025 11:43:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uNL1AnKXOGoz; Fri,  5 Sep 2025 11:43:13 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3585E8B773;
	Fri,  5 Sep 2025 11:43:13 +0200 (CEST)
Message-ID: <36aabfe5-b862-404b-8175-ebe5dab59427@csgroup.eu>
Date: Fri, 5 Sep 2025 11:43:12 +0200
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
Subject: Re: [PATCH] powerpc/32: Remove PAGE_KERNEL_TEXT to fix startup
 failure
To: Andrew Donnellan <ajd@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Erhard Furtner <erhard_f@mailbox.org>
References: <342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org>
 <4b5e6eb281d7b1ea77619bee17095f905a125168.1757003584.git.christophe.leroy@csgroup.eu>
 <977ad5eef4f8726e9d5bff31b758918f0341659d.camel@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <977ad5eef4f8726e9d5bff31b758918f0341659d.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 05/09/2025 à 08:57, Andrew Donnellan a écrit :
> On Thu, 2025-09-04 at 18:33 +0200, Christophe Leroy wrote:
>> PAGE_KERNEL_TEXT is an old macro that is used to tell kernel whether
>> kernel text has to be mapped read-only or read-write based on build
>> time options.
>>
>> But nowadays, with functionnalities like jump_labels, static links,
>> etc ... more only less all kernels need to be read-write at some
>> point, and some combinations of configs failed to work due to
>> innacurate setting of PAGE_KERNEL_TEXT. On the other hand, today
>> we have CONFIG_STRICT_KERNEL_RWX which implements a more controlled
>> access to kernel modifications.
>>
>> Instead of trying to keep PAGE_KERNEL_TEXT accurate with all
>> possible options that may imply kernel text modification, always
>> set kernel text read-write at startup and rely on
>> CONFIG_STRICT_KERNEL_RWX to provide accurate protection.
>>
>> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
>> Closes:
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F342b4120-911c-4723-82ec-d8c9b03a8aef%40mailbox.org%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ce1df868f94284b06db0508ddec497516%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638926522413828188%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=cqhzYIshhwKJluL2U2ULuNYoQ1CR1ZP0nsl5pb3wHd4%3D&reserved=0
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> The original issue that Erhard and I were investigating was why the latest
> version of the PowerPC page table check series[0] was failing on his G4, when
> built as part of a config with many other debugging options enabled.
> 
> With further instrumentation, it turns out that this was due to a failed
> instruction patch while setting up a jump label for the
> page_table_check_disabled static key, which was being checked in
> page_table_check_pte_clear(), which was in turn inlined ultimately into
> debug_vm_pgtable().
> 
> This patch seems to fix the problem, so:
> 
> Tested-by: Andrew Donnellan <ajd@linux.ibm.com>
> 
> But I'm still curious about why I only see the issue when:
> 
>    (a) CONFIG_KFENCE=y (even when disabled using kfence.sample_interval=0) -
> noting that changing CONFIG_KFENCE doesn't change the definition of
> PAGE_KERNEL_TEXT; and
> 
>    (b) when the jump label ends up in a __init function (removing __init from
> debug_vm_pgtable() and its associated functions, or changing the code in such a
> way that the static key check doesn't get inlined, resolves the issue, and
> similarly for test_static_call_init() when CONFIG_STATIC_CALL_SELFTEST=y).
> 
> I don't understand the mm code well enough to make sense of this.

That makes sense. When CONFIG_KFENCE is selected, only text and rodata 
are mapped with BATs. Everything else including inittext is mapped with 
pages. When CONFIG_KFENCE and CONFIG_DEBUG_PAGEALLOC are not selected, 
we map as much as possible with BATs.

And as you can see below, BATs are mapped with PAGE_KERNEL_X not with 
PAGE_KERNEL_TEXT.

Everything happen here below:

static unsigned long __init __mmu_mapin_ram(unsigned long base, unsigned 
long top)
{
	int idx;

	while ((idx = find_free_bat()) != -1 && base != top) {
		unsigned int size = bat_block_size(base, top);

		if (size < 128 << 10)
			break;
		setbat(idx, PAGE_OFFSET + base, base, size, PAGE_KERNEL_X);
		base += size;
	}

	return base;
}

unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
{
	unsigned long done;
	unsigned long border = (unsigned long)__srwx_boundary - PAGE_OFFSET;
	unsigned long size;

	size = roundup_pow_of_two((unsigned long)_einittext - PAGE_OFFSET);
	setibat(0, PAGE_OFFSET, 0, size, PAGE_KERNEL_X);

	if (debug_pagealloc_enabled_or_kfence()) {
		pr_debug_once("Read-Write memory mapped without BATs\n");
		if (base >= border)
			return base;
		if (top >= border)
			top = border;
	}

	if (!strict_kernel_rwx_enabled() || base >= border || top <= border)
		return __mmu_mapin_ram(base, top);

	done = __mmu_mapin_ram(base, border);
	if (done != border)
		return done;

	return __mmu_mapin_ram(border, top);
}


> 
> [0] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20250813062614.51759-1-ajd%40linux.ibm.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ce1df868f94284b06db0508ddec497516%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638926522413849910%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=1slIkZ4krf2sWUaKJ%2FayEX8t9dKpfsrDiAxZRohKfRQ%3D&reserved=0
> 


