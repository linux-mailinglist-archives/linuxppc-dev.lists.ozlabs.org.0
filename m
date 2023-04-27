Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE49C6F0347
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 11:22:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6VcY6Kfvz3f8t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 19:22:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=huKAdQho;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=huKAdQho;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q6Vbg1dbCz3c8n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Apr 2023 19:21:17 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1a66b9bd893so68151825ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Apr 2023 02:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682587274; x=1685179274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uePqlkQGG6AitPdU1LbmX8G4vLuJCgYv5wvbw0sfE8=;
        b=huKAdQhokLIOhHYEIUvNPnvAMpXk+ZX9ZwJtfBiMBKeA/QGLL8VyUTkasIpZpsNUMV
         VvrQbXtBxFIloZGJFBGav/yf6JQHfj+2nXwpZIa/ORD4JuKu51FhOAtK1F9k3sP3Ruj5
         OnN88L0fnG+47QDUb7hDBXi3sfYnEB5NYU6xykBlhFzq5saSJsG+qQJSFImlpjKG5RqK
         ZJSU4O2YJqVtLCsBnF1JjkSdelb8dyOZGyVfl7TnmjFyEimYzQAMcYzav8731eBkFZM7
         ww2EgxGqyxBzgqMTLozBLTFYrDMAIazEoNOjG+q14VJfr4blc5eKme+R5eSrS8qdq5M1
         cZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682587274; x=1685179274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uePqlkQGG6AitPdU1LbmX8G4vLuJCgYv5wvbw0sfE8=;
        b=kQhE40UHcl2sfrH427s47MIDXDWa6Asl57rPQIu2tJxRbhdiV5NCOPpZGKmk9V/z5e
         lYdJfF3H/wdoCh4KDIkss6XAEqn8hF6URTiJrhl6JZYtTnlUXHsfJ76bvYrW3lPQGc/l
         +Ep7Y5551bvlOhMgO2Xtv5SbAaJXEohorxA1dGwnl76kGsgn4uYAg4PlKSb6RypnxZgw
         4BFodtpFbA2/jCiekoJ+fQZPQVK3bT+wY8oIT6Nr9PqvVetXiSqmSugjVnO0IIFzafts
         K2MRfrje+cXSDO7szx5GufNobfu+dotEVZLBpEB/m7epzu5by6+hQ1HH1RWe++dsEife
         +BYg==
X-Gm-Message-State: AC+VfDy7kTcVCwK0iRgqugM+3u4DFfnC/Rh60YXbkMiwoe9kif8w9Ri2
	A1n6ogZBNJTB+bmQiN2uZ3gZvopK5++bYntPxbE=
X-Google-Smtp-Source: ACHHUZ5sk9omXcS/1gUiy/cbZ1CnepPuNVKYPJaAtmR4NnzQRU685UJOfiBe7o+uMCJF2c4p7lcEzoTKBTZieTO8dMU=
X-Received: by 2002:a17:903:228b:b0:1a6:6d9f:2fc9 with SMTP id
 b11-20020a170903228b00b001a66d9f2fc9mr973492plh.30.1682587274014; Thu, 27 Apr
 2023 02:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <87cz3tylwx.fsf@mail.concordia> <CAABZP2zr=jypD7w_o18o95QEj1nkFugLcNH5sbuSAY-caBQoeQ@mail.gmail.com>
 <CAABZP2xVCQhizytn4H9Co7OU3UCSb_qNJaOszOawUFpeo=qpWQ@mail.gmail.com> <87v8hixbql.fsf@mail.concordia>
In-Reply-To: <87v8hixbql.fsf@mail.concordia>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Thu, 27 Apr 2023 17:21:02 +0800
Message-ID: <CAABZP2z=xu+07-y5fqFLidZz1VpSgrSwXa1mFHPb=b3Ezr3OtA@mail.gmail.com>
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

On Thu, Apr 27, 2023 at 11:09=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.=
au> wrote:
>
> Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
> > On Tue, Apr 25, 2023 at 2:01=E2=80=AFPM Zhouyi Zhou <zhouzhouyi@gmail.c=
om> wrote:
> >> On Tue, Apr 25, 2023 at 6:07=E2=80=AFAM Michael Ellerman <mpe@ellerman=
.id.au> wrote:
> ...
> >> >
> >> > There's 12.2.0 here:
> >> >   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_=
64/12.2.0/
> >> >   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/ppc6=
4le/12.2.0/
>
> > powerpc64le-linux-gnu-gcc-12 cross compiler on my Ubuntu 22.04 does
> > not seem to have that issue as gcc-10 does
>
> OK. So so far it's only that GCC 10 that shows the problem.
>
> If you have time, you could use some of the other versions to narrow
> down which versions show the bug:
>
>   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/ppc64le/
>
> There's an 11.0, 11.1 and 11.3 there, as well as 9.5 and so on.
GCC test results (Tested on PPC VM of Open Source Lab of Oregon State
University)
gcc 9.4 (ubuntu native):          positive, show bug
gcc 9.5 (download form [1]):   positive, show bug
gcc 10.1 (download from [1]): positive, show bug
gcc 10.3 (download from [1]): positive, show bug
gcc 10.4 (download from [1]): positive, show bug

gcc 11.0 (download from [1]): negative, no bug
gcc 11.1 (download from [1]): negative, no bug
gcc 11.3 (download from [1]): negative, no bug
gcc 12.1 (download from [1]): negative, no bug
gcc 12.2 (download from [1]): negative, no bug

[1] https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/ppc64le/

I am very happy to cooperate if there is further need ;-)
Cheers
Zhouyi
>
> There's
