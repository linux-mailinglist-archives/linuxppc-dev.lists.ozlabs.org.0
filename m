Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A0274890B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 18:15:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=W4sUFM2h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qx4WF0Csfz3bpl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 02:15:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=W4sUFM2h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx4VK3s2Pz2ydX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 02:14:16 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-c5e76dfcc36so1886081276.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 09:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688573651; x=1691165651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Guo91PWFfnDo+SM4in0LICs86g8qzvQOcFv1DmUQYs=;
        b=W4sUFM2hhReuUTVmyE/6eTlg++DgmtseZ6DBAULnSwYT+0ChqPAMtuWGsoQoVxetwB
         2MSdHMbTfrcaNmcUTl6dhwhYnRbs7ySFp0xHXWPSVSXrEw4KafdiHLp0dTd0P+VAIPst
         F3OF1e+XpdvYaDb0gvsIz3ZFZB48Kwf9Q9x/ihnbhyS2Wj3riVvNkUI1DEaCHmewmanN
         1LIIhLSuhAIY+6DJ1+rOm3D8XJEugm3n7kCKOA90AlJO6duTLBaW6AL6UcIGpdwyJ/Uc
         tNK9Pq9YUla2fOjCHfTRyARZbAqC6m66J1W3QL6gfFWiwiCAbAtsypkWijRWP6+a7Lbh
         caLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688573651; x=1691165651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Guo91PWFfnDo+SM4in0LICs86g8qzvQOcFv1DmUQYs=;
        b=GzLoEX29k7rXYlEZljGIbkA/cHyzVG5a+tv6AqSAzSgew4XhCK79fNeEp7fWPBTNMI
         Ew+clkPnmPcly1WpZa64uhhHdSORLYa+3N82XpwVE2xW4Y/LLinIt5NJB2Roe8pYff0S
         azSRBmbXHgc0TNmGVl3e6fCNur79MnzHN2E2VctKmZldRxRlxJiRR0zXxybqDPAg/OBJ
         tVAkVF4v2WZbhMAK9l4ycJBiuLPj9rwSTZaV9uAqoXXr4YAbzN7FyDLFetfZn+kwcjut
         ObZ25gVKwdYhuQ9BsanSAtldKbepgiLRNx42AMUij96Y1wMrM9/MR1VRijPwHgAbh5g0
         XMcw==
X-Gm-Message-State: ABy/qLZRwAELeqkT76txwLkG0cag2TEA7xcm63tMRyJ2+NUL2M7az5bh
	643cGLZjKInxhqpJGTOAQPucCMJrFpsKjs8RvmuC9w==
X-Google-Smtp-Source: APBJJlGk0KH8+36f2+xyKK2C4ux1o8hhKHK7EH+E5Y+YeWDZp7ujvXuniSIUKmajsgTHknuFdvicRxFQnSIREfIDqZY=
X-Received: by 2002:a25:ab65:0:b0:c1b:d362:4b4e with SMTP id
 u92-20020a25ab65000000b00c1bd3624b4emr15371940ybi.43.1688573651009; Wed, 05
 Jul 2023 09:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info> <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
 <2023070359-evasive-regroup-f3b8@gregkh> <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
 <2023070453-plod-swipe-cfbf@gregkh> <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
 <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
 <2023070509-undertow-pulverize-5adc@gregkh> <7668c45a-70b1-dc2f-d0f5-c0e76ec17145@leemhuis.info>
 <20230705084906.22eee41e6e72da588fce5a48@linux-foundation.org>
In-Reply-To: <20230705084906.22eee41e6e72da588fce5a48@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 5 Jul 2023 09:14:00 -0700
Message-ID: <CAJuCfpGQK+Z0WPoRjBbSgD5m9wXyP7NJpu9fjGALmGu=6AGYaw@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Andrew Morton <akpm@linux-foundation.org>
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
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux regressions mailing list <regressions@lists.linux.dev>, Greg KH <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, "Linux regression tracking \(Thorsten Leemhuis\)" <regressions@leemhuis.info>, Bagas Sanjaya <bagasdotme@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 5, 2023 at 8:49=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Wed, 5 Jul 2023 10:51:57 +0200 "Linux regression tracking (Thorsten Le=
emhuis)" <regressions@leemhuis.info> wrote:
>
> > >>> I'm in wait-a-few-days-mode on this.  To see if we have a backporta=
ble
> > >>> fix rather than disabling the feature in -stable.
> >
> > Andrew, how long will you remain in "wait-a-few-days-mode"? Given what
> > Greg said below and that we already had three reports I know of I'd
> > prefer if we could fix this rather sooner than later in mainline --
> > especially as Arch Linux and openSUSE Tumbleweed likely have switched t=
o
> > 6.4.y already or will do so soon.
>
> I'll send today's 2-patch series to Linus today or tomorrow.

I need to make a correction to the patch fixing the issue (the first
one in the series) and will post it within an hour. Thanks!
