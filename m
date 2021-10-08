Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 743CE427285
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 22:48:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HR0dr2Fn0z3c7Q
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 07:48:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lixom-net.20210112.gappssmtp.com header.i=@lixom-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=YpMxZY3n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lixom.net
 (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20210112.gappssmtp.com
 header.i=@lixom-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=YpMxZY3n; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HR0d627qkz2xrH
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 07:47:52 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so8662959pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Oct 2021 13:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t4CIiQ2IZifzfO1S6EOd33trwTzZFffSiflj15uAAVE=;
 b=YpMxZY3n9gbkNSH+7be2/NK2ysrVgRJ8X8FMlaJg168WjJa8hpTuGZPN8JEBqtGdhW
 jjAfsQoPR3v8K7A3ONibX8xI4xsU7Cg/CUe8QhkTGyeDldsKoVuOTQAfDU4rCzQjv5Na
 jXnqNU892IDOQzHQifmM7xQVZkY6/EngaHOK2N2rCgsZrJjVaEkfi/VyVO6DCDYhTQwY
 dNm9TcxNk9h5QI49D79AqEXvnKURtxTqxwkmBRQsONF5keSVCBRCt5bRBiK/kMbxYmud
 Pw19qkeVImsYGAyFkiAQHB9qchmdWGLOSvN9JP/6yqxLkpIDQ3uAVV5YENuXpJ6OIIYy
 c0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t4CIiQ2IZifzfO1S6EOd33trwTzZFffSiflj15uAAVE=;
 b=F1FDP3pBI3qOsEFipjq0WmM3i6AC3V/TnlluQl/PjoFmv2FvZfZ+nQNi8lFCv2MsUb
 QMd/4akH+NZOBA1LYh763rHkmCY5HWahjqCNAQKmK+AUNhx0FS5dPz/JlUFjobK3U39c
 4FTE7YaBDYAwesdfBndUbQnSXomOG5amtTaQ3UMzqy8cVO8f82Kb3hkarpSEHc0mZCuP
 AniGohEgCrvJllA/jHCSMZbgL185EJvFZpT75plESXx8JYtLmblAv5Iry+a7d+6lnlS5
 +ucjJ9mMNeBqBIaoIFQBPB1MS1H6ClN2GJqdhIZz5NFCE4/2k5hyuQNsxS2poW1AbixW
 l5ZA==
X-Gm-Message-State: AOAM533Nic+n2MlMsh6M+ARP+Lht2dCveqtXMkZ2RWIWHZj6Zzrz8jGL
 nvzxbv/VPPMSMwwc3DIOvjy20hxa4pE/Kq1ktyhbjQ==
X-Google-Smtp-Source: ABdhPJypmgQv4T/Wc0DMrpjvau3LVuaOQpfECvvN1A8H1c3ueU3qLgzA0GwZV2Gz0N76bWvLD1vh8OO8lH4cQgfdsaU=
X-Received: by 2002:a17:90a:ec17:: with SMTP id
 l23mr2487525pjy.184.1633726069175; 
 Fri, 08 Oct 2021 13:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <87mtnylaam.fsf@mpe.ellerman.id.au>
 <B2915AF7-A603-43CC-9ED4-9F8A869CBCC5@xenosoft.de>
In-Reply-To: <B2915AF7-A603-43CC-9ED4-9F8A869CBCC5@xenosoft.de>
From: Olof Johansson <olof@lixom.net>
Date: Fri, 8 Oct 2021 13:47:37 -0700
Message-ID: <CAOesGMgnx6P=J--bygw=vcL1b4mQbdACBX+Mwc7BtmEmMtP7KA@mail.gmail.com>
Subject: Re: Add Apple M1 support to PASemi i2c driver
To: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
 Darren Stevens <darren@stevens-zone.net>, Arnd Bergmann <arnd@arndb.de>,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-i2c@vger.kernel.org, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mohamed.mediouni@caramail.com, Matthew Leaman <matthew@a-eon.biz>,
 Stan Skowronek <stan@corellium.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd@a-eon.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christian,

Self-service available on lore:
https://lore.kernel.org/all/20211008163532.75569-1-sven@svenpeter.dev/

There are links on there to download a whole thread as an mbox if needed.


-Olof

On Fri, Oct 8, 2021 at 1:20 PM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> Hi Michael,
>
> Do you have a mbox link for the v2 changes?
>
> I would like to test them on my AmigaOne X1000.
>
> Thanks,
> Christian
>
> On 27. Sep 2021, at 09:58, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> =EF=BB=BFChristian, the whole series is downloadable as a single mbox her=
e:
>
> https://patchwork.ozlabs.org/series/264134/mbox/
>
> Save that to a file and apply with `git am`.
>
> eg:
>
> $ wget -O mbox https://patchwork.ozlabs.org/series/264134/mbox/
> $ git am mbox
>
> It applies cleanly on v5.15-rc3.
>
> cheers
