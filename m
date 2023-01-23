Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E8677D45
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 14:59:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0sCm3GrXz3cNM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 00:59:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f+oPJtgg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::e2a; helo=mail-vs1-xe2a.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f+oPJtgg;
	dkim-atps=neutral
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0sBp3RMVz30R1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 00:58:23 +1100 (AEDT)
Received: by mail-vs1-xe2a.google.com with SMTP id v127so12882512vsb.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 05:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXeVUOI3tJuZ9T2gK/O+SpNhk9weOWc0rxA2abMay4I=;
        b=f+oPJtggRr/AYVdmrJrdS5cvNI2FHQdGZvYkdPk4YSPwKdkthwTzW0LGvrv+2Iev18
         LTtk76HyV0eGltMB3lS7aV0gQHsu9A1aU8DBeAponH7TvZkQzuskeukPsYCeynQufcNx
         fcxG8G7laVPAYJTAJev/5kHxuvP9AnL/z8S8antD4PXc+eAkzF7StSQ9Ky39fB1TN97Y
         nVN9P85z2XjZIqX09CDbuOASyb1TZw/uKqwphI+nSKTLlutEnW87WeXVKH6HSG9UBGGN
         sWMlv/GrLlc0Lm0WpHYvhLjd613mF9cwKcT35EILIGcTtDy3u7eB1q9hGBJzz2ddczCD
         HR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXeVUOI3tJuZ9T2gK/O+SpNhk9weOWc0rxA2abMay4I=;
        b=L/UZ6dloWYc5Kofs41bxCzFGY7wr7Vcy8xe8GKyf66kTcEs4YphB3I8YTi9cWKNntY
         JHnLmPIvT+VH8Z+fi5BF2ANnXWjeludRGg7ZiN+4j3JLoaK6vrVECoRSTXjyfnVCc0Hv
         sucL2jWzf9dQQh+OAr5t73Xew23g0XdJ0KMYrxOeSKnK4Yz78SdtcXGYrJsayN2RcpJj
         vxYLRgaSa5Z23E7VaRWz6kDNm6eBnrJmlzoQJNOYKLuyLZzFoP4iZfiFJGHAD/6nEwV5
         hBWAfZu0JDoA5suS1T4B7zYvGFydWpqY8gZeUSN8YpZtLFdu8yH+FfxVCJeuWT+xRr5G
         7XOA==
X-Gm-Message-State: AFqh2kqUHZqJ+VJnBWlDeg69fmNUlo7AvGcOG5laXSH7rKi1elFk2+ND
	qUumej7lb45lOexZUGxV8sQFWqNAFWmyOJW7xlUarQ==
X-Google-Smtp-Source: AMrXdXv3SdbW1OMymcwSw+UKgdSwlNT3pqbo79BE5ANCHiPz/DLfWupVOzWQju3/tf20XCLIQDK8JmT9SUQGBmNn37g=
X-Received: by 2002:a67:f9d8:0:b0:3d0:8947:f6f6 with SMTP id
 c24-20020a67f9d8000000b003d08947f6f6mr3340629vsq.3.1674482300949; Mon, 23 Jan
 2023 05:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 23 Jan 2023 19:28:10 +0530
Message-ID: <CA+G9fYs58vWj705MdaBKomVfHxNJ5ekSTmf53S4=4oVmc43CZg@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Remove clang's -Qunused-arguments from KBUILD_CPPFLAGS
To: Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: trix@redhat.com, dave.hansen@linux.intel.com, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, linux-s390@vger.kernel.org, kernel test robot <lkp@intel.com>, masahiroy@kernel.org, x86@kernel.org, mingo@redhat.com, llvm@lists.linux.dev, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, npiggin@gmail.com, bp@alien8.de, lkft-triage@lists.linaro.org, tglx@linutronix.de, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, ndesaulniers@google.com, linux-mips@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Alex Deucher <alexander.deucher@amd.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nathan,

On Thu, 12 Jan 2023 at 08:35, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi all,
>
> Clang can emit a few different warnings when it encounters a flag that it
> recognizes but does not support internally. These warnings are elevated t=
o
> errors within {as,cc}-option via -Werror to catch unsupported flags that =
should
> not be added to KBUILD_{A,C}FLAGS; see commit c3f0d0bc5b01 ("kbuild, LLVM=
Linux:
> Add -Werror to cc-option to support clang").
>
> If an unsupported flag is unconditionally to KBUILD_{A,C}FLAGS, all subse=
quent
> {as,cc}-option will always fail, preventing supported and even potentiall=
y
> necessary flags from getting adding to the tool flags.
>
> One would expect these warnings to be visible in the kernel build logs si=
nce
> they are added to KBUILD_{A,C}FLAGS but unfortunately, these warnings are
> hidden with clang's -Qunused-arguments flag, which is added to KBUILD_CPP=
FLAGS
> and used for both compiling and assembling files.
>
> Patches 1-4 address the internal inconsistencies of invoking the assemble=
r
> within kbuild by using KBUILD_AFLAGS consistently and using '-x
> assembler-with-cpp' over '-x assembler'. This matches how assembly files =
are
> built across the kernel and helps avoid problems in situations where macr=
o
> definitions or warning flags are present in KBUILD_AFLAGS, which cause
> instances of -Wunused-command-line-argument when the preprocessor is not =
called
> to consume them. There were a couple of places in architecture code where=
 this
> change would break things so those are fixed first.
>
> Patches 5-12 clean up warnings that will show up when -Qunused-argument i=
s
> dropped. I hope none of these are controversial.
>
> Patch 13 turns two warnings into errors so that the presence of unused fl=
ags
> cannot be easily ignored.
>
> Patch 14 drops -Qunused-argument. This is done last so that it can be eas=
ily
> reverted if need be.
>
> This series has seen my personal test framework, which tests several diff=
erent
> configurations and architectures, with LLVM tip of tree (16.0.0). I have =
done
> defconfig, allmodconfig, and allnoconfig builds for arm, arm64, i386, mip=
s,
> powerpc, riscv, s390, and x86_64 with GCC 12.2.0 as well but I am hoping =
the
> rest of the test infrastructure will catch any lurking problems.
>
> I would like this series to stay together so that there is no opportunity=
 for
> breakage so please consider giving acks so that this can be carried via t=
he
> kbuild tree (and many thanks to the people who have already provided such
> tags).
>
> ---
> Changes in v2:
> - Pick up tags where provided (thank you everyone!)
> - Patch 6 and 9: Clarify that '-s' is a compiler flag that is only releva=
nt to
>   the linking phase and remove all mention of the assembler's '-s' flag, =
as the
>   assembler is never directly invoked (Nick, Segher)
> - Patch 7: Move '-z noexecstack' into new ldflags-y variable (Nick)
> - Patch 8: Reword commit message to explain the problem in a clearer mann=
er
>   (Nick)
> - Link to v1: https://lore.kernel.org/r/20221228-drop-qunused-arguments-v=
1-0-658cbc8fc592@kernel.org
>
> ---
> Nathan Chancellor (12):
>       MIPS: Always use -Wa,-msoft-float and eliminate GAS_HAS_SET_HARDFLO=
AT
>       MIPS: Prefer cc-option for additions to cflags
>       powerpc: Remove linker flag from KBUILD_AFLAGS
>       powerpc/vdso: Remove unused '-s' flag from ASFLAGS
>       powerpc/vdso: Improve linker flags
>       powerpc/vdso: Remove an unsupported flag from vgettimeofday-32.o wi=
th clang
>       s390/vdso: Drop unused '-s' flag from KBUILD_AFLAGS_64
>       s390/vdso: Drop '-shared' from KBUILD_CFLAGS_64
>       s390/purgatory: Remove unused '-MD' and unnecessary '-c' flags
>       drm/amd/display: Do not add '-mhard-float' to dml_ccflags for clang
>       kbuild: Turn a couple more of clang's unused option warnings into e=
rrors
>       kbuild: Stop using '-Qunused-arguments' with clang
>
> Nick Desaulniers (2):
>       x86/boot/compressed: prefer cc-option for CFLAGS additions
>       kbuild: Update assembler calls to use proper flags and language tar=
get
>
>  Makefile                                    |  1 -
>  arch/mips/Makefile                          | 13 ++-------
>  arch/mips/include/asm/asmmacro-32.h         |  4 +--
>  arch/mips/include/asm/asmmacro.h            | 42 ++++++++++++++---------=
------
>  arch/mips/include/asm/fpregdef.h            | 14 ----------
>  arch/mips/include/asm/mipsregs.h            | 20 +++-----------
>  arch/mips/kernel/genex.S                    |  2 +-
>  arch/mips/kernel/r2300_fpu.S                |  4 +--
>  arch/mips/kernel/r4k_fpu.S                  | 12 ++++-----
>  arch/mips/kvm/fpu.S                         |  6 ++---
>  arch/mips/loongson2ef/Platform              |  2 +-
>  arch/powerpc/Makefile                       |  2 +-
>  arch/powerpc/kernel/vdso/Makefile           | 25 +++++++++++------
>  arch/s390/kernel/vdso64/Makefile            |  4 +--
>  arch/s390/purgatory/Makefile                |  2 +-
>  arch/x86/boot/compressed/Makefile           |  2 +-
>  drivers/gpu/drm/amd/display/dc/dml/Makefile |  3 ++-
>  scripts/Kconfig.include                     |  2 +-
>  scripts/Makefile.clang                      |  2 ++
>  scripts/Makefile.compiler                   |  8 +++---
>  scripts/as-version.sh                       |  2 +-
>  21 files changed, 74 insertions(+), 98 deletions(-)


FYI,
[ please provide comments, feedback and improvements on build/ ltp smoke te=
sts ]

LKFT test farm have fetched your patch series [1]
[PATCH v2 00/14] Remove clang's -Qunused-arguments from KBUILD_CPPFLAGS
 [1] https://lore.kernel.org/llvm/20221228-drop-qunused-arguments-v2-0-9adb=
ddd20d86@kernel.org/

Following build warnings and errors reported.

sh:
gcc-11-defconfig =E2=80=94 FAIL
gcc-11-shx3_defconfig =E2=80=94 FAIL
https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/build/h=
ttps___lore_kernel_org_llvm_20221228-drop-qunused-arguments-v2-1-9adbddd20d=
86_kernel_org/testrun/14221835/suite/build/tests/

mainline getting passed.
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc5/tes=
trun/14298156/suite/build/test/gcc-11-defconfig/history/
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc5/tes=
trun/14298156/suite/build/test/gcc-11-shx3_defconfig/history/

Build error:
In function 'follow_pmd_mask',
    inlined from 'follow_pud_mask' at /builds/linux/mm/gup.c:735:9,
    inlined from 'follow_p4d_mask' at /builds/linux/mm/gup.c:752:9,
    inlined from 'follow_page_mask' at /builds/linux/mm/gup.c:809:9:
/builds/linux/include/linux/compiler_types.h:358:45: error: call to
'__compiletime_assert_263' declared with attribute error: Unsupported
access size for {READ,WRITE}_ONCE().
  358 |         _compiletime_assert(condition, msg,
__compiletime_assert_, __COUNTER__)


s390:
clang-15-defconfig =E2=80=94 FAIL
https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/build/h=
ttps___lore_kernel_org_llvm_20221228-drop-qunused-arguments-v2-1-9adbddd20d=
86_kernel_org/testrun/14221913/suite/build/tests/

mainline getting passed.
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2-rc5/tes=
trun/14300495/suite/build/test/clang-15-defconfig/history/

Build error:
make --silent --keep-going --jobs=3D8
O=3D/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM_IAS=3D0 ARCH=3Ds390
CROSS_COMPILE=3Ds390x-linux-gnu- 'HOSTCC=3Dsccache clang' 'CC=3Dsccache
clang'
`.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o:
defined in discarded section `.exit.text' of fs/fuse/inode.o
`.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o:
defined in discarded section `.exit.text' of fs/fuse/inode.o
`.exit.text' referenced in section `__bug_table' of crypto/algboss.o:
defined in discarded section `.exit.text' of crypto/algboss.o
`.exit.text' referenced in section `__bug_table' of drivers/scsi/sd.o:
defined in discarded section `.exit.text' of drivers/scsi/sd.o
`.exit.text' referenced in section `__jump_table' of drivers/md/md.o:
defined in discarded section `.exit.text' of drivers/md/md.o
`.exit.text' referenced in section `__jump_table' of drivers/md/md.o:
defined in discarded section `.exit.text' of drivers/md/md.o
`.exit.text' referenced in section `.altinstructions' of
drivers/md/md.o: defined in discarded section `.exit.text' of
drivers/md/md.o
`.exit.text' referenced in section `.altinstructions' of
drivers/md/md.o: defined in discarded section `.exit.text' of
drivers/md/md.o
`.exit.text' referenced in section `.altinstructions' of
net/iucv/iucv.o: defined in discarded section `.exit.text' of
net/iucv/iucv.o
`.exit.text' referenced in section `__bug_table' of
drivers/s390/cio/qdio_thinint.o: defined in discarded section
`.exit.text' of drivers/s390/cio/qdio_thinint.o
`.exit.text' referenced in section `__bug_table' of
drivers/s390/net/qeth_l3_main.o: defined in discarded section
`.exit.text' of drivers/s390/net/qeth_l3_main.o
`.exit.text' referenced in section `__bug_table' of
drivers/s390/net/qeth_l3_main.o: defined in discarded section
`.exit.text' of drivers/s390/net/qeth_l3_main.o
s390x-linux-gnu-ld: BFD (GNU Binutils for Debian) 2.35.2 assertion
fail ../../bfd/elf64-s390.c:3349
make[2]: *** [/builds/linux/scripts/Makefile.vmlinux:34: vmlinux] Error 1

But,
Build and boot pass on arm64, arm, x86_64 and i386.
Build test performed for mips, parisc, riscv, s390, sh, sparc and
powerpc (known build errors for maple_defconfig and cell_defconfig),

Please refer following link for detailed build, boot, LTP smoketest.
https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/build/h=
ttps___lore_kernel_org_llvm_20221228-drop-qunused-arguments-v2-1-9adbddd20d=
86_kernel_org/?failures_only=3Dfalse&results_layout=3Dtable#!#test-results

Best regards
Naresh Kamboju

--
Linaro LKFT
https://lkft.linaro.org

> ---
> base-commit: 88603b6dc419445847923fcb7fe5080067a30f98
> change-id: 20221228-drop-qunused-arguments-0c5c7dae54fb
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
>
