Return-Path: <linuxppc-dev+bounces-7511-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B2FA7F5E9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 09:21:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWyDQ1bldz2yrH;
	Tue,  8 Apr 2025 17:21:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744096870;
	cv=none; b=TdsrRS5PQH9Z4FRZqdwuRH4mPvoNENUEdyr8bwHLq0qMY8KJeH8gdH0YixJ6yu2camNE36mG9x39N4vDeB5eYoBMme7qWRXT+hKfjKhZOToJFAVyXDOFJ/q7TcfHQwXYUQXE7p7iyTBYyOneWiUOrh+F3NK05PamfJ2ZC6I8obWSEG0XtggUmLywQ8OmTo7391LD+o+CpFc0OlMDZR1k0ZMdV/yuP8ZvbdIf7UYkL837Lv9IT0mpEYYAZ4AY08ad/5ZzkYhL12IaYVmWu/s7fJRlHS+Qabd8aFpqJb1Ru+k9LXF/GbRStOHAonV9e826J81gi6XyEQhdqYFMtTNsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744096870; c=relaxed/relaxed;
	bh=ZxMGG04EPMAWKey8j7JhNalgvxUnjwJSpyC2cpoCPyA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OHv/mPbaoP1jkmB5qjqpp5uy/R7GOwiA62djDRgsAtz/chqQGmygkSVn+gw41bWpVDakMA5mgrPms19WBmyQ3RONp81f820elFiu7malJGWiMNfBSVvYrBmfd7I0HqpfWN38mHbjEixPNRxQrJYxJE84jxdwdqX3OOyyXiFO8Aup3ql1MJBHojTmhOjlXJpBIiAj6EV2si9TjxJO64YHL+OrvGRMs8lW+q+B6NBftTa8RDDfkEwugCMiyZiP5KrUp057eWGRLwlc0+NXGo9Mqq7wAJ0D3uhHwmLr2LIpSF2LGaBxmDiB69Fw18ch0Xv3PRFPAAWNCMGS90DWrsFy1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWyDN3bchz2xrb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 17:21:07 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZWw9P60QFz9vkm;
	Tue,  8 Apr 2025 07:48:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42ojJD_HJEii; Tue,  8 Apr 2025 07:48:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZWw9N2JlBz9vkp;
	Tue,  8 Apr 2025 07:48:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 369B28B76C;
	Tue,  8 Apr 2025 07:48:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id aUNb9W1lbxmx; Tue,  8 Apr 2025 07:48:24 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DC9078B767;
	Tue,  8 Apr 2025 07:48:21 +0200 (CEST)
Message-ID: <ff31c2ff-55be-452e-b94a-6a84c4583258@csgroup.eu>
Date: Tue, 8 Apr 2025 07:48:22 +0200
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] arch, mm: set max_mapnr when allocating memory
 map for FLATMEM
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Guo Ren
 <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org
References: <20250313135003.836600-1-rppt@kernel.org>
 <20250313135003.836600-10-rppt@kernel.org>
 <4b9627f2-65ff-4baf-931f-4e23b5732e6b@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <4b9627f2-65ff-4baf-931f-4e23b5732e6b@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Mike,

Le 14/03/2025 à 10:25, Christophe Leroy a écrit :
> 
> 
> Le 13/03/2025 à 14:49, Mike Rapoport a écrit :
>> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>>
>> max_mapnr is essentially the size of the memory map for systems that use
>> FLATMEM. There is no reason to calculate it in each and every 
>> architecture
>> when it's anyway calculated in alloc_node_mem_map().
>>
>> Drop setting of max_mapnr from architecture code and set it once in
>> alloc_node_mem_map().
> 
> As far as I can see alloc_node_mem_map() is called quite late.
> 
> I fear that it will regress commit daa9ada2093e ("powerpc/mm: Fix boot 
> crash with FLATMEM")
> 
> Can you check ?

I see this patch is now merged into mainline (v6.15-rc1). Have you been 
able to check and/or analyse whether it doesn't regress the fix in 
commit daa9ada2093e ("powerpc/mm: Fix boot crash with FLATMEM") ?

Thanks
Christophe


