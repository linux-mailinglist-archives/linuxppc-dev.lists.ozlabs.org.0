Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C72976E9A9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 15:12:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OgeQqTU3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGq5036YTz3c5T
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 23:12:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OgeQqTU3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGq473C2Zz30FW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 23:11:34 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-790bed44880so31373539f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Aug 2023 06:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691068291; x=1691673091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lC0SW0eAGcjrPelcOslL8Ss4E31DBBOJeX5ruPDUDU=;
        b=OgeQqTU3eLsToIFQqpnPIA8g1WCwq6zItGL9mntQIrUxGhjbBitttp4rPonWdcsfxP
         iRu6lmPdnlStCJoOCDCEuv4opy0zlLNTWrDmAEXCgmXENtRx5rA/fBxUCmTnEEXn1s3d
         +b7fpiJVshrK7ErQ0MD+MO4FLFbHFFpyzV69Zs7aLy44fmoU9jTLoK5MvRuK820kS5RG
         J+SRnf5gQSlsbchEYrjWURjn7aZhSZjoQmyVb5mdk1f9ajw0rn3vuOWoAlhOae+REEzD
         zfGk59orqaoBC1o2Oruv8/rVXoVQYP4t+5ttTB6qg7JIglPFNGEO+kjJ6kcvnW4QH0jw
         r2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691068291; x=1691673091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lC0SW0eAGcjrPelcOslL8Ss4E31DBBOJeX5ruPDUDU=;
        b=NC8iPyj2JcUje4v0aO7y/Qa+oXiyXVw5GDEbQYa0BLv7NnlF6iP57w0cP1HgF+Vmzy
         GqBqezAENPw250eGPYPhk4jnnSrhVu6B2AOCbBkbd0U5xt9dsPYcJIyjUDTnv54KUree
         S/dvwBezTjJK+Ng3kIC/bQP9bOj2iShl8Z/ayp412G7HLwTyiC1X2JN4NRATOc+AdyV8
         EbR4Gwpm49thv7nOMsyzhc1beOHipSP1bt1HYVBPmKPe/LeIfgCo452UZx9Awk9Gy4rF
         D+F75y1NG+vFF9OPZa8QxGjxf0ddWpYOCaylJujvVbMv2OzmYHvlMeJyUza5EDXhHiO+
         a2Pg==
X-Gm-Message-State: ABy/qLZKcuUFFUC+W2wKIxDcZWHaF1ip7rFaVp2c+yMcIzndpvqFnz/2
	vq8qfxmF+luxY7F2nsXwrzMtdb0zJxHQ26GCFvo=
X-Google-Smtp-Source: APBJJlEtqzIxYCVUFEvV5fgDCP81fGeD3GZpt6levaG9H4upWh9g5EvLMYrqL4ob+7IT6h4Vjry/EVcjmBnCK9V7HJM=
X-Received: by 2002:a05:6e02:1569:b0:348:c041:abd7 with SMTP id
 k9-20020a056e02156900b00348c041abd7mr15797226ilu.13.1691068290064; Thu, 03
 Aug 2023 06:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl> <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
 <87il9xoddo.wl-tiwai@suse.de> <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
 <844ef9b6-d5e2-46a9-b7a5-7ee86a2e449c@sirena.org.uk>
In-Reply-To: <844ef9b6-d5e2-46a9-b7a5-7ee86a2e449c@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 3 Aug 2023 21:11:16 +0800
Message-ID: <CAA+D8AOnsx+7t3MrWm42waxtetL07nbKURLsh1hBx39LUDm+Zg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
To: Mark Brown <broonie@kernel.org>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 3, 2023 at 1:28=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Wed, Aug 02, 2023 at 10:41:43PM +0800, Shengjiu Wang wrote:
>
> > Currently the ASRC in ALSA is to connect to another I2S device as
> > a sound card.  But we'd like to the ASRC can be used by user space dire=
ctly
> > that user space application can get the output after conversion from AS=
RC.
>
> That sort of use case would be handled via DPCM at the minute, though
> persuading it to connect two front ends together might be fun (which is
> the sort of reason why we want to push digital information down into
> DAPM and make everything a component).

Thanks.

ASRC M2M case needs to run as fast as possible, no sync clock control.
If use sound card to handle ASRC M2M case,  the user application
should be aplay/arecord, then we need to consider xrun issue, buffer
may timeout, sync between aplay and arecord,  these should't be
considered by pure memory to memory operation.

DPCM may achitect all the audio things in components and sound
card,  it is good. but for the M2M case, it is complcated. not sure
it is doable.

best regards
wang shengjiu
