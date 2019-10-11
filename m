Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CE8D3A57
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 09:51:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qKs81SVXzDqZX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 18:51:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qKpv5TntzDqZC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 18:49:25 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id c10so7186110otd.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 00:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cXN+zRgmCQohqXmd61dtsclsBrxaUdjkWuLDpZ7x1eg=;
 b=fgxgnmJrzM/41tyVIexGP2bQh9YyAbWVqGkk0jT7sDYunCYMiTt7U3fnEX+T0Y7ltk
 6/YmSpGu4YpDGDNepjkkGXFOFD1FxKLprZqZmRWW77R6AUWDEr/8M8pFyCC7LxFiCdHR
 xDSShuDltTEWfNr1XGIIEP42uzKzsZBbTS9gSFl+5svWxYLn2HkYHatfUXmYcrb9HMjz
 wXQAl/5Own6CQZ42Kz4QUkJyxsIdooxz41o2WKGrHtbXwVYE7jfgLffI7Pf+TIjE27zO
 v1cIGCoteimXtCiygBBDCt67rDZvxiutCYyJUyNiLCp4aBGIWoLkFKfb15d0PrZbHgGi
 Y2bQ==
X-Gm-Message-State: APjAAAVfDNMffkF1aXgh4zNxdSehXwsOK9Mi5s5plKznxvB2KLuZyYdY
 bOmpkdGiWkcIGPl/38on1+yLup+3622KkNQNR4k=
X-Google-Smtp-Source: APXvYqwqVxfC2cNUYKhwcqXPFeJg2d1bFBSsmVLGAXW7oEd6d1E5TBDxF8h/vtJ2zwm35tbMgZpLEGXynIDHXf1hv80=
X-Received: by 2002:a05:6830:1544:: with SMTP id
 l4mr3638195otp.297.1570780163122; 
 Fri, 11 Oct 2019 00:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-14-keescook@chromium.org>
In-Reply-To: <20191011000609.29728-14-keescook@chromium.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Oct 2019 09:49:12 +0200
Message-ID: <CAMuHMdXiSboG2xum0ZgjpwBxEaP-owywvPpmUubr1nuqzDPJ4Q@mail.gmail.com>
Subject: Re: [PATCH v2 13/29] vmlinux.lds.h: Replace RW_DATA_SECTION with
 RW_DATA
To: Kees Cook <keescook@chromium.org>
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Michal Simek <monstr@monstr.eu>,
 the arch/x86 maintainers <x86@kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org, Arnd Bergmann <arnd@arndb.de>,
 linux-xtensa@linux-xtensa.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Borislav Petkov <bp@alien8.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 11, 2019 at 2:07 AM Kees Cook <keescook@chromium.org> wrote:
> Rename RW_DATA_SECTION to RW_DATA. (Calling this a "section" is a lie,
> since it's multiple sections and section flags cannot be applied to
> the macro.)
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

>  arch/m68k/kernel/vmlinux-nommu.lds   | 2 +-
>  arch/m68k/kernel/vmlinux-std.lds     | 2 +-
>  arch/m68k/kernel/vmlinux-sun3.lds    | 2 +-

For m68k:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
