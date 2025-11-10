Return-Path: <linuxppc-dev+bounces-14014-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D298C48329
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 18:05:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4wzQ0JcHz2xqj;
	Tue, 11 Nov 2025 04:05:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762794353;
	cv=none; b=YVfNFdsjkdRUuEofkS+NRdUPN0rADQB/0BlEprzzHCtrm9nl0Jkyq0EdRYgzJhorc1APB9Gb8CVRaRHvK94htNCc7ax49r0nr9YYgZulMi3UwENAJmiL6c5cO24LH5ZXQOPxp3VuMhkwWDqmaTpmRJ2uTq9t6mzsCr9lJNVPj/jUKRh99bgnd3P6UlDxT+TrpXAlyjzg5VFLJxrM5NfAnTiGHN2wszlWFHPsJqPUyB+Nv8BLeYF6/AazmQfE28WDVg/6Ro0RmDB4YAqKiz9NEg+nCV4ByGlKhlVujeHBH85oOR9MZKgyXBEbwbzzNVlXj5mnc0KOyARG+v9Mpgy/FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762794353; c=relaxed/relaxed;
	bh=M7RTCN3E1rw8VyD2+goNlALXoVUbG92BBZ2OFZBn/60=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LtmlxBJsapEux37c3TO3bQqjbZDRIZHLFhvw9HFDRSmZ7cvfMeQv5wF/cV9ZE8xomnSv26bY29X43ucYMmtWAKo3lxVKqMEtlPJT+5m5HEuig4qpty2oKgIZEnpPrTddnACLGwnqeh8ujy3z57522sliNpFnezZ/DpXBnwsYfILbHaXxz/Hh1HG8xOyb7InVqOv1C5xHOLiUUMfTKdwqukCU4vZ7kD2XSxkM2YNR6cPz8aipyIPWPaxM9bDpLocqohZTdNLk6ozG2PR4hSFzLylyCwQLenDqarDJU6ojG9PNm6iG4Buzk0NxIKZGjYhYDKDcNK+BcYN/edD+9s89iA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JEWe/ONd; dkim-atps=neutral; spf=pass (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JEWe/ONd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 11 Nov 2025 04:05:51 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4wzM1jc3z2xqL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 04:05:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762794351; x=1794330351;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=x5+SThPAsaS5nauv66UmWgNf8U64VnnnZxx9CiToBYY=;
  b=JEWe/ONdglKV7MX0L69CUl4Co23031UFg/j7oTR4WyyRBdjbxJROY9lg
   o20yS1gbGmNLH7P3IKPYPhuP4vs/x1eu/BKfK7c1iaACxQRmReSjGCSI1
   32bX2ie2QYUjsi1vbvuSjM6iWY7GgVzfL8iRVzwKTCOjkaA5yW93NuFiQ
   uJas6Map5JDeqRJTX/HxONZf0FSyaswM5uAq/uE9wy9pYhRg7v9t3c85c
   rjpjpbp8AI8Wh2tQ5NnL8jTqJnv1AOmUOkXR86y2CZRqzS2NYxEghxFz4
   z3iGGiI8CKaanpe4wqk7gbJNttc1taAxwEK0TbtUXXhDH4Fx4g1vdbMO1
   w==;
X-CSE-ConnectionGUID: PEVZUIWZSV6YBKmxReuqgw==
X-CSE-MsgGUID: hYUBzlPjTXKauTjzNF+qAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="67454267"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="67454267"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 09:04:44 -0800
X-CSE-ConnectionGUID: z3l6HQ1WR/+cp3bB1IV/lg==
X-CSE-MsgGUID: HKFgsgv8TZu/ht/cOhQStA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.13])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 09:04:37 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 10 Nov 2025 19:04:32 +0200 (EET)
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Andreas Larsson <andreas@gaisler.com>, Bjorn Helgaas <bhelgaas@google.com>, 
    "David S. Miller" <davem@davemloft.net>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-pci@vger.kernel.org, 
    sparclinux@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
    Yinghai Lu <yinghai@kernel.org>, Igor Mammedov <imammedo@redhat.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    LKML <linux-kernel@vger.kernel.org>, 
    =?ISO-8859-2?Q?Micha=B3_Winiarski?= <michal.winiarski@intel.com>, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 02/24] sparc/PCI: Remove pcibios_enable_device() as they
 do nothing extra
In-Reply-To: <8fcc0fd4b74f99d5c4d80d3907e7607a7d4c89da.camel@physik.fu-berlin.de>
Message-ID: <d221be13-f652-cc75-90d1-92cf38e0110e@linux.intel.com>
References: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>  <20250822145605.18172-3-ilpo.jarvinen@linux.intel.com> <8fcc0fd4b74f99d5c4d80d3907e7607a7d4c89da.camel@physik.fu-berlin.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-784219086-1762794272=:1060"
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-784219086-1762794272=:1060
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 6 Nov 2025, John Paul Adrian Glaubitz wrote:

> Hello Ilpo,
>=20
> On Fri, 2025-08-22 at 17:55 +0300, Ilpo J=C3=A4rvinen wrote:
> > Under arch/sparc/ there are multiple copies of pcibios_enable_device()
> > but none of those seem to do anything extra beyond what
> > pci_enable_resources() is supposed to do. These functions could lead to
> > inconsistencies in behavior, especially now as pci_enable_resources()
> > and the bridge window resource flags behavior are going to be altered
> > by upcoming changes.
> >=20
> > Remove all pcibios_enable_device() from arch/sparc/ so that PCI core
> > can simply call into pci_enable_resources() instead using it's __weak
> > version of pcibios_enable_device().
> >=20
> > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> >  arch/sparc/kernel/leon_pci.c | 27 ---------------------------
> >  arch/sparc/kernel/pci.c      | 27 ---------------------------
> >  arch/sparc/kernel/pcic.c     | 27 ---------------------------
> >  3 files changed, 81 deletions(-)
> >=20
> > diff --git a/arch/sparc/kernel/leon_pci.c b/arch/sparc/kernel/leon_pci.=
c
> > index 8de6646e9ce8..10934dfa987a 100644
> > --- a/arch/sparc/kernel/leon_pci.c
> > +++ b/arch/sparc/kernel/leon_pci.c
> > @@ -60,30 +60,3 @@ void leon_pci_init(struct platform_device *ofdev, st=
ruct leon_pci_info *info)
> >  =09pci_assign_unassigned_resources();
> >  =09pci_bus_add_devices(root_bus);
> >  }
> > -
> > -int pcibios_enable_device(struct pci_dev *dev, int mask)
> > -{
> > -=09struct resource *res;
> > -=09u16 cmd, oldcmd;
> > -=09int i;
> > -
> > -=09pci_read_config_word(dev, PCI_COMMAND, &cmd);
> > -=09oldcmd =3D cmd;
> > -
> > -=09pci_dev_for_each_resource(dev, res, i) {
> > -=09=09/* Only set up the requested stuff */
> > -=09=09if (!(mask & (1<<i)))
> > -=09=09=09continue;
> > -
> > -=09=09if (res->flags & IORESOURCE_IO)
> > -=09=09=09cmd |=3D PCI_COMMAND_IO;
> > -=09=09if (res->flags & IORESOURCE_MEM)
> > -=09=09=09cmd |=3D PCI_COMMAND_MEMORY;
> > -=09}
> > -
> > -=09if (cmd !=3D oldcmd) {
> > -=09=09pci_info(dev, "enabling device (%04x -> %04x)\n", oldcmd, cmd);
> > -=09=09pci_write_config_word(dev, PCI_COMMAND, cmd);
> > -=09}
> > -=09return 0;
> > -}
> > diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
> > index ddac216a2aff..a9448088e762 100644
> > --- a/arch/sparc/kernel/pci.c
> > +++ b/arch/sparc/kernel/pci.c
> > @@ -722,33 +722,6 @@ struct pci_bus *pci_scan_one_pbm(struct pci_pbm_in=
fo *pbm,
> >  =09return bus;
> >  }
> > =20
> > -int pcibios_enable_device(struct pci_dev *dev, int mask)
> > -{
> > -=09struct resource *res;
> > -=09u16 cmd, oldcmd;
> > -=09int i;
> > -
> > -=09pci_read_config_word(dev, PCI_COMMAND, &cmd);
> > -=09oldcmd =3D cmd;
> > -
> > -=09pci_dev_for_each_resource(dev, res, i) {
> > -=09=09/* Only set up the requested stuff */
> > -=09=09if (!(mask & (1<<i)))
> > -=09=09=09continue;
> > -
> > -=09=09if (res->flags & IORESOURCE_IO)
> > -=09=09=09cmd |=3D PCI_COMMAND_IO;
> > -=09=09if (res->flags & IORESOURCE_MEM)
> > -=09=09=09cmd |=3D PCI_COMMAND_MEMORY;
> > -=09}
> > -
> > -=09if (cmd !=3D oldcmd) {
> > -=09=09pci_info(dev, "enabling device (%04x -> %04x)\n", oldcmd, cmd);
> > -=09=09pci_write_config_word(dev, PCI_COMMAND, cmd);
> > -=09}
> > -=09return 0;
> > -}
> > -
> >  /* Platform support for /proc/bus/pci/X/Y mmap()s. */
> >  int pci_iobar_pfn(struct pci_dev *pdev, int bar, struct vm_area_struct=
 *vma)
> >  {
> > diff --git a/arch/sparc/kernel/pcic.c b/arch/sparc/kernel/pcic.c
> > index 25fe0a061732..3d54ad5656a4 100644
> > --- a/arch/sparc/kernel/pcic.c
> > +++ b/arch/sparc/kernel/pcic.c
> > @@ -641,33 +641,6 @@ void pcibios_fixup_bus(struct pci_bus *bus)
> >  =09}
> >  }
> > =20
> > -int pcibios_enable_device(struct pci_dev *dev, int mask)
> > -{
> > -=09struct resource *res;
> > -=09u16 cmd, oldcmd;
> > -=09int i;
> > -
> > -=09pci_read_config_word(dev, PCI_COMMAND, &cmd);
> > -=09oldcmd =3D cmd;
> > -
> > -=09pci_dev_for_each_resource(dev, res, i) {
> > -=09=09/* Only set up the requested stuff */
> > -=09=09if (!(mask & (1<<i)))
> > -=09=09=09continue;
> > -
> > -=09=09if (res->flags & IORESOURCE_IO)
> > -=09=09=09cmd |=3D PCI_COMMAND_IO;
> > -=09=09if (res->flags & IORESOURCE_MEM)
> > -=09=09=09cmd |=3D PCI_COMMAND_MEMORY;
> > -=09}
> > -
> > -=09if (cmd !=3D oldcmd) {
> > -=09=09pci_info(dev, "enabling device (%04x -> %04x)\n", oldcmd, cmd);
> > -=09=09pci_write_config_word(dev, PCI_COMMAND, cmd);
> > -=09}
> > -=09return 0;
> > -}
> > -
> >  /* Makes compiler happy */
> >  static volatile int pcic_timer_dummy;
>=20
> This change actually broke driver initialization on SPARC, see:
>=20
> https://github.com/sparclinux/issues/issues/22

Does the attached patch help?

--
 i.
--8323328-784219086-1762794272=:1060
Content-Type: text/x-diff; name=sparc-pref.patch
Content-Transfer-Encoding: BASE64
Content-ID: <d5e9a1c0-3012-20f8-19e5-901e9bf48c88@linux.intel.com>
Content-Description: 
Content-Disposition: attachment; filename=sparc-pref.patch

RnJvbTogSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50
ZWwuY29tPg0KU3ViamVjdDogW1BBVENIXSBTUEFSQy9QQ0k6IENvcnJlY3Qg
NjQtYml0IG5vbi1wcmVmIC0+IHByZWYNCg0KU2lnbmVkLW9mZi1ieTogSWxw
byBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPg0K
DQotLS0NCiBhcmNoL3NwYXJjL2tlcm5lbC9vZl9kZXZpY2VfNjQuYyB8IDE4
ICsrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNl
cnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9hcmNoL3NwYXJjL2tlcm5lbC9v
Zl9kZXZpY2VfNjQuYyBiL2FyY2gvc3BhcmMva2VybmVsL29mX2RldmljZV82
NC5jDQppbmRleCBmNTMwOTJiMDdiOWUuLmVhMjFkOTBlM2Y5NCAxMDA2NDQN
Ci0tLSBhL2FyY2gvc3BhcmMva2VybmVsL29mX2RldmljZV82NC5jDQorKysg
Yi9hcmNoL3NwYXJjL2tlcm5lbC9vZl9kZXZpY2VfNjQuYw0KQEAgLTMxMSw2
ICszMTEsMjMgQEAgc3RhdGljIGludCBfX2luaXQgdXNlXzF0bzFfbWFwcGlu
ZyhzdHJ1Y3QgZGV2aWNlX25vZGUgKnBwKQ0KIAlyZXR1cm4gMTsNCiB9DQog
DQorc3RhdGljIHZvaWQgb2ZfZml4dXBfcGNpX3ByZWYoc3RydWN0IGRldmlj
ZV9ub2RlICpkcCwgaW50IGluZGV4LA0KKwkJCSAgICAgIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqcHAsIHN0cnVjdCByZXNvdXJjZSAqcmVzKQ0KK3sNCisJaWYg
KCFyZXNvdXJjZV9zaXplKHJlcykpDQorCQlyZXR1cm47DQorCWlmIChyZXMt
PmVuZCA8PSB+KCh1MzIpMCkpDQorCQlyZXR1cm47DQorDQorCWlmICghb2Zf
bm9kZV9pc190eXBlKHBwLCAicGNpIikgJiYgIW9mX25vZGVfaXNfdHlwZShw
cCwgInBjaWV4IikpDQorCQlyZXR1cm47DQorDQorCWlmICghKHJlcy0+Zmxh
Z3MgJiBJT1JFU09VUkNFX1BSRUZFVENIKSkgew0KKwkJcmVzLT5mbGFncyB8
PSBJT1JFU09VUkNFX1BSRUZFVENIOw0KKwkJcHJpbnRrKCIlcE9GIHJlZ1sl
ZF0gZml4dXA6IHByZWYgY29ycmVjdGVkXG4iLCBkcCwgaW5kZXgpOw0KKwl9
DQorfQ0KKw0KIHN0YXRpYyBpbnQgb2ZfcmVzb3VyY2VfdmVyYm9zZTsNCiAN
CiBzdGF0aWMgdm9pZCBfX2luaXQgYnVpbGRfZGV2aWNlX3Jlc291cmNlcyhz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpvcCwNCkBAIC00MTIsNiArNDI5LDcg
QEAgc3RhdGljIHZvaWQgX19pbml0IGJ1aWxkX2RldmljZV9yZXNvdXJjZXMo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqb3AsDQogCQkJci0+c3RhcnQgPSBy
ZXN1bHQ7DQogCQkJci0+ZW5kID0gcmVzdWx0ICsgc2l6ZSAtIDE7DQogCQkJ
ci0+ZmxhZ3MgPSBmbGFnczsNCisJCQlvZl9maXh1cF9wY2lfcHJlZihkcCwg
aW5kZXgsIHBwLCByKTsNCiAJCX0NCiAJCXItPm5hbWUgPSBvcC0+ZGV2Lm9m
X25vZGUtPmZ1bGxfbmFtZTsNCiAJfQ0KDQotLSANCnRnOiAoM2E4NjYwODc4
ODM5Li4pIHNwYXJjL2R0LWZpeHVwLXByZWYgKGRlcGVuZHMgb246IG1haW4p
DQo=

--8323328-784219086-1762794272=:1060--

