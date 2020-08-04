Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C860F23B3E1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 06:24:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLM9M4fgzzDqF5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 14:24:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RIe1a+u6; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLM7H18sBzDqWh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 14:23:06 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id b14so35601282qkn.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 21:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rQichsvBy+MsltI6WkAz/Wx6SRnn66f1UEHlGv+xZsM=;
 b=RIe1a+u60Aa8tEz9Q8BsfD2j9Ku9gGz+zWLyvdOdi3enfec/WwvGVgTlr/btqk2aVa
 4MCbROcl0O9lS4lXsiiOZtHvlEg7gJgB3uycJAgxIUxSlSLdUqOtpb4GBDZeI5hNwXX3
 BCw5jG5y2yLgjwshwLlZ2FC4FvQ0dVoWotiEs1o9pr/o8XaRpReK0VRr6DILqIDOfBPD
 WOTysAlPbVL8WGIBiq33a+B+YI3WMHgNVvwwjzAA8gx5rLylOnoaGwHMeSnLTkUd2lcc
 xercUxUDqaHfhM2ymUq55Gi5EIkImMGWZSogRgRrSnu1nzZ7oQFVmBJyOoAZeq6FQIe6
 Hklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rQichsvBy+MsltI6WkAz/Wx6SRnn66f1UEHlGv+xZsM=;
 b=dMT88C/h621YOxA5i9/2PLscZnAvJeKOIYKsSKx1ZyyZiNkxSmBdsPeliR8KxCDF0z
 StTNILEEaFT80QhrYIx4XXto4ZPfWmK2YmerfLmZOnjl/VX4yjnbc2JlmMWszymE3Tcb
 tyxPhAAmAsiDaZ5q25/AR3siOWTBHYmgfjr3tjiXTJFA5MqQevjoLXRtRAlrTX15DnT+
 OAYHeSWvDmYxMmzuZMtzAsAIsRVHG3StEIxeiM3c5eOlsMfQ/ikjhzYreVtuiD5idiXq
 cDaD6IGFev8IIwxDUahZbLcPG9jmEM5CmCsHbYJ+RmN93oYNp1VVxAe40FIlISNbW15I
 UUmQ==
X-Gm-Message-State: AOAM532QP/nvOTFMe8gBp9643Mc3mLC+GW/rwourNe78fE3GAPV521YJ
 SU9nP2DdsEyosIEhifRERybX/KLdfDE7fHzdXvk=
X-Google-Smtp-Source: ABdhPJwuZnXyfPk+0sVbOn12nxRzjLREQ1LreTAdQrhYhhkygRuHaxRvUU68poaYY+kI6IVAJLkhARLnc9K+/SpWayM=
X-Received: by 2002:a05:620a:628:: with SMTP id
 8mr20334448qkv.103.1596514984138; 
 Mon, 03 Aug 2020 21:23:04 -0700 (PDT)
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
In-Reply-To: <CAA+D8ANuLQuUO+VsABjt2t1ccK+LGayq13d6EEcV18=4KNaC+w@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Aug 2020 12:22:53 +0800
Message-ID: <CAA+D8AP=27SdR68T-LiQHkJ0_dJaqtgcS-oi9d8arUzvTz5GwA@mail.gmail.com>
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

On Tue, Aug 4, 2020 at 11:23 AM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
>
> On Tue, Aug 4, 2020 at 11:00 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Tue, Aug 04, 2020 at 10:35:12AM +0800, Shengjiu Wang wrote:
> > > On Tue, Aug 4, 2020 at 10:11 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > > >
> > > > On Tue, Aug 04, 2020 at 09:39:44AM +0800, Shengjiu Wang wrote:
> > > > > On Tue, Aug 4, 2020 at 5:57 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > > > > >
> > > > > > On Mon, Aug 03, 2020 at 04:04:23PM +0800, Shengjiu Wang wrote:
> > > > > >
> > > > > > > > > clock generation. The TCSR.TE is no need to enabled when only RX
> > > > > > > > > is enabled.
> > > > > > > >
> > > > > > > > You are correct if there's only RX running without TX joining.
> > > > > > > > However, that's something we can't guarantee. Then we'd enable
> > > > > > > > TE after RE is enabled, which is against what RM recommends:
> > > > > > > >
> > > > > > > > # From 54.3.3.1 Synchronous mode in IMX6SXRM
> > > > > > > > # If the receiver bit clock and frame sync are to be used by
> > > > > > > > # both the transmitter and receiver, it is recommended that
> > > > > > > > # the receiver is the last enabled and the first disabled.
> > > > > > > >
> > > > > > > > I remember I did this "ugly" design by strictly following what
> > > > > > > > RM says. If hardware team has updated the RM or removed this
> > > > > > > > limitation, please quote in the commit logs.
> > > > > > >
> > > > > > > There is no change in RM and same recommandation.
> > > > > > >
> > > > > > > My change does not violate the RM. The direction which generates
> > > > > > > the clock is still last enabled.
> > > > > >
> > > > > > Using Tx syncing with Rx clock for example,
> > > > > > T1: arecord (non-stop) => set RE
> > > > > > T2: aplay => set TE then RE (but RE is already set at T1)
> > > > > >
> > > > > > Anything that I am missing?
> > > > >
> > > > > This is a good example.
> > > > > We have used this change locally for a long time, so I think it is
> > > > > safe to do this change, a little different with the recommandation.
> > > >
> > > > Any reason for we have to go against the recommendation?
> > >
> > > Previous code will enable TE and RE  together even for asynchronous
> > > mode.
> > > And for recommendation, previous code just consider the RX sync with
> > > TX, but still violates the recommendation for TX sync with RX case.
> > > So at least this new change is some kind of improvement.
> >
> > Okay. Let's change it then. Please make sure to update/remove
> > those old comments in the trigger(). And it's probably better
> > to mention that what we do now is a bit different from RM:
> >         /*
> >          * Enable the opposite direction for synchronous mode
> >          * 1. Tx sync with Rx: only set RE for Rx; set TE & RE for Tx
> >          * 2. Rx sync with Tx: only set TE for Tx; set RE & TE for Rx
> >          *
> >          * RM recommends to enable RE after TE for case 1 and to enable
> >          * TE after RE for case 2, but we here may not always guarantee
> >          * that happens: "arecord 1.wav; aplay 2.wav" in case 1 enables
> >          * TE after RE, which is against what RM recommends but should
> >          * be safe to do, judging by years of testing results.
> >          */
>
> Thank you for the agreement.
>
> >
> > Btw, do we need similar change for TRIGGER_STOP?
>
> This is a good question. It is better to do change for STOP,
> but I am afraid that there is no much test to guarantee the result.
>
> best regards
> wang shengjiu

Maybe we can do this change for STOP.

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 1c0e06bb3783..6e4be398eaee 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -517,6 +517,37 @@ static int fsl_sai_hw_free(struct
snd_pcm_substream *substream,
        return 0;
 }

+static void fsl_sai_config_disable(struct fsl_sai *sai, bool tx)
+{
+       unsigned int ofs = sai->soc_data->reg_offset;
+       u32 xcsr, count = 100;
+
+       regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
+                          FSL_SAI_CSR_TERE, 0);
+
+       /* TERE will remain set till the end of current frame */
+       do {
+               udelay(10);
+               regmap_read(sai->regmap, FSL_SAI_xCSR(tx, ofs), &xcsr);
+       } while (--count && xcsr & FSL_SAI_CSR_TERE);
+
+       regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
+                          FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
+
+       /*
+        * For sai master mode, after several open/close sai,
+        * there will be no frame clock, and can't recover
+        * anymore. Add software reset to fix this issue.
+        * This is a hardware bug, and will be fix in the
+        * next sai version.
+        */
+       if (!sai->is_slave_mode) {
+               /* Software Reset for both Tx and Rx */
+               regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs),
FSL_SAI_CSR_SR);
+               /* Clear SR bit to finish the reset */
+               regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
+       }
+}
 static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
                struct snd_soc_dai *cpu_dai)
@@ -525,7 +556,7 @@ static int fsl_sai_trigger(struct
snd_pcm_substream *substream, int cmd,
        unsigned int ofs = sai->soc_data->reg_offset;

        bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-       u32 xcsr, count = 100;
+       u32 xcsr;

        /*
         * Asynchronous mode: Clear SYNC for both Tx and Rx.
@@ -579,43 +610,12 @@ static int fsl_sai_trigger(struct
snd_pcm_substream *substream, int cmd,

                /* Check if the opposite FRDE is also disabled */
                regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
-               if (!(xcsr & FSL_SAI_CSR_FRDE)) {
-                       /* Disable both directions and reset their FIFOs */
-                       regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
-                                          FSL_SAI_CSR_TERE, 0);
-                       regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
-                                          FSL_SAI_CSR_TERE, 0);
-
-                       /* TERE will remain set till the end of current frame */
-                       do {
-                               udelay(10);
-                               regmap_read(sai->regmap,
-                                           FSL_SAI_xCSR(tx, ofs), &xcsr);
-                       } while (--count && xcsr & FSL_SAI_CSR_TERE);
-
-                       regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
-                                          FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
-                       regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
-                                          FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
-
-                       /*
-                        * For sai master mode, after several open/close sai,
-                        * there will be no frame clock, and can't recover
-                        * anymore. Add software reset to fix this issue.
-                        * This is a hardware bug, and will be fix in the
-                        * next sai version.
-                        */
-                       if (!sai->is_slave_mode) {
-                               /* Software Reset for both Tx and Rx */
-                               regmap_write(sai->regmap, FSL_SAI_TCSR(ofs),
-                                            FSL_SAI_CSR_SR);
-                               regmap_write(sai->regmap, FSL_SAI_RCSR(ofs),
-                                            FSL_SAI_CSR_SR);
-                               /* Clear SR bit to finish the reset */
-                               regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
-                               regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
-                       }
-               }
+               if (sai->synchronous[tx] && !sai->synchronous[!tx] &&
!(xcsr & FSL_SAI_CSR_FRDE))
+                       fsl_sai_config_disable(sai, !tx);
+
+               if (sai->synchronous[tx] || !sai->synchronous[!tx] ||
!(xcsr & FSL_SAI_CSR_FRDE))
+                       fsl_sai_config_disable(sai, tx);
+
