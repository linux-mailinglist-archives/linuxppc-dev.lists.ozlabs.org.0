Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C32A62D4D16
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 22:46:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrrFy6j9JzDqsy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 08:45:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=olteanv@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dZmtXaLD; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrrCr4BJxzDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 08:44:07 +1100 (AEDT)
Received: by mail-ej1-x643.google.com with SMTP id jx16so4315670ejb.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Dec 2020 13:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TYfiACm4P9e4Q3UXzVvxYYSBgj6W7482KDX0U+gqWbs=;
 b=dZmtXaLDGCUswwrzjS8ONF2OhQRmKYjl1nzSnc3mmiJsqNbVqL3manL5sjzglo7CCY
 1wc497+Sbhlix2kE2CrMvplc808zgbRKSC03CDIRVaXDRwMrqK+7SWFQDwil2NB2dPTg
 pDdUrg0oWsnoDkoNZpHgxWJgDl8njos5JD/PPNU/lEER943nhqRrpxItMT8/mKCOrlgb
 Oh/rLXbDyZJOr6qzKQ8ogKqLAKm540ml5BK9bltrYai3mshwQvG5mLxWAumPqnD8CKSz
 YtOSQPzHKU0JffPiybQFEFyydZIsbEvTbikLd3is5hvLpi4gEcLCpdGVPZCKuwOt5yl5
 YnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TYfiACm4P9e4Q3UXzVvxYYSBgj6W7482KDX0U+gqWbs=;
 b=PCoFqp8gddWGRhbG9Czd9F1ux8lyIQV6FuUyv/vZbf1bipf93OBI3BE7hyFjy/8FhX
 /+PDFhGF9WN4Pnps4gXax/1Bh+Y26AcFM32/rWFiR4pppmkJFvptl4oaoOHSs7MdAwWJ
 873rdgVRRAVH1US5MlvjStkeUlZVGhieVueyJwc5d8L8U21NkrgRgGI360VOEIV9iH77
 UJewtfFY2qfFuzN76WgtMFtI2jpfTBv9IEZX9dhcqRgn7BuJExmLhO8pHcbSJDrTOYOn
 o5BZdAsF78GsApkAQwJVHTLS7MOhnwMo0QDZXga8LwEF+HfRWMY4+gn/fk+W89Hwl+FR
 nvAw==
X-Gm-Message-State: AOAM532hIx2XqR8jeS5b/D5DrtrksskBwONItaxIhaUfTHsOJvjWRucl
 cISOI/daTEeYPGfpXozGSvY=
X-Google-Smtp-Source: ABdhPJw8Oidd7MiYim2KDHlebjhNwIYc6G5UNWFqv7rjerwne/emDzLWDDd6gsqRcg/RCqRAXT5FGQ==
X-Received: by 2002:a17:906:4994:: with SMTP id
 p20mr3748565eju.391.1607550242169; 
 Wed, 09 Dec 2020 13:44:02 -0800 (PST)
Received: from skbuf ([188.25.2.120])
 by smtp.gmail.com with ESMTPSA id lc18sm2600554ejb.77.2020.12.09.13.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 13:44:01 -0800 (PST)
Date: Wed, 9 Dec 2020 23:43:59 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v6 0/5] PCI: Unify ECAM constants in native PCI Express
 drivers
Message-ID: <20201209214359.gt4wisqh65oscd4i@skbuf>
References: <20201209212017.vx7dps3jasjcwg6j@skbuf>
 <20201209213449.GA2546712@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209213449.GA2546712@bjorn-Precision-5520>
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
Cc: kw@linux.com, heiko@sntech.de, shawn.lin@rock-chips.com,
 Alexandru Marginean <alexm.osslist@gmail.com>, paulus@samba.org,
 thomas.petazzoni@bootlin.com, jonnyc@amazon.com, toan@os.amperecomputing.com,
 will@kernel.org, robh@kernel.org, lorenzo.pieralisi@arm.com,
 michal.simek@xilinx.com, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, rjui@broadcom.com, f.fainelli@gmail.com,
 linux-rpi-kernel@lists.infradead.org, Jonathan.Cameron@huawei.com,
 bhelgaas@google.com, jonathan.derrick@intel.com, sbranden@broadcom.com,
 wangzhou1@hisilicon.com, Michael Walle <michael@walle.cc>,
 rrichter@marvell.com, linuxppc-dev@lists.ozlabs.org, nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 09, 2020 at 03:34:49PM -0600, Bjorn Helgaas wrote:
> On Wed, Dec 09, 2020 at 11:20:17PM +0200, Vladimir Oltean wrote:
> > On Wed, Dec 09, 2020 at 02:59:13PM -0600, Bjorn Helgaas wrote:
> > > Yep, that's the theory.  Thanks for testing it!
> >
> > Testing what? I'm not following.
>
> You posted a patch that you said fixed the bug for you.  The fix is
> exactly the theory we've been discussing, so you have already verified
> that the theory is correct.
>
> I'm sure Krzysztof will update his patch, and we'll get this tidied up
> in -next again.

If you were discussing this already, I missed it. I was copied to this
thread out of the blue two emails ago. I also looked at the full thread
on patchwork, I don't see anything being said about the culprit being
the size of the config space mapping.
