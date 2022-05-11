Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E8B522962
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 04:05:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KydXn2Kgsz3cFL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 12:05:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=VBO7kizV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=VBO7kizV; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KydX80WNBz2yQK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 12:04:55 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F1A89B81F90;
 Wed, 11 May 2022 02:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E53C385D4;
 Wed, 11 May 2022 02:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1652234690;
 bh=RqytgUQmYxvDTXBUw55j51kKtaUX/T2ojOwIJ6HZEiw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VBO7kizVkXUSaa6HmoCSB9sOGvIGYnAyrJKrueHyNZW3nqHwMync9fdvyD0jIWLB3
 BWm3UD/7XCPZ5egCQJKBcse8rbcVpPBoMBEAqKU8BjWdY/hurJsSHM8rL7YUxVGyKo
 jE9NYVKIhAdH/oaFOs4aYV+DNZcFV5aQnNczUPtM=
Date: Tue, 10 May 2022 19:04:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue
 when migration
Message-Id: <20220510190448.5e352897a147622ffa87175f@linux-foundation.org>
In-Reply-To: <202205110919.CWIcIqYE-lkp@intel.com>
References: <ea5abf529f0997b5430961012bfda6166c1efc8c.1652147571.git.baolin.wang@linux.alibaba.com>
 <202205110919.CWIcIqYE-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 catalin.marinas@arm.com, linux-mips@vger.kernel.org,
 James.Bottomley@hansenpartnership.com, paulus@samba.org,
 sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org,
 linux-s390@vger.kernel.org, gor@linux.ibm.com, deller@gmx.de,
 ysato@users.osdn.me, borntraeger@linux.ibm.com, arnd@arndb.de,
 hca@linux.ibm.com, Baolin Wang <baolin.wang@linux.alibaba.com>,
 songmuchun@bytedance.com, linux-arm-kernel@lists.infradead.org,
 tsbogend@alpha.franken.de, kbuild-all@lists.01.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 svens@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 11 May 2022 09:19:17 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi Baolin,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> [cannot apply to hnaz-mm/master arm64/for-next/core linus/master v5.18-rc6]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baolin-Wang/Fix-CONT-PTE-PMD-size-hugetlb-issue-when-unmapping-or-migrating/20220510-114753
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> config: h8300-buildonly-randconfig-r001-20220509 (https://download.01.org/0day-ci/archive/20220511/202205110919.CWIcIqYE-lkp@intel.com/config)
> compiler: h8300-linux-gcc (GCC) 11.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/b666792b4c5f9774c350977ff88837bafc36365a
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Baolin-Wang/Fix-CONT-PTE-PMD-size-hugetlb-issue-when-unmapping-or-migrating/20220510-114753
>         git checkout b666792b4c5f9774c350977ff88837bafc36365a
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=h8300 SHELL=/bin/bash
> 
> ...

Thanks. 
https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/tree/patches/mm-rmap-fix-cont-pte-pmd-size-hugetlb-issue-when-migration-fix.patch
(which is in current mm-everything) fixes this up.

