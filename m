Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D2A6FEE40
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 11:02:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QH5Wg1BmRz3fXV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 19:02:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=LiA5aCTh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com; envelope-from=nphamcs@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=LiA5aCTh;
	dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QH5Vp2Hbtz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 19:01:52 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7577a91cfd6so243673285a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 02:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683795709; x=1686387709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KATKL5c9hHw7borFknSpolyvbkYiWwqKIKb81BIcugs=;
        b=LiA5aCThzGnNp7E+Ta+DAvVEwiclZpF791zLAUwx+Als8erWN8Yl7PpwtloKY7vfA7
         +VTsnl2KSlBmbyAImxRU3lG+IUT2Wqb5hUFCcAsZyEs/D1k9iAGqD79kt7aecJ/Cxj9r
         eR6nzEnIzjucsN/6A+1hNPz8FvRo+Kuj2ketbPBiwSj1JqzajAiKbzNVkW/c2RJBCR3k
         MZC8rrsOEhbdZrX91ntkakGdeHJHeYwEVqGe6cUOqDaw42N8TysvScbiMKu+APTP9eCY
         3fchxaSfDDqrX5GvKxMc/O6qbvizbF/orFqeAlT1EFH85PiOL82QGmIN8EQXMGf+kfzf
         4sBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683795709; x=1686387709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KATKL5c9hHw7borFknSpolyvbkYiWwqKIKb81BIcugs=;
        b=BXiu6p/2Q7M4XCddIZode9IGW1t2gEKC8g4FRAdCqHVygMv5G4r1z4wF2XUpQu3wn6
         SsE3ypWsU8m+59q6ZijIMU3x+ZEK9KeA4tqpQsGYNfeJde4XNLTzNwwSDnkSPnNrU2r6
         U4xSGWH2GaCEuQI7iu0ig0oGnv4TN1I41+G4oZDM30Qg/rvE8PpgZm9CsFmdWu8X0KG3
         2eX/fw8kFJMwW0rPrLEm2tE3H3UsoKJOvsBFJL+MB4eP3vPchzSM50tkFYDMIzJ7fE3/
         iAfhFXgQ5wVjJUnvThMlzWOudlrTEIgPabS4I3iGe3gUzYqlNxxO+s2OdrvxlQMNP4yX
         k8hA==
X-Gm-Message-State: AC+VfDwP8qIfRi4r5KSxHsmYDQKQxbu62fGM+be/CCEnKfJ6Bl3Sjrev
	fpnvTbcpa1QrG6mvnQYI2d+R6vQmz9hffsRHOzE=
X-Google-Smtp-Source: ACHHUZ5zRYnTHqc+5jEp+WommdN4iUlzGKKD+R//mFSlux2Z635gESR+gw4QOQ+7Eia9GPcOqFZAyzIfjtGm1Vv4yks=
X-Received: by 2002:a05:6214:4018:b0:5ef:3b9a:b01d with SMTP id
 kd24-20020a056214401800b005ef3b9ab01dmr25843220qvb.1.1683795708608; Thu, 11
 May 2023 02:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230510195806.2902878-1-nphamcs@gmail.com> <CAMuHMdV=PNCb1VYfUkEb9rPwGVB=1tkwvm-XBqECyhHR4SNGKg@mail.gmail.com>
In-Reply-To: <CAMuHMdV=PNCb1VYfUkEb9rPwGVB=1tkwvm-XBqECyhHR4SNGKg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 11 May 2023 02:01:37 -0700
Message-ID: <CAKEwX=Pty0V0m+_00F1uWR1EXt8Gt35PYh-yUZEd-LQRSKgfGQ@mail.gmail.com>
Subject: Re: [PATCH] cachestat: wire up cachestat for other architectures
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, linux-mm@kvack.org, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, linux@armlinux.org.uk, mattst88@gmail.com, borntraeger@linux.ibm.com, linux-alpha@vger.kernel.org, gor@linux.ibm.com, hca@linux.ibm.com, kernel-team@meta.com, richard.henderson@linaro.org, npiggin@gmail.com, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, glaubitz@physik.fu-berlin.de, linux-arm-kernel@lists.infradead.org, chris@zankel.net, monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, jcmvbkbc@gmail.com, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, svens@linux.ibm.com, hannes@cmpxchg.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 11, 2023 at 12:01=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Nat,
>
> On Wed, May 10, 2023 at 9:58=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wro=
te:
> > cachestat is previously only wired in for x86 (and architectures using
> > the generic unistd.h table):
> >
> > https://lore.kernel.org/lkml/20230503013608.2431726-1-nphamcs@gmail.com=
/
> >
> > This patch wires cachestat in for all the other architectures.
> >
> > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> > ---
> >  arch/alpha/kernel/syscalls/syscall.tbl      | 1 +
> >  arch/arm/tools/syscall.tbl                  | 1 +
>
> Looking at the last addition of a syscall (commit 21b084fdf2a49ca1
> ("mm/mempolicy: wire up syscall set_mempolicy_home_node"), it looks
> like you forgot to update arm64 in compat mode? Or is that not needed?

It does look like I missed that! Thanks for the reminder. I'll send a fixle=
t
shortly...

Best,
Nhat

>
> >  arch/ia64/kernel/syscalls/syscall.tbl       | 1 +
> >  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +
>
> For m68k:
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> >  arch/microblaze/kernel/syscalls/syscall.tbl | 1 +
> >  arch/mips/kernel/syscalls/syscall_n32.tbl   | 1 +
> >  arch/mips/kernel/syscalls/syscall_n64.tbl   | 1 +
> >  arch/mips/kernel/syscalls/syscall_o32.tbl   | 1 +
> >  arch/parisc/kernel/syscalls/syscall.tbl     | 1 +
> >  arch/powerpc/kernel/syscalls/syscall.tbl    | 1 +
> >  arch/s390/kernel/syscalls/syscall.tbl       | 1 +
> >  arch/sh/kernel/syscalls/syscall.tbl         | 1 +
> >  arch/sparc/kernel/syscalls/syscall.tbl      | 1 +
> >  arch/xtensa/kernel/syscalls/syscall.tbl     | 1 +
> >  14 files changed, 14 insertions(+)
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
