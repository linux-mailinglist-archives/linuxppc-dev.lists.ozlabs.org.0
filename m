Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D00363D573
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 20:25:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ndj61HXHzDqvY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 04:25:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GiGCJBrm"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Ndg64CYDzDqgF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 04:23:46 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id v11so7417843pgl.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 11:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RUaqGS6QUgdTDoLllogq970LN7Ava4NDdFpVFqXYY/M=;
 b=GiGCJBrmLCcwdoXR/hfEWhxRxVXP0yUu9sUUZqvg4wVFwA5vVS81R3w7B/Hws02GBs
 bQf5m5LzSY2evhzZIaPcrTxdlRnOKG6JcgzyoPlFQaOBfdx4zG/zxciv5YgK+lrLTrxM
 cYO9J/gPwcAT2TpewnRYZ31E6KAMbCy2diEh13IEFyvzxVtxzxo7VvptCqzuA/hlCovh
 ZjKXMOGRmPvdeF+5XJnjjjFZqUja5TFKSjRPTAWJT6DPCrYdGGCmiq3H5dJ2O/MfvLXb
 zKyrSiVi+o3Z7jKpHKP2VcOUjPmBH9gPMgDgTzpANCDXfrsR2Ml+cEgzRas33f/OlAYk
 2KbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RUaqGS6QUgdTDoLllogq970LN7Ava4NDdFpVFqXYY/M=;
 b=C//j5/k1sm5VpOQJ6D0sIIJD1i3Jy7wy1/MYpIZMOPdVxme6O7d12OBIpOzBQu1F5W
 E9YEaFPSI5ELPWKwyW6zQpU91f2IQBqIqFuv8sQJhvInY4R9SWhFByQOJxy57XEutE6M
 lTxI4GtYV9MtK/dO2ofhpTgkdN073R5s27Hv371xvYXQLJ8gQVd5mY7xzzjR+TMt1TmH
 ZF4cWeet2qe7oSModWtqfemOlhL26gt0nnDLdFkGwt8U3BOuYWoCuKVkqRH9p6tjEUyX
 PSR68d/KCw8iBbMa6qdjx0GfWwRH/wtzvrp55VZZt29CSGO5JsUrmf/nehLpnzem2p8X
 MdKw==
X-Gm-Message-State: APjAAAUPYz0au/idr7LCGKxzh0N6FttlfJVo33wh/oQBaznIy1pHD4Ij
 ytuaBdfcuamxbyW3+86SAZoow0OHevS2ZZMBP78=
X-Google-Smtp-Source: APXvYqz0tqszhCDpzjSzH68sStNjjm2tLdRCgCOXbFIcDIoXYykPNvT0ZevAXzhMLOzrGgeFEbCuT5n6tl8XXCDe+dk=
X-Received: by 2002:a17:90b:d8b:: with SMTP id
 bg11mr28168554pjb.30.1560277423232; 
 Tue, 11 Jun 2019 11:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
 <0bea1c7c4fc06c7edabbf3185c0cbbc6e85eafd0.1559933665.git.mchehab+samsung@kernel.org>
 <CAHp75VfTNJOGZx-PoUXLRvzghqf6bVUdJ+yFjE9hNtDLCQ1=UA@mail.gmail.com>
 <20190611140501.11ba091b@coco.lan>
In-Reply-To: <20190611140501.11ba091b@coco.lan>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Jun 2019 21:23:32 +0300
Message-ID: <CAHp75VcdMXHf=hz_m5ySZ-=fBU=qkFxry9Q-Dos9Jx0qoyHCXQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] docs: mark orphan documents as such
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, Jonathan Corbet <corbet@lwn.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Linux PM <linux-pm@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matan Ziv-Av <matan@svgalib.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, Georgi Djakov <georgi.djakov@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2019 at 8:05 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> Em Tue, 11 Jun 2019 19:52:04 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:
>
> > On Fri, Jun 7, 2019 at 10:04 PM Mauro Carvalho Chehab
> > <mchehab+samsung@kernel.org> wrote:
> > > Sphinx doesn't like orphan documents:
> >
> > >     Documentation/laptops/lg-laptop.rst: WARNING: document isn't included in any toctree
> >
> > >  Documentation/laptops/lg-laptop.rst             | 2 ++
> >
> > > diff --git a/Documentation/laptops/lg-laptop.rst b/Documentation/laptops/lg-laptop.rst
> > > index aa503ee9b3bc..f2c2ffe31101 100644
> > > --- a/Documentation/laptops/lg-laptop.rst
> > > +++ b/Documentation/laptops/lg-laptop.rst
> > > @@ -1,5 +1,7 @@
> > >  .. SPDX-License-Identifier: GPL-2.0+
> > >
> > > +:orphan:
> > > +
> > >  LG Gram laptop extra features
> > >  =============================
> > >
> >
> > Can we rather create a toc tree there?
> > It was a first document in reST format in that folder.
>
> Sure, but:
>
> 1) I have a patch converting the other files on this dir to rst:
>
>         https://git.linuxtv.org/mchehab/experimental.git/commit/?h=convert_rst_renames_v4.1&id=abc13233035fdfdbc5ef2f2fbd3d127a1ab15530
>
> 2) It probably makes sense to move the entire dir to
> Documentation/admin-guide.
>
> So, I would prefer to have the :orphan: here while (1) is not merged.

Fine to me as long as you will drop it by the mentioned effort.

-- 
With Best Regards,
Andy Shevchenko
