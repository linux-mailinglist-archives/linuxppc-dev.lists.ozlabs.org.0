Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B190E6F0770
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 16:30:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6dST3tWkz3fQW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Apr 2023 00:30:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cXRvpI9L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cXRvpI9L;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q6dRb5kTLz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Apr 2023 00:29:46 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-24782fdb652so6147309a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Apr 2023 07:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682605784; x=1685197784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrjVe+GZ/aYuuygp5YMWvVf8Vcfas6AR9IpieFbpkS0=;
        b=cXRvpI9LxCPwg+kylqNX0WHyH+4TIOKTAwHF9DnkYXVQDJ+8rprEmQMiul2qCbscAf
         Af80Tm+ly+BXlUbPXkTb5WYgYcNee2xf2YA9hlvx2sVbOQ5Bi4PCoiNkayUKmRCMMxAG
         c3VISC2KkbS2OsOFIwc3gKPTlfuXT2bzNxBX0ikUxwOVeiFlYzk9QfiQ3bvWgQOWFiCn
         rOVSzP8H/ulCf9x+r3O+awGtcqihKr2UsvANh9XkfZf5pW1lS1ptgwNpiXTOomHl7xcM
         sOYGT3vz+MyFbCTcwu1O/1PnqNM+GaF+a8Ab/p7OgKcSGjm2njHVeRIyN7Qy2tWc1TAJ
         dzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682605784; x=1685197784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrjVe+GZ/aYuuygp5YMWvVf8Vcfas6AR9IpieFbpkS0=;
        b=T0mDleQHX1eQjKmdFSQa+nE3pcBwFy3QnQNwik0IBsLnvLVcBsQ+vf81l+n7hycTtf
         GhQZuuJXGCeM5NdU/hr+BgBIuxUn9/Yh/PHYTkvHPKnGBhIoATK2AtWHgKKe140tOBkj
         0wrbeWlLfX82sr+5ycDPCcDrrhKY3WDUogh/igDh1zAaeSMYwyKfmMtjFESA/vrk9GI0
         KWARhn/+ItGTUwBg93J5WfJTszS8bKToODtvw25pSZ6xhZp0qcQ4ogDZJ09QS8M/BiP6
         xf3RERpHtAtSvo4o1iDYNELYBWetLuKjMIZqcVKbqkVbCaiX66U1nfOkmJEby2DJw1Yb
         Y7MA==
X-Gm-Message-State: AC+VfDztej++lcGiB9IJc8tq09MozAZsaFTBKi8Ih19ASAAVI9yQyjGl
	D4T51xVPGUEx0DVqw5aH7B1pZSX3EFddDrblqOk=
X-Google-Smtp-Source: ACHHUZ6hdTNgQQwv2t44avCCrWR8mbrKKdu0cTf/4gXM14sjtPsKe8xWmsE4xn4ram6UUVNxmfMLcyEIXG1GWQzLnlA=
X-Received: by 2002:a17:90a:d513:b0:247:6edf:e934 with SMTP id
 t19-20020a17090ad51300b002476edfe934mr1886414pju.42.1682605783915; Thu, 27
 Apr 2023 07:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <87cz3tylwx.fsf@mail.concordia> <CAABZP2zr=jypD7w_o18o95QEj1nkFugLcNH5sbuSAY-caBQoeQ@mail.gmail.com>
 <CAABZP2xVCQhizytn4H9Co7OU3UCSb_qNJaOszOawUFpeo=qpWQ@mail.gmail.com>
 <87v8hixbql.fsf@mail.concordia> <CAABZP2z=xu+07-y5fqFLidZz1VpSgrSwXa1mFHPb=b3Ezr3OtA@mail.gmail.com>
 <87wn1xquq0.fsf@mail.concordia>
In-Reply-To: <87wn1xquq0.fsf@mail.concordia>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Thu, 27 Apr 2023 22:29:32 +0800
Message-ID: <CAABZP2yS5=ZUwEZQ7iHkV0wDm_HgO8K-TeAhyJrZhavzKDa44Q@mail.gmail.com>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
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
Cc: rcu <rcu@vger.kernel.org>, lance@osuosl.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 27, 2023 at 10:13=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.=
au> wrote:
>
> Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
> > On Thu, Apr 27, 2023 at 11:09=E2=80=AFAM Michael Ellerman <mpe@ellerman=
.id.au> wrote:
> >>
> >> Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
> >> > On Tue, Apr 25, 2023 at 2:01=E2=80=AFPM Zhouyi Zhou <zhouzhouyi@gmai=
l.com> wrote:
> >> >> On Tue, Apr 25, 2023 at 6:07=E2=80=AFAM Michael Ellerman <mpe@eller=
man.id.au> wrote:
> >> ...
> >> >> >
> >> >> > There's 12.2.0 here:
> >> >> >   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x=
86_64/12.2.0/
> >> >> >   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/p=
pc64le/12.2.0/
> >>
> >> > powerpc64le-linux-gnu-gcc-12 cross compiler on my Ubuntu 22.04 does
> >> > not seem to have that issue as gcc-10 does
> >>
> >> OK. So so far it's only that GCC 10 that shows the problem.
> >>
> >> If you have time, you could use some of the other versions to narrow
> >> down which versions show the bug:
> >>
> >>   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/ppc64l=
e/
> >>
> >> There's an 11.0, 11.1 and 11.3 there, as well as 9.5 and so on.
> > GCC test results (Tested on PPC VM of Open Source Lab of Oregon State
> > University)
> > gcc 9.4 (ubuntu native):          positive, show bug
> > gcc 9.5 (download form [1]):   positive, show bug
> > gcc 10.1 (download from [1]): positive, show bug
> > gcc 10.3 (download from [1]): positive, show bug
> > gcc 10.4 (download from [1]): positive, show bug
> >
> > gcc 11.0 (download from [1]): negative, no bug
> > gcc 11.1 (download from [1]): negative, no bug
> > gcc 11.3 (download from [1]): negative, no bug
> > gcc 12.1 (download from [1]): negative, no bug
> > gcc 12.2 (download from [1]): negative, no bug
>
> Awesome work.
Thank you for your encouragement ;-) ;-)
>
> How are you testing for presence/absence of the bug? By running your
> test and seeing if it crashes, or by looking at the generated code?
Both
I use gdb ./vmlinux; gdb)disassemble srcu_gp_start_if_needed to look
up the generated assembly code
and
I use [1] to see if it crashes, if there is a bug, it always crashes
very quickly (within 3 minutes)
[1] http://140.211.169.189/0425/whilebash.sh

Cheers
>
> cheers
