Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A998C800C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 04:43:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IT4m7iRS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgWTw0SrTz3cWr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 12:43:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IT4m7iRS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=oohall@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgWTC26GQz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 12:42:21 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1ed012c1afbso1074035ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 19:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715913735; x=1716518535; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iu2nPLySUoXUvyZFL//KZJHIe3bVp51aDCyU25xG8Wc=;
        b=IT4m7iRSN9kekbtHta39Sphe1uCar83EH3bVfwvLRmH/p5OYg5edrFlSYNXMXUSC1b
         4dZYGsHMqEN22CstUXhwydaHhhzJa/99Ok5Dkiz8fsg6IuJchEj9mvNdlzmTBczt9cy3
         a6qveYuP6afXiOWuuEtmM7NdVeCh0CVxGZu7ncuUe9L8+rdUbfByer7aUiduYP1g3vNN
         L+vPYF0+tKZwhGwaWQuFVkfOtliNYPQh1ZIJ5+yxVJ7cXpX+T/G1DaLCrUF56PZbUesO
         K0G8fgyKFHT8bD97ofsOcSp+8rjymJZs6GLZfQ/sfy5GxvjxKaFZ1xqZqftDaTgntX0d
         ObEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715913735; x=1716518535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iu2nPLySUoXUvyZFL//KZJHIe3bVp51aDCyU25xG8Wc=;
        b=LX++5SoZf71gtvhxQ/aG0o4EwP32wX+wPWm34hbZHzl6cwZuVLiOgcIIK22AZIo5Y1
         Jg60Tl1oHo7hRWBnvJzwE2kUe+pqn/uPG0Qvbhdm08rCS2eFPxForhEKBl+XFNpFV2cO
         pJKI2UEEjwhVvQ9M9HCzuop0UUbgD2SzCeMpd1YR478ZdbT547DU9q36N9VcYKNg6ZdQ
         bSlDk3WApWfpPcaM7zcH09F5smXlSfZpu6Z6T55qVZxaztkM6Y6scnEyguzKdoLmD1ae
         IfuGmBJhuh7ebto/1oqbVYM8z2Ad8Eo/oBsbRWSjGhe4CFrlaxfkUlKaBbyM+rrxEeC7
         vcRw==
X-Gm-Message-State: AOJu0YxAXcKfRHxFlmBcmwI+bmL+jalAhBpd5iS6t7pYsFhw0fqAUk8l
	2OzVm22wcJI3zVDMcE2GXKLoaHMDGvuZi7FbkDnbweewuZGPJncD35jCnrJlXkaPeHMdnJBznqE
	OvyQs72Tl8yp+iLBskRJd45xCXzw=
X-Google-Smtp-Source: AGHT+IE7uRqBXeAzMfuqLbYuTXVXbvlPnrQXyKR5487DosEK/gQYeAYo0nrbJDK9UIA4h+1m4rmLYPVdqJ4nkX+rXu4=
X-Received: by 2002:a17:903:1cf:b0:1e7:b6f4:2d77 with SMTP id
 d9443c01a7336-1ef4318d7aamr290234415ad.22.1715913734487; Thu, 16 May 2024
 19:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240514135303.176134-1-krishnak@linux.ibm.com> <20240514135303.176134-3-krishnak@linux.ibm.com>
In-Reply-To: <20240514135303.176134-3-krishnak@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 17 May 2024 12:42:03 +1000
Message-ID: <CAOSf1CFDCTMdmrjoSRdP09rJgtzPVDnCPXpfS-S+J7XKHzKRCw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc: hotplug driver bridge support
To: Krishna Kumar <krishnak@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Gaurav Batra <gbatra@linux.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, mahesh@linux.ibm.com, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Brian King <brking@linux.vnet.ibm.com>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 14, 2024 at 11:54=E2=80=AFPM Krishna Kumar <krishnak@linux.ibm.=
com> wrote:
>
> There is an issue with the hotplug operation when it's done on the
> bridge/switch slot. The bridge-port and devices behind the bridge, which
> become offline by hot-unplug operation, don't get hot-plugged/enabled by
> doing hot-plug operation on that slot. Only the first port of the bridge
> gets enabled and the remaining port/devices remain unplugged. The hot
> plug/unplug operation is done by the hotplug driver
> (drivers/pci/hotplug/pnv_php.c).
>
> Root Cause Analysis: This behavior is due to missing code for the DPC
> switch/bridge.

I don't see anything touching DPC in this series?

> *snip*
>
> Command for reproducing the issue :
>
> For hot unplug/disable - echo 0 > /sys/bus/pci/slots/C5/power
> For hot plug/enable -    echo 1 > /sys/bus/pci/slots/C5/power
>
> where C5 is slot associated with bridge.
>
> Scenario/Tests:
> Output of lspci -nn before test is given below. This snippet contains
> devices used for testing on Powernv machine.
>
> 0004:02:00.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
> 0004:02:01.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
> 0004:02:02.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
> 0004:02:03.0 PCI bridge [0604]: PMC-Sierra Inc. Device [11f8:4052]
> 0004:08:00.0 Serial Attached SCSI controller [0107]:
> Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3 [1000:00c9] (rev 01)
> 0004:09:00.0 Serial Attached SCSI controller [0107]:
> Broadcom / LSI SAS3216 PCI-Express Fusion-MPT SAS-3 [1000:00c9] (rev 01)
>
> Output of lspci -tv before test is as follows:
>
> # lspci -tv
>  +-[0004:00]---00.0-[01-0e]--+-00.0-[02-0e]--+-00.0-[03-07]--
>  |                           |               +-01.0-[08]----00.0  Broadco=
m / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
>  |                           |               +-02.0-[09]----00.0  Broadco=
m / LSI SAS3216 PCI-Express Fusion-MPT SAS-3
>  |                           |               \-03.0-[0a-0e]--
>  |                           \-00.1  PMC-Sierra Inc. Device 4052
>
> C5(bridge) and C6(End Point) slot address are as below:
> # cat /sys/bus/pci/slots/C5/address
> 0004:02:00
> # cat /sys/bus/pci/slots/C6/address
> 0004:09:00

Uh, if I'm reading this right it looks like your "slot" C5 is actually
the PCIe switch's internal bus which is definitely not hot pluggable.
I find it helps to look at the PCI topology in terms of where the
physical PCIe links are. Here we've got:

- A link between the PHB (0004:00:00.0) and the switch upstream port
(0004:01:00.0)
- A link from switch downstream port 0 (0004:02:00.0) to nothing
- A link from switch downstream port 1 (0004:02:01.0) to a SAS card
- A link from switch downstream port 2 (0004:02:02.0) to a SAS card
- A link from switch downstream port 2 (0004:02:03.0) to nothing

Note that there's no PCIe link between the switch upstream port
(0004:01:00.0) and the downstream ports on bus 0004:02. The connection
between those is invisible to us because it's custom bus logic
internal to the PCIe switch ASIC. What I think has happened here is
that system firmware has supplied bad PCIe slot information to OPAL
which has resulted in pnv_php advertising a slot in the wrong place.
Assuming this following the usual IBM convention I'd expect the bridge
device for C5 to be the PHB's root port and the bus should be 0004:01.
It might be worth adding some logic to pnv_php to verify the PCI
bridge upstream of the slot actually has the PCIe slot capability to
guard against this problem.

> Hot-unplug operation on slot associated with bridge:
> # echo 0 > /sys/bus/pci/slots/C5/power
> # lspci -tv
>  +-[0004:00]---00.0-[01-0e]--+-00.0-[02-0e]--
>  |                           \-00.1  PMC-Sierra Inc. Device 4052

Yep, "powering off" C5 doesn't remove the upstream port device. This
would create problems if you physically removed the card from C5 since
the kernel would assume the switch device is still present.

> *snip*


> diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
> index 38561d6a2079..bea612759832 100644
> --- a/arch/powerpc/kernel/pci_dn.c
> +++ b/arch/powerpc/kernel/pci_dn.c
> @@ -493,4 +493,36 @@ static void pci_dev_pdn_setup(struct pci_dev *pdev)
>         pdn =3D pci_get_pdn(pdev);
>         pdev->dev.archdata.pci_data =3D pdn;
>  }
> +
> +void pci_traverse_sibling_nodes_and_scan_slot(struct device_node *start,=
 struct pci_bus *bus)
> +{
> +       struct device_node *dn;
> +       int slotno;
> +
> +       u32 class =3D 0;
> +
> +       if (!of_property_read_u32(start->child, "class-code", &class)) {
> +               /* Call of pci_scan_slot for non-bridge/EP case */
> +               if (!((class >> 8) =3D=3D PCI_CLASS_BRIDGE_PCI)) {
> +                       slotno =3D PCI_SLOT(PCI_DN(start->child)->devfn);
> +                       pci_scan_slot(bus, PCI_DEVFN(slotno, 0));
> +                       return;
> +               }
> +       }
> +
> +       /* Iterate all siblings */
> +       for_each_child_of_node(start, dn) {
> +               class =3D 0;
> +
> +               if (!of_property_read_u32(start->child, "class-code", &cl=
ass)) {
> +                       /* Call of pci_scan_slot on each sibling-nodes/br=
idge-ports */
> +                       if ((class >> 8) =3D=3D PCI_CLASS_BRIDGE_PCI) {
> +                               slotno =3D PCI_SLOT(PCI_DN(dn)->devfn);
> +                               pci_scan_slot(bus, PCI_DEVFN(slotno, 0));
> +                       }
> +               }
> +       }

If you're going to iterate over all the DT nodes why not just scan all
of them rather than special casing bridges? IIRC current logic is the
way it is because PowerVM only puts single devices under a PHB and in
the PowerNV (pnv_php) case the PCIe spec guarantees that only device 0
will be present on the end of a link. If you want to handle the more
generic case then feel free, but do it properly.
