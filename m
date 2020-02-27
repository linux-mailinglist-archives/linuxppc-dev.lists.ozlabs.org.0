Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C105172469
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 18:04:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SzXc5XpNzDr0x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 04:04:00 +1100 (AEDT)
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
 header.s=20150623 header.b=uAn0b8d7; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SzV05r1fzDqvx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 04:01:40 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id w6so3622134otk.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 09:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S6h30Tw2mjD0V+USDZTW8hFhBkYs512Lqr51yu3+ofs=;
 b=uAn0b8d75rtFVOIdOZnsmQfugjpQalJefb4ste8jolUNr1Yv8HzUsChA5IZdX6dVwd
 XioJKiTWbGnDtU4IboFdBuWNdSUJyhqOywZAqPHtfAPsP5EE2Vctx7h4d3HzmAz8kJg2
 QEZGCgmxda9Q1U7l8UKx5rYUE8e0CalNOfmq1Gr0p48T3nigCDKHxAA95PerIyA9cG+e
 dR6hBEjqTyDoYw9c1pPJAGrnBH4XrcTdP2uQp8VES5MNja8u2NBJLM/amQM8kZtjM4o2
 775/8oUqrrg44OGDHSVN//FW3bxKZ/Q8bzo3dFUV9T7ZLLB9OUQvlYn0dAJ0bMRvvuyk
 8XAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S6h30Tw2mjD0V+USDZTW8hFhBkYs512Lqr51yu3+ofs=;
 b=H5afaubYmuib+0GHIamyHVsH5gNYiRe5ApNDv5x3vLXTnBqLhZp5tCcWx4bKiow/en
 xyDr6Li1qjlQkmLU/fRCgJHi8ygWbWdppb21GxBIEkZXG9qgw1ghaue8WQ19lg1iCBkb
 yWgHFHGKT3AWWyKt7gcdUbSG8KEdLwlZvzkVZL70J8sPvyGpcfWq7GMgTklEWn+aidr1
 69spbSVxcNP/YCGej059tKyZU3JyjdqVmcDVjcZOGzle/5eL+v7IhMTZxdqjLbBNpini
 XzS1zWT1eiCmSrH59H47pPw7WZydiMdrxR0xRhUFBdC+ee4Qvh/GVRPqfKsSOuCbrulT
 miMw==
X-Gm-Message-State: APjAAAUAOD7XFgd1bUl6IvNNfK3YgTGh4Z9Uddk3mfS3mZh0T1fFbTeM
 oLafF1x4g9DPhvPK08qJh3av4vyWZAIeCZ2+rBl9dA==
X-Google-Smtp-Source: APXvYqyXwQILrbtHCsUHMWn42meoZX0KXIZsOEVsgrRpEJ3IcJaY2hGUVFuyZ1kdlGiQhmRiXVOeUC0xDwMJYMZQufs=
X-Received: by 2002:a9d:64d8:: with SMTP id n24mr525264otl.71.1582822896420;
 Thu, 27 Feb 2020 09:01:36 -0800 (PST)
MIME-Version: 1.0
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-15-alastair@au1.ibm.com>
In-Reply-To: <20200221032720.33893-15-alastair@au1.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 27 Feb 2020 09:01:25 -0800
Message-ID: <CAPcyv4iJahL8w3mjfS3C6Pb5PgAsN9+7=FDVgtndU2oHmYYUgQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/27] powerpc/powernv/pmem: Add support for Admin
 commands
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
> This patch requests the metadata required to issue admin commands, as well
> as some helper functions to construct and check the completion of the
> commands.

What are the admin commands? Any pointer to a spec? Why does Linux
need to support these commands?
