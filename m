Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2E97A688E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 18:03:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rqmfg0yMDz3cBZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 02:03:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.174; helo=mail-yw1-f174.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rqmf84cBLz30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 02:02:56 +1000 (AEST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59c0d329a8bso40187067b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 09:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695139373; x=1695744173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ60uW+tbu6+KHWBtVlQ7lvtyHPfNfut3/R5HxH+TlQ=;
        b=BRy1ffyzyX4QCbnZCTcZJqIMYJpW1UenrFw25aTAg8mLBdaAq1Kzse81+Ml7JcnX7q
         G7GUA8b4FhwR3lAyV8l8OVuzRV0FvMMHCmQKHZ0bFjJ82NzEuLfiow2HyLAtzSBB6ZW7
         i9FryWDHOcVO+8Rlfu7ykNHFiLW/Zb5k2jlR5v3wd3McBExtUz6dLX2VmQ+Ind23oxfF
         qCbH+1vgSZ6omMrVzsOjY2NfCB8O5gkPUsJ7hz3eYcsgPBKAedIWa/fXPnjPnNM8j/yQ
         tnLXc084z00JtqhUujzi1dtx7xe6oZqe/lB9txspbjGEiG7W/CNvBSHPaDoXOQYDfCFO
         drSg==
X-Gm-Message-State: AOJu0YwsUaYNrE4Q0xYWtyKbbuuycTNvxeQREwHFgz4T+RHgsTXe0CFJ
	GcKyoijg+s6r3SVZEjjQ6KxVQqoRPHzBEw==
X-Google-Smtp-Source: AGHT+IEUpFV6JZV3skfoyO/A8Qo9pWpXUFqnKRhFOpceoi9aV8pX3B5bFc8+FYiXZD8pp1op3ivbyg==
X-Received: by 2002:a81:a053:0:b0:58f:a19f:2b79 with SMTP id x80-20020a81a053000000b0058fa19f2b79mr13130103ywg.9.1695139372833;
        Tue, 19 Sep 2023 09:02:52 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id l4-20020a0dfb04000000b0057a44e20fb8sm3270775ywf.73.2023.09.19.09.02.52
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 09:02:52 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d8521c7172eso1854362276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 09:02:52 -0700 (PDT)
X-Received: by 2002:a25:cb0f:0:b0:d7b:8d0c:43ee with SMTP id
 b15-20020a25cb0f000000b00d7b8d0c43eemr12315ybg.37.1695139371557; Tue, 19 Sep
 2023 09:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230918175529.19011-1-peter@n8pjl.ca> <20230918234108.GN19790@gate.crashing.org>
 <20230919000026.7409-1-peter@n8pjl.ca> <20230919151630.GO19790@gate.crashing.org>
 <20230919155832.4179-1-peter@n8pjl.ca>
In-Reply-To: <20230919155832.4179-1-peter@n8pjl.ca>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Sep 2023 18:02:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQ=xpeY3tmLXe1kgJbRtmVAn62rEhvzO+VB7GCgy4F8w@mail.gmail.com>
Message-ID: <CAMuHMdXQ=xpeY3tmLXe1kgJbRtmVAn62rEhvzO+VB7GCgy4F8w@mail.gmail.com>
Subject: Re: [PATCH 0/7] arch/*: config: Remove ReiserFS from defconfig
To: Peter Lafreniere <peter@n8pjl.ca>
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
Cc: linux-m68k@vger.kernel.org, tsbogend@alpha.franken.de, jack@suse.cz, linux-sh@vger.kernel.org, richard.henderson@linaro.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, richard@nod.at, ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, johannes@sipsolutions.net, reiserfs-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, anton.ivanov@cambridgegreys.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Peter,

On Tue, Sep 19, 2023 at 5:58=E2=80=AFPM Peter Lafreniere <peter@n8pjl.ca> w=
rote:
>  2) Stops building an obsolete and largely-unused filesystem unnecessaril=
y.
>     Some hobbyist targets like m68k and alpha may prefer to keep all file=
systems
>     available until total removal, but others like arm and UML have no ne=
ed for
>     ReiserFS to be built unless specifically configured.

As UML is used a lot for testing, isn't it actually counter-productive
to remove ReiserFS from the UML defconfig?  The less testing it
receives, the higher the chance of introducing regressions.

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
