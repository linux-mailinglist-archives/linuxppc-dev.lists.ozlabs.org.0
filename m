Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC5317247F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 18:05:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SzZk0yTZzDr7b
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 04:05:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=KPfzjDQt; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SzW3037SzDr13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 04:02:38 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id q81so4052773oig.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 09:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V/jADGYHp0JHjLbfNvifObEsHN9b9nWgTjEodPO7hm0=;
 b=KPfzjDQtTnijJToFyDXktoC2udwyOzB0B5n85vP7uYekSEu8BkMpLT/ZI8CK3gNjgz
 S4lijftXsqXG4e0UvQY/lM0ScFXNOzHZ8nfP6HW//fgk3or+XDKKdQ3oUsEwbm9kjbSt
 YvZJdY2AqXxidZDU2pvSxjgcEExZaJPMc5a8U6aBVjmcc0vMBekyiq3voRqtqk0KSPAx
 RFvfSk+LlSSPZbVx4Jl7Nqwk1QcuKaWmy4niKZ4SeXt+CXOmgUmLp6ojW6ui9knkVAbw
 O56thY8gft/GhQJUltLLBZzs0iZAZiPm7sIaskKsb2nHEkfDNZ+AvKn6WunU3y1NY3xL
 bvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V/jADGYHp0JHjLbfNvifObEsHN9b9nWgTjEodPO7hm0=;
 b=NZfYAOU3HigkvBdcxgn1UTe5p8uYL2lZ/kMfBw3IVdl5Bcvjj5fRGnNNBml1NF/kvq
 fKeMIj6X2VJow7i9mrsHJZUC0Qi9miV+5BsVwod6EaAh+1//HaZkm7tiaP1iryjWwQoo
 eClEjJ3CoYmiDzdCtLMJ65n69KOQMNUItrfS+oyvOw9N4tgxj4nfgQ3D+P5FBsTgeGlN
 rzB3KIUvdBH7mrqjJlufk7i8jpmNJEbIqvwZoIwe+8kChbPVZoUndaHiBOgf9JQw9S7+
 zrMBrLtDQ4O/qh2ujcDBAKRLWJvoXsFoLd0zaMXjuozKUFvNX7M+pa9104qJ9bXOesR5
 8Ihg==
X-Gm-Message-State: APjAAAVWX/zMfQH/Nl0jX1/SS9VR6q4u6UTzFEI0aRwMm1FZW9HZDhHo
 Cxxu/v1Cnmc/9Bn/bEW4DfH8bUj0nSX5sLiynJZVNw==
X-Google-Smtp-Source: APXvYqypU1i0qqgWCthMIeErQC/uy0wM3eA252xRldHq9XOYpqruxDhwC/BTw+uhQHICN4k+v1Tc+9XvQsy7JvHRZsw=
X-Received: by 2002:aca:aa0e:: with SMTP id t14mr4256386oie.149.1582822956078; 
 Thu, 27 Feb 2020 09:02:36 -0800 (PST)
MIME-Version: 1.0
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-16-alastair@au1.ibm.com>
In-Reply-To: <20200221032720.33893-16-alastair@au1.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 27 Feb 2020 09:02:25 -0800
Message-ID: <CAPcyv4jiXZrTNTOb8aY8nehVBphCOKbtDKK9ouddiHnEZSYW3A@mail.gmail.com>
Subject: Re: [PATCH v3 15/27] powerpc/powernv/pmem: Add support for near
 storage commands
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
> Similar to the previous patch, this adds support for near storage commands.

Similar comment as the last patch. This changelog does not give the
reviewer any frame of reference to review the patch.
