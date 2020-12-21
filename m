Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDAE2DFA47
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 10:28:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CzvK01pCwzDqNr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 20:28:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TNketNi8; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzvHT4FXMzDqNd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 20:26:42 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id x1so424922pgh.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 01:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qMI1qb6jm5Lag9GLrKzNd8c/nLzIAunUnseb/Ze4wwk=;
 b=TNketNi86VoSW7yUCz1xJ0TySRbiCNnk6lgZVPNFHRq1Z0hYh2gKvfrjKM7LrvZdfw
 RQePP3CI0izt8okVH5i0MDqzLe17kJ+gYsfp1t+Ps8IwCEHGQkv7O3PSU8DKD3ZNNffG
 /JlM0O2eWxUHvRwz8qee/+LJwONqHO0lDu8V6J4W8M+AzN/jgGfMEfd8saM3jRp+ynNl
 yyNQ52YpnwxSo70pHdjSzvzY1s3U8IilByiBPR9JecD00QG9hEu5BbgRdRErCXzWs2gF
 45fFo4tr95q3qQ6Y+q0mxPqCFls3IDtt7iuwAPe+p0gTlRoSBsbkFCIhsAdHSkhvZ6+r
 94Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qMI1qb6jm5Lag9GLrKzNd8c/nLzIAunUnseb/Ze4wwk=;
 b=IqXD8KQ8w426exVoynNW478L+TQmWyezX9O2RP3/Qp0yt7x1VUOoDz1VbyLvNYFVLm
 YJzfaQ/pDPz+6K1nmNNh7KKL6NfMurBtUf1J05rJVsyAsZyD39qOiSFiFAz8QhDrgPRn
 UyDj+pSLMvcYIUCbLEDIPOOW7I5hGhPlHzfH5g6jBtf3fsHZEYV7zNMqbNxyFT7jqcqd
 2qIMfcgswiL7JTKFHZVe2aGCpbzdQvyOoMarqJnua3vGvE3Rj3eFrXTJY045BvFQgLiS
 fZ127FgjOEKv7IPgma/3mSrfwidR6JX5WMNTqLD237JMSsHLgxZVuOKDtPn/FBjyUKFn
 Z3CA==
X-Gm-Message-State: AOAM532EuxzkbmzRz8UuZKC+fUjQ9LvNE2dvksqfIAi8Ooi5/xwHqABM
 HLZ4mZ1RqFk/euubApfFS/ZhhK1LPm4GhODwam0=
X-Google-Smtp-Source: ABdhPJxBtvImbDXQFJZFiuLU9iSSxkb054vusc68KLoVKz7M+YJaEYxx6P2xuo8zwNE89O9MkgEk4eONGxpDIef9SqA=
X-Received: by 2002:a63:74b:: with SMTP id 72mr14619803pgh.4.1608542798518;
 Mon, 21 Dec 2020 01:26:38 -0800 (PST)
MIME-Version: 1.0
References: <20201218143122.19459-1-info@metux.net>
 <20201218143122.19459-2-info@metux.net>
 <CAHp75VfYz_K2BYOxqmSx0q+1F2F9Lp1eb70RrNYzJHs3FX+quQ@mail.gmail.com>
 <87ft3zyaqa.fsf@mpe.ellerman.id.au>
In-Reply-To: <87ft3zyaqa.fsf@mpe.ellerman.id.au>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 21 Dec 2020 11:27:27 +0200
Message-ID: <CAHp75VeGs-x0-XgpLS0uB2oZmxKZREfUKM1ByUwmRquqFc2FPg@mail.gmail.com>
Subject: Re: [PATCH 01/23] kernel: irq: irqdescs: warn on spurious IRQ
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Linux-SH <linux-sh@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mips@vger.kernel.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org,
 Will Deacon <will@kernel.org>, gerg@linux-m68k.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jiri Olsa <jolsa@redhat.com>, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 msalter@redhat.com, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
 jacquiot.aurelien@gmail.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 21, 2020 at 7:44 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> > On Fri, Dec 18, 2020 at 4:37 PM Enrico Weigelt, metux IT consult
> > <info@metux.net> wrote:
> >
> >> +               if (printk_ratelimit())
> >> +                       pr_warn("spurious IRQ: irq=%d hwirq=%d nr_irqs=%d\n",
> >> +                               irq, hwirq, nr_irqs);
> >
> > Perhaps you missed pr_warn_ratelimit() macro which is already in the
> > kernel for a long time.
>
> pr_warn_ratelimited() which calls printk_ratelimited().

I stand corrected.
Right, that's what I had in mind (actually didn't know that there are variants).

Thanks!

> And see the comment above printk_ratelimit():
>
> /*
>  * Please don't use printk_ratelimit(), because it shares ratelimiting state
>  * with all other unrelated printk_ratelimit() callsites.  Instead use
>  * printk_ratelimited() or plain old __ratelimit().
>  */


-- 
With Best Regards,
Andy Shevchenko
