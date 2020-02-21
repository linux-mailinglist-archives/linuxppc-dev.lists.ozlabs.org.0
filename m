Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0817216833A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 17:26:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PGzY284MzDqhS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 03:26:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=cBEVhpXs; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PGxr0dJDzDqfN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 03:24:31 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id 77so2490596oty.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 08:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2necOtKPRGOvCKSmF/mkYAKx6vUj3EgsCgdFv1SUhI0=;
 b=cBEVhpXst0AzntwHO7MAAC8tPgH/lHhw3JRg1tiTU84YvfHSiop6h5HEb7dD7ijKuo
 Tkw/ZNf20go4KH7TnldYOoZEAs0/HjhdC6mtapS6+Q3y/I7Q+YrEMV84Zr3jKw37sWpE
 U9Jl8f/7cOVM1MQYH54S4Vp6WSWKpzS2B9dUJOJpX4zoeMiFs4UP17D4CccHDAg8ZFR1
 vCZ/8RYSCxh9NQiUxEt36OEadxPUC7ds7oA0vIxw+TkYSm380z9btYwB+23YYwbo8b8g
 7XRdvaaGovLDozll686+2N7fCxFPusnOHgUUDjTiUfiXQ3pTNjxbkIR85nNqgJmQT6GQ
 8i+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2necOtKPRGOvCKSmF/mkYAKx6vUj3EgsCgdFv1SUhI0=;
 b=Q/5tX7ItHk+pSjZYVutexWBIdmbz3O+IZcfUJtSVxkmvQzQchZ8CpWGnlADd7YG4HZ
 ZE6hKCxf9iqAOQsrRKs/GvOiATsUNQUiCHMp7wk4aayeUIZWgNZ/pzdqNBTXv4B5gA8E
 yvhFOww+iWmYPItUxsDAK1TUebeHfdUk345QjwG4kLBzhsU8vjQPSO33iJwS/7IknZuw
 wMnKmAtCHyzDQYQOtL19hO+aIGHc/DgYUSp7n9mqws1V57GSbJXadI8c1H6d6N2q+D2Z
 5kAfiAYy06FqEK06CUOt08HJA/EuWLwV+3t2DbA/fOU9FBvK7UuU2zlkYMwZnEMO9Geg
 uy5g==
X-Gm-Message-State: APjAAAVVt7ly4f+sSL8G88wEArLsSaNqmam1UDLHH27yECWt7Epv2HvW
 9nxbe10PnhxqGcb0QQUrzqq2N8Q/w4nKxrj+VohL+Q==
X-Google-Smtp-Source: APXvYqxaf5u3WFzaIFaCrcTuxeBbhT11NwRGTSO9X8QeSchk7dKOD/6D3Clq0uqWRzW41IL9WLcTtDJa9yoQ436XJig=
X-Received: by 2002:a9d:64d8:: with SMTP id n24mr27053866otl.71.1582302269868; 
 Fri, 21 Feb 2020 08:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <CAPcyv4j2hut1YDrotC=QkcM+S0SZwpd9_4hD2aChn+cKD+62oA@mail.gmail.com>
In-Reply-To: <CAPcyv4j2hut1YDrotC=QkcM+S0SZwpd9_4hD2aChn+cKD+62oA@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 21 Feb 2020 08:24:18 -0800
Message-ID: <CAPcyv4hzZt0oqWN8y_K70h3C1S1jNw6jfNF3jPujCFmLW+MSvw@mail.gmail.com>
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

On Fri, Feb 21, 2020 at 8:21 AM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Thu, Feb 20, 2020 at 7:28 PM Alastair D'Silva <alastair@au1.ibm.com> wrote:
> >
> > From: Alastair D'Silva <alastair@d-silva.org>
> >
> > This series adds support for OpenCAPI Persistent Memory devices, exposing
> > them as nvdimms so that we can make use of the existing infrastructure.
>
> A single sentence to introduce:
>
> 24 files changed, 3029 insertions(+), 97 deletions(-)
>
> ...is inadequate. What are OpenCAPI Persistent Memory devices? How do
> they compare, in terms relevant to libnvdimm, to other persistent
> memory devices? What challenges do they pose to the existing enabling?
> What is the overall approach taken with this 27 patch break down? What
> are the changes since v2, v1? If you incorporated someone's review
> feedback note it in the cover letter changelog, if you didn't

Assumptions and tradeoffs the implementation considered are also
critical for reviewing the approach.
