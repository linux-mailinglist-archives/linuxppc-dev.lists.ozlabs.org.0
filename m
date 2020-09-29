Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C597827BC64
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 07:23:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0npn0mS8zDqSq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 15:23:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0nn249vKzDqSg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 15:21:37 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C0nmp11djz9txQS;
 Tue, 29 Sep 2020 07:21:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Xv5OGtZ92lmC; Tue, 29 Sep 2020 07:21:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C0nmn6QJkz9txQR;
 Tue, 29 Sep 2020 07:21:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DB55B8B79F;
 Tue, 29 Sep 2020 07:21:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id x_ywH_gjOjI2; Tue, 29 Sep 2020 07:21:30 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 20E898B76C;
 Tue, 29 Sep 2020 07:21:30 +0200 (CEST)
Subject: Re: [PATCH v2 25/25] powerpc/signal32: Transform save_user_regs() and
 save_tm_user_regs() in 'unsafe' version
To: "Christopher M. Riedl" <cmr@informatik.wtf>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <C5ZIJ5D6XYSA.191D18GH311GD@geist>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6fffc2fd-484c-c3d8-73ba-1048b5809b69@csgroup.eu>
Date: Tue, 29 Sep 2020 07:21:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <C5ZIJ5D6XYSA.191D18GH311GD@geist>
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



Le 29/09/2020 à 04:55, Christopher M. Riedl a écrit :
> On Tue Aug 18, 2020 at 12:19 PM CDT, Christophe Leroy wrote:
>> Change those two functions to be used within a user access block.
>>
>> For that, change save_general_regs() to and unsafe_save_general_regs(),
>> then replace all user accesses by unsafe_ versions.
>>
>> This series leads to a reduction from 2.55s to 1.73s of
>> the system CPU time with the following microbench app
>> on an mpc832x with KUAP (approx 32%)
>>
>> Without KUAP, the difference is in the noise.
>>
>> void sigusr1(int sig) { }
>>
>> int main(int argc, char **argv)
>> {
>> int i = 100000;
>>
>> signal(SIGUSR1, sigusr1);
>> for (;i--;)
>> raise(SIGUSR1);
>> exit(0);
>> }
>>
>> An additional 0.10s reduction is achieved by removing
>> CONFIG_PPC_FPU, as the mpc832x has no FPU.
>>
>> A bit less spectacular on an 8xx as KUAP is less heavy, prior to
>> the series (with KUAP) it ran in 8.10 ms. Once applies the removal
>> of FPU regs handling, we get 7.05s. With the full series, we get 6.9s.
>> If artificially re-activating FPU regs handling with the full series,
>> we get 7.6s.
>>
>> So for the 8xx, the removal of the FPU regs copy is what makes the
>> difference, but the rework of handle_signal also have a benefit.
>>
>> Same as above, without KUAP the difference is in the noise.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> arch/powerpc/kernel/signal_32.c | 224 ++++++++++++++++----------------
>> 1 file changed, 111 insertions(+), 113 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/signal_32.c
>> b/arch/powerpc/kernel/signal_32.c
>> index 86539a4e0514..f795fe0240a1 100644
>> --- a/arch/powerpc/kernel/signal_32.c
>> +++ b/arch/powerpc/kernel/signal_32.c
>> @@ -93,8 +93,8 @@ static inline int get_sigset_t(sigset_t *set,
>> #define to_user_ptr(p) ptr_to_compat(p)
>> #define from_user_ptr(p) compat_ptr(p)
>>   
>> -static inline int save_general_regs(struct pt_regs *regs,
>> - struct mcontext __user *frame)
>> +static __always_inline int
>> +save_general_regs_unsafe(struct pt_regs *regs, struct mcontext __user
>> *frame)
>> {
>> elf_greg_t64 *gregs = (elf_greg_t64 *)regs;
>> int val, i;
>> @@ -108,10 +108,12 @@ static inline int save_general_regs(struct pt_regs
>> *regs,
>> else
>> val = gregs[i];
>>   
>> - if (__put_user(val, &frame->mc_gregs[i]))
>> - return -EFAULT;
>> + unsafe_put_user(val, &frame->mc_gregs[i], failed);
>> }
>> return 0;
>> +
>> +failed:
>> + return 1;
>> }
>>   
>> static inline int restore_general_regs(struct pt_regs *regs,
>> @@ -148,11 +150,15 @@ static inline int get_sigset_t(sigset_t *set,
>> const sigset_t __user *uset)
>> #define to_user_ptr(p) ((unsigned long)(p))
>> #define from_user_ptr(p) ((void __user *)(p))
>>   
>> -static inline int save_general_regs(struct pt_regs *regs,
>> - struct mcontext __user *frame)
>> +static __always_inline int
>> +save_general_regs_unsafe(struct pt_regs *regs, struct mcontext __user
>> *frame)
>> {
>> WARN_ON(!FULL_REGS(regs));
>> - return __copy_to_user(&frame->mc_gregs, regs, GP_REGS_SIZE);
>> + unsafe_copy_to_user(&frame->mc_gregs, regs, GP_REGS_SIZE, failed);
>> + return 0;
>> +
>> +failed:
>> + return 1;
>> }
>>   
>> static inline int restore_general_regs(struct pt_regs *regs,
>> @@ -170,6 +176,11 @@ static inline int restore_general_regs(struct
>> pt_regs *regs,
>> }
>> #endif
>>   
>> +#define unsafe_save_general_regs(regs, frame, label) do { \
>> + if (save_general_regs_unsafe(regs, frame)) \
> 
> Minor nitpick (sorry); this naming seems a bit strange to me, in x86 it
> is "__unsafe_" as a prefix instead of "_unsafe" as a suffix. That sounds
> a bit better to me, what do you think? Unless there is some convention I
> am not aware of here apart from "unsafe_" using a goto label for errors.

You are probably right, I have never been good at naming stuff.

Christophe
