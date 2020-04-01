Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADACD19A7EF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 10:55:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sg5R37VyzDqVK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 19:55:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Bh1JR39j; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sfx96kFWzDr1D
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 19:48:29 +1100 (AEDT)
Received: by mail-ed1-x544.google.com with SMTP id w26so28677610edu.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 01:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=feZj/1ocB6XIjJoDVsEEUrA2KaXFHt0B9wSHktP2ddQ=;
 b=Bh1JR39j+h1CpltTDW6HGFEOaXTLaNjNFTs/HHcXupyutEFcwNSNmspuDLCGf1ngc3
 3JpOjmwFyMJKqlOxTzogrVowaOb1QIi3j8ZxAAP5+dTIDs2wrDYNiFzAC1pNenb81J4x
 Y0o8J2WvYge0HdtQtAaBdaJuC6fhVWSw5yAjGewymen6zoiqepG1Pu2f2Syh3qjkbnM9
 63NpYqgZavpVqDdE02NRa8sgSS+1zoZJSGdCFyiEDE6u1Wuo2Qc2ha1yyqNmK6L2A0tu
 +GaivKSH2OYfiaNQXJyXBJPXwLpUUs6miQI82ISI/kufkqup77wKyM4fD8QUJdtlbmOJ
 Hi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=feZj/1ocB6XIjJoDVsEEUrA2KaXFHt0B9wSHktP2ddQ=;
 b=AFy8KFuezl77wpKxdYGLwBj1Ml8GHGnJEPLQQV2cYPdvIbtSmaYWMIRalr/pMoPysB
 CwQZNFwLXbZUNtWJaWiTSrnf0k+TgCQioOr+mKe5Dx+usGH7E3LLuTgebloHUsMRqjlz
 iuhN2AB+TbCJfrKYMWT8sjHNkYnPEpyfNDJSdpXJRf0vrdQmDIbix/PqBhZiizP1P6iW
 pch85r4ALHcGqYuX+OXkJmvU9segKg4QIi/JPPAWTtG1E0g5Z2GWk4FLMTif7Cy6KU33
 DrTSLvtK4wEspi8uyRkr0HScRbgICgCn1hnDe9X6zU3jP6LwdgV6iboWsEJquJ3GykaF
 uHlQ==
X-Gm-Message-State: ANhLgQ2ufhuCXRXJupjEVlFegXq4a3MP19/SczJquskiVIs9HkPSORUR
 io6RANaZ0UdHXMSTAUhRbJ594fmUBumrjRqNEl90QA==
X-Google-Smtp-Source: ADFU+vuVdufBykICW7DqF15W3KALGotPW1gMa6p2yo6taAqlQuWcuvysMS1tCXsRtLbaLnYvh0bX4T16tZYwkhRj3fU=
X-Received: by 2002:a05:6402:b17:: with SMTP id
 bm23mr19586972edb.165.1585730907196; 
 Wed, 01 Apr 2020 01:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-3-alastair@d-silva.org>
In-Reply-To: <20200327071202.2159885-3-alastair@d-silva.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 1 Apr 2020 01:48:16 -0700
Message-ID: <CAPcyv4h9uDxHDb0iN+zwhPB=By8Ps8cwTyipf6b64v+ruzhchg@mail.gmail.com>
Subject: Re: [PATCH v4 02/25] mm/memory_hotplug: Allow
 check_hotplug_memory_addressable to be called from drivers
To: "Alastair D'Silva" <alastair@d-silva.org>
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
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
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

On Sun, Mar 29, 2020 at 10:23 PM Alastair D'Silva <alastair@d-silva.org> wrote:
>
> When setting up OpenCAPI connected persistent memory, the range check may
> not be performed until quite late (or perhaps not at all, if the user does
> not establish a DAX device).
>
> This patch makes the range check callable so we can perform the check while
> probing the OpenCAPI Persistent Memory device.
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  include/linux/memory_hotplug.h | 5 +++++
>  mm/memory_hotplug.c            | 4 ++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index f4d59155f3d4..9a19ae0d7e31 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -337,6 +337,11 @@ static inline void __remove_memory(int nid, u64 start, u64 size) {}
>  extern void set_zone_contiguous(struct zone *zone);
>  extern void clear_zone_contiguous(struct zone *zone);
>
> +#ifdef CONFIG_MEMORY_HOTPLUG_SPARSE
> +int check_hotplug_memory_addressable(unsigned long pfn,
> +                                    unsigned long nr_pages);
> +#endif /* CONFIG_MEMORY_HOTPLUG_SPARSE */

Let's move this to include/linux/memory.h with the other
CONFIG_MEMORY_HOTPLUG_SPARSE declarations, and add a dummy
implementation for the CONFIG_MEMORY_HOTPLUG_SPARSE=n case.

Also, this patch can be squashed with the next one, no need for it to
be stand alone.


> +
>  extern void __ref free_area_init_core_hotplug(int nid);
>  extern int __add_memory(int nid, u64 start, u64 size);
>  extern int add_memory(int nid, u64 start, u64 size);
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 0a54ffac8c68..14945f033594 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -276,8 +276,8 @@ static int check_pfn_span(unsigned long pfn, unsigned long nr_pages,
>         return 0;
>  }
>
> -static int check_hotplug_memory_addressable(unsigned long pfn,
> -                                           unsigned long nr_pages)
> +int check_hotplug_memory_addressable(unsigned long pfn,
> +                                    unsigned long nr_pages)
>  {
>         const u64 max_addr = PFN_PHYS(pfn + nr_pages) - 1;
>
> --
> 2.24.1
>
