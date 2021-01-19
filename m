Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C90612FBE34
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 18:48:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKx2Y6k6kzDr2g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 04:48:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.54; helo=mail-ot1-f54.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKx0s6LFXzDr1f
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 04:46:31 +1100 (AEDT)
Received: by mail-ot1-f54.google.com with SMTP id n42so20568303ota.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 09:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Stocj1hJiSUyMpN8/XHAwp/pg2JCejqGaP8S1nhKqno=;
 b=iAhqskhM/fV+6lcHHiw3c0f5H4hiYMm5MJ9IRnDStqIsac+b3autyHLfFBXgDXefWh
 TJk0ggTrD+gJRH+Iv5X9SSP4by/OoyOMzN++TEg42lw7h95vE59DnoI/MeqvplRfIR6w
 Sg+w1b3T0d6Y0LUF96L10rIwloFn3v5dQ5hxYL8mvJUXp5GrMY93Ju2Ml8Wl1JATi81X
 X8NrkPA7D5HtoTHzOKMTrTQg0vHU57uwIpLwNVHnH7K+SMLcPQ/pP33QRgkJzkD21Acv
 xUqawFqv3SB6+cw2ydLL6P7slyHbuHLzi0OmsDMnmWExfYSqAxqOzmMQpB8vtWl5xn2j
 RNkA==
X-Gm-Message-State: AOAM531gsC/jtK7igJl+ka3dCkob1q2RxzuugKRudR9AID8E6gjMYrQF
 Bo6sbdJsZL0B8/Q0/CAYO/UdOBHYxZo=
X-Google-Smtp-Source: ABdhPJxJmqVhScDkzPh6kr1Akn9S3iipXQ3OeJIu2ITZoOoJddao5SmAsefNaJKDbqpaZ/ZbtZX2tQ==
X-Received: by 2002:a9d:1ec:: with SMTP id e99mr3586239ote.257.1611078388817; 
 Tue, 19 Jan 2021 09:46:28 -0800 (PST)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com.
 [209.85.167.178])
 by smtp.gmail.com with ESMTPSA id m7sm4331834oou.11.2021.01.19.09.46.27
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 09:46:28 -0800 (PST)
Received: by mail-oi1-f178.google.com with SMTP id r189so12397127oih.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 09:46:27 -0800 (PST)
X-Received: by 2002:a54:4489:: with SMTP id v9mr570652oiv.154.1611078387805;
 Tue, 19 Jan 2021 09:46:27 -0800 (PST)
MIME-Version: 1.0
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
 <20191128145554.1297-5-linux@rasmusvillemoes.dk>
 <a80b9c70-f9f2-0f76-15d0-d7a1c926f485@csgroup.eu>
In-Reply-To: <a80b9c70-f9f2-0f76-15d0-d7a1c926f485@csgroup.eu>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 19 Jan 2021 11:46:16 -0600
X-Gmail-Original-Message-ID: <CADRPPNQLfw-JHLf1vpc6fB0DLAd9er2zM+BrxWQriujwTdx-sA@mail.gmail.com>
Message-ID: <CADRPPNQLfw-JHLf1vpc6fB0DLAd9er2zM+BrxWQriujwTdx-sA@mail.gmail.com>
Subject: Re: [PATCH v6 04/49] soc: fsl: qe: introduce qe_io{read,
 write}* wrappers
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Timur Tabi <timur@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 lkml <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 19, 2021 at 11:35 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Hi Rasmus,
>
> Le 28/11/2019 =C3=A0 15:55, Rasmus Villemoes a =C3=A9crit :
> > The QUICC engine drivers use the powerpc-specific out_be32() etc. In
> > order to allow those drivers to build for other architectures, those
> > must be replaced by iowrite32be(). However, on powerpc, out_be32() is
> > a simple inline function while iowrite32be() is out-of-line. So in
> > order not to introduce a performance regression on powerpc when making
> > the drivers work on other architectures, introduce qe_io* helpers.
> >
> > Also define the qe_{clr,set,clrset}bits* helpers in terms of these new
> > macros.
>
> Since commit https://github.com/linuxppc/linux/commit/894fa235eb4ca0bfa69=
2dbe4932c2f940cdc8c1e
> ioread/iowrite wrappers are also inlined on PPC32, so this commit can now=
 be reverted.

Yes.  That will be great.

>
> Christophe
>
> >
> > Reviewed-by: Timur Tabi <timur@kernel.org>
> > Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > ---
> >   include/soc/fsl/qe/qe.h | 34 +++++++++++++++++++++++++---------
> >   1 file changed, 25 insertions(+), 9 deletions(-)
> >
> > diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
> > index a1aa4eb28f0c..9cac04c692fd 100644
> > --- a/include/soc/fsl/qe/qe.h
> > +++ b/include/soc/fsl/qe/qe.h
> > @@ -241,21 +241,37 @@ static inline int qe_alive_during_sleep(void)
> >   #define qe_muram_offset cpm_muram_offset
> >   #define qe_muram_dma cpm_muram_dma
> >
> > -#define qe_setbits_be32(_addr, _v) iowrite32be(ioread32be(_addr) |  (_=
v), (_addr))
> > -#define qe_clrbits_be32(_addr, _v) iowrite32be(ioread32be(_addr) & ~(_=
v), (_addr))
> > +#ifdef CONFIG_PPC32
> > +#define qe_iowrite8(val, addr)     out_8(addr, val)
> > +#define qe_iowrite16be(val, addr)  out_be16(addr, val)
> > +#define qe_iowrite32be(val, addr)  out_be32(addr, val)
> > +#define qe_ioread8(addr)           in_8(addr)
> > +#define qe_ioread16be(addr)        in_be16(addr)
> > +#define qe_ioread32be(addr)        in_be32(addr)
> > +#else
> > +#define qe_iowrite8(val, addr)     iowrite8(val, addr)
> > +#define qe_iowrite16be(val, addr)  iowrite16be(val, addr)
> > +#define qe_iowrite32be(val, addr)  iowrite32be(val, addr)
> > +#define qe_ioread8(addr)           ioread8(addr)
> > +#define qe_ioread16be(addr)        ioread16be(addr)
> > +#define qe_ioread32be(addr)        ioread32be(addr)
> > +#endif
> > +
> > +#define qe_setbits_be32(_addr, _v) qe_iowrite32be(qe_ioread32be(_addr)=
 |  (_v), (_addr))
> > +#define qe_clrbits_be32(_addr, _v) qe_iowrite32be(qe_ioread32be(_addr)=
 & ~(_v), (_addr))
> >
> > -#define qe_setbits_be16(_addr, _v) iowrite16be(ioread16be(_addr) |  (_=
v), (_addr))
> > -#define qe_clrbits_be16(_addr, _v) iowrite16be(ioread16be(_addr) & ~(_=
v), (_addr))
> > +#define qe_setbits_be16(_addr, _v) qe_iowrite16be(qe_ioread16be(_addr)=
 |  (_v), (_addr))
> > +#define qe_clrbits_be16(_addr, _v) qe_iowrite16be(qe_ioread16be(_addr)=
 & ~(_v), (_addr))
> >
> > -#define qe_setbits_8(_addr, _v) iowrite8(ioread8(_addr) |  (_v), (_add=
r))
> > -#define qe_clrbits_8(_addr, _v) iowrite8(ioread8(_addr) & ~(_v), (_add=
r))
> > +#define qe_setbits_8(_addr, _v) qe_iowrite8(qe_ioread8(_addr) |  (_v),=
 (_addr))
> > +#define qe_clrbits_8(_addr, _v) qe_iowrite8(qe_ioread8(_addr) & ~(_v),=
 (_addr))
> >
> >   #define qe_clrsetbits_be32(addr, clear, set) \
> > -     iowrite32be((ioread32be(addr) & ~(clear)) | (set), (addr))
> > +     qe_iowrite32be((qe_ioread32be(addr) & ~(clear)) | (set), (addr))
> >   #define qe_clrsetbits_be16(addr, clear, set) \
> > -     iowrite16be((ioread16be(addr) & ~(clear)) | (set), (addr))
> > +     qe_iowrite16be((qe_ioread16be(addr) & ~(clear)) | (set), (addr))
> >   #define qe_clrsetbits_8(addr, clear, set) \
> > -     iowrite8((ioread8(addr) & ~(clear)) | (set), (addr))
> > +     qe_iowrite8((qe_ioread8(addr) & ~(clear)) | (set), (addr))
> >
> >   /* Structure that defines QE firmware binary files.
> >    *
> >
