Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D5C3962FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 17:01:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ftz5H29Rfz3090
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jun 2021 01:01:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AqMEgYi5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=AqMEgYi5; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ftz4j4Bryz2y8C
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jun 2021 01:00:52 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id r1so8504445pgk.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 May 2021 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wYKtm4IVSfVTnhnKghH2jNnLIsKH6Y+eNOaILu7ARSY=;
 b=AqMEgYi53g30HYY0imJtzNViu05fOgAo/xQtrrm9XrM3n3KYgdCy6sM36TaTmgv0v6
 XvIYBkRFfNiS9tcDp32kkkQRj9L5R+h86b+EJM1hUjC5ImiLdtusiOsddmyVTjrm3mI6
 HVyluqo0OJwH1PN9FVBpuFPsEkrQe6YRuMK7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wYKtm4IVSfVTnhnKghH2jNnLIsKH6Y+eNOaILu7ARSY=;
 b=qZd3W4g7UESyKLYnnV0enqnixBKWcqqzlerFGJTR0P1jssfEEHTNlq1uBrFaq7fWsh
 gvGu3b/5Kv7Q32fJSs1ujZE4S3aET5/2dUVithmWuiOEJJDKbKVr/iS9V2kK7GoECKmQ
 qd2rWwFcfdUhJ8pz7sX95OaYZp/IhB5Sdo4kJfAGOTzjIPmesiQKCv7bFnnBo2bD3zy4
 yFu6Z82xanCIuaezX0842uchjiCUPhNcfH0Hu6YiQIRXCR/EmYk1Y4Hdx3MTkndDlVBL
 x/M5/433k+cDi6U1RVwUyPdmFx0vB9nD2JUFNTsSezMFuQxGVxilBX/tFZQf6anDhAL+
 rsOw==
X-Gm-Message-State: AOAM533AydhOQ6YppEAqoG5NLZ2NPGq2jLFkpX8texmPh/5IeROWEyQH
 p3zcrTrEC2iIB3R2phMEe9QEYqKpyYzRQg==
X-Google-Smtp-Source: ABdhPJxUDU7osfC8ZnGxv0akv5sLQHL54aA1vzLvzNowBMscZLy5dNwirHjLR00PKqqNNcE0sLXDuA==
X-Received: by 2002:a65:58c8:: with SMTP id e8mr1805223pgu.20.1622473248943;
 Mon, 31 May 2021 08:00:48 -0700 (PDT)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com.
 [209.85.210.180])
 by smtp.gmail.com with ESMTPSA id b23sm11463988pft.162.2021.05.31.08.00.48
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 08:00:48 -0700 (PDT)
Received: by mail-pf1-f180.google.com with SMTP id f22so9243398pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 May 2021 08:00:48 -0700 (PDT)
X-Received: by 2002:a6b:690c:: with SMTP id e12mr17489820ioc.69.1622473237437; 
 Mon, 31 May 2021 08:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-2-tientzu@chromium.org>
 <170a54f2-be20-ec29-1d7f-3388e5f928c6@gmail.com>
 <20210527130211.GA24344@lst.de> <bab261b4-f801-05af-8fd9-c440ed219591@amd.com>
 <e59d4799-a6ff-6d13-0fed-087fc3482587@amd.com>
In-Reply-To: <e59d4799-a6ff-6d13-0fed-087fc3482587@amd.com>
From: Claire Chang <tientzu@chromium.org>
Date: Mon, 31 May 2021 23:00:26 +0800
X-Gmail-Original-Message-ID: <CALiNf29=suiQbDL28tBUXt6-E+-JJC_76X9Uxcdk2s+MSXrp2g@mail.gmail.com>
Message-ID: <CALiNf29=suiQbDL28tBUXt6-E+-JJC_76X9Uxcdk2s+MSXrp2g@mail.gmail.com>
Subject: Re: [PATCH v7 01/15] swiotlb: Refactor swiotlb init functions
To: Tom Lendacky <thomas.lendacky@amd.com>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 sstabellini@kernel.org, Jim Quinlan <james.quinlan@broadcom.com>,
 xypron.glpk@gmx.de, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 28, 2021 at 12:32 AM Tom Lendacky <thomas.lendacky@amd.com> wrote:
>
> On 5/27/21 9:41 AM, Tom Lendacky wrote:
> > On 5/27/21 8:02 AM, Christoph Hellwig wrote:
> >> On Wed, May 19, 2021 at 11:50:07AM -0700, Florian Fainelli wrote:
> >>> You convert this call site with swiotlb_init_io_tlb_mem() which did not
> >>> do the set_memory_decrypted()+memset(). Is this okay or should
> >>> swiotlb_init_io_tlb_mem() add an additional argument to do this
> >>> conditionally?
> >>
> >> The zeroing is useful and was missing before.  I think having a clean
> >> state here is the right thing.
> >>
> >> Not sure about the set_memory_decrypted, swiotlb_update_mem_attributes
> >> kinda suggests it is too early to set the memory decrupted.
> >>
> >> Adding Tom who should now about all this.
> >
> > The reason for adding swiotlb_update_mem_attributes() was because having
> > the call to set_memory_decrypted() in swiotlb_init_with_tbl() triggered a
> > BUG_ON() related to interrupts not being enabled yet during boot. So that
> > call had to be delayed until interrupts were enabled.
>
> I pulled down and tested the patch set and booted with SME enabled. The
> following was seen during the boot:
>
> [    0.134184] BUG: Bad page state in process swapper  pfn:108002
> [    0.134196] page:(____ptrval____) refcount:0 mapcount:-128 mapping:0000000000000000 index:0x0 pfn:0x108002
> [    0.134201] flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
> [    0.134208] raw: 0017ffffc0000000 ffff88847f355e28 ffff88847f355e28 0000000000000000
> [    0.134210] raw: 0000000000000000 0000000000000001 00000000ffffff7f 0000000000000000
> [    0.134212] page dumped because: nonzero mapcount
> [    0.134213] Modules linked in:
> [    0.134218] CPU: 0 PID: 0 Comm: swapper Not tainted 5.13.0-rc2-sos-custom #3
> [    0.134221] Hardware name: ...
> [    0.134224] Call Trace:
> [    0.134233]  dump_stack+0x76/0x94
> [    0.134244]  bad_page+0xa6/0xf0
> [    0.134252]  __free_pages_ok+0x331/0x360
> [    0.134256]  memblock_free_all+0x158/0x1c1
> [    0.134267]  mem_init+0x1f/0x14c
> [    0.134273]  start_kernel+0x290/0x574
> [    0.134279]  secondary_startup_64_no_verify+0xb0/0xbb
>
> I see this about 40 times during the boot, each with a different PFN. The
> system boots (which seemed odd), but I don't know if there will be side
> effects to this (I didn't stress the system).
>
> I modified the code to add a flag to not do the set_memory_decrypted(), as
> suggested by Florian, when invoked from swiotlb_init_with_tbl(), and that
> eliminated the bad page state BUG.

Thanks. Will add a flag to skip set_memory_decrypted() in v9.

>
> Thanks,
> Tom
>
> >
> > Thanks,
> > Tom
> >
> >>
