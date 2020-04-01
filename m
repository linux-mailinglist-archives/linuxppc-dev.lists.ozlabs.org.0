Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BDD19B8B0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 00:53:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t1hG715WzDrK2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 09:53:34 +1100 (AEDT)
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
 header.s=201810a header.b=QYGtk3AH; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48t1fF4c4nzDqZp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 09:51:49 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 563302DC3330;
 Thu,  2 Apr 2020 09:51:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585781508;
 bh=FgXrMZd5jgFgYwvk1rKNQ23NCAQq9Sxrzfkt7yVUPjk=;
 h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
 b=QYGtk3AH0W2GW3xDqwILT4tWdRvwfukt/wtJfKxP3GeMIkwOcvxi4+bFTLeK7yG+2
 QK6xQdg24HsMsrO96pzQzp7thT9OnH+T4/yu3go19x9bxZsYO5NlJv0CgTU9pVxohW
 KQJ7ZDAHLWkxg0LJ1OqUPhVMKcRhKtqvaK49TPOa4J4swSpzhvwUlGWHpq8nMLY9Ly
 Vu3DiOuAL2gubxA9ZbFj1JqQ4K9IlkSRcenYLBtTXq75bzFD851m4uhGrpdiUVXn/C
 xYFvA/Rmp5IP5yiGKQYiTLklvSDRR5jvaZQIEyqlOE1mS5D0AvD28BhaUjAKTArCoN
 xLLK+baQf/RyPZIGfFrlZcSyldovGznoCpUkK/BkN4eWPPuv3B4poiPOfQgWwQSfQg
 sHkxPI/TVU4tfkhNhDZIguM19nktovwPOgel+sGFHwKc3FPYkVGpat3Dr1kExYM2vc
 JJoWJhUH+zFmC6FT0WZMRa1HPdgoqc9nDa26VkS6riRQurzPFP7TrD10cEg99H5sMs
 U2tRswqCKr3RZ+yNiF41Vk8wrSpOlJFKm/gwDUHJhB93pS3IQx3r0NyJOFU6P009EI
 4HDOv8cMGWuycKRawzl/BzpGQYXFmELX9appWWgEVeqyT8RUVn5oEkkYgQzQdJlkgd
 jakKdOir6MI9bh8Dme2Lw/KY=
Received: from Hawking (ntp.lan [10.0.1.1]) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id 031Mpf9D088148
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 2 Apr 2020 09:51:41 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: "'Dan Williams'" <dan.j.williams@intel.com>
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-2-alastair@d-silva.org>
 <CAPcyv4hX9RTWKSLB8OcYY6MK-z5u5WWSaYSGa-8oqPbWU7st8w@mail.gmail.com>
In-Reply-To: <CAPcyv4hX9RTWKSLB8OcYY6MK-z5u5WWSaYSGa-8oqPbWU7st8w@mail.gmail.com>
Subject: RE: [PATCH v4 01/25] powerpc/powernv: Add OPAL calls for LPC memory
 alloc/release
Date: Thu, 2 Apr 2020 09:51:40 +1100
Message-ID: <2d6d01d60878$1c8c68f0$55a53ad0$@d-silva.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-au
Thread-Index: AQJ5L4Hn/mp5p0p1jYAFWLJ+xmWSbgKnRjTFARH8J02nAMbrEA==
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Thu, 02 Apr 2020 09:51:42 +1100 (AEDT)
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
> Sent: Wednesday, 1 April 2020 7:48 PM
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
> Subject: Re: [PATCH v4 01/25] powerpc/powernv: Add OPAL calls for LPC
> memory alloc/release
>=20
> On Sun, Mar 29, 2020 at 10:23 PM Alastair D'Silva =
<alastair@d-silva.org>
> wrote:
> >
> > Add OPAL calls for LPC memory alloc/release
> >
>=20
> This seems to be referencing an existing api definition, can you =
include a
> pointer to the spec in case someone wanted to understand what these
> routines do? I suspect this is not allocating memory in the =
traditional sense as
> much as it's allocating physical address space for a device to be =
mapped?
>=20

These API calls were introduced in the following skiboot commit:
https://github.com/open-power/skiboot/commit/1a548857ce1f02f43585b326a891=
eed18a7b43b3

I'll add it to the description.

>=20
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
> > Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/opal-api.h        | 2 ++
> >  arch/powerpc/include/asm/opal.h            | 2 ++
> >  arch/powerpc/platforms/powernv/opal-call.c | 2 ++
> >  3 files changed, 6 insertions(+)
> >
> > diff --git a/arch/powerpc/include/asm/opal-api.h
> > b/arch/powerpc/include/asm/opal-api.h
> > index c1f25a760eb1..9298e603001b 100644
> > --- a/arch/powerpc/include/asm/opal-api.h
> > +++ b/arch/powerpc/include/asm/opal-api.h
> > @@ -208,6 +208,8 @@
> >  #define OPAL_HANDLE_HMI2                       166
> >  #define        OPAL_NX_COPROC_INIT                     167
> >  #define OPAL_XIVE_GET_VP_STATE                 170
> > +#define OPAL_NPU_MEM_ALLOC                     171
> > +#define OPAL_NPU_MEM_RELEASE                   172
> >  #define OPAL_MPIPL_UPDATE                      173
> >  #define OPAL_MPIPL_REGISTER_TAG                        174
> >  #define OPAL_MPIPL_QUERY_TAG                   175
> > diff --git a/arch/powerpc/include/asm/opal.h
> > b/arch/powerpc/include/asm/opal.h index 9986ac34b8e2..301fea46c7ca
> > 100644
> > --- a/arch/powerpc/include/asm/opal.h
> > +++ b/arch/powerpc/include/asm/opal.h
> > @@ -39,6 +39,8 @@ int64_t opal_npu_spa_clear_cache(uint64_t phb_id,
> uint32_t bdfn,
> >                                 uint64_t PE_handle);  int64_t
> > opal_npu_tl_set(uint64_t phb_id, uint32_t bdfn, long cap,
> >                         uint64_t rate_phys, uint32_t size);
> > +int64_t opal_npu_mem_alloc(u64 phb_id, u32 bdfn, u64 size, __be64
> > +*bar); int64_t opal_npu_mem_release(u64 phb_id, u32 bdfn);
> >
> >  int64_t opal_console_write(int64_t term_number, __be64 *length,
> >                            const uint8_t *buffer); diff --git
> > a/arch/powerpc/platforms/powernv/opal-call.c
> > b/arch/powerpc/platforms/powernv/opal-call.c
> > index 5cd0f52d258f..f26e58b72c04 100644
> > --- a/arch/powerpc/platforms/powernv/opal-call.c
> > +++ b/arch/powerpc/platforms/powernv/opal-call.c
> > @@ -287,6 +287,8 @@ OPAL_CALL(opal_pci_set_pbcq_tunnel_bar,
> OPAL_PCI_SET_PBCQ_TUNNEL_BAR);
> >  OPAL_CALL(opal_sensor_read_u64,
> OPAL_SENSOR_READ_U64);
> >  OPAL_CALL(opal_sensor_group_enable,
> OPAL_SENSOR_GROUP_ENABLE);
> >  OPAL_CALL(opal_nx_coproc_init,                 =
OPAL_NX_COPROC_INIT);
> > +OPAL_CALL(opal_npu_mem_alloc,                  OPAL_NPU_MEM_ALLOC);
> > +OPAL_CALL(opal_npu_mem_release,
> OPAL_NPU_MEM_RELEASE);
> >  OPAL_CALL(opal_mpipl_update,                   OPAL_MPIPL_UPDATE);
> >  OPAL_CALL(opal_mpipl_register_tag,
> OPAL_MPIPL_REGISTER_TAG);
> >  OPAL_CALL(opal_mpipl_query_tag,
> OPAL_MPIPL_QUERY_TAG);
> > --
> > 2.24.1
> >
>=20
>=20
> --
> This email has been checked for viruses by AVG.
> https://www.avg.com


--=20
Alastair D'Silva           mob: 0423 762 819
skype: alastair_dsilva     msn: alastair@d-silva.org
blog: http://alastair.d-silva.org    Twitter: @EvilDeece

