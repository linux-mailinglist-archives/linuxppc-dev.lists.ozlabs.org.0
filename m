Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7D63630C8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 16:58:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMx6g1Rntz3bVb
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 00:58:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=tsRfa+eE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.80;
 helo=conssluserg-01.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=tsRfa+eE; 
 dkim-atps=neutral
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMx6C3Nccz2ydJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Apr 2021 00:58:27 +1000 (AEST)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 13HEw2Em030183
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 23:58:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 13HEw2Em030183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1618671482;
 bh=rq83/8SBq3PTT68e2iZ8nPK/k8i2Myf6G/JabZ9UCXk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tsRfa+eEfdTmqIymhILUvndqoTKosq4Sjxhsjft92vzrOkajkLEqsraqc83peHvxK
 qofCX1GFf+xVl5mo5SCLqZ4Y2R77cjUr7go6JdEbbpjI7y1LKR1oHbQUBeDfENUE7a
 e2A3fo7t2mKn+I1Z61dnmpjjvoAOfJn908Me8IF+N1dGCtiy2BUwf6m9mxpywTK0k0
 /H3nUWF13fJBcH5tdSLofIeMM9FtMqt4JrsZDZ5IohLuPpVBjnhuijjCfOYtxwup2M
 dZkFAR+TbHxo07Vu/1hsQmSwBwPjkn/1XM8Lzc29WHueI1L+B18X0X84yoz0oiuNR2
 cKGyYlK/RXBDw==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id cu16so13534226pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 07:58:02 -0700 (PDT)
X-Gm-Message-State: AOAM531zY3WH/B6ocRWnJ0jshs8I0zc5rQ/nKmD2x1WepqUX6TyLFUQD
 D+FJkYTEX3zez8vQ8PpwmEozuceJhlwB+XyC29g=
X-Google-Smtp-Source: ABdhPJxWkCXt7g4Du/Ih7Ckz0ekVFUITURxJW3giTvuAUEWpP1/B8Iy1Q/VxSxCEtVTt62gkLz8TXtY7EWsJFR/AdpY=
X-Received: by 2002:a17:90a:1056:: with SMTP id
 y22mr14523757pjd.153.1618671481674; 
 Sat, 17 Apr 2021 07:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210416130051.239782-1-masahiroy@kernel.org>
In-Reply-To: <20210416130051.239782-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 17 Apr 2021 23:57:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS90BwrVZzpoavVE8AE0D01Ei7BuQg1E5eObQR+o74fow@mail.gmail.com>
Message-ID: <CAK7LNAS90BwrVZzpoavVE8AE0D01Ei7BuQg1E5eObQR+o74fow@mail.gmail.com>
Subject: Re: [PATCH v2] tools: do not include scripts/Kbuild.include
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
Cc: Song Liu <songliubraving@fb.com>, kvm@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Paul Mackerras <paulus@samba.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, Janosch Frank <frankja@linux.ibm.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Yonghong Song <yhs@fb.com>,
 KP Singh <kpsingh@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Networking <netdev@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, bpf <bpf@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 16, 2021 at 10:01 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit d9f4ff50d2aa ("kbuild: spilt cc-option and friends to
> scripts/Makefile.compiler"), some kselftests fail to build.
>
> The tools/ directory opted out Kbuild, and went in a different
> direction. They copy any kind of files to the tools/ directory
> in order to do whatever they want in their world.
>
> tools/build/Build.include mimics scripts/Kbuild.include, but some
> tool Makefiles included the Kbuild one to import a feature that is
> missing in tools/build/Build.include:
>
>  - Commit ec04aa3ae87b ("tools/thermal: tmon: use "-fstack-protector"
>    only if supported") included scripts/Kbuild.include from
>    tools/thermal/tmon/Makefile to import the cc-option macro.
>
>  - Commit c2390f16fc5b ("selftests: kvm: fix for compilers that do
>    not support -no-pie") included scripts/Kbuild.include from
>    tools/testing/selftests/kvm/Makefile to import the try-run macro.
>
>  - Commit 9cae4ace80ef ("selftests/bpf: do not ignore clang
>    failures") included scripts/Kbuild.include from
>    tools/testing/selftests/bpf/Makefile to import the .DELETE_ON_ERROR
>    target.
>
>  - Commit 0695f8bca93e ("selftests/powerpc: Handle Makefile for
>    unrecognized option") included scripts/Kbuild.include from
>    tools/testing/selftests/powerpc/pmu/ebb/Makefile to import the
>    try-run macro.
>
> Copy what they need into tools/build/Build.include, and make them
> include it instead of scripts/Kbuild.include.
>
> Link: https://lore.kernel.org/lkml/86dadf33-70f7-a5ac-cb8c-64966d2f45a1@linux.ibm.com/
> Fixes: d9f4ff50d2aa ("kbuild: spilt cc-option and friends to scripts/Makefile.compiler")
> Reported-by: Janosch Frank <frankja@linux.ibm.com>
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Applied to linux-kbuild.




> ---
>
> Changes in v2:
>   - copy macros to tools/build/BUild.include
>
>  tools/build/Build.include                     | 24 +++++++++++++++++++
>  tools/testing/selftests/bpf/Makefile          |  2 +-
>  tools/testing/selftests/kvm/Makefile          |  2 +-
>  .../selftests/powerpc/pmu/ebb/Makefile        |  2 +-
>  tools/thermal/tmon/Makefile                   |  2 +-
>  5 files changed, 28 insertions(+), 4 deletions(-)
>
> diff --git a/tools/build/Build.include b/tools/build/Build.include
> index 585486e40995..2cf3b1bde86e 100644
> --- a/tools/build/Build.include
> +++ b/tools/build/Build.include
> @@ -100,3 +100,27 @@ cxx_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(CXXFLAGS) -D"BUILD_STR(s)=\#s" $(CXX
>  ## HOSTCC C flags
>
>  host_c_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(KBUILD_HOSTCFLAGS) -D"BUILD_STR(s)=\#s" $(HOSTCFLAGS_$(basetarget).o) $(HOSTCFLAGS_$(obj))
> +
> +# output directory for tests below
> +TMPOUT = .tmp_$$$$
> +
> +# try-run
> +# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
> +# Exit code chooses option. "$$TMP" serves as a temporary file and is
> +# automatically cleaned up.
> +try-run = $(shell set -e;              \
> +       TMP=$(TMPOUT)/tmp;              \
> +       mkdir -p $(TMPOUT);             \
> +       trap "rm -rf $(TMPOUT)" EXIT;   \
> +       if ($(1)) >/dev/null 2>&1;      \
> +       then echo "$(2)";               \
> +       else echo "$(3)";               \
> +       fi)
> +
> +# cc-option
> +# Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
> +cc-option = $(call try-run, \
> +       $(CC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> +
> +# delete partially updated (i.e. corrupted) files on error
> +.DELETE_ON_ERROR:
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
> index 044bfdcf5b74..17a5cdf48d37 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -include ../../../../scripts/Kbuild.include
> +include ../../../build/Build.include
>  include ../../../scripts/Makefile.arch
>  include ../../../scripts/Makefile.include
>
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index a6d61f451f88..5ef141f265bd 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -include ../../../../scripts/Kbuild.include
> +include ../../../build/Build.include
>
>  all:
>
> diff --git a/tools/testing/selftests/powerpc/pmu/ebb/Makefile b/tools/testing/selftests/powerpc/pmu/ebb/Makefile
> index af3df79d8163..c5ecb4634094 100644
> --- a/tools/testing/selftests/powerpc/pmu/ebb/Makefile
> +++ b/tools/testing/selftests/powerpc/pmu/ebb/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -include ../../../../../../scripts/Kbuild.include
> +include ../../../../../build/Build.include
>
>  noarg:
>         $(MAKE) -C ../../
> diff --git a/tools/thermal/tmon/Makefile b/tools/thermal/tmon/Makefile
> index 59e417ec3e13..9db867df7679 100644
> --- a/tools/thermal/tmon/Makefile
> +++ b/tools/thermal/tmon/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # We need this for the "cc-option" macro.
> -include ../../../scripts/Kbuild.include
> +include ../../build/Build.include
>
>  VERSION = 1.0
>
> --
> 2.27.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210416130051.239782-1-masahiroy%40kernel.org.



-- 
Best Regards
Masahiro Yamada
