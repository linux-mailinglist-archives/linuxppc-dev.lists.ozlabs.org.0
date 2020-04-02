Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A895A19BB26
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 06:38:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t9Ks3TXGzDrNF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 15:38:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=d-silva.org (client-ip=66.55.73.32;
 helo=ushosting.nmnhosting.com; envelope-from=alastair@d-silva.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=d-silva.org
Authentication-Results: lists.ozlabs.org; dkim=pass (4096-bit key;
 unprotected) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256
 header.s=201810a header.b=Jz8kb+Zq; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48t9J51hthzDqCK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 15:36:37 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id DF6822DC3330;
 Thu,  2 Apr 2020 15:36:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585802195;
 bh=NccxCUYjczr9RvJe6ZTHFYb1tTCAe/GnhOOeFES5kJE=;
 h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
 b=Jz8kb+ZqAkhBJz5YLsHaQKojre1PdBeC66XBqXJQ8a8X2PccH0Dv62iTVxCqzvGGQ
 OeuYyWbib6UfsFA/H18d3WqaClbH81AFv+78QikStXxty8qAqEfLaqmBBk+wGtiyhF
 i57SXsCyuhK6cEjCs9urekR21w+AaH456c0LDsahaYjkxgwMut1ThTSr6NXO95fDcw
 9DRM0+cm19LAgtTE7XwJJNRAMAjttX6YHJhXBZEKnlpt2xkKzyVKbonW0ji2+d74q2
 A9zVjvao5NUfXSYGc5mDoH4FzUOfj0JhAST5fHLLql3MZpnoEle4riAHhhABY7qOWc
 wgttMOa3WsQQNz5WsdmJke9tHiMIlZlGmnn+hd0eldvP5sZkEZbyjFRrJtnI8t7sO3
 5YfTreAKhMOakHe20beq/v+vsjO3AdceKXgubt8seYGhPVH3yj5BOE+NlYbHgISAtl
 yaiStNEd9hUsx6lkUPZZpYysp9ejEhXJplbWCMDMUXeNnvOvcIZmkX/b8xMEARO6R4
 zregEeDmv83PjfVNNrvC0D4C7pDNACeW+w/hd4o6zlBViUKQM5o6ERRGGWYkWQc2TS
 cPUcSJ67/1Q9f91p+Mg1avH9moJVwb142w//tmZLr/vbbOeBnApG25uWljoO1XCyob
 yeR3Byh0UdfSXnuOTHsK/Rz4=
Received: from Hawking (ntp.lan [10.0.1.1]) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id 0324aU03089960
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 2 Apr 2020 15:36:30 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: "'Dan Williams'" <dan.j.williams@intel.com>
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-4-alastair@d-silva.org>
 <CAPcyv4iGEHJpZctEm+Do1-kOZBUDeKKcREr=BqcK4kCvLWhAQQ@mail.gmail.com>
In-Reply-To: <CAPcyv4iGEHJpZctEm+Do1-kOZBUDeKKcREr=BqcK4kCvLWhAQQ@mail.gmail.com>
Subject: RE: [PATCH v4 03/25] powerpc/powernv: Map & release OpenCAPI LPC
 memory
Date: Thu, 2 Apr 2020 15:36:28 +1100
Message-ID: <2e7701d608a8$473a0140$d5ae03c0$@d-silva.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-au
Thread-Index: AQJ5L4Hn/mp5p0p1jYAFWLJ+xmWSbgIEmlkbAeDU20mm/8VSIA==
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Thu, 02 Apr 2020 15:36:30 +1100 (AEDT)
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
Cc: 'Madhavan Srinivasan' <maddy@linux.vnet.ibm.com>,
 'Alexey Kardashevskiy' <aik@ozlabs.ru>,
 'Masahiro Yamada' <yamada.masahiro@socionext.com>,
 'Oliver O'Halloran' <oohall@gmail.com>,
 'Mauro Carvalho Chehab' <mchehab+samsung@kernel.org>,
 'Ira Weiny' <ira.weiny@intel.com>, 'Rob Herring' <robh@kernel.org>,
 'Dave Jiang' <dave.jiang@intel.com>,
 'linux-nvdimm' <linux-nvdimm@lists.01.org>,
 "'Aneesh Kumar K . V'" <aneesh.kumar@linux.ibm.com>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 'Anju T Sudhakar' <anju@linux.vnet.ibm.com>,
 'Mahesh Salgaonkar' <mahesh@linux.vnet.ibm.com>,
 'Andrew Donnellan' <ajd@linux.ibm.com>, 'Arnd Bergmann' <arnd@arndb.de>,
 'Greg Kurz' <groug@kaod.org>, 'Nicholas Piggin' <npiggin@gmail.com>,
 =?utf-8?Q?'C=C3=A9dric_Le_Goater'?= <clg@kaod.org>,
 'Thomas Gleixner' <tglx@linutronix.de>,
 'Hari Bathini' <hbathini@linux.ibm.com>, 'Linux MM' <linux-mm@kvack.org>,
 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>,
 'Linux Kernel Mailing List' <linux-kernel@vger.kernel.org>,
 'Vishal Verma' <vishal.l.verma@intel.com>,
 'Frederic Barrat' <fbarrat@linux.ibm.com>, 'Paul Mackerras' <paulus@samba.org>,
 'Andrew Morton' <akpm@linux-foundation.org>,
 'linuxppc-dev' <linuxppc-dev@lists.ozlabs.org>,
 "'David S. Miller'" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Dan Williams <dan.j.williams@intel.com>
> Sent: Wednesday, 1 April 2020 7:49 PM
> To: Alastair D'Silva <alastair@d-silva.org>
> Cc: Aneesh Kumar K . V <aneesh.kumar@linux.ibm.com>; Oliver O'Halloran
> <oohall@gmail.com>; Benjamin Herrenschmidt
> <benh@kernel.crashing.org>; Paul Mackerras <paulus@samba.org>; Michael
> Ellerman <mpe@ellerman.id.au>; Frederic Barrat =
<fbarrat@linux.ibm.com>;
> Andrew Donnellan <ajd@linux.ibm.com>; Arnd Bergmann
> <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>;
> Vishal Verma <vishal.l.verma@intel.com>; Dave Jiang
> <dave.jiang@intel.com>; Ira Weiny <ira.weiny@intel.com>; Andrew Morton
> <akpm@linux-foundation.org>; Mauro Carvalho Chehab
> <mchehab+samsung@kernel.org>; David S. Miller <davem@davemloft.net>;
> Rob Herring <robh@kernel.org>; Anton Blanchard <anton@ozlabs.org>;
> Krzysztof Kozlowski <krzk@kernel.org>; Mahesh Salgaonkar
> <mahesh@linux.vnet.ibm.com>; Madhavan Srinivasan
> <maddy@linux.vnet.ibm.com>; C=C3=A9dric Le Goater <clg@kaod.org>; Anju =
T
> Sudhakar <anju@linux.vnet.ibm.com>; Hari Bathini
> <hbathini@linux.ibm.com>; Thomas Gleixner <tglx@linutronix.de>; Greg
> Kurz <groug@kaod.org>; Nicholas Piggin <npiggin@gmail.com>; Masahiro
> Yamada <yamada.masahiro@socionext.com>; Alexey Kardashevskiy
> <aik@ozlabs.ru>; Linux Kernel Mailing List =
<linux-kernel@vger.kernel.org>;
> linuxppc-dev <linuxppc-dev@lists.ozlabs.org>; linux-nvdimm <linux-
> nvdimm@lists.01.org>; Linux MM <linux-mm@kvack.org>
> Subject: Re: [PATCH v4 03/25] powerpc/powernv: Map & release OpenCAPI
> LPC memory
>=20
> On Sun, Mar 29, 2020 at 10:23 PM Alastair D'Silva =
<alastair@d-silva.org>
> wrote:
> >
> > This patch adds OPAL calls to powernv so that the OpenCAPI driver =
can
> > map & release LPC (Lowest Point of Coherency)  memory.
> >
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/pnv-ocxl.h   |  2 ++
> >  arch/powerpc/platforms/powernv/ocxl.c | 43
> > +++++++++++++++++++++++++++
> >  2 files changed, 45 insertions(+)
> >
> > diff --git a/arch/powerpc/include/asm/pnv-ocxl.h
> > b/arch/powerpc/include/asm/pnv-ocxl.h
> > index 7de82647e761..560a19bb71b7 100644
> > --- a/arch/powerpc/include/asm/pnv-ocxl.h
> > +++ b/arch/powerpc/include/asm/pnv-ocxl.h
> > @@ -32,5 +32,7 @@ extern int
> pnv_ocxl_spa_remove_pe_from_cache(void
> > *platform_data, int pe_handle)
> >
> >  extern int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr);
> > extern void pnv_ocxl_free_xive_irq(u32 irq);
> > +u64 pnv_ocxl_platform_lpc_setup(struct pci_dev *pdev, u64 size); =
void
> > +pnv_ocxl_platform_lpc_release(struct pci_dev *pdev);
> >
> >  #endif /* _ASM_PNV_OCXL_H */
> > diff --git a/arch/powerpc/platforms/powernv/ocxl.c
> > b/arch/powerpc/platforms/powernv/ocxl.c
> > index 8c65aacda9c8..f13119a7c026 100644
> > --- a/arch/powerpc/platforms/powernv/ocxl.c
> > +++ b/arch/powerpc/platforms/powernv/ocxl.c
> > @@ -475,6 +475,49 @@ void pnv_ocxl_spa_release(void *platform_data)
> }
> > EXPORT_SYMBOL_GPL(pnv_ocxl_spa_release);
> >
> > +u64 pnv_ocxl_platform_lpc_setup(struct pci_dev *pdev, u64 size) {
> > +       struct pci_controller *hose =3D pci_bus_to_host(pdev->bus);
> > +       struct pnv_phb *phb =3D hose->private_data;
>=20
> Is calling the local variable 'hose' instead of 'host' on purpose?
>=20

Yes, this follows the convention used in other functions in this file.

> > +       u32 bdfn =3D pci_dev_id(pdev);
> > +       __be64 base_addr_be64;
> > +       u64 base_addr;
> > +       int rc;
> > +
> > +       rc =3D opal_npu_mem_alloc(phb->opal_id, bdfn, size,
> &base_addr_be64);
> > +       if (rc) {
> > +               dev_warn(&pdev->dev,
> > +                        "OPAL could not allocate LPC memory, =
rc=3D%d\n", rc);
> > +               return 0;
> > +       }
> > +
> > +       base_addr =3D be64_to_cpu(base_addr_be64);
> > +
> > +#ifdef CONFIG_MEMORY_HOTPLUG_SPARSE
>=20
> With the proposed cleanup in patch2 the ifdef can be elided here.

Ok
>=20
> > +       rc =3D check_hotplug_memory_addressable(base_addr >> =
PAGE_SHIFT,
> > +                                             size >> PAGE_SHIFT);
> > +       if (rc)
> > +               return 0;
>=20
> Is this an error worth logging if someone is wondering why their =
device is not
> showing up?
>=20

Yes, I'll add a message.

>=20
> > +#endif
> > +
> > +       return base_addr;
> > +}
> > +EXPORT_SYMBOL_GPL(pnv_ocxl_platform_lpc_setup);
> > +
> > +void pnv_ocxl_platform_lpc_release(struct pci_dev *pdev) {
> > +       struct pci_controller *hose =3D pci_bus_to_host(pdev->bus);
> > +       struct pnv_phb *phb =3D hose->private_data;
> > +       u32 bdfn =3D pci_dev_id(pdev);
> > +       int rc;
> > +
> > +       rc =3D opal_npu_mem_release(phb->opal_id, bdfn);
> > +       if (rc)
> > +               dev_warn(&pdev->dev,
> > +                        "OPAL reported rc=3D%d when releasing LPC
> > +memory\n", rc); }
> EXPORT_SYMBOL_GPL(pnv_ocxl_platform_lpc_release);
> > +
> >  int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int
> > pe_handle)  {
> >         struct spa_data *data =3D (struct spa_data *) platform_data;
> > --
> > 2.24.1
> >
>=20
>=20
> --
> This email has been checked for viruses by AVG.
> https://www.avg.com


