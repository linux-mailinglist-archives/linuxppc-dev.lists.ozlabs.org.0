Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29545168331
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 17:23:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PGwY4R0kzDqkT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 03:23:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=macUat4O; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PGv71H8JzDqfV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 03:22:04 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id j20so2505596otq.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 08:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UESijwJloetNY8FQMqP4NxBHBgGttqQPvE09CZ9ft1c=;
 b=macUat4OhBw9DARYl7llLCgFZklb66CEJoh9cIMr3g6yESO7cALxWGslA+R7qYKrGs
 fnmKfZrgf4oKCpJCyarWrJ4UiLB6zsowKF7ZaP0X5hmt/PWvNfkyVseLF0OX092PDlNh
 jqCgungkXvg9muNuvc5UtdxiEdiRd0oLyrZ/CRtK1Bzzz9Flyiem04hAk0SnwwqncSRj
 n0Fom0Ouu0dm1sw7gA89tp1HgNtirvu3zy3vksqHoGrMdeXGvWUKxjkOg4Wc2zD/XO1c
 7fzVCJned9Xt5eFtyLaspUTh2m87sc7K+o9d2P0JWiSzZMGN6vItAdbq1RvCK9sWLksv
 9zPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UESijwJloetNY8FQMqP4NxBHBgGttqQPvE09CZ9ft1c=;
 b=Dab3PsEhKPDh60eT/32k9Uc2YamLK/0/BRIvqhAG+sQtB486QhUJZFiQ0da4C6D31s
 gQTC8twd/ZO/QQqjGh9xgtF0/lQgiZ87um8eHn7//hp7pKuPKePnk2uuG+/rNREFfmWq
 wL6rhXi6pr4NyQh92r1997ce0RdHx309w4H6nh1A7R2mNclOEenMTWlxHg+CQ6w6+rFt
 L5mOkKZQCFTaseaxqs7nai9OIZd/kKtkA8eihsnf/VKqH3XyOEZJ1llWvXf1GkzNFprf
 8z+lwaLXb9AShcTfAVVt7xVNoS/mupQKjYidTnYk1JImXFQMvGe5KRhlbyYTBKvKwby0
 MC3Q==
X-Gm-Message-State: APjAAAUZPN6vaftYE3ZAzvl6mR/c6RWOSU8+vLEb07eKAIgOrWhKRQXA
 cGsZl8J3Ux/AjR8RQtTDUpa/FA2z17dxWIeWix8IZA==
X-Google-Smtp-Source: APXvYqxUQtP3b4zLuYjsw3PWW1Xh6/3l8dvciMnwM+axT86fN3Vik9tAcpduTQUxrlW/YBnslPiYEUOP0aEHD0RypMw=
X-Received: by 2002:a05:6830:134c:: with SMTP id
 r12mr6522827otq.126.1582302121655; 
 Fri, 21 Feb 2020 08:22:01 -0800 (PST)
MIME-Version: 1.0
References: <20200221032720.33893-1-alastair@au1.ibm.com>
In-Reply-To: <20200221032720.33893-1-alastair@au1.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 21 Feb 2020 08:21:50 -0800
Message-ID: <CAPcyv4j2hut1YDrotC=QkcM+S0SZwpd9_4hD2aChn+cKD+62oA@mail.gmail.com>
Subject: Re: [PATCH v3 00/27] Add support for OpenCAPI Persistent Memory
 devices
To: "Alastair D'Silva" <alastair@au1.ibm.com>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, alastair@d-silva.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 20, 2020 at 7:28 PM Alastair D'Silva <alastair@au1.ibm.com> wrote:
>
> From: Alastair D'Silva <alastair@d-silva.org>
>
> This series adds support for OpenCAPI Persistent Memory devices, exposing
> them as nvdimms so that we can make use of the existing infrastructure.

A single sentence to introduce:

24 files changed, 3029 insertions(+), 97 deletions(-)

...is inadequate. What are OpenCAPI Persistent Memory devices? How do
they compare, in terms relevant to libnvdimm, to other persistent
memory devices? What challenges do they pose to the existing enabling?
What is the overall approach taken with this 27 patch break down? What
are the changes since v2, v1? If you incorporated someone's review
feedback note it in the cover letter changelog, if you didn't
incorporate someone's feedback note that too with an explanation.

In short, provide a bridge document for someone familiar with the
upstream infrastructure, but not necessarily steeped in powernv /
OpenCAPI platform details, to get started with this code.

For now, no need to resend the whole series, just reply to this
message with a fleshed out cover letter and then incorporate it going
forward for v4+.
