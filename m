Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E57E4250994
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 21:45:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb2dr1Tz9zDqSJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 05:45:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ns3ofsQU; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb2cG4g6QzDq9B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 05:43:41 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id k18so7157977qtm.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Aug 2020 12:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nxMDOV863B6ENn1KD7dBoUHY4CKPemM7ILl1lSFWSeA=;
 b=Ns3ofsQUsIfBhS2NjmhWjUbJYe4w09LOSkAOOsZFR/gTHwXA3UlezJsPHIi3DHY01X
 qDGMrkmlJ98B56GcYgKV5dM2egD/ilJ/DQlD0Nb7QtreWLnrmsf/oRQWryuQbePCF5CM
 7FGUM7175v0YE1YnyDLlfWkrYa6tWlQwZpMvaLsZf+O48EwClYyUUTq/Z+sLMCL9uHm5
 7i+p+Y6v6XmFR7ezpHVP5Pbi51R/cgpE8mgGsD6EbjwYNBGSR6rLOuKBJ6TO/LgqEyVC
 8ixgEbtvGq29oR9Uz20U0VTKYupQ9J9LfYdzRBhlwxpyeZQgpifD5xFZ8i0q78E4jFMj
 2V6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nxMDOV863B6ENn1KD7dBoUHY4CKPemM7ILl1lSFWSeA=;
 b=UmjNHOloP+dsSyu5pcSbfBXSPWduSYRMTTXctbGe80r5DFcTdUk3RncojLal44qi0I
 l8KiG8VZNiSw0gzJWK6bwYaRbN34tuyWBUMyMn/khFk2Fu4Mi0xwXcB+ZmlBllZoNygy
 i+Ng/nBCp2KEGe/pNZQvYZnMOa0BQnqvzxEjZ3FUdiUK1dFdD68Rhy9d9279bkLslqm3
 MdiAJrhkLllzjt2pqO19w0Mz+yWgHUryQXwPvNwskliOCbSalk6EvmJHClwBBvjmTANP
 +7abIY3U1ApMmoIJNIxvOAWx3XvpoeaabydMhuSh9Qcjkq4SMEQ4nOfsyFHD9n2PgvV8
 NuXA==
X-Gm-Message-State: AOAM533vh/yj4JpR2VLafSs0rhByslDlbS8jiadcMLbW6u6w6qbtBzj6
 JCo2rnW/SXo4ostiV5EGe+0=
X-Google-Smtp-Source: ABdhPJxIIYFFzWCqhZVqD8ortSRZ+/qSn80WqCZGgy/cfTA61slUxkBK8pavePqMqaGlY80GbgxAJw==
X-Received: by 2002:ac8:710b:: with SMTP id z11mr6341745qto.64.1598298217743; 
 Mon, 24 Aug 2020 12:43:37 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
 by smtp.gmail.com with ESMTPSA id a203sm10378314qkg.30.2020.08.24.12.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 12:43:37 -0700 (PDT)
Date: Mon, 24 Aug 2020 12:43:35 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [GIT PULL] fallthrough pseudo-keyword macro conversions for
 5.9-rc3
Message-ID: <20200824194335.GA4082027@ubuntu-n2-xlarge-x86>
References: <20200824034841.GA29995@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200824034841.GA29995@embeddedor>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 23, 2020 at 10:48:41PM -0500, Gustavo A. R. Silva wrote:
> Hi Linus,
> 
> Not sure what the problem was with my pull-request for -rc2. So, I'm giving
> this a second try because I think it is worth it.
> 
> I have build-tested this patch on 10 different architectures: x86_64, i386,
> arm64, powerpc, s390, sparc64, sh, m68k, powerpc64 and alpha (allyesconfig/
> allmodconfig for all of them). This is in linux-next already and kernel
> test robot has also helped me to successfully build-test early versions
> of this patch[2][3][4][5]. This patch does not introduce any new warnings.
> 
> Thank you
> --
> Gustavo
> 
> [1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
> [2] https://lore.kernel.org/lkml/5f3cc99a.HgvOW3rH0mD0RmkM%25lkp@intel.com/
> [3] https://lore.kernel.org/lkml/5f3dd1d2.l1axczH+t4hMBZ63%25lkp@intel.com/
> [4] https://lore.kernel.org/lkml/5f3e977a.mwYHUIObbR4SHr0B%25lkp@intel.com/
> [5] https://lore.kernel.org/lkml/5f3f9e1c.qsyb%2FaySkiXNpkO4%25lkp@intel.com/
> 
> 
> The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:
> 
>   Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git tags/fallthrough-pseudo-keyword-5.9-rc3
> 
> for you to fetch changes up to df561f6688fef775baa341a0f5d960becd248b11:
> 
>   treewide: Use fallthrough pseudo-keyword (2020-08-23 17:36:59 -0500)
> 
> ----------------------------------------------------------------
> fallthrough pseudo-keyword macro conversions for 5.9-rc3
> 
> Hi Linus,
> 
> Please, pull the following tree-wide patch that replaces tons (2484) of
> /* fall through */ comments, and its variants, with the new pseudo-keyword
> macro fallthrough[1]. Also, remove unnecessary fall-through markings when
> it is the case.
> 
> There are currently 1167 intances of this fallthrough pseudo-keyword
> macro in mainline (5.9-rc2), that have been introduced over the last
> couple of development cycles:
> 
> $ git grep -nw 'fallthrough;' | wc -l
> 1167
> 
> The global adoption of the fallthrough pseudo-keyword is something certain
> to happen; so, better sooner than later. :) This will also save everybody's
> time and thousands of lines of unnecessarily repetitive changelog text.
> 
> After applying this patch on top of 5.9-rc2, we'll have a total of 3651
> instances of this macro:
> 
> $ git grep -nw 'fallthrough;' | wc -l
> 3651
> 
> This treewide patch doesn't address ALL fall-through markings in all
> subsystems at once because I have previously sent out patches for some of
> such subsystems separately, and I will follow up on them; however, this
> definitely contributes most of the work needed to replace all the
> fall-through markings with the fallthrough pseudo-keyword macro in the
> whole codebase.
> 
> I have build-tested this patch on 10 different architectures: x86_64, i386,
> arm64, powerpc, s390, sparc64, sh, m68k, powerpc64 and alpha (allyesconfig
> for all of them). This is in linux-next already and kernel test robot has
> also helped me to successfully build-test early versions of this
> patch[2][3][4][5].
> 
> Thanks
> --
> [1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
> [2] https://lore.kernel.org/lkml/5f3cc99a.HgvOW3rH0mD0RmkM%25lkp@intel.com/
> [3] https://lore.kernel.org/lkml/5f3dd1d2.l1axczH+t4hMBZ63%25lkp@intel.com/
> [4] https://lore.kernel.org/lkml/5f3e977a.mwYHUIObbR4SHr0B%25lkp@intel.com/
> [5] https://lore.kernel.org/lkml/5f3f9e1c.qsyb%2FaySkiXNpkO4%25lkp@intel.com/
> 
> ----------------------------------------------------------------
> Gustavo A. R. Silva (1):
>       treewide: Use fallthrough pseudo-keyword

$ scripts/config --file arch/powerpc/configs/powernv_defconfig -e KERNEL_XZ

$ make -skj"$(nproc)" ARCH=powerpc CROSS_COMPILE=powerpc64le-linux- distclean powernv_defconfig zImage
...
In file included from arch/powerpc/boot/../../../lib/decompress_unxz.c:234,
                 from arch/powerpc/boot/decompress.c:38:
arch/powerpc/boot/../../../lib/xz/xz_dec_stream.c: In function 'dec_main':
arch/powerpc/boot/../../../lib/xz/xz_dec_stream.c:586:4: error: 'fallthrough' undeclared (first use in this function)
  586 |    fallthrough;
      |    ^~~~~~~~~~~
arch/powerpc/boot/../../../lib/xz/xz_dec_stream.c:586:4: note: each undeclared identifier is reported only once for each function it appears in
In file included from arch/powerpc/boot/../../../lib/decompress_unxz.c:235,
                 from arch/powerpc/boot/decompress.c:38:
arch/powerpc/boot/../../../lib/xz/xz_dec_lzma2.c: In function 'xz_dec_lzma2_run':
arch/powerpc/boot/../../../lib/xz/xz_dec_lzma2.c:1046:4: error: 'fallthrough' undeclared (first use in this function)
 1046 |    fallthrough;
      |    ^~~~~~~~~~~
make[2]: *** [arch/powerpc/boot/Makefile:215: arch/powerpc/boot/decompress.o] Error 1
make[2]: Target 'arch/powerpc/boot/zImage' not remade because of errors.
make[1]: *** [arch/powerpc/Makefile:295: zImage] Error 2
make: *** [Makefile:335: __build_one_by_one] Error 2
make: Target 'distclean' not remade because of errors.
make: Target 'powernv_defconfig' not remade because of errors.
make: Target 'zImage' not remade because of errors.

This will end up affecting distribution configurations such as Debian
and OpenSUSE according to my testing. I am not sure what the solution
is, the PowerPC wrapper does not set -D__KERNEL__ so I am not sure that
compiler_attributes.h can be safely included. Adding Michael and
linuxppc-dev to CC.

Cheers,
Nathan
