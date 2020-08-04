Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3C623B263
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 03:41:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLHY044DzzDqSY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 11:41:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jAxSNt/v; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLHW40vsGzDqDB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 11:39:59 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id h21so23415896qtp.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 18:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FIlUlELrgUmFnEMwt6u0RG5w8m9jnPh4zMYQKE4rWn4=;
 b=jAxSNt/vI3knrlvcM/xUyi0d88/12xRP+gOojXUE75gaB2oAtcw88Oc/pkfCQn+Gvg
 HuoJQkx3jwVg+ztcFSoeLLvQR2yynSZZFx0Hj0sj24HmdWUDPpMkqs5ahWh81e6BNPA7
 TpeOGLr7gyNkBcEV9utZTleTYwCk2Eg0WaJtmWMs+K79yKJa61ArrlDO0P2CWnsxc0IS
 H98IKvtV9g+Qk78P5KbIzKFQxhVsGlQdqn9cCJRiFStWfy5H212HvH8brR0nbmmr7oaW
 pYcjLRvxPNwxYj+NnPLCwxT8B8j2hZapYbeKWwC6RC9CsR7yGF9EHi0ejb1o7jN3Y2fi
 RK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FIlUlELrgUmFnEMwt6u0RG5w8m9jnPh4zMYQKE4rWn4=;
 b=Q9qHJ19A+IWHi4PO4p0lE5C687Qku9O1AhZ3JbuN0BDZq3uJamgV+JBeBS65K2KnDA
 S5J0vZNebL8JMCPEQDFJMfircUABkQ5368hV8XKaV2n/9HLlEP0k/0DK7p93692zKCSI
 PcaEfsn+QT/cb8q7F2ikkJuWDeauuBZSgmWVdu5+zdvbdJrBOJJPmp+EMo7eFO5YJlLD
 Iyr6y0Xz8N7wHddgPeYvmqZW7bVZmDHU+yUNe5hJnstJvXRvOh/wUSS/h2lpnBkLDKy2
 IjsYD73Vl/N9voUiCaRtspJ+eV7nQI8rlBcbzcXkwkfmdROrPew0VKcEOQ5Z5LEGGTYi
 oVZQ==
X-Gm-Message-State: AOAM5305CSuUTFZAKscb8FnsI25BULlVb6vY9e9TEaH8sSgZi9SSAwh/
 RLhGB0EgLMH+SbzhIdW4mB//wKQFtnr8zDK/Ps8=
X-Google-Smtp-Source: ABdhPJyCVJyr/DR+n59uS5oG98ADiiNam8gKyl/6hZZsy3LPTTng/7IrTqLdgbjMsk7CytbooD98U9ki2vUAhABvp8o=
X-Received: by 2002:ac8:564f:: with SMTP id 15mr19448921qtt.54.1596505195017; 
 Mon, 03 Aug 2020 18:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
 <20200803054037.GA1056@Asurada-Nvidia>
 <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
 <20200803215735.GA5461@Asurada-Nvidia>
In-Reply-To: <20200803215735.GA5461@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Aug 2020 09:39:44 +0800
Message-ID: <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
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

On Tue, Aug 4, 2020 at 5:57 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Aug 03, 2020 at 04:04:23PM +0800, Shengjiu Wang wrote:
>
> > > > clock generation. The TCSR.TE is no need to enabled when only RX
> > > > is enabled.
> > >
> > > You are correct if there's only RX running without TX joining.
> > > However, that's something we can't guarantee. Then we'd enable
> > > TE after RE is enabled, which is against what RM recommends:
> > >
> > > # From 54.3.3.1 Synchronous mode in IMX6SXRM
> > > # If the receiver bit clock and frame sync are to be used by
> > > # both the transmitter and receiver, it is recommended that
> > > # the receiver is the last enabled and the first disabled.
> > >
> > > I remember I did this "ugly" design by strictly following what
> > > RM says. If hardware team has updated the RM or removed this
> > > limitation, please quote in the commit logs.
> >
> > There is no change in RM and same recommandation.
> >
> > My change does not violate the RM. The direction which generates
> > the clock is still last enabled.
>
> Using Tx syncing with Rx clock for example,
> T1: arecord (non-stop) => set RE
> T2: aplay => set TE then RE (but RE is already set at T1)
>
> Anything that I am missing?

This is a good example.
We have used this change locally for a long time, so I think it is
safe to do this change, a little different with the recommandation.

>
> > > > +             if (!sai->synchronous[TX] && sai->synchronous[RX] && !tx) {
> > > > +                     regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
> > > > +                                        FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
> > > > +             } else if (!sai->synchronous[RX] && sai->synchronous[TX] && tx) {
> > > > +                     regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
> > > > +                                        FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
> > >
> > > Two identical regmap_update_bits calls -- both on !tx (RX?)
> > The content for regmap_update_bits is the same, but the precondition
> > is different.
> > The first one is for tx=false and enable TCSR.TE. (TX generate clock)
> > The second one is for tx=true and enable RSCR.RE (RX generate clock)
>
> Why not merge them?
>
> +               if ((!sai->synchronous[TX] && sai->synchronous[RX] && !tx) ||
> +                  ((!sai->synchronous[RX] && sai->synchronous[TX] && tx) {

oh, yes, good point!

best regards
wang shengjiu
