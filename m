Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE604A5D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 17:49:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ssvv1k96zDqgk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 01:49:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.81; helo=conssluserg-02.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="MT7MkHeL"; 
 dkim-atps=neutral
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Sss82knnzDqjb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 01:47:06 +1000 (AEST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x5IFkgPH028474
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 00:46:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x5IFkgPH028474
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1560872803;
 bh=386ZLEU3NwMBqho2YAfsvSOOObyOn03wy4ojBhvxK60=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MT7MkHeLqcbHRnWchlvJDknSp29zT8ZiPnIz9zwQmtOavLw5sbgFgOXVyj1k1fTro
 s1lQIiLFAVcV1JPl0ApDY9h9W3M5VvRIC9mPD5MAyaQtcq7MPSq5Ky2OdkSs+A+mYR
 pfrH7rAl7g3SvIC37L58Q/EakMe3AUDyFdM+1A0dWK9twJdw6g78SRv5MQfQAn2q14
 NIBEs3WR4c4XKUbk1RDRjjvBqyraGIODRw/b2DZwoEY0DjuIrGbbOdosIt9aM7HryX
 DtFLfoy07F7+8C8Mhk7RQaXwd68Fm3jpmJl60iVyp5VkpAKiEFYZ5nHES5MfaBoaSS
 ENwNnZo7Lb8nQ==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id f20so6483613ual.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 08:46:43 -0700 (PDT)
X-Gm-Message-State: APjAAAU01Y8yF06SP4qupjJFNUvNSn68wJjUDAIsSbMaVeUCea3zMlJA
 v+iPMo3roUDrpRat95F8XEyo5AW+W32ykwiNyGc=
X-Google-Smtp-Source: APXvYqxtLvDnMS0CFAbDTiZ+5ZRw6eQK7Tj+rcqL/cHf9e3ufopPnNNl1cknMI4hmuC4210dH4UbfTG8JkzKXgzkjhE=
X-Received: by 2002:a67:7fcc:: with SMTP id
 a195mr44483545vsd.181.1560872800733; 
 Tue, 18 Jun 2019 08:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 19 Jun 2019 00:46:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNASv7WP+X2_oEEmp5tGqOxiv2VCj84CLuHhSsesF6AiD8A@mail.gmail.com>
Message-ID: <CAK7LNASv7WP+X2_oEEmp5tGqOxiv2VCj84CLuHhSsesF6AiD8A@mail.gmail.com>
Subject: Re: [PATCH 00/15] kbuild: refactor headers_install and support
 compile-test of UAPI headers
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
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
Cc: Song Liu <songliubraving@fb.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, David Howells <dhowells@redhat.com>,
 Paul Mackerras <paulus@samba.org>, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Yonghong Song <yhs@fb.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Jani Nikula <jani.nikula@intel.com>, Greentime Hu <green.hu@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Michal Marek <michal.lkml@markovi.net>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>, bpf@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 4, 2019 at 7:15 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
>
> Multiple people have suggested to compile-test UAPI headers.
>
> Currently, Kbuild provides simple sanity checks by headers_check
> but they are not enough to catch bugs.
>
> The most recent patch I know is David Howells' work:
> https://patchwork.kernel.org/patch/10590203/
>
> I agree that we need better tests for UAPI headers,
> but I want to integrate it in a clean way.
>
> The idea that has been in my mind is to compile each header
> to make sure the selfcontainedness.
>
> Recently, Jani Nikula proposed a new syntax 'header-test-y'.
> https://patchwork.kernel.org/patch/10947005/
>
> So, I implemented UAPI compile-testing on top of that.
>
> When adding a new feature, cleaning the code first is a
> good practice.
>
> [1] Remove headers_install_all
>
> This target installs UAPI headers of all architectures
> in a single tree.
> It does not make sense to compile test of headers from
> multiple arches at the same time. Hence, removed.
>
> [2] Split header installation into 'make headers' and 'make headers_install'
>
> To compile-test UAPI headers, we need a work-directory somewhere
> to save objects and .*.cmd files.
>
> usr/include/ will be the work-directory.
>
> Since we cannot pollute the final destination of headers_install,
>
> I split the header installation into two stages.
>
> 'make headers' will build up
> the ready-to-install headers in usr/include,
> which will be also used as a work-directory for the compile-test.
>
> 'make headers_install' will copy headers
> from usr/include to $(INSTALL_HDR_PATH)/include.
>
> [3] Support compile-test of UAPI headers
>
> This is implemented in usr/include/Makefile
>
>
> Jani Nikula (1):
>   kbuild: add support for ensuring headers are self-contained
>
> Masahiro Yamada (14):
>   kbuild: remove headers_{install,check}_all
>   kbuild: remove stale dependency between Documentation/ and
>     headers_install
>   kbuild: make gdb_script depend on prepare0 instead of prepare
>   kbuild: fix Kconfig prompt of CONFIG_HEADERS_CHECK
>   kbuild: add CONFIG_HEADERS_INSTALL and loosen the dependency of
>     samples
>   kbuild: remove build_unifdef target in scripts/Makefile
>   kbuild: build all prerequisite of headers_install simultaneously
>   kbuild: add 'headers' target to build up ready-to-install uapi headers
>   kbuild: re-implement Makefile.headersinst without directory descending
>   kbuild: move hdr-inst shorthand to top Makefile
>   kbuild: simplify scripts/headers_install.sh
>   kbuild: deb-pkg: do not run headers_check
>   fixup: kbuild: add support for ensuring headers are self-contained
>   kbuild: compile test UAPI headers to ensure they are self-contained

Series, applied to linux-kbuild.


>  Documentation/kbuild/headers_install.txt |   7 --
>  Documentation/kbuild/makefiles.txt       |  13 ++-
>  Makefile                                 |  56 +++++-----
>  arch/arc/configs/tb10x_defconfig         |   1 +
>  arch/nds32/configs/defconfig             |   1 +
>  arch/parisc/configs/a500_defconfig       |   1 +
>  arch/parisc/configs/b180_defconfig       |   1 +
>  arch/parisc/configs/c3000_defconfig      |   1 +
>  arch/parisc/configs/default_defconfig    |   1 +
>  arch/powerpc/configs/ppc6xx_defconfig    |   1 +
>  arch/s390/configs/debug_defconfig        |   1 +
>  include/uapi/{linux => }/Kbuild          |   6 +-
>  init/Kconfig                             |  20 ++++
>  lib/Kconfig.debug                        |  25 +++--
>  samples/Kconfig                          |  14 ++-
>  samples/Makefile                         |   4 +-
>  scripts/Kbuild.include                   |   6 --
>  scripts/Makefile                         |   5 -
>  scripts/Makefile.build                   |   9 ++
>  scripts/Makefile.headersinst             | 132 ++++++++++-------------
>  scripts/Makefile.lib                     |   3 +
>  scripts/cc-system-headers.sh             |   8 ++
>  scripts/headers.sh                       |  29 -----
>  scripts/headers_install.sh               |  48 ++++-----
>  scripts/package/builddeb                 |   2 +-
>  usr/.gitignore                           |   1 -
>  usr/Makefile                             |   2 +
>  usr/include/.gitignore                   |   3 +
>  usr/include/Makefile                     | 132 +++++++++++++++++++++++
>  29 files changed, 329 insertions(+), 204 deletions(-)
>  rename include/uapi/{linux => }/Kbuild (77%)
>  create mode 100755 scripts/cc-system-headers.sh
>  delete mode 100755 scripts/headers.sh
>  create mode 100644 usr/include/.gitignore
>  create mode 100644 usr/include/Makefile
>
> --
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Best Regards
Masahiro Yamada
