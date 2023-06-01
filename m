Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6347C71F644
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 00:50:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXLvP0Bw5z3dwk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 08:50:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K25ToaEb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K25ToaEb;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXLtY2sjCz2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 08:49:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3CDF064AB6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 22:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B69C433D2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 22:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685659793;
	bh=s5scddDgq8SCu6I0UWPQExKWJjas9UFzehdQi3Sw4tA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K25ToaEbCp02bMG+wiJikwHyiXiwwQBkm/MmN8qlrLj5yam240H0kFAxxnFa3RlG8
	 bu4BSS/frooyZ20B2VklohnrYULCfishpBQ/wfdUaMkt+oR8gS4E1+AjfNshKja3vS
	 Rv+moH0Y5isDfBQyF8Rj722+0entBKGogJrcfr++cvzRmW73HdsIB35hoxtRn829Ae
	 fyn3i/1QAGvtS1oiJarw65vHM76zJn0jBvddq9Vcz7E6Icr7CQW2U08iG1Oryzm6d3
	 58DCK+DxQNJ2Qn/JWEej+n8GVZwut1/xKU3k6dkfSYsQUQ9uCCopruEXev0WWNFxor
	 G4HpcCwxRlB1w==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f4e71a09a7so1905707e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 15:49:52 -0700 (PDT)
X-Gm-Message-State: AC+VfDwMfF4/3pBhPBkxwFPxfA34txCuzJV7mu3esFEXA3sx8Y3yEUbr
	xrmyUkjTNXwSz3wtNwrRGZtym3bIEedkdq1Qq4o=
X-Google-Smtp-Source: ACHHUZ4uA6ym60CkoL3kD4Xme876wGBHsdD1XRoswJZBV/GnrkgRlI3npJzU+tR131QuPJoGC+7UxG4nzuqJElDeBo4=
X-Received: by 2002:ac2:4a8b:0:b0:4f3:aa81:2a6e with SMTP id
 l11-20020ac24a8b000000b004f3aa812a6emr364328lfp.19.1685659791105; Thu, 01 Jun
 2023 15:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <20230601101257.530867-13-rppt@kernel.org>
In-Reply-To: <20230601101257.530867-13-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 1 Jun 2023 15:49:39 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4Q2d7=7yBMQLgz+7Bz_q==_F+N3C8O4LStXva73ECCTg@mail.gmail.com>
Message-ID: <CAPhsuW4Q2d7=7yBMQLgz+7Bz_q==_F+N3C8O4LStXva73ECCTg@mail.gmail.com>
Subject: Re: [PATCH 12/13] x86/jitalloc: prepare to allocate exectuatble
 memory as ROX
To: Mike Rapoport <rppt@kernel.org>
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <d
 avem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 1, 2023 at 3:15=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> From: Song Liu <song@kernel.org>
>
> Replace direct memory writes to memory allocated for code with text pokin=
g
> to allow allocation of executable memory as ROX.
>
> The only exception is arch_prepare_bpf_trampoline() that cannot jit
> directly into module memory yet, so it uses set_memory calls to
> unprotect the memory before writing to it and to protect memory in the
> end.
>
> Signed-off-by: Song Liu <song@kernel.org>
> Co-developed-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  arch/x86/kernel/alternative.c | 43 +++++++++++++++++++++++------------
>  arch/x86/kernel/ftrace.c      | 41 +++++++++++++++++++++------------
>  arch/x86/kernel/module.c      | 24 +++++--------------
>  arch/x86/kernel/static_call.c | 10 ++++----
>  arch/x86/kernel/unwind_orc.c  | 13 +++++++----
>  arch/x86/net/bpf_jit_comp.c   | 22 +++++++++++++-----

We need the following in this patch (or before this patch).
Otherwise, the system will crash at the VIRTUAL_BUG_ON()
in vmalloc_to_page().

Thanks,
Song

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index bf954d2721c1..4efa8a795ebc 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -1084,7 +1084,7 @@ bpf_jit_binary_pack_alloc(unsigned int proglen,
u8 **image_ptr,
                return NULL;
        }

-       *rw_header =3D kvmalloc(size, GFP_KERNEL);
+       *rw_header =3D kvzalloc(size, GFP_KERNEL);
        if (!*rw_header) {
                bpf_arch_text_copy(&ro_header->size, &size, sizeof(size));
                bpf_prog_pack_free(ro_header);
@@ -1092,8 +1092,6 @@ bpf_jit_binary_pack_alloc(unsigned int proglen,
u8 **image_ptr,
                return NULL;
        }

-       /* Fill space with illegal/arch-dep instructions. */
-       bpf_fill_ill_insns(*rw_header, size);
        (*rw_header)->size =3D size;

        hole =3D min_t(unsigned int, size - (proglen + sizeof(*ro_header)),
