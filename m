Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 224A26EFFDA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 05:33:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6Ltg0G0Nz3f5W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 13:33:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lvtBaUxM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lvtBaUxM;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q6Lsq3Kb7z3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Apr 2023 13:33:01 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-64115e652eeso1969920b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 20:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682566378; x=1685158378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0CJhWXjc9Fv4hAAFKH+ld0zLVP5ytWUnCfEaPqRDTc=;
        b=lvtBaUxMiigxyaMzmTBJnxw0odGQPTQH5URJbY0FrLC72eK8drm5Muv+pCT0WFogBW
         s0QUclaPKXSYDBOC4HxsIUdnBFHeAp2byxf4VX9E697YgpJYlvcKmLITZtjxOUG/jVAT
         im/W57TjVRduCYWPHtm7A/zPBYDy9kliec4595d6+mBQJyGYpYX9tqqsisVacokrErJJ
         6NbbUM+L9zho8DvQzamVn8TOzZ2UxmNBrncw3aUymrdWNoLQV8KgI9urRuNZy1Gqt4u7
         eAyLRoK5X9WLCEp+UBnJvVaITMpd2q3Hel58md2Nh7eWAq5qdRHQxbo0pjmEgNCekLSj
         7O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682566378; x=1685158378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0CJhWXjc9Fv4hAAFKH+ld0zLVP5ytWUnCfEaPqRDTc=;
        b=GCKsRNSl/s++X8M+l7/48hxm1K5HPj6S9seEdDyzqw/746JpztdMZF1iZfINWBo9Z2
         Kq0Wm7t4O2rXu9NbkkKZbMcsmGexHg66iszMjTLN55YhfHM/M9CnKu/Uf0uE3gBQiInj
         n6W8l02CbOJ99lf+fADnhrj3iOlGEMO3StvCfoEBWPRp/xT2vVpHAb1dWleIged/AOfS
         gmTuuBwmmqunhgrnAt2STG8NHE40EHvljD0fpC4AGc+eNNTC6T4HXb19FdCH1LpyPFxA
         +edm7ZGXw86DS2Xb59hXqsjLgJ6nuH3YxaCFDdK7ioIDVqHL340MHT5Zn5UMhcxsITeT
         gzdg==
X-Gm-Message-State: AC+VfDygumZd0jTCWyAthYzv6VBXsHOE4kZkrijUmUjnXVCcV1Ai0Ceq
	x8JdDN1e1L2poNMTDKqedr2SbtbeVUYC31+3ykk=
X-Google-Smtp-Source: ACHHUZ6Nc+jBcba8+mTDSK/3QCstZKna56TJ/d+4XLaIPQLWhXpOo0RnjOFs3Av2doMu8xXjjIbRuPnyW/KudXQIFQs=
X-Received: by 2002:a17:902:f688:b0:1a6:4c2b:9e7f with SMTP id
 l8-20020a170902f68800b001a64c2b9e7fmr5530219plg.1.1682566378493; Wed, 26 Apr
 2023 20:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <87cz3tylwx.fsf@mail.concordia> <CAABZP2zr=jypD7w_o18o95QEj1nkFugLcNH5sbuSAY-caBQoeQ@mail.gmail.com>
 <CAABZP2xVCQhizytn4H9Co7OU3UCSb_qNJaOszOawUFpeo=qpWQ@mail.gmail.com> <87v8hixbql.fsf@mail.concordia>
In-Reply-To: <87v8hixbql.fsf@mail.concordia>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Thu, 27 Apr 2023 11:32:47 +0800
Message-ID: <CAABZP2x4SiDHOCweNcanxj6v-KYmVct9E8PVUr1pxFvR4gPGqQ@mail.gmail.com>
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
The default gcc version 9.4.0 in ubuntu 20.04 (in VM of Oregon State
University) also shows the problem.
>
> If you have time, you could use some of the other versions to narrow
> down which versions show the bug:
>
>   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/ppc64le/
>
> There's an 11.0, 11.1 and 11.3 there, as well as 9.5 and so on.
I have time ;-), and am very glad to try the above versions to narrow
down which version shows the bug ;-)

Cheers
Zhouyi
>
> There's
