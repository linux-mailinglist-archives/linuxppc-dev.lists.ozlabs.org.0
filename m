Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 090B320BBCF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:45:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tr6G30tszDr70
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:45:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=V4+waQO8; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tqcL3f01zDr4M
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:23:14 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id bh7so4703234plb.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CvJoXjPb3PppSXrTvZvJe33y7yc/YsOEYDjM/f5h460=;
 b=V4+waQO8b0iUP2RZw/9wwuSg1yJTxiHT0OF4g7SF9fKIzoFlXU6ot0auFw3DJDBR0p
 MbiGN8aOp87G0zacaSAFT7QrcUII1OlL5ZJdBCNbrfDgLWo8Xo07JOjx5OykYTd3bbuF
 qDCxZQPmgDAryI5UWavy9oWaqjeoKgoMhzprLtGpkwY4B7WeL/Z145HYp+Rdd1SoD8c6
 3BJH7MM784WaQY5yKAj70FP0deHmf6UKu+Ay4aV4LdsxdfEIupTDZoN+0XY1PELwlMmu
 hhn1UVkn6JRYANDcsLxYRtknIt/x4emnPr4cN4nzAKmjLtv5/apaBUms8FL3Yc4BwsJs
 H47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CvJoXjPb3PppSXrTvZvJe33y7yc/YsOEYDjM/f5h460=;
 b=jZaADU3vktxeo2T0YSi3k45dVS5hrQaoLIXkZdU1ul7rpHAGJJ/4Tf6t06EoLPF8lP
 CXIYHVm55UONdGzf3+3k2/SQNz0EbaJzB+DSPaXhDTfzg03MwjR2XAPWL7MamJAAEi+Y
 pj9l8hcFkoXDefTjilhq4yACd5Z13EigD+ZT/KOxk4lE/M7sq9Ilnonrxc3yy/5Rkp6j
 UJPrnA9hELq/SrnM4Rrg8Hn9kLeJ84AAaSj+63V1Z6If0DDLBf4ufy7uuyfInb9PLDjM
 HsJLhVrfPrbW8YJ9fUEvpUj2Y2cWXRNdfSEPsR51FystzpDV7UIIPqrWPDS5vFhZpX07
 1xEg==
X-Gm-Message-State: AOAM532OOqArGL2ADGkix4X8Klr6WrFSEPTWCUda1wUZk1B9JZ4mCAwJ
 gGXZIhUSc68MJIqpIpgB248Q5eydkTF0qcDEF/Gltg==
X-Google-Smtp-Source: ABdhPJwAirQYhcHGLt1+JjXg5NVX+m/8Nr12fmbDVwUgoHtdJsK/GnGlRIvrgvOirMw8ViXfV6UFbIIy77mdcmwl2RU=
X-Received: by 2002:a17:90a:6ac8:: with SMTP id
 b8mr5607777pjm.217.1593206591785; 
 Fri, 26 Jun 2020 14:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
 <20200626210917.358969-3-brendanhiggins@google.com>
 <202006261420.02E8E62@keescook>
In-Reply-To: <202006261420.02E8E62@keescook>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 26 Jun 2020 14:23:00 -0700
Message-ID: <CAFd5g47ZKJHzseyZT73uYB+EpAkyfN+gBj5X8ufZVnD6eG19eQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] arch: arm64: add linker section for KUnit test
 suites
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 catalin.marinas@arm.com, jcmvbkbc@gmail.com, will@kernel.org, paulus@samba.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-arch@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, rppt@linux.ibm.com,
 Iurii Zaikin <yzaikin@google.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, Jeff Dike <jdike@addtoit.com>,
 linux-um <linux-um@lists.infradead.org>, linuxppc-dev@lists.ozlabs.org,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 KUnit Development <kunit-dev@googlegroups.com>, chris@zankel.net,
 monstr@monstr.eu, Stephen Boyd <sboyd@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Alan Maguire <alan.maguire@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 26, 2020 at 2:20 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Jun 26, 2020 at 02:09:07PM -0700, Brendan Higgins wrote:
> > Add a linker section to arm64 where KUnit can put references to its test
> > suites. This patch is an early step in transitioning to dispatching all
> > KUnit tests from a centralized executor rather than having each as its
> > own separate late_initcall.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
> >  arch/arm64/kernel/vmlinux.lds.S | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> > index 6827da7f3aa54..a1cae9cc655d7 100644
> > --- a/arch/arm64/kernel/vmlinux.lds.S
> > +++ b/arch/arm64/kernel/vmlinux.lds.S
> > @@ -181,6 +181,9 @@ SECTIONS
> >               INIT_RAM_FS
> >               *(.init.rodata.* .init.bss)     /* from the EFI stub */
> >       }
> > +     .kunit_test_suites : {
> > +             KUNIT_TEST_SUITES
> > +     }
>
> See my reply to 01/12. Then this patch can be dropped. :)

Sweet, presumably this one and others.

> >       .exit.data : {
> >               EXIT_DATA
> >       }
> > --
> > 2.27.0.212.ge8ba1cc988-goog
> >
>
> --
> Kees Cook
