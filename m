Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3538FD3B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 05:38:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Dlw65rqKzF6t7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 15:38:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=timur@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZjZudCcC"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Dlt05Fc9zF41J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 15:36:24 +1100 (AEDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 291642072E
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 04:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573792582;
 bh=MPH8c5t2q8tDKDcSoX1E0hyx3wDVfXgAkaiLLTOUl9c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZjZudCcCLdf/g3NWLZHBvRh82XdZnMk7eJ22sQiOlw7tmajsXZKqdyDAe98emgwvY
 6nwvYvjTKteew+ll87yWHPn1c4j5ZnjfE9a9TggXJ8gjIhD6YjphSF3VjD6dWrKRdo
 PqU3R7d1u6K3zfYsHYrO7wKOKe9dIj3mDw5EZhWs=
Received: by mail-qt1-f174.google.com with SMTP id p20so9494098qtq.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:36:22 -0800 (PST)
X-Gm-Message-State: APjAAAWrNpBiXnPQwC7Ny/pR6Rv6treQuAmonn4hq1qfZUAGkJ8W9lrW
 htE1IdHZ9dKZTjxexPs1PgBpcTwQOnZbybUXKi0=
X-Google-Smtp-Source: APXvYqyEVfUJcKNuJBdUvGkZuJhPdcKZNhu5NkZlypIG9JAM/A9WKKwqK8Q92zF/Y3Kh5IOc/QoPwWQgkR3S7XljIAA=
X-Received: by 2002:ac8:1858:: with SMTP id n24mr11375005qtk.334.1573792581301; 
 Thu, 14 Nov 2019 20:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-47-linux@rasmusvillemoes.dk>
In-Reply-To: <20191108130123.6839-47-linux@rasmusvillemoes.dk>
From: Timur Tabi <timur@kernel.org>
Date: Thu, 14 Nov 2019 22:35:43 -0600
X-Gmail-Original-Message-ID: <CAOZdJXUX2cZfaQTkBdNrwD=jT2399rZzRFtDj6vNa==9Bmkh5A@mail.gmail.com>
Message-ID: <CAOZdJXUX2cZfaQTkBdNrwD=jT2399rZzRFtDj6vNa==9Bmkh5A@mail.gmail.com>
Subject: Re: [PATCH v4 46/47] net: ethernet: freescale: make UCC_GETH
 explicitly depend on PPC32
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
Cc: netdev <netdev@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 8, 2019 at 7:04 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> Currently, QUICC_ENGINE depends on PPC32, so this in itself does not
> change anything. In order to allow removing the PPC32 dependency from
> QUICC_ENGINE and avoid allmodconfig build failures, add this explicit
> dependency.

Can you add an explanation why we don't want ucc_geth on non-PowerPC platforms?
