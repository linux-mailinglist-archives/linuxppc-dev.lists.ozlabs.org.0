Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6A276CC3C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 14:03:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=U8PZHqu5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RG9c53Ywzz3cNK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 22:03:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=U8PZHqu5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RG9bB4lp8z2xq8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 22:02:45 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-26824c32cfbso602905a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Aug 2023 05:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690977761; x=1691582561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZ819GwVCo9zR5ZzAiYSpFVr/sz2KTIAVN8PAALo4bo=;
        b=U8PZHqu5zyydy1mgddoFG96L9VW8L25yjDa/lyNEO64ddWZ33KemFAEis0ddxf/nnj
         IzU5ZRpsCImPTyezgGd7zS1yY3i/OnsPjP4evLfghD7NT6SOddqlW88ztwBDlvIHEENC
         pHhiwFrPAayjmeq6e0/mdL0Hr6x3h3ystMpFTt94VESAkM86o0k2zKJAHap0jZBkBhi5
         +jdI0W3//hHvQOspRYgjhvXtgziuuLO/YVbrv7uLzXp4HrWWc2DpHe1XqWbUMgWa7m/U
         +/dyWeT0JVoeKPgsSVi3YQA4Pgw23byHNoJCX9MDb9ozZUwx3ltbr4Sr4V6VUCpBrpbb
         wknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690977761; x=1691582561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZ819GwVCo9zR5ZzAiYSpFVr/sz2KTIAVN8PAALo4bo=;
        b=ZRwTu/2NbVRl3Xcj8CgnkdOZZwDrYYsDhpMHUxmE2fi9bKxlWdZ1TkK0T/HK6/Kgbh
         Iyrcq4+bXhn6/xcc5AyNot/FVIygjjN85J9XCkkwG/lvCi+QckOIP2Jr15MY7I2wS/0w
         8ksVzn7HV3FQOlmnG0/+xuRCBw3NNgNhXa/QGXWRt2UfrW31PyN8BkgNnD02pimBUnq9
         OSXaY2nB9HVSq6j/uqWd06Ym2cMPHO82vWuk/gZvX3QghNyFAEyszXMaP10TV3P58ley
         ijMvq+TD+RGQEYmrvvCqQD+9zioxq8BcnicZ3R4zj2I+/OdMUhhohrNph4tle7ZxCsUS
         qaSA==
X-Gm-Message-State: ABy/qLYZE3l54E7fHwFrTH0KL4v5iCVoNi8+E8RScYAmQP2V2ZvuDxV+
	mu5bvOE4CJyg3AeCkyNXNc62HgcZaEGIkPKjNuw=
X-Google-Smtp-Source: APBJJlHuloA0HTsPSoNz24gU6TOurNeBITpKadl1FpEMN3ek0OYWAF6+FL7hx/VdWb7RYwujlTuWhOvWXMHfDiFVaSw=
X-Received: by 2002:a17:90a:c210:b0:267:f8f4:73ab with SMTP id
 e16-20020a17090ac21000b00267f8f473abmr19375725pjt.16.1690977760816; Wed, 02
 Aug 2023 05:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl> <87il9xu1ro.wl-tiwai@suse.de>
In-Reply-To: <87il9xu1ro.wl-tiwai@suse.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 2 Aug 2023 20:02:29 +0800
Message-ID: <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
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

On Wed, Aug 2, 2023 at 7:22=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 02 Aug 2023 09:32:37 +0200,
> Hans Verkuil wrote:
> >
> > Hi all,
> >
> > On 25/07/2023 08:12, Shengjiu Wang wrote:
> > > Audio signal processing has the requirement for memory to
> > > memory similar as Video.
> > >
> > > This patch is to add this support in v4l2 framework, defined
> > > new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> > > V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> > > for audio case usage.
> > >
> > > The created audio device is named "/dev/audioX".
> > >
> > > And add memory to memory support for two kinds of i.MX ASRC
> > > module
> >
> > Before I spend time on this: are the audio maintainers OK with doing
> > this in V4L2?
> >
> > I do want to have a clear statement on this as it is not something I
> > can decide.
>
> Well, I personally don't mind to have some audio capability in v4l2
> layer.  But, the only uncertain thing for now is whether this is a
> must-have or not.
>

Thanks,  I am also not sure about this.  I am also confused that why
there is no m2m implementation for audio in the kernel.  Audio also
has similar decoder encoder post-processing as video.

>
> IIRC, the implementation in the sound driver side was never done just
> because there was no similar implementation?  If so, and if the
> extension to the v4l2 core layer is needed, shouldn't it be more
> considered for the possible other route?
>

Actually I'd like someone could point me to the other route. I'd like to
try.

The reason why I select to extend v4l2 for such audio usage is that v4l2
looks best for this audio m2m implementation.  v4l2 is designed for m2m
usage.  if we need implement another 'route',  I don't think it can do bett=
er
that v4l2.

I appreciate that someone can share his ideas or doable solutions.
And please don't ignore my request, ignore my patch.

Best regards
Wang shengjiu
