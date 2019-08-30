Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C17BA3EC4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 22:07:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Kr9Q0ddqzDqPf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 06:07:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Kr6w6qHCzDqMy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 06:04:55 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F1F9DABE7;
 Fri, 30 Aug 2019 20:04:51 +0000 (UTC)
Date: Fri, 30 Aug 2019 22:04:51 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2 4/4] powerpc/64: system call implement the bulk of
 the logic in C
Message-ID: <20190830220451.74183fa0@kitsune.suse.cz>
In-Reply-To: <201908310210.jvudTAn4%lkp@intel.com>
References: <20190827135548.21457-5-npiggin@gmail.com>
 <201908310210.jvudTAn4%lkp@intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@01.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 31 Aug 2019 02:48:26 +0800
kbuild test robot <lkp@intel.com> wrote:

> Hi Nicholas,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [cannot apply to v5.3-rc6 next-20190830]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-64-syscalls-in-C/20190828-064221
> config: powerpc64-defconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=powerpc64 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    powerpc64-linux-ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'.
>    arch/powerpc/kernel/syscall_64.o: In function `.system_call_exception':
> >> syscall_64.c:(.text+0x180): undefined reference to `.tabort_syscall'  

Interestingly it builds and boots for me. Is this something about
dotted vs dotless symbols depending on some config options?

I see there is _GLOBAL(ret_from_fork) just below so maybe we need
_GLOBAL(tabort_syscall) instead of .globl tabort_syscall as well.

Thanks

Michal
