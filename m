Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 246D13D306
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 18:54:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NbgV4n3BzDqtW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 02:53:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cjJRH/ti"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Nbdf4gMnzDq9j
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 02:52:18 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id r7so1911049pfl.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 09:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DQYk/P/AHz+84MHAfqs8A9FFft/ChbHJqGQaIDzi6ok=;
 b=cjJRH/tiJROWu574Li6WdMn+vr3Phrkemo9e0MrIa7BjfXn2y19eO6hPYoPqTcaHm+
 hm86n1rLG16xTwB/lLMEZ2SGn8PMjk7ag060+cgnFYiLM2inu1qWcunQBV1YSvwfqYTT
 DgE717bOFNLWOZArTH/miO/fXl2dyCUiS6unF3rjzsK53ET9uPUrfDplIbVezPaE0owq
 T40LrouoYo1Kjly8EJOlF7nZLhlPBw95nQfBGP3R4rCFndbjLuo5+P13eHpc0hbKjwSf
 j1WcA8dmRUBq2QbCXlBPmirBES11keCDGZCylHH6F7HiSk1MO2DGiSF9oKgwoUiwsuzg
 zNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DQYk/P/AHz+84MHAfqs8A9FFft/ChbHJqGQaIDzi6ok=;
 b=rQB0np2TJBBIYfReaFByobejXGo1/D7LOymTu+CA6KyNP3Ha5A9v3qgux53oJbd558
 0xDarPfs9MPc1Ghgw88WelNjTiJFE9RZ8pRBfzzRafRFjDSeZ7753rurXRkymz8oIGue
 4y8FhhfHQCZvxTWItLiy/CVmqQmZDtf5pDuzKmVj884YimFOrAogm3KGfkDOM7kv8GsR
 F6vdMY0GXP5mTbbiX4eGHXGgf0Zd8ZfC6RKkO6eUmwoUFK3hMegztuVWe1bKw+3DiS+B
 C6sbbSKVc+iPcuQ48LoeZOKO3mxRtozZptYOh4DiCUELWOLT1jHLKH/aLKbBwP4LjD1H
 LGOQ==
X-Gm-Message-State: APjAAAX4VSF6x4eZc58Q9+UQsbTEp07WcL+GD2tyA3ORedQM6v1b2Xsc
 qCoFxg9Mz598nF6Qn2uRWquWKyGilCtvWdaTbVo=
X-Google-Smtp-Source: APXvYqwIRgwZSvbJvIgasj06odVOLwqV4e1NGaONT67RAQJDqA/rR9sRiGkufN8AoUbyfd4Xe69TJ3rJVeHoEHiPbLI=
X-Received: by 2002:a17:90b:8d2:: with SMTP id
 ds18mr3765976pjb.132.1560271935519; 
 Tue, 11 Jun 2019 09:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
 <0bea1c7c4fc06c7edabbf3185c0cbbc6e85eafd0.1559933665.git.mchehab+samsung@kernel.org>
In-Reply-To: <0bea1c7c4fc06c7edabbf3185c0cbbc6e85eafd0.1559933665.git.mchehab+samsung@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Jun 2019 19:52:04 +0300
Message-ID: <CAHp75VfTNJOGZx-PoUXLRvzghqf6bVUdJ+yFjE9hNtDLCQ1=UA@mail.gmail.com>
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

On Fri, Jun 7, 2019 at 10:04 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
> Sphinx doesn't like orphan documents:

>     Documentation/laptops/lg-laptop.rst: WARNING: document isn't included in any toctree

>  Documentation/laptops/lg-laptop.rst             | 2 ++

> diff --git a/Documentation/laptops/lg-laptop.rst b/Documentation/laptops/lg-laptop.rst
> index aa503ee9b3bc..f2c2ffe31101 100644
> --- a/Documentation/laptops/lg-laptop.rst
> +++ b/Documentation/laptops/lg-laptop.rst
> @@ -1,5 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0+
>
> +:orphan:
> +
>  LG Gram laptop extra features
>  =============================
>

Can we rather create a toc tree there?
It was a first document in reST format in that folder.

-- 
With Best Regards,
Andy Shevchenko
