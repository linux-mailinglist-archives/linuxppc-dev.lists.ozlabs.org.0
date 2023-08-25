Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E481B787EB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 05:47:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ljBfsTIH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RX5WL3XD4z3cC2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 13:47:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ljBfsTIH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RX5VT6Xrvz2yhP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 13:46:57 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-26f3e26e59cso400101a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 20:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692935214; x=1693540014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qB6+Vu7s9lxHf8Fx4gWkeSYU67OaMytC2iSqtBmoLVk=;
        b=ljBfsTIHdj+THurnUJY9Q3Sq9IfUIi77gE/yNw2gmAC+84GWujzjx76TMozHgVEGNS
         V7NAEiAifM6vGmPfqnlILA5xquv4H+8WoGTj6XZY11Zke7HL7k1FpP2dlyxj5Hq05gvr
         lgA0xbVoYtxkH4VqRp82CKvB5ClKqCNMELgmv9Qwk+gPsdYgJTm1i27ooxQqxMZsYuU2
         hYLY3W03ow77kEDE81jbZ0mqjlVf19PLhXhlkB2NoS8sgOAfgt2zoQ3T6UmwlZDAZQmS
         EgnnoNL4ZoxSVPMEIIF/Hge284EC6EouaCacLzdJi4f6bB8czhPD6PJEZkmtV67f7t/b
         xKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692935214; x=1693540014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qB6+Vu7s9lxHf8Fx4gWkeSYU67OaMytC2iSqtBmoLVk=;
        b=UVOVPK/nM9paMAIxIMS8U8gxvmrS8WeLsdmzJ3KTXoPVlPDTIB0NB9bfApIx8GoDPu
         F5zmjHHS5jVEG46la8qdnjXJrR9kTvOYJxzECEiNwYFakNK3LpR/NUF6J/pDoBpCtTN2
         bTSrHOe7dH+ALZlPvg2aGl0fDWp09HYs+jkB+pA725/WjmMEdKIo9lb0EkfgQY6nGJmo
         c+u78flht9lAQXzapnFxH18H9WjDEg3rHuBbZJjqNN9sUFf3Ljjni8qlMkSn8DZKRCQi
         7QKCeQLaGHsbkXGNz8gsK9zhTAcXMCfWx5aoxd4NMFyEyGavDuxD2ow79Nr3VReAC1ih
         MkhQ==
X-Gm-Message-State: AOJu0Yyg8NQ24g0UV1ORDC/KopncQiyPjtScVhXswE/M4q+CTYjDoXzy
	xJJAtonVY8w+uLqKYTx3q7c1qS2wfSJKI9/sVPw=
X-Google-Smtp-Source: AGHT+IHK3AwqFQWMgaDzKk8ascCxkGB5tB9Avd+eUPD79D7He/OxN5Qk96BRyCrHm2z3LsdodV02Rb8pqGONulPKObU=
X-Received: by 2002:a17:90a:7408:b0:26b:513a:30b0 with SMTP id
 a8-20020a17090a740800b0026b513a30b0mr26760961pjg.10.1692935214239; Thu, 24
 Aug 2023 20:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
 <87il9xu1ro.wl-tiwai@suse.de> <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
 <87il9xoddo.wl-tiwai@suse.de> <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
 <844ef9b6-d5e2-46a9-b7a5-7ee86a2e449c@sirena.org.uk> <CAA+D8AOnsx+7t3MrWm42waxtetL07nbKURLsh1hBx39LUDm+Zg@mail.gmail.com>
 <CAA+D8AMriHO60SD2OqQSDMmi7wm=0MkoW6faR5nyve-j2Q5AEQ@mail.gmail.com>
 <CAA+D8AN34-NVrgksRAG014PuHGUssTm0p-KR-HYGe+Pt8Yejxg@mail.gmail.com>
 <87wmxk8jaq.wl-tiwai@suse.de> <ZOe74PO4S6bj/QlV@finisterre.sirena.org.uk>
In-Reply-To: <ZOe74PO4S6bj/QlV@finisterre.sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 25 Aug 2023 11:46:43 +0800
Message-ID: <CAA+D8AM_pqbjQaE59n6Qm5gypLb8zPAwOpJR+_ZEG89-q3B8pg@mail.gmail.com>
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

On Fri, Aug 25, 2023 at 4:21=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Aug 24, 2023 at 07:03:09PM +0200, Takashi Iwai wrote:
> > Shengjiu Wang wrote:
>
> > > But there are several issues:
> > > 1. Need to create sound cards.  ASRC module support multi instances, =
then
> > > need to create multi sound cards for each instance.
>
> > Hm, why can't it be multiple PCM instances instead?
>
> I'm having a hard time following this one too.
>
> > > 2. The ASRC is an entirety but with DPCM we need to separate input po=
rt and
> > > output port to playback substream and capture stream. Synchronous bet=
ween
> > > playback substream and capture substream is a problem.
> > > How to start them and stop them at the same time.
>
> > This could be done by enforcing the full duplex and linking the both
> > PCM streams, I suppose.
>
> > > So shall we make the decision that we can go to the V4L2 solution?
>
> > Honestly speaking, I don't mind much whether it's implemented in V2L4
> > or not -- at least for the kernel part, we can reorganize / refactor
> > things internally.  But, the biggest remaining question to me is
> > whether this user-space interface is the most suitable one.  Is it
> > well defined, usable and maintained for the audio applications?  Or
> > is it meant to be a stop-gap for a specific use case?
>
> I'm having a really hard time summoning much enthusiasm for using v4l
> here, it feels like this is heading down the same bodge route as DPCM
> but directly as ABI so even harder to fix properly.  That said all the
> ALSA APIs are really intended to be used in real time and this sounds
> like a non real time application?  I don't fully understand what the
> actual use case is here.

Thanks for your reply.

This asrc memory to memory (memory ->asrc->memory) case is a non
real time use case.

User fills the input buffer to the asrc module,  after conversion, then asr=
c
sends back the output buffer to user. So it is not a traditional ALSA playb=
ack
and capture case. I think it is not good to create sound card for it,  it i=
s
not a sound card actually.

It is a specific use case,  there is no reference in current kernel.
v4l2 memory to memory is the closed implementation,  v4l2 current
support video, image, radio, tuner, touch devices, so it is not
complicated to add support for this specific audio case.

Maybe you can go through these patches first.  Because we
had implemented the "memory -> asrc ->i2s device-> codec"
use case in ALSA.  Now the "memory->asrc->memory" needs
to reuse the code in asrc driver, so the first 3 patches is for refining
the code to make it can be shared by the "memory->asrc->memory"
driver.

The main change is in the v4l2 side, A /dev/vl42-audio will be created,
user applications only use the ioctl of v4l2 framework.

Best regards
Wang Shengjiu
