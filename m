Return-Path: <linuxppc-dev+bounces-1812-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81935993EAA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 08:24:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XN5b23Kmsz2xGX;
	Tue,  8 Oct 2024 17:24:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728368670;
	cv=none; b=aOiZ3WoNlyPhweBhaZKGI2CtPJlReLLzCzsCrzl+IPyKdffvKa3X0docah5MkoL69curaxx71FcYGQzp96bkjM/dEeKHeQamKATE6gOtJZ3hHPsmHXFgxEte4aZpWb+eQwlYErnmD2BbEJo9B7I7Za/IqcMqAmSVugjnnGiXKhdnGDTKMmeehRmlZg0Dw5gtE1yaxpnRJ7Aa5l98DXwswaXxPG4duTztRfQugTXjJKXYZe0TLIlgx+ev6YR3BlTsY9A/AkutQtV3d7FeW3hNSMBYNyhhnPvHqU5+dEXk6srlDzxJLtz1Xsq0bZfnw+KSww6WiwMtgyVRdqpoRf/zXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728368670; c=relaxed/relaxed;
	bh=t/k+xLDuYv3OroiT3rOCCXtk5GvlauA45xjNg18mkHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QqF5QKMCvqmXLkqsjxgq7gsOZ35JD+F4ddsN4dPy6uaJScRRUF2ggOOLv6MxI8KArOECg9KwD01eosLbv22YwLHdh5ibeXlsPQjEpFzEE1+T95U4XFXE0zLbZKChadoOlHMJR42YvuZPTerk7yd8GMtfvDpnGBZQ3zePYGJZE32L6UBQpTivIFxo5Gsv/7JbkeRvCy78E6lYXq7MxsnBbu1mb2jZI9Wv70M0ii78w+TiPyCsinNPRx44IIq8gM9o9KnDegh3CJGfc26lM/ASn7BJDsop5EvRRHPtUPfazSuqW+XVmoEbKfIszAA8LgSxelPllODxSekLcuUc3cxzgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN5b13Cw0z2xCp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 17:24:28 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XN5Zw3r7hz9sPd;
	Tue,  8 Oct 2024 08:24:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 83WsnfrASkNO; Tue,  8 Oct 2024 08:24:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XN5Zw2vlKz9rvV;
	Tue,  8 Oct 2024 08:24:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F4488B788;
	Tue,  8 Oct 2024 08:24:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WqcteU_NOog8; Tue,  8 Oct 2024 08:24:24 +0200 (CEST)
Received: from [192.168.233.14] (unknown [192.168.233.14])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0CB258B763;
	Tue,  8 Oct 2024 08:24:23 +0200 (CEST)
Message-ID: <8e99826f-b38a-4cb3-ba5e-a20512248853@csgroup.eu>
Date: Tue, 8 Oct 2024 08:24:22 +0200
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
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
To: Steven Rostedt <rostedt@goodmis.org>, LKML
 <linux-kernel@vger.kernel.org>,
 Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20241007204743.41314f1d@gandalf.local.home>
 <20241007205458.2bbdf736@gandalf.local.home>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241007205458.2bbdf736@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 08/10/2024 à 02:54, Steven Rostedt a écrit :
> On Mon, 7 Oct 2024 20:47:43 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
>> +#ifndef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
>> +struct __arch_ftrace_regs {
>> +	struct pt_regs		regs;
>> +};
>> +
>> +#define arch_ftrace_get_regs(fregs)					\
>> +	({ struct __arch_fregs_regs *__f = (struct __arch_ftrace_regs *)(fregs); \
>> +		&__f->regs;						\
>> +	})
> 
> I wrote the arch_ftrace_get_regs() at the start of creating this patch.
> 
>> +
>> +struct ftrace_regs;
>> +#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
>> +
> 
> I just realized I can simplify it with:
> 
> #define arch_ftrace_get_regs(fregs)	({ &arch_ftrace_regs(fregs)->regs; })

Is it possible to write it as a static inline function to enforce type 
checking ?

> 
> I may send a v2 (tomorrow).
> 
> -- Steve

