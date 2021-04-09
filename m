Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B01D6359439
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 06:56:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGm774xVJz30L8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 14:56:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGm6n427xz2ysv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 14:55:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FGm6b3pZqz9tylT;
 Fri,  9 Apr 2021 06:55:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6lmgkmU3bX9w; Fri,  9 Apr 2021 06:55:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FGm6b2gvjz9tylK;
 Fri,  9 Apr 2021 06:55:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3160B8B7D6;
 Fri,  9 Apr 2021 06:55:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DAuusCOvZVmu; Fri,  9 Apr 2021 06:55:52 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CF82C8B76D;
 Fri,  9 Apr 2021 06:55:51 +0200 (CEST)
Subject: Re: [powerpc:next-test 168/182]
 include/linux/compiler_types.h:320:38: error: call to
 '__compiletime_assert_171' declared with attribute error: BUILD_BUG_ON
 failed: TASK_SIZE > MODULES_VADDR
To: kernel test robot <lkp@intel.com>
References: <202104090827.jH0WBiCC-lkp@intel.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <776166f7-022d-4fea-d8e5-2cd74eec32db@csgroup.eu>
Date: Fri, 9 Apr 2021 06:55:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <202104090827.jH0WBiCC-lkp@intel.com>
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



Le 09/04/2021 à 02:41, kernel test robot a écrit :
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
> head:   3ac6488df9160f52bbd8b8ec3387a53ac3d0f2eb
> commit: 093cb12967d4bde01a4170fd342bc0d443004599 [168/182] powerpc/32s: Define a MODULE area below kernel text all the time
> config: powerpc64-randconfig-c004-20210408 (attached as .config)
> compiler: powerpc-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=093cb12967d4bde01a4170fd342bc0d443004599
>          git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
>          git fetch --no-tags powerpc next-test
>          git checkout 093cb12967d4bde01a4170fd342bc0d443004599
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc64
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from <command-line>:
>     arch/powerpc/kernel/module.c: In function 'module_alloc':
>>> include/linux/compiler_types.h:320:38: error: call to '__compiletime_assert_171' declared with attribute error: BUILD_BUG_ON failed: TASK_SIZE > MODULES_VADDR

I don't think there is much we can do about that.

TASK_SIZE is set to 0xb0000000 by default on BOOK3S/32 in Kconfig.

If the user forces a greater value without increasing PAGE_OFFSET accordingly, it won't work. The 
BUILD_BUG_ON() is there to catch it.

Christophe
