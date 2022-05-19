Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ECC52DB3A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 19:28:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3xdv6yh3z3bmw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 03:28:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3xdW19yPz2ywN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 03:27:58 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4L3xdR3DRQz9t0v;
 Thu, 19 May 2022 19:27:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QInxpv6g3tR7; Thu, 19 May 2022 19:27:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4L3xdR23WNz9t0Q;
 Thu, 19 May 2022 19:27:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 360CC8B77E;
 Thu, 19 May 2022 19:27:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xtWnll6ZhbEu; Thu, 19 May 2022 19:27:55 +0200 (CEST)
Received: from [192.168.203.71] (unknown [192.168.203.71])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF5538B763;
 Thu, 19 May 2022 19:27:54 +0200 (CEST)
Message-ID: <67938da3-07a6-3c51-e5b9-10b8047ff5b5@csgroup.eu>
Date: Thu, 19 May 2022 19:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1 3/4] powerpc/code-patching: Use jump_label for testing
 freed initmem
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Guenter Roeck <linux@roeck-us.net>
References: <cover.1647962456.git.christophe.leroy@csgroup.eu>
 <0aee964721cab7316cffde21a2ca223cee14d373.1647962456.git.christophe.leroy@csgroup.eu>
 <20220519021706.GA3526833@roeck-us.net>
 <ab09a24a-acca-a5a8-2e3f-cfa3c704cb65@csgroup.eu>
 <fa232a89-2678-7773-4f97-7f85c87dbfae@csgroup.eu>
In-Reply-To: <fa232a89-2678-7773-4f97-7f85c87dbfae@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/05/2022 à 08:53, Christophe Leroy a écrit :
> 
> 
> Le 19/05/2022 à 08:27, Christophe Leroy a écrit :
>>
>>
>> Le 19/05/2022 à 04:17, Guenter Roeck a écrit :
>>> On Tue, Mar 22, 2022 at 04:40:20PM +0100, Christophe Leroy wrote:
>>>> Once init is done, initmem is freed forever so no need to
>>>> test system_state at every call to patch_instruction().
>>>>
>>>> Use jump_label.
>>>>
>>>> This reduces by 2% the time needed to activate ftrace on an 8xx.
>>>>
>>>
>>> It also causes the qemu mpc8544ds emulation to crash.
>>>
>>> BUG: Unable to handle kernel data access on write at 0xc122eb34
>>> Faulting instruction address: 0xc001b580
>>> Oops: Kernel access of bad area, sig: 11 [#1]
>>> BE PAGE_SIZE=4K MPC8544 DS
>>> Modules linked in:
>>> CPU: 0 PID: 1 Comm: swapper Not tainted 5.18.0-rc7-next-20220518 #1
>>> NIP:  c001b580 LR: c001b560 CTR: 00000003
>>> REGS: c5107dd0 TRAP: 0300   Not tainted  (5.18.0-rc7-next-20220518)
>>> MSR:  00009000 <EE,ME>  CR: 24000882  XER: 00000000
>>> DEAR: c122eb34 ESR: 00800000
>>> GPR00: c001b560 c5107ec0 c5120020 10000000 00000000 00000078 0c000000 
>>> cfffffff
>>> GPR08: c001e9ec 00000001 00000007 00000000 44000882 00000000 c0005178 
>>> 00000000
>>> GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
>>> 00000000
>>> GPR24: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
>>> c1230000
>>> NIP [c001b580] free_initmem+0x48/0xa8
>>> LR [c001b560] free_initmem+0x28/0xa8
>>> Call Trace:
>>> [c5107ec0] [c001b560] free_initmem+0x28/0xa8 (unreliable)
>>> [c5107ee0] [c00051b0] kernel_init+0x38/0x150
>>> [c5107f00] [c001626c] ret_from_kernel_thread+0x5c/0x64
>>> Instruction dump:
>>> 3fe0c123 912a00dc 90010024 48000665 3d20c218 8929fa65 2c090000 41820058
>>> 813feb34 2c090000 4082003c 39200001 <913feb34> 80010024 3cc0c114 
>>> 83e1001c
>>>
>>> Reverting this patch fixes the problem.
>>>
>>
>> That's strange.
>>
>> I was able to reproduce the problem.
>>
>> Removing the __ro_after_init in front of
>> DEFINE_STATIC_KEY_FALSE(init_mem_is_free) fixes the problem.
>>
>> I can't understand why, mark_readonly() is called after free_initmem().
>>
> 
> Moving static_branch_enable(&init_mem_is_free) before mark_initmem_nx() 
> also solves the problem.
> 
> There must be something wrong with mark_initmem_nx().
> 


Fixing patch sent, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/2e35f0fd649c83c5add17a99514ac040767be93a.1652981047.git.christophe.leroy@csgroup.eu/

Christophe
