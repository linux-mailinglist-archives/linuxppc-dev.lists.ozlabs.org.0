Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB9776D054
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 16:42:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=mGgnebdB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGF7n6d6kz3c7s
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 00:42:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=mGgnebdB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGF6t5NYjz2xVP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 00:41:57 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-56486669643so294628a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Aug 2023 07:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690987315; x=1691592115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIjRCuFSh10TgeuSUQ8r4PrErxnjVCdj/TIwnacZN1M=;
        b=mGgnebdB8kAVU+E2H5mynakxO+gKdMPzTPPnfuycCqzcB/1PHsmMTkSVCSiU7lhUUI
         ISo1GIYfQ9Vuzwy8IAUdLxEsRQEHulbbs8YpB1j9NdhX3ghVb/GEf8HZbQJhgD42L9W6
         J4tUmzOl3xNsWNsHob/Tg4tYwVVPoAH96k8sbSAmz9k1hDHaRLJWk5/a3Z2KIeJhmIRi
         P+wPPxwgb78DmyFbaOR+m8bYtICXyyJ/vHR5WzzWclsB1Fkx0e3wIXtATQwz9fbBhNY/
         pxq8WWRyFUd899J75q5wG/Hbanlc6WKpRWN+aVkgpq3ePXpaLkvsg0rYB/HkBA6FX4fW
         CiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690987315; x=1691592115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIjRCuFSh10TgeuSUQ8r4PrErxnjVCdj/TIwnacZN1M=;
        b=GwnCkchk+GAxDTZn9h/0nCAycpqGiht1LRtKOKJAxWmdpHYlZ/mWKQVX+80icy+I/N
         X1chw2jqo51E2U+hsQyLPDzVYLA9dOdrmzVKz5NqKZqRJtKKDYXoxM/aIlayKrq8hNsB
         D89ssgeYwx6+54JXZhBZuRCBr++Vu79Rvf12E1NRzHAOti3ly22tzvFa2NKBfnPlr2rY
         ZHbV2r9Tm4lwFFSnuhu0t0pq0ZjOrQJ5POVvJ3N4f6+n8+rlw2DWc8TamoQX2jUn6j0q
         60gnk7ranKcPAeVL4bZLuQYiK4LKFiXrn6MqVIPnNkDju/GLZXckay/s9lwVrTeNWCJS
         crFg==
X-Gm-Message-State: ABy/qLbeMTVRfHdR3FGNTwSBrRtG9IhMS1rZQnd8vG7lDDMKfmfdsjJC
	H9xLMKXEYU9FZqhtPaU4FWIwTa24+ltYw0SFIWE=
X-Google-Smtp-Source: APBJJlFz2P+Hhh/+gr4lvaHd8cYOPbmuxQXrmDFhh17NWbkyLYYcpfmWzMEWjHFqCWqAW1bGM/Mh7zG6bY8iwCpx2CU=
X-Received: by 2002:a17:90a:fa05:b0:268:21c3:4fd8 with SMTP id
 cm5-20020a17090afa0500b0026821c34fd8mr19933605pjb.20.1690987314959; Wed, 02
 Aug 2023 07:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl> <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com> <87il9xoddo.wl-tiwai@suse.de>
In-Reply-To: <87il9xoddo.wl-tiwai@suse.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 2 Aug 2023 22:41:43 +0800
Message-ID: <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
To: Takashi Iwai <tiwai@suse.de>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 2, 2023 at 8:08=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 02 Aug 2023 14:02:29 +0200,
> Shengjiu Wang wrote:
> >
> > On Wed, Aug 2, 2023 at 7:22=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wro=
te:
> > >
> > > On Wed, 02 Aug 2023 09:32:37 +0200,
> > > Hans Verkuil wrote:
> > > >
> > > > Hi all,
> > > >
> > > > On 25/07/2023 08:12, Shengjiu Wang wrote:
> > > > > Audio signal processing has the requirement for memory to
> > > > > memory similar as Video.
> > > > >
> > > > > This patch is to add this support in v4l2 framework, defined
> > > > > new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> > > > > V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> > > > > for audio case usage.
> > > > >
> > > > > The created audio device is named "/dev/audioX".
> > > > >
> > > > > And add memory to memory support for two kinds of i.MX ASRC
> > > > > module
> > > >
> > > > Before I spend time on this: are the audio maintainers OK with doin=
g
> > > > this in V4L2?
> > > >
> > > > I do want to have a clear statement on this as it is not something =
I
> > > > can decide.
> > >
> > > Well, I personally don't mind to have some audio capability in v4l2
> > > layer.  But, the only uncertain thing for now is whether this is a
> > > must-have or not.
> > >
> >
> > Thanks,  I am also not sure about this.  I am also confused that why
> > there is no m2m implementation for audio in the kernel.  Audio also
> > has similar decoder encoder post-processing as video.
> >
> > >
> > > IIRC, the implementation in the sound driver side was never done just
> > > because there was no similar implementation?  If so, and if the
> > > extension to the v4l2 core layer is needed, shouldn't it be more
> > > considered for the possible other route?
> > >
> >
> > Actually I'd like someone could point me to the other route. I'd like t=
o
> > try.
> >
> > The reason why I select to extend v4l2 for such audio usage is that v4l=
2
> > looks best for this audio m2m implementation.  v4l2 is designed for m2m
> > usage.  if we need implement another 'route',  I don't think it can do =
better
> > that v4l2.
> >
> > I appreciate that someone can share his ideas or doable solutions.
> > And please don't ignore my request, ignore my patch.
>
> Can you explain a bit more details of your demand?
> At least, a "big picture" showing how your hardware is implemented and
> what is exactly necessary would be helpful for understanding the
> problem.
>

We have the hardware IP: ASRC,  asynchronous sample rate converter.

Currently the ASRC in ALSA is to connect to another I2S device as
a sound card.  But we'd like to the ASRC can be used by user space directly
that user space application can get the output after conversion from ASRC.

The ASRC can be integrated into a multimedia framework (gstreamer) as a plu=
gin.

best regards
wang shengjiu
