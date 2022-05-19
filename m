Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 004E852DB4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 19:30:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3xhH6d3yz3blg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 03:30:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=j55Dg0KO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=j55Dg0KO; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3xgj4y0Lz2ynL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 03:29:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B34866182A;
 Thu, 19 May 2022 17:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17BCC385AA;
 Thu, 19 May 2022 17:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1652981389;
 bh=g53Y2YaDhOn31lb4ikdAKEj8xh9/Sa586oK5ccMyOKM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j55Dg0KOedrmIYtQCAjwlgobU/eX/Y7m/nIQOUUzxAa5QCS4+yfVJs0zuYfBExfGP
 VtDpTFM9sPH3MJJVyy4le6VvsqOSafd8I+piJslp3hWLcH2nenxMrDzyET21hwWHdW
 9WLVAun1TmCy8ADN1FVJ5eCUoRWatIAJNH1QX6A8=
Date: Thu, 19 May 2022 10:29:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
Message-Id: <20220519102948.f5c990db0e5f9cfb35c2a68f@linux-foundation.org>
In-Reply-To: <202205192320.CoXevcfR-lkp@intel.com>
References: <20220519091237.676736-1-naveen.n.rao@linux.vnet.ibm.com>
 <202205192320.CoXevcfR-lkp@intel.com>
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
Cc: kbuild-all@lists.01.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Eric Biederman <ebiederm@xmission.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 19 May 2022 23:17:48 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi "Naveen,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on f993aed406eaf968ba3867a76bb46c95336a33d0]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Naveen-N-Rao/kexec_file-Drop-weak-attribute-from-arch_kexec_apply_relocations-_add/20220519-171432
> base:   f993aed406eaf968ba3867a76bb46c95336a33d0
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20220519/202205192320.CoXevcfR-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 11.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/67171688c71cb5b05f26e0dfc45eec8d8d1428ff
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Naveen-N-Rao/kexec_file-Drop-weak-attribute-from-arch_kexec_apply_relocations-_add/20220519-171432
>         git checkout 67171688c71cb5b05f26e0dfc45eec8d8d1428ff
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/s390/kernel/machine_kexec_reloc.c:3:
> >> arch/s390/include/asm/kexec.h:89:38: error: unknown type name 'Elf_Shdr'; did you mean 'elf_shdr'?
>       89 |                                      Elf_Shdr *section,
>          |                                      ^~~~~~~~
>          |                                      elf_shdr
>    arch/s390/include/asm/kexec.h:90:44: error: unknown type name 'Elf_Shdr'
>       90 |                                      const Elf_Shdr *relsec,
>          |                                            ^~~~~~~~
>    arch/s390/include/asm/kexec.h:91:44: error: unknown type name 'Elf_Shdr'
>       91 |                                      const Elf_Shdr *symtab);
>          |                                            ^~~~~~~~

Thanks, I did this:

--- a/arch/s390/include/asm/kexec.h~kexec_file-drop-weak-attribute-from-arch_kexec_apply_relocations-fix
+++ a/arch/s390/include/asm/kexec.h
@@ -9,6 +9,8 @@
 #ifndef _S390_KEXEC_H
 #define _S390_KEXEC_H
 
+#include <linux/module.h>
+
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/setup.h>
_

