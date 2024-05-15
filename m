Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF618C6D4E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 22:34:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=W7Ne1Jso;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VflMN4v10z3d81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 06:34:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=W7Ne1Jso;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ndufresne.ca (client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com; envelope-from=nicolas@ndufresne.ca; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VflLd4RThz3cWc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 06:34:00 +1000 (AEST)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5b27e8ad4b6so3660883eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 13:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1715805230; x=1716410030; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kjh0Q8ae4fGItVRTadlqDebE3ObDhCbpPXshw412Shw=;
        b=W7Ne1Jso2mNpwxlT0uDmIsJY4Qdgy3J1isoaKVKcbr7whDiekQ4JTmMgljRbq2RM1f
         iTdHcuhwTqdL+f86ImuAVV9ksRNP+Wu6kmL3Bx4/vIQ+2q7+rlyZDJiIVoUVUG6ieK/O
         fGcvo5zi7Cn/Iw9HlKNSl/It7AONVk67aY/4WwrAR8IwhF6IoxtXkuQpgOtq4vSgGD1e
         p8+6kQ8VU3Q/tvJDI1K8vNL+ya0NPH78Lrkd/jEX7z09UgDF3ubF4qgcfEmYyurJo3QC
         JtYNbZqCp2ngK1/13SccThD1lXS0HH8Zt56lAYLuEykZ5URPVScnjb7/lRvkXUEEJJTg
         FIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715805230; x=1716410030;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kjh0Q8ae4fGItVRTadlqDebE3ObDhCbpPXshw412Shw=;
        b=FVdL35DEteTZ4wbChs81+AymP/VCrjNBTEyr8Vgu/g49CGZ7+A4ukueBHKi2pPTE59
         diQ2TQ7TvcoF8fnAGy4rO/kdKvGj9loyFZiOjr14twVb3BRGel03PV2EDbfD4DCX8/SN
         40YdFcg7JWNIWRgyFR2xNLdBvRHFxMRH0fArDozMS4bzeM43Nva6cLD2mz65M+1QQuUh
         evKGt+89WPcD3apfB4xbINc2mklSi0/J729u3A2/ju4jmEuzp+brYRCxp1i8Zsj09FUf
         Yv9nkkdNSCra64rAR/wKTO1ZLsk9+JKJTxFqRPck3Oa/fmaZVkvb8/UR0+FmcdfRwepK
         +PlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU43MEJtmkkxjpTw7sKwfuxDfudLBfh5iH5KTYz8qTA2XKecOk5BLwVNdC4coYHanFmklkybY5pSMPQXVjEpgK5Mv7+NVtldFnnUnmzfA==
X-Gm-Message-State: AOJu0YzLYQG30RHaV0Dw4l9MC2M2uUe9OPQzLv+Ho72tAYYZlT2zw5hL
	DHVWReWWvl9NTzHbS/gvHKpJOSWMqaUCZG++xIoo/pJHXWiZLOU4s8R+AUs/KdI=
X-Google-Smtp-Source: AGHT+IGpuNGz67BonKM3QEPB/sFZYIcZEENCozaweY28mlNI0H0mMZjoKi3C7CRWJO8ukegBjF2hbA==
X-Received: by 2002:a05:6358:4301:b0:192:ba37:f9f1 with SMTP id e5c5f4694b2df-193bb3fc89amr2052014655d.5.1715805230432;
        Wed, 15 May 2024 13:33:50 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:5985::580])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f1cdb25sm67691666d6.76.2024.05.15.13.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 13:33:50 -0700 (PDT)
Message-ID: <a60ee3505e551f3def6cdd7c76942d0fd74bc656.camel@ndufresne.ca>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Date: Wed, 15 May 2024 16:33:48 -0400
In-Reply-To: <e63ec6c8-7da7-4b87-b7ff-a71ff12dcfc1@perex.cz>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
	 <87sez0k661.wl-tiwai@suse.de> <20240502095956.0a8c5b26@sal.lan>
	 <20240502102643.4ee7f6c2@sal.lan>
	 <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
	 <20240503094225.47fe4836@sal.lan>
	 <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
	 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
	 <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
	 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
	 <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
	 <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
	 <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
	 <CAA+D8AMJKPVR99jzYCR5EsbMa8P95jQrDL=4ayYMuz+Cu1d2mQ@mail.gmail.com>
	 <28d423b1-49d8-4180-8394-622b1afd9cd9@perex.cz>
	 <850a80b2-d952-4c14-bd0b-98cb5a5c0233@perex.cz>
	 <c5dbb765-8c93-4050-84e1-c0f63b43d6c2@xs4all.nl>
	 <8a6f84ac-5813-4954-b852-84f5118e607c@perex.cz>
	 <87o7975qcw.wl-tiwai@suse.de>
	 <e63ec6c8-7da7-4b87-b7ff-a71ff12dcfc1@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Sebastian Fricke <sebastian.fricke@collabora.com>, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, sakari.ailus@iki.fi, festevam@gmail.com, Amadeusz =?UTF-8?Q?S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

GStreamer hat on ...

Le mercredi 15 mai 2024 =C3=A0 12:46 +0200, Jaroslav Kysela a =C3=A9crit=C2=
=A0:
> On 15. 05. 24 12:19, Takashi Iwai wrote:
> > On Wed, 15 May 2024 11:50:52 +0200,
> > Jaroslav Kysela wrote:
> > >=20
> > > On 15. 05. 24 11:17, Hans Verkuil wrote:
> > > > Hi Jaroslav,
> > > >=20
> > > > On 5/13/24 13:56, Jaroslav Kysela wrote:
> > > > > On 09. 05. 24 13:13, Jaroslav Kysela wrote:
> > > > > > On 09. 05. 24 12:44, Shengjiu Wang wrote:
> > > > > > > > > mem2mem is just like the decoder in the compress pipeline=
. which is
> > > > > > > > > one of the components in the pipeline.
> > > > > > > >=20
> > > > > > > > I was thinking of loopback with endpoints using compress st=
reams,
> > > > > > > > without physical endpoint, something like:
> > > > > > > >=20
> > > > > > > > compress playback (to feed data from userspace) -> DSP (pro=
cessing) ->
> > > > > > > > compress capture (send data back to userspace)
> > > > > > > >=20
> > > > > > > > Unless I'm missing something, you should be able to process=
 data as fast
> > > > > > > > as you can feed it and consume it in such case.
> > > > > > > >=20
> > > > > > >=20
> > > > > > > Actually in the beginning I tried this,  but it did not work =
well.
> > > > > > > ALSA needs time control for playback and capture, playback an=
d capture
> > > > > > > needs to synchronize.  Usually the playback and capture pipel=
ine is
> > > > > > > independent in ALSA design,  but in this case, the playback a=
nd capture
> > > > > > > should synchronize, they are not independent.
> > > > > >=20
> > > > > > The core compress API core no strict timing constraints. You ca=
n eventually0
> > > > > > have two half-duplex compress devices, if you like to have real=
ly independent
> > > > > > mechanism. If something is missing in API, you can extend this =
API (like to
> > > > > > inform the user space that it's a producer/consumer processing =
without any
> > > > > > relation to the real time). I like this idea.
> > > > >=20
> > > > > I was thinking more about this. If I am right, the mentioned use =
in gstreamer
> > > > > is supposed to run the conversion (DSP) job in "one shot" (can be=
 handled
> > > > > using one system call like blocking ioctl).  The goal is just to =
offload the
> > > > > CPU work to the DSP (co-processor). If there are no requirements =
for the
> > > > > queuing, we can implement this ioctl in the compress ALSA API eas=
ily using the
> > > > > data management through the dma-buf API. We can eventually define=
 a new
> > > > > direction (enum snd_compr_direction) like SND_COMPRESS_CONVERT or=
 so to allow
> > > > > handle this new data scheme. The API may be extended later on rea=
l demand, of
> > > > > course.
> > > > >=20
> > > > > Otherwise all pieces are already in the current ALSA compress API
> > > > > (capabilities, params, enumeration). The realtime controls may be=
 created
> > > > > using ALSA control API.
> > > >=20
> > > > So does this mean that Shengjiu should attempt to use this ALSA app=
roach first?
> > >=20
> > > I've not seen any argument to use v4l2 mem2mem buffer scheme for this
> > > data conversion forcefully. It looks like a simple job and ALSA APIs
> > > may be extended for this simple purpose.
> > >=20
> > > Shengjiu, what are your requirements for gstreamer support? Would be =
a
> > > new blocking ioctl enough for the initial support in the compress ALS=
A
> > > API?
> >=20
> > If it works with compress API, it'd be great, yeah.
> > So, your idea is to open compress-offload devices for read and write,
> > then and let them convert a la batch jobs without timing control?
> >=20
> > For full-duplex usages, we might need some more extensions, so that
> > both read and write parameters can be synchronized.  (So far the
> > compress stream is a unidirectional, and the runtime buffer for a
> > single stream.)
> >=20
> > And the buffer management is based on the fixed size fragments.  I
> > hope this doesn't matter much for the intended operation?
>=20
> It's a question, if the standard I/O is really required for this case. My=
=20
> quick idea was to just implement a new "direction" for this job supportin=
g=20
> only one ioctl for the data processing which will execute the job in "one=
=20
> shot" at the moment. The I/O may be handled through dma-buf API (which se=
ems=20
> to be standard nowadays for this purpose and allows future chaining).
>=20
> So something like:
>=20
> struct dsp_job {
>     int source_fd;     /* dma-buf FD with source data - for dma_buf_get()=
 */
>     int target_fd;     /* dma-buf FD for target data - for dma_buf_get() =
*/
>     ... maybe some extra data size members here ...
>     ... maybe some special parameters here ...
> };
>=20
> #define SNDRV_COMPRESS_DSPJOB _IOWR('C', 0x60, struct dsp_job)
>=20
> This ioctl will be blocking (thus synced). My question is, if it's feasib=
le=20
> for gstreamer or not. For this particular case, if the rate conversion is=
=20
> implemented in software, it will block the gstreamer data processing, too=
.

Yes, GStreamer threading is using a push-back model, so blocking for the ti=
me of
the processing is fine. Note that the extra simplicity will suffer from ioc=
tl()
latency.

In GFX, they solve this issue with fences. That allow setting up the next
operation in the chain before the data has been produced.

In V4L2, we solve this with queues. It allows preparing the next job, while=
 the
processing of the current job is happening. If you look at v4l2convert code=
 in
gstreamer (for simple m2m), it currently makes no use of the queues, it sim=
ply
synchronously process the frames. There is two option, where it does not ma=
tter
that much, or no one is using it :-D Video decoders and encoders (stateful)=
 do
run input / output from different thread to benefit from the queued.

regards,
Nicolas

>=20
> 						Jaroslav
>=20

