Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3190518605
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 16:03:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kt1sQ3ZP3z3brc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 00:03:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kt1ry1vxYz2xrs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 00:03:28 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Kt1rp48Bmz9sT9;
 Tue,  3 May 2022 16:03:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RhOOOXYqV50a; Tue,  3 May 2022 16:03:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Kt1rp30xWz9sT8;
 Tue,  3 May 2022 16:03:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4DB408B77B;
 Tue,  3 May 2022 16:03:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VIfoSnOpUyFD; Tue,  3 May 2022 16:03:22 +0200 (CEST)
Received: from [192.168.202.20] (unknown [192.168.202.20])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2975E8B763;
 Tue,  3 May 2022 16:03:21 +0200 (CEST)
Message-ID: <8e1e4a9c-6ef8-a1a7-ad1f-84b5bf2a0b7d@csgroup.eu>
Date: Tue, 3 May 2022 16:03:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [next] powerpc: multiple definition of `____cacheline_aligned';
 sound/core/oss/pcm_oss.o:(.bss+0x40): first defined here
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, lkft-triage@lists.linaro.org,
 Peter Collingbourne <pcc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <CA+G9fYvSqtsOMEiL7_kffPKnnO-Snhe2cup6g3qRngiwRO+RfA@mail.gmail.com>
 <e3c8b2bf-b55d-4c2c-a1cf-d5e9941e26b0@csgroup.eu>
In-Reply-To: <e3c8b2bf-b55d-4c2c-a1cf-d5e9941e26b0@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Baoquan He <bhe@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>,
 aul Mackerras <paulus@samba.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/05/2022 à 15:10, Christophe Leroy a écrit :
> 
> 
> Le 29/04/2022 à 16:45, Naresh Kamboju a écrit :
>> Following powerpc builds failed on Linux next-20220428 and next-20220429.
>>
>> Regressions found on powerpc:
>>     - gcc-11-ppc64e_defconfig
>>     - gcc-10-ppc64e_defconfig
>>     - gcc-9-ppc64e_defconfig
>>     - gcc-8-ppc64e_defconfig
>>     - clang-14-ppc64e_defconfig
>>     - clang-nightly-ppc64e_defconfig
>>     - clang-13-ppc64e_defconfig
>>
>>
>> Build error:
>> -------------
>> Error: Section .bss not empty in prom_init.c
>> make[3]: *** [arch/powerpc/kernel/Makefile:191:
>> arch/powerpc/kernel/prom_init_check] Error 1
>> make[3]: Target '__build' not remade because of errors.
>> make[2]: *** [scripts/Makefile.build:595: arch/powerpc/kernel] Error 2
>> make[2]: Target '__build' not remade because of errors.
>> make[1]: *** [Makefile:1996: arch/powerpc] Error 2
>> powerpc64le-linux-gnu-ld: sound/core/oss/pcm_plugin.o:(.bss+0x0):
>> multiple definition of `____cacheline_aligned';
>> sound/core/oss/pcm_oss.o:(.bss+0x40): first defined here
>> make[4]: *** [scripts/Makefile.build:530: 
>> sound/core/oss/snd-pcm-oss.o] Error 1
>> make[4]: Target '__build' not remade because of errors.
>> make[3]: *** [scripts/Makefile.build:595: sound/core/oss] Error 2
>> powerpc64le-linux-gnu-ld: sound/core/seq/seq_clientmgr.o:(.bss+0x900):
>> multiple definition of `____cacheline_aligned';
>> sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
>> powerpc64le-linux-gnu-ld: sound/core/seq/seq_memory.o:(.bss+0x0):
>> multiple definition of `____cacheline_aligned';
>> sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
>> powerpc64le-linux-gnu-ld: sound/core/seq/seq_queue.o:(.bss+0x140):
>> multiple definition of `____cacheline_aligned';
>> sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
>> powerpc64le-linux-gnu-ld: sound/core/seq/seq_fifo.o:(.bss+0x0):
>> multiple definition of `____cacheline_aligned';
>> sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
>> powerpc64le-linux-gnu-ld: sound/core/seq/seq_timer.o:(.bss+0x0):
>> multiple definition of `____cacheline_aligned';
>> sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
>> powerpc64le-linux-gnu-ld: sound/core/seq/seq_system.o:(.bss+0x0):
>> multiple definition of `____cacheline_aligned';
>> sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
>> powerpc64le-linux-gnu-ld: sound/core/seq/seq_ports.o:(.bss+0x0):
>> multiple definition of `____cacheline_aligned';
>> sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
>> powerpc64le-linux-gnu-ld: sound/core/seq/seq_info.o:(.bss+0x40):
>> multiple definition of `____cacheline_aligned';
>> sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
>> make[4]: *** [scripts/Makefile.build:530: sound/core/seq/snd-seq.o] 
>> Error 1
>> make[4]: Target '__build' not remade because of errors.
>>
>>
>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>
>>
>> steps to reproduce:
>> -------------------
>> # To install tuxmake on your system globally:
>> # sudo pip3 install -U tuxmake
>>
>> tuxmake --runtime podman --target-arch powerpc --toolchain gcc-11
>> --kconfig ppc64e_defconfig
>>
>> -- 
>> Linaro LKFT
>> https://lkft.linaro.org
>>
>> [1] https://builds.tuxbuild.com/28Sn15hB2la1PweieGMLrUdbFMQ/
> 
> Bisected to:
> 
> 366e7b61ca1f115d38138236467068d8aacabcbc is the first bad commit
> commit 366e7b61ca1f115d38138236467068d8aacabcbc
> Author: Peter Collingbourne <pcc@google.com>
> Date:   Fri Apr 29 14:42:51 2022 -0700
> 
>      printk: stop including cache.h from printk.h
> 
>      An inclusion of cache.h in printk.h was added in 2014 in commit
>      c28aa1f0a847 ("printk/cache: mark printk_once test variable
>      __read_mostly") in order to bring in the definition of 
> __read_mostly.  The
>      usage of __read_mostly was later removed in commit 3ec25826ae33 
> ("printk:
>      Tie printk_once / printk_deferred_once into .data.once for reset") 
> which
>      made the inclusion of cache.h unnecessary, so remove it.
> 
>      We have a small amount of code that depended on the inclusion of 
> cache.h
>      from printk.h; fix that code to include the appropriate header.
> 
>      This fixes a circular inclusion on arm64 (linux/printk.h -> 
> linux/cache.h
>      -> asm/cache.h -> linux/kasan-enabled.h -> linux/static_key.h ->
>      linux/jump_label.h -> linux/bug.h -> asm/bug.h -> linux/printk.h) that
>      would otherwise be introduced by the next patch.
> 
>      Build tested using {allyesconfig,defconfig} x {arm64,x86_64}.
> 
>      Link: 
> https://linux-review.googlesource.com/id/I8fd51f72c9ef1f2d6afd3b2cbc875aa4792c1fba 
> 
>      Link: 
> https://lkml.kernel.org/r/20220427195820.1716975-1-pcc@google.com
>      Signed-off-by: Peter Collingbourne <pcc@google.com>
>      Cc: Alexander Potapenko <glider@google.com>
>      Cc: Andrey Konovalov <andreyknvl@gmail.com>
>      Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
>      Cc: Catalin Marinas <catalin.marinas@arm.com>
>      Cc: David Rientjes <rientjes@google.com>
>      Cc: Dmitry Vyukov <dvyukov@google.com>
>      Cc: Eric W. Biederman <ebiederm@xmission.com>
>      Cc: Herbert Xu <herbert@gondor.apana.org.au>
>      Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>
>      Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
>      Cc: Kees Cook <keescook@chromium.org>
>      Cc: Pekka Enberg <penberg@kernel.org>
>      Cc: Roman Gushchin <roman.gushchin@linux.dev>
>      Cc: Vlastimil Babka <vbabka@suse.cz>
>      Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> 
>   arch/arm64/include/asm/mte-kasan.h | 1 +
>   arch/arm64/include/asm/percpu.h    | 1 +
>   arch/csky/include/asm/processor.h  | 2 +-
>   drivers/firmware/smccc/kvm_guest.c | 1 +
>   include/linux/printk.h             | 1 -
>   kernel/bpf/bpf_lru_list.h          | 1 +
>   6 files changed, 5 insertions(+), 2 deletions(-)


I think you need to fix all files that use ____cacheline_aligned without 
including linux/cache.h

You can locate them with:

	git grep -L linux/cache.h `git grep -l ____cacheline_aligned `


Christophe
