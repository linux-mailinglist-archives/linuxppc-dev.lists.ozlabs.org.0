Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4272A8C0D97
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 11:37:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jv+DGo6D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZn425GCdz3cYN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 19:37:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jv+DGo6D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZn3G1bp2z2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 19:36:56 +1000 (AEST)
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-36c5fa79a6eso2318135ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2024 02:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715247409; x=1715852209; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icJF1CnJVBJloJSGMiGDeLLdcHlpsMMYY04rY+Lcxgw=;
        b=jv+DGo6DEoThHS14mrjuznYekeZq0gMDdfxUy3iOLQ7uzw6RF/8FCdG1KZ+o26gtb0
         v0HUKD1xcHdWOExfyqb8QEqEEgZM8SwMuferROsbB/CtHC3f80699rxzTZ4dlfnj/hTa
         QdBOTlER+J6Z8CoEu1oPFuoYcAO4Nf1wCw8U0kkFk+pDprcq2SzmS5zS57kjoKxkt53t
         K+oYNFY/XffInUy33rJcxEthHUGiDxjG8F9tpLyPgrj72Iat/lFhBiDey/14Xv+kd1Zz
         JTMEX5mbx1pmE12WC7zgyWKbJVhLzeR3zqPVcG9XZ7cy1QNSv8IV76/hLtXkTU7+z4TN
         N39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715247409; x=1715852209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icJF1CnJVBJloJSGMiGDeLLdcHlpsMMYY04rY+Lcxgw=;
        b=AZbpOzhsXN75Qx+ZFPJYNU62s2IXasS8awQ40YZqkch5BxYOHHXuGoQIxizPT1twuQ
         iz9SLuSavDCw9j6Gz53UQMo2Nsgm7eVE8lQ45zgt/1UzY4BxXZJLYYlWwum7iAFQEJaN
         ELGW2ksLos6gQDP6gTCme10xiaiW+zFT/LuTQM+fqe8q7hwaohLuK6ne8ykOolRfc102
         eliY6rYd9Q1k0auWr9VkWRj/N3wBoZram4EI+OeTMuhezgJCib6FjtNztbYf9YJ5On2D
         349eruuIaaLohxAPXuWG6D86PmXFOiiqHwyJ7W8ElD+UXw41DE3oV4zkk6nFtK8TZxFL
         hADg==
X-Forwarded-Encrypted: i=1; AJvYcCU91EBcWS+rJDiSfdIOK4VClJh9LK2rSlkKGJgV7EkMB3gl14B4Sa8yBpWunVOOAKh808FMZZSzRto3H7i1inFIaMG48uONaJCWbQc1Qg==
X-Gm-Message-State: AOJu0Yx/rzankC1yeWfp+K64YYyD45xPhyxLecklgQoqe+uQ5GSS2Mec
	+lNuR7u+Dsy97TM4H1J7gHDQwsT0NP3iAEWS9zUt3MXgHjqOzetneNTgq4aR7SyIEjP5BFHEFWX
	ZpWPQdktmz6VpcGTBF3yRMRC/b8k=
X-Google-Smtp-Source: AGHT+IHMQfSBHy/1AVL9IbmZYx6H7dVJ/ppx2qIzgSdZP+YkzczNvUqE8dIc975+bA41fUNr1I7kZKh8WGTA7uTz8Mg=
X-Received: by 2002:a05:6e02:168a:b0:36a:3c07:9caf with SMTP id
 e9e14a558f8ab-36caed59232mr53903665ab.30.1715247409368; Thu, 09 May 2024
 02:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310> <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
 <20240430172752.20ffcd56@sal.lan> <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
 <87sez0k661.wl-tiwai@suse.de> <20240502095956.0a8c5b26@sal.lan>
 <20240502102643.4ee7f6c2@sal.lan> <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
 <20240503094225.47fe4836@sal.lan> <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl> <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
In-Reply-To: <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 9 May 2024 17:36:38 +0800
Message-ID: <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Sebastian Fricke <sebastian.fricke@collabora.com>, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, sakari.ailus@iki.fi, perex@perex.cz, Mauro Carvalho Chehab <mchehab@kernel.org>, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 8, 2024 at 4:14=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> On 5/8/2024 10:00 AM, Hans Verkuil wrote:
> > On 06/05/2024 10:49, Shengjiu Wang wrote:
> >> On Fri, May 3, 2024 at 4:42=E2=80=AFPM Mauro Carvalho Chehab <mchehab@=
kernel.org> wrote:
> >>>
> >>> Em Fri, 3 May 2024 10:47:19 +0900
> >>> Mark Brown <broonie@kernel.org> escreveu:
> >>>
> >>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrot=
e:
> >>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> >>>>
> >>>>>> There are still time control associated with it, as audio and vide=
o
> >>>>>> needs to be in sync. This is done by controlling the buffers size
> >>>>>> and could be fine-tuned by checking when the buffer transfer is do=
ne.
> >>>>
> >>>> ...
> >>>>
> >>>>> Just complementing: on media, we do this per video buffer (or
> >>>>> per half video buffer). A typical use case on cameras is to have
> >>>>> buffers transferred 30 times per second, if the video was streamed
> >>>>> at 30 frames per second.
> >>>>
> >>>> IIRC some big use case for this hardware was transcoding so there wa=
s a
> >>>> desire to just go at whatever rate the hardware could support as the=
re
> >>>> is no interactive user consuming the output as it is generated.
> >>>
> >>> Indeed, codecs could be used to just do transcoding, but I would
> >>> expect it to be a border use case. See, as the chipsets implementing
> >>> codecs are typically the ones used on mobiles, I would expect that
> >>> the major use cases to be to watch audio and video and to participate
> >>> on audio/video conferences.
> >>>
> >>> Going further, the codec API may end supporting not only transcoding
> >>> (which is something that CPU can usually handle without too much
> >>> processing) but also audio processing that may require more
> >>> complex algorithms - even deep learning ones - like background noise
> >>> removal, echo detection/removal, volume auto-gain, audio enhancement
> >>> and such.
> >>>
> >>> On other words, the typical use cases will either have input
> >>> or output being a physical hardware (microphone or speaker).
> >>>
> >>
> >> All, thanks for spending time to discuss, it seems we go back to
> >> the start point of this topic again.
> >>
> >> Our main request is that there is a hardware sample rate converter
> >> on the chip, so users can use it in user space as a component like
> >> software sample rate converter. It mostly may run as a gstreamer plugi=
n.
> >> so it is a memory to memory component.
> >>
> >> I didn't find such API in ALSA for such purpose, the best option for t=
his
> >> in the kernel is the V4L2 memory to memory framework I found.
> >> As Hans said it is well designed for memory to memory.
> >>
> >> And I think audio is one of 'media'.  As I can see that part of Radio
> >> function is in ALSA, part of Radio function is in V4L2. part of HDMI
> >> function is in DRM, part of HDMI function is in ALSA...
> >> So using V4L2 for audio is not new from this point of view.
> >>
> >> Even now I still think V4L2 is the best option, but it looks like ther=
e
> >> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
> >> a duplication of code (bigger duplication that just add audio support
> >> in V4L2 I think).
> >
> > After reading this thread I still believe that the mem2mem framework is
> > a reasonable option, unless someone can come up with a method that is
> > easy to implement in the alsa subsystem. From what I can tell from this
> > discussion no such method exists.
> >
>
> Hi,
>
> my main question would be how is mem2mem use case different from
> loopback exposing playback and capture frontends in user space with DSP
> (or other piece of HW) in the middle?
>
I think loopback has a timing control,  user need to feed data to playback =
at a
fixed time and get data from capture at a fixed time.  Otherwise there
is xrun in
playback and capture.

mem2mem case: there is no such timing control,  user feeds data to it
then it generates output,  if user doesn't feed data, there is no xrun.
but mem2mem is just one of the components in the playback or capture
pipeline, overall there is time control for whole pipeline,

Best regards
Shengjiu Wang

> Amadeusz
>
