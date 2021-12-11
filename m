Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 840D647151E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 18:54:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JBFlH4h2Sz3cYT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 04:54:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JBFkm35Cyz2xCB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Dec 2021 04:53:50 +1100 (AEDT)
Received: from mail-wm1-f46.google.com ([209.85.128.46]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N3KkM-1mW19v3hHm-010P0m for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec
 2021 18:53:45 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso11239045wms.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 09:53:45 -0800 (PST)
X-Gm-Message-State: AOAM530GhUgKJFsjj6xVNwi7WdVNiM2Gey7gtpJYqHYvSWaDnDYoTTs/
 If/tjPGPFQ/I7msFkpzO+7wNH5qtbr4RHQuO6pU=
X-Google-Smtp-Source: ABdhPJz9JqWJLeTUfS5IahRcetLl+JbMiIvXpgsv1eGAXoUb1XDPjjtJEfoNcEXB+cjjosPGuUvpUWQic5X/F+X6I8s=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr24672882wmb.1.1639236184421;
 Sat, 11 Dec 2021 07:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20211210221642.869015045@linutronix.de>
 <20211210221813.928842960@linutronix.de>
In-Reply-To: <20211210221813.928842960@linutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 11 Dec 2021 16:22:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a00M1MGPEwMQpgGJ9-g9-P6e9wo8G1frfVMqJ4bRp1Okg@mail.gmail.com>
Message-ID: <CAK8P3a00M1MGPEwMQpgGJ9-g9-P6e9wo8G1frfVMqJ4bRp1Okg@mail.gmail.com>
Subject: Re: [patch V3 12/35] soc: ti: ti_sci_inta_msi: Allocate MSI device
 data on first use
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:goIvRmBq6GW605QwxHNzgR80bP+pjoP9H6gy436CPjD6DGAN2s3
 7+QX5+hjW/5x0CD7kfMWLPpCSZc/8AbAZ9a0m5wW9DrloraDTkhb2Es01kjhhtY+QqX72Tz
 tpZt3mV5VvsPpBvYKUVN1r7rBuAL45Ii//MYlM4HRLpo7MZipUK7bw0QyIoDSkanPmM+2u1
 o/O4oIj3ULSng0nq4RsQA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:W7311HDxBoc=:7LNSBUA2sTU747yIP+a0E/
 HGaPL1BEzKQu3XF3kHAN3O+zhIVdjBuKudDXgNejoUKMrzit+Dtg2VukE90P9T4D5xIpozs4F
 4PCwRJL4zBj8F9vEEgvrFL9G/q+P51MoTuO+3hWFxAPnmUVtBfjdxXnLuNn6YFiyv0zTE28VB
 5LDKI2BhOZUAExwklTFbrgzL+Otdaip7zfXDOp9hVOk0E2TahTbdk5Su4NfBs5y+dL4N7KsYs
 s4NebLZefQ3nbCINGwEbE5iXRrFTTZgDFQP1YVz70CIeqWspMNsTP+ZxuB1UcyPijXBVXM9Ov
 Mrmb42JFO+Gka86o2PO8YUNIqRBUlBRbNnp82G3Y/upcTOLsMkj83DA8H1yGP6jC3xPirogmd
 hWjRlwUB4ZgLuyksJcBsK5thE96ifxwoB63BiDIiV2Xjm5tMcAxVVRXMja2jIpkrJkxf57xhB
 13t/RYdRssKRUmFE652DsoC9XE9SC5x84Ou9B5jkuDB1q1V7ku9wr8ruFTxrrf4ql4+GewLZX
 X2gVQ19ZLWA/4wAv5JE+eClgU1TtE+5rnzrA48/WaD2dVtoxwQrB9XQVhzonngE52h/uxUd78
 1SSQZG+CVY1FR3m2cAPEL4c30WdsXn9FoSa86fgCM6AxUJyaxj8KBwxaHPQL7KnrXLEiB+CnI
 9QwxzWuwlnsKyUjUo125mJAW89D+MnCUy5337zSc+vIsIL5+ivmbpdDiY9NHk2LfyXtOtoWq0
 lnheROE4c9CaNR8T1Ds1QDHJPOEMQ41S2bJs6+4VFwO0tV2bQp2oe9nzy9tcDtPsnfWqC4L4R
 uN+GjP1HA63UgAJYgRCVJJowgkyacO9ucYDIgkeqCUT6Tr5KYA=
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
 Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
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
> Allocate the MSI device data on first invocation of the allocation function.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org

Acked-by: Arnd Bergmann <arnd@arndb.de>
