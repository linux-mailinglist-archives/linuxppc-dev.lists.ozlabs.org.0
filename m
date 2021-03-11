Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFCD337E4A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 20:39:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxK5c13BXz3dDq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 06:39:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxK5G2qZ4z2ysn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 06:39:10 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DxK554JMmz9typl;
 Thu, 11 Mar 2021 20:39:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6Iqq4qYKiOTw; Thu, 11 Mar 2021 20:39:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DxK551CyCz9typk;
 Thu, 11 Mar 2021 20:39:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1BB0F8B80D;
 Thu, 11 Mar 2021 20:39:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9oXY_QXeLpW6; Thu, 11 Mar 2021 20:39:07 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 925208B80B;
 Thu, 11 Mar 2021 20:39:06 +0100 (CET)
Subject: Re: [PATCH v2 25/43] powerpc/32: Replace ASM exception exit by C
 exception exit from ppc64
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, npiggin@gmail.com
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
 <a9a50f475db97fc53795dd778bc14f58029fdd55.1615291473.git.christophe.leroy@csgroup.eu>
 <87tuphkdkz.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0296d1bc-b37e-43c8-06cf-00ec458fb74e@csgroup.eu>
Date: Thu, 11 Mar 2021 20:39:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87tuphkdkz.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 11/03/2021 à 14:46, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> This patch replaces the PPC32 ASM exception exit by C exception exit.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/kernel/entry_32.S  | 481 +++++++++-----------------------
>>   arch/powerpc/kernel/interrupt.c |   4 +
>>   2 files changed, 132 insertions(+), 353 deletions(-)
> 
> Bisect points to this breaking qemu mac99 for me, with pmac32_defconfig.
> 
> I haven't had time to dig any deeper sorry.

Embarrasing ...

I don't get this problem on the 8xx (nohash/32) or the 83xx (book3s/32).
I don't get this problem with qemu mac99 when using my klibc-based initramfs.

I managed to reproduce it with the rootfs.cpio that I got some time ago from linuxppc github Wiki.

I'll investigate it tomorrow.

Thanks
Christophe


> 
> cheers
> 
> 
> Freeing unused kernel memory: 1132K
> This architecture does not have kernel memory protection.
> Run /init as init process
> init[1]: User access of kernel address (fffffd20) - exploit attempt? (uid: 0)
> init[1]: segfault (11) at fffffd20 nip b7e78638 lr b7e845e4 code 1 in ld-2.27.so[b7e6b000+22000]
> init[1]: code: 92010080 92210084 92410088 92810090 92a10094 92c10098 930100a0 932100a4
> init[1]: code: 934100a8 936100ac 93a100b4 91810074 <7d41496e> 39400000 3b810017 579c0036
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x00ERROR: Error: saw oops/warning etc. while expecting
> 00000b
> CPU: 0 PID: 1 Comm: init Not tainted 5.12.0-rc2+ #1
> Call Trace:
> [f1019d80] [c004f1ec] panic+0x138/0x328 (unreliable)
> [f1019de0] [c0051c8c] do_exit+0x880/0x8f4
> [f1019e30] [c0052bdc] do_group_exit+0x40/0xa4
> [f1019e50] [c0060d04] get_signal+0x1e8/0x834
> [f1019eb0] [c000b624] do_notify_resume+0xc8/0x314
> [f1019f10] [c0010da8] interrupt_exit_user_prepare+0xa4/0xdc
> [f1019f30] [c0018228] interrupt_return+0x14/0x14c
> --- interrupt: 300 at 0xb7e78638
> NIP:  b7e78638 LR: b7e845e4 CTR: c01ea2d8
> REGS: f1019f40 TRAP: 0300   Not tainted  (5.12.0-rc2+)
> MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 28004422  XER: 20000000
> DAR: fffffd20 DSISR: 42000000
> GPR00: b7e845e4 bf951440 00000000 bf951460 00000000 bf951718 fefefeff 7f7f7f7f
> GPR08: bf9516b0 406ae8e0 b7eac1d4 00000000 0a12247b 00000000 b7e8a0d0 b7e78554
> GPR16: bf951730 bf9516f0 b7eaaf40 bf9516f0 00000001 b7eaa688 10002178 bf951460
> GPR24: 00000000 00000000 b7eac200 100cff38 bf9516f0 10002179 b7e845e4 bf951440
> NIP [b7e78638] 0xb7e78638
> LR [b7e845e4] 0xb7e845e4
> --- interrupt: 300
> Rebooting in 180 seconds..
> 
