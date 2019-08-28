Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBB7A02FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 15:16:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JR8m3fJ7zDq60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 23:16:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Y5B6obTo"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JQzp2HFxzDqC3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 23:08:54 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46JQzg3kGdz9txhj;
 Wed, 28 Aug 2019 15:08:47 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Y5B6obTo; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id r64Uwv1Lynu4; Wed, 28 Aug 2019 15:08:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46JQzg2ZmBz9txgj;
 Wed, 28 Aug 2019 15:08:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566997727; bh=+Ru/YcnPxN7Wge10zCE6AYHla18pP5X9f7nBPFpgkac=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Y5B6obToOkjP4Ff8if0UsMGPSgW6lRVj2736s0QlPDJjUckmNBtKUkIgZmSvatPsf
 aoDQdtUuVkVJG2eHXxen8MfR7pCBI9lp7oZu2we1qegqNLnervO1Mhyx7wIC5Gngxa
 +EiYZAfDaYDJx0IMzSlW5C003iNTDs411BdWYf88=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C02748B895;
 Wed, 28 Aug 2019 15:08:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nx4I442IqYD8; Wed, 28 Aug 2019 15:08:48 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5FFB28B885;
 Wed, 28 Aug 2019 15:08:48 +0200 (CEST)
Subject: Re: [PATCH v2 0/4] Disable compat cruft on ppc64le v2
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
References: <cover.1566987936.git.msuchanek@suse.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <dbc5abde-ea15-be43-1fdb-d16052c19e03@c-s.fr>
Date: Wed, 28 Aug 2019 13:08:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <cover.1566987936.git.msuchanek@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: David Hildenbrand <david@redhat.com>, "Dmitry V. Levin" <ldv@altlinux.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Firoz Khan <firoz.khan@linaro.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/28/2019 10:30 AM, Michal Suchanek wrote:
> With endian switch disabled by default the ppc64le compat supports
> ppc32le only which is something next to nobody has binaries for.
> 
> Less code means less bugs so drop the compat stuff.
> 
> I am not particularly sure about the best way to resolve the llseek
> situation. I don't see anything in the syscal tables making it
> 32bit-only so I suppose it should be available on 64bit as well.
> 
> This is tested on ppc64le top of

Really ?

I get a build failure with ppc64_defconfig + LITTLE_ENDIAN :

   CC      arch/powerpc/kernel/signal.o
arch/powerpc/kernel/signal.c: In function 'do_signal':
arch/powerpc/kernel/signal.c:250:6: error: unused variable 'is32' 
[-Werror=unused-variable]
   int is32 = is_32bit_task();
       ^~~~
cc1: all warnings being treated as errors
make[3]: *** [arch/powerpc/kernel/signal.o] Error 1

Christophe

> 
> https://patchwork.ozlabs.org/cover/1153556/
> 
> Changes in v2: saner CONFIG_COMPAT ifdefs
> 
> Thanks
> 
> Michal
> 
> Michal Suchanek (4):
>    fs: always build llseek.
>    powerpc: move common register copy functions from signal_32.c to
>      signal.c
>    powerpc/64: make buildable without CONFIG_COMPAT
>    powerpc/64: Disable COMPAT if littleendian.
> 
>   arch/powerpc/Kconfig               |   2 +-
>   arch/powerpc/include/asm/syscall.h |   2 +
>   arch/powerpc/kernel/Makefile       |  15 ++-
>   arch/powerpc/kernel/entry_64.S     |   2 +
>   arch/powerpc/kernel/signal.c       | 146 ++++++++++++++++++++++++++++-
>   arch/powerpc/kernel/signal_32.c    | 140 ---------------------------
>   arch/powerpc/kernel/syscall_64.c   |   5 +-
>   arch/powerpc/kernel/vdso.c         |   4 +-
>   arch/powerpc/perf/callchain.c      |  14 ++-
>   fs/read_write.c                    |   2 -
>   10 files changed, 177 insertions(+), 155 deletions(-)
> 
