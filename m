Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 399DA2A9F9B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 22:52:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSYz92fXWzDrQs
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 08:52:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fofen6cX; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSYxH0VP9zDrNV
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 08:51:12 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id 72so2604186pfv.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 13:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cCOSuspQFM76bwwc9KyVB4ygiOrAQrMSCa7jrT+WOiE=;
 b=fofen6cX59+NrDsXNP2Ikx/VA8W/q34luWai9k3YMyeCn+Iq80JuJ+hdDhMEmzVBiU
 DzqUnMDf/t9ouMeF5UBMoNklNSCLeaNflA6Dq5A/Gvjbsi0vSf/DnJHzwQlk/Zt6asZ1
 5eMTrEjzTLJedHDomM3i159NfKz0tg6AeyPJ602FdfxzIiVNIWdHppHAwgFyjIYkQwnP
 JcrolOhV4v2gF4RA+ODyZhyI3aJT6uqWl1PLX5Y4mNb8N+sI/xt6uXOQZPjISd83/nBu
 eUcHzb0cbGjpOaKQ63JFyqqsjIpSq5L6JnkQLJg8PO1m1XPPwX/DQkIQ5kGy6vgFKX2f
 H6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cCOSuspQFM76bwwc9KyVB4ygiOrAQrMSCa7jrT+WOiE=;
 b=jR6xtfOpfWfV0rMGPE3nATa9NLinf8kye7afphbzHzIHPxEX1pdXxI1yjiLPFWGuZY
 3lpLbCzzOlkQOxc+Ygs5izLVUNBwO9NXFJZIWsrrtXM8w19hQuYT8yxCQED5sgvn9kE8
 A4zmRNMp4Z1YmyrXbwMa1nhns5996GRKx4VXRa53irmij5Alnk0i7MJD28itASWhVD6/
 b7ezUu0YdDb37zKQkIGpwjzdaPNE2X3IE1544gpZT2v4aboxPbLumo6o7woMT1Fiw6bo
 7V/i+B4g5wNXH+e5uYfcoXdV2YRdRf2hFzV4NPvGv+C/2I9zyEZgkIE+IsK0qNbGL1v8
 Xxrw==
X-Gm-Message-State: AOAM530p6OcQq2HjXuakThQtxeA/PF3hq+xpkcVcNFHaFaFUdwoyEa7E
 GkzTqDU8twBq0W3ustRxS0g=
X-Google-Smtp-Source: ABdhPJx5mzL06fdjlBBcKuJ33iLkGeOMrXk9Sm8CfjP+23T56yaZQTLdQP60v9qx3wxztk7dMHUDJg==
X-Received: by 2002:a17:90b:496:: with SMTP id
 bh22mr1721827pjb.120.1604699468015; 
 Fri, 06 Nov 2020 13:51:08 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id q23sm3170599pfg.192.2020.11.06.13.51.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 06 Nov 2020 13:51:07 -0800 (PST)
Date: Fri, 6 Nov 2020 13:38:58 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: fsl_aud2htx: Add aud2htx module driver
Message-ID: <20201106213857.GB3927@Asurada-Nvidia>
References: <1604281947-26874-1-git-send-email-shengjiu.wang@nxp.com>
 <1604281947-26874-2-git-send-email-shengjiu.wang@nxp.com>
 <20201105013539.GA16459@Asurada-Nvidia>
 <CAA+D8ANrkgXR+8JGp4fPLvkKJ05EqQyShWTO+xWpPOycPT9Tyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANrkgXR+8JGp4fPLvkKJ05EqQyShWTO+xWpPOycPT9Tyw@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 06, 2020 at 10:51:03AM +0800, Shengjiu Wang wrote:

> > > +static irqreturn_t fsl_aud2htx_isr(int irq, void *dev_id)
> > > +{
> > > +     return IRQ_HANDLED;
> >
> > Empty isr? Perhaps can drop the request_irq() at all?
> 
> I'd like to keep this for future enhancement, what do you think?

I believe that usually it will be a common practice that we add
when we use it -- exaggerating the situation, just like you will
not actually add an empty driver for future enhancement.

But I am not strongly against it, as it's small. Since Mark has
applied it, let's keep it then.
