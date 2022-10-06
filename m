Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 121535F716A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 00:52:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk6CF6Rn2z3fWn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 09:52:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjzLK2HbNz3c6B
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 04:43:02 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MjzLC11Gzz9syB;
	Thu,  6 Oct 2022 19:42:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LsXJRIhoNC1h; Thu,  6 Oct 2022 19:42:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MjzLB5Dvqz9syS;
	Thu,  6 Oct 2022 19:42:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8738A8B78C;
	Thu,  6 Oct 2022 19:42:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id z2OiiiTjoE_O; Thu,  6 Oct 2022 19:42:58 +0200 (CEST)
Received: from [192.168.233.27] (po19210.idsi0.si.c-s.fr [192.168.233.27])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E53E8B77D;
	Thu,  6 Oct 2022 19:42:56 +0200 (CEST)
Message-ID: <6396875c-146a-acf5-dd9e-7f93ba1b4bc3@csgroup.eu>
Date: Thu, 6 Oct 2022 19:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 3/5] treewide: use get_random_u32() when possible
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20221006165346.73159-1-Jason@zx2c4.com>
 <20221006165346.73159-4-Jason@zx2c4.com>
 <848ed24c-13ef-6c38-fd13-639b33809194@csgroup.eu>
 <CAHmME9raQ4E00r9r8NyWJ17iSXE_KniTG0onCNAfMmfcGar1eg@mail.gmail.com>
 <f10fcfbf-2da6-cf2d-6027-fbf8b52803e9@csgroup.eu>
In-Reply-To: <f10fcfbf-2da6-cf2d-6027-fbf8b52803e9@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 07 Oct 2022 09:35:18 +1100
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, "x86@kernel.org" <x86@kernel.org>, Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, KP Singh <kpsingh@kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "patches@lists.linux.dev" <patches@lists.linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Eric Dumazet <edumazet@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, "linux-s390@vger.
 kernel.org" <linux-s390@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Airlie <airlied@redhat.com>, Paolo Abeni <pabeni@redhat.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Pablo Neira Ayuso <pablo@netfilter.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgens?= =?UTF-8?Q
 ?en?= <toke@toke.dk>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>, "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johannes Berg <johannes@sipsolutions.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Florian Westphal
  <fw@strlen.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>, Chuck Lever <chuck.lever@oracle.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Jan Kara <jack@suse.com>, Thomas Graf <tgraf@suug.ch>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/10/2022 à 19:31, Christophe Leroy a écrit :
> 
> 
> Le 06/10/2022 à 19:24, Jason A. Donenfeld a écrit :
>> Hi Christophe,
>>
>> On Thu, Oct 6, 2022 at 11:21 AM Christophe Leroy
>> <christophe.leroy@csgroup.eu> wrote:
>>> Le 06/10/2022 à 18:53, Jason A. Donenfeld a écrit :
>>>> The prandom_u32() function has been a deprecated inline wrapper around
>>>> get_random_u32() for several releases now, and compiles down to the
>>>> exact same code. Replace the deprecated wrapper with a direct call to
>>>> the real function. The same also applies to get_random_int(), which is
>>>> just a wrapper around get_random_u32().
>>>>
>>>> Reviewed-by: Kees Cook <keescook@chromium.org>
>>>> Acked-by: Toke Høiland-Jørgensen <toke@toke.dk> # for sch_cake
>>>> Acked-by: Chuck Lever <chuck.lever@oracle.com> # for nfsd
>>>> Reviewed-by: Jan Kara <jack@suse.cz> # for ext4
>>>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>>>> ---
>>>
>>>> diff --git a/arch/powerpc/kernel/process.c 
>>>> b/arch/powerpc/kernel/process.c
>>>> index 0fbda89cd1bb..9c4c15afbbe8 100644
>>>> --- a/arch/powerpc/kernel/process.c
>>>> +++ b/arch/powerpc/kernel/process.c
>>>> @@ -2308,6 +2308,6 @@ void notrace __ppc64_runlatch_off(void)
>>>>    unsigned long arch_align_stack(unsigned long sp)
>>>>    {
>>>>        if (!(current->personality & ADDR_NO_RANDOMIZE) && 
>>>> randomize_va_space)
>>>> -             sp -= get_random_int() & ~PAGE_MASK;
>>>> +             sp -= get_random_u32() & ~PAGE_MASK;
>>>>        return sp & ~0xf;
>>>
>>> Isn't that a candidate for prandom_u32_max() ?
>>>
>>> Note that sp is deemed to be 16 bytes aligned at all time.
>>
>> Yes, probably. It seemed non-trivial to think about, so I didn't. But
>> let's see here... maybe it's not too bad:
>>
>> If PAGE_MASK is always ~(PAGE_SIZE-1), then ~PAGE_MASK is
>> (PAGE_SIZE-1), so prandom_u32_max(PAGE_SIZE) should yield the same
>> thing? Is that accurate? And holds across platforms (this comes up a
>> few places)? If so, I'll do that for a v4.
>>
> 
> On powerpc it is always (from arch/powerpc/include/asm/page.h) :
> 
> /*
>   * Subtle: (1 << PAGE_SHIFT) is an int, not an unsigned long. So if we
>   * assign PAGE_MASK to a larger type it gets extended the way we want
>   * (i.e. with 1s in the high bits)
>   */
> #define PAGE_MASK      (~((1 << PAGE_SHIFT) - 1))
> 
> #define PAGE_SIZE        (1UL << PAGE_SHIFT)
> 
> 
> So it would work I guess.

But taking into account that sp must remain 16 bytes aligned, would it 
be better to do something like ?

	sp -= prandom_u32_max(PAGE_SIZE >> 4) << 4;

	return sp;


