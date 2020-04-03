Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B21AD19CEF9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 05:54:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tmKK2fvvzDqjH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 14:54:45 +1100 (AEDT)
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
 header.s=201810a header.b=Up9Nr+Gr; dkim-atps=neutral
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48tmH62X2ZzDqKw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 14:52:50 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id EB1792DC3D2F;
 Fri,  3 Apr 2020 14:52:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1585885969;
 bh=/qbrUZJLw49Px53fHH61XOP2eWqn8wkHBEx+KDSvrvU=;
 h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
 b=Up9Nr+GrEKkMUmYftzGW5Z/K773hVH2gCzSh13cEdpBqugKJMdGjipoexqX61BLky
 ayKBdVIkDJ3AWvztbbnCAMuWghuRpEFqwjwO7ZCBySBD1og/S2moYgXWRLdsSxX+/a
 KJgQMUpBu1dvVGv3RzD7CKJW6Ql/YjGtVRIEdQhmeVNyq1ucOVrbsqPcxHsZ+5jnri
 Uv3gZ/TiZUFYse5Ms95Z1Isf9lqt5FiL5KglNeH/kJ9Lgfiemfl0uqNeXdpg5ODP5o
 u6tP8fDctVbvByp+bOWemuDuloxT4MdnLoEHoVlKW+W9vSHWIHNQXZ20e1h7GgTyf7
 Up1xIESuRDLpJxy9TskeAI2MQyLG89eASMl4ymxz8xf3P8kJzlpEdTImYRU3qypGCP
 vghn0zggG+R2Y8UxG2Kx7ibgXj6dwDdOJWPptZ0Sk1ktQRdv5asJnawbE1/uJnBT9/
 m5GTdMJ5I51IJ95FMhLNN61RTqmrzxxb+realllSuHBu5Bjn+Nc1OCOOHGq7OPg5Vf
 O1E57PRzyRKY5TIWerTom3GmJfKugyUp+sax+i4x7dqJt/gevtV73WHliEnb/jCfAa
 VXnRR+uAepbur0PMxUSeNhrd8VYWuGsIiSzvW4k9HoPd6oeU1HKABrDdyxr7r8tDrB
 qLLBCAUjvg7BTg/sH/3ifbfg=
Received: from Hawking (ntp.lan [10.0.1.1]) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id 0333qhBP097301
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 3 Apr 2020 14:52:43 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: "'Dan Williams'" <dan.j.williams@intel.com>
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-9-alastair@d-silva.org>
 <CAPcyv4j4_owxEVjanwH5TiuMMJB3CaMannDzpXnaHedX7LuarQ@mail.gmail.com>
In-Reply-To: <CAPcyv4j4_owxEVjanwH5TiuMMJB3CaMannDzpXnaHedX7LuarQ@mail.gmail.com>
Subject: RE: [PATCH v4 08/25] ocxl: Emit a log message showing how much LPC
 memory was detected
Date: Fri, 3 Apr 2020 14:52:42 +1100
Message-ID: <303c01d6096b$541f33d0$fc5d9b70$@d-silva.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-au
Thread-Index: AQJ5L4Hn/mp5p0p1jYAFWLJ+xmWSbgKkO1ZLATOc+DmnAbiIwA==
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Fri, 03 Apr 2020 14:52:44 +1100 (AEDT)
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
> Subject: Re: [PATCH v4 08/25] ocxl: Emit a log message showing how =
much
> LPC memory was detected
>=20
> On Sun, Mar 29, 2020 at 10:23 PM Alastair D'Silva =
<alastair@d-silva.org>
> wrote:
> >
> > This patch emits a message showing how much LPC memory & special
> > purpose memory was detected on an OCXL device.
> >
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
> > Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
> > ---
> >  drivers/misc/ocxl/config.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
> > index a62e3d7db2bf..69cca341d446 100644
> > --- a/drivers/misc/ocxl/config.c
> > +++ b/drivers/misc/ocxl/config.c
> > @@ -568,6 +568,10 @@ static int read_afu_lpc_memory_info(struct
> pci_dev *dev,
> >                 afu->special_purpose_mem_size =3D
> >                         total_mem_size - lpc_mem_size;
> >         }
> > +
> > +       dev_info(&dev->dev, "Probed LPC memory of %#llx bytes and =
special
> purpose memory of %#llx bytes\n",
> > +                afu->lpc_mem_size, afu->special_purpose_mem_size);
>=20
> A patch for a single log message is too fine grained for my taste, =
let's squash
> this into another patch in the series.
>=20

I'm not sure there's a great place for it. At a pinch, it could with the =
previous patch, but they are really different layers.

> > +
> >         return 0;
> >  }
> >
> > --
> > 2.24.1
> >
>=20
>=20
> --
> This email has been checked for viruses by AVG.
> https://www.avg.com


