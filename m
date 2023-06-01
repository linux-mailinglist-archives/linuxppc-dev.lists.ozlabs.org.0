Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7F571956C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 10:23:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWzfH4k96z3dtC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 18:23:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=scnpKoyc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=scnpKoyc;
	dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWzdP2VVgz3cJx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 18:22:17 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-bacf9edc87bso566926276.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 01:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685607734; x=1688199734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3q8fSv1CYQ8OeBSkoHHq8yQzPVMEdcVj1sJJBohCe0=;
        b=scnpKoycafdSA6Zmoxe64NtU1IPtpP1XoN7u6BxbHgaNpHHpBaRgfB2X/NbVQI3XUI
         S43vtnrb0VpUQFKtCtNAL2Z4eQGxKB9jkDmQzBef6OSmzPFkANcNw2nEHbBaxtIGRJFx
         F2gdbWX0/JO50BjGXzMMRjG/dVaN6/37Aaxe3j2XyiD9NBGl22snChdmfv7CpIBT4YsT
         wzEsBAOaAGJLasaxdabRza57BmBoAT7cVmGOq5aUEFhtYj/c1WejBdPyTkL2OU+y9vxz
         zNiBma0es8vOX0CahjWds9KH8J6DH6xHzp6sGGczNoDJQcyp7Q2snP8wt+QQc7Qs4GOa
         fyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685607734; x=1688199734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3q8fSv1CYQ8OeBSkoHHq8yQzPVMEdcVj1sJJBohCe0=;
        b=Wl00pJ4pHzVe7eWEhQAOztqDNdRfrNV0FhiM6nuZn0LrrXMfpoN4absad4oV6ILYtt
         vwCOMqTvHFPGHWCgzh9Ygc0TxfBnKktLl3oTcHJ17KfhykA/q6zY6t530KhrqUMWjG3a
         hU8SUnpaydQ4XZ1hXieI4I52TkRV5NUYhrMkQzTBYv5mYvam6bGYsqRlRe1C5MOVq3qV
         4r6g1aRRVH55EaxyzohUGAWYqeVYUpAMY5HV49d9LVbh5NtT02A639HhQ3+icPJ5NFQc
         GQMRw00WBpQhJRcUo5PYnTBEPoPPUQc/+KP10HkdfwXJXB7f9dQw5c0XtK26XUPiPAuQ
         +YMw==
X-Gm-Message-State: AC+VfDwPmQnFzzQJG1cZpS5apuqJvtt1NDVjP5TtVyzakbeTZ1cbXnFQ
	+pliI/ayLBV7tCR5fx0BQ3RJWdrzJHw5DhmSoWTchGKdEIA=
X-Google-Smtp-Source: ACHHUZ4BVGpqKx729yAA7sIpRRuJCk9B2q39qd4V84f+TNhLT6e1WTgI1mcqI+pCtHVuJpHfepvjflFti312UIm7bGk=
X-Received: by 2002:a0d:f5c2:0:b0:568:d63e:dd2c with SMTP id
 e185-20020a0df5c2000000b00568d63edd2cmr6202683ywf.11.1685607733835; Thu, 01
 Jun 2023 01:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com>
 <20230531213032.25338-31-vishal.moola@gmail.com> <CAMuHMdU4t4ac_eCH0UaX9F+GQ5-9kYjB_=e+pSfTkxG=3b8DsA@mail.gmail.com>
 <025fc34a24e1a1c26b187f15dba86d382d9617eb.camel@physik.fu-berlin.de>
In-Reply-To: <025fc34a24e1a1c26b187f15dba86d382d9617eb.camel@physik.fu-berlin.de>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 1 Jun 2023 01:22:03 -0700
Message-ID: <CAOzc2pxnb6WXoVK5JXX42R0Q6FK59Q1uebQskK2fxLn6DuicqA@mail.gmail.com>
Subject: Re: [PATCH v3 30/34] sh: Convert pte_free_tlb() to use ptdescs
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 1, 2023 at 12:28=E2=80=AFAM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Geert!
>
> On Thu, 2023-06-01 at 09:20 +0200, Geert Uytterhoeven wrote:
> > On Wed, May 31, 2023 at 11:33=E2=80=AFPM Vishal Moola (Oracle)
> > <vishal.moola@gmail.com> wrote:
> > > Part of the conversions to replace pgtable constructor/destructors wi=
th
> > > ptdesc equivalents. Also cleans up some spacing issues.
> > >
> > > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> >
> > LGTM, so
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I assume this series is supposed to go through some mm tree?

Hi Adrian,
I was going to have Andrew take this through mm-unstable
once it gets enough review.
