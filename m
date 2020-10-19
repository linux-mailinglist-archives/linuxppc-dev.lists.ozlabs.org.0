Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E64292AAA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 17:42:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFLcN4S71zDqWJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 02:42:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFLZN3FfyzDqRR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 02:40:48 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CFLYw6bNSzB09bN;
 Mon, 19 Oct 2020 17:40:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zj42ynJJ94zM; Mon, 19 Oct 2020 17:40:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CFLYw4v98zB09bG;
 Mon, 19 Oct 2020 17:40:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2194B8B7BD;
 Mon, 19 Oct 2020 17:40:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8f7Jl5JhxJ1G; Mon, 19 Oct 2020 17:40:42 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E7B38B79E;
 Mon, 19 Oct 2020 17:40:41 +0200 (CEST)
Subject: Re: [PATCH] drm/amd/display: Fix missing declaration of
 enable_kernel_vsx()
To: kernel test robot <lkp@intel.com>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <1a5d454cf080a00c04ae488ef6e98d5fcc933550.1603100151.git.christophe.leroy@csgroup.eu>
 <202010192006.INRpAG6V-lkp@intel.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <718db443-8457-bb81-43d5-6548c0ed8c68@csgroup.eu>
Date: Mon, 19 Oct 2020 17:40:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <202010192006.INRpAG6V-lkp@intel.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, amd-gfx@lists.freedesktop.org,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/10/2020 à 14:52, kernel test robot a écrit :
> Hi Christophe,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v5.9 next-20201016]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/drm-amd-display-Fix-missing-declaration-of-enable_kernel_vsx/20201019-174155
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 7cf726a59435301046250c42131554d9ccc566b8
> config: arc-randconfig-r013-20201019 (attached as .config)
> compiler: arceb-elf-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/0day-ci/linux/commit/33f0ea8bebc4132d957107f55776d8f1e02df928
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Christophe-Leroy/drm-amd-display-Fix-missing-declaration-of-enable_kernel_vsx/20201019-174155
>          git checkout 33f0ea8bebc4132d957107f55776d8f1e02df928
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arc
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:29,
>                      from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
>                      from drivers/gpu/drm/amd/amdgpu/amdgpu.h:67,
>                      from drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:40:
>>> drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:36:10: fatal error: asm/switch-to.h: No such file or directory
>        36 | #include <asm/switch-to.h>
>           |          ^~~~~~~~~~~~~~~~~
>     compilation terminated.


Argh ! Yes that's a typo. And anyway it fixes nothing because <asm/switch_to.h> is already included.

The issue is that enable_kernel_vsx() is only declared when CONFIG_VSX is set. The simplest solution 
will probably be to declare it at all time.

Christophe

> 
> vim +36 drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h
> 
>      34	
>      35	#include <asm/byteorder.h>
>    > 36	#include <asm/switch-to.h>
>      37	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
