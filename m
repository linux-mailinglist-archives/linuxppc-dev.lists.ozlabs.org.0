Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B56CE23B624
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 09:55:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLRrj5PnqzDqZb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 17:55:49 +1000 (AEST)
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
 header.s=20161025 header.b=eysYRozR; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLRpm1KggzDqCw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 17:54:06 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id d27so30229654qtg.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 00:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pvk2qNJvO4GyMY2u27NANNM906H79e7FKsYTERAdnHs=;
 b=eysYRozRxiQ0O/eMhXGkxC1m3FgN4Jt0xHrm4uYJtWyGG7WjOqRIlTB8gdny8xLP6A
 u7Cn8L1W3Mc7uu+D5/u3m+yx9DXNuA2huNax+By2Pxi1IsNpncHuICg0rCObHzZsTBOS
 QQFQ889zRHK9ooUTBzN+nToW6VypY+rY8vnkUoPeWav2WnOadMVqNsMVYTp2jYFTKqMe
 qrR2wNv7IO3bzcXN0Ao6N8NkLzEMfov2TG1XAcCtd2u45HkZeZJDmtvxP+5x6G3GqOcc
 JSmW+9liUjRTPh6nU2ienoROfCE0FU1PRm+ZDnyqgzo/htm4F1SpTs+10d5Qt9SHnjix
 1EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pvk2qNJvO4GyMY2u27NANNM906H79e7FKsYTERAdnHs=;
 b=SKp8wcNOrHCsFFdiio96Xq7Naqd9IczH4tvPJqYUnSEPG9ssKC0j33GWj4JONbAEr+
 kZA/k/LLRg10VUtbZg5gjGSm1MURFS5W3D3A54/ZZUIVVjy3hVGOOkriFp50o1YZEpIZ
 Fo5TkN4P84Ko2r/hCNOxHf7fNXtHlRmxVuSrZ4+qX9ricFp5s1L8+tgqfSZE946L4e8f
 CxA5ffWikhIfoLIIUsLNu4T5az73XvJIaNw1gq6oZy6S1QGCTbrOL0Sb7VgWiLoEOnCy
 jqiD5CmS3arCBI09LLbkye0oQMqvXQKmzl1S8Pbxg8+WzTsbu6hpdr+GiI62EIvZ9fW/
 afnA==
X-Gm-Message-State: AOAM531WvkaOpymos7kFMnhUrecxwQBU0VQY0BnVeCnjwqrSPg9Q1QgR
 alLN5HQksHVA5DsH3pTIr1mOe6MsWEbliYOvN/s=
X-Google-Smtp-Source: ABdhPJwoa5DLrSm+W2b1xh4wQw7NjhToyJBBLi3p9xIFguNDLPkDzaHtItg0/IPC5AOH6cXxxN5AKvNEE3xnih+beLw=
X-Received: by 2002:ac8:564f:: with SMTP id 15mr20407066qtt.54.1596527642821; 
 Tue, 04 Aug 2020 00:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
 <20200803054037.GA1056@Asurada-Nvidia>
 <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
 <20200803215735.GA5461@Asurada-Nvidia>
 <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
 <20200804021114.GA15390@Asurada-Nvidia>
 <CAA+D8ANagfMXPAkK4-vBDY9rZMukVUXs8FfBCHS0avXt57pekA@mail.gmail.com>
 <20200804030004.GA27028@Asurada-Nvidia>
 <CAA+D8ANuLQuUO+VsABjt2t1ccK+LGayq13d6EEcV18=4KNaC+w@mail.gmail.com>
 <CAA+D8AP=27SdR68T-LiQHkJ0_dJaqtgcS-oi9d8arUzvTz5GwA@mail.gmail.com>
 <20200804070345.GA27658@Asurada-Nvidia>
In-Reply-To: <20200804070345.GA27658@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Aug 2020 15:53:51 +0800
Message-ID: <CAA+D8ANodghXDbUVOqpf9uq8A5FVbDFEFkf4dWdyMUNDTPaJ7A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Clean code for synchronize mode
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 4, 2020 at 3:04 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Tue, Aug 04, 2020 at 12:22:53PM +0800, Shengjiu Wang wrote:
>
> > > > Btw, do we need similar change for TRIGGER_STOP?
> > >
> > > This is a good question. It is better to do change for STOP,
> > > but I am afraid that there is no much test to guarantee the result.
>
> > Maybe we can do this change for STOP.
>
> The idea looks good to me...(check inline comments)
>
> > diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> > index 1c0e06bb3783..6e4be398eaee 100644
> > --- a/sound/soc/fsl/fsl_sai.c
> > +++ b/sound/soc/fsl/fsl_sai.c
> > @@ -517,6 +517,37 @@ static int fsl_sai_hw_free(struct
> > snd_pcm_substream *substream,
> >         return 0;
> >  }
> >
> > +static void fsl_sai_config_disable(struct fsl_sai *sai, bool tx)
> > +{
> > +       unsigned int ofs = sai->soc_data->reg_offset;
> > +       u32 xcsr, count = 100;
> > +
> > +       regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
> > +                          FSL_SAI_CSR_TERE, 0);
> > +
> > +       /* TERE will remain set till the end of current frame */
> > +       do {
> > +               udelay(10);
> > +               regmap_read(sai->regmap, FSL_SAI_xCSR(tx, ofs), &xcsr);
> > +       } while (--count && xcsr & FSL_SAI_CSR_TERE);
> > +
> > +       regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
> > +                          FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
> > +
> > +       /*
> > +        * For sai master mode, after several open/close sai,
> > +        * there will be no frame clock, and can't recover
> > +        * anymore. Add software reset to fix this issue.
> > +        * This is a hardware bug, and will be fix in the
> > +        * next sai version.
> > +        */
> > +       if (!sai->is_slave_mode) {
> > +               /* Software Reset for both Tx and Rx */
>
> Remove "for both Tx and Rx"
>
> >                 /* Check if the opposite FRDE is also disabled */
> >                 regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
> > +               if (sai->synchronous[tx] && !sai->synchronous[!tx] && !(xcsr & FSL_SAI_CSR_FRDE))
> > +                       fsl_sai_config_disable(sai, !tx);
>
> > +               if (sai->synchronous[tx] || !sai->synchronous[!tx] || !(xcsr & FSL_SAI_CSR_FRDE))
> > +                       fsl_sai_config_disable(sai, tx);
>
> The first "||" should probably be "&&".

No. it is !(!sai->synchronous[tx] && sai->synchronous[!tx] && (xcsr &
FSL_SAI_CSR_FRDE))
so then convert to
(sai->synchronous[tx] || !sai->synchronous[!tx] || !(xcsr & FSL_SAI_CSR_FRDE))

if change to &&, then it won't work for:
sai->synchronous[tx] = false, sai->synchronous[!tx]=false.
or
sai->synchronous[tx] = true, sai->synchronous[!tx]=true.
(even we don't have such a case).

>
> The trigger() logic is way more complicated than a simple cleanup
> in my opinion. Would suggest to split RMR part out of this change.
>
> And for conditions like "sync[tx] && !sync[!tx]", it'd be better
> to have a helper function to improve readability:
>
> /**
>  * fsl_sai_dir_is_synced - Check if stream is synced by the opposite stream
>  *
>  * SAI supports synchronous mode using bit/frame clocks of either Transmitter's
>  * or Receiver's for both streams. This function is used to check if clocks of
>  * current stream's are synced by the opposite stream.
>  *
>  * @sai: SAI context
>  * @dir: direction of current stream
>  */
> static inline bool fsl_sai_dir_is_synced(struct fsl_sai *sai, int dir)
> {
>         int adir = (dir == TX) ? RX : TX;
>
>         /* current dir in async mode while opposite dir in sync mode */
>         return !sai->synchronous[dir] && sai->synchronous[adir];
> }
>
> Then add more comments in trigger:
>
> static ...trigger()
> {
>         bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
>         int adir = tx ? RX : TX;
>         int dir = tx ? TX : RX;
>
>         // ....
>         {
>                 // ...
>
>                 /* Check if the opposite FRDE is also disabled */
>                 regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
>
>                 /*
>                  * If opposite stream provides clocks for synchronous mode and
>                  * it is inactive, disable it before disabling the current one
>                  */
>                 if (fsl_sai_dir_is_synced(adir) && !(xcsr & FSL_SAI_CSR_FRDE))
>                         fsl_sai_config_disable(sai, adir);
>
>                 /*
>                  * Disable current stream if either of:
>                  * 1. current stream doesn't provide clocks for synchronous mode
>                  * 2. current stream provides clocks for synchronous mode but no
>                  *    more stream is active.
>                  */
>                 if (!fsl_sai_dir_is_synced(dir) || !(xcsr & FSL_SAI_CSR_FRDE))
>                         fsl_sai_config_disable(sai, dir);
>
>                 // ...
>         }
>         // ....
> }
>
> Note, in fsl_sai_config_disable(sai, dir):
>         bool tx = dir == TX;
>
> Above all, I am just drafting, so please test it thoroughly :)
