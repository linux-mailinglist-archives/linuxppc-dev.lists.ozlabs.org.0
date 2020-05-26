Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A705E1E2FA6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 21:59:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WlD454GlzDqLy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 05:59:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.196;
 helo=mail-qt1-f196.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Wl9H25KXzDqD5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 05:57:06 +1000 (AEST)
Received: by mail-qt1-f196.google.com with SMTP id c12so7371700qtq.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 12:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tv568JygARptrMAgf1Gov6V8e1gDgQj+1HZxw3kgZEU=;
 b=Bytn0AwfO+LqJVblelbsGvsoRger+KzS9+auqbAyfy+10WmKisJ8OdMhpabzp7IAV9
 SqduJKtKgIXR5WSsDMPcqa5+lb6geoxy+zeTAAldH8sd1xOOTmFBpVgO5WIFrYcRPtnH
 LKlX3FZvseWJGshlO3PTa9a1Gknnm1rGg4ZVbUW5XU5ezihiphDKoB2sbKHyYdZkBbMO
 X/AtpEnlPkGeh4UfQSs1VnkU+/OCMYU8IN4JQ7Qy19GXLkF3aXaKHc1HsMuQDGYXDgSf
 1vsYGCr+c7pZyP/yEXvq/UhkyMUkJsXEYjXUZVtUCUFwGwTtDCJTU2oWr9lyfXktAfQP
 gg8w==
X-Gm-Message-State: AOAM530IkOF3hLl6uxvcbnZwIzaCmA67nkvyd8rihxuDdAVSKRsMjACX
 dOAh6tsyQDafOd0XLBWPCa0RMCiizu4=
X-Google-Smtp-Source: ABdhPJw3oOYbVCkUgD0MXnXWW4zOclF7FBGTtuYTigjffT7jA8T3nYeKW50/X4eJe3suvqdOg08fWQ==
X-Received: by 2002:ac8:339c:: with SMTP id c28mr538476qtb.9.1590523022596;
 Tue, 26 May 2020 12:57:02 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com.
 [209.85.222.173])
 by smtp.gmail.com with ESMTPSA id e34sm582376qtb.21.2020.05.26.12.57.01
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 12:57:02 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id w3so16476201qkb.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 12:57:01 -0700 (PDT)
X-Received: by 2002:a37:ecc:: with SMTP id 195mr457918qko.469.1590523021692;
 Tue, 26 May 2020 12:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200518221904.GA22274@embeddedor>
 <202005181529.C0CB448FBB@keescook>
 <CADRPPNR-Croux9FgnrQJJmdF2jNnuAmC+2xMJSgSbkbRv9u8Mw@mail.gmail.com>
 <202005202022.588918E61@keescook>
 <CADRPPNTuUUVOHs76JVzELcsyRH_LSi2PGML1t2wob+45LJCXvA@mail.gmail.com>
 <VE1PR04MB67682776BDC5682B3B330D6A91B30@VE1PR04MB6768.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB67682776BDC5682B3B330D6A91B30@VE1PR04MB6768.eurprd04.prod.outlook.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 26 May 2020 14:56:33 -0500
X-Gmail-Original-Message-ID: <CADRPPNSX9cRjuogv1W1TCGzdn0uJWZ3_QBrjDKfdHgaSq0JLdQ@mail.gmail.com>
Message-ID: <CADRPPNSX9cRjuogv1W1TCGzdn0uJWZ3_QBrjDKfdHgaSq0JLdQ@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: Replace one-element array and use
 struct_size() helper
To: Qiang Zhao <qiang.zhao@nxp.com>
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
Cc: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 24, 2020 at 9:49 PM Qiang Zhao <qiang.zhao@nxp.com> wrote:
>
> On Wed, May 23, 2020 at 5:22 PM Li Yang <leoyang.li@nxp.com>
> > -----Original Message-----
> > From: Li Yang <leoyang.li@nxp.com>
> > Sent: 2020=E5=B9=B45=E6=9C=8823=E6=97=A5 5:22
> > To: Kees Cook <keescook@chromium.org>
> > Cc: Gustavo A. R. Silva <gustavoars@kernel.org>; Qiang Zhao
> > <qiang.zhao@nxp.com>; linuxppc-dev <linuxppc-dev@lists.ozlabs.org>;
> > moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> > <linux-arm-kernel@lists.infradead.org>; lkml <linux-kernel@vger.kernel.=
org>;
> > Gustavo A. R. Silva <gustavo@embeddedor.com>
> > Subject: Re: [PATCH] soc: fsl: qe: Replace one-element array and use
> > struct_size() helper
> >
> > On Wed, May 20, 2020 at 10:24 PM Kees Cook <keescook@chromium.org>
> > wrote:
> > >
> > > On Wed, May 20, 2020 at 06:52:21PM -0500, Li Yang wrote:
> > > > On Mon, May 18, 2020 at 5:57 PM Kees Cook <keescook@chromium.org>
> > wrote:
> > > > > Hm, looking at this code, I see a few other things that need to b=
e
> > > > > fixed:
> > > > >
> > > > > 1) drivers/tty/serial/ucc_uart.c does not do a be32_to_cpu() conv=
ersion
> > > > >    on the length test (understandably, a little-endian system has=
 never
> > run
> > > > >    this code since it's ppc specific), but it's still wrong:
> > > > >
> > > > >         if (firmware->header.length !=3D fw->size) {
> > > > >
> > > > >    compare to the firmware loader:
> > > > >
> > > > >         length =3D be32_to_cpu(hdr->length);
> > > > >
> > > > > 2) drivers/soc/fsl/qe/qe.c does not perform bounds checking on th=
e
> > > > >    per-microcode offsets, so the uploader might send data outside=
 the
> > > > >    firmware buffer. Perhaps:
> > > >
> > > > We do validate the CRC for each microcode, it is unlikely the CRC
> > > > check can pass if the offset or length is not correct.  But you are
> > > > probably right that it will be safer to check the boundary and fail
> > >
> > > Right, but a malicious firmware file could still match CRC but trick
> > > the kernel code.
> > >
> > > > quicker before we actually start the CRC check.  Will you come up
> > > > with a formal patch or you want us to deal with it?
> > >
> > > It sounds like Gustavo will be sending one, though I don't think
> > > either of us have the hardware to test it with, so if you could do
> > > that part, that would be great! :)
> >
> > That will be great.  I think Zhao Qiang can help with the testing part.
> >
>
> Now the firmware are loaded in uboot, and kernel will do nothing for it.
> So testing on it maybe need some extra codes both in driver and dts.
> In the meanwhile, I am so busy on some high priority work that maybe test=
 work
> could not be done in time.
> Once I am free, I will do it.

Thanks.  You are right that most of the QE drivers doesn't support
requesting firmware in kernel except the ucc_uart.  So it probably can
be tested with that driver without requiring code change.

>
> Best Regards
> Qiang Zhao
