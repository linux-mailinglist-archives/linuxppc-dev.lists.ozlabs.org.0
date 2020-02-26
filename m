Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 125E81701A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 15:56:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SJmB19nrzDqWP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 01:56:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhe@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=LFQlaHs5; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SJk73mh0zDq8W
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 01:54:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582728891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D9ZIih3G83c2i8VjB34cEpnw8W+3tjJJo3awnznjfu8=;
 b=LFQlaHs53jQ/HCDmDcf4DeL2QfRNw+r5YHrPTCbasMLCdrripXHOTO/V7/ry1ja1lFcyYP
 MyfRqwHiVZmGcTCY3vBHS9AZkyNSl/3bo0RVpP+tDhRv/jZBk/iHANsS9uNCuUqBjSWoSi
 3FkG0/k70wsv3XFk42Pa2I3k67o1wF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-kpeZS8rrMSiqNG-KzLcfbA-1; Wed, 26 Feb 2020 09:54:46 -0500
X-MC-Unique: kpeZS8rrMSiqNG-KzLcfbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4288DB20;
 Wed, 26 Feb 2020 14:54:41 +0000 (UTC)
Received: from localhost (ovpn-12-39.pek2.redhat.com [10.72.12.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FF585D9CD;
 Wed, 26 Feb 2020 14:54:40 +0000 (UTC)
Date: Wed, 26 Feb 2020 22:54:37 +0800
From: 'Baoquan He' <bhe@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3 04/27] ocxl: Remove unnecessary externs
Message-ID: <20200226145437.GJ4937@MiWiFi-R3L-srv>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-5-alastair@au1.ibm.com>
 <20200226081447.GH4937@MiWiFi-R3L-srv>
 <4d49801d5ec7e$7a3e8610$6ebb9230$@d-silva.org>
 <20200226100102.0aab7dda@bahia.home>
 <20200226141523.GI4937@MiWiFi-R3L-srv>
 <20200226152050.45547219@bahia.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200226152050.45547219@bahia.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: 'Madhavan Srinivasan' <maddy@linux.vnet.ibm.com>,
 'Alexey Kardashevskiy' <aik@ozlabs.ru>,
 'Mahesh Salgaonkar' <mahesh@linux.vnet.ibm.com>,
 'Masahiro Yamada' <yamada.masahiro@socionext.com>,
 'Oliver O'Halloran' <oohall@gmail.com>,
 'Mauro Carvalho Chehab' <mchehab+samsung@kernel.org>,
 'Ira Weiny' <ira.weiny@intel.com>, 'Thomas Gleixner' <tglx@linutronix.de>,
 'Rob Herring' <robh@kernel.org>, 'Dave Jiang' <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "'Aneesh Kumar K . V'" <aneesh.kumar@linux.ibm.com>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 'Anju T Sudhakar' <anju@linux.vnet.ibm.com>,
 Alastair D'Silva <alastair@d-silva.org>,
 'Andrew Donnellan' <ajd@linux.ibm.com>, 'Arnd Bergmann' <arnd@arndb.de>,
 'Nicholas Piggin' <npiggin@gmail.com>,
 =?iso-8859-1?Q?'C=E9dric?= Le Goater' <clg@kaod.org>,
 'Dan Williams' <dan.j.williams@intel.com>,
 'Hari Bathini' <hbathini@linux.ibm.com>,
 'Alastair D'Silva' <alastair@au1.ibm.com>, linux-mm@kvack.org,
 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, 'Vishal Verma' <vishal.l.verma@intel.com>,
 'Frederic Barrat' <fbarrat@linux.ibm.com>, 'Paul Mackerras' <paulus@samba.org>,
 'Andrew Morton' <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "'David S. Miller'" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/26/20 at 03:20pm, Greg Kurz wrote:
> On Wed, 26 Feb 2020 22:15:23 +0800
> 'Baoquan He' <bhe@redhat.com> wrote:
>=20
> > On 02/26/20 at 10:01am, Greg Kurz wrote:
> > > On Wed, 26 Feb 2020 19:26:34 +1100
> > > "Alastair D'Silva" <alastair@d-silva.org> wrote:
> > >=20
> > > > > -----Original Message-----
> > > > > From: Baoquan He <bhe@redhat.com>
> > > > > Sent: Wednesday, 26 February 2020 7:15 PM
> > > > > To: Alastair D'Silva <alastair@au1.ibm.com>
> > > > > Cc: alastair@d-silva.org; Aneesh Kumar K . V
> > > > > <aneesh.kumar@linux.ibm.com>; Oliver O'Halloran <oohall@gmail.c=
om>;
> > > > > Benjamin Herrenschmidt <benh@kernel.crashing.org>; Paul Mackerr=
as
> > > > > <paulus@samba.org>; Michael Ellerman <mpe@ellerman.id.au>; Fred=
eric
> > > > > Barrat <fbarrat@linux.ibm.com>; Andrew Donnellan <ajd@linux.ibm=
.com>;
> > > > > Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org>; Dan Williams <dan.j.williams@inte=
l.com>;
> > > > > Vishal Verma <vishal.l.verma@intel.com>; Dave Jiang
> > > > > <dave.jiang@intel.com>; Ira Weiny <ira.weiny@intel.com>; Andrew=
 Morton
> > > > > <akpm@linux-foundation.org>; Mauro Carvalho Chehab
> > > > > <mchehab+samsung@kernel.org>; David S. Miller <davem@davemloft.=
net>;
> > > > > Rob Herring <robh@kernel.org>; Anton Blanchard <anton@ozlabs.or=
g>;
> > > > > Krzysztof Kozlowski <krzk@kernel.org>; Mahesh Salgaonkar
> > > > > <mahesh@linux.vnet.ibm.com>; Madhavan Srinivasan
> > > > > <maddy@linux.vnet.ibm.com>; C=E9dric Le Goater <clg@kaod.org>; =
Anju T
> > > > > Sudhakar <anju@linux.vnet.ibm.com>; Hari Bathini
> > > > > <hbathini@linux.ibm.com>; Thomas Gleixner <tglx@linutronix.de>;=
 Greg
> > > > > Kurz <groug@kaod.org>; Nicholas Piggin <npiggin@gmail.com>; Mas=
ahiro
> > > > > Yamada <yamada.masahiro@socionext.com>; Alexey Kardashevskiy
> > > > > <aik@ozlabs.ru>; linux-kernel@vger.kernel.org; linuxppc-
> > > > > dev@lists.ozlabs.org; linux-nvdimm@lists.01.org; linux-mm@kvack=
.org
> > > > > Subject: Re: [PATCH v3 04/27] ocxl: Remove unnecessary externs
> > > > >=20
> > > > > On 02/21/20 at 02:26pm, Alastair D'Silva wrote:
> > > > > > From: Alastair D'Silva <alastair@d-silva.org>
> > > > > >
> > > > > > Function declarations don't need externs, remove the existing=
 ones so
> > > > > > they are consistent with newer code
> > > > > >
> > > > > > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > > > > > ---
> > > > > >  arch/powerpc/include/asm/pnv-ocxl.h | 32 ++++++++++++++-----=
----------
> > > > > >  include/misc/ocxl.h                 |  6 +++---
> > > > > >  2 files changed, 18 insertions(+), 20 deletions(-)
> > > > > >
> > > > > > diff --git a/arch/powerpc/include/asm/pnv-ocxl.h
> > > > > > b/arch/powerpc/include/asm/pnv-ocxl.h
> > > > > > index 0b2a6707e555..b23c99bc0c84 100644
> > > > > > --- a/arch/powerpc/include/asm/pnv-ocxl.h
> > > > > > +++ b/arch/powerpc/include/asm/pnv-ocxl.h
> > > > > > @@ -9,29 +9,27 @@
> > > > > >  #define PNV_OCXL_TL_BITS_PER_RATE       4
> > > > > >  #define PNV_OCXL_TL_RATE_BUF_SIZE
> > > > > ((PNV_OCXL_TL_MAX_TEMPLATE+1) * PNV_OCXL_TL_BITS_PER_RATE / 8)
> > > > > >
> > > > > > -extern int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base=
, u16
> > > > > *enabled,
> > > > > > -			u16 *supported);
> > > > >=20
> > > > > It works w or w/o extern when declare functions. Searching 'ext=
ern'
> > > > > under include can find so many functions with 'extern' adding. =
Do we have
> > > > a
> > > > > explicit standard if we should add or remove 'exter' in functio=
n
> > > > declaration?
> > > > >=20
> > > > > I have no objection to this patch, just want to make clear so t=
hat I can
> > > > handle
> > > > > it w/o confusion.
> > > > >=20
> > > > > Thanks
> > > > > Baoquan
> > > > >=20
> > > >=20
> > > > For the OpenCAPI driver, we have settled on not having 'extern' o=
n
> > > > functions.
> > > >=20
> > > > I don't think I've seen a standard that supports or refutes this,=
 but it
> > > > does not value add.
> > > >=20
> > >=20
> > > FWIW this is a warning condition for checkpatch:
> > >=20
> > > $ ./scripts/checkpatch.pl --strict -f include/misc/ocxl.h
> >=20
> > Good to know, thanks.
> >=20
> > I didn't know checkpatch.pl can run on header file directly. Tried to
> > check patch with '--strict -f', the below info doesn't appear. But it
>=20
> Hmm... -f is to check a source file, not a patch... What did you try
> exactly ?

OK, that's it. I can see the 'CHECK' line when run checkpatch.pl on
patch with '--strict' only. I think this can be a good reason that we
should not add extern when add function declaration into header file.
Thanks.

>=20
> > does give out below information when run on header file.
> >=20
> > >=20
> > > [...]
> > >=20
> > > CHECK: extern prototypes should be avoided in .h files
> > > #176: FILE: include/misc/ocxl.h:176:
> > > +extern int ocxl_afu_irq_alloc(struct ocxl_context *ctx, int *irq_i=
d);
> > >=20
> > > [...]
> > >=20
> >=20
>=20
>=20

