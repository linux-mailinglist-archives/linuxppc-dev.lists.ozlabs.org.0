Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A7219BAC4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 05:52:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t8JZ1KqmzDrJt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 14:51:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j1BLyfPi; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t8Gf1jnLzDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 14:50:17 +1100 (AEDT)
Received: by mail-il1-x141.google.com with SMTP id t6so2238755ilj.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 20:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=un3fCtdFL30YthKT96CUaub/mKOgXUtAMj2aFT/0PG4=;
 b=j1BLyfPilq3TJB3KimcIBBGzUr9NSBHL9CZX0ZLvnEhr10RUE+BzgwAVbkboZvzJbw
 p3BYhlMqx54KQgTKkG5lwMplSjQXdoNkXd6tEJKK3Ow86YPUz9oF50vYJT+DfEqEOxYC
 9orFV88QTGN5X23IO494ia9LQ6tqUZLtLTwAChrveledyaZs21kUVGzJaxM2U41am4FJ
 Yzm4Yffn1e/pPB99dk1RtDx+wheEOC6UxXljP5f2wz0KZBjj7tsaeqI0Zzkl2tGQPABp
 D6g9lryQGxQKow4hC6WDUEqU58ef+Z9XAu/Dw2FHqwgyQtnWJzmpiAtoYyW7fB3tXiP9
 JaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=un3fCtdFL30YthKT96CUaub/mKOgXUtAMj2aFT/0PG4=;
 b=LRa9VQGQeJlUCet9lifRqkBXoMjATHXJPRSCY4mEMactVtj1ZVpZ99wohusH5eYZnE
 +qS3HI20O1w6ClVN1GFKfcRffS0fq9b7VhLJ3V7ndmx5owsR36FJqsU2TwL3esMSzXlA
 QolMA10KZoXs1ZBLdo5HzG6ijSjbuKEY4O6NM355dm5fDdhQflhKOwK2J5Gy+Jb1BgbB
 O+BhmSrCCkY2bmLQfOUrfloKwEAKl5snRGip+f242Ijb0nSjCrZIQ/2beadifWq/DQ72
 CUXUZw4OeIVsU95dNhR3usmZ0yXZoZ7LPRDp1pmsSGzN+1rjir50nCuAe7zsaIKSArtW
 ecxQ==
X-Gm-Message-State: AGi0PuZHp8kQSEH9u8waf46FUTprL4wOFp1OXjR5r6VxgpkaPTAT7d10
 88yE2EiNPnfNPCd1VG//uWSjRFecl6LL8O0zZ2o=
X-Google-Smtp-Source: APiQypJyEN+5v6EGwS7GGD77C8TR5iHpI3+yZLJ2qJhUBFcMxf+gIEB07Pj3Y1zyNjFY+2mASs/kfz/PFBneqBUdOvU=
X-Received: by 2002:a92:39cc:: with SMTP id h73mr1225341ilf.298.1585799414632; 
 Wed, 01 Apr 2020 20:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <CAPcyv4iJYZBVhV1NW7EB6-EwETiUAy6r1iiE+F+HvFXfGZt9Aw@mail.gmail.com>
 <2d6901d60877$16aa7a90$43ff6fb0$@d-silva.org>
 <87imiituxm.fsf@mpe.ellerman.id.au>
In-Reply-To: <87imiituxm.fsf@mpe.ellerman.id.au>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 2 Apr 2020 14:50:03 +1100
Message-ID: <CAOSf1CHdpFyT_6zetKM6eHDK3AT8-UNTzjdd2y+QqYT2AO9VDw@mail.gmail.com>
Subject: Re: [PATCH v4 00/25] Add support for OpenCAPI Persistent Memory
 devices
To: Michael Ellerman <mpe@ellerman.id.au>
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
 Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Alastair D'Silva <alastair@d-silva.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 2, 2020 at 2:42 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> "Alastair D'Silva" <alastair@d-silva.org> writes:
> >> -----Original Message-----
> >> From: Dan Williams <dan.j.williams@intel.com>
> >>
> >> On Sun, Mar 29, 2020 at 10:23 PM Alastair D'Silva <alastair@d-silva.org>
> >> wrote:
> >> >
> >> > *snip*
> >> Are OPAL calls similar to ACPI DSMs? I.e. methods for the OS to invoke
> >> platform firmware services? What's Skiboot?
> >>
> >
> > Yes, OPAL is the interface to firmware for POWER. Skiboot is the open-source (and only) implementation of OPAL.
>
>   https://github.com/open-power/skiboot
>
> In particular the tokens for calls are defined here:
>
>   https://github.com/open-power/skiboot/blob/master/include/opal-api.h#L220
>
> And you can grep for the token to find the implementation:
>
>   https://github.com/open-power/skiboot/blob/master/hw/npu2-opencapi.c#L2328

I'm not sure I'd encourage anyone to read npu2-opencapi.c. I find it
hard enough to follow even with access to the workbooks.

There's an OPAL call API reference here:
http://open-power.github.io/skiboot/doc/opal-api/index.html

Oliver
