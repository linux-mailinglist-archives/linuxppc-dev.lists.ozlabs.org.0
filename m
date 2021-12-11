Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DDF4714B7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 17:23:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JBCkk2rDdz3cZ2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 03:23:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JBCkC3XbVz3bd0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Dec 2021 03:23:13 +1100 (AEDT)
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M8QNy-1mrfJ82oca-004SiB for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec
 2021 17:23:10 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso11119081wms.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 08:23:10 -0800 (PST)
X-Gm-Message-State: AOAM531rcp31G1l2q9C95equdy7nrbabGHh2J+fAbsAYSd0uPqP/jFKE
 oxqL2BmD1AkGxgtfXy9lAZItZ2ZvFDrJ7kdXyNw=
X-Google-Smtp-Source: ABdhPJyOlfLidEd9162beuC5UM1yFpg2300rafM4JRbY2mJjNOXxVFZo/cAEJoaFFS655TaSoVWjWn5yGpFZ9WnPivI=
X-Received: by 2002:a05:600c:6d2:: with SMTP id
 b18mr25037494wmn.98.1639236149109; 
 Sat, 11 Dec 2021 07:22:29 -0800 (PST)
MIME-Version: 1.0
References: <20211210221642.869015045@linutronix.de>
 <20211210221813.617178827@linutronix.de>
In-Reply-To: <20211210221813.617178827@linutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 11 Dec 2021 16:22:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0SPopq871z7hbeTZbgnpO=cnEz-4Pmi1Ko3SHFTpU-mg@mail.gmail.com>
Message-ID: <CAK8P3a0SPopq871z7hbeTZbgnpO=cnEz-4Pmi1Ko3SHFTpU-mg@mail.gmail.com>
Subject: Re: [patch V3 07/35] device: Move MSI related data into a struct
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:LVtIFRd8Q2LCBl9MSQu+DM5lmznGQCyQWyjTI9fA5H1tlG7ggSI
 anTdcPRUXU3gUbn+36Ql58GtySmlEZPjjqXRC8b9iSAXtPmzvTpbn5ebL0usgLRG0MV77QO
 hyiMs74ekMUlf3FcFNe57A229PggGBFzqYX1w+WEwbhzfdWmEXkn/r8AaguzB8m8IMxoVD2
 v1kKAxpTITCkhVdUElRhg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nwqMD2lL9yM=:GjSBvjTMGmuNxO5lI+Jnb1
 hxhmfltQO4wmWaFJOBRrsctONOGc9XMtNo2ZKH1yu2a5NtAabJoJrAB/E8xmjoMVpcWhKqfdJ
 71cTXyO6IPYO6WQerCN+ECwPIyZ9uhrDn9gAjXVamUGGjkKVPQZQUW5asFv3LEJDKgX37pHXy
 fIvTXsL/qPMzcA03ATYjZfj0bRlbQ027zI/zTb3w4xFluetNHvxNdcUC0L21ZlRHoL1OvyTJM
 QBx5fPfsBPMlODkEfBjeDqcAvzvk3jScWl/q+kvQvh+Ko40w1LC4k8sx7xdxTMRxD37AMxbwF
 6P+FTAbbq+jwDZpjH959cKjhHm+dPorho7tnth5M3pt3oG3uXCAi0s/9jOPuNCMcOUd4Wynvo
 pnbWmx9eDOOtoDUUzmsQXd/mDgGMIRrEG4IHFeuo5osIg8XpCjes4s1ERM4QVGnZORyhV86yO
 WGlFWR/a6xCkfNBQO1J9bjfhaXKB7v0C3TDFk4XCawkhS9C+mQ9BIzFRUCG2exyfrh+oa7gtq
 accMiQhaO7cgitIZYL9sf56G8DzsCKIwwi6CsakwMlwoBJ6xHWTW+ldGb0Pi5Q9wYOvq2OCAq
 h0acb+i5OsgZ/kBc5afYu844UcxFtRTz5FdHC7FXAoKxvah/lPkozHZ7ITk3/CbodYBJ8P5jA
 Mr0IVHDwmT9JDu95xtojmTKglU+4HjU5nIg5FW/P2XBShu520/JbePDwxZni8pVpzv8GhaQEF
 IyMB/1qqpHzyYgk3jeV5AaPHFZO1ot1rJBlW0C3kSNlUmWBZmiOm5tul/DsPaPfNa1sqqEzyI
 XV+d3iTMF1o3VY/xO+5QHxu/I2txClsr7xPe0yjGnummXR6gWs=
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

On Fri, Dec 10, 2021 at 11:18 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> From: Thomas Gleixner <tglx@linutronix.de>
>
> The only unconditional part of MSI data in struct device is the irqdomain
> pointer. Everything else can be allocated on demand. Create a data
> structure and move the irqdomain pointer into it. The other MSI specific
> parts are going to be removed from struct device in later steps.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
