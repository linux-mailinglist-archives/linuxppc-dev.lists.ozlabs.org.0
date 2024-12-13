Return-Path: <linuxppc-dev+bounces-4089-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5C79F05E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 09:02:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8hdZ3Fwkz30hl;
	Fri, 13 Dec 2024 19:02:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734076946;
	cv=none; b=Noa/ZOlXPzXJyz9qVY2UHmFiBeA39F6YXkvAVHfxkjIrLMjKl/0B09b+1eNoAqOWOPSN7F0p/V+8TQyXlvSAE/He56Hdg/TgCGgPULn4N9OEcleObtKIk8EVneHwg/xONfpxNqwEuqG1abvw5vU0EGNba9lMGF2Q+/gSZguvnJWORCTdyb4/5VFbavsv6dwgaTZ0OgSIDD1R83ZPdZIENFF+1rI6tL0/m7iy1VYQX/onFnPxaW8F12+8sWWqbpyencaK6VptDjptuW68zlwgL1V06WXVHgSYwgby7OxhTBapF3QX9VpMbO7USeYy33wadVaTVlbjANYDRYQUJac/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734076946; c=relaxed/relaxed;
	bh=3c4iSX4t2r5V3ufu+qXgeWqmJh4T7Xdt27ovEM8ZVtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B+vbFuENo6Ws86RIjrs7tZXKHGMNXAYRWC3lUp31BRlG3xkfrRozuAmPACFQCLz4CCkSAURGEor/BiJetykNSj8EvhYFwlfvnkNfDj9/coWBNOC3k/RNwNA7qwWdB8CDoX6ehIO2yj5BuKWUvicRMkCtJBrwvCNGrMyBUs6FhbmuNFv0iUNZL7TxB9hCj13ybAF4ez5WHm0KrLdWrL4fEho/Rc2QsZRNpzpb1vUSh3Y0tR/QYBwc6l4Arj7OG7Gd3zeo+9w5ToWAKrQ0zNlpb8L+sd1EJrZDq1vUnlL5KrnIctntlpM9iG7w4u+HyC7bcOE5TGkgNEJuy43GLa9lqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8hdY36Vnz30hL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 19:02:25 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y8hdT5hV5z9str;
	Fri, 13 Dec 2024 09:02:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BkzwJyV56MEz; Fri, 13 Dec 2024 09:02:21 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y8hdT4bL5z9sST;
	Fri, 13 Dec 2024 09:02:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 87B638B773;
	Fri, 13 Dec 2024 09:02:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XDvAIJXlZlMl; Fri, 13 Dec 2024 09:02:21 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2B4EE8B763;
	Fri, 13 Dec 2024 09:02:20 +0100 (CET)
Message-ID: <0b1ea054-22bb-4380-a1e4-8be988d8746d@csgroup.eu>
Date: Fri, 13 Dec 2024 09:02:19 +0100
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
Subject: Re: [RFC 3/5] powerpc: kvm: drop 32-bit book3s
To: Arnd Bergmann <arnd@kernel.org>, kvm@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Graf <graf@amazon.com>, Crystal Wood <crwood@redhat.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20241212125516.467123-1-arnd@kernel.org>
 <20241212125516.467123-4-arnd@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241212125516.467123-4-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 12/12/2024 à 13:55, Arnd Bergmann a écrit :
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Support for KVM on 32-bit Book III-s implementations was added in 2010
> and supports PowerMac, CHRP, and embedded platforms using the Freescale G4
> (mpc74xx), e300 (mpc83xx) and e600 (mpc86xx) CPUs from 2003 to 2009.
> 
> Earlier 603/604/750 machines might work but would be even more limited
> by their available memory.
> 
> The only likely users of KVM on any of these were the final Apple
> PowerMac/PowerBook/iBook G4 models with 2GB of RAM that were at the high
> end 20 years ago but are just as obsolete as their x86-32 counterparts.
> The code has been orphaned since 2023.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   MAINTAINERS                               |   2 +-
>   arch/powerpc/include/asm/kvm_book3s.h     |  19 ----
>   arch/powerpc/include/asm/kvm_book3s_asm.h |  10 --

pmac32_defconfig: something is going wrong with headers:

   CC      arch/powerpc/kernel/asm-offsets.s
In file included from ./arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
                  from ./arch/powerpc/include/asm/kvm_book3s_64.h:14,
                  from ./arch/powerpc/include/asm/kvm_book3s.h:380,
                  from ./arch/powerpc/include/asm/kvm_ppc.h:22,
                  from ./arch/powerpc/include/asm/dbell.h:17,
                  from arch/powerpc/kernel/asm-offsets.c:36:
./arch/powerpc/include/asm/book3s/64/pgtable.h:17: warning: "_PAGE_EXEC" 
redefined
    17 | #define _PAGE_EXEC              0x00001 /* execute permission */
       |
In file included from ./arch/powerpc/include/asm/book3s/pgtable.h:8,
                  from ./arch/powerpc/include/asm/pgtable.h:18,
                  from ./include/linux/pgtable.h:6,
                  from ./arch/powerpc/include/asm/kup.h:43,
                  from ./arch/powerpc/include/asm/uaccess.h:8,
                  from ./include/linux/uaccess.h:12,
                  from ./include/linux/sched/task.h:13,
                  from ./include/linux/sched/signal.h:9,
                  from ./include/linux/rcuwait.h:6,
                  from ./include/linux/percpu-rwsem.h:7,
                  from ./include/linux/fs.h:33,
                  from ./include/linux/compat.h:17,
                  from arch/powerpc/kernel/asm-offsets.c:12:
./arch/powerpc/include/asm/book3s/32/pgtable.h:30: note: this is the 
location of the previous definition
    30 | #define _PAGE_EXEC      0x200   /* software: exec allowed */
       |



