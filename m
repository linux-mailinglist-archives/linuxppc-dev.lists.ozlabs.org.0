Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FFF372AD4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 15:19:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZL6B4vBLz301L
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 23:19:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HUCmFuhh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HUCmFuhh; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZL5j1Fn3z2y88
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 23:19:02 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id k19so4413426pfu.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 06:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CblgwW7Ud4f+9B1bK3aZ/7Lhxg480Ys59O+QR93vR6A=;
 b=HUCmFuhh8rWhVdsZN+H9ct9cpQQQ8X/8g5TSNpCqhizZ8EbPmq5SSLxpKk2jeUMdaX
 Tj9yd9u0iJ0+fauwyryct8gHTiPFZj6s+oGlCBMXIEenq7xhQhcoDyUjJJnTvFcswe4G
 kvI65Ho+kQrl2l3KFtE6JOsBNLDlKGMenC/VffsODCsr4+WtgNGh8Vdn/eHvTRdHQyrt
 XMRsS43lgRgSqlQQPaedD7v9I5rEUNCo2b0cfLiNvnFweSGe0SD5mJrLPaklTOGdbo/x
 q0TOBJBYgVHNa+tO2YzSKYk817yKK3IV1bzf14n9rSOL8mbUx4mXvj74RSVzQHw+2W9K
 Tr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CblgwW7Ud4f+9B1bK3aZ/7Lhxg480Ys59O+QR93vR6A=;
 b=dPhRy5F19OFMIPnolMk30y1cp4Hu8MeCRV5pFdTTDJgCZ9LS/vPhmlLVwAfVFKmT+h
 VyAIV7TpBMQTC1TvQcI9nyKFiKlkj3I2aTu/8PcFiIXp183ZXthAqwVmhVbacrLI6zgy
 3jd5mqCP/yqBb9qveffcv1KqC14WAFZLOslXNmReLBENfN+IJllYQBT2oUk8YAYmJ1pF
 9nhfbJQTsesbKFjyvcUFlS/R9aiOyR3oZXZdTC2Y0jlO2KjUX8oYP8sAPxvhfwd6oL/2
 72DX9Cy1eGpJDUmRY88CT2tS+kNvL1FnB4wB2CVGMqVhOBU1h7ibKY+VgDpcBHMcsF3Q
 8cSg==
X-Gm-Message-State: AOAM533TBGls0aHiYEDYOqVHUOOY7K+0MGPwMWeFqE5hCxJRXwgHAmj1
 TvrF7qnGj/GAFhfMPqkLAzftBwdTlAdm5OGgZY4=
X-Google-Smtp-Source: ABdhPJx5/8RQyp1LMuT4Dl9J/CS/IVFtFhu6zNbV+WzSdT3rLdKRijmds7H+X6buGhqrh+XMoJnP1gnFM230fMgVSDo=
X-Received: by 2002:a17:90a:bd13:: with SMTP id
 y19mr5273402pjr.181.1620134338124; 
 Tue, 04 May 2021 06:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <8b5f1d57-1357-affd-565f-f4826f3ecbdf@csgroup.eu>
In-Reply-To: <8b5f1d57-1357-affd-565f-f4826f3ecbdf@csgroup.eu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 4 May 2021 16:18:41 +0300
Message-ID: <CAHp75VevBN1AKpZetMfY7tUU0ghjc7_g7Vw=+rPxTfdifqqhFw@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 3, 2021 at 9:17 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 01/05/2021 =C3=A0 17:15, Masahiro Yamada a =C3=A9crit :
> > The current minimum GCC version is 4.9 except ARCH=3Darm64 requiring
> > GCC 5.1.
> >
> > When we discussed last time, we agreed to raise the minimum GCC version
> > to 5.1 globally. [1]
> >
> > I'd like to propose GCC 5.2 to clean up arch/powerpc/Kconfig as well.
>
> One point I missed when I saw your patch first time, but I realised durin=
g the discussion:
>
> Up to 4.9, GCC was numbered with 3 digits, we had 4.8.0, 4.8.1, ... 4.8.5=
, 4.9.0, 4.9.1, .... 4.9.4
>
> Then starting at 5, GCC switched to a 2 digits scheme, with 5.0, 5.1, 5.2=
, ... 5.5
>
> So, that is not GCC 5.1 or 5.2 that you should target, but only GCC 5.
> Then it is up to the user to use the latest available version of GCC 5, w=
hich is 5.5 at the time
> begin, just like the user would have selected 4.9.4 when 4.9 was the mini=
mum GCC version.

And we may end up in the case when gcc 5.x will be more buggy than
v4.9.y (as once proved by nice detective story where compiler bug
produces a file system corruption).

--=20
With Best Regards,
Andy Shevchenko
