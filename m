Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B2016FA95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 10:21:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S9Kj2hNrzDqlg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 20:21:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.53.149; helo=2.mo2.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 2.mo2.mail-out.ovh.net (2.mo2.mail-out.ovh.net [188.165.53.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S9HR0Y6PzDqXg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 20:19:44 +1100 (AEDT)
Received: from player779.ha.ovh.net (unknown [10.108.57.141])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 56F121CCCFF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 10:01:50 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player779.ha.ovh.net (Postfix) with ESMTPSA id 0A2DBFBF0C51;
 Wed, 26 Feb 2020 09:01:06 +0000 (UTC)
Date: Wed, 26 Feb 2020 10:01:02 +0100
From: Greg Kurz <groug@kaod.org>
To: "Alastair D'Silva" <alastair@d-silva.org>
Subject: Re: [PATCH v3 04/27] ocxl: Remove unnecessary externs
Message-ID: <20200226100102.0aab7dda@bahia.home>
In-Reply-To: <4d49801d5ec7e$7a3e8610$6ebb9230$@d-silva.org>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-5-alastair@au1.ibm.com>
 <20200226081447.GH4937@MiWiFi-R3L-srv>
 <4d49801d5ec7e$7a3e8610$6ebb9230$@d-silva.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 3746431942902978839
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrleefgdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
 'Mahesh Salgaonkar' <mahesh@linux.vnet.ibm.com>, 'Masahiro
 Yamada' <yamada.masahiro@socionext.com>, 'Paul Mackerras' <paulus@samba.org>,
 'Mauro Carvalho Chehab' <mchehab+samsung@kernel.org>,
 'Ira Weiny' <ira.weiny@intel.com>, 'Thomas Gleixner' <tglx@linutronix.de>,
 'Rob Herring' <robh@kernel.org>, 'Dave Jiang' <dave.jiang@intel.com>,
 'Baoquan He' <bhe@redhat.com>, linux-nvdimm@lists.01.org,
 "'Aneesh Kumar K . V'" <aneesh.kumar@linux.ibm.com>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 'Anju T Sudhakar' <anju@linux.vnet.ibm.com>,
 'Andrew Donnellan' <ajd@linux.ibm.com>, 'Arnd Bergmann' <arnd@arndb.de>,
 'Nicholas Piggin' <npiggin@gmail.com>,
 =?UTF-8?B?J0PDqWRyaWM=?= Le Goater' <clg@kaod.org>,
 'Dan Williams' <dan.j.williams@intel.com>, 'Hari
 Bathini' <hbathini@linux.ibm.com>, 'Alastair D'Silva' <alastair@au1.ibm.com>,
 linux-mm@kvack.org, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, 'Vishal Verma' <vishal.l.verma@intel.com>,
 'Frederic
 Barrat' <fbarrat@linux.ibm.com>, 'Oliver O'Halloran' <oohall@gmail.com>,
 'Andrew Morton' <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "'David S. Miller'" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 26 Feb 2020 19:26:34 +1100
"Alastair D'Silva" <alastair@d-silva.org> wrote:

> > -----Original Message-----
> > From: Baoquan He <bhe@redhat.com>
> > Sent: Wednesday, 26 February 2020 7:15 PM
> > To: Alastair D'Silva <alastair@au1.ibm.com>
> > Cc: alastair@d-silva.org; Aneesh Kumar K . V
> > <aneesh.kumar@linux.ibm.com>; Oliver O'Halloran <oohall@gmail.com>;
> > Benjamin Herrenschmidt <benh@kernel.crashing.org>; Paul Mackerras
> > <paulus@samba.org>; Michael Ellerman <mpe@ellerman.id.au>; Frederic
> > Barrat <fbarrat@linux.ibm.com>; Andrew Donnellan <ajd@linux.ibm.com>;
> > Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>; Dan Williams <dan.j.williams@intel.com>;
> > Vishal Verma <vishal.l.verma@intel.com>; Dave Jiang
> > <dave.jiang@intel.com>; Ira Weiny <ira.weiny@intel.com>; Andrew Morton
> > <akpm@linux-foundation.org>; Mauro Carvalho Chehab
> > <mchehab+samsung@kernel.org>; David S. Miller <davem@davemloft.net>;
> > Rob Herring <robh@kernel.org>; Anton Blanchard <anton@ozlabs.org>;
> > Krzysztof Kozlowski <krzk@kernel.org>; Mahesh Salgaonkar
> > <mahesh@linux.vnet.ibm.com>; Madhavan Srinivasan
> > <maddy@linux.vnet.ibm.com>; C=C3=A9dric Le Goater <clg@kaod.org>; Anju T
> > Sudhakar <anju@linux.vnet.ibm.com>; Hari Bathini
> > <hbathini@linux.ibm.com>; Thomas Gleixner <tglx@linutronix.de>; Greg
> > Kurz <groug@kaod.org>; Nicholas Piggin <npiggin@gmail.com>; Masahiro
> > Yamada <yamada.masahiro@socionext.com>; Alexey Kardashevskiy
> > <aik@ozlabs.ru>; linux-kernel@vger.kernel.org; linuxppc-
> > dev@lists.ozlabs.org; linux-nvdimm@lists.01.org; linux-mm@kvack.org
> > Subject: Re: [PATCH v3 04/27] ocxl: Remove unnecessary externs
> >=20
> > On 02/21/20 at 02:26pm, Alastair D'Silva wrote:
> > > From: Alastair D'Silva <alastair@d-silva.org>
> > >
> > > Function declarations don't need externs, remove the existing ones so
> > > they are consistent with newer code
> > >
> > > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > > ---
> > >  arch/powerpc/include/asm/pnv-ocxl.h | 32 ++++++++++++++-------------=
--
> > >  include/misc/ocxl.h                 |  6 +++---
> > >  2 files changed, 18 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/arch/powerpc/include/asm/pnv-ocxl.h
> > > b/arch/powerpc/include/asm/pnv-ocxl.h
> > > index 0b2a6707e555..b23c99bc0c84 100644
> > > --- a/arch/powerpc/include/asm/pnv-ocxl.h
> > > +++ b/arch/powerpc/include/asm/pnv-ocxl.h
> > > @@ -9,29 +9,27 @@
> > >  #define PNV_OCXL_TL_BITS_PER_RATE       4
> > >  #define PNV_OCXL_TL_RATE_BUF_SIZE
> > ((PNV_OCXL_TL_MAX_TEMPLATE+1) * PNV_OCXL_TL_BITS_PER_RATE / 8)
> > >
> > > -extern int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16
> > *enabled,
> > > -			u16 *supported);
> >=20
> > It works w or w/o extern when declare functions. Searching 'extern'
> > under include can find so many functions with 'extern' adding. Do we ha=
ve
> a
> > explicit standard if we should add or remove 'exter' in function
> declaration?
> >=20
> > I have no objection to this patch, just want to make clear so that I can
> handle
> > it w/o confusion.
> >=20
> > Thanks
> > Baoquan
> >=20
>=20
> For the OpenCAPI driver, we have settled on not having 'extern' on
> functions.
>=20
> I don't think I've seen a standard that supports or refutes this, but it
> does not value add.
>=20

FWIW this is a warning condition for checkpatch:

$ ./scripts/checkpatch.pl --strict -f include/misc/ocxl.h

[...]

CHECK: extern prototypes should be avoided in .h files
#176: FILE: include/misc/ocxl.h:176:
+extern int ocxl_afu_irq_alloc(struct ocxl_context *ctx, int *irq_id);

[...]
