Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F1838071E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 12:23:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhPks3v3jz3bV0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 20:23:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DFjSplou;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::632;
 helo=mail-ej1-x632.google.com; envelope-from=naresh.kamboju@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DFjSplou; dkim-atps=neutral
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhPkQ34xvz2yXn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 20:23:23 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id b25so43897238eju.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 03:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=qFvlD/6BZ28fWecjReUkM0S+uIcLjLXGLnAAXqLleOE=;
 b=DFjSplouAYxk8g+uU6Lmm98zjOYeoXUdkR3CRH8faIsFhibzsRykoB2DZhkNbhQ7QL
 TPhnR0j8RnnW3plqP+6O0Wxnpw6XlPuyHhGvi+jQV2QHxWG66sUB7m/mRcZLNYhfGXhy
 7CoUll/tJVrk2GFia2iGHneRPtlOpj1t/VC5rDD3u8zf/tr663x5oJT8ng1NWwqBFTOP
 kIt+nykxS07El/02YYYfKyjv/yfpCJozD9lpQOsztnavynYi7rqMyrPwKw2mgjQetwy8
 2R+4mOAny4f7A5tEVNw8YoW7Uazq99rE6YJqfnWZgFBN/8xgj2QceC1kovlcKyyJ3Y54
 iDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=qFvlD/6BZ28fWecjReUkM0S+uIcLjLXGLnAAXqLleOE=;
 b=RQ7QAvjiRfYgeIKqq2VhHJYaxcJnF02RZUjoxen5ZEONnhJHDWJh2ceUvgSggoiROg
 ZcoCYdMCQ2b6knx21bEQEhpg4RhvOHMELvtWsKdlpS+q8esR2UBJKWakGUBoKPcHNKC7
 vzeKm+9WN/wgI/3Hx5aW8IK6dva9AzO/YEgg0lPFDQQ/0zVB9HoSPJ31s9NSy2SNwFx7
 mQsu5mn/tfiqtBlEBrYzONDX/i2Y+rp8hquxKtr9Z3AMt9XpuKlmeCXucODUZjCp57Ga
 3u/U8GBwcR3EcvA4Lcypf5goadZTlreK4IY7IpD3usf7Wnv0m+1dRlg/XzMraITOARLf
 OZ4Q==
X-Gm-Message-State: AOAM532PpjmV7GQ9vxWkT/k3GrCsz92AlErfQpR/KH78Gh+An6j6mbG8
 wEefZmdJnHsdQL6zGMGz+ZbnnkBFgmqQGSyTrbohHw==
X-Google-Smtp-Source: ABdhPJy3xvOAXq45yI7qPsRL45PJ5C0F2LADSb0+HTVKyVLapOesgozoqdN35AGPQ1Be6TQ4mpGJ7eYkCDwk8eNu8Mk=
X-Received: by 2002:a17:906:fcdc:: with SMTP id
 qx28mr16285817ejb.375.1620987796824; 
 Fri, 14 May 2021 03:23:16 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 14 May 2021 15:53:05 +0530
Message-ID: <CA+G9fYvX2hBci5ywRYYWrA0oD2ezAPG04YZkCgykRV-4QdW2AA@mail.gmail.com>
Subject: Re : mm/mremap: use range flush that does TLB and page walk cache
 flush
To: linux-mm <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, lkft-triage@lists.linaro.org,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Andrew Morton <akpm@linux-foundation.org>, Chengyang Fan <cy.fan@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The LKFT build system detected these build warnings and errors.

Regressions found on parisc:
  - build/gcc-9-defconfig
  - build/gcc-9-tinyconfig
  - build/gcc-10-allnoconfig
  - build/gcc-10-tinyconfig
  - build/gcc-9-allnoconfig
  - build/gcc-10-defconfig


make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=parisc
CROSS_COMPILE=hppa-linux-gnu- 'CC=sccache hppa-linux-gnu-gcc'
'HOSTCC=sccache gcc'
In file included from /builds/linux/arch/parisc/include/asm/cacheflush.h:7,
                 from /builds/linux/include/linux/highmem.h:12,
                 from /builds/linux/include/linux/pagemap.h:11,
                 from /builds/linux/include/linux/ksm.h:13,
                 from /builds/linux/mm/mremap.c:14:
/builds/linux/mm/mremap.c: In function 'flush_pte_tlb_pwc_range':
/builds/linux/arch/parisc/include/asm/tlbflush.h:20:2: error: 'return'
with a value, in function returning void [-Werror=return-type]
   20 |  __flush_tlb_range((vma)->vm_mm->context, start, end)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/builds/linux/mm/mremap.c:219:9: note: in expansion of macro 'flush_tlb_range'
  219 |  return flush_tlb_range(vma, start, end);
      |         ^~~~~~~~~~~~~~~
/builds/linux/mm/mremap.c:214:33: note: declared here
  214 | #define flush_pte_tlb_pwc_range flush_pte_tlb_pwc_range
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
/builds/linux/mm/mremap.c:215:20: note: in expansion of macro
'flush_pte_tlb_pwc_range'
  215 | static inline void flush_pte_tlb_pwc_range(struct vm_area_struct *vma,
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[2]: *** [/builds/linux/scripts/Makefile.build:273: mm/mremap.o] Error 1

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

steps to reproduce:
---------------------------

#!/bin/sh

# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.


tuxmake --runtime podman --target-arch parisc --toolchain gcc-9
--kconfig allnoconfig


--
Linaro LKFT
https://lkft.linaro.org
