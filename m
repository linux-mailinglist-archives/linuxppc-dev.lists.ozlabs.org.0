Return-Path: <linuxppc-dev+bounces-2623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C38139B22AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 03:23:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcHHh5Xt0z2xWS;
	Mon, 28 Oct 2024 13:23:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730082208;
	cv=none; b=YuB44OjVtU+MkLEfltRgCLhhXIo/J48av+MHjyI/mHU0j4S/h/Ls1qwzkGD6qmVbXeEvRjugcnSKf7DzLHqw4V7pFPTVG5537ZMYYbBr/qH58ctg6yLEg66Hzrxos+1XjF4r/H0utgoWz+mhyKSGOm1bDL0oagVIHtN/4vKVWNBwcM0r9CMgBnVc98riGIq0iy6IJT32MYHgJHjnE9nD13PmKxDlFAxhqv0QX5xIu9j7YFCZf9ZDYziRH06NaDDkN4hAPsXYOMFfZqePPCs8qpUNCU+l5npgTSuILxRw0dv4Y2ZskU7m4ygq6S0ydOzzHqSA2tT7I/b7aesZCjw/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730082208; c=relaxed/relaxed;
	bh=wVzoc2YabnIij5HP3bkYWkQB3e64c7slt7BMmOIG3vk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TBU331WEM1/kUyhdYEF3NBlHQrmPYyQ3uFpOqRio41ohRE6gR2dQg+V7Q76pR0cnPnsGbYtG0jJl21ASC54DAyZj/U5abvuUUz3lyxTkb1uczylYNoqFL/HvP5uzZrTwwYm/92l6/vy9wl7xeJCZltnqW2NwNFPNSQp29KwyXyYtGn7VnNdRzmjFbJ+MmIJElcCr3FYP5Lho4ev3MCPrwJN3rb040BavYsK6Of7nWeg0e/quNMsjZip8NCYu3DDMxJlLuVhkDsioqtXnKH4Qe9hd0FT/1j8iL7WQkcwhZYiY9T9lvCqhw7VT/n/bGEciv/qPNnlr+WKVHmeNJdbf/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OZIawUAV; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OZIawUAV;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcHHg3PNZz2xRm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 13:23:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730082202;
	bh=wVzoc2YabnIij5HP3bkYWkQB3e64c7slt7BMmOIG3vk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OZIawUAVvihaiXSwIbUZzcTz/tSg3C1U5LEaVYgOz4QoVISgtL6WviXd3+smevP7j
	 R/hVpxpqQA2czH0OgbOsdZ/XN9oOlY7sbOzvWwnvGYYyYJsAuLhD8D2cGXk3zQ3Qcf
	 Xlmo8LCM81g3VdyYneWeZi52VsFp2ozQKki9ZSVwqAf7xk8cYqaSwqlX4Mipqjed6a
	 eYbw3SKM3H8Y7R3CxIjshRL1I3sLTmewm9KYFwOuMGXWKXrkByPLjplT3Ne2Vy4WLv
	 oS3+EntGWYqofeVy/dSgM+jb9ZxRrfbS0RYyedkF7axBWtyZppZ+q42fJGbmWcXti8
	 0jDbtveRkr5HQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcHHX4W29z4x89;
	Mon, 28 Oct 2024 13:23:20 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: "Naveen N. Rao" <naveen@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro
 Yamada <masahiroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Alexei
 Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Vishal Chourasia
 <vishalc@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Subject: Re: [PATCH v6 17/17] powerpc64/bpf: Add support for bpf trampolines
In-Reply-To: <20241018173632.277333-18-hbathini@linux.ibm.com>
References: <20241018173632.277333-1-hbathini@linux.ibm.com>
 <20241018173632.277333-18-hbathini@linux.ibm.com>
Date: Mon, 28 Oct 2024 13:23:13 +1100
Message-ID: <87wmhtrmni.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hari Bathini <hbathini@linux.ibm.com> writes:
> From: Naveen N Rao <naveen@kernel.org>
>
> Add support for bpf_arch_text_poke() and arch_prepare_bpf_trampoline()
> for 64-bit powerpc. While the code is generic, BPF trampolines are only
> enabled on 64-bit powerpc. 32-bit powerpc will need testing and some
> updates.

Hi Hari,

This is breaking the PCREL build for me:

  ERROR: 11:49:18: Failed building ppc64le_defconfig+pcrel@fedora
  INFO: 11:49:18: (skipped 41 lines) ...
  INFO: 11:49:18: /linux/arch/powerpc/net/bpf_jit.h:90:9: note: in expansion of macro 'EMIT'
     90 |         EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)))
        |         ^~~~
  /linux/arch/powerpc/include/asm/ppc-opcode.h:473:88: note: in expansion of macro 'IMM_DS'
    473 | #define PPC_RAW_LD(r, base, i)          (0xe8000000 | ___PPC_RT(r) | ___PPC_RA(base) | IMM_DS(i))
        |                                                                                        ^~~~~~
  /linux/arch/powerpc/net/bpf_jit.h:90:14: note: in expansion of macro 'PPC_RAW_LD'
     90 |         EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)))
        |              ^~~~~~~~~~
  /linux/arch/powerpc/net/bpf_jit.h:90:36: note: in expansion of macro 'offsetof'
     90 |         EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)))
        |                                    ^~~~~~~~
  /linux/arch/powerpc/net/bpf_jit_comp.c:791:17: note: in expansion of macro 'PPC64_LOAD_PACA'
    791 |                 PPC64_LOAD_PACA();
        |                 ^~~~~~~~~~~~~~~
  /linux/arch/powerpc/net/bpf_jit.h:90:65: error: 'struct paca_struct' has no member named 'kernel_toc'; did you mean 'kernel_msr'?
     90 |         EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)))
        |                                                                 ^~~~~~~~~~
  /linux/arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
     29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
        |                                  ^~~~~
  /linux/arch/powerpc/net/bpf_jit.h:90:9: note: in expansion of macro 'EMIT'
     90 |         EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)))
        |         ^~~~
  /linux/arch/powerpc/include/asm/ppc-opcode.h:473:88: note: in expansion of macro 'IMM_DS'
    473 | #define PPC_RAW_LD(r, base, i)          (0xe8000000 | ___PPC_RT(r) | ___PPC_RA(base) | IMM_DS(i))
        |                                                                                        ^~~~~~
  /linux/arch/powerpc/net/bpf_jit.h:90:14: note: in expansion of macro 'PPC_RAW_LD'
     90 |         EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)))
        |              ^~~~~~~~~~
  /linux/arch/powerpc/net/bpf_jit.h:90:36: note: in expansion of macro 'offsetof'
     90 |         EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)))
        |                                    ^~~~~~~~
  /linux/arch/powerpc/net/bpf_jit_comp.c:882:25: note: in expansion of macro 'PPC64_LOAD_PACA'
    882 |                         PPC64_LOAD_PACA();
        |                         ^~~~~~~~~~~~~~~
  make[5]: *** [/linux/scripts/Makefile.build:229: arch/powerpc/net/bpf_jit_comp.o] Error 1


To test it you need to enable CONFIG_POWER10_CPU, eg:

  CONFIG_POWERPC64_CPU=n
  CONFIG_POWER10_CPU=y
  CONFIG_PPC_KERNEL_PCREL=y

This diff gets it building, but I haven't tested it actually works:

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 2d04ce5a23da..af6ff3eb621a 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -86,9 +86,14 @@
                                                        0xffff));             \
                } } while (0)
 #define PPC_LI_ADDR    PPC_LI64
+
+#ifndef CONFIG_PPC_KERNEL_PCREL
 #define PPC64_LOAD_PACA()                                                    \
        EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)))
 #else
+#define PPC64_LOAD_PACA() do {} while (0)
+#endif
+#else
 #define PPC_LI64(d, i) BUILD_BUG()
 #define PPC_LI_ADDR    PPC_LI32
 #define PPC64_LOAD_PACA() BUILD_BUG()

cheers

