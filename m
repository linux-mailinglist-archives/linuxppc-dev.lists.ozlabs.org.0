Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8DDA13FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 10:42:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jx1k6gG3zDqwj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 18:42:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Cfx8ykrB"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jwy23jHCzDqDh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 18:39:06 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46Jwxq4GPGz9tyg4;
 Thu, 29 Aug 2019 10:38:55 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Cfx8ykrB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id HE3GtSajPGhf; Thu, 29 Aug 2019 10:38:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46Jwxq37BMz9tyg2;
 Thu, 29 Aug 2019 10:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567067935; bh=tXCF7AbKTiavyowWoh/vYmV9ZQwmX5kJekIVsIYLj/g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Cfx8ykrBnE57ra6XU5KLHpxPOOQwPT5hI0EjyMJRgp6NeO5DaE5nxD1gsv/4AqXPf
 1+7OA+ffewODFsUE1eySj/y6mRHDDcd3hLrwLDc9eJdMdofqX90rSO68LRTSMsNGs5
 79MBd5DK+jm5kCtYycshxVcLfoaVvN+qbeMeRIzc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 82CBD8B8AB;
 Thu, 29 Aug 2019 10:38:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PPFRhYuRjlPE; Thu, 29 Aug 2019 10:38:56 +0200 (CEST)
Received: from [192.168.204.43] (unknown [192.168.204.43])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C8CFC8B7B2;
 Thu, 29 Aug 2019 10:38:53 +0200 (CEST)
Subject: Re: [PATCH v3 3/4] powerpc/64: make buildable without CONFIG_COMPAT
To: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>
References: <cover.1567007242.git.msuchanek@suse.de>
 <0ad51b41aebf65b3f3fcb9922f0f00b47932725d.1567007242.git.msuchanek@suse.de>
 <20190829064624.GA28508@infradead.org>
 <CAK8P3a2qgLTbud+2Fw8Rr0RXV8-xwBMiBg3hFuqqBinN1zS90A@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b3f74049-be82-be3c-5156-69a18010537e@c-s.fr>
Date: Thu, 29 Aug 2019 10:38:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2qgLTbud+2Fw8Rr0RXV8-xwBMiBg3hFuqqBinN1zS90A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: Michael Neuling <mikey@neuling.org>, Allison Randal <allison@lohutok.net>,
 Nicolai Stange <nstange@suse.de>, David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Brauner <christian@brauner.io>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Breno Leitao <leitao@debian.org>, Firoz Khan <firoz.khan@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Michal Suchanek <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/08/2019 à 10:01, Arnd Bergmann a écrit :
> On Thu, Aug 29, 2019 at 8:46 AM Christoph Hellwig <hch@infradead.org> wrote:
> 
>>> @@ -277,7 +277,7 @@ static void do_signal(struct task_struct *tsk)
>>>
>>>        rseq_signal_deliver(&ksig, tsk->thread.regs);
>>>
>>> -     if (is32) {
>>> +     if ((IS_ENABLED(CONFIG_PPC32) || IS_ENABLED(CONFIG_COMPAT)) && is32) {
>>
>> I think we should fix the is_32bit_task definitions instead so that
>> callers don't need this mess.  I'd suggest something like:
>>
>> #ifdef CONFIG_COMPAT
>> #define is_32bit_task()         test_thread_flag(TIF_32BIT)
>> #else
>> #define is_32bit_task()         IS_ENABLED(CONFIG_PPC32)
>> #endif
> 
> Are there actually any (correct) uses of is_32bit_task() outside of
> #ifdef CONFIG_PPC64?

There is at least  stack_maxrandom_size()
Also  brk_rnd() and do_signal()

Christophe

> 
> I suspect most if not all could be changed to the generic
> in_compat_syscall() that we use outside of architecture specific
> code.
> 
>         Arnd
> 
