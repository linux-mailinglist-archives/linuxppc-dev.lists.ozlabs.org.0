Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0413EE1CD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 15:03:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476DzS6K5nzF3l4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 01:03:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="L3F9qVpu"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Dvx0BTqzF3bK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 01:00:28 +1100 (AEDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D989222C5
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572876026;
 bh=OWbKtK0i0fpZ7HMq4IWDZ/zHR1wQIHsCjhclNVqI7cs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=L3F9qVpuKwq2k4DJhdeBUeaZDrY5/2BO9ZEILgx1UqbvBX47zpfteH8Riw33D90lY
 FK87rhNlLQL0Nv0Ze8GAJR2IUvzOLk8xM1+a22zySFweu+8rNFlQSXWknbwA5WDoLd
 N8cMt0+CaX99DaLgV9Pq4rTimFFfmAXLCuvpqk+U=
Received: by mail-qt1-f182.google.com with SMTP id o49so23992963qta.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 06:00:26 -0800 (PST)
X-Gm-Message-State: APjAAAWMlT/Cr9rbOX2US4Bxquk/PbevO5sL24WjRpC3MVDnx6ADl0CR
 vccKLQxwFG/UUcfdmZ4IEbF09v/d4/dZVeRP0g==
X-Google-Smtp-Source: APXvYqwC/UsXG1zJ1xc8CR86GG8c20fgOKNAVt0QWyGvdkTztw6vTdeoGSWn0GfCtBbRQCyxI47fJxmWk+2G9rlJau8=
X-Received: by 2002:a0c:d2b4:: with SMTP id q49mr21523114qvh.135.1572876025475; 
 Mon, 04 Nov 2019 06:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20191101061411.16988-1-yamada.masahiro@socionext.com>
 <20191101061411.16988-2-yamada.masahiro@socionext.com>
In-Reply-To: <20191101061411.16988-2-yamada.masahiro@socionext.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 4 Nov 2019 08:00:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJbmFd5wZ0RCP2baqv-bjWwzaJ+hLqtGeYjK5LPJ54dXA@mail.gmail.com>
Message-ID: <CAL_JsqJbmFd5wZ0RCP2baqv-bjWwzaJ+hLqtGeYjK5LPJ54dXA@mail.gmail.com>
Subject: Re: [PATCH 1/3] libfdt: add SPDX-License-Identifier to libfdt wrappers
To: Masahiro Yamada <yamada.masahiro@socionext.com>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 1, 2019 at 1:19 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> These are kernel source code even though they are just two-line wrappers.
>
> Files without explicit license information fall back to GPL-2.0-only,
> which is the project default.

That is true and these are kernel only files, but given they are just
a wrapper around the .c files, maybe they should have the same
license?

Rob
