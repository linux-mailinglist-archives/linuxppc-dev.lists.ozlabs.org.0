Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0502D968F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 11:48:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvdQR1TC5zDqRy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 21:47:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=daniel.thompson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=brfsj5+b; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvdKY07R4zDqRy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 21:43:44 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id 3so14821982wmg.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 02:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gPCYc+i9Iy87r57uStW+ARtubvlgXBH6jVAjmF4IhnU=;
 b=brfsj5+b+IqlJui0vPdCHYpYP2bFYzO+1JlWfKz1weffGaprU8OkE8dqZ9gA8Ypm/0
 v6+grN5KbiSQRACrcBWw1asFdDFVqF9nBu3Oa0GUPYv5yBkX67nd1ntfLcAJg0zP6PdE
 xlq10No04/AwJLV6O3ydkHlsjEAP4HvjVzoA+aYzj43B5E2rQHWk/Z7UGIyKRfSzOZGq
 LSBaHiBg/MvYDr977DGjKw/verW1+v2Q4CYL/idPu8LHXXM/r9HzNyp7TPbAOeKFlyOV
 7pCIn4oa/HWqnDFni36IPva5UF+BAQ+YUV6hhDKYRIcADocHuV2u230LRwac34Cs6XGF
 Q/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gPCYc+i9Iy87r57uStW+ARtubvlgXBH6jVAjmF4IhnU=;
 b=nOei6QveukRHqprXiJ3Rxn1PS4m1gBN9YFqa//+LcNbiIYAAEImhubEYlbgqvbSMp2
 e+egJMv42OX46j/6qnuuTGuHAqP5pDdTgNSn+nrzidUkCy1D4uMaAVaacZD7Uc80EbCF
 Sb4Q8JmMhdJj9kqbi7dZJBXpi9XO6IaQ4zmxKIxVTOQxLbmPMhIO22xw1Fpf8gKOzyTn
 kK9aM4SwsDMYcvqNPJRj8repAKi1/ACenGC67e7IfGKff9K4Z4xf4YtXapP5tgmagU+8
 QVKV+cXx4OyGKeoaYqG8hkEDG6fFc9jC8WwncnVsFaPkSOrrKt5zop4VjPtgHXGXZ4K0
 fqUA==
X-Gm-Message-State: AOAM532WZ+PK3QC7l+eqLpbMj0x3/L8T8LhngtXJtH1zkw3yIpt1P1zZ
 BrUNy3Cf6RqOHG/zKqqU3Nh2XQ==
X-Google-Smtp-Source: ABdhPJyQXVJMnqfLrDR2gjT3sPvs5VM6+4B7QNqCQiLsarQ76jozBbecP92kWQZKTuGAqkMV/ku7Vw==
X-Received: by 2002:a1c:bc57:: with SMTP id m84mr26948837wmf.163.1607942619946; 
 Mon, 14 Dec 2020 02:43:39 -0800 (PST)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id w189sm18608037wmg.31.2020.12.14.02.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 02:43:39 -0800 (PST)
Date: Mon, 14 Dec 2020 10:43:37 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC HACK PATCH] PCI: dwc: layerscape: Hack around enumeration
 problems with Honeycomb LX2K
Message-ID: <20201214104337.wbvq2gvj3wi6bvzc@holly.lan>
References: <20201211121507.28166-1-daniel.thompson@linaro.org>
 <CAL_JsqKQxFvkFtph1BZD2LKdZjboxhMTWkZe_AWS-vMD9y0pMw@mail.gmail.com>
 <20201211170558.clfazgoetmery6u3@holly.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211170558.clfazgoetmery6u3@holly.lan>
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
Cc: Roy Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Linaro Patches <patches@linaro.org>, PCI <linux-pci@vger.kernel.org>,
 Jon Nettleton <jon@solid-run.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 11, 2020 at 05:05:58PM +0000, Daniel Thompson wrote:
> On Fri, Dec 11, 2020 at 08:37:40AM -0600, Rob Herring wrote:
> > On Fri, Dec 11, 2020 at 6:15 AM Daniel Thompson
> > >     BTW I noticed many other pcie-designware drivers take advantage
> > >     of a function called dw_pcie_wait_for_link() in their init paths...
> > >     but my naive attempts to add it to the layerscape driver results
> > >     in non-booting systems so I haven't embarrassed myself by including
> > >     that in the patch!
> > 
> > You need to look at what's pending for v5.11, because I reworked this
> > to be more unified. The ordering of init is also possibly changed. The
> > sequence is now like this:
> > 
> >         dw_pcie_setup_rc(pp);
> >         dw_pcie_msi_init(pp);
> > 
> >         if (!dw_pcie_link_up(pci) && pci->ops->start_link) {
> >                 ret = pci->ops->start_link(pci);
> >                 if (ret)
> >                         goto err_free_msi;
> >         }
> > 
> >         /* Ignore errors, the link may come up later */
> >         dw_pcie_wait_for_link(pci);
> 
> Thanks. That looks likely to fix it since IIUC dw_pcie_wait_for_link()
> will end up waiting somewhat like the double check I added to
> ls_pcie_link_up().
> 
> I'll take a look at let you know.

Yes. These changes have fixed the enumeration problems for me.

I tested pci/next and I cherry picked your patch series onto v5.10 and
both are working well.

Given this fixes a bug for me, do you think there is any scope for me
to whittle down your series into patches for the stable kernels or am
I likely to find too many extra bits being pulled in?


Daniel.
