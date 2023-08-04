Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F3F77001B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 14:21:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kbQlGVsJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHPvP3Gq3z3cSK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 22:21:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kbQlGVsJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHPtN29X5z30Yc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 22:20:11 +1000 (AEST)
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-790976d86a1so69859939f.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 05:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691151606; x=1691756406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrwOUvJz44BN5+OtSVByIy8J3CpPSze+6riYsFxfsMQ=;
        b=kbQlGVsJp70sWB8QfAfHW27v/PNM84FAARz14y/rUBtAb4gtteYLF+sn3H3D69jwb4
         iugxxkMuzylxdHfEz68QjqfCS3RjX+xRrF7VgiAJmgHYmZNCgzJLzl5t3NCgn19UakBF
         Uri4Pbjl8XI0HprawdOaGavbl11N4d3J0u4idM0gNqUqtgZGiMFA46XMdGEnNaez+jGv
         omJgYUuHUIyiRKUZrCKuW11ITVCEioymwgiMnOxdY079JEeNQ198TGzr1cuVWSfvmkMY
         R5XueAh45t8KGN/CABOf79zw24ngPZXbrF2YJMsy5YewAvNxQQlydN/iyNlR8y2472/1
         DdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691151606; x=1691756406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrwOUvJz44BN5+OtSVByIy8J3CpPSze+6riYsFxfsMQ=;
        b=k7nqMxWug2ZQTMBUyjeaS3SIkVogRxXaLQUUqnJSILIzspDzw0vGRrec6rNKtEhXDw
         /fmdhbAOw/x/k+f6+9IQmferKOlsceRWKzdzv5AWEv0ttK9NbZXsZUFybMStc2HoWZ1i
         0rCGgPnYLUWT2Wajy+KTf9QWfBJFHW+o6b3OEYEnRx4bWYL/lVXydoT48jNe0eUA+y5j
         1S3WlSNeuAQUIHgy4JbanHCaQaxL+frGKyxdiob0K1VF/IgaOWZKvK8QkB8T0Rafa2ex
         bC3Cjgn7si0uovskAHfIikcwkW0umdv9pIeC2qVZFntpC+R2PyVd2tD468ubWNfb1vsC
         m4Ow==
X-Gm-Message-State: AOJu0Yx35DQJFiiODNtR8vBRDA2Amt5iNX8Z0RJvAqkGSyrXHQQU8NTO
	BKtWJ6QM5Nb4ZyaWeEU5n7k7iXE+SQeF4u3o2kI=
X-Google-Smtp-Source: AGHT+IGXmtFNaA0hRyLJ1GmqVu20WaJ5uUAJgyR8e37qIbW6h/p7fMU2JoYVpgxxO9U9RB7zJ7ER+mQH+cMrPNHxCQQ=
X-Received: by 2002:a05:6e02:184e:b0:345:cdbe:833c with SMTP id
 b14-20020a056e02184e00b00345cdbe833cmr1983943ilv.28.1691151606515; Fri, 04
 Aug 2023 05:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl> <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com> <d038360b-22a2-3869-cd64-2da827736faa@xs4all.nl>
In-Reply-To: <d038360b-22a2-3869-cd64-2da827736faa@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 4 Aug 2023 20:19:49 +0800
Message-ID: <CAA+D8ANSihjxvqkATE9z460sPz4nbcUqhDrR3eiEjPaU6ytrXQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
To: Hans Verkuil <hverkuil@xs4all.nl>
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 2, 2023 at 8:28=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
>
> On 02/08/2023 14:02, Shengjiu Wang wrote:
> > On Wed, Aug 2, 2023 at 7:22=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wro=
te:
> >>
> >> On Wed, 02 Aug 2023 09:32:37 +0200,
> >> Hans Verkuil wrote:
> >>>
> >>> Hi all,
> >>>
> >>> On 25/07/2023 08:12, Shengjiu Wang wrote:
> >>>> Audio signal processing has the requirement for memory to
> >>>> memory similar as Video.
> >>>>
> >>>> This patch is to add this support in v4l2 framework, defined
> >>>> new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> >>>> V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> >>>> for audio case usage.
> >>>>
> >>>> The created audio device is named "/dev/audioX".
> >>>>
> >>>> And add memory to memory support for two kinds of i.MX ASRC
> >>>> module
> >>>
> >>> Before I spend time on this: are the audio maintainers OK with doing
> >>> this in V4L2?
> >>>
> >>> I do want to have a clear statement on this as it is not something I
> >>> can decide.
> >>
> >> Well, I personally don't mind to have some audio capability in v4l2
> >> layer.  But, the only uncertain thing for now is whether this is a
> >> must-have or not.
> >>
> >
> > Thanks,  I am also not sure about this.  I am also confused that why
> > there is no m2m implementation for audio in the kernel.  Audio also
> > has similar decoder encoder post-processing as video.
> >
> >>
> >> IIRC, the implementation in the sound driver side was never done just
> >> because there was no similar implementation?  If so, and if the
> >> extension to the v4l2 core layer is needed, shouldn't it be more
> >> considered for the possible other route?
> >>
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
> To give a bit more background: if it is decided to use the v4l API for th=
is
> (and I have no objection to this from my side since API/framework-wise it=
 is a
> good fit for this), then there are a number of things that need to be don=
e to
> get this into the media subsystem:
>
> - documentation for the new uAPI
> - add support for this to v4l2-ctl
> - add v4l2-compliance tests for the new device
> - highly desirable: have a virtual driver (similar to vim2m) that support=
s this:
>   it could be as simple as just copy input to output. This helps regressi=
on
>   testing.
> - it might need media controller support as well. TBD.
>
> None of this is particularly complex, but taken all together it is a fair
> amount of work that also needs a lot of review time from our side.
>
> I want to add one more option to the mix: drivers/media/core/v4l2-mem2mem=
.c is
> the main m2m framework, but it relies heavily on the videobuf2 framework =
for
> the capture and output queues.
>
> The core vb2 implementation in drivers/media/common/videobuf2/videobuf2-c=
ore.c
> is independent of V4L2 and can be used by other subsystems (in our case, =
it is
> also used by the DVB API). It is a possibility to create an alsa version =
of
> v4l2-mem2mem.c that uses the core vb2 code with an ALSA uAPI on top.
>
> So in drivers/media/common/videobuf2/ you would have a videobuf2-alsa.c b=
esides
> the already existing videobuf2-v4l2.c and -dvb.c.
>
> Perhaps parts of v4l2-mem2mem.c can be reused as well in that case, but I=
 am
> not sure if it is worth the effort. I suspect copying it to an alsa-mem2m=
em.c
> and adapting it for alsa is easiest if you want to go that way.
>

Thanks.

Does this means that videobuf2-v4l2.c and v4l2-mem2mem.c are dedicate
for video device? if audio want to use v4l2 framework,  need to create
videobuf2-alsa.c and alsa-mem2mem.c, but it may cause a lot of function
duplicate.

Best regards
Wang Shengjiu
