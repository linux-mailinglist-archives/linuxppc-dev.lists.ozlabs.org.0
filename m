Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC7F2249BA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 09:52:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B80Zz6tg9zDrQK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 17:52:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.194;
 helo=mail-oi1-f194.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B80Y630CRzDrNH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 17:51:04 +1000 (AEST)
Received: by mail-oi1-f194.google.com with SMTP id k4so10025133oik.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 00:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KEEvd4u3UvGoBQRrd8r0flfbXnRfcEtkikuqiW2DLRE=;
 b=qWBfIADj/4J0fgeJA2e53W6yOqt9VilN2I1Ct7wnomlpEYyhHtTBHQ11Q5SBwjVGb5
 hKEa/n5tCEcK0iAoxSPYAiCQxVGo3BrTvbK0SGeWnTvWKmF2711mRZhbK4HdwlQixzV8
 Op/S1XF+PQWsyTgOKqODYHu25CTfrEuvGT8YRXSPJzsmraML3UvKLzb2lm09itb/r+EM
 vP3a6jfjFsv0EMVoBCcVFNHfGPZGSGnmL2+Q84K8Prfnj1AN3haiUh+8V+rHlrf+jbUC
 lW5Zh0+YfIwkgZMTSs9V2nMsel7ElHdByuASV3+iwt7+rE7ZNB2+IW5drgSJl/umPGtY
 vNRg==
X-Gm-Message-State: AOAM531Kz04rXO5KSX+CcOo8GtllVPNSrr5oaDPQSge80TGT3+6bHIYe
 4k507Iobddw8guR2+De2BWvF4p4kYu5z5K3AKM4=
X-Google-Smtp-Source: ABdhPJxokjFbAWf+q0y5gqswRgTgqjSY2nJ72G0Xlm5f/Wi/zUxXQcPf5Sb1C4Z8wFeq+35XMwAnzo2pM2Pox1D/rpY=
X-Received: by 2002:a05:6808:64a:: with SMTP id
 z10mr10530650oih.54.1595058661714; 
 Sat, 18 Jul 2020 00:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200624035920.835571-1-natechancellor@gmail.com>
In-Reply-To: <20200624035920.835571-1-natechancellor@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 18 Jul 2020 09:50:50 +0200
Message-ID: <CAMuHMdU_KfQ-RT_nev5LgN=Vj_P97Fn=nwRoC6ZREFLa3Ysj7w@mail.gmail.com>
Subject: Re: [PATCH] powerpc/boot: Use address-of operator on section symbols
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
Cc: Arnd Bergmann <arnd@arndb.de>, Geoff Levand <geoff@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nathan,

On Wed, Jun 24, 2020 at 6:02 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> arch/powerpc/boot/main.c:107:18: warning: array comparison always
> evaluates to a constant [-Wtautological-compare]
>         if (_initrd_end > _initrd_start) {
>                         ^
> arch/powerpc/boot/main.c:155:20: warning: array comparison always
> evaluates to a constant [-Wtautological-compare]
>         if (_esm_blob_end <= _esm_blob_start)
>                           ^
> 2 warnings generated.
>
> These are not true arrays, they are linker defined symbols, which are
> just addresses.  Using the address of operator silences the warning
> and does not change the resulting assembly with either clang/ld.lld
> or gcc/ld (tested with diff + objdump -Dr).
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/212
> Reported-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  arch/powerpc/boot/main.c | 4 ++--
>  arch/powerpc/boot/ps3.c  | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/boot/main.c b/arch/powerpc/boot/main.c
> index a9d209135975..cae31a6e8f02 100644
> --- a/arch/powerpc/boot/main.c
> +++ b/arch/powerpc/boot/main.c
> @@ -104,7 +104,7 @@ static struct addr_range prep_initrd(struct addr_range vmlinux, void *chosen,
>  {
>         /* If we have an image attached to us, it overrides anything
>          * supplied by the loader. */
> -       if (_initrd_end > _initrd_start) {
> +       if (&_initrd_end > &_initrd_start) {
>

Are you sure that fix is correct?

    extern char _initrd_start[];
    extern char _initrd_end[];
    extern char _esm_blob_start[];
    extern char _esm_blob_end[];

Of course the result of their comparison is a constant, as the addresses
are constant.  If clangs warns about it, perhaps that warning should be moved
to W=1?

But adding "&" is not correct, according to C.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
