Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4D240AF8E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 15:49:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H84Tj1dZgz3051
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 23:49:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H84TC3ljYz2yHP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 23:49:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H84T272hyz9sTY;
 Tue, 14 Sep 2021 15:49:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcHh4GeAshDT; Tue, 14 Sep 2021 15:49:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H84T25w7Qz9sTW;
 Tue, 14 Sep 2021 15:49:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B5EA08B773;
 Tue, 14 Sep 2021 15:49:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1mJ0k4nwiphF; Tue, 14 Sep 2021 15:49:10 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.177])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BD0648B763;
 Tue, 14 Sep 2021 15:49:08 +0200 (CEST)
Subject: Re: [RFC PATCH 0/8] Move task_struct::cpu back into thread_info
To: Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org
References: <20210914121036.3975026-1-ardb@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c21d9ee9-d0a1-a572-dda0-6ae90b417e10@csgroup.eu>
Date: Tue, 14 Sep 2021 15:49:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914121036.3975026-1-ardb@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Keith Packard <keithpac@amazon.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/09/2021 à 14:10, Ard Biesheuvel a écrit :
> Commit c65eacbe290b ("sched/core: Allow putting thread_info into
> task_struct") mentions that, along with moving thread_info into
> task_struct, the cpu field is moved out of the former into the latter,
> but does not explain why.

I think it does explain why (init/Kconfig): "an arch will need to remove 
all thread_info fields except flags".

IIUC initially the intention with THREAD_INFO_IN_TASK was to remove 
everything from thread_info, but at the end it didn't happen it seems.

> 
> While collaborating with Keith on adding THREAD_INFO_IN_TASK support to
> ARM, we noticed that keeping CPU in task_struct is problematic for
> architectures that define raw_smp_processor_id() in terms of this field,
> as it requires linux/sched.h to be included, which causes a lot of pain
> in terms of circular dependencies (or 'header soup', as the original
> commit refers to it).
> 
> For examples of how existing architectures work around this, please
> refer to patches #6 or #7. In the former case, it uses an awful
> asm-offsets hack to index thread_info/current without using its type
> definition. The latter approach simply keeps a copy of the task_struct
> CPU field in thread_info, and keeps it in sync at context switch time.

It was a pain when implementing that on powerpc, so I really like your 
idea, the series looks good to me.


> 
> Patch #8 reverts this latter approach for ARM, but this code is still
> under review so it does not currently apply to mainline.
> 
> We also discussed introducing yet another Kconfig symbol to indicate
> that the arch has THREAD_INFO_IN_TASK enabled but still prefers to keep
> its CPU field in thread_info, but simply keeping it in thread_info in
> all cases seems to be the cleanest approach here.

Yes, if we can avoid yet another config, that's better. We already have 
so many configs that are supposed to be temporary and have lasted for 
years if not decades.

Christophe
