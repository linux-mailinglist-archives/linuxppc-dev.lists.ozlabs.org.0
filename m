Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2AFF7960
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 18:00:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BcZc2m7RzF0wQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 04:00:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.195;
 helo=mail-oi1-f195.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BcWw6HdqzDrCt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 03:58:20 +1100 (AEDT)
Received: by mail-oi1-f195.google.com with SMTP id y194so12111655oie.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 08:58:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N5Vcj3yE2rkXP4doP0O2V7gRihUnv+nSjX4pf/13Rw8=;
 b=kBI2jjsGqw0oV0o79Xg1N3I+nRrIk3Lz5tVbN4/Jy2V6KnxKn3wXoNIqpQbs7h5K8k
 HtHUSKzutwujLD2sxtRwbybixy4xJefdcE8Ea+TBIg38Lwh3bRJuHgFOQ/UAamYT0Atz
 X1/B9OO1wj1oiPgW7N0ZdINy+MZwFtZ5mGcmX2rxfgzTiGhyx0lVOB80JW2MMOcdI6FH
 dGknh0knpjBGz5e7LZp9osbmCnAXNiPpBpWdK2fmPqYMvX6Qo+CAcsWtThqzDnOpBb5P
 3+Z0WBmba5QYWAvCrLDVP8bKBOV3wYoc29UZVmEmV4RJIBdEL29WZsg24NpHXrIsK6Fx
 A/3w==
X-Gm-Message-State: APjAAAWXFi+nIoVOnBpM5SZKc2iNXluRj/BBw+VCVtufeE6regAQoUxo
 B8HYjwZ+oPrCsyvcM32/1idIPcNCSf3UTmJ5Uhg=
X-Google-Smtp-Source: APXvYqy/vMjYcYeqIvTqdLd5GGnLez7ZmWGDKl5AqUc+6PF8GisVTiuTjJisyx2dw7CZpTj+GRrxuJBIdtOSyrbYjfw=
X-Received: by 2002:aca:fc92:: with SMTP id
 a140mr23499698oii.153.1573491497306; 
 Mon, 11 Nov 2019 08:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-12-keescook@chromium.org>
In-Reply-To: <20191011000609.29728-12-keescook@chromium.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Nov 2019 17:58:06 +0100
Message-ID: <CAMuHMdXfPyti1wFBb0hhf3CeDSQ=zVv7cV-taeYCmDswMQkXPQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/29] vmlinux.lds.h: Replace RODATA with RO_DATA
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

Hi Kees,

On Fri, Oct 11, 2019 at 2:07 AM Kees Cook <keescook@chromium.org> wrote:
> There's no reason to keep the RODATA macro: replace the callers with
> the expected RO_DATA macro.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  arch/alpha/kernel/vmlinux.lds.S      | 2 +-
>  arch/ia64/kernel/vmlinux.lds.S       | 2 +-
>  arch/microblaze/kernel/vmlinux.lds.S | 2 +-
>  arch/mips/kernel/vmlinux.lds.S       | 2 +-
>  arch/um/include/asm/common.lds.S     | 2 +-
>  arch/xtensa/kernel/vmlinux.lds.S     | 2 +-
>  include/asm-generic/vmlinux.lds.h    | 4 +---
>  7 files changed, 7 insertions(+), 9 deletions(-)

Somehow you missed:

    arch/m68k/kernel/vmlinux-std.lds:  RODATA
    arch/m68k/kernel/vmlinux-sun3.lds:      RODATA

Leading to build failures in next-20191111:

    /opt/cross/kisskb/gcc-4.6.3-nolibc/m68k-linux/bin/m68k-linux-ld:./arch/m68k/kernel/vmlinux.lds:29:
syntax error
    make[1]: *** [/kisskb/src/Makefile:1075: vmlinux] Error 1

Reported-by: noreply@ellerman.id.au
http://kisskb.ellerman.id.au/kisskb/buildresult/14022846/

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
