Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9585593486
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 20:10:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M62QC664Jz3c16
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 04:10:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=2a02:1800:120:4::f00:11; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [IPv6:2a02:1800:120:4::f00:11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M62Pn0hLMz3062
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 04:10:17 +1000 (AEST)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4M62PY5HWYz4x5Tk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 20:10:09 +0200 (CEST)
Received: from ramsan.of.borg ([84.195.186.194])
	by albert.telenet-ops.be with bizsmtp
	id 7uA42800C4C55Sk06uA4oE; Mon, 15 Aug 2022 20:10:09 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oNeXL-001DJO-RF; Mon, 15 Aug 2022 20:10:03 +0200
Date: Mon, 15 Aug 2022 20:10:03 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To: linux-kernel@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.0-rc1
In-Reply-To: <20220815180438.2875559-1-geert@linux-m68k.org>
Message-ID: <alpine.DEB.2.22.394.2208152006320.289321@ramsan.of.borg>
References: <CAHk-=wgRFjPHV-Y_eKP9wQMLFDgG+dEUHiv5wC17OQHsG5z7BA@mail.gmail.com> <20220815180438.2875559-1-geert@linux-m68k.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, netdev@vger.kernel.org, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 15 Aug 2022, Geert Uytterhoeven wrote:
> Below is the list of build error/warning regressions/improvements in
> v6.0-rc1[1] compared to v5.19[2].
>
> Summarized:
>  - build errors: +26/-15

   + /kisskb/src/arch/parisc/kernel/vdso32/restart_syscall.S: Error: .cfi_endproc without corresponding .cfi_startproc:  => 32
   + /kisskb/src/arch/parisc/kernel/vdso32/restart_syscall.S: Error: bad or irreducible absolute expression:  => 16
   + /kisskb/src/arch/parisc/kernel/vdso32/restart_syscall.S: Error: junk at end of line, first unrecognized character is `:':  => 16
   + /kisskb/src/arch/parisc/kernel/vdso32/restart_syscall.S: Error: no such instruction: `be 0x100(%sr2,%r0)':  => 29
   + /kisskb/src/arch/parisc/kernel/vdso32/restart_syscall.S: Error: no such instruction: `ldi 0,%r20':  => 30
   + /kisskb/src/arch/parisc/kernel/vdso32/restart_syscall.S: Error: no such instruction: `ldw 0(%sp),%r31':  => 26
   + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: no such instruction: `ble 0x100(%sr2,%r0)':  => 51, 46
   + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: no such instruction: `ldi 0,%r25':  => 44
   + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: no such instruction: `ldi 1,%r25':  => 49
   + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: no such instruction: `ldi 173,%r20':  => 50, 45
   + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: unknown pseudo-op: `.callinfo':  => 40
   + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: unknown pseudo-op: `.entry':  => 41
   + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: unknown pseudo-op: `.exit':  => 54
   + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: unknown pseudo-op: `.proc':  => 39
   + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: unknown pseudo-op: `.procend':  => 55
   + /kisskb/src/arch/parisc/kernel/vdso32/sigtramp.S: Error: unknown pseudo-op: `.stringz':  => 76

parisc64-gcc11/generic-64bit_defconfig
parisc-gcc11/generic-32bit_defconfig
parisc-gcc11/parisc-{allmod,allno,def}config

   + /kisskb/src/arch/sh/include/asm/io.h: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]:  => 239:34

sh4-gcc11/sh-allmodconfig (drivers/staging/octeon/ethernet-mem.c)

   + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c: error: the frame size of 2096 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 6806:1
   + /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c: error: the frame size of 2160 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]:  => 3778:1

x86_64-gcc8/x86-allmodconfig

   + /kisskb/src/include/linux/bitfield.h: error: call to '__field_overflow' declared with attribute error: value doesn't fit into mask:  => 151:3

mipsel-gcc5/mips-allmodconfig (net/mac80211/tx.c)

   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_603' declared with attribute error: FIELD_GET: mask is not constant:  => 354:38

arm64-gcc5/arm64-allmodconfig (arch/arm64/kvm/arm.c)

   + /kisskb/src/include/linux/random.h: error: 'latent_entropy' undeclared (first use in this function):  => 25:39

powerpc-gcc5/powerpc-all{mod,yes}config
powerpc-gcc5/ppc32_allmodconfig
powerpc-gcc5/ppc64_book3e_allmodconfig
powerpc-gcc5/ppc64le_allmodconfig

   + /kisskb/src/include/linux/random.h: error: 'latent_entropy' undeclared (first use in this function); did you mean 'add_latent_entropy'?:  => 25:46

powerpc-gcc11/powerpc-all{mod,yes}config
powerpc-gcc11/ppc64_book3e_allmodconfig

   + {standard input}: Error: displacement to undefined symbol .L377 overflows 12-bit field:  => 2286
   + {standard input}: Error: displacement to undefined symbol .L378 overflows 8-bit field :  => 2302
   + {standard input}: Error: displacement to undefined symbol .L382 overflows 8-bit field :  => 2213

sh4-gcc11/sh-allmodconfig (seen before, root cause is internal compiler error)

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/568035b01cfb107af8d2e4bd2fb9aea22cf5b868/ (all 135 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/3d7cb6b04c3f3115719235cc6866b10326de34cd/ (all 135 configs)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
