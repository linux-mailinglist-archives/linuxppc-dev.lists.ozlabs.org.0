Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C18341654
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 08:21:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1wLH0mn8z30HC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 18:21:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g3ngt0Um;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::635;
 helo=mail-ej1-x635.google.com; envelope-from=naresh.kamboju@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=g3ngt0Um; dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1wKp0rXMz30Cj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 18:20:59 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id r12so8013939ejr.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 00:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Qm1M+9iwmqug094Ij1+/BFzpWH81JqUDY9n0PrAzHc4=;
 b=g3ngt0UmUgqJer6ViP+FowVeNeFkFrqOxBsDz+jDSgMDOIUSyI7ffJiYdGH9jmD9G9
 08L4O6bZwNh/c95d7bu/BHFcJgzmi5Ek4tBmED1dVVj11ElITX/OiiAbP6Xa4eaUrrnG
 /SCi+lYvQ7aq1VsQH01ZG4MYn7BK1T1Tdr2bkpmwYHw5uIQJIahkV+KMymc7KTFUrohC
 9KPlXDDfPvLVuTgBGaNldy7WgKxAL1wC3pfB1BQBZEQYQoZdtUXXGvcshe5EhO2efQHW
 hoX2KHaIlwYB+sdN/PhyHdizguTyMMfVZHOHKtqgmkU9htGBEtdPARnuRJAx1OOf1wxP
 MLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Qm1M+9iwmqug094Ij1+/BFzpWH81JqUDY9n0PrAzHc4=;
 b=o2C5LSz3kFL36pQsumhI7K5mjG3tvEVtCeaQY5UdbNSVOWj07JvE/fWjjwgAvsh52e
 +bspKcDHl6jMATKh5spPD2JQDPVHbrGGkPs1CPAe7WQhqO3Lo4LJeWgUZynvQ08t2BVO
 zok++WrdcM7TiEeKrrFPVALp+pamVoJccIfk2ZiGXjh3zZPocjOJupG4aT4K9jUJZrAd
 DRgVjZmadYLGcYPCPCTEbyiCmTmEtetiGqLDg/8GlFwMz5RG/0IN5DYEvLjV+tbiVEED
 fXzBOcvZwnN7/9L8nq7YttibXP1OnkhrX0jnHxdKWxxymollWLULupEmgO9GbQIJIiEX
 BqPw==
X-Gm-Message-State: AOAM532omxBEz19eufWo6Orrf/ZaPAAbWNL7i1UElFnZmXr2Xh+m3afp
 D2w1Mc6Ws+F/SxEpHldjZ/WFU4g1Oq/9vD3K+dtl+w==
X-Google-Smtp-Source: ABdhPJz2ps/x+IiYH/UpKiBHMnKmG6F64vEm6r0pzp2mHWOW5Xd7CNWXzol+hk3UHSVR0Dl/9dllUT844kiXDLfIeEM=
X-Received: by 2002:a17:906:70d:: with SMTP id
 y13mr2728501ejb.170.1616138453152; 
 Fri, 19 Mar 2021 00:20:53 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 19 Mar 2021 12:50:42 +0530
Message-ID: <CA+G9fYu=a0pk79He2DoQ9NGHkbG58PMhqJsEk=xiQv+v495Dmw@mail.gmail.com>
Subject: Clang: powerpc: kvm/book3s_hv_nested.c:264:6: error: stack frame size
 of 2480 bytes in function 'kvmhv_enter_nested_guest'
To: clang-built-linux <clang-built-linux@googlegroups.com>, 
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kvm-ppc@vger.kernel.org
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
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linux mainline master build breaks for powerpc defconfig.
There are multiple errors / warnings with clang-12 and clang-11 and 10.
 - powerpc (defconfig) with clang-12
 - powerpc (defconfig) with clang-11
 - powerpc (defconfig) with clang-10

The following build errors / warnings triggered with clang-12.
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp LLVM=1 ARCH=powerpc
CROSS_COMPILE=powerpc64le-linux-gnu- 'HOSTCC=sccache clang'
'CC=sccache clang'
/builds/linux/arch/powerpc/kvm/book3s_hv_nested.c:264:6: error: stack
frame size of 2480 bytes in function 'kvmhv_enter_nested_guest'
[-Werror,-Wframe-larger-than=]
long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
     ^
1 error generated.
make[3]: *** [/builds/linux/scripts/Makefile.build:271:
arch/powerpc/kvm/book3s_hv_nested.o] Error 1

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

The following build errors / warnings triggered with clang-10 and clang-11.
 - powerpc (defconfig) with clang-11
 - powerpc (defconfig) with clang-10
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp LLVM=1 ARCH=powerpc
CROSS_COMPILE=powerpc64le-linux-gnu- 'HOSTCC=sccache clang'
'CC=sccache clang'

/usr/bin/powerpc64le-linux-gnu-ld:
arch/powerpc/kernel/vdso32/sigtramp.o: compiled for a little endian
system and target is big endian
/usr/bin/powerpc64le-linux-gnu-ld: failed to merge target specific
data of file arch/powerpc/kernel/vdso32/sigtramp.o
/usr/bin/powerpc64le-linux-gnu-ld:
arch/powerpc/kernel/vdso32/gettimeofday.o: compiled for a little
endian system and target is big endian
/usr/bin/powerpc64le-linux-gnu-ld: failed to merge target specific
data of file arch/powerpc/kernel/vdso32/gettimeofday.o
/usr/bin/powerpc64le-linux-gnu-ld:
arch/powerpc/kernel/vdso32/datapage.o: compiled for a little endian
system and target is big endian
/usr/bin/powerpc64le-linux-gnu-ld: failed to merge target specific
data of file arch/powerpc/kernel/vdso32/datapage.o
/usr/bin/powerpc64le-linux-gnu-ld:
arch/powerpc/kernel/vdso32/cacheflush.o: compiled for a little endian
system and target is big endian
/usr/bin/powerpc64le-linux-gnu-ld: failed to merge target specific
data of file arch/powerpc/kernel/vdso32/cacheflush.o
/usr/bin/powerpc64le-linux-gnu-ld: arch/powerpc/kernel/vdso32/note.o:
compiled for a little endian system and target is big endian
/usr/bin/powerpc64le-linux-gnu-ld: failed to merge target specific
data of file arch/powerpc/kernel/vdso32/note.o
/usr/bin/powerpc64le-linux-gnu-ld:
arch/powerpc/kernel/vdso32/getcpu.o: compiled for a little endian
system and target is big endian
/usr/bin/powerpc64le-linux-gnu-ld: failed to merge target specific
data of file arch/powerpc/kernel/vdso32/getcpu.o
/usr/bin/powerpc64le-linux-gnu-ld:
arch/powerpc/kernel/vdso32/vgettimeofday.o: compiled for a little
endian system and target is big endian
/usr/bin/powerpc64le-linux-gnu-ld: failed to merge target specific
data of file arch/powerpc/kernel/vdso32/vgettimeofday.o
clang: error: unable to execute command: Segmentation fault (core dumped)
clang: error: linker command failed due to signal (use -v to see invocation)
make[2]: *** [/builds/linux/arch/powerpc/kernel/vdso32/Makefile:51:
arch/powerpc/kernel/vdso32/vdso32.so.dbg] Error 254
make[2]: Target 'include/generated/vdso32-offsets.h' not remade
because of errors.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

build link,
https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline/-/jobs/1110841371#L59

--
Linaro LKFT
https://lkft.linaro.org
