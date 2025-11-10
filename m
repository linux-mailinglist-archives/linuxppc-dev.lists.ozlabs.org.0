Return-Path: <linuxppc-dev+bounces-14006-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC68CC463D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 12:27:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4nSp3jd0z2xqM;
	Mon, 10 Nov 2025 22:27:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762774042;
	cv=none; b=mjtMq1l9Xh37X03IMtqW8aNZuJFoDdyak7v6yFuXQ+O7xwkeQxb9PLTCVu3RCSMqxIVseIcbVBLj4Cthas2bP0JJytwhfSK67EMtxMt60U4H8D4O/zJSA5lUlYaId2O7WY2WgTLlIAn4SbCB8e7nz+iLnoxB1o0uShD3nBq7CC5H6+ffpfYMqCS0sIMN/zdCWyHgfgGZ9vdTlNWxGHgy7fg34id3g4Z3iUQ46/LNUf29TqU8gZapRew+rUMWBnacomWdf3Ez3htxy3ukDoMLMXI+n3jif0KnO3rqJgq/Vp4T1UXLcR0xDXgsDENhzDxZCXnYkIUtbbzxWxxwk6Cpwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762774042; c=relaxed/relaxed;
	bh=GSNL8R/Rp4rPOwE/chfZPtHWTIC9bs/JwQXU3FZ9tzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxJCGS1AsaFHVPRaDEbGNEf6BBIokMawo9/uPJaII8iXmQHlxJmId3UezJ3Mv2pAIcS/Ksur0lFrf/ZdtTjRQv4yRfxYDBeEV3xV6XP1+n7FmhtnywnyBn4627DhY2el3KUKrneRGgr/azC/Sv8OeAIzCyhbytwy6VWOF8gbkaHuCTXkK/tuhMTEPVsAk3rWaaEPZl7xQ6iQcUnd0IwqtVjuSdRXb2oVorHRBmVeFnhIU7p+TeMfoDQFCd7vIrwNaIBAdGPjXMJ1lW4IZq+5UVurecLMCPBNJ9ndHPUpHWe7bmED5aVbImabQ7p+6NEHq6rbAx600t75ZO6QJO83cg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d9K9eBBt; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d9K9eBBt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4nSn4tt8z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 22:27:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92B8841A8E;
	Mon, 10 Nov 2025 11:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48BDC4CEF5;
	Mon, 10 Nov 2025 11:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762774039;
	bh=Jac0LD3KXWWf3Vbx0ZbUSjZpPlnaV+M2uPxJVWQYQ7w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d9K9eBBtXiPjSMfSz4PKDmstvz0ViHtu0W6ZdPlUt++Yd4erGgSkgpupDk20YRyDN
	 7Au8CdOyDgQ1SzKoPZwAKxZnhVxS2O8S8gUh8HaIHpJKWyg9yamJtjLQwgiCNhsjDe
	 3y78YuI4/grbiZkBc1mVhZol5iSIWeBnzSTOjoiKDhRdG6LXnX5BFJ6Fr1TMuCewOL
	 eUwfDlHAi0SczJQDuqdSl/K0TQA5Ps23TP36UIQ+ujhsQiylSPGXSuKqcThzTrAIWs
	 7lOz/hnU7h1hepIoO0F1YX77ghSH8weiaUzZVYYyqNHSbEW+sqYdN0rhK4qDY1ZB1R
	 zTxwJSMT7s9DA==
Message-ID: <cdd23dd6-5444-4000-ac68-a72b22bf6a57@kernel.org>
Date: Mon, 10 Nov 2025 12:27:16 +0100
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
Subject: Re: powerpc/e500: WARNING: at mm/hugetlb.c:4755 hugetlb_add_hstate
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com>
 <dd634b17-cc5e-497c-8228-2470f6533177@redhat.com>
 <82ef1da8-44c4-4a58-bd00-9839548cb72d@csgroup.eu>
 <ba3a2131-c8d4-481d-aebb-d25be7ae0d19@kernel.org>
 <d62eea1f-3aff-4b51-976a-4cb8abf502bf@csgroup.eu>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <d62eea1f-3aff-4b51-976a-4cb8abf502bf@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Thanks for the review!

> 
> So I think what you want instead is:
> 
> diff --git a/arch/powerpc/platforms/Kconfig.cputype
> b/arch/powerpc/platforms/Kconfig.cputype
> index 7b527d18aa5ee..1f5a1e587740c 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -276,6 +276,7 @@ config PPC_E500
>           select FSL_EMB_PERFMON
>           bool
>           select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
> +       select ARCH_HAS_GIGANTIC_PAGE if ARCH_SUPPORTS_HUGETLBFS
>           select PPC_SMP_MUXED_IPI
>           select PPC_DOORBELL
>           select PPC_KUEP
> 
> 
> 
>>        select ARCH_HAS_KCOV
>>        select ARCH_HAS_KERNEL_FPU_SUPPORT    if PPC64 && PPC_FPU
>>        select ARCH_HAS_MEMBARRIER_CALLBACKS
>> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/
>> platforms/Kconfig.cputype
>> index 7b527d18aa5ee..4c321a8ea8965 100644
>> --- a/arch/powerpc/platforms/Kconfig.cputype
>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>> @@ -423,7 +423,6 @@ config PPC_64S_HASH_MMU
>>    config PPC_RADIX_MMU
>>        bool "Radix MMU Support"
>>        depends on PPC_BOOK3S_64
>> -    select ARCH_HAS_GIGANTIC_PAGE
> 
> Should remain I think.
> 
>>        default y
>>        help
>>          Enable support for the Power ISA 3.0 Radix style MMU. Currently


We also have PPC_8xx do a

	select ARCH_SUPPORTS_HUGETLBFS

And of course !PPC_RADIX_MMU (e.g., PPC_64S_HASH_MMU) through PPC_BOOK3S_64.

Are we sure they cannot end up with gigantic folios through hugetlb?

-- 
Cheers

David

