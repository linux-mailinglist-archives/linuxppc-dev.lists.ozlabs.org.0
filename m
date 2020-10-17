Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C93290E71
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 03:27:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CClkL1zmCzDr3T
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 12:27:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BuFPK4FJ; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CClhv4w6WzDqys
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 12:26:07 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id x13so2467208pfa.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 18:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rRFRUFeNNAwvjKBB1fE6qSaSpbNzd7iDj3KBBS9Wi24=;
 b=BuFPK4FJjOiSIUHGD7OM2XveIj3tBrf87q24Lrgnu+LjUUrdp0wG5I19CPCKob/guJ
 QXBtQDPHZww3sdBO+hjkhHdXWlS5OU9k267rzwmKaimvsbAOxucxxH7QGyCEzB3ZX3VO
 BybuTUFk371oC5XZ5aWLrKvy9Jt54/AUpZ8zUn8QTLQC5dVnUEWnl1gzwuAA+FM1VS1S
 Ju6udc81wtlOMR4ePVzJxyBW2HVQk3pQWEh4OmAgMprXg9DC2XnLrFhrOyV2ydCcy/n4
 aaEOpLgKmBi4cUE0DrCVQPXScPJlAtozf/1k6csHO9se9Q4th86LiiHgqedREdDtz7G0
 ycOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rRFRUFeNNAwvjKBB1fE6qSaSpbNzd7iDj3KBBS9Wi24=;
 b=DuXfoTvS0sFubGtPXWXO9dyn+kfN+wvQ4D+ohzEpWdXl33HG9uz7pk6PgAE6O0oz62
 psGeE9qdDh72/glqgvnFlRA0kFTi80MsjNUOX8IDTp3uB5066rKVvDGDzb/Ff4viFeD1
 q003OxL+QkQG0FZoiYzxWxweerOYD/fwZ0YpbMwf3fLFvTEx390xw6jY1adZFZ9KkLMw
 x3kAePSuWsyaSYucpgRKaobhyY81vBBGeX/305ju2q1j1V8poMdp1E7O9XPMwOAPhFZl
 6O8KJVI3YMMURA5otXnQ7UngehBDNzZgJxYnSoMmxjCIUYMS2BqBvvhjAsJ3qZX8AA+S
 5NMw==
X-Gm-Message-State: AOAM533Q5C9YaIx/57DpJAFBED6ikeUCuXFonssBXJny0XBlojwUkPPF
 Az7OEEosifJLUhvNOKldx0k=
X-Google-Smtp-Source: ABdhPJxDcmWpg0O4z3LieL6I8S03PlsvcZQSH/YCpoH4Q7Ghg9XaHg0XS98S2kNrz+YFd1mvx/cu+Q==
X-Received: by 2002:a63:5b03:: with SMTP id p3mr5366880pgb.154.1602897963819; 
 Fri, 16 Oct 2020 18:26:03 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id i7sm3868098pfo.208.2020.10.16.18.26.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Oct 2020 18:26:03 -0700 (PDT)
Date: Fri, 16 Oct 2020 18:17:32 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Subject: Re: [PATCH v4 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Message-ID: <20201017011731.GA7203@Asurada-Nvidia>
References: <20201013121733.83684-1-viorel.suman@oss.nxp.com>
 <20201013121733.83684-2-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013121733.83684-2-viorel.suman@oss.nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Viorel Suman <viorel.suman@nxp.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 13, 2020 at 03:17:32PM +0300, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> XCVR (Audio Transceiver) is a on-chip functional module found
> on i.MX8MP. It support HDMI2.1 eARC, HDMI1.4 ARC and SPDIF.
> 
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
