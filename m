Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E78CC254AC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 18:33:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcpDp0LykzDqkj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 02:32:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcnW02jZRzDqgx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 02:00:11 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BcnVs700tz9v2FL;
 Thu, 27 Aug 2020 18:00:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id LQewnjVSyhot; Thu, 27 Aug 2020 18:00:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BcnVs64DQz9tyrm;
 Thu, 27 Aug 2020 18:00:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7EB7D8B884;
 Thu, 27 Aug 2020 18:00:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4NgpRi-CIKS8; Thu, 27 Aug 2020 18:00:07 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 115078B880;
 Thu, 27 Aug 2020 18:00:07 +0200 (CEST)
Subject: Re: [PATCH v2 25/25] powerpc/signal32: Transform save_user_regs() and
 save_tm_user_regs() in 'unsafe' version
To: kernel test robot <lkp@intel.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <c7b37b385ccf9666066452e58f018a86573f83e8.1597770847.git.christophe.leroy@csgroup.eu>
 <202008271728.tFAPDKU8%lkp@intel.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <04879ee3-2b59-fe21-9a79-f790f3e958a4@csgroup.eu>
Date: Thu, 27 Aug 2020 17:59:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <202008271728.tFAPDKU8%lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/08/2020 à 11:07, kernel test robot a écrit :
> Hi Christophe,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on linus/master v5.9-rc2 next-20200827]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-Switch-signal-32-to-using-unsafe_put_user-and-friends/20200819-012411
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: powerpc64-randconfig-r005-20200827 (attached as .config)
> compiler: powerpc-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc64
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     arch/powerpc/kernel/signal_32.c: In function 'save_user_regs_unsafe':
>>> arch/powerpc/kernel/signal_32.c:314:34: error: macro "unsafe_copy_to_user" requires 4 arguments, but only 3 given
>       314 |         ELF_NEVRREG * sizeof(u32)), failed);
>           |                                  ^
>     In file included from include/linux/uaccess.h:9,
>                      from include/linux/sched/task.h:11,
>                      from include/linux/sched/signal.h:9,
>                      from include/linux/rcuwait.h:6,
>                      from include/linux/percpu-rwsem.h:7,
>                      from include/linux/fs.h:33,
>                      from include/linux/huge_mm.h:8,
>                      from include/linux/mm.h:672,
>                      from arch/powerpc/kernel/signal_32.c:17:
>     arch/powerpc/include/asm/uaccess.h:605: note: macro "unsafe_copy_to_user" defined here
>       605 | #define unsafe_copy_to_user(d, s, l, e) \
>           |
>>> arch/powerpc/kernel/signal_32.c:313:3: error: 'unsafe_copy_to_user' undeclared (first use in this function); did you mean 'raw_copy_to_user'?
>       313 |   unsafe_copy_to_user(&frame->mc_vregs, current->thread.evr,
>           |   ^~~~~~~~~~~~~~~~~~~
>           |   raw_copy_to_user
>     arch/powerpc/kernel/signal_32.c:313:3: note: each undeclared identifier is reported only once for each function it appears in
>>> arch/powerpc/kernel/signal_32.c:314:37: error: 'failed' undeclared (first use in this function)
>       314 |         ELF_NEVRREG * sizeof(u32)), failed);
>           |                                     ^~~~~~
>     arch/powerpc/kernel/signal_32.c:314:35: warning: left-hand operand of comma expression has no effect [-Wunused-value]
>       314 |         ELF_NEVRREG * sizeof(u32)), failed);
>           |                                   ^
>>> arch/powerpc/kernel/signal_32.c:314:43: error: expected ';' before ')' token
>       314 |         ELF_NEVRREG * sizeof(u32)), failed);
>           |                                           ^
>           |                                           ;
>>> arch/powerpc/kernel/signal_32.c:314:43: error: expected statement before ')' token
> 

Should be fixed by:

diff --git a/arch/powerpc/kernel/signal_32.c 
b/arch/powerpc/kernel/signal_32.c
index f795fe0240a1..123682299d4f 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -311,7 +311,7 @@ static int save_user_regs_unsafe(struct pt_regs 
*regs, struct mcontext __user *f
  	/* save spe registers */
  	if (current->thread.used_spe) {
  		unsafe_copy_to_user(&frame->mc_vregs, current->thread.evr,
-				    ELF_NEVRREG * sizeof(u32)), failed);
+				    ELF_NEVRREG * sizeof(u32), failed);
  		/* set MSR_SPE in the saved MSR value to indicate that
  		   frame->mc_vregs contains valid data */
  		msr |= MSR_SPE;

---
Christophe
