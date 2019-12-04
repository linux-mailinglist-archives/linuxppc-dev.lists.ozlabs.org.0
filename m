Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A4611208E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 01:12:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SK6P4cXbzDqNC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 11:12:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="n+endFyk"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SK4Z5FFwzDq7F
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 11:10:37 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id x3so4680474oto.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2019 16:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bP/Z58Vpywuyv/5D0jzMkQmzI1y6rfhslg4IeZkkfuo=;
 b=n+endFykFTnqubh50VPrXWkbnh1C17bRb+kJ9KNBP/OIi7x5Gt2jj1jE4QZA7KJurY
 AmrrjwyLa9EL2YmIn51znrTe82kgYxVYb4tLoDdwL2i+vPlgbkpVcj6m7pMlSdjd9sS2
 r9MtD6OKyJPruXqeyonngHAeBsm12j1uI3P8b3sknK6mPanlO+r4UIVQ1V03cycZtXhz
 6S2haS740B2yykeUeD2AmsBNf9OQYJjoQ0R/vwHSG3uAXmE6/A06XwFO6stEeNKU2v3l
 cu9GPX1+3bpbLQBsXGff+J5r4P4AFK8ST082lrYg48CPCG2n/qjxNBaFyeCcsyLSWGFE
 S4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bP/Z58Vpywuyv/5D0jzMkQmzI1y6rfhslg4IeZkkfuo=;
 b=ULxLUMJad5Zylnxgyb1dArMqhbZZrMHFKH+YvBu3DJg9cDuo5VYD53+5/jJhjJCTJ/
 B/HrtIcuwL1ImoLUU8XNsc8Vslj95tveTS20vx4Ns8q2ix+ilzq6A6Pmr/Q89KVIDUhb
 jkDgKV0RO6251RXbig5WycwtaJ8Tma0OcoVNIDGJKU/G6MEzeKHRl8Scc4i3SDQb1x72
 msHPTvzzfDV7jhv1FHvvXDiXjuFFKzBB1iUBxLWBRQZPZeV4S1EGGqpccFbv7eWkhztx
 a2c1SXHgDf+2hss+7Wc2OGNnESW4gqVpDIR7MAySmuWwKJtNOMZhhz9HleAOP2Ajx5a1
 OVfQ==
X-Gm-Message-State: APjAAAVzASY4xPLFDbl48+U5pceSkVEyxajA1OsErozXoyHOEBqCr5Ew
 SDxDDzJrVDIHb14WJ1qhR+PF/n/FCJbpeZibADnxAQ==
X-Google-Smtp-Source: APXvYqxo0TCLXhSv/bqImk1LBzsS+WuhFsZnPo87Ddb1FLy6KXZX2IyaJ7m+s1dMLiBho5Jej4+R6eEkMFQ/ORNprE4=
X-Received: by 2002:a9d:6f11:: with SMTP id n17mr511782otq.126.1575418234712; 
 Tue, 03 Dec 2019 16:10:34 -0800 (PST)
MIME-Version: 1.0
References: <20191203034655.51561-1-alastair@au1.ibm.com>
 <20191203034655.51561-3-alastair@au1.ibm.com>
In-Reply-To: <20191203034655.51561-3-alastair@au1.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 3 Dec 2019 16:10:23 -0800
Message-ID: <CAPcyv4hhK1dyqqe=CwnGfd=hRdUJn0pL6scCUgCz2R+bijZvYg@mail.gmail.com>
Subject: Re: [PATCH v2 02/27] nvdimm: remove prototypes for nonexistent
 functions
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
 Alexey Kardashevskiy <aik@ozlabs.ru>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, alastair@d-silva.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 2, 2019 at 7:48 PM Alastair D'Silva <alastair@au1.ibm.com> wrote:
>
> From: Alastair D'Silva <alastair@d-silva.org>
>
> These functions don't exist, so remove the prototypes for them.
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---

This was already merged as commit:

    cda93d6965a1 libnvdimm: Remove prototypes for nonexistent functions

You should have received a notification from the patchwork bot that it
was already accepted.

What baseline did you use for this submission?
