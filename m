Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BFB3BA4F4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 23:12:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGnq73MRdz3bc7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 07:12:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.47; helo=mail-ua1-f47.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGnpp3hdSz3014
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Jul 2021 07:12:32 +1000 (AEST)
Received: by mail-ua1-f47.google.com with SMTP id x37so4316519uac.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jul 2021 14:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iWmsu/MAqdEYVnC17Jds+nQkby43Df87NTtUM3jHHqE=;
 b=j+F/pvTqUaaeGFKfrZUSqhG9q/puNO4OlYi8cH0z56zDIiG67m0NDfGLZpUGv1oGFm
 /VXgTAeXJpp5mRorK2Ca5WcG1RYF7yF4MVBbop5kx4Vsb/vQ03SM7ujZRKS6fuQMilrT
 9Hgc3+AA7YxraN/1zotmBE6oSP+MKr3eWaA+zO0hhl6xxTPNDsIPAmlEI82rUA+cSBpC
 Fq1YY1qbXkpaZP468YNV8Ob9lxWlvV6mrjuYgWc02+U7DpfYOWara8qYmNj6T/rzGeX4
 HJUYL6jFjLUdU+8c/pslAxikPyjUsrJjTmMm6W4hHf/nw0FIbilmv2zVZzpsmY1G5doM
 IcJA==
X-Gm-Message-State: AOAM533mjYRmD43Wcgyq8aB+POdzrKEn+cqjhHFWJNxltA8Zy0eCi8mw
 fEloXGFdn+bSbvPVZfc5NzxNPH2ql2m2wvBO+YUHhiDS
X-Google-Smtp-Source: ABdhPJwFWeUtP8wudZfNwbQ+DaTooM2VLLb988TYTLhMSFaTbFsTt83dii8Q+aFlknLwfrxfTjLyTaJW7401xFUOgRs=
X-Received: by 2002:ab0:71c1:: with SMTP id n1mr2542722uao.2.1625260349128;
 Fri, 02 Jul 2021 14:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <git-mailbomb-linux-master-f377f7da26d2af87e2ddc39190546f62ecdb2bd8@kernel.org>
In-Reply-To: <git-mailbomb-linux-master-f377f7da26d2af87e2ddc39190546f62ecdb2bd8@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Jul 2021 23:12:17 +0200
Message-ID: <CAMuHMdVn6k16OS4NB5NEnRAHFSzSu60t1=SK4bd+xpBFSdLyYg@mail.gmail.com>
Subject: Re: powerpc/spider-pci: Remove set but not used variable 'val'
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Fri, Jul 2, 2021 at 10:14 PM Linux Kernel Mailing List
<linux-kernel@vger.kernel.org> wrote:
> Commit:     f377f7da26d2af87e2ddc39190546f62ecdb2bd8
> Parent:     911bacda4658129bee039dc90fc0c3f193ee2695
> Refname:    refs/heads/master
> Web:        https://git.kernel.org/torvalds/c/f377f7da26d2af87e2ddc391905=
46f62ecdb2bd8
> Author:     Baokun Li <libaokun1@huawei.com>
> AuthorDate: Tue Jun 1 16:53:19 2021 +0800
> Committer:  Michael Ellerman <mpe@ellerman.id.au>
> CommitDate: Tue Jun 15 17:12:27 2021 +1000
>
>     powerpc/spider-pci: Remove set but not used variable 'val'
>
>     Fixes gcc '-Wunused-but-set-variable' warning:
>     # WARNING: Fixes tag on line 3 doesn't match correct format
>     # WARNING: Fixes tag on line 3 doesn't match correct format
>     # WARNING: Fixes tag on line 3 doesn't match correct format
>     # WARNING: Fixes tag on line 3 doesn't match correct format
>     # WARNING: Fixes tag on line 3 doesn't match correct format
>     # WARNING: Fixes tag on line 3 doesn't match correct format

Which tools is adding these warnings to various commit descriptions?

>     arch/powerpc/platforms/cell/spider-pci.c: In function 'spiderpci_io_f=
lush':
>     arch/powerpc/platforms/cell/spider-pci.c:28:6: warning:
>     variable =E2=80=98val=E2=80=99 set but not used [-Wunused-but-set-var=
iable]
>
>     It never used since introduction.
>
>     Signed-off-by: Baokun Li <libaokun1@huawei.com>
>     Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>     Link: https://lore.kernel.org/r/20210601085319.140461-1-libaokun1@hua=
wei.com

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
