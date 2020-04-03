Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D1619CEF5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 05:52:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tmGm4YMxzDrK4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 14:52:32 +1100 (AEDT)
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
 header.s=201810a header.b=SmXkdqxM; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48tmDw4mh1zDrF1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 14:50:54 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 20A782DC3D2F;
 Fri,  3 Apr 2020 14:50:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585885852;
 bh=q0MWnVXh2aGk7v7ivIwQdA2GkasasysLWo22AkPKzug=;
 h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
 b=SmXkdqxMWlBa5BfHDElmGi2xtWIwhlyZC+XnoaUyPT5aE6boLWD/AQN/Ujgix+fN4
 lt4B5wlyflX5LxbuaPBd1/I+r9LZcxTBoOIJNrsPr7cwQ3rF8gAIphr9HUyU+/njBu
 hoDUPWUmDhnMr2IDYjVrcWf8DJx+zthb6UW/Ew6sB5BFaYRlbN8ZP22iJ5//EwDrEq
 dD4ehflXTk9vxREms73gx7K8mPfP1KwZYMl53l3NYL4Xwx/xE/mxenCpwKDjuyfzy5
 PICZfF6bNcnScT6yJ1xqOYXDXaGhd9kSOB33hti6KhvnMClTAq2WANlpPBZVVSIvcL
 8s0um1BD8fZCugtMXGq1JJtYm9lY4Vdx0/S22VpY28H9zFPcBf8ek6CH7t+BVz3vQX
 1Kbfx9wB695SdNby60eBt8a4f23Yn9HWKUD+g3geM6UqmJSLXlha16GKuUlNpgR97c
 xNrt0sa9YC5YmQ+gienhkCLZV959msXZmwlkGv3KDF1SaRC8vCPEV4+E1xsA7FncHc
 xG5nT1bBI8S5029N239hJ5/GvRTWmSG6LD9okWBr23r7lr94UNfv5fYS6mHbrTb0J6
 Q5sMgtZJxUzfbhwpv97hSzGRHHpOZU2lNlpmnojVWlsVdZ4cyc46gSWYOgf6FF5YiT
 KvA+UO/Nh6edhA/eclMg0h9A=
Received: from Hawking (ntp.lan [10.0.1.1]) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id 0333obha097274
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 3 Apr 2020 14:50:39 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: "'Dan Williams'" <dan.j.williams@intel.com>
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-8-alastair@d-silva.org>
 <CAPcyv4gUU4PbQK1YJLfOToLDmFWsWWLySwkqHuoqGDvKZJGQvg@mail.gmail.com>
In-Reply-To: <CAPcyv4gUU4PbQK1YJLfOToLDmFWsWWLySwkqHuoqGDvKZJGQvg@mail.gmail.com>
Subject: RE: [PATCH v4 07/25] ocxl: Add functions to map/unmap LPC memory
Date: Fri, 3 Apr 2020 14:50:36 +1100
Message-ID: <303a01d6096b$0ea3e120$2beba360$@d-silva.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-au
Thread-Index: AQJ5L4Hn/mp5p0p1jYAFWLJ+xmWSbgDVHtBXAp4PBwGnBNz6cA==
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Fri, 03 Apr 2020 14:50:47 +1100 (AEDT)
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
> Subject: Re: [PATCH v4 07/25] ocxl: Add functions to map/unmap LPC
> memory
>=20
> On Sun, Mar 29, 2020 at 10:23 PM Alastair D'Silva =
<alastair@d-silva.org>
> wrote:
> >
> > Add functions to map/unmap LPC memory
> >
>=20
> "map memory" is an overloaded term. I'm guessing this patch has =
nothing to
> do with mapping memory in the MMU. Is it updating hardware resource
> decoders to start claiming address space that was allocated =
previously?
>=20

It's similar to MMIO - these calls end up setting up a BAR which places =
the LPC
memory into a physical memory range addressable by the kernel.

> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
> > ---
> >  drivers/misc/ocxl/core.c          | 51 =
+++++++++++++++++++++++++++++++
> >  drivers/misc/ocxl/ocxl_internal.h |  3 ++
> >  include/misc/ocxl.h               | 21 +++++++++++++
> >  3 files changed, 75 insertions(+)
> >
> > diff --git a/drivers/misc/ocxl/core.c b/drivers/misc/ocxl/core.c =
index
> > 2531c6cf19a0..75ff14e3882a 100644
> > --- a/drivers/misc/ocxl/core.c
> > +++ b/drivers/misc/ocxl/core.c
> > @@ -210,6 +210,56 @@ static void unmap_mmio_areas(struct ocxl_afu
> *afu)
> >         release_fn_bar(afu->fn, afu->config.global_mmio_bar);  }
> >
> > +int ocxl_afu_map_lpc_mem(struct ocxl_afu *afu) {
> > +       struct pci_dev *dev =3D to_pci_dev(afu->fn->dev.parent);
> > +
> > +       if ((afu->config.lpc_mem_size + afu-
> >config.special_purpose_mem_size) =3D=3D 0)
> > +               return 0;
> > +
> > +       afu->lpc_base_addr =3D ocxl_link_lpc_map(afu->fn->link, =
dev);
> > +       if (afu->lpc_base_addr =3D=3D 0)
> > +               return -EINVAL;
> > +
> > +       if (afu->config.lpc_mem_size > 0) {
> > +               afu->lpc_res.start =3D afu->lpc_base_addr + afu-
> >config.lpc_mem_offset;
> > +               afu->lpc_res.end =3D afu->lpc_res.start + =
afu->config.lpc_mem_size
> - 1;
> > +       }
> > +
> > +       if (afu->config.special_purpose_mem_size > 0) {
> > +               afu->special_purpose_res.start =3D =
afu->lpc_base_addr +
> > +                                                =
afu->config.special_purpose_mem_offset;
> > +               afu->special_purpose_res.end =3D =
afu->special_purpose_res.start +
> > +                                              =
afu->config.special_purpose_mem_size - 1;
> > +       }
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(ocxl_afu_map_lpc_mem);
> > +
> > +struct resource *ocxl_afu_lpc_mem(struct ocxl_afu *afu) {
> > +       return &afu->lpc_res;
> > +}
> > +EXPORT_SYMBOL_GPL(ocxl_afu_lpc_mem);
> > +
> > +static void unmap_lpc_mem(struct ocxl_afu *afu) {
> > +       struct pci_dev *dev =3D to_pci_dev(afu->fn->dev.parent);
> > +
> > +       if (afu->lpc_res.start || afu->special_purpose_res.start) {
> > +               void *link =3D afu->fn->link;
> > +
> > +               // only release the link when the the last consumer =
calls release
> > +               ocxl_link_lpc_release(link, dev);
> > +
> > +               afu->lpc_res.start =3D 0;
> > +               afu->lpc_res.end =3D 0;
> > +               afu->special_purpose_res.start =3D 0;
> > +               afu->special_purpose_res.end =3D 0;
> > +       }
> > +}
> > +
> >  static int configure_afu(struct ocxl_afu *afu, u8 afu_idx, struct
> > pci_dev *dev)  {
> >         int rc;
> > @@ -251,6 +301,7 @@ static int configure_afu(struct ocxl_afu *afu, =
u8
> > afu_idx, struct pci_dev *dev)
> >
> >  static void deconfigure_afu(struct ocxl_afu *afu)  {
> > +       unmap_lpc_mem(afu);
> >         unmap_mmio_areas(afu);
> >         reclaim_afu_pasid(afu);
> >         reclaim_afu_actag(afu);
> > diff --git a/drivers/misc/ocxl/ocxl_internal.h
> > b/drivers/misc/ocxl/ocxl_internal.h
> > index 2d7575225bd7..7b975a89db7b 100644
> > --- a/drivers/misc/ocxl/ocxl_internal.h
> > +++ b/drivers/misc/ocxl/ocxl_internal.h
> > @@ -52,6 +52,9 @@ struct ocxl_afu {
> >         void __iomem *global_mmio_ptr;
> >         u64 pp_mmio_start;
> >         void *private;
> > +       u64 lpc_base_addr; /* Covers both LPC & special purpose =
memory */
> > +       struct resource lpc_res;
> > +       struct resource special_purpose_res;
> >  };
> >
> >  enum ocxl_context_status {
> > diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h index
> > 357ef1aadbc0..d8b0b4d46bfb 100644
> > --- a/include/misc/ocxl.h
> > +++ b/include/misc/ocxl.h
> > @@ -203,6 +203,27 @@ int ocxl_irq_set_handler(struct ocxl_context
> > *ctx, int irq_id,
> >
> >  // AFU Metadata
> >
> > +/**
> > + * ocxl_afu_map_lpc_mem() - Map the LPC system & special purpose
> > +memory for an AFU
> > + * Do not call this during device discovery, as there may me =
multiple
>=20
> s/me/be/
>=20
>=20
> > + * devices on a link, and the memory is mapped for the whole link,
> > +not
> > + * just one device. It should only be called after all devices have
> > + * registered their memory on the link.
> > + *
> > + * @afu: The AFU that has the LPC memory to map
> > + *
> > + * Returns 0 on success, negative on failure  */ int
> > +ocxl_afu_map_lpc_mem(struct ocxl_afu *afu);
> > +
> > +/**
> > + * ocxl_afu_lpc_mem() - Get the physical address range of LPC =
memory
> > +for an AFU
> > + * @afu: The AFU associated with the LPC memory
> > + *
> > + * Returns a pointer to the resource struct for the physical =
address
> > +range  */ struct resource *ocxl_afu_lpc_mem(struct ocxl_afu *afu);
> > +
> >  /**
> >   * ocxl_afu_config() - Get a pointer to the config for an AFU
> >   * @afu: a pointer to the AFU to get the config for
> > --
> > 2.24.1
> >



--=20
Alastair D'Silva           mob: 0423 762 819
skype: alastair_dsilva     msn: alastair@d-silva.org
blog: http://alastair.d-silva.org    Twitter: @EvilDeece

