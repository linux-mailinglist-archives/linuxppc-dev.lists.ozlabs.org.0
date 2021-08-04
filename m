Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9585C3DFB18
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 07:32:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfgNH47Qjz3cVv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 15:31:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfgMx75Pxz2yNx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 15:31:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GfgMt1jwCz9sWD;
 Wed,  4 Aug 2021 07:31:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2_EiRzS62_q; Wed,  4 Aug 2021 07:31:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GfgMt0jjFz9sVr;
 Wed,  4 Aug 2021 07:31:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E9F118B790;
 Wed,  4 Aug 2021 07:31:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id U1PdDfzNf9zb; Wed,  4 Aug 2021 07:31:37 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 78D118B764;
 Wed,  4 Aug 2021 07:31:37 +0200 (CEST)
Subject: Re: undefined reference to `.radix__create_section_mapping'
To: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
 Jordan Niethe <jniethe5@gmail.com>
References: <202108010251.C4jhEEBW-lkp@intel.com>
 <082eea82-c788-72e0-f6a4-eadfb54d1231@infradead.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c4398495-a50a-a749-6679-7510ed862db2@csgroup.eu>
Date: Wed, 4 Aug 2021 07:31:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <082eea82-c788-72e0-f6a4-eadfb54d1231@infradead.org>
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
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Randy,

Le 04/08/2021 à 04:40, Randy Dunlap a écrit :
> On 7/31/21 11:22 AM, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   c7d102232649226a69dddd58a4942cf13cff4f7c
>> commit: fe3dc333d2ed50c9764d281869d87bae0d795ce5 powerpc/mmu: Don't duplicate radix_enabled()
>> date:   3 months ago
>> config: powerpc64-randconfig-r013-20210731 (attached as .config)
>> compiler: powerpc-linux-gcc (GCC) 10.3.0
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O 
>> ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fe3dc333d2ed50c9764d281869d87bae0d795ce5 
>>
>>          git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>          git fetch --no-tags linus master
>>          git checkout fe3dc333d2ed50c9764d281869d87bae0d795ce5
>>          # save the attached .config to linux build tree
>>          mkdir build_dir
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-10.3.0 make.cross O=build_dir ARCH=powerpc 
>> SHELL=/bin/bash
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>     powerpc-linux-ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.create_section_mapping':
>>>> (.meminit.text+0x3c): undefined reference to `.radix__create_section_mapping'
>>     powerpc-linux-ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.remove_section_mapping':
>>>> (.meminit.text+0x90): undefined reference to `.radix__remove_section_mapping'
> 
> In the randconfig file:
> # CONFIG_PPC_RADIX_MMU is not set
> 
> It is default y, but maybe that is not strong enough?
> I.e., should it be selected by PPC_BOOK3S_64?
> 
> Changing the config to PPC_RADIX_MMU=y fixes the build errors.
> 
> Or should arch/powerpc/mm/book3s64/pgtable.c be modified to handle
> the case of PPC_RADIX_MMU is not set?
> 

Can you test 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210804013724.514468-1-jniethe5@gmail.com/ ?

Thanks
Christophe
