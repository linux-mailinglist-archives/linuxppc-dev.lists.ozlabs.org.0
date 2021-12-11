Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3573471470
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 16:27:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JBBV646QJz3cZW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 02:27:42 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JBBTg0v6sz2ynM
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Dec 2021 02:27:18 +1100 (AEDT)
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N4yNG-1mUOya05WG-010ssD for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec
 2021 16:22:00 +0100
Received: by mail-wr1-f41.google.com with SMTP id u17so19745467wrt.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 07:21:59 -0800 (PST)
X-Gm-Message-State: AOAM533S/B19Bu4mgeo9RwVs2gKyhtanBGhNPQa//tOhhWH43AX2FULr
 DnYQ7Gz6vLmZgXgUq4pXgxWg/ZPFMKCS3pD13ds=
X-Google-Smtp-Source: ABdhPJw71fHmkJDBQfwdVvTsQemVVjs0TdIXte5O3MuH5722pvreNXPnvtVfyYQ4NEpRi0VtDUcmnQ9Z/Qh6+K4QE8c=
X-Received: by 2002:a5d:530e:: with SMTP id e14mr21123035wrv.12.1639236119426; 
 Sat, 11 Dec 2021 07:21:59 -0800 (PST)
MIME-Version: 1.0
References: <20211210221642.869015045@linutronix.de>
 <20211210221813.493922179@linutronix.de>
In-Reply-To: <20211210221813.493922179@linutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 11 Dec 2021 16:21:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3U2DSm_DWS+iDkzH14hNMwyOQ77iS=W4HoAyHPh6pqUw@mail.gmail.com>
Message-ID: <CAK8P3a3U2DSm_DWS+iDkzH14hNMwyOQ77iS=W4HoAyHPh6pqUw@mail.gmail.com>
Subject: Re: [patch V3 05/35] powerpc/cell/axon_msi: Use PCI device property
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:0xYLw8dWw118qfLWRB7Iif5XIPl26l92RvRzJxQDcl0iymdgnG6
 virDopX55MMVln0iT5sXgcfNz879Ib3uvKQgKEoTxIx0ybJAYOk3a6w5kuwRjyL4dNbIj8t
 HRANAIRExtOIY2XsOVdnViOihgj99eiqIm05NxdegBQQp08//TF57x7Wm7yAFXCTKXog7Vf
 6QGXr8yDmqe6jrRHILsig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xXln1z+Mxvw=:KQGYOqQJWuvReJhXRX5ir4
 166QPh6kHoa3sf3f4xy6z8L1pD0tzWuR5rm+TJr/aOKyVSXGBOLd28vwVlKMiOPJ3305G88/9
 Sz2/G7p0X2kw32Kmo8C4tbyNv3iDTd6rWBJkQ1Wa5OiEvT3X2EbXdYy7c+6l3RjVkCSYMvMKE
 HSA2qi10xOSUNS7Ocv802DqPjTYeZocPFP/3dFK0bk5Gd8RaO+l4Etlwck4gnt4nwlTk+OfuZ
 0YsAZw8qrfTboxXSq9lvm+5cmc9ei2ekbwpiLJqRXIJmhUUjztGuly3d93ChQ469gM3rFUXIg
 fWoaD1ifH2mQtQwCyxxaGsgNZbGjAyc2izfheVKBYC/D4K9qgoSmax7U3eJOVAZUG5jE6VJiK
 V/frG/xbwZoa3BRlGDaSPxpwnef1z5AHKWIK8ZnGHWrJTxVfBrrb4OIs6P9yVFy2vWjo3P7eJ
 RZ8iNkKZ3+qn6TblT0JVX31vm/4Q8xaXEeJR+163LaWrRuUcaoWUQoho/10tkWuMqLevrEzGU
 AJ9DF3em059LAmXZja48Aro+NL/DbxlaDQFhOe5ZvqOqafgf6ZWatidlObEd+mGRJfMeZz+Xw
 TUscQE4mLubQFPS03XrcHJIpjpnx9w/tU/u5kRmZyMXoChKnXIGav/Zdg9JZY/tbdmExPdu/K
 vlQ5XVcvm97o/6irXmJXpnKWe/ptDvj5FYkr1/KnXMVjIx8Auq/kIQocjAq3J3ZgPJYHUYu5w
 Gfe3PavN6W24cm6PotkLu4F6znyckg4ic1C1EYbqKQJtV9qavQJOlV4meGaAmD3A8I4kEv/iY
 sQ1xLCF
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
> instead of fiddling with MSI descriptors.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>
