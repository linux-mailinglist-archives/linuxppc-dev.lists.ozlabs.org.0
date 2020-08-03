Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7093823AFE6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 23:59:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLBd34GsTzDqC3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 07:59:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cWCkXl8L; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLBZm4gKgzDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 07:57:51 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id t6so20938754pgq.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 14:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yuVzOzKa2hJtd7uaE4veinXP3zTwwT8hP9/UMc26Jxo=;
 b=cWCkXl8L5UI8SuRjQ0cl053tTauIzhi1afwfNgdwh+S/UrqCe7b6aQGPQk0rAl20em
 Glao1b3gOcesofK02TSpw5cNYZvAFOShat12fYg11KP70iKBxdvyi911W6RX/otsR5Az
 0dXE+t4tOtG1SRK/Nnab/slKYIK2LQXD2MYu6VeCuOrZfyoRG5DJQZ40VyyaQxIz6T7s
 R+JiLGDzcw6HtZ5oPnPU68nrEGi66BH+YcGNnATp1qAAhw04FBNX41QxHdpHZru+wqrM
 bn9qgqzWEjtrWmhNB6yGIaBChRxAwB2CdYQAAEL5M7rEfQvyspMLu4+3pk5mCM45S3cm
 WKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yuVzOzKa2hJtd7uaE4veinXP3zTwwT8hP9/UMc26Jxo=;
 b=aR91AuG54SyqJ6/jvfevR1JmiNcHp6T1VoK83cExLO+nGIm+rU6kynWw/z2ftqspIr
 ZwYIKCY89Gp0UY+k16Jje5quKvc9/1WoKxnxKUA3Acq/PisMPsj9OMXmn2Vazu1wfLEY
 qp7v5zk7lu75DJROj33W0EqhzZ0SD/iMP+BtCXSyIizhl9cC5nXAG+oBeZ5N7fakrv49
 v2bvPVAMTH4MpAjbKAA4vWSMdVdNUmtIhwWHKIxHY/9zQXsFMBIJFi1wiVx2B8TsrAy+
 9PbZnSzJfOjJwXfi5asUzpxqNwgGSW3id3f87Jh/3nzG3MYhwnYI72HHJFt9xSuzoHkn
 anlw==
X-Gm-Message-State: AOAM5307sz/5H3FsDk7XOBsR9e2NSJSugG1KbfbQyBl7u9rPCT9k38lv
 7pzEKidnzcZW1DieZNQCfLU=
X-Google-Smtp-Source: ABdhPJygNIzoSP6mtrUmL5aG3TEs5sU+U9sui5b00C7eA2kbujQ2/HiOWRUN0IxJIz03F+8nQCZiWg==
X-Received: by 2002:a63:c447:: with SMTP id m7mr16425864pgg.118.1596491868043; 
 Mon, 03 Aug 2020 14:57:48 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id lk16sm406515pjb.13.2020.08.03.14.57.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Aug 2020 14:57:47 -0700 (PDT)
Date: Mon, 3 Aug 2020 14:57:35 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Clean code for synchronize mode
Message-ID: <20200803215735.GA5461@Asurada-Nvidia>
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
 <20200803054037.GA1056@Asurada-Nvidia>
 <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 03, 2020 at 04:04:23PM +0800, Shengjiu Wang wrote:

> > > clock generation. The TCSR.TE is no need to enabled when only RX
> > > is enabled.
> >
> > You are correct if there's only RX running without TX joining.
> > However, that's something we can't guarantee. Then we'd enable
> > TE after RE is enabled, which is against what RM recommends:
> >
> > # From 54.3.3.1 Synchronous mode in IMX6SXRM
> > # If the receiver bit clock and frame sync are to be used by
> > # both the transmitter and receiver, it is recommended that
> > # the receiver is the last enabled and the first disabled.
> >
> > I remember I did this "ugly" design by strictly following what
> > RM says. If hardware team has updated the RM or removed this
> > limitation, please quote in the commit logs.
> 
> There is no change in RM and same recommandation.
> 
> My change does not violate the RM. The direction which generates
> the clock is still last enabled.

Using Tx syncing with Rx clock for example,
T1: arecord (non-stop) => set RE
T2: aplay => set TE then RE (but RE is already set at T1)

Anything that I am missing?

> > > +             if (!sai->synchronous[TX] && sai->synchronous[RX] && !tx) {
> > > +                     regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
> > > +                                        FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
> > > +             } else if (!sai->synchronous[RX] && sai->synchronous[TX] && tx) {
> > > +                     regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
> > > +                                        FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
> >
> > Two identical regmap_update_bits calls -- both on !tx (RX?)
> The content for regmap_update_bits is the same, but the precondition
> is different.
> The first one is for tx=false and enable TCSR.TE. (TX generate clock)
> The second one is for tx=true and enable RSCR.RE (RX generate clock)

Why not merge them?

+		if ((!sai->synchronous[TX] && sai->synchronous[RX] && !tx) ||
+		   ((!sai->synchronous[RX] && sai->synchronous[TX] && tx) {
