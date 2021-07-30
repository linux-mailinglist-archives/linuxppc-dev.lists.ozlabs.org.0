Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B71003DB818
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jul 2021 13:54:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gbm5t49fZz3d88
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jul 2021 21:54:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.217.43; helo=mail-vs1-f43.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gbm5W0QR3z301g
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jul 2021 21:54:06 +1000 (AEST)
Received: by mail-vs1-f43.google.com with SMTP id x66so2768261vsb.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jul 2021 04:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10AbK6xK8RHobfuB2T0I9ydjpvpHcTKY9gPukwHCGGA=;
 b=Y0VJZMDLAn5ZlQg3OOPkNQJcdP7qwEKDUu3hwADbM2Fymg3/GDmU/7vYj/6cdHx3bW
 66tvJYtWvjVTRaZOITZNrL/5tvWP1ksbxOC4BQwmxadI97tgFwG+xmtfrHHJ9CFeb0be
 HdH3mePU0vMQeMBca97dZ+Wi1Ldihvl+Fayqi+ptPat2mqgz1eEaA+unXuE7ZpptaNex
 Bl93n5nVRhL5v39QVCpl3Agi20dsyRirRwHtaSMIKF/huuL6gOWUZuuzqhsVwc2lmqG2
 fcCpey3jybhRJp5mMaqUGUpEIsXUR8iNUhi0aoKopTjGi4El4RyaoXpM8KGZDAg1lsNF
 Fbgg==
X-Gm-Message-State: AOAM533XAjq45o0xksRkpUXHout4aONlt8vL3oe5e91M8/fmk7dx+5WV
 zpp3P6UtKj3rV5Ur7iEBUXnzN/z2nm6uM0A4tcY=
X-Google-Smtp-Source: ABdhPJz4vdafBihdMrOKEMxBFoPjbpJQjxu69DET98mge7/3K8Au1C7Ct04O+Z9CWQAOZ0tklY4nnHzuyfbZq+wo9hQ=
X-Received: by 2002:a05:6102:321c:: with SMTP id
 r28mr1030174vsf.40.1627646043462; 
 Fri, 30 Jul 2021 04:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210728182115.4401-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210728182115.4401-1-lukas.bulwahn@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Jul 2021 13:53:52 +0200
Message-ID: <CAMuHMdXt4tYHcgPNUZ0ZQ9iKhmZ_dC=ub=Ha35xDy+jR2-CroQ@mail.gmail.com>
Subject: Re: [PATCH] arch: Kconfig: clean up obsolete use of HAVE_IDE
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, "moderated list:H8/300 ARCHITECTURE"
 <uclinux-h8-devel@lists.sourceforge.jp>, Randy Dunlap <rdunlap@infradead.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 the arch/x86 maintainers <x86@kernel.org>, kernel-janitors@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 alpha <linux-alpha@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 28, 2021 at 8:21 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> The arch-specific Kconfig files use HAVE_IDE to indicate if IDE is
> supported.
>
> As IDE support and the HAVE_IDE config vanishes with commit b7fb14d3ac63
> ("ide: remove the legacy ide driver"), there is no need to mention
> HAVE_IDE in all those arch-specific Kconfig files.
>
> The issue was identified with ./scripts/checkkconfigsymbols.py.
>
> Fixes: b7fb14d3ac63 ("ide: remove the legacy ide driver")
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

>  arch/m68k/Kconfig             | 1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
