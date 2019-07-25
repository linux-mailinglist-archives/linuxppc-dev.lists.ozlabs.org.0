Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F408755E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 19:40:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vfcy67MkzDqQ0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2019 03:40:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lOQLyh4Z"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vfZp2ld4zDqPT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2019 03:38:39 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id n9so17165707pgc.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2019 10:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YcakAwhbTJoGYOpuC9oEF2WLvqGmsUfwK1z2nnLHMx8=;
 b=lOQLyh4ZNknNXbKWG97od/UX1813pei3SQYOlzqfOBssMSPnPm/s9PBy7maBCSRQR+
 6K6LuD8sKfW7wZdMb04oWNrprN/bwJU8opJUc/hN6RVCS3BW5KS+df7hEe4j5phFRaVN
 5xan32Z6xKmFJh4YvSrz+IewIJvJIywhpqXNvxm/g8UixovFxlF9XcS74wn/iNu5vDTN
 jcV59QX4f940eW515Aa+C5zzgAmgb/9KZ8wM7r6Bykq2UrPIOebXD5uUAOf3nZEITFr+
 pUKgyZ/lXzgKGxxqtAGOOqBOpVIGWe1OKpuQIC7HbaWSj1rH1Hcd2+0fPCBLbrtDmd9J
 +ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YcakAwhbTJoGYOpuC9oEF2WLvqGmsUfwK1z2nnLHMx8=;
 b=MBQ4AZIKKwmUwvBgfODsMa+Kgv4LTTux0gt1jeJ2ONG5gRlcNWTLHQOLd/nBdVnbOx
 TVr3LAlZY28TQzXM+2t7Z6Mdwev2eSs7OzGCcM+Uv6lAcZ/KwWXyjQo01OzLVuz2YDhs
 1CCmb2whxq4d7hp/M0PB/niEULFuWXNieX610+iSJHrkyQ2fu0MzMlcXl65+SZaxNYyI
 GEnllxunZZzFHEoaCN5BSZ5I2kMFLP8oD4gavyTpsnSZkK1oWBeWS2l+rzHpwRbsrr41
 D7+4veWunRSzx0ueuR574D772c+8mrPwzykhltKJKIZy7KXQ0Kfj6mF5zs0cXh9i8VzB
 r7lQ==
X-Gm-Message-State: APjAAAXqDZgyJn5QIpyJJV00M4WNMPvtpKng1j4QxdaCoI3BI1dDpRDm
 3jD6yLsP3OY43vznukM32NE=
X-Google-Smtp-Source: APXvYqzB6wcKueZqL/f5Yl4DSRC0xnwviVPYuE27V4XggjeaSOX7/Y1xUexB+LH0hHqnf6Kelh3OAQ==
X-Received: by 2002:a65:6415:: with SMTP id a21mr74594225pgv.98.1564076314666; 
 Thu, 25 Jul 2019 10:38:34 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id e10sm51619090pfi.173.2019.07.25.10.38.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Jul 2019 10:38:34 -0700 (PDT)
Date: Thu, 25 Jul 2019 10:39:19 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [alsa-devel] [PATCH 08/10] ASoC: dt-bindings: Document
 fcomb_mode property
Message-ID: <20190725173918.GD31961@Asurada-Nvidia.nvidia.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-9-daniel.baluta@nxp.com>
 <20190724232209.GC6859@Asurada-Nvidia.nvidia.com>
 <CAEnQRZBW7LNZ7=c_h_ef4ZDcbFzEt61h4VAJSLo2Fb80kBqtpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEnQRZBW7LNZ7=c_h_ef4ZDcbFzEt61h4VAJSLo2Fb80kBqtpw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 25, 2019 at 09:02:22AM +0300, Daniel Baluta wrote:
> On Thu, Jul 25, 2019 at 2:22 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Mon, Jul 22, 2019 at 03:48:31PM +0300, Daniel Baluta wrote:
> > > This allows combining multiple-data-line FIFOs into a
> > > single-data-line FIFO.
> > >
> > > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/sound/fsl-sai.txt | 4 ++++
> >
> > This should be sent to devicetree mail-list also.
> >
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > > index 59f4d965a5fb..ca27afd840ba 100644
> > > --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > > +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > > @@ -54,6 +54,10 @@ Optional properties:
> > >                         represents first data line, bit 1 represents second
> > >                         data line and so on. Data line is enabled if
> > >                         corresponding bit is set to 1.
> > > +  - fsl,fcomb_mode   : list of two integers (first for RX, second for TX)
> > > +                       representing FIFO combine mode. Possible values for
> > > +                       combined mode are: 0 - disabled, 1 - Rx/Tx from shift
> > > +                       registers, 2 - Rx/Tx by software, 3 - both.
> >
> > Looks like a software configuration to me, instead of a device
> > property. Is this configurable by user case, or hard-coded by
> > SoC/hardware design?
> 
> Indeed this is a software configuration and configurable by user case.
> Will think of a another way to specify it.

Yea, it needs to be put somewhere else other than devicetree.

Not sure sysfs is a good approach for ASoC components or can
be done via amixer control.
