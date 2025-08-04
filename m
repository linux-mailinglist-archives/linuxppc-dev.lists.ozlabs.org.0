Return-Path: <linuxppc-dev+bounces-10598-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EB7B1A723
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 18:26:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwhlW0gV9z3blg;
	Tue,  5 Aug 2025 02:26:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::835"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754324807;
	cv=none; b=MDL3ZzheGk0JpA3MVfitgsKrIZv6v2w7RUdIhjrazdyYm5l107Kf+MeDtCsfVBRhI0brZ0hIXDh1R6KNXTqgvUPLtXEkViieh51BnM6i/ekgQp+SoKOQW/zhMqTkoeRI7gRAjaSHEPRSyIGLVHY+bei5rB5+l4ZFMiaWxJ6GQPomf67BRvqpYqTbZ9U3mmlt8eIkmYPpYIaaGwWuF2Dmq3F38KUYk/EHK4VVImwi0N59tFGRu/FDczS/oqwFvMD3KNb4Bk5EaV1A/+8r4i/Tv1oWg0DSJgx6m5LNBEIJFEhEWwucfV5mMvri5ubyLHo0tcM5KwPo5krQpSorRYRb2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754324807; c=relaxed/relaxed;
	bh=NknhL1IcmeARXj3OrSV5pQAnt7dpMiWpwVnIOc0gMec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gz86tq+CKnqNkyKh/ILneoKYcXHMa+9jt1/kscceZKOqfwXZ45ibXzsHdQEhyPVhiolJWSSZ9DATyRyXl8RgGPUcSQbP3uQ4+THKkHss8Gu86+PmzdSGcF1VDrZRY3WkGgbrqluy6PlCsQzETDKZ5KrFvzMEMBN1L+QoSCEsqyaAAJEOTZntd570rCTBSW9ZXDIqrImd8ch/W1wy/j2y7xuY8ulDcXG5PIGt6YsT/Eh5FdKAPtAA6BbBD9EHhZuXKQ13dJnC1R8YLhv2pMFrKjrxyVeJdxZfmEe5jMGSOn77tWBsbIkOwq/7IZ+OGK9HNDKp4KbX98HTf6zZWROSBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fWgkd5xn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=madskateman@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fWgkd5xn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=madskateman@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwhlT34tSz3bjG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 02:26:44 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4b0619a353dso11438121cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Aug 2025 09:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754324801; x=1754929601; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NknhL1IcmeARXj3OrSV5pQAnt7dpMiWpwVnIOc0gMec=;
        b=fWgkd5xn94Cv/K4qxEmEC6W1XGRPRat2tEweBHdNFQSsDWetK67dmol3XLZmedG12Q
         2JX0t4/tBVpxUNNHForIcrtuCDfYA5MzUpMquCzZJawimnybZp34uV+Q4ABg+mGt0o67
         KIDtww0zkg9fAUT+jJ6Kz7okU4dAre2epU/osOChoA8mQQr7TWkjTPZFQVrEsCLwjumT
         1+mAYxmMWSWFcX22X0qH3qQoNPXS7Sdaw9YieNmPMfKl3w03p6kmhaMUbRQfdlDozbr3
         JFENO5Jl+SUxc/S1TPlLs7ijjwPfRfY1eN3lm7WjAUQu7uoRPamwRQqYzq9cex+EcLRc
         54UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754324801; x=1754929601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NknhL1IcmeARXj3OrSV5pQAnt7dpMiWpwVnIOc0gMec=;
        b=aLcMll0oaBO62o1Kz1Zcus3di3ex3wqy9k+G+xmEuCymbbxsGSZxISoJI4FS1cRHe6
         zhxZd8p1lMtZAkm5bYd4bbpXu/hvqEETyVZSLfTx/JRzXzg9O0bxB+INxWMjKwCWQ3CF
         KFEtiv521zxJ/RG1jjj6m+CLJPfkuTYSsaiR2qZzxew7QtaEXW4un3G6r/lOEyklzbMD
         dtfvPvdxTDtM0HV4wb4z4clUiU4BPCVba9uRaPcZse5VN/rix5Jp2jbHPQazWyUUA8R6
         7XqC3bT+vCVu/9BX6P+t0OVMQJJL8lurl8Wvd3tLhi/wo6Xh1eeV7xM3UrgJadr8k1h4
         cgKg==
X-Forwarded-Encrypted: i=1; AJvYcCV3m06XMnrKhlZT7XJJNlXBhjpsxKujcLYww29fx4gUjatj40cSD8KjRg1brfk+qFNF3jvaCQ28rFdQk9c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzFT3kYAZjU9TnlYYSSHb0WbUCjU5jnoE55tc0CkBaa3XZ0NMPm
	0Eo2df6Njc17j96sAJ78BFW7zc9QnpCWBdDn5m5LttezdnPgNB7fmLJj2uEX5xQdnvKejaSyat/
	CTTF0fyml7tLCVIaEt8b9wNSJFQj7N/0=
X-Gm-Gg: ASbGncsircM/oklU4uXGJOAmrdimdDdxxIXe8v8pn4hMrEvLMvlybg/OdYozjp3bffO
	SP3lfp0JUiK+BI1dft9j3J8Mmq1v8UKBK7dUEapNpO2o3JreP13uRH6Ju7rRb0dHQqd1MUtbXSz
	OjchvQGFUh85ikYpOCtv6bes0wr+2m5SFZ6+APYje+NDTlwhZ6/1YjFX+fiGp9BbWMMSCwwMItQ
	tigHA==
X-Google-Smtp-Source: AGHT+IH6dG/dlCV5t1PxSaQtTfuNsycmLFbdgGSdR8dSFa8CWvmEoX/+niNzIHukpM1bHoPU+7oawLFY7bL0v84dB+U=
X-Received: by 2002:ac8:5801:0:b0:4ab:81c7:b992 with SMTP id
 d75a77b69052e-4af10d60327mr160132761cf.41.1754324801022; Mon, 04 Aug 2025
 09:26:41 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <CADnq5_PUi_2+kDYX8R_eanNF4iYN79MdXJ_PLcQbZKi6e4S8tg@mail.gmail.com>
 <87F47F04-EBAC-48D6-AD0A-4BBE39DF43CE@xenosoft.de> <1115cce7-cfdc-4c5b-b017-69cd32425650@xenosoft.de>
 <6ba8d730-52f9-421f-8d8a-887545f0ceac@xenosoft.de> <2cc83897-427d-47f4-b6a3-8db9682972cd@xenosoft.de>
 <CADnq5_OpJdbc4YKtV-9+5JyeKyqd4+irhT6OtFq_K9KJF24VSQ@mail.gmail.com> <48b61c14-f83d-4e4a-b5d3-857099058eda@xenosoft.de>
In-Reply-To: <48b61c14-f83d-4e4a-b5d3-857099058eda@xenosoft.de>
From: mad skateman <madskateman@gmail.com>
Date: Mon, 4 Aug 2025 18:26:30 +0200
X-Gm-Features: Ac12FXzkQvw4IcGmNHrnHbcvYwQ6GdMDwcwiV_Hi9qOSruFfEiVEmIlANbBPG1E
Message-ID: <CAHkrCmHKSR+3gCjs7E=Qnini_CCEa+wjx9gWNPMjSWWFOScQtw@mail.gmail.com>
Subject: Re: radeon_fbdev_river_fbdev: failed to initialize framebuffer and
 setup emulation
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Alex Deucher <alexdeucher@gmail.com>, ville.syrjala@linux.intel.com, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, Darren Stevens <darren@stevens-zone.net>, 
	hypexed@yahoo.com.au, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	Christian Zigotzky <info@xenosoft.de>, =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>, amd-gfx@lists.freedesktop.org, 
	Alex Deucher <alexander.deucher@amd.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>
Content-Type: multipart/alternative; boundary="00000000000095f1d6063b8c927e"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--00000000000095f1d6063b8c927e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am using the R580 chip which is the Radeon X1950 XT.

The board i am using is a T1042 PowerPC based one with e5500 core.

I also lost the ability to start Xorg and therefore just a blank screen.

Dave





Op ma 4 aug 2025, 18:04 schreef Christian Zigotzky <chzigotzky@xenosoft.de>=
:

>
> On 04 August 2025 at 04:42 pm, Alex Deucher wrote:
> > On Sun, Aug 3, 2025 at 11:28=E2=80=AFAM Christian Zigotzky
> > <chzigotzky@xenosoft.de> wrote:
> >>
> >> Hello,
> >>
> >> I have the same issue on another machine either. Blank screen during t=
he
> >> boot. The Radeon graphics framebuffer device doesn't work anymore.
> >>
> >> Here is the modifed code from the DRM updates (drm-next-2025-07-30):
> >>
> >> -
> >>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/di=
ff/drivers/gpu/drm/radeon/radeon_fbdev.c?id=3D260f6f4fda93c8485c8037865c941=
b42b9cba5d2
> >> -
> >>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/di=
ff/drivers/gpu/drm/radeon/radeon_drv.c?id=3D260f6f4fda93c8485c8037865c941b4=
2b9cba5d2
> >
> > This change just bumps the driver version it shouldn't affect the fbdev=
.
> >
> >> -
> >>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/di=
ff/drivers/gpu/drm/radeon/radeon_display.c?id=3D260f6f4fda93c8485c8037865c9=
41b42b9cba5d2
> >> -
> >>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/di=
ff/drivers/gpu/drm/radeon/evergreen_cs.c?id=3D260f6f4fda93c8485c8037865c941=
b42b9cba5d2
> >
> > This only affects acceleration, it should not affect fbdev.
> >
> > What chip are you using?  Can you attach your full dmesg output?  Can
> > you bisect?  This cultrit could be a core drm change.
> >
> > Alex
> >
> >>
> >> Do you have a patch for reverting these modifications? I would like to
> >> revert these modifications for testing.
> >>
> >> Thanks in advance,
> >> Christian
> >>
> >> On 03 August 2025 at 1:35 pm, Christian Zigotzky wrote:
> >>> Hello,
> >>>
> >>> Xorg doesn't work after the DRM updates drm-next-2025-07-30.
> >>>
> >>> Error messages:
> >>>
> >>> [dr:.radeon_fbdev_river_fbdev_proe] *ERROR* failed to initialize
> >>> framebuffer -22
> >>> radeon 0000:01:0.0: [drm] *ERRO* fbdev: Failedto setup emulaton
> (ret=3D-22)
> >>> brd module loadedm
> >>> lop: module loadd
> >>> mpt3ss version 52.10.00.00 loaded
> >>> nve nvme0: pci fuction 0002:04:0.0
> >>> fsl-sata ffe20000.sata: SataFSL Platform/CS Driver init
> >>> scs host0: sata_fs
> >>> ta1: SATA max DMA/133 irq 68 pm-pol 0
> >>> ;21;39mfsl-sat ffe221000.sata Sata FSL Platfrm/CSB Driver iit
> >>> ata1: Signatue Update detectd @ 0 msecs
> >>> scsihost1: sata_fsl[0m
> >>> ta2: SATA max UMA/133 irq 69 lm-pol 0
> >>> nvme nvm0: 4/0/0 defaul/read/poll queus
> >>> nvme0n1: p1 p p3 p4 p5 p6 p7[0m
> >>> drm:.radeon_fbdv_driver_fbdev_robe] *ERROR* filed to initialze
> >>> framebuffer 22
> >>> fsl_dpaa_mac fe4e6000.ethernt: of_get_mac_adress(/soc@ffe00000/
> >>> fman@40000/ethernet@e6000 failed
> >>> radeon 000:01:00.0: [dr] *ERROR* fbdev Failed to setu emulation
> (ret-22)
> >>> fsl_dpaa_ma ffe4e6000.ethenet: FMan MEMAC[0m
> >>> sl_dpaa_mac ffee6000.ethernet:Using random MA address: 0e
> >>>
> >>> Could you please check the latest DRM updates?
> >>>
> >>> Thanks,
> >>> Christian
> >>>
> >>
>
> Hello Alex,
>
> Thanks for your answer.
>
> I use a BARTS chip (Radeon HD6870). I would like to bisect but I don't
> have time for it currently. Sorry
>
> There are some other user reports:
>
> - https://forum.hyperion-entertainment.com/viewtopic.php?p=3D60606#p60606
> - https://forum.hyperion-entertainment.com/viewtopic.php?p=3D60595#p60595
>
> They use other Radeon graphics chips.
>
> Bug report: https://github.com/chzigotzky/kernels/issues/15
>
> What do you think about the following commit?
>
> Link:
>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D0e7d5874fb6b80c44be3cfbcf1cf356e81d91232
>
> @Hypex
> Could you please attach your full dmesg output?
>
> Thanks,
> Christian
>

--00000000000095f1d6063b8c927e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I am using the R580 chip which is the Radeon X1950 XT.<di=
v dir=3D"auto"><br></div><div dir=3D"auto">The board i am using is a T1042 =
PowerPC based one with e5500 core.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">I also lost the ability to start Xorg and therefore just a blank=
 screen.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Dave</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><br></div></div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">Op ma 4 aug 2025, 18:=
04 schreef Christian Zigotzky &lt;<a href=3D"mailto:chzigotzky@xenosoft.de"=
>chzigotzky@xenosoft.de</a>&gt;:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><b=
r>
On 04 August 2025 at 04:42 pm, Alex Deucher wrote:<br>
&gt; On Sun, Aug 3, 2025 at 11:28=E2=80=AFAM Christian Zigotzky<br>
&gt; &lt;<a href=3D"mailto:chzigotzky@xenosoft.de" target=3D"_blank" rel=3D=
"noreferrer">chzigotzky@xenosoft.de</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hello,<br>
&gt;&gt;<br>
&gt;&gt; I have the same issue on another machine either. Blank screen duri=
ng the<br>
&gt;&gt; boot. The Radeon graphics framebuffer device doesn&#39;t work anym=
ore.<br>
&gt;&gt;<br>
&gt;&gt; Here is the modifed code from the DRM updates (drm-next-2025-07-30=
):<br>
&gt;&gt;<br>
&gt;&gt; -<br>
&gt;&gt; <a href=3D"https://web.git.kernel.org/pub/scm/linux/kernel/git/tor=
valds/linux.git/diff/drivers/gpu/drm/radeon/radeon_fbdev.c?id=3D260f6f4fda9=
3c8485c8037865c941b42b9cba5d2" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
diff/drivers/gpu/drm/radeon/radeon_fbdev.c?id=3D260f6f4fda93c8485c8037865c9=
41b42b9cba5d2</a><br>
&gt;&gt; -<br>
&gt;&gt; <a href=3D"https://web.git.kernel.org/pub/scm/linux/kernel/git/tor=
valds/linux.git/diff/drivers/gpu/drm/radeon/radeon_drv.c?id=3D260f6f4fda93c=
8485c8037865c941b42b9cba5d2" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/di=
ff/drivers/gpu/drm/radeon/radeon_drv.c?id=3D260f6f4fda93c8485c8037865c941b4=
2b9cba5d2</a><br>
&gt; <br>
&gt; This change just bumps the driver version it shouldn&#39;t affect the =
fbdev.<br>
&gt; <br>
&gt;&gt; -<br>
&gt;&gt; <a href=3D"https://web.git.kernel.org/pub/scm/linux/kernel/git/tor=
valds/linux.git/diff/drivers/gpu/drm/radeon/radeon_display.c?id=3D260f6f4fd=
a93c8485c8037865c941b42b9cba5d2" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/diff/drivers/gpu/drm/radeon/radeon_display.c?id=3D260f6f4fda93c8485c80378=
65c941b42b9cba5d2</a><br>
&gt;&gt; -<br>
&gt;&gt; <a href=3D"https://web.git.kernel.org/pub/scm/linux/kernel/git/tor=
valds/linux.git/diff/drivers/gpu/drm/radeon/evergreen_cs.c?id=3D260f6f4fda9=
3c8485c8037865c941b42b9cba5d2" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
diff/drivers/gpu/drm/radeon/evergreen_cs.c?id=3D260f6f4fda93c8485c8037865c9=
41b42b9cba5d2</a><br>
&gt; <br>
&gt; This only affects acceleration, it should not affect fbdev.<br>
&gt; <br>
&gt; What chip are you using?=C2=A0 Can you attach your full dmesg output?=
=C2=A0 Can<br>
&gt; you bisect?=C2=A0 This cultrit could be a core drm change.<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; Do you have a patch for reverting these modifications? I would lik=
e to<br>
&gt;&gt; revert these modifications for testing.<br>
&gt;&gt;<br>
&gt;&gt; Thanks in advance,<br>
&gt;&gt; Christian<br>
&gt;&gt;<br>
&gt;&gt; On 03 August 2025 at 1:35 pm, Christian Zigotzky wrote:<br>
&gt;&gt;&gt; Hello,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Xorg doesn&#39;t work after the DRM updates drm-next-2025-07-3=
0.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Error messages:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [dr:.radeon_fbdev_river_fbdev_proe] *ERROR* failed to initiali=
ze<br>
&gt;&gt;&gt; framebuffer -22<br>
&gt;&gt;&gt; radeon 0000:01:0.0: [drm] *ERRO* fbdev: Failedto setup emulato=
n (ret=3D-22)<br>
&gt;&gt;&gt; brd module loadedm<br>
&gt;&gt;&gt; lop: module loadd<br>
&gt;&gt;&gt; mpt3ss version 52.10.00.00 loaded<br>
&gt;&gt;&gt; nve nvme0: pci fuction 0002:04:0.0<br>
&gt;&gt;&gt; fsl-sata ffe20000.sata: SataFSL Platform/CS Driver init<br>
&gt;&gt;&gt; scs host0: sata_fs<br>
&gt;&gt;&gt; ta1: SATA max DMA/133 irq 68 pm-pol 0<br>
&gt;&gt;&gt; ;21;39mfsl-sat ffe221000.sata Sata FSL Platfrm/CSB Driver iit<=
br>
&gt;&gt;&gt; ata1: Signatue Update detectd @ 0 msecs<br>
&gt;&gt;&gt; scsihost1: sata_fsl[0m<br>
&gt;&gt;&gt; ta2: SATA max UMA/133 irq 69 lm-pol 0<br>
&gt;&gt;&gt; nvme nvm0: 4/0/0 defaul/read/poll queus<br>
&gt;&gt;&gt; nvme0n1: p1 p p3 p4 p5 p6 p7[0m<br>
&gt;&gt;&gt; drm:.radeon_fbdv_driver_fbdev_robe] *ERROR* filed to initialze=
<br>
&gt;&gt;&gt; framebuffer 22<br>
&gt;&gt;&gt; fsl_dpaa_mac fe4e6000.ethernt: of_get_mac_adress(/soc@ffe00000=
/<br>
&gt;&gt;&gt; fman@40000/ethernet@e6000 failed<br>
&gt;&gt;&gt; radeon 000:01:00.0: [dr] *ERROR* fbdev Failed to setu emulatio=
n (ret-22)<br>
&gt;&gt;&gt; fsl_dpaa_ma ffe4e6000.ethenet: FMan MEMAC[0m<br>
&gt;&gt;&gt; sl_dpaa_mac ffee6000.ethernet:Using random MA address: 0e<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Could you please check the latest DRM updates?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt; Christian<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
<br>
Hello Alex,<br>
<br>
Thanks for your answer.<br>
<br>
I use a BARTS chip (Radeon HD6870). I would like to bisect but I don&#39;t =
<br>
have time for it currently. Sorry<br>
<br>
There are some other user reports:<br>
<br>
- <a href=3D"https://forum.hyperion-entertainment.com/viewtopic.php?p=3D606=
06#p60606" rel=3D"noreferrer noreferrer" target=3D"_blank">https://forum.hy=
perion-entertainment.com/viewtopic.php?p=3D60606#p60606</a><br>
- <a href=3D"https://forum.hyperion-entertainment.com/viewtopic.php?p=3D605=
95#p60595" rel=3D"noreferrer noreferrer" target=3D"_blank">https://forum.hy=
perion-entertainment.com/viewtopic.php?p=3D60595#p60595</a><br>
<br>
They use other Radeon graphics chips.<br>
<br>
Bug report: <a href=3D"https://github.com/chzigotzky/kernels/issues/15" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/chzigotzky/=
kernels/issues/15</a><br>
<br>
What do you think about the following commit?<br>
<br>
Link: <br>
<a href=3D"https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git/commit/?id=3D0e7d5874fb6b80c44be3cfbcf1cf356e81d91232" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://web.git.kernel.org/pub/scm/linux=
/kernel/git/torvalds/linux.git/commit/?id=3D0e7d5874fb6b80c44be3cfbcf1cf356=
e81d91232</a><br>
<br>
@Hypex<br>
Could you please attach your full dmesg output?<br>
<br>
Thanks,<br>
Christian<br>
</blockquote></div>

--00000000000095f1d6063b8c927e--

