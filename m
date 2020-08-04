Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 265D423B69E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 10:15:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLSHY2rZJzDqDV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 18:15:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DYdif+vR; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLSFY4VBtzDqB3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 18:13:50 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id r4so11790506pls.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 01:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QTZfG/kR29WZl/QqtrKhHeYkzxPgGUcbCVsRoqYuMCg=;
 b=DYdif+vRQ34VCrII1rcRURMIr1UR4eoarWbg2ONWRx2uRCdkqrY/8JzU46Oa5nbfS1
 uzfdNROpnO06HKpLdfpbuCQ6FGlq1Q5agZp+uGKZ5nqXoP26nuPN6pGHOUvRcoyQ5bfG
 Qx/B/rXOjGtqaGu/9kKoQQZm1SZEHot04BYIN3+aFdQAblXL7A87TG51b8LtSNB5EETn
 /UOZrqg0fsXd/BPGQy1t9OVN/S/GLvcqnKP5beN4UKBBmJY+KZhj5C/MnD9to9XjnKka
 UQ5K8pRSkK4hmoSUUGWd4okRUmae3379DE7RgP2SDmoISUxFqIE48oXwWhe4UDm+zj0M
 HtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QTZfG/kR29WZl/QqtrKhHeYkzxPgGUcbCVsRoqYuMCg=;
 b=I3u/+QtLSpt30gunMIV+HBtBCAXhq9w7M1kBA8KC6OqFQSJUTOh5cavnDReyD7SZDK
 cdADHdnCXyP3tSk1GJ4+NEO0E7aZaKJKfHKO3Jj9HeU750nPAztSxUfN4EJKrbe2IF1Y
 pzupll4Quijsu6yy51Vj86H0klgKRgoVt7wuzfeHwAGNt0KjSaOdjQHooEWESJ4rzmCI
 ez0QBIib8EuCMKwCQBlnlcH3ItanEhAfg+cgU1E7ujWa9kyQyB+ZmBEpJj/IwEiVYL6T
 MGy6Iq0xUOrQIJKGeyRXkHfkVpR3uDQp2MXPe7R1Ouj6Mfo+bCfI5S8v6fsw66nI13QM
 QVtQ==
X-Gm-Message-State: AOAM532zg5VYJ1pZOqa2uHC0zw/hY/UNSLacng0Xqvc5YqAcJkUv3Uvi
 D+twrF4y7wBrL7vowLFeGvU=
X-Google-Smtp-Source: ABdhPJz+uClNx0qLTPNR0v0kaWetuL5qHIA7MjIEAIYLOMnWp36caMp4FKmFAUV7cMJ+CR83l1o0Dg==
X-Received: by 2002:a17:90b:c90:: with SMTP id
 o16mr3081175pjz.79.1596528827041; 
 Tue, 04 Aug 2020 01:13:47 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id c10sm18237720pfc.62.2020.08.04.01.13.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 01:13:46 -0700 (PDT)
Date: Tue, 4 Aug 2020 01:13:34 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Clean code for synchronize mode
Message-ID: <20200804081333.GA664@Asurada-Nvidia>
References: <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
 <20200803215735.GA5461@Asurada-Nvidia>
 <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
 <20200804021114.GA15390@Asurada-Nvidia>
 <CAA+D8ANagfMXPAkK4-vBDY9rZMukVUXs8FfBCHS0avXt57pekA@mail.gmail.com>
 <20200804030004.GA27028@Asurada-Nvidia>
 <CAA+D8ANuLQuUO+VsABjt2t1ccK+LGayq13d6EEcV18=4KNaC+w@mail.gmail.com>
 <CAA+D8AP=27SdR68T-LiQHkJ0_dJaqtgcS-oi9d8arUzvTz5GwA@mail.gmail.com>
 <20200804070345.GA27658@Asurada-Nvidia>
 <CAA+D8ANodghXDbUVOqpf9uq8A5FVbDFEFkf4dWdyMUNDTPaJ7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANodghXDbUVOqpf9uq8A5FVbDFEFkf4dWdyMUNDTPaJ7A@mail.gmail.com>
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

On Tue, Aug 04, 2020 at 03:53:51PM +0800, Shengjiu Wang wrote:

> > >                 /* Check if the opposite FRDE is also disabled */
> > >                 regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
> > > +               if (sai->synchronous[tx] && !sai->synchronous[!tx] && !(xcsr & FSL_SAI_CSR_FRDE))
> > > +                       fsl_sai_config_disable(sai, !tx);
> >
> > > +               if (sai->synchronous[tx] || !sai->synchronous[!tx] || !(xcsr & FSL_SAI_CSR_FRDE))
> > > +                       fsl_sai_config_disable(sai, tx);
> >
> > The first "||" should probably be "&&".
> 
> No. it is !(!sai->synchronous[tx] && sai->synchronous[!tx] && (xcsr &
> FSL_SAI_CSR_FRDE))
> so then convert to
> (sai->synchronous[tx] || !sai->synchronous[!tx] || !(xcsr & FSL_SAI_CSR_FRDE))
> 
> if change to &&, then it won't work for:
> sai->synchronous[tx] = false, sai->synchronous[!tx]=false.

Ahh..probably should be
if (!(sync[dir] && !sync[adir]) || !frde)

I have a (seemingly) correct version in my sample code.

And...please untangle the logic using the given example -- adding
helper function(s) and comments. And, though the driver does have
places using array[tx] and array[!tx], better not to use any more
boolean type variable as an array index, as it's hard to read.
