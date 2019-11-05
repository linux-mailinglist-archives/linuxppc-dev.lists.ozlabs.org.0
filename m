Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC302EF300
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 02:48:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476Xcr75ctzF1vj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 12:48:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=socionext.com (client-ip=210.131.2.81;
 helo=conssluserg-02.nifty.com; envelope-from=yamada.masahiro@socionext.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="sqK+qum0"; 
 dkim-atps=neutral
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476XY53pRTzF41L
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 12:45:11 +1100 (AEDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id xA51iogn011726
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 5 Nov 2019 10:44:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com xA51iogn011726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1572918291;
 bh=US7HnlfbUATMZewUXcHUmKQ8vx87uqsdcAQJeWxPmP8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sqK+qum0s/ofCdio6VkD6ITJtwUT7fjxl1ZAhXzvq4PcS3Imp5mJO5moUHJ0njMw6
 2cDWiWKm5mQf6pO1Y5LyzrUIscWWiO+D5JbBITc3ApVvi37LdY4t8iUkt5mC8Z6upN
 31AmvCcO3U5b9uk7NIAtYSAtunMDnmGyM6AljC6eHyn5gCS3GESYovlu0syXuNAFHI
 lJVhMjZ2X/mnyO7Y9clvM8f+3iKNNrJirc0Z29vM34Sp/RbkWj1ww2YzY57byMe+Yi
 +SZFUaiqOaHHuHhtTzPXS8DVzWfDQSSMsq/0mMa5DP1/+TfoOfK9gEdqhCpMEsT1Eo
 gvqqH3NaN3V6A==
X-Nifty-SrcIP: [209.85.222.48]
Received: by mail-ua1-f48.google.com with SMTP id n41so5635961uae.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 17:44:51 -0800 (PST)
X-Gm-Message-State: APjAAAWh0PMD/qu/FD5q+W8ZGes1pds9TeMaHUhRuu9Y3lRowyD6y9Hl
 Qb6na/jcWWWMQE95+lfX+sbKiw6sVSWC14qPHeg=
X-Google-Smtp-Source: APXvYqyAJwLfrsdrDuFC5DkDPl6kKaEgQE1dM2uxxz+hFwYzm6LlI63Y2XVEPHBoyeEM8Nncmazv6eanPEcWgTNMMWA=
X-Received: by 2002:a9f:3e81:: with SMTP id x1mr13534695uai.121.1572918290038; 
 Mon, 04 Nov 2019 17:44:50 -0800 (PST)
MIME-Version: 1.0
References: <20191101061411.16988-1-yamada.masahiro@socionext.com>
 <20191101061411.16988-2-yamada.masahiro@socionext.com>
 <CAL_JsqJbmFd5wZ0RCP2baqv-bjWwzaJ+hLqtGeYjK5LPJ54dXA@mail.gmail.com>
In-Reply-To: <CAL_JsqJbmFd5wZ0RCP2baqv-bjWwzaJ+hLqtGeYjK5LPJ54dXA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 5 Nov 2019 10:44:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAThTaHpCWgGyx=qh6v7CsL6DAWfvE1g_jsNcGe-K5e_gA@mail.gmail.com>
Message-ID: <CAK7LNAThTaHpCWgGyx=qh6v7CsL6DAWfvE1g_jsNcGe-K5e_gA@mail.gmail.com>
Subject: Re: [PATCH 1/3] libfdt: add SPDX-License-Identifier to libfdt wrappers
To: Rob Herring <robh+dt@kernel.org>
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
Cc: DTML <devicetree@vger.kernel.org>, David Daney <david.daney@cavium.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob,
(+CC: David Daney)

On Mon, Nov 4, 2019 at 11:00 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, Nov 1, 2019 at 1:19 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > These are kernel source code even though they are just two-line wrappers.
> >
> > Files without explicit license information fall back to GPL-2.0-only,
> > which is the project default.
>
> That is true and these are kernel only files, but given they are just
> a wrapper around the .c files, maybe they should have the same
> license?


I just thought it at first
but this wraps two files, with different license.

include/linux/libfdt_env.h:  GPLv2 only
scripts/dtc/libfdt/fdt*.c :  GPLv2+ or BSD-2-Clause


Looking at the include/linux/libfdt_env.h,
I thought GPLv2 only would be preferred for
the kernel-specific code.

If you prefer to align with scripts/dtc/libfdt/fdt*.c
I can change it, but I would also respect
the opinion from David Daney, the author of the
following commit:


commit ab25383983fb8d7786696f5371e75e79c3e9a405
Author: David Daney <david.daney@cavium.com>
Date:   Thu Jul 5 18:12:38 2012 +0200

    of/lib: Allow scripts/dtc/libfdt to be used from kernel code



-- 
Best Regards
Masahiro Yamada
