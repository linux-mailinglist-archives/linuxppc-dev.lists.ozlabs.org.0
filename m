Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A7519BF27
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 12:15:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tJpY2w6YzDrSM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 21:15:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=ExOezHxF; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tJmt519HzDr5X
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 21:13:33 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48tJmk54Rdz9txXd;
 Thu,  2 Apr 2020 12:13:26 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ExOezHxF; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Dt2fiu29ovht; Thu,  2 Apr 2020 12:13:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48tJmk3zwTz9txX0;
 Thu,  2 Apr 2020 12:13:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585822406; bh=86NFh4wJWvmnYUmUL8syKOtKmCGkmyy2HfZeIraNpIA=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=ExOezHxFfuR55LO6BGxToQ6PuGxldGahTpCzkULqodnrya1gZBOM1MMdHmsHvg1Mw
 eJqu38lGqUMOqGYCZnmsNcQi0Wveivv/wc7f3/BLA/gxBej6AD6SQl8bL++YTsI6Av
 WajjKvunVRhfhsf5uR2wA8JJ+4GRrYrKNICEMnLg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 971858B925;
 Thu,  2 Apr 2020 12:13:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3gzIFV04O2nb; Thu,  2 Apr 2020 12:13:27 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D60F38B8C6;
 Thu,  2 Apr 2020 12:13:26 +0200 (CEST)
Subject: Re: [PATCH v1 39/46] powerpc/8xx: Add a function to early map kernel
 via huge pages
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <abaf66aaebfd988d835dc9520bccedd546ee95c4.1584360344.git.christophe.leroy@c-s.fr>
 <202003170938.Z0IuUore%lkp@intel.com>
 <22bc0bba-533f-548b-8eec-a3392acc8e3d@c-s.fr>
Message-ID: <2e56a9e4-6176-7a19-81b3-c36d6243e776@c-s.fr>
Date: Thu, 2 Apr 2020 12:13:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <22bc0bba-533f-548b-8eec-a3392acc8e3d@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org,
 kbuild test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/03/2020 à 15:43, Christophe Leroy a écrit :
> 
> 
> Le 17/03/2020 à 02:39, kbuild test robot a écrit :
>> Hi Christophe,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on next-20200316]
>> [cannot apply to powerpc/next v5.6-rc6 v5.6-rc5 v5.6-rc4 v5.6-rc6]
>> [if your patch is applied to the wrong git tree, please drop us a note 
>> to help
>> improve the system. BTW, we also suggest to use '--base' option to 
>> specify the
>> base tree in git format-patch, please see 
>> https://stackoverflow.com/a/37406982]
>>
>> url:    
>> https://github.com/0day-ci/linux/commits/Christophe-Leroy/Use-hugepages-to-map-kernel-mem-on-8xx/20200317-065610 
>>
>> base:    8548fd2f20ed19b0e8c0585b71fdfde1ae00ae3c
>> config: powerpc-tqm8xx_defconfig (attached as .config)
>> compiler: powerpc-linux-gcc (GCC) 9.2.0
>> reproduce:
>>          wget 
>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>> -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # save the attached .config to linux build tree
>>          GCC_VERSION=9.2.0 make.cross ARCH=powerpc
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>     In file included from arch/powerpc/mm/fault.c:33:
>>     include/linux/hugetlb.h: In function 'hstate_inode':
>>>> include/linux/hugetlb.h:522:9: error: implicit declaration of 
>>>> function 'HUGETLBFS_SB'; did you mean 'HUGETLBFS_MAGIC'? 
>>>> [-Werror=implicit-function-declaration]
>>       522 |  return HUGETLBFS_SB(i->i_sb)->hstate;
>>           |         ^~~~~~~~~~~~
>>           |         HUGETLBFS_MAGIC
>>>> include/linux/hugetlb.h:522:30: error: invalid type argument of '->' 
>>>> (have 'int')
>>       522 |  return HUGETLBFS_SB(i->i_sb)->hstate;
>>           |                              ^~
>>     cc1: all warnings being treated as errors
> 
> hstate_inode() shouldn't use HUGETLBFS_SB() which CONFIG_HUGETLBFS is 
> not set.
> 
> Proposed fix at https://patchwork.ozlabs.org/patch/1256108/

The fix is going in 5.7 via mm tree it seems, see 
https://patchwork.kernel.org/patch/11470105/

Christophe

> 
> [...]
> 
> 
>>>> include/linux/hugetlb.h:522:30: error: invalid type argument of '->' 
>>>> (have 'int')
>>       522 |  return HUGETLBFS_SB(i->i_sb)->hstate;
>>           |                              ^~
>>     At top level:
>>     arch/powerpc//mm/nohash/8xx.c:73:18: error: 
>> '__early_map_kernel_hugepage' defined but not used 
>> [-Werror=unused-function]
>>        73 | static int __ref __early_map_kernel_hugepage(unsigned long 
>> va, phys_addr_t pa,
>>           |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     cc1: all warnings being treated as errors
> 
> This patch is a preparation patch. The function is not used yet, that's 
> normal. Ok, it breaks bisectability. Should it be squashed with the 
> first user of the function ?
> 
> Christophe
