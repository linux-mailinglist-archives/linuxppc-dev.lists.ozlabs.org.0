Return-Path: <linuxppc-dev+bounces-592-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 546B19604E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 10:50:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtLpR1GJhz2yS0;
	Tue, 27 Aug 2024 18:50:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724748607;
	cv=none; b=B+PWy+oGgbC+4uU0jQTdeRPRniJ61kQwCFe0OVE6MjlYm4NjXQ25cM8veU0K3ndSkzm7R2/P3l3cbzYKJVMQ6v4LN5xmBdN02s9e2X1SzNmtx6eQkUe1O8Fm8IbuIZ/gH5+5vDNO6PKDTIUT29MkZfb4EMMetlFfrip8MPjp6BWV/R1aYZFgMRI+VDaJZmqr5HQgUI0Tdnf+/26AMLxtIPJBSJlK53A/nOPkUhG/Qd3CuSwq+53yrFSIEKeWRfCROLl0wWQvF22UXjm01Uja4p1iwVMEX1AsmD0dBzvNzTnC4XGJej2qHzholFHn6QedFxDlngt+YMPl50KkmoAjXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724748607; c=relaxed/relaxed;
	bh=Z44NrRIFjIvMOiwZi/d/I4Tv8shrT6h3mF70sIWGs6A=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=BqY/Q8Qz3UpME/hcPQfTKG6xNz9Wq8IHDm0c30uzV2Mhxrx7FTl4JG0QBWewBtYBSY5ZeBmrzbWo1MZh+Q/Y7e/9JQK4uBoQuL80Mm36ovuZZUKWBgOGWok+biXPYfcPGF4APsoS7X1ctrH8y8O8MfRuQJm99WmTsGCX+1TlufUBZLXa05uzl2Nq3mUS4Hwqap6mGRkc83+bCvcAQkhSj6bGkT5+phKEsfT2lX/xpV4FUb5sY86GJ8Pr33Dc4mSG6rwWaDdb7D8y/2uYt9UScwk1JKDCKUvzShXOILy/bpZmfIdCljNvt5dJIjbdsQqHUgNtY1hsLZ7kPxgqBCearA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtLpQ5rwfz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 18:50:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WtL3V5NkGz9sRy;
	Tue, 27 Aug 2024 10:16:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOUXLlQcHZNN; Tue, 27 Aug 2024 10:16:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WtL3R6BsYz9rvV;
	Tue, 27 Aug 2024 10:16:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C3B4D8B77B;
	Tue, 27 Aug 2024 10:16:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nz5gQiZQEV5x; Tue, 27 Aug 2024 10:16:19 +0200 (CEST)
Received: from [192.168.233.149] (PO19727.IDSI0.si.c-s.fr [192.168.233.149])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 270028B763;
	Tue, 27 Aug 2024 10:16:19 +0200 (CEST)
Message-ID: <55a7d3ba-b384-4fb0-8fbb-e05ddf0d1fb8@csgroup.eu>
Date: Tue, 27 Aug 2024 10:16:18 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] random: vDSO: Don't use PAGE_SIZE and PAGE_MASK
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org
References: <cover.1724743492.git.christophe.leroy@csgroup.eu>
 <b8f8fb6d1d10386c74f2d8826b737a74c60b76b2.1724743492.git.christophe.leroy@csgroup.eu>
 <Zs2FJku2hM2bp4ik@zx2c4.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <Zs2FJku2hM2bp4ik@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 27/08/2024 à 09:49, Jason A. Donenfeld a écrit :
> On Tue, Aug 27, 2024 at 09:31:48AM +0200, Christophe Leroy wrote:
>> -	ssize_t ret = min_t(size_t, INT_MAX & PAGE_MASK /* = MAX_RW_COUNT */, len);
>> +	const unsigned long page_size = 1UL << CONFIG_PAGE_SHIFT;
>> +	const unsigned long page_mask = ~(page_size - 1);
>> +	ssize_t ret = min_t(size_t, INT_MAX & page_mask /* = MAX_RW_COUNT */, len);
> 
> I'm really not a fan of making the code less idiomatic...

Ok, I have another idea, let's give it a try.

> 
>> An easy solution would be to define PAGE_SIZE and PAGE_MASK in vDSO
>> when they do not exist already, but this can be misleading.
> 
> Why would what tglx and I suggested be misleading? That seems pretty
> normal... Are you worried they might mismatch somehow? (If so, why?)

All architectures have their own definition, they are all based on 
CONFIG_PAGE_SHIFT and should give the same value but with some 
subtleties. The best would be to have an asm-generic definition of 
PAGE_SIZE and PAGE_MASK that all architectures use, but that's another 
level of work.

tglx or yourself suggested to put in a one of the vdso headers instead 
of directly in getrandom.c. This is too fragile because PAGE_SIZE might 
be absent in that header but arrive in getrandom.c through another header.

Christophe

