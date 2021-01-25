Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFE0302AFE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 20:01:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPfNM0ql1zDqv6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 06:01:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b31;
 helo=mail-yb1-xb31.google.com; envelope-from=saravanak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=D89ARNqQ; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPfL837DVzDqly
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 05:59:23 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id r32so14356835ybd.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 10:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MycbrezgsQZFT8oqiMufe2gK1ooAaS0SUCHVJFVQ9MQ=;
 b=D89ARNqQBSe6Gl9R5DO/KGq6f+XwI019KcTyn5HUgOjPlzNOoKDGLvzncEHAHxv7re
 lb0QJau2yo6HykmQLwhmFTcTH8Sq6QkyRikthUtPyKV308YBxPqBa17hLZ7vVdG82tdr
 1ZYHEmIoWgXZXzZgGJavOcNzowg9rVJTESsTDHUrdAkVRtjVOXki39cVm64f90B/xnUN
 p++bUV3uNwbHulfuik0Rs79fbFZMM9ifY6BNJzC7/LyidIkjYH3n/Y3WfoT8VtT0C7bQ
 vqglJpySbxKD72RPbiNIaXSY6RlQxd1v9SjROcZsCNjlhR4Ys9ezoFcio6JbYI7EjanP
 cYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MycbrezgsQZFT8oqiMufe2gK1ooAaS0SUCHVJFVQ9MQ=;
 b=O7+YphLm2FV75kNkcUQCyfCzjIXRqXkSO9umZuTp1ve2+5gaCnsDAbvgRwts4Rqq12
 WPTRf2+7s3yuawhWMO4H/DaCc0TjWFk3e/UCg4ZH8AJy/+tgBeWjR5mCPpDBeGSOQn0q
 VJontnaJRPl4YqjWhNc1lxkb/NlYuNJ1lz+8H3hSynrgm2RdMJj2JKYqt8EwY7Di6XLb
 ewG2sTNk/ttsGH+mz6OxbqJ2b4sWF4EBQTgSpYh/31i2snhKqMMv9X821yXbB1ZAFbQZ
 K3DvQqlxsJK0kVgOrSWryA5hBFk1ZYmUpXfy5HpccxfPr0DT1cUPGoubmlOWl20gv4Sz
 EXbQ==
X-Gm-Message-State: AOAM533p7PgY59S0P1PB4pWe3F21PD8Hq/K2z1B7aujQDFhp92Cr3/2A
 9Te28as9kLJVWsHfK/3MRB3KtNmSf8vBFenRKgpHnA==
X-Google-Smtp-Source: ABdhPJwgOyKDm0nJVp7CDR5p+pD9pfx6JsaeKrbh2AWLDPYbm1qy57jLH9fVrTDF4d9HZfHyOf/YQTtTZFeWAQ46qnY=
X-Received: by 2002:a25:2f46:: with SMTP id v67mr3110432ybv.20.1611601159888; 
 Mon, 25 Jan 2021 10:59:19 -0800 (PST)
MIME-Version: 1.0
References: <20210120105246.23218-1-michael@walle.cc>
 <CAL_JsqLSJCLtgPyAdKSqsy=JoHSLYef_0s-stTbiJ+VCq2qaSA@mail.gmail.com>
 <CAGETcx86HMo=gaDdXFyJ4QQ-pGXWzw2G0J=SjC-eq4K7B1zQHg@mail.gmail.com>
 <c3e35b90e173b15870a859fd7001a712@walle.cc>
 <20210125165041.GA5979@e121166-lin.cambridge.arm.com>
In-Reply-To: <20210125165041.GA5979@e121166-lin.cambridge.arm.com>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 25 Jan 2021 10:58:43 -0800
Message-ID: <CAGETcx-P-MxM+49XdUGBmg5YgnHS=fmz8uewywXvLSFKj=MqRQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc: layerscape: convert to builtin_platform_driver()
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
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
Cc: Rob Herring <robh@kernel.org>, Roy Zang <roy.zang@nxp.com>,
 PCI <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Michael Walle <michael@walle.cc>,
 Mingkai Hu <mingkai.hu@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 25, 2021 at 8:50 AM Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
>
> On Wed, Jan 20, 2021 at 08:28:36PM +0100, Michael Walle wrote:
> > [RESEND, fat-fingered the buttons of my mail client and converted
> > all CCs to BCCs :(]
> >
> > Am 2021-01-20 20:02, schrieb Saravana Kannan:
> > > On Wed, Jan 20, 2021 at 6:24 AM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Wed, Jan 20, 2021 at 4:53 AM Michael Walle <michael@walle.cc>
> > > > wrote:
> > > > >
> > > > > fw_devlink will defer the probe until all suppliers are ready. We can't
> > > > > use builtin_platform_driver_probe() because it doesn't retry after probe
> > > > > deferral. Convert it to builtin_platform_driver().
> > > >
> > > > If builtin_platform_driver_probe() doesn't work with fw_devlink, then
> > > > shouldn't it be fixed or removed?
> > >
> > > I was actually thinking about this too. The problem with fixing
> > > builtin_platform_driver_probe() to behave like
> > > builtin_platform_driver() is that these probe functions could be
> > > marked with __init. But there are also only 20 instances of
> > > builtin_platform_driver_probe() in the kernel:
> > > $ git grep ^builtin_platform_driver_probe | wc -l
> > > 20
> > >
> > > So it might be easier to just fix them to not use
> > > builtin_platform_driver_probe().
> > >
> > > Michael,
> > >
> > > Any chance you'd be willing to help me by converting all these to
> > > builtin_platform_driver() and delete builtin_platform_driver_probe()?
> >
> > If it just moving the probe function to the _driver struct and
> > remove the __init annotations. I could look into that.
>
> Can I drop this patch then ?

No, please pick it up. Michael and I were talking about doing similar
changes for other drivers.

-Saravana
