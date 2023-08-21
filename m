Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E49782465
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 09:23:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u5QT6x/F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RTkTb4rrBz3bnN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 17:22:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u5QT6x/F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RTkSh6mtkz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 17:22:12 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d73c595b558so3012626276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 00:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692602526; x=1693207326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgI1MYhv8309+bCWxdxoJqdqvZCrtsQ/VE9m30u9HF4=;
        b=u5QT6x/FxMVr+1aoFCgsJDj0QEzfuHcrI2+VtQeO3v/dDMfnEXre6eKjslbAPuUGTR
         aDUsBu03dfbFVS8OhYUJcmZRNRxDOJQK6WxjkipX7+Fd0mFDQ5MV5BjVeGuHVtrGJNbJ
         ABD+WhvSqFyI0oNdtM/dDZBfYoqbEG8UatfAl8s4MibiV1a0vVRj7TTPWy3g6zF6Zlnv
         Hnx7JSh5IjFD1Zj9/8hUuYRLDQAMHhlxn4UXcU4/t3qc+6D+q93GHHvFJ7feucAIuzzw
         Ytn4kIvomeBgbEXGMAFSY06730ouBsxWljY/tT5fZycl1G5UNmE9iI7QTtvC2zGFK9Jf
         7sSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692602526; x=1693207326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgI1MYhv8309+bCWxdxoJqdqvZCrtsQ/VE9m30u9HF4=;
        b=TDWEGELZvLMmPfcjFbqkDL9eHuazEtqAnndK09ruEShGZ/s56nKFiVS4SohUauxjlj
         YBjQupTQ+C4MsR279W9kJ2F2+ZjBmhWHvUvLMdkrs+ShMaBzPZyV96CCDsHvuKoqXYOs
         lRm+6d+OJsIBtmH463zbfHaLx02KhrIoZDJl6GILdZMb6otq11xoYjPXKesKBEQxJ6Uq
         u5I3PPQX1xlG7bcOCqEGIRMqAIm0gFWfwt/rMuKY6vI9sjafxQBMJQVlQDB5UIWvNvzM
         y0EAs63JUPE7+/WYM7+RKO0qivyCnlNIQH7Q5IMPnBM3QgbdnnY+J5gc6og6y8I2SwFP
         bvww==
X-Gm-Message-State: AOJu0YzCkUTIquW4Rf7vA1jj5k0p7MyMjebqhdcjQjDgagQmWpcetd9P
	6QIkubCBNytza/1SXgy23dRSKjrJ+N8BmFc05V8hww==
X-Google-Smtp-Source: AGHT+IF/JTlr0dFi7ImP5aRW58ulW03tzkcnFFuhr9AUEC0SHkebzyrNv7zePScJNAsfPiEBnyQ9/wv9Y8G7TlIDK6A=
X-Received: by 2002:a25:abeb:0:b0:d5b:1dd9:8e3f with SMTP id
 v98-20020a25abeb000000b00d5b1dd98e3fmr6148796ybi.41.1692602526568; Mon, 21
 Aug 2023 00:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
 <5f671caf19be0a9bb7ea7b96a6c86381e243ca4c.1692376361.git.christophe.leroy@csgroup.eu>
 <CACRpkdamyFvzqrQ1=k04CbfEJn1azOF+yP5Ls2Qa3Ux6WGq7_A@mail.gmail.com> <fc5f1daa-58a1-fb86-65ba-c6b236051d45@csgroup.eu>
In-Reply-To: <fc5f1daa-58a1-fb86-65ba-c6b236051d45@csgroup.eu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Aug 2023 09:21:54 +0200
Message-ID: <CACRpkdaiW1QgQAjaC3hTsTjwvuWw9OUwXGsH2t3X8k+ueuBN4A@mail.gmail.com>
Subject: Re: [PATCH v4 21/28] net: wan: Add framer framework support
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
Cc: Andrew Lunn <andrew@lunn.ch>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Herve Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
  Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 21, 2023 at 7:19=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 20/08/2023 =C3=A0 23:06, Linus Walleij a =C3=A9crit :
> > On Fri, Aug 18, 2023 at 6:41=E2=80=AFPM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >
> >> From: Herve Codina <herve.codina@bootlin.com>
> >>
> >> A framer is a component in charge of an E1/T1 line interface.
> >> Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
> >> frames. It also provides information related to the E1/T1 line.
> >>
> >> The framer framework provides a set of APIs for the framer drivers
> >> (framer provider) to create/destroy a framer and APIs for the framer
> >> users (framer consumer) to obtain a reference to the framer, and
> >> use the framer.
> >>
> >> This basic implementation provides a framer abstraction for:
> >>   - power on/off the framer
> >>   - get the framer status (line state)
> >>   - be notified on framer status changes
> >>   - get/set the framer configuration
> >>
> >> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> >> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >
> > I had these review comments, you must have missed them?
> > https://lore.kernel.org/netdev/CACRpkdZQ9_f6+9CseV1L_wGphHujFPAYXMjJfjU=
rzSZRakOBzg@mail.gmail.com/
> >
>
> As I said in the cover letter, this series only fixes critical build
> failures that happened when CONFIG_MODULES is set. The purpose was to
> allow robots to perform their job up to the end. Other feedback and
> comments will be taken into account by Herv=C3=A9 when he is back from ho=
lidays.

Ah I see. I completely missed this.

Yours,
Linus Walleij
