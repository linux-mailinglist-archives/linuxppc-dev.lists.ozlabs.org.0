Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC372D108D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 13:26:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqMxr14r9zDqWv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:26:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqMtC4ZH2zDqRY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Dec 2020 23:23:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Jaz1NyI5; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqMtB4Fy2z9sR4;
 Mon,  7 Dec 2020 23:23:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607343827;
 bh=fmsZAzPw8MotFZ9q0AOjH6980DIEzAETM+LqGX6ha0c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Jaz1NyI5rqYhmXdZkYhj3gQfgZkl8ajuREQt8e7qLD/4+JNm9AF8JmtohV2KEVDmF
 u8XNn+TPAgu5Kux3KOKH3EggqcjFqNyTlqHsLRAnKLir3K1GxZQApFNT68AUBOHR9O
 LRlvAsP3wLBMC4ik6lv21ltlwh20UrPCzNKfutqftqGRGE90SbqyeancWq2muv+fbM
 hugW+2nzOJgCXjbCz2/pFEgqgbD/h/yatmIzFewhI8Lx72lYH3iuy724jap7b+4ub8
 qyaaxlbWdOIX1PzrnI1HLU8iaWQmk0qyU3I+wH1vaUBbli/8HyhSa8hISsyPm5DLeG
 ttW0XW/1Lxbaw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: kernel test robot <lkp@intel.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [powerpc:next-test 54/220]
 arch/powerpc/kernel/vdso32/vgettimeofday.c:13:5: warning: no previous
 prototype for function '__c_kernel_clock_gettime64'
In-Reply-To: <202012042220.zO7hSFT2-lkp@intel.com>
References: <202012042220.zO7hSFT2-lkp@intel.com>
Date: Mon, 07 Dec 2020 23:23:43 +1100
Message-ID: <87czzlu7n4.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kernel test robot <lkp@intel.com> writes:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git=
 next-test
> head:   4e4ed87981c764498942c52004c620bb8f104eac
> commit: d0e3fc69d00d1f50d22d6b6acfc555ccda80ad1e [54/220] powerpc/vdso: P=
rovide __kernel_clock_gettime64() on vdso32
> config: powerpc64-randconfig-r011-20201204 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 32c5=
01dd88b62787d3a5ffda7aabcf4650dbe3cd)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc64 cross compiling tool for clang build
>         # apt-get install binutils-powerpc64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.g=
it/commit/?id=3Dd0e3fc69d00d1f50d22d6b6acfc555ccda80ad1e
>         git remote add powerpc https://git.kernel.org/pub/scm/linux/kerne=
l/git/powerpc/linux.git
>         git fetch --no-tags powerpc next-test
>         git checkout d0e3fc69d00d1f50d22d6b6acfc555ccda80ad1e
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dpowerpc64=20
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    arch/powerpc/kernel/vdso32/vgettimeofday.c:7:5: error: conflicting typ=
es for '__c_kernel_clock_gettime'
>    int __c_kernel_clock_gettime(clockid_t clock, struct old_timespec32 *t=
s,
>        ^

We're building vdso32, which is 32-bit code, we pass -m32:

  clang -Wp,-MMD,arch/powerpc/kernel/vdso32/.vgettimeofday.o.d -nostdinc -i=
system /usr/lib/llvm-11/lib/clang/11.0.0/include -I/linux/arch/powerpc/incl=
ude -I./arch/powerpc/include/generated -I/linux/include -I./include -I/linu=
x/arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -I/linu=
x/include/uapi -I./include/generated/uapi -include /linux/include/linux/kco=
nfig.h -include /linux/include/linux/compiler_types.h -D__KERNEL__ -I /linu=
x/arch/powerpc -DHAVE_AS_ATHIGH=3D1 -Qunused-arguments -Wall -Wundef -Werro=
r=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fsho=
rt-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Werror=3Dimplici=
t-int -Werror=3Dreturn-type -Wno-format-security -std=3Dgnu89 --target=3Dpo=
werpc64le-linux-gnu --prefix=3D/usr/bin/powerpc64le-linux-gnu- --gcc-toolch=
ain=3D/usr -no-integrated-as -Werror=3Dunknown-warning-option -mlittle-endi=
an -m64 -msoft-float -pipe -mcpu=3Dpower8 -mtune=3Dpower9 -mno-altivec -mno=
-vsx -mno-spe -fno-asynchronous-unwind-tables -Wa,-mpower4 -Wa,-many -mlitt=
le-endian -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address-o=
f-packed-member -Os -Wframe-larger-than=3D2048 -fno-stack-protector -Wno-fo=
rmat-invalid-specifier -Wno-gnu -mno-global-merge -Wno-unused-const-variabl=
e -fomit-frame-pointer -Wdeclaration-after-statement -Wvla -Wno-pointer-sig=
n -Wno-array-bounds -fno-strict-overflow -fno-stack-check -Werror=3Ddate-ti=
me -Werror=3Dincompatible-pointer-types -fmacro-prefix-map=3D/linux/=3D -Wn=
o-initializer-overrides -Wno-format -Wno-sign-compare -Wno-format-zero-leng=
th -Wno-pointer-to-enum-cast -Wno-tautological-constant-out-of-range-compar=
e -D_TASK_CPU=3D304 -shared -fno-common -fno-builtin -nostdlib -Wl,-soname=
=3Dlinux-vdso32.so.1 -Wl,--hash-style=3Dboth -include /linux/lib/vdso/getti=
meofday.c -fno-stack-protector -DDISABLE_BRANCH_PROFILING -ffreestanding -f=
asynchronous-unwind-tables   -I /linux/arch/powerpc/kernel/vdso32 -I ./arch=
/powerpc/kernel/vdso32    -DKBUILD_MODFILE=3D'"arch/powerpc/kernel/vdso32/v=
gettimeofday"' -DKBUILD_BASENAME=3D'"vgettimeofday"' -DKBUILD_MODNAME=3D'"v=
gettimeofday"' -m32 -c -o arch/powerpc/kernel/vdso32/vgettimeofday.o /linux=
/arch/powerpc/kernel/vdso32/vgettimeofday.c


>    arch/powerpc/include/asm/vdso/gettimeofday.h:183:5: note: previous dec=
laration is here
>    int __c_kernel_clock_gettime(clockid_t clock, struct __kernel_timespec=
 *ts,
>        ^

But this is inside an #ifdef __powerpc64__ block:

182 #ifdef __powerpc64__
183 int __c_kernel_clock_gettime(clockid_t clock, struct __kernel_timespec =
*ts,
184                              const struct vdso_data *vd);


So is clang defining __powerpc64__ even for 32-bit code?

And the answer appears to be yes:

  $ clang --version
  Ubuntu clang version 11.0.0-2
  Target: powerpc64le-unknown-linux-gnu

  $ clang -m32 -dM -E - < /dev/null | grep powerpc
  #define __powerpc64__ 1
  #define __powerpc__ 1

Compare to gcc:

  $ gcc --version
  gcc (Ubuntu 10.2.0-13ubuntu1) 10.2.0
=20=20
  $ gcc -m32 -dM -E - < /dev/null | grep powerpc
  #define __powerpc__ 1
  #define powerpc 1
  #define __powerpc 1


Which is fairly problematic, because we use the presence/absence of
__powerpc64__ to determine if we're building 64-bit/32-bit code in
several places.

Not sure what the best approach for fixing that is.

cheers
