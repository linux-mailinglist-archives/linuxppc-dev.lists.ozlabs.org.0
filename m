Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4120545E719
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 06:17:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0jfx0xXSz3c7Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 16:17:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=rong.a.chen@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0jfV4GvWz305Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 16:17:00 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="216319294"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="216319294"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 21:15:58 -0800
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="510513613"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.255.31.165])
 ([10.255.31.165])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 21:15:55 -0800
Subject: Re: [kbuild-all] Re: [PATCH 1/8] powerpc/mm: Make slice specific to
 book3s/64
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 kernel test robot <lkp@intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 alex@ghiti.fr
References: <14e2c0b0d4fff49c1cb30166f54ce8e445e17b16.1637570556.git.christophe.leroy@csgroup.eu>
 <202111222218.RhruLp7S-lkp@intel.com>
 <adefca8d-5fd4-b9ad-dfb8-0cf334440935@csgroup.eu>
 <da5038fd-611a-a0b3-10b7-35dac6817e6a@csgroup.eu>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <802212cd-87d6-cb7b-768d-9794d08eb4f8@intel.com>
Date: Fri, 26 Nov 2021 13:15:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <da5038fd-611a-a0b3-10b7-35dac6817e6a@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: linux-mm@kvack.org, kbuild-all@lists.01.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/24/2021 9:49 PM, Christophe Leroy wrote:
> 
> 
> Le 24/11/2021 à 13:10, Christophe Leroy a écrit :
>>
>>
>> Le 22/11/2021 à 15:48, kernel test robot a écrit :
>>> Hi Christophe,
>>>
>>> I love your patch! Perhaps something to improve:
>>>
>>> [auto build test WARNING on powerpc/next]
>>> [also build test WARNING on hnaz-mm/master linus/master v5.16-rc2 
>>> next-20211118]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch]
>>>
>>> url: 
>>> https://github.com/0day-ci/linux/commits/Christophe-Leroy/Convert-powerpc-to-default-topdown-mmap-layout/20211122-165115 
>>>
>>> base: 
>>> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
>>> config: powerpc64-randconfig-s031-20211122 (attached as .config)
>>> compiler: powerpc64-linux-gcc (GCC) 11.2.0
>>> reproduce:
>>>          wget 
>>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>>> -O ~/bin/make.cross
>>>          chmod +x ~/bin/make.cross
>>>          # apt-get install sparse
>>>          # sparse version: v0.6.4-dirty
>>>          # 
>>> https://github.com/0day-ci/linux/commit/1d0b7cc86d08f25f595b52d8c39ba9ca1d29a30a 
>>>
>>>          git remote add linux-review https://github.com/0day-ci/linux
>>>          git fetch --no-tags linux-review 
>>> Christophe-Leroy/Convert-powerpc-to-default-topdown-mmap-layout/20211122-165115 
>>>
>>>          git checkout 1d0b7cc86d08f25f595b52d8c39ba9ca1d29a30a
>>>          # save the attached .config to linux build tree
>>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 
>>> make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' 
>>> ARCH=powerpc64
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>     arch/powerpc/mm/book3s64/slice.c: In function 
>>> 'slice_get_unmapped_area':
>>>>> arch/powerpc/mm/book3s64/slice.c:639:1: warning: the frame size of 
>>>>> 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>>>       639 | }
>>>           | ^
>>
>>
>> The problem was already existing when slice.c was in arch/powerpc/mm/
>>
>> This patch doesn't introduce the problem.
>>
> 
> In fact the problem is really added by yourself mister 'kernel test robot'.
> 
> CONFIG_FRAME_WARN is supposed to be 2048 on 64 bit architectures.
> 
> It the robot starts to reduce that value, it is on its own ....

Hi Christophe,

Thanks for the information, we'll set the default value for FRAME_WARN 
in randconfig tests.

Best Regards,
Rong Chen

> 
> 
> config FRAME_WARN
>      int "Warn for stack frames larger than"
>      range 0 8192
>      default 2048 if GCC_PLUGIN_LATENT_ENTROPY
>      default 1536 if (!64BIT && (PARISC || XTENSA))
>      default 1024 if (!64BIT && !PARISC)
>      default 2048 if 64BIT
>      help
>        Tell gcc to warn at build time for stack frames larger than this.
>        Setting this too low will cause a lot of warnings.
>        Setting it to 0 disables the warning.
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
