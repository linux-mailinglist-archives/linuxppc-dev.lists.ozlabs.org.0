Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D00EC88421
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 22:38:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464xsR2LVszDqlJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 06:38:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FDaMGbkV"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464xqS2mzrzDql5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 06:36:52 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id 10so6872443wmp.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Aug 2019 13:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KYFZatKieVunsEzp0B5P0lI+q/Z+oL9YnRWNQYwX4oU=;
 b=FDaMGbkVSUsi8Co4geaHL1acGEb5DviI7QsdZm9ucZtdcAINdzJcG8n+Q4MfcfNFB8
 bkakJ8TZVl3Ad7HnIraZiZ7NubRIc//MnclsbSnzIFZlkvvkH5giuuXVMg928Pxv5xH3
 4NTZwT9eQYeksOeHCyTLKATIcwUHIc+WsYUq+bpPfcfNLReGuNYJ78oRxkaLkBhFfViX
 sOsv1KbFmsvduc0ZI7dTiNSZpF05nubXFzcCjrIb0gw+dneSYv6Whf5gCuFoioRaXKTk
 G764ofmC544LiRd257eDnzuhylGT1N5+4eh5mBaXnDuw7oPZywb930h7UuyTmGgYDv7j
 8EFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KYFZatKieVunsEzp0B5P0lI+q/Z+oL9YnRWNQYwX4oU=;
 b=UvGd9JEkyub/GLVlhUMnFnj6dK6jpUT0g1xnTg5FQ5v5iLPDKnCakqX0qbhCHOds4x
 rVvbzmkxJLdIUf4usPd72DLU775yLyg1HZN/s/4WAXRg96STtAEAmiplLl3Aq3T5FjV6
 SdjVKO+qi88zj79fa31rEm4ENteWedoppMMrxQxiCOkmv9YdGCWJwXDv+tWfdqp3g7Vf
 rKlpD4bZMMKxFvev44O5BgjD4MUcV5HeD7kU2s0oxyzheSI6zEFghAEbAd7eAy1M8pH9
 e2f/1CW2GitK12BLnC4P2N+6TJL6sRwg+jtRUNiJ1hhAxhs26tzTjwfPjgaSkFz3ouob
 Vlxg==
X-Gm-Message-State: APjAAAWoJvZPISzZ2mlkjuX7vFaoinN6KCAUS8ziBAlN7bujHIA3KwA4
 bFXHee93DB9jx4AhRmQjcBk=
X-Google-Smtp-Source: APXvYqwE9VqBqil9HBjfWIuMeh+tgZEYlO5w/PbfiSHF/5jCZUwJlGIgZt8gDKcZm3e92z2mTW1cFA==
X-Received: by 2002:a1c:7606:: with SMTP id r6mr12372769wmc.118.1565383007951; 
 Fri, 09 Aug 2019 13:36:47 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id h9sm34823wrt.53.2019.08.09.13.36.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 13:36:46 -0700 (PDT)
Date: Fri, 9 Aug 2019 13:36:45 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] powerpc: fix inline asm constraints for dcbz
Message-ID: <20190809203645.GA85763@archlinux-threadripper>
References: <87h873zs88.fsf@concordia.ellerman.id.au>
 <20190809182106.62130-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <20190809182106.62130-1-ndesaulniers@google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, kbuild test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 09, 2019 at 11:21:05AM -0700, Nick Desaulniers wrote:
> The input parameter is modified, so it should be an output parameter
> with "=" to make it so that a copy of the input is not made by Clang.
> 
> Link: https://bugs.llvm.org/show_bug.cgi?id=42762
> Link: https://gcc.gnu.org/onlinedocs/gcc/Modifiers.html#Modifiers
> Link: https://github.com/ClangBuiltLinux/linux/issues/593
> Link: https://godbolt.org/z/QwhZXi
> Link: https://lore.kernel.org/lkml/20190721075846.GA97701@archlinux-threadripper/
> Fixes: 6c5875843b87 ("powerpc: slightly improve cache helpers")
> Debugged-by: Nathan Chancellor <natechancellor@gmail.com>
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

I applied this patch as well as a revert of the original patch and both
clang and GCC appear to generate the same code; I think a straight
revert would be better.

Crude testing script and the generated files attached.

Cheers,
Nathan

--mP3DRpeJDSE+ciuQ
Content-Type: application/x-sh
Content-Disposition: attachment; filename="tmp.bRmcRT0jd0.sh"
Content-Transfer-Encoding: quoted-printable

#!/bin/bash=0A=0Aset -ex=0A=0Aexport ARCH=3Dpowerpc=0Aexport CROSS_COMPILE=
=3Dpowerpc-linux-gnu-=0AFILE=3Darch/powerpc/mm/mem.o=0ATMP_DIR=3D$(mktemp -=
d -p "${HOME}/cbl/tmp")=0A=0A# https://raw.githubusercontent.com/nathanchan=
ce/scripts/master/funcs/bldgcc=0Asource "${HOME}"/github/scripts/funcs/bldg=
cc=0A=0Acd "${HOME}"/cbl/linux-next=0A=0ACBL_BIN=3D${HOME}/cbl/usr/bin=0A=
=0A# Clang without patch=0Agit reset -q --hard=0Agit checkout -q next-20190=
809=0Acurl -LSs 'https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/li=
nux.git/patch/?id=3Ded4289e8b48845888ee46377bd2b55884a55e60b' | git ap=0APA=
TH=3D${CBL_BIN}:${PATH} make -s -j$(nproc) CC=3Dclang O=3Dout distclean ppc=
44x_defconfig "${FILE}"=0A"${CBL_BIN}"/${CROSS_COMPILE}objdump -dr out/"${F=
ILE}" > "${TMP_DIR}"/clang-without-6c5875843b87-mem.o.txt=0A=0A# Clang with=
 Nick's patch=0Agit reset -q --hard=0Acurl -LSs https://raw.githubuserconte=
nt.com/ClangBuiltLinux/continuous-integration/ppc32/patches/llvm-all/linux/=
ppc32/0001-powerpc-fix-inline-asm-constraints-for-dcbz.patch | git ap=0APAT=
H=3D${CBL_BIN}:${PATH} make -s -j$(nproc) CC=3Dclang O=3Dout distclean ppc4=
4x_defconfig "${FILE}"=0A"${CBL_BIN}"/${CROSS_COMPILE}objdump -dr out/"${FI=
LE}" > "${TMP_DIR}"/clang-with-equal-Z-mem.o.txt=0A=0Aexport CROSS_COMPILE=
=3Dpowerpc-linux-=0Afor GCC_VERSION in 9.1.0 8.3.0 7.4.0 6.5.0 5.5.0; do=0A=
    GCC_TC_FOLDER=3D${HOME}/toolchains/gcc/${GCC_VERSION}/bin=0A=0A    # Ma=
ke sure GCC is built and installed=0A    [[ -f ${GCC_TC_FOLDER}/${CROSS_COM=
PILE}gcc ]] || GCC_VERSION=3D${GCC_VERSION} GCC_TC_FOLDER=3D${HOME}/toolcha=
ins/gcc bldgcc powerpc=0A    "${GCC_TC_FOLDER}"/${CROSS_COMPILE}gcc --versi=
on=0A=0A    # GCC without patch=0A    git reset -q --hard=0A    curl -LSs '=
https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/patch/?id=
=3Ded4289e8b48845888ee46377bd2b55884a55e60b' | git ap=0A    PATH=3D${GCC_TC=
_FOLDER}:${PATH} make -s -j$(nproc) O=3Dout distclean ppc44x_defconfig "${F=
ILE}"=0A    "${GCC_TC_FOLDER}"/${CROSS_COMPILE}objdump -dr out/"${FILE}" > =
"${TMP_DIR}"/gcc-${GCC_VERSION}-without-6c5875843b87-mem.o.txt=0A=0A    # G=
CC with Nick's patch=0A    git reset -q --hard=0A    curl -LSs https://raw.=
githubusercontent.com/ClangBuiltLinux/continuous-integration/ppc32/patches/=
llvm-all/linux/ppc32/0001-powerpc-fix-inline-asm-constraints-for-dcbz.patch=
 | git ap=0A    PATH=3D${GCC_TC_FOLDER}:${PATH} make -s -j$(nproc) O=3Dout =
distclean ppc44x_defconfig "${FILE}"=0A    "${GCC_TC_FOLDER}"/${CROSS_COMPI=
LE}objdump -dr out/"${FILE}" > "${TMP_DIR}"/gcc-${GCC_VERSION}-with-equal-Z=
-mem.o.txt=0A=0A    diff -uprN "${TMP_DIR}"/gcc-${GCC_VERSION}-without-6c58=
75843b87-mem.o.txt "${TMP_DIR}"/gcc-${GCC_VERSION}-with-equal-Z-mem.o.txt >=
 "${TMP_DIR}"/gcc-${GCC_VERSION}-mem.o.diff=0Adone=0A=0Aecho=0Aecho "Files =
are available at: ${TMP_DIR}"=0A
--mP3DRpeJDSE+ciuQ
Content-Type: application/gzip
Content-Disposition: attachment; filename="testing-output.tar.gz"
Content-Transfer-Encoding: base64

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

--mP3DRpeJDSE+ciuQ--
