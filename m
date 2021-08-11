Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D473E89EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 07:56:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkzbX6FyYz3cHv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 15:56:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gkzb65M9rz2yyK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 15:56:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gkzb06L7Qz9sW4;
 Wed, 11 Aug 2021 07:56:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bi9m30RVxYz7; Wed, 11 Aug 2021 07:56:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gkzb05RCcz9sVx;
 Wed, 11 Aug 2021 07:56:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 96DF38B7C3;
 Wed, 11 Aug 2021 07:56:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oXiAC61DfNTG; Wed, 11 Aug 2021 07:56:12 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4ACB98B765;
 Wed, 11 Aug 2021 07:56:12 +0200 (CEST)
Subject: Re: [powerpc:next-test 60/60] arch/powerpc/kernel/misc_32.S:240:
 Error: unrecognized opcode: `emit_warn_entry'
To: kernel test robot <lkp@intel.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <202108110231.PW76zFp3-lkp@intel.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7c5a1283-b0ee-a6d0-abc9-38ccfb9c0d3c@csgroup.eu>
Date: Wed, 11 Aug 2021 07:56:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <202108110231.PW76zFp3-lkp@intel.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/08/2021 à 20:10, kernel test robot a écrit :
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
> head:   5e3aa4531ecc7febbfa18218145c903dab17e651
> commit: 5e3aa4531ecc7febbfa18218145c903dab17e651 [60/60] powerpc/bug: Provide better flexibility to WARN_ON/__WARN_FLAGS() with asm goto
> config: powerpc64-buildonly-randconfig-r001-20210810 (attached as .config)
> compiler: powerpc-linux-gcc (GCC) 10.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=5e3aa4531ecc7febbfa18218145c903dab17e651
>          git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
>          git fetch --no-tags powerpc next-test
>          git checkout 5e3aa4531ecc7febbfa18218145c903dab17e651
>          # save the attached .config to linux build tree
>          mkdir build_dir
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-10.3.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     arch/powerpc/kernel/misc_32.S: Assembler messages:
>>> arch/powerpc/kernel/misc_32.S:240: Error: unrecognized opcode: `emit_warn_entry'

We are missing stubs when CONFIG_BUG is not selected.

The following show fix it:

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index f36b872cb571..1ee0f22313ee 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -137,8 +137,11 @@ __label_warn_on:						\
  #ifdef __ASSEMBLY__
  .macro EMIT_BUG_ENTRY addr,file,line,flags
  .endm
+.macro EMIT_WARN_ENTRY addr,file,line,flags
+.endm
  #else /* !__ASSEMBLY__ */
  #define _EMIT_BUG_ENTRY
+#define _EMIT_WARN_ENTRY
  #endif
  #endif /* CONFIG_BUG */

