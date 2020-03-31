Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF1D1989FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 04:30:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rtbF41fjzDqbG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 13:30:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XbufxDdy; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rtYP1WSXzDqfK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 13:28:40 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id e14so17144261qts.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 19:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Eswrbi+TW9i4zBrNR421oAkiEgU39P/E20ccg2jKp0=;
 b=XbufxDdyKxF6IxecIKX1ZwR3v13NTl1c0irTPT13iVOAemS1d4QQGPNdE8aX5ZJR7a
 PRYP7DhKw5BCgxY7SGSzYWNZgaGcWWSc6YGqUcJQu60Lfm4Q4OSUxTA+2thEsMP1fxNR
 VJwh3EmB3AOXnRQbyYLd1sv5QNoWFYPHe3e7QaLHgo50B+O0+HGrMpsHrGHsmsEZZO9I
 kg+3wYBZar0w5tO557g0O7FJMVrKJPzT9zL6YdvW2GEVYbw5IdwhUXKbWcQbdUPqfswu
 eBRpuqpc4K2baE54CChc6Yg8aq9BWGgIZ1HFGX7tAWIF3k1mIqsNGhpbsGFO+pMH5Jui
 8/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Eswrbi+TW9i4zBrNR421oAkiEgU39P/E20ccg2jKp0=;
 b=l3A/gBBMvY377bKDUPq+qeOwRbuar2aGcyr0SG12phL71J7D6bjXWC9wIb+QyMibf5
 YfH/hRlZm/UenQnCF8gqTFMWi8VeCWWOvEeJhffK8JOSrCYg+0bXLAXkxhuC4U/wKnpU
 +cVmtqEK9Kl/UUHI8buHMdcsz2ku+G0M35z9PLmVPYKe1YtrPONK4KLkUxfnXhlfOvHy
 Xcoa62fQgT0YB+5wxXXIbmIY+WD6bxxZG/0iRTwrdAxuCQEYNv10CVKBd6jW1OI0hPe0
 is4Ljw1jBYrbMhXwIuqpUCm6f6eirlVdy0/1oMFq6V33s8B2J8gnu0Nern0v1pD0/SQH
 MERw==
X-Gm-Message-State: ANhLgQ3Qz+fq/AsWETsd/fH6KAFxWzjGoAnEL27Yd5BwiPAGjLVkkGGn
 8YSrJz5cLpn5+0LqeDWTo5wvmdAUL0zidfX8Ueg=
X-Google-Smtp-Source: ADFU+vsVu3tV6CH4YdMfKECtdWJWGuZrgZY25WwzSudJxQGrid6FAxBQVVLlDNJ6nM/kHaMida9sj9zwiJxjuWI1mgI=
X-Received: by 2002:ac8:6f4e:: with SMTP id n14mr2947163qtv.121.1585621716954; 
 Mon, 30 Mar 2020 19:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <24f69c50925b93afd7a706bd888ee25d27247c78.1583725533.git.shengjiu.wang@nxp.com>
 <20200309211943.GB11333@Asurada-Nvidia.nvidia.com>
 <20200320173213.GA9093@bogus>
 <20200323212038.GA7527@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20200323212038.GA7527@Asurada-Nvidia.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 31 Mar 2020 10:28:25 +0800
Message-ID: <CAA+D8APu0JYqnUvY+fCYTcZ9U1BCv-zU8J4Zt-5doZcNkgaXFQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: fsl_asrc: Add new property fsl,
 asrc-format
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On Tue, Mar 24, 2020 at 5:22 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Fri, Mar 20, 2020 at 11:32:13AM -0600, Rob Herring wrote:
> > On Mon, Mar 09, 2020 at 02:19:44PM -0700, Nicolin Chen wrote:
> > > On Mon, Mar 09, 2020 at 11:58:28AM +0800, Shengjiu Wang wrote:
> > > > In order to support new EASRC and simplify the code structure,
> > > > We decide to share the common structure between them. This bring
> > > > a problem that EASRC accept format directly from devicetree, but
> > > > ASRC accept width from devicetree.
> > > >
> > > > In order to align with new ESARC, we add new property fsl,asrc-format.
> > > > The fsl,asrc-format can replace the fsl,asrc-width, then driver
> > > > can accept format from devicetree, don't need to convert it to
> > > > format through width.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > > index cb9a25165503..780455cf7f71 100644
> > > > --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > > +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > > @@ -51,6 +51,11 @@ Optional properties:
> > > >                     will be in use as default. Otherwise, the big endian
> > > >                     mode will be in use for all the device registers.
> > > >
> > > > +   - fsl,asrc-format     : Defines a mutual sample format used by DPCM Back
> > > > +                   Ends, which can replace the fsl,asrc-width.
> > > > +                   The value is SNDRV_PCM_FORMAT_S16_LE, or
> > > > +                   SNDRV_PCM_FORMAT_S24_LE
> > >
> > > I am still holding the concern at the DT binding of this format,
> > > as it uses values from ASoC header file instead of a dt-binding
> > > header file -- not sure if we can do this. Let's wait for Rob's
> > > comments.
> >
> > I assume those are an ABI as well, so it's okay to copy them unless we
>
> They are defined under include/uapi. So I think we can use them?
>
> > already have some format definitions for DT. But it does need to be copy
> > in a header under include/dt-bindings/.
>
> Shengjiu is actually quoting those integral values, rather than
> those macros, so actually no need copy to include/dt-bindings,
> yet whoever adds this format property to a new DT would need to
> look up the value in a header file under include/uapi. I's just
> wondering if that's okay.
>
> Thanks
Shall I keep this change or drop this change?

best regards
wang shengjiu
