Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2FA43A641
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 23:57:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdTMZ2whxz3cl2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 08:57:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdTM81k9Yz2xKJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 08:57:07 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HdTM46Wbzz9sTQ;
 Mon, 25 Oct 2021 23:57:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LEzzdGwy3dLr; Mon, 25 Oct 2021 23:57:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HdTM455Lsz9sSV;
 Mon, 25 Oct 2021 23:57:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 926468B76D;
 Mon, 25 Oct 2021 23:57:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vj1KAjXkOwIu; Mon, 25 Oct 2021 23:57:04 +0200 (CEST)
Received: from [192.168.203.118] (unknown [192.168.203.118])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 354168B763;
 Mon, 25 Oct 2021 23:57:04 +0200 (CEST)
Message-ID: <bf8c7960-618b-0a51-3697-447daca33dd0@csgroup.eu>
Date: Mon, 25 Oct 2021 23:57:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 3/8] powerpc/fsl_booke: Take exec flag into account
 when setting TLBCAMs
Content-Language: fr-FR
To: kernel test robot <lkp@intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <5467044e59f27f9fcf709b9661779e3ce5f784f6.1634292136.git.christophe.leroy@csgroup.eu>
 <202110221445.ZMrc3M2c-lkp@intel.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <202110221445.ZMrc3M2c-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 22/10/2021 08:36, kernel test robot wrote:
> Hi Christophe,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on v5.15-rc6 next-20211021]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-booke-Disable-STRICT_KERNEL_RWX-DEBUG_PAGEALLOC-and-KFENCE/20211015-180535
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: powerpc-tqm8541_defconfig (attached as .config)
> compiler: powerpc-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/0day-ci/linux/commit/159ed9a0b39712475dfebed64d1bb9387a0b9ad5
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Christophe-Leroy/powerpc-booke-Disable-STRICT_KERNEL_RWX-DEBUG_PAGEALLOC-and-KFENCE/20211015-180535
>          git checkout 159ed9a0b39712475dfebed64d1bb9387a0b9ad5
>          # save the attached .config to linux build tree
>          mkdir build_dir
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/mm/nohash/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     arch/powerpc/mm/nohash/fsl_book3e.c:63:15: error: no previous prototype for 'tlbcam_sz' [-Werror=missing-prototypes]
>        63 | unsigned long tlbcam_sz(int idx)
>           |               ^~~~~~~~~
>     arch/powerpc/mm/nohash/fsl_book3e.c: In function 'settlbcam':
>>> arch/powerpc/mm/nohash/fsl_book3e.c:126:40: error: '_PAGE_BAP_SX' undeclared (first use in this function)
>       126 |         TLBCAM[index].MAS3 |= (flags & _PAGE_BAP_SX) ? MAS3_SX : 0;
>           |                                        ^~~~~~~~~~~~
>     arch/powerpc/mm/nohash/fsl_book3e.c:126:40: note: each undeclared identifier is reported only once for each function it appears in
>     cc1: all warnings being treated as errors
> 

Thanks Robot for reporting that.

The problem is not trivial and is in fact deeper, we have a 
misdefinition of _PAGE_EXEC on book3e.

I sent a v2 which adds two patches at the begining of the series to 
clear that problem, then I fixed this patch 3 (which has become patch 5) 
to use _PAGE_EXEC instead of _PAGE_BAP_SX.

Christophe

> 
> vim +/_PAGE_BAP_SX +126 arch/powerpc/mm/nohash/fsl_book3e.c
> 
>     114	
>     115		TLBCAM[index].MAS0 = MAS0_TLBSEL(1) | MAS0_ESEL(index) | MAS0_NV(index+1);
>     116		TLBCAM[index].MAS1 = MAS1_VALID | MAS1_IPROT | MAS1_TSIZE(tsize) | MAS1_TID(pid);
>     117		TLBCAM[index].MAS2 = virt & PAGE_MASK;
>     118	
>     119		TLBCAM[index].MAS2 |= (flags & _PAGE_WRITETHRU) ? MAS2_W : 0;
>     120		TLBCAM[index].MAS2 |= (flags & _PAGE_NO_CACHE) ? MAS2_I : 0;
>     121		TLBCAM[index].MAS2 |= (flags & _PAGE_COHERENT) ? MAS2_M : 0;
>     122		TLBCAM[index].MAS2 |= (flags & _PAGE_GUARDED) ? MAS2_G : 0;
>     123		TLBCAM[index].MAS2 |= (flags & _PAGE_ENDIAN) ? MAS2_E : 0;
>     124	
>     125		TLBCAM[index].MAS3 = (phys & MAS3_RPN) | MAS3_SR;
>   > 126		TLBCAM[index].MAS3 |= (flags & _PAGE_BAP_SX) ? MAS3_SX : 0;
>     127		TLBCAM[index].MAS3 |= (flags & _PAGE_RW) ? MAS3_SW : 0;
>     128		if (mmu_has_feature(MMU_FTR_BIG_PHYS))
>     129			TLBCAM[index].MAS7 = (u64)phys >> 32;
>     130	
>     131		/* Below is unlikely -- only for large user pages or similar */
>     132		if (pte_user(__pte(flags))) {
>     133			TLBCAM[index].MAS3 |= MAS3_UR;
>     134			TLBCAM[index].MAS3 |= (flags & _PAGE_EXEC) ? MAS3_UX : 0;
>     135			TLBCAM[index].MAS3 |= (flags & _PAGE_RW) ? MAS3_UW : 0;
>     136		}
>     137	
>     138		tlbcam_addrs[index].start = virt;
>     139		tlbcam_addrs[index].limit = virt + size - 1;
>     140		tlbcam_addrs[index].phys = phys;
>     141	}
>     142	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
