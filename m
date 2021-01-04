Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB972E9F1C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 21:58:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8nyw0p7MzDqPb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 07:58:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d29;
 helo=mail-io1-xd29.google.com; envelope-from=sedat.dilek@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HpvjmJGA; dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8nvt0khYzDqRd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 07:55:34 +1100 (AEDT)
Received: by mail-io1-xd29.google.com with SMTP id y5so26290955iow.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Jan 2021 12:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=LJZDZGduu6iANLcIXL/xcpeuMsOJEmvZp5eNkLssDnk=;
 b=HpvjmJGAbbbjlmCixc58dtpp8SNX8qEfhTnwTZWxulFdrU356kfpSdwfPuZbwKYS0E
 TlRyUV4Q34uyD7yBtcZcwWUcmz9Pn78hqSmC2jVUnzjJ71gaDuGmTQGxmAySlXM5FzLJ
 d4LnjMBnebjveWaN29ZBor+0zljSjWKqaaOJIBdECVy5fhCHICUXO3DzIGR2m5AnxR1S
 0GJNkROOsHMGxhLdVjdSne3M7WTrefpu7EukDu0z2kVL7ksbD9lzpjd0nVvkiWXVZzfc
 hrW63sRi85wNYkxY7Rss4m2RPXhwwboNZx4fhMILoWO7A3vAAo7L+7ShA1VmyY73PcQR
 Pnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=LJZDZGduu6iANLcIXL/xcpeuMsOJEmvZp5eNkLssDnk=;
 b=uAHmNe8mNfs4YTeywyFw6JMj47Aj3TXYaOx34CxFl/R2gtvmattObIYexre4vGCnlp
 rJoMgL2BzS3uRkB/EUnbhFHK5Ie7AugQJaOKT1iZujWz20EgFuM8ohFnTK/RLrvrnerD
 D9m9RuYufC9MmO4sjQ2VU/5mo+AvNG7/MdP9w2siXRFFAQVP65CC96LO0lrgAq3xmILs
 FATVfa4Ku0wec95HLBcnF1ewox4tn7+nay2KaKvU2wny0XDoJdEA3U75xmOZLw16pLd3
 V/Y3uka/9/C4OreMr9+mg50PvwGb3rfvVsuCkH/NP+2RnnNmWIl6DthNN+c745ni3aHF
 hXZA==
X-Gm-Message-State: AOAM53276p3Gf5mNxI+fUN7sjOn87BSKv6K+ZEorDmt4CtAAUHsmy5Rt
 4hJuQfcPd6qpXSlIk+E+g5iHCMNvbJUCbu7Wjr4=
X-Google-Smtp-Source: ABdhPJzvhpXZ+mTh/umgp6WkZP62Ntun32b6redNm/1pnVmAWhULh8ucL85Bt6DEgUPmU3XQAf+D0zsIb/9O3Rubxgc=
X-Received: by 2002:a6b:92c4:: with SMTP id u187mr59442416iod.57.1609793731531; 
 Mon, 04 Jan 2021 12:55:31 -0800 (PST)
MIME-Version: 1.0
References: <20210104204850.990966-1-natechancellor@gmail.com>
In-Reply-To: <20210104204850.990966-1-natechancellor@gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 4 Jan 2021 21:55:20 +0100
Message-ID: <CA+icZUVe4AJoLWMqS3MEx700jcwDaJhw78tUgg8iD0dJvEmmYg@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Handle .text.{hot,unlikely}.* in linker script
To: Nathan Chancellor <natechancellor@gmail.com>
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
Reply-To: sedat.dilek@gmail.com
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 4, 2021 at 9:49 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Commit eff8728fe698 ("vmlinux.lds.h: Add PGO and AutoFDO input
> sections") added ".text.unlikely.*" and ".text.hot.*" due to an LLVM
> change [1].
>
> After another LLVM change [2], these sections are seen in some PowerPC
> builds, where there is a orphan section warning then build failure:
>

Looks like you forgot to add your references/links to [1] and [2].

Might be good to mention...?

With CONFIG_LD_ORPHAN_WARN=y is enabled

- Sedat

> $ make -skj"$(nproc)" \
>        ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- LLVM=1 O=out \
>        distclean powernv_defconfig zImage.epapr
> ld.lld: warning: kernel/built-in.a(panic.o):(.text.unlikely.) is being placed in '.text.unlikely.'
> ...
> ld.lld: warning: address (0xc000000000009314) of section .text is not a multiple of alignment (256)
> ...
> ERROR: start_text address is c000000000009400, should be c000000000008000
> ERROR: try to enable LD_HEAD_STUB_CATCH config option
> ERROR: see comments in arch/powerpc/tools/head_check.sh
> ...
>
> Explicitly handle these sections like in the main linker script so
> there is no more build failure.
>
> Cc: stable@vger.kernel.org
> Fixes: 83a092cf95f2 ("powerpc: Link warning for orphan sections")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1218
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  arch/powerpc/kernel/vmlinux.lds.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index 0318ba436f34..8e0b1298bf19 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -85,7 +85,7 @@ SECTIONS
>                 ALIGN_FUNCTION();
>  #endif
>                 /* careful! __ftr_alt_* sections need to be close to .text */
> -               *(.text.hot TEXT_MAIN .text.fixup .text.unlikely .fixup __ftr_alt_* .ref.text);
> +               *(.text.hot .text.hot.* TEXT_MAIN .text.fixup .text.unlikely .text.unlikely.* .fixup __ftr_alt_* .ref.text);
>  #ifdef CONFIG_PPC64
>                 *(.tramp.ftrace.text);
>  #endif
>
> base-commit: d8a4f20584d5906093a8fc6aa06622102a501095
> --
> 2.30.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210104204850.990966-1-natechancellor%40gmail.com.
