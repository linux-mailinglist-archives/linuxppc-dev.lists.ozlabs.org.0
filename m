Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 915413DFB33
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 07:47:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gfgjg38rHz2xvM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 15:47:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=UlW0DvUj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=UlW0DvUj; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gfgj60jhpz2xb1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 15:46:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=jRUGig0EXzdTjF3M0VcYNt0Nv98YmJSiq/SwjB8bR3k=; b=UlW0DvUjar7j970g0tYwOJtxpD
 7vny0Us8GoUsWybJqqkbDw5GI855zgZTv5iYjp4QwRU4QEsEbFxISpFWCqD8QjSSWk7RrYvbI5zcd
 VyDUzE/5bRrzqJMED4DKvUy2Fs6Isq/7L7uE11yZ56ZdG09M0cEDJZdpandDq94zu0mENOD1GPQNS
 EbqnrXKXUsctkZLKbcMSGHDKRDVXOPyM/vJmrfDug1vTD/L3M3flp4vkUypcYFOutuhswWweiKFCe
 SN3TgLDan/jrrl+Gr5bHtSG+SUEAqIdur5HEKZ0NkL92QJsMDMjPirzEObw1mX7ZRH47UPLGbW0ss
 Jfp6HGcw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB9jJ-005SPK-N8; Wed, 04 Aug 2021 05:46:21 +0000
Subject: Re: undefined reference to `.radix__create_section_mapping'
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 kernel test robot <lkp@intel.com>, Jordan Niethe <jniethe5@gmail.com>
References: <202108010251.C4jhEEBW-lkp@intel.com>
 <082eea82-c788-72e0-f6a4-eadfb54d1231@infradead.org>
 <c4398495-a50a-a749-6679-7510ed862db2@csgroup.eu>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <85498c30-6151-de0e-1647-fdb41b4b3320@infradead.org>
Date: Tue, 3 Aug 2021 22:46:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <c4398495-a50a-a749-6679-7510ed862db2@csgroup.eu>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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

On 8/3/21 10:31 PM, Christophe Leroy wrote:
> Hi Randy,
> 
> Le 04/08/2021 à 04:40, Randy Dunlap a écrit :
>> On 7/31/21 11:22 AM, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>> head:   c7d102232649226a69dddd58a4942cf13cff4f7c
>>> commit: fe3dc333d2ed50c9764d281869d87bae0d795ce5 powerpc/mmu: Don't duplicate radix_enabled()
>>> date:   3 months ago
>>> config: powerpc64-randconfig-r013-20210731 (attached as .config)
>>> compiler: powerpc-linux-gcc (GCC) 10.3.0
>>> reproduce (this is a W=1 build):
>>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>          chmod +x ~/bin/make.cross
>>>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fe3dc333d2ed50c9764d281869d87bae0d795ce5
>>>          git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>>          git fetch --no-tags linus master
>>>          git checkout fe3dc333d2ed50c9764d281869d87bae0d795ce5
>>>          # save the attached .config to linux build tree
>>>          mkdir build_dir
>>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-10.3.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>     powerpc-linux-ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.create_section_mapping':
>>>>> (.meminit.text+0x3c): undefined reference to `.radix__create_section_mapping'
>>>     powerpc-linux-ld: arch/powerpc/mm/book3s64/pgtable.o: in function `.remove_section_mapping':
>>>>> (.meminit.text+0x90): undefined reference to `.radix__remove_section_mapping'
>>
>> In the randconfig file:
>> # CONFIG_PPC_RADIX_MMU is not set
>>
>> It is default y, but maybe that is not strong enough?
>> I.e., should it be selected by PPC_BOOK3S_64?
>>
>> Changing the config to PPC_RADIX_MMU=y fixes the build errors.
>>
>> Or should arch/powerpc/mm/book3s64/pgtable.c be modified to handle
>> the case of PPC_RADIX_MMU is not set?
>>
> 
> Can you test https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210804013724.514468-1-jniethe5@gmail.com/ ?

Hi Christophe,

Yes, that builds without a problem. Thanks for the pointer.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

-- 
~Randy
