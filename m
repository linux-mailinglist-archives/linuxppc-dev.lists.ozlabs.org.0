Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.auug.org.au [IPv6:2401:3900:2:1::4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C80EFBF45
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 06:17:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47D8qX4wXdzF5hW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 16:17:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=timur@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="hfgI9clc"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47D8nZ1qjMzF3ZH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 16:15:30 +1100 (AEDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 86893206EF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 05:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573708527;
 bh=WigUSF3alcgcj3pSwFXkYJTAsdWSBKH1LxuGN0UIWDw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hfgI9clc/bfFjOJFNB8C3UnyfZXN9St0vvpgPg/LyZdPTevrQKGiWvHgi+DnGBZaa
 ZYT84kVbh/eZSglzPmBmRMhXVUUXNHrsxH0co3c4tcKweJVZbfuqDHUDvczV5IEAu5
 OX7MG6Aqd2BpTIhh+V2DBODnIkR0Uwxqxi+myWC4=
Received: by mail-qv1-f51.google.com with SMTP id d3so1845703qvs.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 21:15:27 -0800 (PST)
X-Gm-Message-State: APjAAAXQLgggOWBxVh1uAX+GN0nLhDTrnt/paXPY+yzoLy+K4KX6Xd6M
 /Fhj8mZr+6OoGVdgsxMjaPDg0Gxb7d0ot5yChY8=
X-Google-Smtp-Source: APXvYqwlPTIblvxl8u3zUhl8hD3W9ECXciROrFiU7RcbJjYQxah0YbroDoQ4zkxAaXhihEABx4qt8MPf48+py6OCV2g=
X-Received: by 2002:ad4:462d:: with SMTP id x13mr6475849qvv.105.1573708526559; 
 Wed, 13 Nov 2019 21:15:26 -0800 (PST)
MIME-Version: 1.0
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-31-linux@rasmusvillemoes.dk>
In-Reply-To: <20191108130123.6839-31-linux@rasmusvillemoes.dk>
From: Timur Tabi <timur@kernel.org>
Date: Wed, 13 Nov 2019 23:14:49 -0600
X-Gmail-Original-Message-ID: <CAOZdJXVQ_wQLK-4uutb2e6zOt0b8FBVY3qoWdoo4UM8p7=bV0A@mail.gmail.com>
Message-ID: <CAOZdJXVQ_wQLK-4uutb2e6zOt0b8FBVY3qoWdoo4UM8p7=bV0A@mail.gmail.com>
Subject: Re: [PATCH v4 30/47] serial: ucc_uart: factor out soft_uart
 initialization
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
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
Cc: lkml <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Scott Wood <oss@buserror.net>, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 8, 2019 at 7:03 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> -       /*
> -        * Determine if we need Soft-UART mode
> -        */
>         if (of_find_property(np, "soft-uart", NULL)) {
>                 dev_dbg(&ofdev->dev, "using Soft-UART mode\n");
>                 soft_uart = 1;
> +       } else {
> +               return 0;
>         }

How about:

if (!of_find_property(np, "soft-uart", NULL))
    return 0;

And I think you should be able to get rid of the "soft_uart" variable.
