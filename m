Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5075E596E5A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 14:22:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M76bJ1zKjz3cdb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 22:22:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZmXBDgwk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZmXBDgwk;
	dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6ymj64hYz2xTj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 16:29:56 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id a9so17777534lfm.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 23:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=4SgT5pbfJV5jtJwVT4KwHHssFjdmNFDrkGYbVTjUcI4=;
        b=ZmXBDgwkrprFGVxsEY4qibZB3VjHuNlq4XjdghCFnOaBZ53JmPzG7BafN4OgI/Gwkx
         CXztmoYQ+53wU6DfDSZNMkNxE9VNQauQ8Ej+yEVdSnBT/KFeRk1tUQAJPT+YXPcGr2bm
         O9qB9UORy2btknxh4MYkRDdSIQUcnuEwy2fxAbL0fIlJ0ZzJUs7U/oN+P4c4fh5X9u2E
         6vz81EROflEzMZcWXTQvSY+gpMfzcy4niST1Xl+ixpGBTFgEgnhw6mabdUZ2oxMEBwku
         KqvqsSykbrfDgCFBB1M6BnO9Ba84mf8myQjq1CRDzNiIPhVk0qMXwOelfbQ2PkAv/DLi
         LbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=4SgT5pbfJV5jtJwVT4KwHHssFjdmNFDrkGYbVTjUcI4=;
        b=E+W9WGLRUy4yd5cnwPcNAuW48AdBNVGOAuFM1h8Q1qP9NIwZ3UvxgI0kPsPe8hU8IF
         RnXlLnVB9Q2Dhpt4DI7F8huVJleYTEJphMMSYJIB1jIRwgpEasFtmbWwT/noiG/9K3j/
         RvBRdqM7x8b/WST/YsgLgY02Rz2JOkCVIVE8q9/bMImWes7BFPoSS3fMgBto0kiQq/bK
         r2KiVhgSvmVOlpmuKx8tCqbXNEbU7Zgo8ZFUxxvgaqcT4KzE5XhjxP5q8qNdZrL6A6K/
         ZzerqSyq0JT2iRVLEwpgSr59f363viel/dWUHkxGO94XSwIcaEjkzbIln9vRltpMr3oa
         gB6Q==
X-Gm-Message-State: ACgBeo3wKsBXzCncLAzMbvUIET4WfCGRmcm3bF+SEs830wUFA4H3Mkih
	+AJuDoll2594u3H0Az9i6QBIPS91BrbkTLFPozDyWWQL
X-Google-Smtp-Source: AA6agR5EzgrxNpww9gn0/xR+gDsl8dDNkhTd/sqnxn6Vcy711148ZU+ZAloY5lzTRs4TqxZArtDaiCapmgDOUexQdls=
X-Received: by 2002:a05:6512:3d26:b0:48b:40d4:2ce0 with SMTP id
 d38-20020a0565123d2600b0048b40d42ce0mr9100158lfv.531.1660717793694; Tue, 16
 Aug 2022 23:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <1660713867-26921-1-git-send-email-shengjiu.wang@nxp.com> <CAGoOwPT1tP-HP+0J1ddZ0Ea+67zzLzFFTeptTpNwkzxRK45b5g@mail.gmail.com>
In-Reply-To: <CAGoOwPT1tP-HP+0J1ddZ0Ea+67zzLzFFTeptTpNwkzxRK45b5g@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 17 Aug 2022 14:29:42 +0800
Message-ID: <CAA+D8AP2okZdD0YBWrxKGAxvp014S+R-dUSrPqbQN_ja3U5D2Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Remove unnecessary FIFO reset in ISR
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002a56f105e669fe53"
X-Mailman-Approved-At: Wed, 17 Aug 2022 22:21:49 +1000
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000002a56f105e669fe53
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 17, 2022 at 2:21 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:

> On Tue, Aug 16, 2022 at 10:41 PM Shengjiu Wang <shengjiu.wang@nxp.com>
> wrote:
> >
> > The FIFO reset drops the words in the FIFO, which may cause
> > channel swap when SAI module is running, especially when the
> > DMA speed is low. So it is not good to do FIFO reset in ISR,
> > then remove the operation.
>
> I don't recall the details of adding this many years ago, but
> leaving underrun/overrun errors unhandled does not sound right
> to me either. Would it result in a channel swap also? Perhaps
> there needs to be a reset routine that stops and restarts the
> DMA as well?
>

Remove the reset, the channel swap is gone.

IMO, no need to handle the underrun/overrun in driver, the SAI
hardware can handle the read/write pointer itself when xrun happen,
and we don't need reset routine.

For ESAI, because it can't handle read/write pointer correctly when
xrun happen, so we need reset routine.

Best regards
Wang shengjiu

--0000000000002a56f105e669fe53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 17, 2022 at 2:21 PM Nicol=
in Chen &lt;<a href=3D"mailto:nicoleotsuka@gmail.com">nicoleotsuka@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Tue, Aug 16, 2022 at 10:41 PM Shengjiu Wang &lt;<a href=3D"mailto:sheng=
jiu.wang@nxp.com" target=3D"_blank">shengjiu.wang@nxp.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; The FIFO reset drops the words in the FIFO, which may cause<br>
&gt; channel swap when SAI module is running, especially when the<br>
&gt; DMA speed is low. So it is not good to do FIFO reset in ISR,<br>
&gt; then remove the operation.<br>
<br>
I don&#39;t recall the details of adding this many years ago, but<br>
leaving underrun/overrun errors unhandled does not sound right<br>
to me either. Would it result in a channel swap also? Perhaps<br>
there needs to be a reset routine that stops and restarts the<br>
DMA as well?<br></blockquote><div><br></div><div>Remove the reset, the chan=
nel swap is gone.</div><div><br></div><div>IMO, no need to handle the under=
run/overrun in driver, the SAI</div><div>hardware can handle the read/write=
 pointer itself when xrun happen,</div><div>and we don&#39;t need reset rou=
tine.</div><div><br></div><div>For ESAI, because it can&#39;t handle read/w=
rite pointer correctly when</div><div>xrun happen, so we need reset routine=
.</div><div><br></div><div>Best regards</div><div>Wang shengjiu</div><div>=
=C2=A0<br></div></div></div>

--0000000000002a56f105e669fe53--
