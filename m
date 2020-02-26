Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D5916F9A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 09:34:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S8HD65B4zDqn5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 19:34:32 +1100 (AEDT)
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
 header.s=201810a header.b=DPOwD4us; dkim-atps=neutral
X-Greylist: delayed 354 seconds by postgrey-1.36 at bilbo;
 Wed, 26 Feb 2020 19:32:48 AEDT
Received: from ushosting.nmnhosting.com (ushosting.nmnhosting.com
 [66.55.73.32])
 by lists.ozlabs.org (Postfix) with ESMTP id 48S8FD41CXzDqkR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 19:32:48 +1100 (AEDT)
Received: from mail2.nmnhosting.com (unknown [202.169.106.97])
 by ushosting.nmnhosting.com (Postfix) with ESMTPS id 014E52DC00E4;
 Wed, 26 Feb 2020 19:26:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-silva.org;
 s=201810a; t=1582705607;
 bh=80fBdwbzVEqAw+uYKkj4SQtkzUXen9bXvqaTYfSOk4E=;
 h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
 b=DPOwD4usPhiADwX4LI+zMnTd9uY8z9YYAZjTUDt4Pk1kBy0kYipEm2MbZ9x7pzd+S
 vKSVZd0g/6FbaM+mhA4ND9DXwPuLJQOARTy2MgpzzpNIoce5F2z1PoFzI9/G5x3T8a
 +cZZj3w+7uGbzs4eIOF7ISrc08Rs4+FdNOMQFVZUnjpvI5QS76UdyK7gUXCjtGZNct
 JI4Ew83JuGXQhdPeuFD3lFR68o0jsejd3QQzICIhfG/wItMM7jzvfe64YF0LQi+9Q/
 1DsKVAmOjw4iRnSL0MdsYAsvSPDCocIH8jz3iK1EBWBLA7j8XvrWkT66tjMbsrHFHc
 0zpVeFUiQSU/Upu5EWV9o/y34hId+fdsj0eS1lkWMfpm//es540N4o0XAUEE6rsWUO
 vs4C2osTrvq2wEP8HzoapDqWJ6GslVFq4JcPH5HbSaifCbji1tF5h+hIbJUcPeeLAJ
 6RpKY35T0y6KvgJkI3rVmWaZB5pYdQgCf/mvlc5YorK/OB1ATWO3r8fupn8GowdeuJ
 /pjGI7Hxv+CFYFUA7MyhU9j4LYYbx7H4qd+LvSY8zWvGHqW6AIT8Zrw64dsqAjpFxq
 G6HSY4vre1yuYynt+TqqVL9ZYyNyoX8loNaMKbnRQUjSOnte3r+TBEp4dEZAC4seWF
 8ckmiALC5R6ZSO8+PgWwl8io=
Received: from Hawking (ntp.lan [10.0.1.1]) (authenticated bits=0)
 by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id 01Q8QXFx062720
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 26 Feb 2020 19:26:34 +1100 (AEDT)
 (envelope-from alastair@d-silva.org)
From: "Alastair D'Silva" <alastair@d-silva.org>
To: "'Baoquan He'" <bhe@redhat.com>,
 "'Alastair D'Silva'" <alastair@au1.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-5-alastair@au1.ibm.com>
 <20200226081447.GH4937@MiWiFi-R3L-srv>
In-Reply-To: <20200226081447.GH4937@MiWiFi-R3L-srv>
Subject: RE: [PATCH v3 04/27] ocxl: Remove unnecessary externs
Date: Wed, 26 Feb 2020 19:26:34 +1100
Message-ID: <4d49801d5ec7e$7a3e8610$6ebb9230$@d-silva.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFvwBELB7thA+Ae3jvxFm54+bhaEQJqYraXAhSTffeo1YSXcA==
Content-Language: en-au
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail2.nmnhosting.com [10.0.1.20]); Wed, 26 Feb 2020 19:26:42 +1100 (AEDT)
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
 'Ira Weiny' <ira.weiny@intel.com>, 'Thomas Gleixner' <tglx@linutronix.de>,
 'Rob Herring' <robh@kernel.org>, 'Dave Jiang' <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "'Aneesh Kumar K . V'" <aneesh.kumar@linux.ibm.com>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 'Anju T Sudhakar' <anju@linux.vnet.ibm.com>,
 'Mahesh Salgaonkar' <mahesh@linux.vnet.ibm.com>,
 'Andrew Donnellan' <ajd@linux.ibm.com>, 'Arnd Bergmann' <arnd@arndb.de>,
 'Greg Kurz' <groug@kaod.org>, 'Nicholas Piggin' <npiggin@gmail.com>,
 =?iso-8859-1?Q?'C=E9dric_Le_Goater'?= <clg@kaod.org>,
 'Dan Williams' <dan.j.williams@intel.com>,
 'Hari Bathini' <hbathini@linux.ibm.com>, linux-mm@kvack.org,
 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, 'Vishal Verma' <vishal.l.verma@intel.com>,
 'Frederic Barrat' <fbarrat@linux.ibm.com>, 'Paul Mackerras' <paulus@samba.org>,
 'Andrew Morton' <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "'David S. Miller'" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Baoquan He <bhe@redhat.com>
> Sent: Wednesday, 26 February 2020 7:15 PM
> To: Alastair D'Silva <alastair@au1.ibm.com>
> Cc: alastair@d-silva.org; Aneesh Kumar K . V
> <aneesh.kumar@linux.ibm.com>; Oliver O'Halloran <oohall@gmail.com>;
> Benjamin Herrenschmidt <benh@kernel.crashing.org>; Paul Mackerras
> <paulus@samba.org>; Michael Ellerman <mpe@ellerman.id.au>; Frederic
> Barrat <fbarrat@linux.ibm.com>; Andrew Donnellan <ajd@linux.ibm.com>;
> Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Dan Williams <dan.j.williams@intel.com>;
> Vishal Verma <vishal.l.verma@intel.com>; Dave Jiang
> <dave.jiang@intel.com>; Ira Weiny <ira.weiny@intel.com>; Andrew Morton
> <akpm@linux-foundation.org>; Mauro Carvalho Chehab
> <mchehab+samsung@kernel.org>; David S. Miller <davem@davemloft.net>;
> Rob Herring <robh@kernel.org>; Anton Blanchard <anton@ozlabs.org>;
> Krzysztof Kozlowski <krzk@kernel.org>; Mahesh Salgaonkar
> <mahesh@linux.vnet.ibm.com>; Madhavan Srinivasan
> <maddy@linux.vnet.ibm.com>; C=E9dric Le Goater <clg@kaod.org>; Anju T
> Sudhakar <anju@linux.vnet.ibm.com>; Hari Bathini
> <hbathini@linux.ibm.com>; Thomas Gleixner <tglx@linutronix.de>; Greg
> Kurz <groug@kaod.org>; Nicholas Piggin <npiggin@gmail.com>; Masahiro
> Yamada <yamada.masahiro@socionext.com>; Alexey Kardashevskiy
> <aik@ozlabs.ru>; linux-kernel@vger.kernel.org; linuxppc-
> dev@lists.ozlabs.org; linux-nvdimm@lists.01.org; linux-mm@kvack.org
> Subject: Re: [PATCH v3 04/27] ocxl: Remove unnecessary externs
>=20
> On 02/21/20 at 02:26pm, Alastair D'Silva wrote:
> > From: Alastair D'Silva <alastair@d-silva.org>
> >
> > Function declarations don't need externs, remove the existing ones =
so
> > they are consistent with newer code
> >
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
> >  arch/powerpc/include/asm/pnv-ocxl.h | 32 =
++++++++++++++---------------
> >  include/misc/ocxl.h                 |  6 +++---
> >  2 files changed, 18 insertions(+), 20 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/pnv-ocxl.h
> > b/arch/powerpc/include/asm/pnv-ocxl.h
> > index 0b2a6707e555..b23c99bc0c84 100644
> > --- a/arch/powerpc/include/asm/pnv-ocxl.h
> > +++ b/arch/powerpc/include/asm/pnv-ocxl.h
> > @@ -9,29 +9,27 @@
> >  #define PNV_OCXL_TL_BITS_PER_RATE       4
> >  #define PNV_OCXL_TL_RATE_BUF_SIZE
> ((PNV_OCXL_TL_MAX_TEMPLATE+1) * PNV_OCXL_TL_BITS_PER_RATE / 8)
> >
> > -extern int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16
> *enabled,
> > -			u16 *supported);
>=20
> It works w or w/o extern when declare functions. Searching 'extern'
> under include can find so many functions with 'extern' adding. Do we =
have
a
> explicit standard if we should add or remove 'exter' in function
declaration?
>=20
> I have no objection to this patch, just want to make clear so that I =
can
handle
> it w/o confusion.
>=20
> Thanks
> Baoquan
>=20

For the OpenCAPI driver, we have settled on not having 'extern' on
functions.

I don't think I've seen a standard that supports or refutes this, but it
does not value add.

--=20
Alastair D'Silva           mob: 0423 762 819
skype: alastair_dsilva     msn: alastair@d-silva.org
blog: http://alastair.d-silva.org    Twitter: @EvilDeece




