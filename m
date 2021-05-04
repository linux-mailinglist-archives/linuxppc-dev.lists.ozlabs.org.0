Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63996372FDE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 20:42:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZTGd346kz30Gj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 04:42:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZTGF519Cz2ysp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 04:41:55 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FZTG842cFz9sWF;
 Tue,  4 May 2021 20:41:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F3wZgbFmhloe; Tue,  4 May 2021 20:41:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FZTG832frz9sWD;
 Tue,  4 May 2021 20:41:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 441C28B7B2;
 Tue,  4 May 2021 20:41:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uKQT-f3ZD8C7; Tue,  4 May 2021 20:41:52 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C74E68B78D;
 Tue,  4 May 2021 20:41:51 +0200 (CEST)
Subject: Re: [powerpc:next-test 8/8] arch/powerpc/lib/feature-fixups.c:304:30:
 error: cast to smaller integer type 'enum l1d_flush_type' from 'void
 *'
To: kernel test robot <lkp@intel.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <202105050231.wjhXNTzu-lkp@intel.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c6f6d3d7-8331-9be0-6f15-271f9c5755a1@csgroup.eu>
Date: Tue, 4 May 2021 20:41:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <202105050231.wjhXNTzu-lkp@intel.com>
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
Cc: clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/05/2021 à 20:31, kernel test robot a écrit :
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
> head:   a5014a5c936a2a9a223e699e1f3abd54d5f68d2c
> commit: a5014a5c936a2a9a223e699e1f3abd54d5f68d2c [8/8] powerpc/64s: Fix crashes when toggling entry flush barrier
> config: powerpc-randconfig-r022-20210503 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8f5a2a5836cc8e4c1def2bdeb022e7b496623439)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install powerpc cross compiling tool for clang build
>          # apt-get install binutils-powerpc-linux-gnu
>          # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=a5014a5c936a2a9a223e699e1f3abd54d5f68d2c
>          git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
>          git fetch --no-tags powerpc next-test
>          git checkout a5014a5c936a2a9a223e699e1f3abd54d5f68d2c
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=powerpc
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     arch/powerpc/lib/feature-fixups.c:233:32: error: cast to smaller integer type 'enum stf_barrier_type' from 'void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>             enum stf_barrier_type types = (enum stf_barrier_type)data;
>                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> arch/powerpc/lib/feature-fixups.c:304:30: error: cast to smaller integer type 'enum l1d_flush_type' from 'void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>             enum l1d_flush_type types = (enum l1d_flush_type)data;
>                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>     2 errors generated.
> 
> 
> vim +304 arch/powerpc/lib/feature-fixups.c
> 
>     301	
>     302	static int __do_entry_flush_fixups(void *data)
>     303	{
>   > 304		enum l1d_flush_type types = (enum l1d_flush_type)data;

That looks strange to use an enumeration for 'types', as we perform logical ops with it below (eg: 
types & L1D_FLUSH_ORI).

I think it should be an int.

>     305		unsigned int instrs[3], *dest;
>     306		long *start, *end;
>     307		int i;
>     308	
>     309		instrs[0] = 0x60000000; /* nop */
>     310		instrs[1] = 0x60000000; /* nop */
>     311		instrs[2] = 0x60000000; /* nop */
>     312	
>     313		i = 0;
>     314		if (types == L1D_FLUSH_FALLBACK) {
>     315			instrs[i++] = 0x7d4802a6; /* mflr r10		*/
>     316			instrs[i++] = 0x60000000; /* branch patched below */
>     317			instrs[i++] = 0x7d4803a6; /* mtlr r10		*/
>     318		}
>     319	
>     320		if (types & L1D_FLUSH_ORI) {
>     321			instrs[i++] = 0x63ff0000; /* ori 31,31,0 speculation barrier */
>     322			instrs[i++] = 0x63de0000; /* ori 30,30,0 L1d flush*/
>     323		}
>     324	
>     325		if (types & L1D_FLUSH_MTTRIG)
>     326			instrs[i++] = 0x7c12dba6; /* mtspr TRIG2,r0 (SPR #882) */
>     327	
>     328		start = PTRRELOC(&__start___entry_flush_fixup);
>     329		end = PTRRELOC(&__stop___entry_flush_fixup);
>     330		for (i = 0; start < end; start++, i++) {
>     331			dest = (void *)start + *start;
>     332	
>     333			pr_devel("patching dest %lx\n", (unsigned long)dest);
>     334	
>     335			patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
>     336	
>     337			if (types == L1D_FLUSH_FALLBACK)
>     338				patch_branch((struct ppc_inst *)(dest + 1), (unsigned long)&entry_flush_fallback,
>     339					     BRANCH_SET_LINK);
>     340			else
>     341				patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
>     342	
>     343			patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
>     344		}
>     345	
>     346		start = PTRRELOC(&__start___scv_entry_flush_fixup);
>     347		end = PTRRELOC(&__stop___scv_entry_flush_fixup);
>     348		for (; start < end; start++, i++) {
>     349			dest = (void *)start + *start;
>     350	
>     351			pr_devel("patching dest %lx\n", (unsigned long)dest);
>     352	
>     353			patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
>     354	
>     355			if (types == L1D_FLUSH_FALLBACK)
>     356				patch_branch((struct ppc_inst *)(dest + 1), (unsigned long)&scv_entry_flush_fallback,
>     357					     BRANCH_SET_LINK);
>     358			else
>     359				patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
>     360	
>     361			patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
>     362		}
>     363	
>     364	
>     365		printk(KERN_DEBUG "entry-flush: patched %d locations (%s flush)\n", i,
>     366			(types == L1D_FLUSH_NONE)       ? "no" :
>     367			(types == L1D_FLUSH_FALLBACK)   ? "fallback displacement" :
>     368			(types &  L1D_FLUSH_ORI)        ? (types & L1D_FLUSH_MTTRIG)
>     369								? "ori+mttrig type"
>     370								: "ori type" :
>     371			(types &  L1D_FLUSH_MTTRIG)     ? "mttrig type"
>     372							: "unknown");
>     373	
>     374		return 0;
>     375	}
>     376	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
