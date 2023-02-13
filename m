Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEC2693E3D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 07:26:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFZB82226z3c9N
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 17:26:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oDTaHYE7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oDTaHYE7;
	dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFZ974C9Sz3bbX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 17:26:01 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id c15so9361325oic.8
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Feb 2023 22:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WBfrO2gGyOvBRZ1A5wp4UK8YioFxtCNN29YZ0C6yJUM=;
        b=oDTaHYE7Ifi7cTfoJaBKOA+euRlCFlo+ykP9tRkGsweDWCjfPlRLBkVyxOHGFcmNqc
         PSZTRHnsx3UreCHv1p9ynDEvrC5nGpdC4VXbwWYrd2yYwCkykGDPLP2SNyHtKIRZ0Fzf
         m5Q5HPiFjmx/8JH/hVxhNaJo4GLuifz/a00mQ5ccFU5DlCskiDprH6pwoBt/q7h6DDjY
         XLGT8w6vJ24mYBL9QM1YV+CRlakf167YfDtx3KOo8lkNAunfJWM4pqGoRQPXTLOlgYkl
         nosLoRl5OZPv9+Xx589w5Zoaba/auqZwvIrVa4S9ZAslff1MJvy24KQ2HNmX2D2e/q/v
         LF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBfrO2gGyOvBRZ1A5wp4UK8YioFxtCNN29YZ0C6yJUM=;
        b=lus3rEgeT5wATBQBJv+ec36s/bLTpgOnr7Yw7rupDw4ZgqRNp3ELoDh4uiw2F5c/RC
         bH8HZBljW5CJ4GRac2OvRdz5klbXYjdbLpccs4H8/v2MQXWkOQPTrD2z/Coc4edCN6CG
         6tZsaxJPbE+bKQXG7cdOhJ0qxObiTtgD1Jgd9Q8Z9AnhnqcNy/gz2EgysAybdr0C+K2s
         6oDAY14RjFK7kBoYaXrd70SROuMwqTVaet5QrihauFa/bOFaMvfEKfiYYBfbMarOyVeL
         Jee6hxGmRWjj4soodAFep//LeqKzltvV1XLFnZB4xM3mpyYHXSq4Ifq9T5csabNfzMYQ
         /WTA==
X-Gm-Message-State: AO0yUKUtzU9v+LDGklWvl0FJrXOzY/hv9OydH13+Swlf9QCYBAUTpEfj
	74JWaGept782AszObVPUIno=
X-Google-Smtp-Source: AK7set/+6jsdhTf2sJtfJcDHaoQnUg14v4tlGoQakT99S8J8gTSqtG1+VHr+8pC/SE0SaaNJlMokqg==
X-Received: by 2002:a05:6808:d2:b0:363:b918:643b with SMTP id t18-20020a05680800d200b00363b918643bmr10584927oic.31.1676269558366;
        Sun, 12 Feb 2023 22:25:58 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id dq3-20020a056808428300b0037d8148cf04sm1851027oib.46.2023.02.12.22.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 22:25:57 -0800 (PST)
Message-ID: <8267dc7e-329f-73cf-b50e-9bf2606b8751@roeck-us.net>
Date: Sun, 12 Feb 2023 22:25:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/4] m68k: use asm-generic/memory_model.h for both MMU
 and !MMU
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>
References: <20230129124235.209895-1-rppt@kernel.org>
 <20230129124235.209895-3-rppt@kernel.org>
 <20230212173513.GA4052259@roeck-us.net> <Y+mPJYpVBk1YutDL@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <Y+mPJYpVBk1YutDL@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Mic
 hal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/12/23 17:15, Mike Rapoport wrote:
> Hi,
> 
> On Sun, Feb 12, 2023 at 09:35:13AM -0800, Guenter Roeck wrote:
>> Hi,
>>
>> On Sun, Jan 29, 2023 at 02:42:33PM +0200, Mike Rapoport wrote:
>>> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>>>
>>> The MMU variant uses generic definitions of page_to_pfn() and
>>> pfn_to_page(), but !MMU defines them in include/asm/page_no.h for no
>>> good reason.
>>>
>>> Include asm-generic/memory_model.h in the common include/asm/page.h and
>>> drop redundant definitions.
>>>
>>> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
>>> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>
>> This patch results in a boot failure when trying to boot the mcf5208evb qemu
>> emulation. Reverting it together with "mm, arch: add generic implementation
>> of pfn_valid() for FLATMEM" fixes the problem. There is no error log - the
>> emulation hangs silently until aborted.
> 
> With the patch below I was able to get to the mount of the root file system,
> but I don't have one, so I couldn't test the boot properly.
> 
> diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/page_no.h
> index 43ff6b109ebb..060e4c0e7605 100644
> --- a/arch/m68k/include/asm/page_no.h
> +++ b/arch/m68k/include/asm/page_no.h
> @@ -28,6 +28,8 @@ extern unsigned long memory_end;
>   #define	virt_addr_valid(kaddr)	(((unsigned long)(kaddr) >= PAGE_OFFSET) && \
>   				((unsigned long)(kaddr) < memory_end))
>   
> +#define ARCH_PFN_OFFSET PHYS_PFN(PAGE_OFFSET_RAW)
> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* _M68K_PAGE_NO_H */
>   

Yes, that works.

Thanks,
Guenter

>> Guenter
>>
>> ---
>> bisect log:
>>
>> # bad: [6ba8a227fd19d19779005fb66ad7562608e1df83] Add linux-next specific files for 20230210
>> # good: [4ec5183ec48656cec489c49f989c508b68b518e3] Linux 6.2-rc7
>> git bisect start 'HEAD' 'v6.2-rc7'
>> # good: [94613f0efc69ed41f9229ef5c294db3ec37145da] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
>> git bisect good 94613f0efc69ed41f9229ef5c294db3ec37145da
>> # good: [19e62c715fe70dae4582c2874ed3e66715d09af6] Merge branch 'rcu/next' of git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
>> git bisect good 19e62c715fe70dae4582c2874ed3e66715d09af6
>> # good: [5d8b7ecef7f4a681b6e5538db59ff26c389c0ab6] Merge branch 'for-next' of https://gitlab.com/peda-linux/mux.git
>> git bisect good 5d8b7ecef7f4a681b6e5538db59ff26c389c0ab6
>> # good: [c349bf6ec83903b20fe570c5609b9a864a64e09c] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git
>> git bisect good c349bf6ec83903b20fe570c5609b9a864a64e09c
>> # good: [5a06a9f17454df38f35672be522ff5eb9b4277d2] selftest: add testing unsharing and counting ksm zero page
>> git bisect good 5a06a9f17454df38f35672be522ff5eb9b4277d2
>> # bad: [f5d115a7b06e5661ed5218ffa9a2644c4ff1c135] Merge branch 'mm-nonmm-unstable' into mm-everything
>> git bisect bad f5d115a7b06e5661ed5218ffa9a2644c4ff1c135
>> # bad: [acb018d6ea0c055381fba7dddaef386ee28f8075] mm/vmalloc.c: allow vread() to read out vm_map_ram areas
>> git bisect bad acb018d6ea0c055381fba7dddaef386ee28f8075
>> # good: [1a5d9782ac969dc6e61c6786500b5160603188ea] mm/mmap: remove __vma_adjust()
>> git bisect good 1a5d9782ac969dc6e61c6786500b5160603188ea
>> # good: [4b32363697de957dcc890b6245bec3f58903639a] arm: include asm-generic/memory_model.h from page.h rather than memory.h
>> git bisect good 4b32363697de957dcc890b6245bec3f58903639a
>> # bad: [328cf3fa6682ce6a4de6f8bb8009c833dc33f3c8] mm/migrate: convert isolate_movable_page() to use folios
>> git bisect bad 328cf3fa6682ce6a4de6f8bb8009c833dc33f3c8
>> # bad: [b704c765b08cabe82adf76a4d1a74f3688eee410] mm/mempolicy: convert queue_pages_pmd() to queue_folios_pmd()
>> git bisect bad b704c765b08cabe82adf76a4d1a74f3688eee410
>> # bad: [e5734c8b0edfd2a053a5c256189586a3b1e9f63d] mm, arch: add generic implementation of pfn_valid() for FLATMEM
>> git bisect bad e5734c8b0edfd2a053a5c256189586a3b1e9f63d
>> # bad: [ad8aecea034c591b9754bc5908da9719853aa7fa] mips: drop definition of pfn_valid() for DISCONTIGMEM
>> git bisect bad ad8aecea034c591b9754bc5908da9719853aa7fa
>> # bad: [1f6271a0dfdf952c2e3981f424784d48f243a2be] m68k: use asm-generic/memory_model.h for both MMU and !MMU
>> git bisect bad 1f6271a0dfdf952c2e3981f424784d48f243a2be
>> # first bad commit: [1f6271a0dfdf952c2e3981f424784d48f243a2be] m68k: use asm-generic/memory_model.h for both MMU and !MMU
> 

