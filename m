Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEB533088D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 08:03:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dv8Sr1CFBz3cmx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 18:03:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dv8SV168Xz3cJG
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Mar 2021 18:03:17 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dv8SB5sq6z9tydq;
 Mon,  8 Mar 2021 08:03:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uZeYbZrQfYaE; Mon,  8 Mar 2021 08:03:06 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dv8SB1SQ5z9tydp;
 Mon,  8 Mar 2021 08:03:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D91E8B793;
 Mon,  8 Mar 2021 08:03:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Q73ZxSMrmAhm; Mon,  8 Mar 2021 08:03:11 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 08FAC8B75B;
 Mon,  8 Mar 2021 08:03:11 +0100 (CET)
Subject: Re: [powerpc:next-test 15/17]
 arch/powerpc/mm/book3s64/hash_utils.c:1986:6: warning: no previous prototype
 for 'kfence_protect_page'
To: kernel test robot <lkp@intel.com>
References: <202103072122.wpIjBOYV-lkp@intel.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9398ea60-6985-65a5-b289-0da79365f78c@csgroup.eu>
Date: Mon, 8 Mar 2021 08:03:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <202103072122.wpIjBOYV-lkp@intel.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/03/2021 à 14:18, kernel test robot a écrit :
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
> head:   7c6d5b4b9e8a472043a26ccc22092aebbe65ca68
> commit: 0f19bac474e0f9ce9b38a7ce00c57abb321338d1 [15/17] powerpc: Enable KFENCE on BOOK3S/64
> config: powerpc-allyesconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=0f19bac474e0f9ce9b38a7ce00c57abb321338d1
>          git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
>          git fetch --no-tags powerpc next-test
>          git checkout 0f19bac474e0f9ce9b38a7ce00c57abb321338d1
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> arch/powerpc/mm/book3s64/hash_utils.c:1986:6: warning: no previous prototype for 'kfence_protect_page' [-Wmissing-prototypes]
>      1986 | bool kfence_protect_page(unsigned long addr, bool protect)

We have to include <linux/kfence.h>

Christophe


>           |      ^~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/kfence_protect_page +1986 arch/powerpc/mm/book3s64/hash_utils.c
> 
>    1984	
>    1985	#ifdef CONFIG_KFENCE
>> 1986	bool kfence_protect_page(unsigned long addr, bool protect)
>    1987	{
>    1988		unsigned long lmi = __pa(addr) >> PAGE_SHIFT;
>    1989	
>    1990		if (protect)
>    1991			kernel_unmap_linear_page(addr, lmi);
>    1992		else
>    1993			kernel_map_linear_page(addr, lmi);
>    1994	
>    1995		return true;
>    1996	}
>    1997	#endif
>    1998	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
