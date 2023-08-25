Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00904787FAC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 08:16:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iXSFfKON;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RX8qM48Mmz3dLK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 16:16:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iXSFfKON;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RX8jr6mPNz3cF2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 16:12:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692943919;
	bh=Cc2wNrVySgQWB1oZUr5oEwkwqvGvweIc8X/OBtG4+Wg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iXSFfKONhaS61Wio3k/V1b70XjLLTQdt8vrEOUswdKDp7oPYD+2VsdrF14uK01p64
	 XXlT9K+fMxudJ8FOKNRLR6XGVcf35t4ZKkoKMI8rzvIHhKUlVXdEuAhvNneqf/3BKB
	 zxIP+l0zO05GipBAPeUhsSs3ZPmmChBaE4wXoIVUixOzyK7TIexFrSpeC7Sl9v0kGz
	 q8BWc/9IsPu+6fJocKU/6khYcBr1rEVzf06tM/e4KaUSImp+IRv5bY+pH9J7IsQG/j
	 dkA4oO/aRIG2l8rjLjajtdwh4qjdqeh8OAtvDnuqzZ5Yrqcq5mhGzx+uYqjvY3iwzJ
	 sDFScRxVAy46g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RX8jp5yZWz4wxR;
	Fri, 25 Aug 2023 16:11:58 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: Show Kconfig fragments in "help"
In-Reply-To: <20230824223606.never.762-kees@kernel.org>
References: <20230824223606.never.762-kees@kernel.org>
Date: Fri, 25 Aug 2023 16:11:58 +1000
Message-ID: <87a5ufvefl.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-s390@vger.kernel.org, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kees Cook <keescook@chromium.org> writes:
> Doing a "make help" would show only hard-coded Kconfig targets and
> depended on the archhelp target to include ".config" targets. There was
> nothing showing global kernel/configs/ targets. Solve this by walking
> the wildcard list and include them in the output, using the first comment
> line as the help text.
>
> Update all Kconfig fragments to include help text and adjust archhelp
> targets to avoid redundancy.
>
> Adds the following section to "help" target output:
>
> Configuration fragment targets (for enabling various Kconfig items):
>   debug.config         - Debugging for CI systems and finding regressions
>   kvm_guest.config     - Bootable as a KVM guest
>   nopm.config          - Disable Power Management
>   rust.config          - Enable Rust
>   tiny-base.config     - Minimal options for tiny systems
>   tiny.config          - Smallest possible kernel image
>   x86_debug.config     - Debugging options for tip tree testing
>   xen.config           - Bootable as a Xen guest
>   tiny.config          - x86-specific options for a small kernel image
>   xen.config           - x86-specific options for a Xen virtualization guest

I think we need a way to opt some files out.

It's a bit ugly on powerpc because there are so many fragments:

Configuration fragment targets (for enabling various Kconfig items):
  debug.config         - Debugging for CI systems and finding regressions
  kvm_guest.config     - Bootable as a KVM guest
  nopm.config          - Disable Power Management
  rust.config          - Enable Rust
  tiny-base.config     - Minimal options for tiny systems
  tiny.config          - Smallest possible kernel image
  x86_debug.config     - Debugging options for tip tree testing
  xen.config           - Bootable as a Xen guest
  32-bit.config        - Build a 32-bit image
  64-bit.config        - Build a 64-bit image
  85xx-32bit.config    - Build a 32-bit 85xx image
  85xx-64bit.config    - Build a 64-bit 85xx image
  85xx-hw.config       - Base hardware support for 86xx
  85xx-smp.config      - Enable SMP on 85xx
  86xx-hw.config       - Base hardware support for 86xx
  86xx-smp.config      - Enable SMP on 86xx
  altivec.config       - Enable Altivec support
  be.config            - Enable Big Endian mode
  book3s_32.config     - Base support for Book3s
  corenet_base.config  - Base support for corenet
  debug.config         - Enable PowerPC specific debug options
  disable-werror.config - Disable -Werror
  dpaa.config          - Base suppot for DPPA
  fsl-emb-nonhw.config - Non-hardware options common to 85xx and corenet
  guest.config         - PowerPC specific virtualization guest options
  kvm_guest.config     - Bootable as a KVM guest
  le.config            - Enable Little Endian mode
  mpc85xx_base.config  - Base mpc85xxx support
  mpc86xx_base.config  - Base mpc85xxx support
  ppc64le.config       - Enable ppc64le mode
  security.config      - Common security options for PowerPC builds

And some of those are not intended for use with "make foo.config",
they're used internally for generating our "normal" defconfigs and they
don't necessarily work on their own.

Also I'd like to add more fragments in future, to the point where nearly
all our configs are generated by them.

Can we have some way to differentiate fragments that are intended to be
used with "make foo.config" vs just being used internally to generate
other configs.

The obvious thing would be to use a different suffix, eg. "foo.fragment"
for internal use fragments. That would require changing
merge_into_defconfig and merge_into_defconfig_override to not assume the
.config suffix, and update the users in arm, arm64 and powerpc.

The other option would be to ignore .config files starting with eg. "_".

+       @$(foreach c, $(filter-out $(call configfiles,_*.config),$(call configfiles,*.config)), \
+               printf "  %-20s - %s\\n" \
+                       $(shell basename $(c)) \
+                       "$(subst # ,,$(shell grep -m1 '^# ' $(c)))";)

Not sure which is preferable.

cheers
