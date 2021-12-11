Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 415434714BA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 17:25:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JBCn30z16z3cZ6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 03:25:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 3789 seconds by postgrey-1.36 at boromir;
 Sun, 12 Dec 2021 03:25:17 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JBCmY2Tm1z2xB0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Dec 2021 03:25:17 +1100 (AEDT)
Received: from mail-lf1-f45.google.com ([209.85.167.45]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M6DSo-1mtsGG2AKe-006eei for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec
 2021 17:25:12 +0100
Received: by mail-lf1-f45.google.com with SMTP id b1so23263953lfs.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 08:25:12 -0800 (PST)
X-Gm-Message-State: AOAM531F+TsyMNW6soCWY9qXeYE4lDX4wls7yBZQ4aaPi7VjHKURc/J5
 LqEHoo+5vaVNs+/pDoiaqaFKn6gdhpUK7Qbljgk=
X-Google-Smtp-Source: ABdhPJydOCBHCBVhL5GrxiQp2LNkO7SO9fSpEb1ktgLdLbaiYOV8bo99cpA+GLEsnha3mdPvOSWLSKg/3Dqg7U73gXw=
X-Received: by 2002:a5d:6902:: with SMTP id t2mr20632629wru.317.1639236258246; 
 Sat, 11 Dec 2021 07:24:18 -0800 (PST)
MIME-Version: 1.0
References: <20211210221642.869015045@linutronix.de>
 <20211210221815.269468319@linutronix.de>
In-Reply-To: <20211210221815.269468319@linutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 11 Dec 2021 16:24:02 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2=LKoe1nw1sZZmxFwAh+54n-Q3cMO3goHEVMQKSVSh+g@mail.gmail.com>
Message-ID: <CAK8P3a2=LKoe1nw1sZZmxFwAh+54n-Q3cMO3goHEVMQKSVSh+g@mail.gmail.com>
Subject: Re: [patch V3 34/35] soc: ti: ti_sci_inta_msi: Get rid of
 ti_sci_inta_msi_get_virq()
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:W0+0Kl2OvMzceHDADKCjiI143Pq+dfRlpoxL3x3TgIGFeOc+VTI
 lMffpuYxUZe+6Ku8uU31EwaavpJXsKzYunJmvjzShv9ZgjJwbFJGIFKbncJ9HLRHHZ2YGXY
 JhbZCL1ZX+sd/Pn+OuAfjUeljBe49lNX6VuW7eIkZDAnlVWuOEsxRntx1YdHarL5LiXkmKj
 ofewqBwjgYP4e6tyJ0eTQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VEj/xQir4XY=:MlkkxONvvBOFVt44LO0ES3
 IYtKCLX1mCKiWjMLMFIDMK9HGS609XhlfOdOfFdIo3Rkc2DTbxgfqjMTgGPzvktfnAT9AkeMO
 P3RcMizhE3WeXNVc0ITtsSd0vMyvbP/DY5Ugcdg1CZ4YTvYdZAQtbrXJy+OxlwhJ3TKCb68Sv
 xCr8ngxLnAVrUAxNxmVThxb4zXJ6pp+NeiWb4oQao+QxBMfmrx3J4yeF+xCCtw/3JPDUcOgN1
 XcyXPZTeujrQX1VmaBWuK7kstc3hOucx5N/BOA4CZXYlSbna5fXg/Miv6vOG2t9jmQfRY7w37
 XWNP4wgL4u9rktZIuVDfWVF3aQx7GIi7RWvNEH5x2MVUUd9zhqsHRHWszH3QEofHDNW34cojS
 MwnDnbZD/C6yU+xKP9BYgR7upTqaabQS7o/hdWapeF8A+vKNAEP7Ohhy2f557Ge/yoEnjDe4k
 4uY8OCn+OqGgpbpePAPsEl6BqSzoCBXhmuSepN0CecH8hXExJOPrRiDL7DL1j4vDXCMMQlNXl
 FiJnwsQdY9ZRf4b88ZiAOZI5e4QntDcU1ehfJVyzT3ADQmxutDWPVyFmD0pcm5ZroQlbdWnW7
 eJ1hNe/ENryepHgYTpdkS2/KtBRHfhTWJwBEzzLnJJuFtl/mLKgZErJBSottfJseTXp6L4z+W
 MJa16sfpF7k46R5ozezq6Ww7Ll1DXahbEYhGenTUyGEvrLgHkvgqh0bzUyMq3ECYeY+XWg0Jp
 K0AGJZkPe8i8sW3MLv8dpfZWwddCSdWz3JAq9jO+rrmPXcaUhJDznve1htEEtY77+dYZGkkvK
 IF+wFQjA986+xhAdhEuD2sx3DAIFkdPDjP6PXIgA0o4NBsnUmQ=
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
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, Will Deacon <will@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Ashok Raj <ashok.raj@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Sinan Kaya <okaya@kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>, linux-pci <linux-pci@vger.kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Megha Dey <megha.dey@intel.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Marc Zygnier <maz@kernel.org>, dmaengine@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 10, 2021 at 11:19 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> From: Thomas Gleixner <tglx@linutronix.de>
>
> Just use the core function msi_get_virq().
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: dmaengine@vger.kernel.org

Acked-by: Arnd Bergmann <arnd@arndb.de>
