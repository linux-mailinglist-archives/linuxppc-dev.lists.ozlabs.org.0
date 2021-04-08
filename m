Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD13735795C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 03:11:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG3Bd5rNxz3cFW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 11:11:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=yukuai3@huawei.com; receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG3B54glfz3c6l
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 11:11:25 +1000 (AEST)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FG37T11DQz1BGP3;
 Thu,  8 Apr 2021 09:09:09 +0800 (CST)
Received: from [10.174.179.129] (10.174.179.129) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 09:11:12 +0800
Subject: Re: [PATCH] powerpc: Make some symbols static
To: kernel test robot <lkp@intel.com>, <mpe@ellerman.id.au>
References: <20210407125942.4140430-1-yukuai3@huawei.com>
 <202104080005.BEYb9xKK-lkp@intel.com>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <4deb323a-ce00-b463-9b06-5cb5be0795fa@huawei.com>
Date: Thu, 8 Apr 2021 09:11:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <202104080005.BEYb9xKK-lkp@intel.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.129]
X-CFilter-Loop: Reflected
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
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/04/08 0:57, kernel test robot wrote:
> Hi Yu,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on v5.12-rc6 next-20210407]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Yu-Kuai/powerpc-Make-some-symbols-static/20210407-205258
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: powerpc64-defconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/0day-ci/linux/commit/7c0f3f68006b9b42ce944b02a2059128cc5826ec
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Yu-Kuai/powerpc-Make-some-symbols-static/20210407-205258
>          git checkout 7c0f3f68006b9b42ce944b02a2059128cc5826ec
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc64
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> arch/powerpc/kernel/btext.c:49:12: error: 'force_printk_to_btext' defined but not used [-Werror=unused-variable]
>        49 | static int force_printk_to_btext;
>           |            ^~~~~~~~~~~~~~~~~~~~~
>     cc1: all warnings being treated as errors
> 
> 
> vim +/force_printk_to_btext +49 arch/powerpc/kernel/btext.c
> 
>      47	
>      48	static int boot_text_mapped __force_data;
>    > 49	static int force_printk_to_btext;
>      50	

Will remove this variable in another patch.

Thanks
Yu Kuai
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
