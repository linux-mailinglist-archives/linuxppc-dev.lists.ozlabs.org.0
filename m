Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 182F68C676F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 15:35:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AkFZQRxB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfZ3r3gbqz3cf8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 23:35:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AkFZQRxB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfZ3564L5z30gp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 23:34:57 +1000 (AEST)
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-36c5d26045bso776195ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 06:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715780095; x=1716384895; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKaNiR2tHzqJJTEKvrwnceIlUex2fFxFPfEzvQnl9LY=;
        b=AkFZQRxBsqhhWtpcH1bdKZ2I4/SMpirIvpIu+XD+oPu3NkQrnmNpgOxTxCQ29oBJw9
         GFB7FNxv7XOWqpiW/3/pJcxjYWkXkbZYMFXWkflkCR94okzQkhSVAVb//YsBU0yUI7zM
         4fAqUsbaDpl6ObJDbsaQ7KP84+t6psb/wIlHitR6v/Uq4kV5cZmsXW5An5CL+8PEFgU/
         hVnvJ+6V6YJ/xCno+lXpdWTWPNZQMF5VkRC0TCgFDWzjNc4oKgP7p04i+W5Kv4jVHDKn
         /jr4Dunt+uSP0igSMKxwOlx6H+/iZKZpeyBtKBZ3Omu2CzlBVwxR/F3oV0UoPfTu/4ai
         DQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715780095; x=1716384895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKaNiR2tHzqJJTEKvrwnceIlUex2fFxFPfEzvQnl9LY=;
        b=ZISzVvvnUUtVXipd899jIj/A8eiCy2SGWglhP7u/aSz+hCZB53pUNamLyCyjnrgp0C
         YO/T+iBdueyN05gDw2qkXprM6xaDajBIZM2Zr7p4oYXSb8AV1yGJFRL7ix27gezyYTnA
         6sWg3zKxgdKAxMyKsZXvo3nBlQzIOXCZC70yn4J710Slp3NdRcYXuPSOL4VlUIk4MyLx
         ZxVeiDVrsYIx9Oz2BdM9slaawO+YQbwFlLTo6TmdNwBOZ0cyXm9RM+nKzK+IOG3BS5P5
         9RZKHOemR4DJ5fmAqE+JDVZCOHS1lQKXalPF6T0bJsnEHjzDMLfdzPWxu1hj7JAy51wW
         dDMg==
X-Forwarded-Encrypted: i=1; AJvYcCVLTaR81r+ZzkvJCQJMXQuQNYfDyqpx9kMxfHNEv98OqVrhSFbCDyteDFbIrQKkHwBNuUeF8HWE25jfRr+qjGrQJZyKIdbIJkzwKljF5A==
X-Gm-Message-State: AOJu0YwlQ4PwnEBToqQqbPEJEYfVi4AeySW8Dx30F4Wb85j0qbWr4P3M
	7FWdB6hjuH5SSBF1IQekHLewzgh4odX4z/iz6Kyfz7aZJrjZBpnCaPlsCdB03MCAO1uO2MAB2Rf
	Z+IcCiC0gK9VGKzbPbv4zmyyN0lE=
X-Google-Smtp-Source: AGHT+IHfRlOUxQoum9oYFbcfElme0a98PvIrTeymgurRG3pRPNQgq34N6O3Htci09zrMSFYrILhaT785x6RkUCQvVK8=
X-Received: by 2002:a05:6e02:12cd:b0:36c:c536:80dd with SMTP id
 e9e14a558f8ab-36cc536824dmr181987035ab.11.1715780095030; Wed, 15 May 2024
 06:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <87sez0k661.wl-tiwai@suse.de> <20240502095956.0a8c5b26@sal.lan>
 <20240502102643.4ee7f6c2@sal.lan> <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
 <20240503094225.47fe4836@sal.lan> <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl> <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
 <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com> <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
 <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com> <CAA+D8AMJKPVR99jzYCR5EsbMa8P95jQrDL=4ayYMuz+Cu1d2mQ@mail.gmail.com>
 <28d423b1-49d8-4180-8394-622b1afd9cd9@perex.cz> <850a80b2-d952-4c14-bd0b-98cb5a5c0233@perex.cz>
 <c5dbb765-8c93-4050-84e1-c0f63b43d6c2@xs4all.nl> <8a6f84ac-5813-4954-b852-84f5118e607c@perex.cz>
 <87o7975qcw.wl-tiwai@suse.de> <e63ec6c8-7da7-4b87-b7ff-a71ff12dcfc1@perex.cz>
In-Reply-To: <e63ec6c8-7da7-4b87-b7ff-a71ff12dcfc1@perex.cz>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 15 May 2024 21:34:43 +0800
Message-ID: <CAA+D8AOj2ZkiSg2sXfQypg-xc4f8dMykENu5GoGMx6REGu+WBQ@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
To: Jaroslav Kysela <perex@perex.cz>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Sebastian Fricke <sebastian.fricke@collabora.com>, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, sakari.ailus@iki.fi, =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 15, 2024 at 6:46=E2=80=AFPM Jaroslav Kysela <perex@perex.cz> wr=
ote:
>
> On 15. 05. 24 12:19, Takashi Iwai wrote:
> > On Wed, 15 May 2024 11:50:52 +0200,
> > Jaroslav Kysela wrote:
> >>
> >> On 15. 05. 24 11:17, Hans Verkuil wrote:
> >>> Hi Jaroslav,
> >>>
> >>> On 5/13/24 13:56, Jaroslav Kysela wrote:
> >>>> On 09. 05. 24 13:13, Jaroslav Kysela wrote:
> >>>>> On 09. 05. 24 12:44, Shengjiu Wang wrote:
> >>>>>>>> mem2mem is just like the decoder in the compress pipeline. which=
 is
> >>>>>>>> one of the components in the pipeline.
> >>>>>>>
> >>>>>>> I was thinking of loopback with endpoints using compress streams,
> >>>>>>> without physical endpoint, something like:
> >>>>>>>
> >>>>>>> compress playback (to feed data from userspace) -> DSP (processin=
g) ->
> >>>>>>> compress capture (send data back to userspace)
> >>>>>>>
> >>>>>>> Unless I'm missing something, you should be able to process data =
as fast
> >>>>>>> as you can feed it and consume it in such case.
> >>>>>>>
> >>>>>>
> >>>>>> Actually in the beginning I tried this,  but it did not work well.
> >>>>>> ALSA needs time control for playback and capture, playback and cap=
ture
> >>>>>> needs to synchronize.  Usually the playback and capture pipeline i=
s
> >>>>>> independent in ALSA design,  but in this case, the playback and ca=
pture
> >>>>>> should synchronize, they are not independent.
> >>>>>
> >>>>> The core compress API core no strict timing constraints. You can ev=
entually0
> >>>>> have two half-duplex compress devices, if you like to have really i=
ndependent
> >>>>> mechanism. If something is missing in API, you can extend this API =
(like to
> >>>>> inform the user space that it's a producer/consumer processing with=
out any
> >>>>> relation to the real time). I like this idea.
> >>>>
> >>>> I was thinking more about this. If I am right, the mentioned use in =
gstreamer
> >>>> is supposed to run the conversion (DSP) job in "one shot" (can be ha=
ndled
> >>>> using one system call like blocking ioctl).  The goal is just to off=
load the
> >>>> CPU work to the DSP (co-processor). If there are no requirements for=
 the
> >>>> queuing, we can implement this ioctl in the compress ALSA API easily=
 using the
> >>>> data management through the dma-buf API. We can eventually define a =
new
> >>>> direction (enum snd_compr_direction) like SND_COMPRESS_CONVERT or so=
 to allow
> >>>> handle this new data scheme. The API may be extended later on real d=
emand, of
> >>>> course.
> >>>>
> >>>> Otherwise all pieces are already in the current ALSA compress API
> >>>> (capabilities, params, enumeration). The realtime controls may be cr=
eated
> >>>> using ALSA control API.
> >>>
> >>> So does this mean that Shengjiu should attempt to use this ALSA appro=
ach first?
> >>
> >> I've not seen any argument to use v4l2 mem2mem buffer scheme for this
> >> data conversion forcefully. It looks like a simple job and ALSA APIs
> >> may be extended for this simple purpose.
> >>
> >> Shengjiu, what are your requirements for gstreamer support? Would be a
> >> new blocking ioctl enough for the initial support in the compress ALSA
> >> API?
> >
> > If it works with compress API, it'd be great, yeah.
> > So, your idea is to open compress-offload devices for read and write,
> > then and let them convert a la batch jobs without timing control?
> >
> > For full-duplex usages, we might need some more extensions, so that
> > both read and write parameters can be synchronized.  (So far the
> > compress stream is a unidirectional, and the runtime buffer for a
> > single stream.)
> >
> > And the buffer management is based on the fixed size fragments.  I
> > hope this doesn't matter much for the intended operation?
>
> It's a question, if the standard I/O is really required for this case. My
> quick idea was to just implement a new "direction" for this job supportin=
g
> only one ioctl for the data processing which will execute the job in "one
> shot" at the moment. The I/O may be handled through dma-buf API (which se=
ems
> to be standard nowadays for this purpose and allows future chaining).
>
> So something like:
>
> struct dsp_job {
>     int source_fd;     /* dma-buf FD with source data - for dma_buf_get()=
 */
>     int target_fd;     /* dma-buf FD for target data - for dma_buf_get() =
*/
>     ... maybe some extra data size members here ...
>     ... maybe some special parameters here ...
> };
>
> #define SNDRV_COMPRESS_DSPJOB _IOWR('C', 0x60, struct dsp_job)
>
> This ioctl will be blocking (thus synced). My question is, if it's feasib=
le
> for gstreamer or not. For this particular case, if the rate conversion is
> implemented in software, it will block the gstreamer data processing, too=
.
>

Thanks.

I have several questions:
1.  Compress API alway binds to a sound card.  Can we avoid that?
     For ASRC, it is just one component,

2.  Compress API doesn't seem to support mmap().  Is this a problem
     for sending and getting data to/from the driver?

3. How does the user get output data from ASRC after each conversion?
   it should happen every period.

best regards
Shengjiu Wang.
